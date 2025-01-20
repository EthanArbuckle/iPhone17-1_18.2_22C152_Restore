void sub_214A2DC80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t IsEVRoutingSupported()
{
  if (!GEOConfigGetBOOL()) {
    return 1;
  }
  v0 = [MEMORY[0x263F41770] sharedConfiguration];
  uint64_t v1 = [v0 currentCountrySupportsElectricVehicleRouting];

  return v1;
}

void sub_214A2E230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id VGGetExternalAccessoryLog()
{
  if (VGGetExternalAccessoryLog_onceToken != -1) {
    dispatch_once(&VGGetExternalAccessoryLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)VGGetExternalAccessoryLog_log;

  return v0;
}

void sub_214A2F698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A2F740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSObject *VGAllowlistPayload()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v0 = GEOConfigGetString();
  uint64_t v1 = [MEMORY[0x263F41BC0] sharedManager];
  v2 = [v1 dataForResourceWithName:v0 fallbackBundle:0];

  if (!v2)
  {
    v7 = [MEMORY[0x263F41B40] sharedNetworkObserver];
    int v8 = [v7 isNetworkReachable];

    v9 = VGGetVirtualGarageLog();
    v4 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v0;
        v10 = "data is nil. Error parsing manifest resource: %@ while network was reachable.";
        v11 = v4;
        os_log_type_t v12 = OS_LOG_TYPE_FAULT;
LABEL_12:
        _os_log_impl(&dword_214A2C000, v11, v12, v10, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v0;
      v10 = "data is nil. Error parsing manifest resource: %@ because network was not reachable.";
      v11 = v4;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
    v13 = 0;
    goto LABEL_19;
  }
  id v15 = 0;
  v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v15];
  v4 = v15;
  if (v4)
  {
    v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      v6 = "Error parsing manifest resource. error: %@";
LABEL_16:
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      v6 = "Unexpected class type for allowlist payload: %@";
      goto LABEL_16;
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  v13 = v3;
LABEL_18:

LABEL_19:

  return v13;
}

id VGGetOEMApplicationLog()
{
  if (VGGetOEMApplicationLog_onceToken != -1) {
    dispatch_once(&VGGetOEMApplicationLog_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)VGGetOEMApplicationLog_log;

  return v0;
}

void sub_214A309B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214A31380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_214A31C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214A31F40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id VGGetPersistingLog()
{
  if (VGGetPersistingLog_onceToken != -1) {
    dispatch_once(&VGGetPersistingLog_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)VGGetPersistingLog_log;

  return v0;
}

void sub_214A3228C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A32584(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A32DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  _Block_object_dispose((const void *)(v18 - 240), 8);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_214A3301C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A33408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_214A33678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A33894(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_214A33C9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id VGGetVirtualGarageLog()
{
  if (VGGetVirtualGarageLog_onceToken != -1) {
    dispatch_once(&VGGetVirtualGarageLog_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)VGGetVirtualGarageLog_log;

  return v0;
}

id VGGetDataCoordinatorLog()
{
  if (VGGetDataCoordinatorLog_onceToken != -1) {
    dispatch_once(&VGGetDataCoordinatorLog_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)VGGetDataCoordinatorLog_log;

  return v0;
}

uint64_t __VGGetVirtualGarageLog_block_invoke()
{
  VGGetVirtualGarageLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "VirtualGarage");

  return MEMORY[0x270F9A758]();
}

uint64_t VGChargingNetworkStorageReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t IsVirtualGarageEnabled()
{
  int IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  return IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
}

uint64_t IsEVRoutingAllowListingEnabled()
{
  return GEOConfigGetBOOL();
}

void startHostingVirtualGarageServiceWithPersister(void *a1)
{
  id v1 = a1;
  id v2 = +[VGVirtualGarageServer sharedServer];
  [v2 startWithPersister:v1];
}

void stopHostingVirtualGarageService()
{
  id v0 = +[VGVirtualGarageServer sharedServer];
  [v0 stop];
}

__CFString *VGProcessNameForPID(int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, 512);
  size_t v4 = 648;
  *(void *)v5 = 0xE00000001;
  int v6 = 1;
  int v7 = a1;
  int v1 = sysctl(v5, 4u, v8, &v4, 0, 0);
  id v2 = 0;
  if (!v1) {
    id v2 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)&v8[15] + 3, 0x8000100u);
  }

  return v2;
}

uint64_t GEOEvChargingConnectorTypeFromVGConnectorType(uint64_t a1)
{
  if (a1 > 31)
  {
    if (a1 == 256) {
      int v3 = 9;
    }
    else {
      int v3 = 0;
    }
    if (a1 == 128) {
      unsigned int v4 = 8;
    }
    else {
      unsigned int v4 = v3;
    }
    if (a1 == 64) {
      int v5 = 10;
    }
    else {
      int v5 = 0;
    }
    if (a1 == 32) {
      unsigned int v6 = 7;
    }
    else {
      unsigned int v6 = v5;
    }
    if (a1 <= 127) {
      return v6;
    }
    else {
      return v4;
    }
  }
  else
  {
    uint64_t v1 = a1 - 1;
    uint64_t result = 0;
    switch(v1)
    {
      case 0:
        uint64_t result = 2;
        break;
      case 1:
        uint64_t result = 4;
        break;
      case 2:
      case 4:
      case 5:
      case 6:
        return result;
      case 3:
        uint64_t result = 5;
        break;
      case 7:
        uint64_t result = 1;
        break;
      default:
        uint64_t result = 0;
        break;
    }
  }
  return result;
}

uint64_t VGVehiclesHaveMatchingVehicleStateProviders(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 iapIdentifier];
  if (!v5) {
    goto LABEL_4;
  }
  unsigned int v6 = (void *)v5;
  int v7 = [v4 iapIdentifier];
  char v8 = [v3 iapIdentifier];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = 1;
  }
  else
  {
LABEL_4:
    uint64_t v11 = [v3 siriIntentsIdentifier];
    if (v11)
    {
      unint64_t v12 = [v4 siriIntentsIdentifier];
      char v13 = [v3 siriIntentsIdentifier];
      uint64_t v10 = [v12 isEqualToString:v13];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  return v10;
}

void sub_214A36B44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A36D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A379F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t VGVehicleStateStorageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 88;
          goto LABEL_68;
        case 2u:
          *(_WORD *)(a1 + 124) |= 8u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 32;
          goto LABEL_96;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(_WORD *)(a1 + 124) |= 0x100u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_72:
          uint64_t v57 = 96;
          goto LABEL_81;
        case 4u:
          *(_WORD *)(a1 + 124) |= 1u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 8;
          goto LABEL_96;
        case 5u:
          *(_WORD *)(a1 + 124) |= 4u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 24;
          goto LABEL_96;
        case 6u:
          *(_WORD *)(a1 + 124) |= 0x20u;
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 48;
          goto LABEL_96;
        case 7u:
          *(_WORD *)(a1 + 124) |= 0x40u;
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 56;
          goto LABEL_96;
        case 8u:
          *(_WORD *)(a1 + 124) |= 2u;
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 16;
          goto LABEL_96;
        case 9u:
          *(_WORD *)(a1 + 124) |= 0x10u;
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v58 = 40;
LABEL_96:
          *(void *)(a1 + v58) = v23;
          continue;
        case 0xAu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 80;
          goto LABEL_68;
        case 0xBu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 72;
          goto LABEL_68;
        case 0xCu:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(_WORD *)(a1 + 124) |= 0x200u;
          while (2)
          {
            uint64_t v46 = *v3;
            uint64_t v47 = *(void *)(a2 + v46);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                BOOL v15 = v44++ >= 9;
                if (v15)
                {
                  uint64_t v45 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v45 = 0;
          }
LABEL_76:
          *(unsigned char *)(a1 + 120) = v45 != 0;
          continue;
        case 0xDu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v26 = 0;
          *(_WORD *)(a1 + 124) |= 0x80u;
          break;
        case 0xEu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 112;
          goto LABEL_68;
        case 0xFu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 104;
LABEL_68:
          v56 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v52 = *v3;
        uint64_t v53 = *(void *)(a2 + v52);
        unint64_t v54 = v53 + 1;
        if (v53 == -1 || v54 > *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
        *(void *)(a2 + v52) = v54;
        v26 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_78;
        }
        v50 += 7;
        BOOL v15 = v51++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_80;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_80:
      uint64_t v57 = 64;
LABEL_81:
      *(_DWORD *)(a1 + v57) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
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

void sub_214A3B69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214A3DECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_214A408C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

CGColor *VGHexRepresentationFromCGColor(CGColor *a1)
{
  if (a1)
  {
    id v2 = a1;
    Components = CGColorGetComponents(a1);
    if (CGColorGetNumberOfComponents(v2) && CGColorGetNumberOfComponents(v2) <= 3)
    {
      id v4 = VGGetUIHelperLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "Color does not have 4 components", buf, 2u);
      }

      ColorSpace = CGColorGetColorSpace(v2);
      if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
      {
        unsigned int v6 = VGGetUIHelperLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unsigned int v9 = 0;
          _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "Color is not in RGB colorspace", v9, 2u);
        }
      }
      unint64_t v8 = llround(*Components * 255.0);
      objc_msgSend(NSString, "stringWithFormat:", @"%02lX%02lX%02lX%02lX", v8, v8, v8, llround(255.0));
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02lX%02lX%02lX%02lX", llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0), llround(Components[3] * 255.0));
    }
    a1 = (CGColor *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_214A43288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

NSObject *VGDictionaryFromVGVehicleArguments(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 dataUsingEncoding:4];
  if (v2)
  {
    id v18 = 0;
    id v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v18];
    id v4 = v18;
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      unsigned int v6 = VGGetPersistingLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v1;
        __int16 v22 = 2112;
        uint64_t v23 = v4;
        __int16 v24 = 2112;
        unsigned int v25 = v3;
        _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_FAULT, "Failed to recreate a dictionary from serialized arguments: %@, with error: %@, dictionary: dictionary: %@", buf, 0x20u);
      }
LABEL_24:

      uint64_t v11 = 0;
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      unsigned int v6 = [v3 allKeys];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v12 = VGGetPersistingLog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v21 = v1;
                __int16 v22 = 2112;
                uint64_t v23 = v3;
                _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_FAULT, "Failed to recreate a dictionary from serialized arguments (wrong keys): %@, dictioanary: %@", buf, 0x16u);
              }

              goto LABEL_24;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      uint64_t v11 = v3;
    }
  }
  else
  {
    id v4 = VGGetPersistingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v1;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_FAULT, "Failed to recreate data from serialized arguments: %@", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

id VGMap(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i), v9 + i);
          if (v12) {
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v9 += i;
      }
      while (v8);
    }

    unint64_t v13 = (void *)[v5 copy];
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

id VGFilter(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        char v15 = 0;
        if (v4[2](v4, v12, v9 + v11, &v15)) {
          [v5 addObject:v12];
        }
        if (v15) {
          break;
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          v9 += v11;
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unint64_t v13 = (void *)[v5 copy];
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

id VGChargingConnectorTypeOptionsList()
{
  if (qword_26AB30FA8 != -1) {
    dispatch_once(&qword_26AB30FA8, &__block_literal_global_3);
  }
  id v0 = (void *)_MergedGlobals_3;

  return v0;
}

void __VGChargingConnectorTypeOptionsList_block_invoke()
{
  id v0 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)&unk_26C5975C8;
}

id VGChargingConnectorTypeOptionsUnpacked(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = VGChargingConnectorTypeOptionsList();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "unsignedIntegerValue", (void)v10) & a1) != 0) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t VGChargingConnectorTypeOptionsPacked(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 |= [*(id *)(*((void *)&v8 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id NSStringFromVGChargingConnectorTypeOptions(uint64_t a1)
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x263EFF980] array];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __NSStringFromVGChargingConnectorTypeOptions_block_invoke;
  v10[3] = &__block_descriptor_40_e18___NSString_16__0Q8l;
  v10[4] = a1;
  uint64_t v2 = (void *)MEMORY[0x2166AD0C0](v10);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __NSStringFromVGChargingConnectorTypeOptions_block_invoke_47;
  v7[3] = &unk_264226470;
  long long v9 = &v11;
  id v3 = v2;
  id v8 = v3;
  uint64_t v4 = (void (**)(void, void, void))MEMORY[0x2166AD0C0](v7);
  v4[2](v4, 1, a1);
  v4[2](v4, 2, a1);
  v4[2](v4, 4, a1);
  v4[2](v4, 8, a1);
  v4[2](v4, 16, a1);
  v4[2](v4, 32, a1);
  v4[2](v4, 64, a1);
  v4[2](v4, 128, a1);
  v4[2](v4, 256, a1);
  uint64_t v5 = [(id)v12[5] componentsJoinedByString:@" | "];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void sub_214A45748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void __NSStringFromVGChargingConnectorTypeOptions_block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & ~a3) == 0)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v5];
  }
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

VGChargingNetworkStorage *VGChargingNetworkStorageFromVGChargingNetwork(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(VGChargingNetworkStorage);
  -[VGChargingNetworkStorage setIdentifier:](v2, "setIdentifier:", [v1 globalBrandID]);
  uint64_t v3 = [v1 name];

  uint64_t v4 = (void *)[v3 copy];
  [(VGChargingNetworkStorage *)v2 setName:v4];

  return v2;
}

id VGGetAssertLog()
{
  if (VGGetAssertLog_onceToken != -1) {
    dispatch_once(&VGGetAssertLog_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)VGGetAssertLog_log;

  return v0;
}

uint64_t __VGGetAssertLog_block_invoke()
{
  VGGetAssertLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "Assert");

  return MEMORY[0x270F9A758]();
}

id VGGetChargingNetworksLog()
{
  if (VGGetChargingNetworksLog_onceToken != -1) {
    dispatch_once(&VGGetChargingNetworksLog_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)VGGetChargingNetworksLog_log;

  return v0;
}

uint64_t __VGGetChargingNetworksLog_block_invoke()
{
  VGGetChargingNetworksLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "ChargingNetworks");

  return MEMORY[0x270F9A758]();
}

uint64_t __VGGetExternalAccessoryLog_block_invoke()
{
  VGGetExternalAccessoryLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "ExternalAccessory");

  return MEMORY[0x270F9A758]();
}

id VGGetExternalAccessoryModelFilterLog()
{
  if (VGGetExternalAccessoryModelFilterLog_onceToken != -1) {
    dispatch_once(&VGGetExternalAccessoryModelFilterLog_onceToken, &__block_literal_global_10);
  }
  id v0 = (void *)VGGetExternalAccessoryModelFilterLog_log;

  return v0;
}

uint64_t __VGGetExternalAccessoryModelFilterLog_block_invoke()
{
  VGGetExternalAccessoryModelFilterLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "ExternalAccessoryModelFilter");

  return MEMORY[0x270F9A758]();
}

uint64_t __VGGetDataCoordinatorLog_block_invoke()
{
  VGGetDataCoordinatorLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "DataCoordinator");

  return MEMORY[0x270F9A758]();
}

uint64_t __VGGetOEMApplicationLog_block_invoke()
{
  VGGetOEMApplicationLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "OEMApplication");

  return MEMORY[0x270F9A758]();
}

uint64_t __VGGetPersistingLog_block_invoke()
{
  VGGetPersistingLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "Persisting");

  return MEMORY[0x270F9A758]();
}

id VGGetUIHelperLog()
{
  if (VGGetUIHelperLog_onceToken != -1) {
    dispatch_once(&VGGetUIHelperLog_onceToken, &__block_literal_global_22_0);
  }
  id v0 = (void *)VGGetUIHelperLog_log;

  return v0;
}

uint64_t __VGGetUIHelperLog_block_invoke()
{
  VGGetUIHelperLog_log = (uint64_t)os_log_create("com.apple.navigation.VirtualGarage", "UIHelper");

  return MEMORY[0x270F9A758]();
}

void sub_214A4A550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_214A4AA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
}

void sub_214A4AAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_214A4AEBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4B36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_214A4B5B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4B74C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4BC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_214A4BD90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4BF0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4C0AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4C1EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A4CA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_214A4CF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_214A4D20C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t VGChargingNetworksStorageReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        a1[20] |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        a1[16] = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        long long v17 = objc_alloc_init(VGChargingNetworkStorage);
        [a1 addNetworks:v17];
        if (!PBReaderPlaceMark() || (VGChargingNetworkStorageReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_214A50710(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A509FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A512E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A515E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A5254C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A52A6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214A533F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___connectorMapping_block_invoke()
{
  v7[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0F6C8];
  v6[0] = *MEMORY[0x263F0F6F0];
  v6[1] = v0;
  v7[0] = &unk_26C5974F0;
  v7[1] = &unk_26C597508;
  uint64_t v1 = *MEMORY[0x263F0F6D8];
  v6[2] = *MEMORY[0x263F0F6D0];
  v6[3] = v1;
  v7[2] = &unk_26C597520;
  v7[3] = &unk_26C597538;
  uint64_t v2 = *MEMORY[0x263F0F6E8];
  v6[4] = *MEMORY[0x263F0F6E0];
  v6[5] = v2;
  void v7[4] = &unk_26C597550;
  v7[5] = &unk_26C597568;
  uint64_t v3 = *MEMORY[0x263F0F700];
  v6[6] = *MEMORY[0x263F0F708];
  v6[7] = v3;
  v7[6] = &unk_26C597580;
  v7[7] = &unk_26C597598;
  v6[8] = *MEMORY[0x263F0F6F8];
  v7[8] = &unk_26C5975B0;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:9];
  id v5 = (void *)qword_26AB30FB8;
  qword_26AB30FB8 = v4;
}

void sub_214A54B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
}

void sub_214A5599C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x270F300A8]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x270F300C8]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x270F300D8]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x270F300F8]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x270F30140]();
}

uint64_t MapsFeature_IsEnabled_Alberta()
{
  return MEMORY[0x270F301E8]();
}

uint64_t MapsFeature_IsEnabled_EVRouting()
{
  return MEMORY[0x270F301F0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x270F30200]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x270F30250]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x270F30268]();
}

uint64_t geo_isolater_create_with_format()
{
  return MEMORY[0x270F30278]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}