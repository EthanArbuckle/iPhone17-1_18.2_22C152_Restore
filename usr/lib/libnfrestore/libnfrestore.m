uint64_t *NfRestoreSEOpen(uint64_t a1, uint64_t a2)
{
  return NfRestoreSEOpen_Internal(a1, 1, a2, 0);
}

uint64_t *NfRestoreSEOpenWithError(uint64_t a1, uint64_t a2, int *a3)
{
  return NfRestoreSEOpen_Internal(a1, 1, a2, a3);
}

uint64_t *NfRestoreSEOpen_Internal(uint64_t a1, int a2, uint64_t a3, int *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!gNfContext)
  {
    gNfContext = (uint64_t)NfContextInit(0, a1, a3);
    if (gNfContext)
    {
      v10 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
      if (v10)
      {
        v8 = v10;
        long long v36 = 0u;
        memset(buf, 0, sizeof(buf));
        uint64_t v35 = NFRestoreGetDriverFlags() | 0x200000;
        uint64_t v11 = NFDriverOpen();
        uint64_t *v8 = v11;
        if (!v11)
        {
          v23 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i Failed to load driver", "NfRestoreSEOpen_Internal", 198);
          }
          dispatch_get_specific(*v23);
          v25 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v30 = 136446466;
            v31 = "NfRestoreSEOpen_Internal";
            __int16 v32 = 1024;
            int v33 = 198;
            _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", v30, 0x12u);
          }
          if (!a4) {
            goto LABEL_36;
          }
          int v16 = 10;
          goto LABEL_35;
        }
        if (NFDriverLoadStack())
        {
          v12 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v13) {
            v13(3, "%s:%i Failed to load stack", "NfRestoreSEOpen_Internal", 205);
          }
          dispatch_get_specific(*v12);
          v14 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)v30 = 136446466;
          v31 = "NfRestoreSEOpen_Internal";
          __int16 v32 = 1024;
          int v33 = 205;
          v15 = "%{public}s:%i Failed to load stack";
        }
        else
        {
          v27 = NfSecureElementOpen(*v8, a2);
          v8[1] = (uint64_t)v27;
          if (v27) {
            return v8;
          }
          v28 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v29) {
            v29(3, "%s:%i Failed to open SE", "NfRestoreSEOpen_Internal", 213);
          }
          dispatch_get_specific(*v28);
          v14 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)v30 = 136446466;
          v31 = "NfRestoreSEOpen_Internal";
          __int16 v32 = 1024;
          int v33 = 213;
          v15 = "%{public}s:%i Failed to open SE";
        }
        _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, v15, v30, 0x12u);
LABEL_17:
        if (!a4)
        {
LABEL_36:
          NfRestoreSEClose(v8);
          NfContextFree((void *)gNfContext);
          v8 = 0;
          gNfContext = 0;
          return v8;
        }
        int v16 = 9;
LABEL_35:
        *a4 = v16;
        goto LABEL_36;
      }
      v21 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22) {
        v22(3, "%s:%i Failed to create NfRestoreSE object", "NfRestoreSEOpen_Internal", 186);
      }
      dispatch_get_specific(*v21);
      v19 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      buf[0] = 136446466;
      *(void *)&buf[1] = "NfRestoreSEOpen_Internal";
      LOWORD(buf[3]) = 1024;
      *(_DWORD *)((char *)&buf[3] + 2) = 186;
      v20 = "%{public}s:%i Failed to create NfRestoreSE object";
    }
    else
    {
      v17 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18) {
        v18(3, "%s:%i Failed to create context", "NfRestoreSEOpen_Internal", 180);
      }
      dispatch_get_specific(*v17);
      v19 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      buf[0] = 136446466;
      *(void *)&buf[1] = "NfRestoreSEOpen_Internal";
      LOWORD(buf[3]) = 1024;
      *(_DWORD *)((char *)&buf[3] + 2) = 180;
      v20 = "%{public}s:%i Failed to create context";
    }
    _os_log_impl(&dword_237D7D000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)buf, 0x12u);
    return 0;
  }
  v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  v6 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v6) {
    v6(3, "%s:%i Context already exists", "NfRestoreSEOpen_Internal", 173);
  }
  dispatch_get_specific(*v5);
  v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    buf[0] = 136446466;
    *(void *)&buf[1] = "NfRestoreSEOpen_Internal";
    LOWORD(buf[3]) = 1024;
    *(_DWORD *)((char *)&buf[3] + 2) = 173;
    _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", (uint8_t *)buf, 0x12u);
  }
  if (!a4) {
    return 0;
  }
  v8 = 0;
  *a4 = 4;
  return v8;
}

void NfRestoreSEClose(void *a1)
{
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2) {
      NfSecureElementClose(v2);
    }
    if (*a1)
    {
      NFDriverUnloadStackAndLeaveHWEnabled();
      NFDriverClose();
    }
    free(a1);
  }
  if (gNfContext)
  {
    NfContextFree((void *)gNfContext);
    gNfContext = 0;
  }
}

uint64_t NfRestoreSETransceive(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  return NfRestoreSETransceiveToOS(a1, 0, a2, a3, a4, a5);
}

uint64_t NfRestoreSETransceiveToOS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 6;
  }
  NFDataCreateWithBytes();
  uint64_t v8 = NFDriverSecureElementTransceive();
  NFDataRelease();
  if (v8)
  {
    if (a5 && a6)
    {
      unint64_t v9 = *(void *)(v8 + 8);
      if (*a6 < v9)
      {
        v10 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i Provided buffer too small for result: %zu", "NfRestoreSETransceiveToOS", 292, *(void *)(v8 + 8));
        }
        dispatch_get_specific(*v10);
        v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = *(void *)(v8 + 8);
          *(_DWORD *)buf = 136446722;
          v19 = "NfRestoreSETransceiveToOS";
          __int16 v20 = 1024;
          int v21 = 292;
          __int16 v22 = 2048;
          uint64_t v23 = v13;
          _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i Provided buffer too small for result: %zu", buf, 0x1Cu);
        }
        NFDataRelease();
        return 11;
      }
      *a6 = v9;
      memcpy(a5, *(const void **)v8, *(void *)(v8 + 8));
    }
    NFDataRelease();
    return 0;
  }
  v15 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v16) {
    v16(3, "%s:%i Transceive failed", "NfRestoreSETransceiveToOS", 286);
  }
  dispatch_get_specific(*v15);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "NfRestoreSETransceiveToOS";
    __int16 v20 = 1024;
    int v21 = 286;
    _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Transceive failed", buf, 0x12u);
  }
  return 9;
}

uint64_t NfRestoreSEList()
{
  return NfRestoreSEEnumerate();
}

uint64_t NfRestoreSEEnumerate()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v81 = *MEMORY[0x263EF8340];
  long long v80 = 0u;
  long long v79 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  long long v75 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  long long v68 = 0u;
  long long v67 = 0u;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  long long v59 = 0u;
  long long v58 = 0u;
  long long v57 = 0u;
  memset(v56, 0, sizeof(v56));
  if (gNfContext)
  {
    v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Context already exists", "NfRestoreSEEnumerate", 318);
    }
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "NfRestoreSEEnumerate";
      __int16 v43 = 1024;
      int v44 = 318;
      _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", buf, 0x12u);
    }
    return 4;
  }
  uint64_t v7 = v2;
  uint64_t v8 = (void (*)(_DWORD *, uint64_t, uint64_t))v0;
  gNfContext = (uint64_t)NfContextInit(0, v1, v2);
  NFRestoreGetDriverFlags();
  uint64_t v9 = NFDriverOpen();
  if (v9)
  {
    uint64_t v10 = v9;
    if (NFDriverLoadStack())
    {
      uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12) {
        v12(3, "%s:%i Failed to load stack", "NfRestoreSEEnumerate", 338);
      }
      dispatch_get_specific(*v11);
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEEnumerate";
        __int16 v43 = 1024;
        int v44 = 338;
        _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
      }
      NFDriverClose();
      NfContextFree((void *)gNfContext);
      gNfContext = 0;
      if (NFProductIsDevBoard())
      {
        dispatch_get_specific(*v11);
        v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14) {
          v14(4, "%s:%i Failed to get driver info", "NfRestoreSEEnumerate", 343);
        }
        dispatch_get_specific(*v11);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v42 = "NfRestoreSEEnumerate";
          __int16 v43 = 1024;
          int v44 = 343;
          _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", buf, 0x12u);
        }
        dispatch_get_specific(*v11);
        int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v16) {
          v16(4, "%s:%i Assuming HW not present", "NfRestoreSEEnumerate", 344);
        }
        dispatch_get_specific(*v11);
        v17 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v42 = "NfRestoreSEEnumerate";
          __int16 v43 = 1024;
          int v44 = 344;
          _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Assuming HW not present", buf, 0x12u);
        }
        return 1;
      }
      return 9;
    }
    if ((NFDriverGetControllerInfo() & 1) == 0)
    {
      int v21 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22) {
        v22(4, "%s:%i Failed to get controller info", "NfRestoreSEEnumerate", 353);
      }
      dispatch_get_specific(*v21);
      uint64_t v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEEnumerate";
        __int16 v43 = 1024;
        int v44 = 353;
        _os_log_impl(&dword_237D7D000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get controller info", buf, 0x12u);
      }
      return 9;
    }
    if ((NfRestoreSEDumpControllerInfo_controllerInfoPrinted & 1) == 0)
    {
      uint64_t v24 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25) {
        v25(6, "%s:%i ==== CONTROLLER ====", "NfRestoreSEDumpControllerInfo", 95);
      }
      dispatch_get_specific(*v24);
      v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEDumpControllerInfo";
        __int16 v43 = 1024;
        int v44 = 95;
        _os_log_impl(&dword_237D7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ==== CONTROLLER ====", buf, 0x12u);
      }
      dispatch_get_specific(*v24);
      v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v27) {
        v27(6, "%s:%i Hardware: %x.%x (%s)", "NfRestoreSEDumpControllerInfo", 99, 0, 0, "Unknown");
      }
      dispatch_get_specific(*v24);
      v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v42 = "NfRestoreSEDumpControllerInfo";
        __int16 v43 = 1024;
        int v44 = 99;
        __int16 v45 = 1024;
        int v46 = 0;
        __int16 v47 = 1024;
        int v48 = 0;
        __int16 v49 = 2080;
        v50[0] = "Unknown";
        _os_log_impl(&dword_237D7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hardware: %x.%x (%s)", buf, 0x28u);
      }
      dispatch_get_specific(*v24);
      v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29) {
        v29(6, "%s:%i Firmware: %x.%x rev %d", "NfRestoreSEDumpControllerInfo", 103, 0, 0, 0);
      }
      dispatch_get_specific(*v24);
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v42 = "NfRestoreSEDumpControllerInfo";
        __int16 v43 = 1024;
        int v44 = 103;
        __int16 v45 = 1024;
        int v46 = 0;
        __int16 v47 = 1024;
        int v48 = 0;
        __int16 v49 = 1024;
        LODWORD(v50[0]) = 0;
        _os_log_impl(&dword_237D7D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Firmware: %x.%x rev %d", buf, 0x24u);
      }
      dispatch_get_specific(*v24);
      v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v31) {
        v31(6, "%s:%i Middleware: %x.%x.%x.%x", "NfRestoreSEDumpControllerInfo", 108, 0, 0, 0, 0);
      }
      dispatch_get_specific(*v24);
      __int16 v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447490;
        v42 = "NfRestoreSEDumpControllerInfo";
        __int16 v43 = 1024;
        int v44 = 108;
        __int16 v45 = 1024;
        int v46 = 0;
        __int16 v47 = 1024;
        int v48 = 0;
        __int16 v49 = 1024;
        LODWORD(v50[0]) = 0;
        WORD2(v50[0]) = 1024;
        *(_DWORD *)((char *)v50 + 6) = 0;
        _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Middleware: %x.%x.%x.%x", buf, 0x2Au);
      }
      NfRestoreSEDumpControllerInfo_controllerInfoPrinted = 1;
    }
    if (!MEMORY[0x237E30120](v10, 1))
    {
      uint64_t v35 = 0;
LABEL_70:
      if (MEMORY[0x237E30120](v10, 2))
      {
        uint64_t v38 = 0;
        unint64_t v39 = (unint64_t)&v56[36 * v35];
        *(_DWORD *)unint64_t v39 = 2;
        *(unsigned char *)(v39 + 4) = 1;
        *(unsigned char *)(v39 + 5) = 0;
        uint64_t v40 = v39 | 8;
        do
        {
          *(_DWORD *)(v40 + v38) = 4;
          v38 += 32;
        }
        while (v38 != 128);
        uint64_t v35 = (v35 + 1);
      }
      NFDriverUnloadStackAndLeaveHWEnabled();
      NFDriverClose();
      NfContextFree((void *)gNfContext);
      gNfContext = 0;
      v8(v56, v35, v7);
      return 0;
    }
    v56[0] = 0;
    LOWORD(v56[1]) = 257;
    bzero(buf, 0xE08uLL);
    if (!NFDriverSetConfiguration())
    {
LABEL_69:
      uint64_t v35 = 1;
      goto LABEL_70;
    }
    if (NFDriverSecureElementGetOSMode() && NFDriverSecureElementGetOSInfo())
    {
      for (uint64_t i = 0; i != 32; i += 8)
        v56[i + 2] = 4;
      if (BYTE1(v56[1])) {
        BOOL v34 = v55 == 2;
      }
      else {
        BOOL v34 = 1;
      }
      if (!v34)
      {
        uint64_t v36 = 0;
LABEL_67:
        uint64_t v37 = &v56[8 * v36];
        v37[2] = 2;
        *((unsigned char *)v37 + 36) = 24;
        *(void *)(v37 + 7) = v54;
        *(_OWORD *)(v37 + 3) = v53;
        goto LABEL_68;
      }
      v56[2] = 0;
      LOBYTE(v56[9]) = 24;
      *(_OWORD *)&v56[3] = v51;
      *(void *)&v56[7] = v52;
      if (BYTE1(v56[1]))
      {
        uint64_t v36 = 1;
        goto LABEL_67;
      }
    }
LABEL_68:
    NFDriverSetConfiguration();
    goto LABEL_69;
  }
  v18 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19) {
    v19(3, "%s:%i Failed to load driver", "NfRestoreSEEnumerate", 330);
  }
  dispatch_get_specific(*v18);
  __int16 v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v42 = "NfRestoreSEEnumerate";
    __int16 v43 = 1024;
    int v44 = 330;
    _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
  }
  NfContextFree((void *)gNfContext);
  gNfContext = 0;
  return 10;
}

uint64_t *NfRestoreOpenWithSE(int *a1, uint64_t a2, uint64_t a3)
{
  int v3 = *a1;
  if (*a1)
  {
    if (v3 != 2) {
      return 0;
    }
  }
  else
  {
    int v3 = 1;
  }
  return NfRestoreSEOpen_Internal(a2, v3, a3, 0);
}

uint64_t *NfRestoreOpenWithSEAndResult(int *a1, uint64_t a2, uint64_t a3, int *a4)
{
  int v4 = *a1;
  if (*a1)
  {
    if (v4 != 2) {
      return 0;
    }
  }
  else
  {
    int v4 = 1;
  }
  return NfRestoreSEOpen_Internal(a2, v4, a3, a4);
}

uint64_t NfRestoreToggleDwnldReq()
{
  return 11;
}

uint64_t NfRestoreToggleSEPower(uint64_t a1)
{
  if (!a1) {
    return 6;
  }
  if (!*(void *)(a1 + 8)) {
    return 6;
  }
  if (NFDriverSetSecureElementPower()) {
    return 0;
  }
  return 10;
}

uint64_t NfRestoreDumpUART(uint64_t a1)
{
  return MEMORY[0x270F96580](**(void **)(a1 + 8));
}

void _NFRestorePushError(const char *a1, unsigned int a2, char *a3, ...)
{
  va_start(va, a3);
  uint64_t v21 = *MEMORY[0x263EF8340];
  userInfoKeys = 0;
  uint64_t v20 = 0;
  userInfoValues = 0;
  CFTypeRef v18 = 0;
  cStr = 0;
  vasprintf(&cStr, a3, va);
  if (cStr)
  {
    v5 = (__CFString *)CFStringCreateWithCString(0, cStr, 0x8000100u);
    free(cStr);
  }
  else
  {
    v5 = @"???";
  }
  CFStringRef v6 = CFStringCreateWithCString(0, a1, 0x8000100u);
  if (_gError)
  {
    CFTypeRef v7 = CFRetain((CFTypeRef)_gError);
    CFRelease((CFTypeRef)_gError);
    _gError = 0;
    if (v5)
    {
      userInfoKeys = (void *)*MEMORY[0x263EFFC70];
      userInfoValues = v5;
      if (v7)
      {
        uint64_t v20 = *MEMORY[0x263EFFC88];
        CFTypeRef v18 = v7;
        CFIndex v8 = 2;
LABEL_11:
        _gError = (uint64_t)CFErrorCreateWithUserInfoKeysAndValues(0, v6, a2, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, v8);
        CFRelease(v5);
        goto LABEL_17;
      }
LABEL_10:
      CFIndex v8 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
    if (v5)
    {
      userInfoKeys = (void *)*MEMORY[0x263EFFC70];
      userInfoValues = v5;
      goto LABEL_10;
    }
  }
  uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Failed to create errorValue CFString", "_NFRestorePushError", 86);
  }
  dispatch_get_specific(*v9);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "_NFRestorePushError";
    __int16 v15 = 1024;
    int v16 = 86;
    _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create errorValue CFString", buf, 0x12u);
  }
  _gError = (uint64_t)CFErrorCreate(0, v6, a2, 0);
LABEL_17:
  CFRelease(v6);
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t NFRestoreGetDriverFlags()
{
  if (NFPreferencesGetBool(@"LogNCI")) {
    uint64_t v0 = 4;
  }
  else {
    uint64_t v0 = 0;
  }
  if (NFPreferencesGetBool(@"LogMW")) {
    v0 |= 0x40000000uLL;
  }
  if (NFPreferencesGetBool(@"LogAPI")) {
    v0 |= 8uLL;
  }
  if (NFPreferencesGetBool(@"LogAPDU")) {
    v0 |= 0x10uLL;
  }
  if (NFPreferencesGetBool(@"SimulateRestoreOS")) {
    v0 |= 0x200000uLL;
  }
  if (NFPreferencesGetBool(@"ForceVenReset")) {
    return v0 | 0x4000000;
  }
  else {
    return v0;
  }
}

BOOL NFPreferencesGetBool(const __CFString *a1)
{
  CFStringRef v1 = (const __CFString *)CFPreferencesCopyValue(a1, @"com.apple.stockholm", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v1)
  {
    CFStringRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFStringGetTypeID())
    {
      BOOL v4 = 1;
      if (CFStringCompare(v2, @"true", 1uLL) == kCFCompareEqualTo) {
        goto LABEL_18;
      }
      BOOL v4 = 1;
      if (CFStringCompare(v2, @"YES", 1uLL) == kCFCompareEqualTo) {
        goto LABEL_18;
      }
      BOOL v5 = CFEqual(v2, @"1") == 0;
    }
    else
    {
      if (v3 != CFNumberGetTypeID())
      {
        BOOL v4 = v3 == CFBooleanGetTypeID() && v2 == (const __CFString *)*MEMORY[0x263EFFB40];
        goto LABEL_18;
      }
      double valuePtr = 0.0;
      if (CFNumberIsFloatType((CFNumberRef)v2))
      {
        CFNumberGetValue((CFNumberRef)v2, kCFNumberDoubleType, &valuePtr);
        BOOL v5 = valuePtr == 0.0;
      }
      else
      {
        CFNumberGetValue((CFNumberRef)v2, kCFNumberCFIndexType, &valuePtr);
        BOOL v5 = *(void *)&valuePtr == 0;
      }
    }
    BOOL v4 = !v5;
LABEL_18:
    CFRelease(v2);
    return v4;
  }
  return 0;
}

uint64_t NFRestoreRFSettingsForController(_DWORD *a1, int a2, const __CFDictionary *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 128);
  CFTypeRef v7 = Mutable;
  CFStringRef v8 = @"SN100V_FW_A3_";
  switch(a1[1])
  {
    case 5:
      if (Mutable) {
        CFRelease(Mutable);
      }
      return MEMORY[0x270F9A290](0, v8);
    case 7:
    case 8:
      goto LABEL_18;
    case 0xA:
    case 0xB:
      CFStringRef v8 = @"SN200V_FW_B1_";
      goto LABEL_18;
    case 0xC:
      if (a2) {
        CFStringRef v8 = @"SN200V_FURY_FW_B1_";
      }
      else {
        CFStringRef v8 = @"SN200V_FW_B1_";
      }
      goto LABEL_18;
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
      CFStringRef v8 = @"SN300V_FW_B0_";
      goto LABEL_18;
    case 0x12:
      uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(6, "%s:%i RF not supported", "NFRestoreRFSettingsForController", 783);
      }
      dispatch_get_specific(*v9);
      uint64_t v11 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v40 = "NFRestoreRFSettingsForController";
      __int16 v41 = 1024;
      int v42 = 783;
      v12 = "%{public}s:%i RF not supported";
      goto LABEL_37;
    case 0x14:
      if ((a2 & 1) == 0) {
        goto LABEL_19;
      }
      CFStringRef v8 = @"SN200V_FURY_FW_B1_";
LABEL_18:
      CFStringAppend(Mutable, v8);
LABEL_19:
      CFStringAppendFormat(v7, 0, @"%02X_%02X_%02X", a1[2], a1[3] >> 8, a1[3]);
      CFIndex Count = CFDictionaryGetCount(a3);
      v14 = (const void **)malloc_type_calloc(1uLL, 8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(a3, v14, 0);
      __int16 v15 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
      CFArrayRef v16 = CFArrayCreate(0, v14, Count, MEMORY[0x263EFFF70]);
      uint64_t v17 = CFArrayGetCount(v16);
      CFTypeRef v18 = CFArrayCreateMutable(0, v17, v15);
      if (v17 >= 1)
      {
        for (CFIndex i = 0; i != v17; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, i);
          CFStringRef v21 = ValueAtIndex;
          if ((!v7 || CFStringHasPrefix(ValueAtIndex, v7)) && CFStringHasSuffix(v21, @".plist")) {
            CFArrayAppendValue(v18, v21);
          }
        }
      }
      CFRelease(v16);
      free(v14);
      if (!v18)
      {
        v29 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v30) {
          v30(6, "%s:%i No matching files", "NFRestoreRFSettingsForController", 791);
        }
        dispatch_get_specific(*v29);
        uint64_t v11 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v40 = "NFRestoreRFSettingsForController";
          __int16 v41 = 1024;
          int v42 = 791;
          v12 = "%{public}s:%i No matching files";
LABEL_37:
          _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
        }
LABEL_38:
        uint64_t v31 = 0;
        CFTypeRef v18 = 0;
        if (!v7) {
          goto LABEL_47;
        }
LABEL_46:
        CFRelease(v7);
        goto LABEL_47;
      }
      if (!CFArrayGetCount(v18))
      {
        __int16 v32 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        int v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v33) {
          v33(3, "%s:%i Failed to find matching file for %02x_%02x_%02x", "NFRestoreRFSettingsForController", 794, a1[2], a1[3] >> 8, a1[3]);
        }
        dispatch_get_specific(*v32);
        uint64_t v24 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v34 = a1[2];
          int v35 = a1[3] >> 8;
          int v36 = a1[3];
          *(_DWORD *)buf = 136447234;
          uint64_t v40 = "NFRestoreRFSettingsForController";
          __int16 v41 = 1024;
          int v42 = 794;
          __int16 v43 = 1024;
          int v44 = v34;
          __int16 v45 = 1024;
          int v46 = v35;
          __int16 v47 = 1024;
          int v48 = v36;
          v28 = "%{public}s:%i Failed to find matching file for %02x_%02x_%02x";
          goto LABEL_44;
        }
LABEL_45:
        uint64_t v31 = 0;
        if (!v7) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      if (CFArrayGetCount(v18) >= 2)
      {
        __int16 v22 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v23) {
          v23(3, "%s:%i More than 1 file matching %02x_%02x_%02x", "NFRestoreRFSettingsForController", 797, a1[2], a1[3] >> 8, a1[3]);
        }
        dispatch_get_specific(*v22);
        uint64_t v24 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v25 = a1[2];
          int v26 = a1[3] >> 8;
          int v27 = a1[3];
          *(_DWORD *)buf = 136447234;
          uint64_t v40 = "NFRestoreRFSettingsForController";
          __int16 v41 = 1024;
          int v42 = 797;
          __int16 v43 = 1024;
          int v44 = v25;
          __int16 v45 = 1024;
          int v46 = v26;
          __int16 v47 = 1024;
          int v48 = v27;
          v28 = "%{public}s:%i More than 1 file matching %02x_%02x_%02x";
LABEL_44:
          _os_log_impl(&dword_237D7D000, v24, OS_LOG_TYPE_ERROR, v28, buf, 0x24u);
          goto LABEL_45;
        }
        goto LABEL_45;
      }
      CFStringRef v37 = (const __CFString *)CFArrayGetValueAtIndex(v18, 0);
      uint64_t v31 = NFRestoreDictionaryCopyDataForKey(a3, v37);
      if (v7) {
        goto LABEL_46;
      }
LABEL_47:
      if (v18) {
        CFRelease(v18);
      }
      return v31;
    default:
      goto LABEL_19;
  }
}

uint64_t NFRestoreDictionaryCopyDataForKey(const __CFDictionary *a1, const __CFString *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x400uLL);
  CFURLRef Value = (const __CFURL *)CFDictionaryGetValue(a1, a2);
  if (Value && (v5 = Value, CFTypeID v6 = CFGetTypeID(Value), v6 == CFURLGetTypeID()))
  {
    CFStringRef v7 = CFURLGetString(v5);
    if (!CFStringGetCStringPtr(v7, 0x8000100u)) {
      CFStringGetCString(v7, buffer, 1024, 0x8000100u);
    }
    return NFDataCreateWithFile();
  }
  else
  {
    uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
      if (!CStringPtr)
      {
        CStringPtr = buffer;
        CFStringGetCString(a2, buffer, 1024, 0x8000100u);
      }
      v11(3, "%s:%i No data found for %s", "NFRestoreDictionaryCopyDataForKey", 534, CStringPtr);
    }
    dispatch_get_specific(*v9);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)CFStringGetCStringPtr(a2, 0x8000100u);
      if (!v14)
      {
        v14 = buffer;
        CFStringGetCString(a2, buffer, 1024, 0x8000100u);
      }
      *(_DWORD *)buf = 136446722;
      CFArrayRef v16 = "NFRestoreDictionaryCopyDataForKey";
      __int16 v17 = 1024;
      int v18 = 534;
      __int16 v19 = 2080;
      uint64_t v20 = v14;
      _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i No data found for %s", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t _NFRestore(uint64_t a1, const void *a2)
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1 + 4104;
  if (*(unsigned char *)(a1 + 4107)) {
    NFRestoreGetDriverFlags();
  }
  else {
    NFRestoreGetDriverFlags();
  }
  if (_gDriver)
  {
    CFURLRef v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Driver already open. This is bad", "_NFRestore", 1433);
    }
    dispatch_get_specific(*v5);
    CFStringRef v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "_NFRestore";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1433;
      _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Driver already open. This is bad", buf, 0x12u);
    }
    return 4;
  }
  _gDriver = NFDriverOpen();
  if (_gDriver)
  {
    NFDriverSetCallback();
    uint64_t v9 = _gDriver;
    BOOL HasRadio = _NfRestoreHasRadio();
    if (!a2 && !*(unsigned char *)(a1 + 2056))
    {
      uint64_t v24 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25) {
        v25(6, "%s:%i Nothing to do", "NFRestoreNfc", 1223);
      }
      dispatch_get_specific(*v24);
      int v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "NFRestoreNfc";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1223;
        _os_log_impl(&dword_237D7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Nothing to do", buf, 0x12u);
      }
      goto LABEL_192;
    }
    LODWORD(v8) = _NFRestoreNfcFirmwareStep(v9, a1, a2);
    if (v8) {
      goto LABEL_14;
    }
    if (NFDriverLoadStack())
    {
      v14 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15) {
        v15(3, "%s:%i Failed to load stack - retrying FW download", "_NFRestoreLoadStackAndRestoreOnFailure", 1064);
      }
      dispatch_get_specific(*v14);
      CFArrayRef v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1064;
        _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack - retrying FW download", buf, 0x12u);
      }
      *(_WORD *)(v4 + 1) = 257;
      _NFRestoreDebugNFCCError();
      int v17 = _NFRestoreNfcFirmwareStep(v9, a1, a2);
      int v18 = (unsigned __int8 *)MEMORY[0x263F8BD70];
      if (v17)
      {
        dispatch_get_specific(*v14);
        __int16 v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v19) {
          v19(3, "%s:%i Failed to restore after load failure.", "_NFRestoreLoadStackAndRestoreOnFailure", 1075);
        }
        dispatch_get_specific(*v14);
        uint64_t v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1075;
          _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to restore after load failure.", buf, 0x12u);
        }
        unsigned int v21 = *v18;
        uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
        Message = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v21, "Error 0x%04x at %s:%d: %llx %s", v21, "_NFRestoreLoadStackAndRestoreOnFailure", 1076, StackBreadcrumb, Message);
LABEL_43:
        dispatch_get_specific(*v14);
        v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v30) {
          v30(3, "%s:%i Failed to load stack", "NFRestoreNfc", 1236);
        }
        dispatch_get_specific(*v14);
        uint64_t v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "NFRestoreNfc";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1236;
          _os_log_impl(&dword_237D7D000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
        }
        unsigned int v32 = *v18;
        uint64_t v33 = NFDriverGetStackBreadcrumb();
        int v34 = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v32, "Error 0x%04x at %s:%d: %llx %s", v32, "NFRestoreNfc", 1237, v33, v34);
        goto LABEL_210;
      }
      int Stack = NFDriverLoadStack();
      dispatch_get_specific(*v14);
      v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Stack)
      {
        if (v28) {
          v28(3, "%s:%i Failed to load stack after re-restore.", "_NFRestoreLoadStackAndRestoreOnFailure", 1087);
        }
        dispatch_get_specific(*v14);
        v29 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1087;
          _os_log_impl(&dword_237D7D000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack after re-restore.", buf, 0x12u);
        }
        _NFRestoreDebugNFCCError();
        goto LABEL_43;
      }
      if (v28) {
        v28(6, "%s:%i Stack loaded after re-restore.", "_NFRestoreLoadStackAndRestoreOnFailure", 1083);
      }
      dispatch_get_specific(*v14);
      int v35 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1083;
        _os_log_impl(&dword_237D7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Stack loaded after re-restore.", buf, 0x12u);
      }
    }
    if (!*(unsigned char *)(v9 + 56))
    {
      *(_WORD *)v167 = 0;
      if (!NFDriverReadATETrimVersion())
      {
        int v36 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        CFStringRef v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v37) {
          v37(6, "%s:%i ATE Trim version is %x (%d)", "_NFRestoreReadATETrimVersion", 1105, *(unsigned __int16 *)v167, *(unsigned __int16 *)v167);
        }
        dispatch_get_specific(*v36);
        uint64_t v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "_NFRestoreReadATETrimVersion";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1105;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = *(unsigned __int16 *)v167;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = *(unsigned __int16 *)v167;
          _os_log_impl(&dword_237D7D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ATE Trim version is %x (%d)", buf, 0x1Eu);
        }
      }
    }
    if (HasRadio)
    {
      if (*(unsigned char *)(a1 + 3080))
      {
        unint64_t v39 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v40) {
          v40(6, "%s:%i Using data from %s", "_NFRestoreNfcRFStep", 999, (const char *)(a1 + 3080));
        }
        dispatch_get_specific(*v39);
        __int16 v41 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 999;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = a1 + 3080;
          _os_log_impl(&dword_237D7D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using data from %s", buf, 0x1Cu);
        }
        uint64_t v42 = NFDataCreateWithFile();
        goto LABEL_65;
      }
      if (!a2) {
        goto LABEL_86;
      }
      memset(buf, 0, 28);
      uint64_t v42 = 0;
      if (!NFDriverGetControllerInfo())
      {
LABEL_65:
        if (v42)
        {
          unsigned int v43 = NFDriverRFSettingsSetup();
          NFDataRelease();
          if (v43 <= 0xB && ((1 << v43) & 0xC01) != 0)
          {
            LODWORD(v8) = 0;
LABEL_109:
            if (!*(unsigned char *)(v9 + 56) && NFDriverDisableLPCDAssist())
            {
              long long v80 = (const void **)MEMORY[0x263F8C6C0];
              dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
              uint64_t v81 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v81) {
                v81(5, "%s:%i Update LPCD settings failed; continue", "NFRestoreNfc", 1252);
              }
              dispatch_get_specific(*v80);
              v82 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                *(void *)&uint8_t buf[4] = "NFRestoreNfc";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1252;
                _os_log_impl(&dword_237D7D000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Update LPCD settings failed; continue",
                  buf,
                  0x12u);
              }
            }
            NFDriverUnloadStackAndLeaveHWEnabled();
            if (NFDriverLoadStack())
            {
              long long v75 = (const void **)MEMORY[0x263F8C6C0];
              dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
              long long v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v76) {
                v76(3, "%s:%i Failed to load stack after RF settings. Bailing", "NFRestoreNfc", 1262);
              }
              dispatch_get_specific(*v75);
              long long v77 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(void *)&uint8_t buf[4] = "NFRestoreNfc";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1262;
                _os_log_impl(&dword_237D7D000, v77, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack after RF settings. Bailing", buf, 0x12u);
              }
              unsigned int v78 = *MEMORY[0x263F8BD70];
              uint64_t v79 = NFDriverGetStackBreadcrumb();
              v164 = (const char *)NFDriverSerialDebugLastMessage();
              _NFRestorePushError("com.apple.nfstack", v78, "Error 0x%04x at %s:%d: %llx %s", v78, "NFRestoreNfc", 1263, v79, v164);
LABEL_209:
              _NFRestoreDebugNFCCError();
LABEL_210:
              uint64_t v8 = 9;
              goto LABEL_216;
            }
            goto LABEL_174;
          }
          long long v71 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          long long v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v72) {
            v72(3, "%s:%i Failed to update RF settings.", "_NFRestoreNfcRFStep", 1045);
          }
          dispatch_get_specific(*v71);
          long long v73 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "_NFRestoreNfcRFStep";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1045;
            _os_log_impl(&dword_237D7D000, v73, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update RF settings.", buf, 0x12u);
          }
          unsigned int v74 = *MEMORY[0x263F8BD70];
          NFDriverGetStackBreadcrumb();
          NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v74, "Error 0x%04x at %s:%d: %llx %s");
LABEL_108:
          NFDriverUnloadStackAndLeaveHWEnabled();
          LODWORD(v8) = 9;
          goto LABEL_109;
        }
LABEL_86:
        long long v60 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        long long v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v61) {
          v61(3, "%s:%i Bundle is missing RF settings - NFCC might fail RF operation", "_NFRestoreNfcRFStep", 1035);
        }
        dispatch_get_specific(*v60);
        long long v62 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1035;
          _os_log_impl(&dword_237D7D000, v62, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing RF settings - NFCC might fail RF operation", buf, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d");
        goto LABEL_108;
      }
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"rf");
      if (Value)
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
        if ((*(unsigned char *)(v4 + 3) & 1) == 0)
        {
          int v59 = 0;
          goto LABEL_244;
        }
        CFDictionaryRef v158 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"fury-rf");
        if (v158)
        {
          CFDictionaryApplyFunction(v158, (CFDictionaryApplierFunction)_AddEntriesIntoDictionary, MutableCopy);
          int v59 = *(unsigned char *)(v4 + 3) & 1;
LABEL_244:
          uint64_t v42 = NFRestoreRFSettingsForController(buf, v59, MutableCopy);
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
          goto LABEL_65;
        }
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        v161 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v162 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v162) {
          v162(4, "%s:%i Bundle is missing folder: fury-rf", "_NFRestoreNfcRFStep", 1020);
        }
        dispatch_get_specific(*v161);
        v163 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v167 = 136446466;
          *(void *)&v167[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&v167[12] = 1024;
          *(_DWORD *)&v167[14] = 1020;
          _os_log_impl(&dword_237D7D000, v163, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: fury-rf", v167, 0x12u);
        }
        LODWORD(v8) = 0;
      }
      else
      {
        v155 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v156 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v156) {
          v156(3, "%s:%i Bundle is missing folder: rf", "_NFRestoreNfcRFStep", 1006);
        }
        dispatch_get_specific(*v155);
        v157 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v167 = 136446466;
          *(void *)&v167[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&v167[12] = 1024;
          *(_DWORD *)&v167[14] = 1006;
          _os_log_impl(&dword_237D7D000, v157, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: rf", v167, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcRFStep", 1007);
        LODWORD(v8) = 5;
      }
      NFDriverUnloadStackAndLeaveHWEnabled();
      goto LABEL_109;
    }
    char v166 = -1;
    memset(v167, 0, sizeof(v167));
    int v168 = 0;
    if ((NFDriverGetControllerInfo() & 1) == 0)
    {
      int v44 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v45 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v45) {
        v45(3, "%s:%i Failed to get controller info..", "_NFRestoreConfigureSPMIIRQ", 1126);
      }
      dispatch_get_specific(*v44);
      int v46 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        goto LABEL_75;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "_NFRestoreConfigureSPMIIRQ";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1126;
      __int16 v47 = "%{public}s:%i Failed to get controller info..";
      int v48 = v46;
      uint32_t v49 = 18;
LABEL_74:
      _os_log_impl(&dword_237D7D000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);
LABEL_75:
      int v50 = 9;
LABEL_76:
      long long v51 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v52) {
        v52(3, "%s:%i Failed to reconfigure I/O : 0x%x", "NFRestoreNfc", 1271, v50);
      }
      dispatch_get_specific(*v51);
      long long v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "NFRestoreNfc";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1271;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v50;
        _os_log_impl(&dword_237D7D000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to reconfigure I/O : 0x%x", buf, 0x18u);
      }
      unsigned int v54 = *MEMORY[0x263F8BD70];
      uint64_t v55 = NFDriverGetStackBreadcrumb();
      v56 = (const char *)NFDriverSerialDebugLastMessage();
      _NFRestorePushError("com.apple.nfstack", v54, "Error 0x%04x at %s:%d: %llx %s", v54, "NFRestoreNfc", 1272, v55, v56);
      goto LABEL_125;
    }
    int HasExternalSPMIIRQ = NFHardwareInterfaceHasExternalSPMIIRQ((UInt8 *)&v166);
    if (HasExternalSPMIIRQ)
    {
      if (HasExternalSPMIIRQ < 0)
      {
        int v50 = 4;
        goto LABEL_76;
      }
      if (v166 != 255)
      {
        long long v64 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        long long v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v65) {
          v65(6, "%s:%i Configuring NFCC to use GPIO %d as data IRQ", "_NFRestoreConfigureSPMIIRQ", 1144, v166);
        }
        dispatch_get_specific(*v64);
        long long v66 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "_NFRestoreConfigureSPMIIRQ";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1144;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v166;
          _os_log_impl(&dword_237D7D000, v66, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring NFCC to use GPIO %d as data IRQ", buf, 0x18u);
        }
        int v67 = NFDriverConfigureSPMIIRQ();
        if (v67)
        {
          int v68 = v67;
          dispatch_get_specific(*v64);
          long long v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v69) {
            v69(3, "%s:%i Failed to configure NFCC to use GPIO %d as data IRQ : %d", "_NFRestoreConfigureSPMIIRQ", 1147, v166, v68);
          }
          dispatch_get_specific(*v64);
          long long v70 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            goto LABEL_75;
          }
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "_NFRestoreConfigureSPMIIRQ";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1147;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v166;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v68;
          __int16 v47 = "%{public}s:%i Failed to configure NFCC to use GPIO %d as data IRQ : %d";
          int v48 = v70;
          uint32_t v49 = 30;
          goto LABEL_74;
        }
      }
    }
    else
    {
      v83 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v84 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v84) {
        v84(6, "%s:%i No external SPMIIRQ", "_NFRestoreConfigureSPMIIRQ", 1137);
      }
      dispatch_get_specific(*v83);
      v85 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "_NFRestoreConfigureSPMIIRQ";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1137;
        _os_log_impl(&dword_237D7D000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s:%i No external SPMIIRQ", buf, 0x12u);
      }
    }
LABEL_125:
    memset(buf, 0, 28);
    if (!NFProductIsPad()) {
      goto LABEL_147;
    }
    if (NFDriverGetControllerInfo())
    {
      if (*(_DWORD *)&buf[4] != 18) {
        goto LABEL_147;
      }
      v86 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v87) {
        v87(6, "%s:%i Configuring RSTN delay...", "_NFRestoreConfigureRSTNDelay", 1172);
      }
      dispatch_get_specific(*v86);
      v88 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v167 = 136446466;
        *(void *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
        *(_WORD *)&v167[12] = 1024;
        *(_DWORD *)&v167[14] = 1172;
        _os_log_impl(&dword_237D7D000, v88, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring RSTN delay...", v167, 0x12u);
      }
      int v89 = NFDriverConfigurRSTNDelay();
      if (!v89)
      {
        if (NFGetProductType() - 86 > 3) {
          goto LABEL_162;
        }
LABEL_147:
        v105 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v106 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v106) {
          v106(6, "%s:%i Configuring I2C for LPM...", "_NFRestoreConfigureI2CForLPM", 1195);
        }
        dispatch_get_specific(*v105);
        v107 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreConfigureI2CForLPM";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1195;
          _os_log_impl(&dword_237D7D000, v107, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring I2C for LPM...", buf, 0x12u);
        }
        int v108 = NFDriverConfigureI2CForLPM();
        if (v108)
        {
          int v109 = v108;
          dispatch_get_specific(*v105);
          v110 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v110) {
            v110(3, "%s:%i Failed to configure I2C for LPM: %d", "_NFRestoreConfigureI2CForLPM", 1198, v109);
          }
          dispatch_get_specific(*v105);
          v111 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "_NFRestoreConfigureI2CForLPM";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1198;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v109;
            _os_log_impl(&dword_237D7D000, v111, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure I2C for LPM: %d", buf, 0x18u);
          }
          dispatch_get_specific(*v105);
          v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v112) {
            v112(3, "%s:%i Failed to configure I2C for LPM..", "NFRestoreNfc", 1283);
          }
          dispatch_get_specific(*v105);
          v113 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1283;
            _os_log_impl(&dword_237D7D000, v113, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure I2C for LPM..", buf, 0x12u);
          }
          unsigned int v114 = *MEMORY[0x263F8BD70];
          uint64_t v8 = NFDriverGetStackBreadcrumb();
          v115 = (const char *)NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v114, "Error 0x%04x at %s:%d: %llx %s", v114, "NFRestoreNfc", 1284, v8, v115);
          LODWORD(v8) = 9;
        }
        else
        {
LABEL_162:
          LODWORD(v8) = 0;
        }
        if (*(unsigned char *)(v9 + 58))
        {
          if (NFDriverDisableBoost())
          {
            v116 = (const void **)MEMORY[0x263F8C6C0];
            dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
            v117 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v117) {
              v117(3, "%s:%i Failed to disable boost", "NFRestoreNfc", 1291);
            }
            dispatch_get_specific(*v116);
            v118 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = "NFRestoreNfc";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 1291;
              v119 = "%{public}s:%i Failed to disable boost";
              v120 = v118;
              os_log_type_t v121 = OS_LOG_TYPE_ERROR;
LABEL_173:
              _os_log_impl(&dword_237D7D000, v120, v121, v119, buf, 0x12u);
            }
          }
        }
        else
        {
          v122 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v123 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v123) {
            v123(6, "%s:%i No RF for this device.", "NFRestoreNfc", 1294);
          }
          dispatch_get_specific(*v122);
          v124 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1294;
            v119 = "%{public}s:%i No RF for this device.";
            v120 = v124;
            os_log_type_t v121 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_173;
          }
        }
LABEL_174:
        int v184 = 0;
        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        long long v171 = 0u;
        long long v170 = 0u;
        memset(buf, 0, sizeof(buf));
        if (!NFDriverReadPageEraseCounter()) {
          NFDriverPrintPageEraseCounter();
        }
        if (*(unsigned char *)(v4 + 1028))
        {
          v125 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v126 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v126) {
            v126(6, "%s:%i Erasing firmware flags.", "NFRestoreNfc", 1302);
          }
          dispatch_get_specific(*v125);
          v127 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1302;
            _os_log_impl(&dword_237D7D000, v127, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Erasing firmware flags.", buf, 0x12u);
          }
          if (NFDriverResetFWFlags()) {
            LODWORD(v8) = 9;
          }
          else {
            LODWORD(v8) = 0;
          }
        }
        NFDriverUnloadStackAndLeaveHWEnabled();
        if ((*(unsigned char *)(v4 + 3) & 0x10) != 0 && v8)
        {
          v128 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v129 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v129) {
            v129(3, "%s:%i Dumping EEPROM after failure", "NFRestoreNfc", 1309);
          }
          dispatch_get_specific(*v128);
          v130 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1309;
            _os_log_impl(&dword_237D7D000, v130, OS_LOG_TYPE_ERROR, "%{public}s:%i Dumping EEPROM after failure", buf, 0x12u);
          }
          _NFRestoreDebugNFCCError();
          goto LABEL_14;
        }
        if (v8)
        {
LABEL_14:
          if (v8 == 1) {
            uint64_t v8 = 0;
          }
          else {
            uint64_t v8 = v8;
          }
          goto LABEL_216;
        }
LABEL_192:
        if ((*(unsigned char *)v4 & 4) != 0)
        {
          uint64_t v8 = _NfRestoreRunAntennaSelfCheck(_gDriver, 1);
          if (v8)
          {
LABEL_216:
            NFDriverClose();
            _gDriver = 0;
            return v8;
          }
        }
        else if (NFIsRestoreOS() && _NfRestoreHasRadio())
        {
          _NfRestoreRunAntennaSelfCheck(_gDriver, 0);
        }
        if ((*(unsigned char *)(v4 + 3) & 1) == 0)
        {
          uint64_t v131 = _gDriver;
          int v133 = *(unsigned __int8 *)(v4 + 4);
          v132 = (const char *)(v4 + 4);
          v134 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v135 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v133)
          {
            if (v135) {
              v135(6, "%s:%i ", "_NFRestoreJcop", 587);
            }
            dispatch_get_specific(*v134);
            v136 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = "_NFRestoreJcop";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 587;
              _os_log_impl(&dword_237D7D000, v136, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
            }
            if (NFDriverLoadStack())
            {
              dispatch_get_specific(*v134);
              v137 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v137) {
                v137(3, "%s:%i Failed to load stack", "_NFRestoreJcop", 591);
              }
              dispatch_get_specific(*v134);
              v138 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(void *)&uint8_t buf[4] = "_NFRestoreJcop";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 591;
                _os_log_impl(&dword_237D7D000, v138, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
              }
              unsigned int v139 = *MEMORY[0x263F8BD70];
              uint64_t v140 = NFDriverGetStackBreadcrumb();
              v165 = (const char *)NFDriverSerialDebugLastMessage();
              _NFRestorePushError("com.apple.nfstack", v139, "Error 0x%04x at %s:%d: %llx %s", v139, "_NFRestoreJcop", 592, v140, v165);
              goto LABEL_209;
            }
            v143 = NfSecureElementOpen(v131, 1);
            if (!v143)
            {
              dispatch_get_specific(*v134);
              v153 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v153) {
                v153(3, "%s:%i Failed to open SE", "_NFRestoreJcop", 601);
              }
              dispatch_get_specific(*v134);
              v154 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(void *)&uint8_t buf[4] = "_NFRestoreJcop";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 601;
                _os_log_impl(&dword_237D7D000, v154, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open SE", buf, 0x12u);
              }
              uint64_t v8 = 9;
              goto LABEL_252;
            }
            v144 = v143;
            if (*v132)
            {
              dispatch_get_specific(*v134);
              v145 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v145) {
                v145(6, "%s:%i Running postflight: %s", "_NFRestoreRunPostFlight", 549, v132);
              }
              dispatch_get_specific(*v134);
              v146 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = "_NFRestoreRunPostFlight";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 549;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v132;
                _os_log_impl(&dword_237D7D000, v146, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Running postflight: %s", buf, 0x1Cu);
              }
              uint64_t v147 = NFDataCreateWithFile();
              if (v147)
              {
                v148 = (const char **)v147;
                size_t v149 = *(void *)(v147 + 8) + 1;
                v150 = (char *)malloc_type_calloc(1uLL, v149, 0x100004077774924uLL);
                strlcpy(v150, *v148, v149);
                uint64_t v8 = NfSecureElementScriptRun((uint64_t)v144, v150);
                if (v8)
                {
                  dispatch_get_specific(*v134);
                  v151 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                  if (v151) {
                    v151(3, "%s:%i Failed to run script", "_NFRestoreRunPostFlight", 565);
                  }
                  dispatch_get_specific(*v134);
                  v152 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446466;
                    *(void *)&uint8_t buf[4] = "_NFRestoreRunPostFlight";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 565;
                    _os_log_impl(&dword_237D7D000, v152, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to run script", buf, 0x12u);
                  }
                }
                free(v150);
                NFDataRelease();
                goto LABEL_251;
              }
              dispatch_get_specific(*v134);
              v159 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v159) {
                v159(3, "%s:%i Failed to open %s", "_NFRestoreRunPostFlight", 554, v132);
              }
              dispatch_get_specific(*v134);
              v160 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = "_NFRestoreRunPostFlight";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 554;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v132;
                _os_log_impl(&dword_237D7D000, v160, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open %s", buf, 0x1Cu);
              }
            }
            uint64_t v8 = 0;
LABEL_251:
            NfSecureElementClose(v144);
LABEL_252:
            NFDriverUnloadStackAndLeaveHWEnabled();
            goto LABEL_216;
          }
          if (v135) {
            v135(6, "%s:%i Nothing to do", "_NFRestoreJcop", 583);
          }
          dispatch_get_specific(*v134);
          v141 = NFSharedLogGetLogger();
          uint64_t v8 = 0;
          if (!os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_216;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreJcop";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 583;
          _os_log_impl(&dword_237D7D000, v141, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Nothing to do", buf, 0x12u);
        }
        uint64_t v8 = 0;
        goto LABEL_216;
      }
      int v90 = v89;
      dispatch_get_specific(*v86);
      v91 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v91) {
        v91(3, "%s:%i Failed to configure RSTN delay: %d", "_NFRestoreConfigureRSTNDelay", 1175, v90);
      }
      dispatch_get_specific(*v86);
      v92 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
LABEL_142:
        v99 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v100) {
          v100(3, "%s:%i Failed to configure RSTN delay..", "NFRestoreNfc", 1277);
        }
        dispatch_get_specific(*v99);
        v101 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "NFRestoreNfc";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1277;
          _os_log_impl(&dword_237D7D000, v101, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure RSTN delay..", buf, 0x12u);
        }
        unsigned int v102 = *MEMORY[0x263F8BD70];
        uint64_t v103 = NFDriverGetStackBreadcrumb();
        v104 = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v102, "Error 0x%04x at %s:%d: %llx %s", v102, "NFRestoreNfc", 1278, v103, v104);
        goto LABEL_147;
      }
      *(_DWORD *)v167 = 136446722;
      *(void *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
      *(_WORD *)&v167[12] = 1024;
      *(_DWORD *)&v167[14] = 1175;
      *(_WORD *)&v167[18] = 1024;
      *(_DWORD *)&v167[20] = v90;
      v93 = "%{public}s:%i Failed to configure RSTN delay: %d";
      v94 = v92;
      uint32_t v95 = 24;
    }
    else
    {
      v96 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v97 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v97) {
        v97(3, "%s:%i Failed to get controller info..", "_NFRestoreConfigureRSTNDelay", 1167);
      }
      dispatch_get_specific(*v96);
      v98 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        goto LABEL_142;
      }
      *(_DWORD *)v167 = 136446466;
      *(void *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
      *(_WORD *)&v167[12] = 1024;
      *(_DWORD *)&v167[14] = 1167;
      v93 = "%{public}s:%i Failed to get controller info..";
      v94 = v98;
      uint32_t v95 = 18;
    }
    _os_log_impl(&dword_237D7D000, v94, OS_LOG_TYPE_ERROR, v93, v167, v95);
    goto LABEL_142;
  }
  uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v12) {
    v12(3, "%s:%i Failed to load driver", "_NFRestore", 1439);
  }
  dispatch_get_specific(*v11);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "_NFRestore";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1439;
    _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
  }
  return 10;
}

void _NFRestoreGenericHardwareError(uint64_t a1, unsigned __int8 a2)
{
  *MEMORY[0x263F8BD70] = a2;
  unsigned int v2 = a2;
  uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
  Message = (const char *)NFDriverSerialDebugLastMessage();
  _NFRestorePushError("com.apple.nfstack", v2, "Error 0x%04x at %s:%d: %llx %s", v2, "_NFRestoreGenericHardwareError", 518, StackBreadcrumb, Message);
}

uint64_t _NfRestoreRunAntennaSelfCheck(uint64_t a1, char a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((NFProductIsSIP() & 1) != 0 || (NFProductIsNED() & 1) != 0 || NFProductIsDevBoard())
  {
    CFTypeID v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i This is a SIP, NED or Dev, skipping antenna test", "_NfRestoreRunAntennaSelfCheck", 245);
    }
    dispatch_get_specific(*v3);
    CFURLRef v5 = NFSharedLogGetLogger();
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v20 = "_NfRestoreRunAntennaSelfCheck";
      __int16 v21 = 1024;
      int v22 = 245;
      _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i This is a SIP, NED or Dev, skipping antenna test", buf, 0x12u);
      return 0;
    }
    return v6;
  }
  if (!NFDriverLoadStack())
  {
    int v11 = NFDriverAntennaSelfTest();
    if (v11)
    {
      int v12 = v11;
      if (v11 != 19)
      {
        uint64_t v13 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14) {
          v14(3, "%s:%i Failed to check antenna : 0x%x", "_NfRestoreRunAntennaSelfCheck", 259, v12);
        }
        dispatch_get_specific(*v13);
        __int16 v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          uint64_t v20 = "_NfRestoreRunAntennaSelfCheck";
          __int16 v21 = 1024;
          int v22 = 259;
          __int16 v23 = 1024;
          int v24 = v12;
          _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to check antenna : 0x%x", buf, 0x18u);
        }
        uint64_t v6 = 9;
        goto LABEL_31;
      }
    }
    else
    {
      CFArrayRef v16 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v17) {
        v17(6, "%s:%i TX LDO current is %d", "_NfRestoreRunAntennaSelfCheck", 262, 0);
      }
      dispatch_get_specific(*v16);
      int v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v20 = "_NfRestoreRunAntennaSelfCheck";
        __int16 v21 = 1024;
        int v22 = 262;
        __int16 v23 = 1024;
        int v24 = 0;
        _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i TX LDO current is %d", buf, 0x18u);
      }
      if (_NfRestoreHasRadio())
      {
        if (a2) {
          uint64_t v6 = 10;
        }
        else {
          uint64_t v6 = 0;
        }
        goto LABEL_31;
      }
    }
    uint64_t v6 = 0;
LABEL_31:
    NFDriverUnloadStackAndLeaveHWEnabled();
    return v6;
  }
  uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v9) {
    v9(3, "%s:%i Failed to load stack", "_NfRestoreRunAntennaSelfCheck", 251);
  }
  dispatch_get_specific(*v8);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v20 = "_NfRestoreRunAntennaSelfCheck";
    __int16 v21 = 1024;
    int v22 = 251;
    _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
  }
  return 9;
}

BOOL _NfRestoreHasRadio()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"nfcWithRadio", 0, 0);
    if (CFProperty)
    {
      CFDataRef v5 = CFProperty;
      CFTypeID v6 = CFGetTypeID(CFProperty);
      if (v6 == CFDataGetTypeID())
      {
        size_t Length = CFDataGetLength(v5);
        uint64_t v8 = malloc_type_calloc(1uLL, Length, 0x100004077774924uLL);
        BytePtr = CFDataGetBytePtr(v5);
        int v10 = memcmp(v8, BytePtr, Length);
        BOOL v11 = v10 != 0;
        int v12 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          if (v10) {
            v14 = "present";
          }
          else {
            v14 = "absent";
          }
          Logger(6, "%s:%i Radio %s.", "_NfRestoreHasRadio", 871, v14);
        }
        dispatch_get_specific(*v12);
        __int16 v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v10) {
            CFArrayRef v16 = "present";
          }
          else {
            CFArrayRef v16 = "absent";
          }
          *(_DWORD *)buf = 136446722;
          uint64_t v25 = "_NfRestoreHasRadio";
          __int16 v26 = 1024;
          int v27 = 871;
          __int16 v28 = 2080;
          v29 = v16;
          _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Radio %s.", buf, 0x1Cu);
        }
        free(v8);
      }
      else
      {
        BOOL v11 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      uint64_t v20 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21) {
        v21(6, "%s:%i No radio key, skipping RF settings.", "_NfRestoreHasRadio", 876);
      }
      dispatch_get_specific(*v20);
      int v22 = NFSharedLogGetLogger();
      BOOL v11 = 0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v25 = "_NfRestoreHasRadio";
        __int16 v26 = 1024;
        int v27 = 876;
        _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i No radio key, skipping RF settings.", buf, 0x12u);
        BOOL v11 = 0;
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    int v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18) {
      v18(3, "%s:%i Failed find IOKit service", "_NfRestoreHasRadio", 881);
    }
    dispatch_get_specific(*v17);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = "_NfRestoreHasRadio";
      __int16 v26 = 1024;
      int v27 = 881;
      _os_log_impl(&dword_237D7D000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

uint64_t NfRestoreReturnError()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  CFDictionaryRef v9 = (const __CFDictionary *)v0;
  uint64_t v171 = *MEMORY[0x263EF8340];
  if (_gError)
  {
    CFRelease((CFTypeRef)_gError);
    _gError = 0;
  }
  if (gNfContext)
  {
    int v10 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Context already exists", "NfRestoreReturnError", 1502);
    }
    dispatch_get_specific(*v10);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v138 = "NfRestoreReturnError";
      __int16 v139 = 1024;
      int v140 = 1502;
      _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", buf, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfRestoreReturnError", 1503);
    return 4;
  }
  gNfContext = (uint64_t)NfContextInit(v8, v6, v2);
  bzero(buf, 0x1810uLL);
  CFTypeRef cf = 0;
  *(void *)v152 = 0;
  bzero(&v165, 0x400uLL);
  int v14 = sysctlbyname("kern.bootargs", 0, (size_t *)v152, 0, 0);
  if (v14)
  {
    int v15 = v14;
    CFArrayRef v16 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17) {
      v17(3, "%s:%i Failed to read boot-args: %d", "NFRestoreParseBootArgs", 204, v15);
    }
    dispatch_get_specific(*v16);
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v157 = 136446722;
      CFDictionaryRef v158 = "NFRestoreParseBootArgs";
      __int16 v159 = 1024;
      int v160 = 204;
      __int16 v161 = 1024;
      LODWORD(v162) = v15;
      __int16 v19 = "%{public}s:%i Failed to read boot-args: %d";
LABEL_14:
      uint64_t v20 = v18;
      uint32_t v21 = 24;
LABEL_20:
      _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v157, v21);
    }
  }
  else if (*(void *)v152 < 0x401uLL)
  {
    if (*(void *)v152)
    {
      int v38 = sysctlbyname("kern.bootargs", &v165, (size_t *)v152, 0, 0);
      if (v38)
      {
        int v39 = v38;
        uint64_t v40 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        __int16 v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v41) {
          v41(3, "%s:%i Failed to read boot-args: %d", "NFRestoreParseBootArgs", 216, v39);
        }
        dispatch_get_specific(*v40);
        int v18 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v157 = 136446722;
          CFDictionaryRef v158 = "NFRestoreParseBootArgs";
          __int16 v159 = 1024;
          int v160 = 216;
          __int16 v161 = 1024;
          LODWORD(v162) = v39;
          __int16 v19 = "%{public}s:%i Failed to read boot-args: %d";
          goto LABEL_14;
        }
      }
      else
      {
        __lasts = 0;
        int v44 = strtok_r((char *)&v165, " ", &__lasts);
        if (v44)
        {
          __int16 v45 = (const void **)MEMORY[0x263F8C6C0];
          do
          {
            v135 = (char *)&unk_237D96C68;
            int v46 = strtok_r(v44, "=", &v135);
            if (v46) {
              BOOL v47 = v135 == 0;
            }
            else {
              BOOL v47 = 1;
            }
            if (!v47)
            {
              int v48 = v46;
              if (!strcmp(v46, "nfrestore-loop"))
              {
                dispatch_get_specific(*v45);
                uint32_t v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v49) {
                  v49(6, "%s:%i Found boot-arg \"%s\" = \"%s\"", "NFRestoreParseBootArgs", 228, v48, v135);
                }
                dispatch_get_specific(*v45);
                int v50 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  int v157 = 136446978;
                  CFDictionaryRef v158 = "NFRestoreParseBootArgs";
                  __int16 v159 = 1024;
                  int v160 = 228;
                  __int16 v161 = 2080;
                  v162 = v48;
                  __int16 v163 = 2080;
                  v164 = v135;
                  _os_log_impl(&dword_237D7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found boot-arg \"%s\" = \"%s\"", (uint8_t *)&v157, 0x26u);
                }
                v142 |= 2u;
                unsigned int v143 = atoi(v135);
              }
            }
            int v44 = strtok_r(0, " ", &__lasts);
          }
          while (v44);
        }
      }
    }
  }
  else
  {
    int v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23) {
      v23(3, "%s:%i Invalid boot-arg length: %zu", "NFRestoreParseBootArgs", 208, *(size_t *)v152);
    }
    dispatch_get_specific(*v22);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v157 = 136446722;
      CFDictionaryRef v158 = "NFRestoreParseBootArgs";
      __int16 v159 = 1024;
      int v160 = 208;
      __int16 v161 = 2048;
      v162 = *(const char **)v152;
      __int16 v19 = "%{public}s:%i Invalid boot-arg length: %zu";
      uint64_t v20 = v24;
      uint32_t v21 = 28;
      goto LABEL_20;
    }
  }
  bzero(&v165, 0x400uLL);
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v9, @"FirmwareBundleData");
  int v133 = v4;
  if (!Value)
  {
    CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(v9, @"FirmwareBundlePath");
    if (v29)
    {
      CFStringRef v30 = v29;
      if (!CFStringGetCStringPtr(v29, 0x8000100u)) {
        CFStringGetCString(v30, (char *)&v165, 1024, 0x8000100u);
      }
      uint64_t v31 = NFDataCreateWithFile();
      CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v33 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const UInt8 **)v31, *(void *)(v31 + 8), (CFAllocatorRef)*MEMORY[0x263EFFB28]);
      CFTypeRef cf = CFPropertyListCreateWithData(v32, v33, 0, 0, 0);
      CFRelease(v33);
      NFDataRelease();
      if (cf) {
        goto LABEL_73;
      }
      int v34 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35) {
        v35(3, "%s:%i Failed to parse bundle data", "NFRestoreParseParams", 363);
      }
      dispatch_get_specific(*v34);
      int v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v157 = 136446466;
        CFDictionaryRef v158 = "NFRestoreParseParams";
        __int16 v159 = 1024;
        int v160 = 363;
        _os_log_impl(&dword_237D7D000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse bundle data", (uint8_t *)&v157, 0x12u);
      }
      int v37 = 364;
    }
    else
    {
      CFStringRef v42 = (const __CFString *)CFDictionaryGetValue(v9, @"RootFilePath");
      if (!v42) {
        goto LABEL_73;
      }
      CFStringRef v43 = v42;
      bzero(&v157, 0x400uLL);
      if (CFStringGetCStringPtr(v43, 0x8000100u)) {
        __strlcpy_chk();
      }
      else {
        CFStringGetCString(v43, (char *)&v157, 1024, 0x8000100u);
      }
      if (!NfRestoreBundleScan((char *)&v157, (CFMutableDictionaryRef *)&cf)) {
        goto LABEL_73;
      }
      long long v51 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v52) {
        v52(3, "%s:%i Failed to scan %s", "NFRestoreParseParams", 375, (const char *)&v157);
      }
      dispatch_get_specific(*v51);
      long long v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v152 = 136446722;
        *(void *)&v152[4] = "NFRestoreParseParams";
        __int16 v153 = 1024;
        int v154 = 375;
        __int16 v155 = 2080;
        v156 = &v157;
        _os_log_impl(&dword_237D7D000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to scan %s", v152, 0x1Cu);
      }
      int v37 = 376;
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NFRestoreParseParams", v37);
LABEL_68:
    unsigned int v54 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v55) {
      v55(3, "%s:%i Failed to parse params", "NfRestoreReturnError", 1513);
    }
    dispatch_get_specific(*v54);
    v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      int v165 = 136446466;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1513;
      _os_log_impl(&dword_237D7D000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse params", (uint8_t *)&v165, 0x12u);
    }
    uint64_t v13 = 6;
    goto LABEL_203;
  }
  CFTypeRef cf = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], Value, 0, 0, 0);
  if (!cf)
  {
    __int16 v26 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27) {
      v27(3, "%s:%i Failed to parse bundle data", "NFRestoreParseParams", 348);
    }
    dispatch_get_specific(*v26);
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v157 = 136446466;
      CFDictionaryRef v158 = "NFRestoreParseParams";
      __int16 v159 = 1024;
      int v160 = 348;
      _os_log_impl(&dword_237D7D000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse bundle data", (uint8_t *)&v157, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NFRestoreParseParams", 349);
    goto LABEL_68;
  }
LABEL_73:
  CFStringRef v57 = (const __CFString *)CFDictionaryGetValue(v9, @"DevicePath");
  if (v57) {
    CFStringGetCString(v57, (char *)buf, 1024, 0x600u);
  }
  CFBooleanRef v58 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"InvokedFromCommandLine");
  if (v58) {
    BOOL v59 = CFBooleanGetValue(v58) != 0;
  }
  else {
    BOOL v59 = 0;
  }
  char v142 = v142 & 0xFE | v59;
  CFStringRef v60 = (const __CFString *)CFDictionaryGetValue(v9, @"NfcUpdateFile");
  if (v60) {
    CFStringGetCString(v60, v144, 1024, 0x600u);
  }
  else {
    v144[0] = 0;
  }
  CFStringRef v61 = (const __CFString *)CFDictionaryGetValue(v9, @"NfcRFSettingsFile");
  if (v61) {
    CFStringGetCString(v61, v145, 1024, 0x600u);
  }
  else {
    v145[0] = 0;
  }
  CFBooleanRef v62 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"FactoryInstall");
  if (v62) {
    BOOL v63 = CFBooleanGetValue(v62) != 0;
  }
  else {
    BOOL v63 = 0;
  }
  char v146 = v146 & 0xFE | v63;
  CFBooleanRef v64 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"kNfUpdateParamIntegrity");
  if (v64) {
    char v65 = 16 * (CFBooleanGetValue(v64) != 0);
  }
  else {
    char v65 = 0;
  }
  char v148 = v148 & 0xEF | v65;
  CFBooleanRef v66 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"kNfUpdateParamQueryFDRKey");
  if (v66) {
    char v67 = 2 * (CFBooleanGetValue(v66) != 0);
  }
  else {
    char v67 = 0;
  }
  char v146 = v146 & 0xFD | v67;
  CFBooleanRef v68 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"kNfUpdateAntennaSelfTest");
  if (v68) {
    char v69 = 4 * (CFBooleanGetValue(v68) != 0);
  }
  else {
    char v69 = 0;
  }
  char v146 = v146 & 0xFB | v69;
  CFStringRef v70 = (const __CFString *)CFDictionaryGetValue(v9, @"RestoreSystemPartition");
  if (v70) {
    CFStringGetCString(v70, v151, 1024, 0x600u);
  }
  else {
    v151[0] = 0;
  }
  CFNumberRef v71 = (const __CFNumber *)CFDictionaryGetValue(v9, @"NfcMaxFwDlRetries");
  if (v71) {
    CFNumberGetValue(v71, kCFNumberSInt8Type, v147);
  }
  else {
    v147[0] = 10;
  }
  CFBooleanRef v72 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"NfcForceFwDl");
  if (v72) {
    BOOL v73 = CFBooleanGetValue(v72) != 0;
  }
  else {
    BOOL v73 = 0;
  }
  v147[1] = v73;
  CFStringRef v74 = (const __CFString *)CFDictionaryGetValue(v9, @"JcopPostflightScript");
  if (v74) {
    CFStringGetCString(v74, v149, 1024, 0x600u);
  }
  else {
    v149[0] = 0;
  }
  CFBooleanRef v75 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"JcopTerminateApplets");
  if (v75) {
    BOOL v76 = CFBooleanGetValue(v75) != 0;
  }
  else {
    BOOL v76 = 0;
  }
  char v150 = v150 & 0xFE | v76;
  CFBooleanRef v77 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"JcopForceJCOPPostflightScript");
  if (v77) {
    char v78 = 2 * (CFBooleanGetValue(v77) != 0);
  }
  else {
    char v78 = 0;
  }
  char v150 = v150 & 0xFD | v78;
  CFBooleanRef v79 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"StockholmOnly");
  if (v79) {
    char v80 = 2 * (CFBooleanGetValue(v79) != 0);
  }
  else {
    char v80 = 0;
  }
  char v148 = v148 & 0xFD | v80;
  CFBooleanRef v81 = (const __CFBoolean *)CFDictionaryGetValue(v9, @"HammerfestOnly");
  if (v81) {
    char v82 = 4 * (CFBooleanGetValue(v81) != 0);
  }
  else {
    char v82 = 0;
  }
  char v148 = v148 & 0xFB | v82;
  uint64_t IsSupported = (uint64_t)CFDictionaryGetValue(v9, @"CLIRestore");
  if (IsSupported)
  {
    uint64_t IsSupported = CFBooleanGetValue((CFBooleanRef)IsSupported);
    char v84 = 8 * (IsSupported != 0);
  }
  else
  {
    char v84 = 0;
  }
  char v85 = v148;
  char v148 = v148 & 0xF7 | v84;
  if ((v85 & 2) != 0
    || (uint64_t IsSupported = NFHardwareInterfaceIsSupported("com.apple.spmi.nfc.hammerfest"), !IsSupported))
  {
    int v86 = 0;
  }
  else
  {
    uint64_t IsSupported = NFHardwareSkipSpmiReconfig("hammerfest-spmi");
    if ((IsSupported & 1) == 0)
    {
      uint64_t IsSupported = _NFRestoreShutdownNFCC(2);
      if ((IsSupported & 1) == 0)
      {
        v115 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v116 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v116) {
          v116(3, "%s:%i Failed to shut down Hammerfest", "NfRestoreReturnError", 1527);
        }
        dispatch_get_specific(*v115);
        v117 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          int v165 = 136446466;
          char v166 = "NfRestoreReturnError";
          __int16 v167 = 1024;
          int v168 = 1527;
          _os_log_impl(&dword_237D7D000, v117, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to shut down Hammerfest", (uint8_t *)&v165, 0x12u);
        }
        int v118 = 1528;
        goto LABEL_232;
      }
    }
    int v86 = 1;
  }
  if ((v148 & 4) != 0)
  {
    v87 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v88 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v88) {
      v88(6, "%s:%i Skipping Stockholm restore", "NfRestoreReturnError", 1538);
    }
    dispatch_get_specific(*v87);
    int v89 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      int v165 = 136446466;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1538;
      _os_log_impl(&dword_237D7D000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Skipping Stockholm restore", (uint8_t *)&v165, 0x12u);
    }
  }
  else
  {
    if ((v146 & 2) != 0)
    {
      int v90 = (char *)NfRestoreCopyUniqueFDRKey(IsSupported, v4);
      v91 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v90)
      {
        if (v92) {
          v92(6, "%s:%i FDR Key : %s", "NfRestoreReturnError", 1546, v90);
        }
        dispatch_get_specific(*v91);
        v93 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          int v165 = 136446722;
          char v166 = "NfRestoreReturnError";
          __int16 v167 = 1024;
          int v168 = 1546;
          __int16 v169 = 2080;
          *(void *)long long v170 = v90;
          _os_log_impl(&dword_237D7D000, v93, OS_LOG_TYPE_DEFAULT, "%{public}s:%i FDR Key : %s", (uint8_t *)&v165, 0x1Cu);
        }
        if ((NFIsRestoreOS() & 1) == 0) {
          fprintf((FILE *)*MEMORY[0x263EF8358], "FDR Key : %s\n", v90);
        }
        free(v90);
      }
      else
      {
        if (v92) {
          v92(3, "%s:%i No FDR Key !", "NfRestoreReturnError", 1552);
        }
        dispatch_get_specific(*v91);
        v94 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          int v165 = 136446466;
          char v166 = "NfRestoreReturnError";
          __int16 v167 = 1024;
          int v168 = 1552;
          _os_log_impl(&dword_237D7D000, v94, OS_LOG_TYPE_ERROR, "%{public}s:%i No FDR Key !", (uint8_t *)&v165, 0x12u);
        }
        if ((NFIsRestoreOS() & 1) == 0) {
          fwrite("No FDR Key !\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x263EF8358]);
        }
      }
    }
    else if ((v148 & 0x10) != 0)
    {
      NfRestoreRunIntegrityCheck(v4);
    }
    uint32_t v95 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v96 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v96) {
      v96(6, "%s:%i **************** Restoring Stockholm ****************", "NfRestoreReturnError", 1568);
    }
    dispatch_get_specific(*v95);
    v97 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      int v165 = 136446466;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1568;
      _os_log_impl(&dword_237D7D000, v97, OS_LOG_TYPE_DEFAULT, "%{public}s:%i **************** Restoring Stockholm ****************", (uint8_t *)&v165, 0x12u);
    }
    if ((v142 & 2) != 0)
    {
      unsigned int v102 = 1;
      while (1)
      {
        dispatch_get_specific(*v95);
        uint64_t v103 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v103) {
          v103(6, "%s:%i Iteration %d of %d", "NfRestoreReturnError", 1573, v102, v143);
        }
        dispatch_get_specific(*v95);
        v104 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          int v165 = 136446978;
          char v166 = "NfRestoreReturnError";
          __int16 v167 = 1024;
          int v168 = 1573;
          __int16 v169 = 1024;
          *(_DWORD *)long long v170 = v102;
          *(_WORD *)&v170[4] = 1024;
          *(_DWORD *)&v170[6] = v143;
          _os_log_impl(&dword_237D7D000, v104, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Iteration %d of %d", (uint8_t *)&v165, 0x1Eu);
        }
        uint64_t v105 = _NFRestore((uint64_t)buf, cf);
        if (v105) {
          break;
        }
        ++v102;
        if (v143 && v102 > v143) {
          goto LABEL_169;
        }
      }
      uint64_t v13 = v105;
      dispatch_get_specific(*v95);
      unsigned int v114 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v114) {
        v114(3, "%s:%i Failed at iteration %d", "NfRestoreReturnError", 1575, v102);
      }
      dispatch_get_specific(*v95);
      v100 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
        goto LABEL_203;
      }
      int v165 = 136446722;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1575;
      __int16 v169 = 1024;
      *(_DWORD *)long long v170 = v102;
      v101 = "%{public}s:%i Failed at iteration %d";
      goto LABEL_184;
    }
    uint64_t v98 = _NFRestore((uint64_t)buf, cf);
    if (v98)
    {
      uint64_t v13 = v98;
      dispatch_get_specific(*v95);
      v99 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v99) {
        v99(3, "%s:%i Failed %d", "NfRestoreReturnError", 1583, v13);
      }
      dispatch_get_specific(*v95);
      v100 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
        goto LABEL_203;
      }
      int v165 = 136446722;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1583;
      __int16 v169 = 1024;
      *(_DWORD *)long long v170 = v13;
      v101 = "%{public}s:%i Failed %d";
      goto LABEL_184;
    }
  }
LABEL_169:
  if ((v148 & 2) != 0)
  {
    v111 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v112) {
      v112(6, "%s:%i Skipping Hammerfest restore.", "NfRestoreReturnError", 1591);
    }
    dispatch_get_specific(*v111);
    v113 = NFSharedLogGetLogger();
    uint64_t v13 = 0;
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_203;
    }
    int v165 = 136446466;
    char v166 = "NfRestoreReturnError";
    __int16 v167 = 1024;
    int v168 = 1591;
LABEL_201:
    _os_log_impl(&dword_237D7D000, v113, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Skipping Hammerfest restore.", (uint8_t *)&v165, 0x12u);
    goto LABEL_202;
  }
  if (!v86)
  {
LABEL_202:
    uint64_t v13 = 0;
    goto LABEL_203;
  }
  CFStringRef v106 = (const __CFString *)CFDictionaryGetValue(v9, @"AuxiliaryDevicePath");
  if (v106) {
    CFStringGetCString(v106, v141, 1024, 0x600u);
  }
  v148 |= 1u;
  CFDictionaryRef v107 = (const __CFDictionary *)CFDictionaryGetValue(v9, @"StockholmOptions");
  if (v107)
  {
    CFDictionaryRef v108 = v107;
    CFBooleanRef v109 = (const __CFBoolean *)CFDictionaryGetValue(v107, @"RestoreHammerfest");
    if (v109) {
      BOOL v110 = CFBooleanGetValue(v109) != 0;
    }
    else {
      BOOL v110 = 0;
    }
    char v148 = v148 & 0xFE | v110;
    CFStringRef v119 = (const __CFString *)CFDictionaryGetValue(v108, @"HammerfestFirmwareType");
    if (v119 && CFStringCompare(v119, @"Manufacturing", 1uLL) == kCFCompareEqualTo) {
      char v120 = v146 | 1;
    }
    else {
      char v120 = v146 & 0xFE;
    }
    char v146 = v120;
  }
  v149[0] = 0;
  v150 &= 0xFCu;
  char v121 = v148;
  v122 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  v123 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if ((v121 & 1) == 0)
  {
    if (v123) {
      v123(5, "%s:%i Skipping Hammerfest restore.", "NfRestoreReturnError", 1603);
    }
    dispatch_get_specific(*v122);
    v113 = NFSharedLogGetLogger();
    uint64_t v13 = 0;
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_203;
    }
    int v165 = 136446466;
    char v166 = "NfRestoreReturnError";
    __int16 v167 = 1024;
    int v168 = 1603;
    goto LABEL_201;
  }
  if (v123) {
    v123(6, "%s:%i **************** Restoring Hammerfest ****************", "NfRestoreReturnError", 1607);
  }
  dispatch_get_specific(*v122);
  v125 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    int v165 = 136446466;
    char v166 = "NfRestoreReturnError";
    __int16 v167 = 1024;
    int v168 = 1607;
    _os_log_impl(&dword_237D7D000, v125, OS_LOG_TYPE_DEFAULT, "%{public}s:%i **************** Restoring Hammerfest ****************", (uint8_t *)&v165, 0x12u);
  }
  if (!NFHardwareSkipSpmiReconfig("hammerfest-spmi") && (_NFRestoreShutdownNFCC(1) & 1) == 0)
  {
    dispatch_get_specific(*v122);
    v130 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v130) {
      v130(3, "%s:%i Failed to shut down Stockholm", "NfRestoreReturnError", 1610);
    }
    dispatch_get_specific(*v122);
    uint64_t v131 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      int v165 = 136446466;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1610;
      _os_log_impl(&dword_237D7D000, v131, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to shut down Stockholm", (uint8_t *)&v165, 0x12u);
    }
    int v118 = 1611;
LABEL_232:
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfRestoreReturnError", v118);
    uint64_t v13 = 5;
    goto LABEL_203;
  }
  if ((v142 & 2) == 0)
  {
    uint64_t v13 = _NFRestore((uint64_t)buf, cf);
    if (v13) {
      goto LABEL_203;
    }
LABEL_225:
    if ((v148 & 8) != 0)
    {
      _NfRestoreResetFailForwardDefault("FailForwardNeeded");
      _NfRestoreResetFailForwardDefault("FailForwardInProgress");
      _NfRestoreResetFailForwardDefault("FailForwardDetectedTimestamp");
      _NfRestoreResetFailForwardDefault("FailForwardLastAttemptTimestamp");
    }
    goto LABEL_202;
  }
  unsigned int v126 = 1;
  while (1)
  {
    dispatch_get_specific(*v122);
    v127 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v127) {
      v127(6, "%s:%i Iteration %d of %d", "NfRestoreReturnError", 1620, v126, v143);
    }
    dispatch_get_specific(*v122);
    v128 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      int v165 = 136446978;
      char v166 = "NfRestoreReturnError";
      __int16 v167 = 1024;
      int v168 = 1620;
      __int16 v169 = 1024;
      *(_DWORD *)long long v170 = v126;
      *(_WORD *)&v170[4] = 1024;
      *(_DWORD *)&v170[6] = v143;
      _os_log_impl(&dword_237D7D000, v128, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Iteration %d of %d", (uint8_t *)&v165, 0x1Eu);
    }
    uint64_t v129 = _NFRestore((uint64_t)buf, cf);
    if (v129) {
      break;
    }
    ++v126;
    if (v143 && v126 > v143) {
      goto LABEL_225;
    }
  }
  uint64_t v13 = v129;
  dispatch_get_specific(*v122);
  v132 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v132) {
    v132(3, "%s:%i Failed at iteration %d", "NfRestoreReturnError", 1622, v126);
  }
  dispatch_get_specific(*v122);
  v100 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
    goto LABEL_203;
  }
  int v165 = 136446722;
  char v166 = "NfRestoreReturnError";
  __int16 v167 = 1024;
  int v168 = 1622;
  __int16 v169 = 1024;
  *(_DWORD *)long long v170 = v126;
  v101 = "%{public}s:%i Failed at iteration %d";
LABEL_184:
  _os_log_impl(&dword_237D7D000, v100, OS_LOG_TYPE_ERROR, v101, (uint8_t *)&v165, 0x18u);
LABEL_203:
  if (cf) {
    CFRelease(cf);
  }
  NfContextFree((void *)gNfContext);
  gNfContext = 0;
  if (v133) {
    *int v133 = (CFErrorRef)_gError;
  }
  return v13;
}

uint64_t _NFRestoreShutdownNFCC(int a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  NFRestoreGetDriverFlags();
  if (_gDriver)
  {
    uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      if (a1 == 2) {
        uint64_t v4 = "Hammerfest";
      }
      else {
        uint64_t v4 = "Stockholm";
      }
      Logger(3, "%s:%i %s driver already open - can't interrupt", "_NFRestoreShutdownNFCC", 1392, v4);
    }
    dispatch_get_specific(*v2);
    uint64_t v5 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    if (a1 == 2) {
      uint64_t v6 = "Hammerfest";
    }
    else {
      uint64_t v6 = "Stockholm";
    }
    *(_DWORD *)buf = 136446722;
    CFArrayRef v16 = "_NFRestoreShutdownNFCC";
    __int16 v17 = 1024;
    int v18 = 1392;
    __int16 v19 = 2080;
    uint64_t v20 = v6;
    uint64_t v7 = "%{public}s:%i %s driver already open - can't interrupt";
    uint64_t v8 = v5;
    uint32_t v9 = 28;
    goto LABEL_12;
  }
  if (NFDriverOpen())
  {
    uint64_t v10 = NFDriverNFCCPowerOff();
    NFDriverClose();
    return v10;
  }
  int v12 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v13) {
    v13(3, "%s:%i Failed to open driver", "_NFRestoreShutdownNFCC", 1398);
  }
  dispatch_get_specific(*v12);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    CFArrayRef v16 = "_NFRestoreShutdownNFCC";
    __int16 v17 = 1024;
    int v18 = 1398;
    uint64_t v7 = "%{public}s:%i Failed to open driver";
    uint64_t v8 = v14;
    uint32_t v9 = 18;
LABEL_12:
    _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
  }
  return 0;
}

uint64_t NfRestoreCopyUniqueFDRKey(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NFLogSetLogger();
  NFRestoreGetDriverFlags();
  uint64_t v3 = _gDriver;
  if (_gDriver || (_gDriver = NFDriverOpen()) != 0)
  {
    code[0] = 0;
    uint64_t UniqueFDRKey = NFDriverGetUniqueFDRKey();
    if (UniqueFDRKey) {
      BOOL v5 = code[0] == 0;
    }
    else {
      BOOL v5 = 0;
    }
    int v6 = !v5;
    if (a2)
    {
      if (v6)
      {
        CFErrorRef v7 = CFErrorCreate(0, @"com.apple.nfstack", 0, 0);
        *a2 = v7;
        if (v7) {
          CFAutorelease(v7);
        }
      }
    }
    if (!v3)
    {
      NFDriverClose();
      _gDriver = 0;
    }
  }
  else
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to load driver", "NfRestoreCopyUniqueFDRKey", 1675);
    }
    dispatch_get_specific(*v8);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      code[0] = 136446466;
      *(void *)&code[1] = "NfRestoreCopyUniqueFDRKey";
      __int16 v14 = 1024;
      int v15 = 1675;
      _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", (uint8_t *)code, 0x12u);
    }
    if (a2)
    {
      CFErrorRef v11 = CFErrorCreate(0, @"com.apple.nfstack", 9, 0);
      *a2 = v11;
      if (v11) {
        CFAutorelease(v11);
      }
    }
    return 0;
  }
  return UniqueFDRKey;
}

void NfRestoreRunIntegrityCheck(CFErrorRef *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  NFRestoreGetDriverFlags();
  _gDriver = NFDriverOpen();
  if (_gDriver)
  {
    NFDriverRunIntegrityDebug();
    if (NFIsInternalBuild())
    {
      uint64_t v2 = NFDriverDebugDumpMemory();
      if (v2)
      {
        uint64_t v3 = (_DWORD *)v2;
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(6, "%s:%i EEPROM User Area Start:0x%08X End:0x%08X", "NfRestoreRunIntegrityCheck", 301, *v3, v3[1]);
        }
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        BOOL v5 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = *v3;
          int v7 = v3[1];
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "NfRestoreRunIntegrityCheck";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 301;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v6;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v7;
          _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i EEPROM User Area Start:0x%08X End:0x%08X", buf, 0x1Eu);
        }
        uint64_t v8 = (uint64_t *)*((void *)v3 + 1);
        if (v8)
        {
          long long v36 = 0u;
          memset(buf, 0, sizeof(buf));
          unint64_t v9 = v8[1];
          uint64_t v26 = *v8;
          uint64_t v10 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          CFErrorRef v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          dispatch_get_specific(*v10);
          int v12 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void *)(*((void *)v3 + 1) + 8);
            *(_DWORD *)int v27 = 136315906;
            __int16 v28 = (uint8_t *)"NfRestoreRunIntegrityCheck";
            __int16 v29 = 1024;
            int v30 = 304;
            __int16 v31 = 2082;
            CFAllocatorRef v32 = "EEPROM User Area: ";
            __int16 v33 = 2048;
            uint64_t v34 = v13;
            _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v27, 0x26u);
          }
          if (v11) {
            v11(6, "%s:%i %s %lu bytes :", "NfRestoreRunIntegrityCheck", 304, "EEPROM User Area: ", *(void *)(*((void *)v3 + 1) + 8));
          }
          uint64_t v25 = v3;
          if (v9)
          {
            uint64_t v14 = 0;
            do
            {
              unint64_t v15 = 0;
              uint64_t v16 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v14)];
              do
              {
                unint64_t v17 = v15 + 1;
                unint64_t v18 = v15 + 1 + v14;
                int v19 = sprintf(v16, "0x%02X ", *(unsigned __int8 *)(v26 + v14 + v15));
                if (v15 > 6) {
                  break;
                }
                v16 += v19;
                ++v15;
              }
              while (v18 < v9);
              dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
              uint64_t v20 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)int v27 = 136446210;
                __int16 v28 = buf;
                _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", v27, 0xCu);
              }
              if (v11) {
                v11(6, "%s", (const char *)buf);
              }
              v14 += v17;
            }
            while (v18 < v9);
          }
          uint64_t v3 = v25;
          NFDataRelease();
        }
        free(v3);
      }
    }
    NFDriverClose();
    _gDriver = 0;
  }
  else
  {
    uint64_t v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22) {
      v22(3, "%s:%i Failed to load driver", "NfRestoreRunIntegrityCheck", 288);
    }
    dispatch_get_specific(*v21);
    __int16 v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "NfRestoreRunIntegrityCheck";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 288;
      _os_log_impl(&dword_237D7D000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
    }
    if (a1)
    {
      CFErrorRef v24 = CFErrorCreate(0, @"com.apple.nfstack", 9, 0);
      *a1 = v24;
      if (v24) {
        CFAutorelease(v24);
      }
    }
  }
}

void _NfRestoreResetFailForwardDefault(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  CFPreferencesSetAppValue(v1, 0, @"com.apple.nfcacd");
  CFPreferencesAppSynchronize(@"com.apple.nfcacd");
  CFRelease(@"com.apple.nfcacd");

  CFRelease(v1);
}

uint64_t NfRestore()
{
  return NfRestoreReturnError();
}

uint64_t _NFRestoreNfcFirmwareStep(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = (unsigned char *)(a2 + 4104);
  if (*(unsigned char *)(a2 + 2056))
  {
    BOOL v5 = (const char *)(a2 + 2056);
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i %s", "_NFRestoreNfcFirmwareStep", 903, v5);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFRestoreNfcFirmwareStep";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 903;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v5;
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
    }
    if (NFDataCreateWithFile())
    {
      if (NFDriverUpdateFirmware())
      {
        dispatch_get_specific(*v6);
        unint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v9) {
          v9(3, "%s:%i Failed to install FW", "_NFRestoreNfcFirmwareStep", 914);
        }
        dispatch_get_specific(*v6);
        uint64_t v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "_NFRestoreNfcFirmwareStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 914;
          _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to install FW", buf, 0x12u);
        }
        unsigned int v11 = *MEMORY[0x263F8BD70];
        NFDriverGetStackBreadcrumb();
        NFDriverSerialDebugLastMessage();
LABEL_13:
        _NFRestorePushError("com.apple.nfstack", v11, "Error 0x%04x at %s:%d: %llx %s");
        return 5;
      }
      return 0;
    }
    dispatch_get_specific(*v6);
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Failed to read file: %s", "_NFRestoreNfcFirmwareStep", 907, v5);
    }
    dispatch_get_specific(*v6);
    unint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFRestoreNfcFirmwareStep";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 907;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v5;
      _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read file: %s", buf, 0x1Cu);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcFirmwareStep", 908);
    return 7;
  }
  else
  {
    if (!a3) {
      return 0;
    }
    memset(buf, 0, 28);
    if (NFDriverGetControllerInfo())
    {
      if (*v4) {
        __int16 v23 = "fw-mfg";
      }
      else {
        __int16 v23 = "fw";
      }
      CFErrorRef v24 = "fury-fw-mfg";
      if ((*v4 & 1) == 0) {
        CFErrorRef v24 = "fury-fw";
      }
      if (v4[3]) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v23;
      }
      CFStringRef v26 = CFStringCreateWithCString(0, v25, 0x8000100u);
      CFTypeID v27 = CFGetTypeID(a3);
      if (v27 != CFDictionaryGetTypeID())
      {
        __int16 v33 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v34) {
          v34(3, "%s:%i Incorrect bundle", "_NFRestoreNfcFirmwareStep", 958);
        }
        dispatch_get_specific(*v33);
        int v35 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v39 = 136446466;
          uint64_t v40 = "_NFRestoreNfcFirmwareStep";
          __int16 v41 = 1024;
          int v42 = 958;
          _os_log_impl(&dword_237D7D000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i Incorrect bundle", v39, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcFirmwareStep", 959);
        CFRelease(v26);
        return 5;
      }
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a3, v26);
      CFRelease(v26);
      if (!Value)
      {
        long long v36 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v37) {
          v37(3, "%s:%i Bundle is missing folder: %s", "_NFRestoreNfcFirmwareStep", 968, v25);
        }
        dispatch_get_specific(*v36);
        int v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v39 = 136446722;
          uint64_t v40 = "_NFRestoreNfcFirmwareStep";
          __int16 v41 = 1024;
          int v42 = 968;
          __int16 v43 = 2080;
          int v44 = v25;
          _os_log_impl(&dword_237D7D000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: %s", v39, 0x1Cu);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d");
        return 5;
      }
      uint64_t v12 = NFRestoreNfcForController(a1, buf, v4[3] & 1, *v4 & 1, Value);
      if (v12)
      {
        __int16 v29 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        int v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v30) {
          v30(3, "%s:%i Failed to update FW: %s", "_NFRestoreNfcFirmwareStep", 983, v25);
        }
        dispatch_get_specific(*v29);
        __int16 v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v39 = 136446722;
          uint64_t v40 = "_NFRestoreNfcFirmwareStep";
          __int16 v41 = 1024;
          int v42 = 983;
          __int16 v43 = 2080;
          int v44 = v25;
          _os_log_impl(&dword_237D7D000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update FW: %s", v39, 0x1Cu);
        }
      }
    }
    else
    {
      int IsDevBoard = NFProductIsDevBoard();
      unint64_t v18 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (!IsDevBoard)
      {
        if (v19) {
          v19(3, "%s:%i Failed to get driver info", "_NFRestoreNfcFirmwareStep", 938);
        }
        dispatch_get_specific(*v18);
        CFAllocatorRef v32 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v39 = 136446466;
          uint64_t v40 = "_NFRestoreNfcFirmwareStep";
          __int16 v41 = 1024;
          int v42 = 938;
          _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", v39, 0x12u);
        }
        unsigned int v11 = *MEMORY[0x263F8BD70];
        NFDriverGetStackBreadcrumb();
        NFDriverSerialDebugLastMessage();
        goto LABEL_13;
      }
      if (v19) {
        v19(4, "%s:%i Failed to get driver info", "_NFRestoreNfcFirmwareStep", 933);
      }
      dispatch_get_specific(*v18);
      uint64_t v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v39 = 136446466;
        uint64_t v40 = "_NFRestoreNfcFirmwareStep";
        __int16 v41 = 1024;
        int v42 = 933;
        _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", v39, 0x12u);
      }
      dispatch_get_specific(*v18);
      uint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21) {
        v21(4, "%s:%i Assuming HW not present", "_NFRestoreNfcFirmwareStep", 934);
      }
      dispatch_get_specific(*v18);
      int v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v39 = 136446466;
        uint64_t v40 = "_NFRestoreNfcFirmwareStep";
        __int16 v41 = 1024;
        int v42 = 934;
        _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Assuming HW not present", v39, 0x12u);
      }
      return 1;
    }
  }
  return v12;
}

void _NFRestoreDebugNFCCError()
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  NFDriverRunIntegrityDebug();
  if (NFIsInternalBuild())
  {
    uint64_t v0 = NFDriverDebugDumpMemory();
    if (v0)
    {
      CFStringRef v1 = (_DWORD *)v0;
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(6, "%s:%i EEPROM User Area Start:0x%08X End:0x%08X", "_NFRestoreDebugNFCCError", 322, *v1, v1[1]);
      }
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v3 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = *v1;
        int v5 = v1[1];
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "_NFRestoreDebugNFCCError";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 322;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v5;
        _os_log_impl(&dword_237D7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i EEPROM User Area Start:0x%08X End:0x%08X", buf, 0x1Eu);
      }
      int v6 = (uint64_t *)*((void *)v1 + 1);
      if (v6)
      {
        long long v30 = 0u;
        memset(buf, 0, sizeof(buf));
        unint64_t v7 = v6[1];
        uint64_t v20 = *v6;
        uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        unint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        dispatch_get_specific(*v8);
        uint64_t v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(*((void *)v1 + 1) + 8);
          *(_DWORD *)uint64_t v21 = 136315906;
          int v22 = (uint8_t *)"_NFRestoreDebugNFCCError";
          __int16 v23 = 1024;
          int v24 = 324;
          __int16 v25 = 2082;
          CFStringRef v26 = "EEPROM User Area: ";
          __int16 v27 = 2048;
          uint64_t v28 = v11;
          _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v21, 0x26u);
        }
        if (v9) {
          v9(6, "%s:%i %s %lu bytes :", "_NFRestoreDebugNFCCError", 324, "EEPROM User Area: ", *(void *)(*((void *)v1 + 1) + 8));
        }
        int v19 = v1;
        if (v7)
        {
          uint64_t v12 = 0;
          do
          {
            unint64_t v13 = 0;
            uint64_t v14 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v12)];
            do
            {
              unint64_t v15 = v13 + 1;
              unint64_t v16 = v13 + 1 + v12;
              int v17 = sprintf(v14, "0x%02X ", *(unsigned __int8 *)(v20 + v12 + v13));
              if (v13 > 6) {
                break;
              }
              v14 += v17;
              ++v13;
            }
            while (v16 < v7);
            dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
            unint64_t v18 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v21 = 136446210;
              int v22 = buf;
              _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", v21, 0xCu);
            }
            if (v9) {
              v9(6, "%s", (const char *)buf);
            }
            v12 += v15;
          }
          while (v16 < v7);
        }
        CFStringRef v1 = v19;
        NFDataRelease();
      }
      free(v1);
    }
  }
}

uint64_t NFRestoreNfcForController(uint64_t a1, _DWORD *a2, int a3, int a4, const __CFDictionary *a5)
{
  *(void *)&v71[5] = *MEMORY[0x263EF8340];
  switch(a2[1])
  {
    case 5:
      __int16 v29 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 630, *a2, a2[2]);
      }
      dispatch_get_specific(*v29);
      uint64_t v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = *a2;
        int v33 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 630;
        __int16 v70 = 1024;
        v71[0] = v32;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v33;
        _os_log_impl(&dword_237D7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      if (a2[2] == 2)
      {
        uint64_t v14 = "PN552_FW_02_01_6A_rev125914.bin";
        unint64_t v15 = "PN552_FW_02_01_AF_59162.bin";
        goto LABEL_38;
      }
      dispatch_get_specific(*v29);
      BOOL v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v63) {
        v63(3, "%s:%i Unexpected ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 645, *a2, a2[2]);
      }
      dispatch_get_specific(*v29);
      long long v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
      int v64 = *a2;
      int v65 = a2[2];
      *(_DWORD *)buf = 136446978;
      char v67 = "NFRestoreNfcFirmwareNameForController";
      __int16 v68 = 1024;
      int v69 = 645;
      __int16 v70 = 1024;
      v71[0] = v64;
      LOWORD(v71[1]) = 1024;
      *(_DWORD *)((char *)&v71[1] + 2) = v65;
      int v39 = "%{public}s:%i Unexpected ROM version %02x.%02x";
      goto LABEL_73;
    case 7:
    case 8:
      int v24 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25) {
        v25(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 654, *a2, a2[2]);
      }
      dispatch_get_specific(*v24);
      CFStringRef v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = *a2;
        int v28 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 654;
        __int16 v70 = 1024;
        v71[0] = v27;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v28;
        _os_log_impl(&dword_237D7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      uint64_t v14 = "SN100V_FW_A3_01_01_AB_rev155589.bin";
      unint64_t v15 = "SN100V_FW_A3_01_01_C3_rev78599.bin";
      goto LABEL_38;
    case 0xA:
    case 0xB:
    case 0xC:
      unint64_t v16 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v17) {
        v17(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 669, *a2, a2[2]);
      }
      dispatch_get_specific(*v16);
      unint64_t v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *a2;
        int v20 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 669;
        __int16 v70 = 1024;
        v71[0] = v19;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v20;
        _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      uint64_t v21 = "SN200V_FW_B1_02_01_AC_rev155587.bin";
      if (a4) {
        uint64_t v21 = "SN200V_FW_B1_02_01_FA_rev124452.bin";
      }
      int v22 = "SN200V_FURY_FW_B1_02_01_FA_rev149466.bin";
      if (!a4) {
        int v22 = "SN200V_FURY_FW_B1_02_01_A2_rev150255.bin";
      }
      if (a3) {
        __int16 v23 = v22;
      }
      else {
        __int16 v23 = v21;
      }
      goto LABEL_41;
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
      unint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10) {
        v10(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 697, *a2, a2[2]);
      }
      dispatch_get_specific(*v9);
      uint64_t v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *a2;
        int v13 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 697;
        __int16 v70 = 1024;
        v71[0] = v12;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v13;
        _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      uint64_t v14 = "SN300V_FW_B0_02_01_5D_rev155583.bin";
      unint64_t v15 = "SN300V_FW_B0_02_01_EE_rev152118.bin";
      goto LABEL_38;
    case 0x12:
      uint64_t v40 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v41) {
        v41(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 710, *a2, a2[2]);
      }
      dispatch_get_specific(*v40);
      int v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = *a2;
        int v44 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 710;
        __int16 v70 = 1024;
        v71[0] = v43;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v44;
        _os_log_impl(&dword_237D7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      uint64_t v14 = "SE310S_FW_A0_01_01_20_rev151695.bin";
      unint64_t v15 = "SE310S_FW_A0_01_01_BE_rev150106.bin";
LABEL_38:
      if (a4) {
        __int16 v23 = v15;
      }
      else {
        __int16 v23 = v14;
      }
      goto LABEL_41;
    case 0x14:
      CFBooleanRef v58 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      BOOL v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v59) {
        v59(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 721, *a2, a2[2]);
      }
      dispatch_get_specific(*v58);
      CFStringRef v60 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        int v61 = *a2;
        int v62 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 721;
        __int16 v70 = 1024;
        v71[0] = v61;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v62;
        _os_log_impl(&dword_237D7D000, v60, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      if (a4) {
        __int16 v23 = "SN200V_FURY_FW_B1_02_01_FA_rev149466.bin";
      }
      else {
        __int16 v23 = "SN200V_FURY_FW_B1_02_01_A2_rev150255.bin";
      }
      if ((a3 & 1) == 0) {
        goto LABEL_74;
      }
LABEL_41:
      __int16 v45 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v46) {
        v46(6, "%s:%i Selected file %s", "NFRestoreNfcForController", 831, v23);
      }
      dispatch_get_specific(*v45);
      BOOL v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        char v67 = "NFRestoreNfcForController";
        __int16 v68 = 1024;
        int v69 = 831;
        __int16 v70 = 2080;
        *(void *)CFNumberRef v71 = v23;
        _os_log_impl(&dword_237D7D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Selected file %s", buf, 0x1Cu);
      }
      CFStringRef v48 = CFStringCreateWithCString(0, v23, 0x8000100u);
      if (NFRestoreDictionaryCopyDataForKey(a5, v48))
      {
        if (NFDriverUpdateFirmware())
        {
          dispatch_get_specific(*v45);
          uint32_t v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v49) {
            v49(3, "%s:%i Failed to install %s", "NFRestoreNfcForController", 842, v23);
          }
          dispatch_get_specific(*v45);
          int v50 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            char v67 = "NFRestoreNfcForController";
            __int16 v68 = 1024;
            int v69 = 842;
            __int16 v70 = 2080;
            *(void *)CFNumberRef v71 = v23;
            _os_log_impl(&dword_237D7D000, v50, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to install %s", buf, 0x1Cu);
          }
          unsigned int v51 = *MEMORY[0x263F8BD70];
          uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
          Message = (const char *)NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v51, "Error 0x%04x at %s:%d: %llx %s", v51, "NFRestoreNfcForController", 843, StackBreadcrumb, Message);
          uint64_t v54 = 5;
        }
        else
        {
          uint64_t v54 = 0;
        }
      }
      else
      {
        dispatch_get_specific(*v45);
        uint64_t v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v55) {
          v55(3, "%s:%i No data found for %s", "NFRestoreNfcForController", 836, v23);
        }
        dispatch_get_specific(*v45);
        v56 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          char v67 = "NFRestoreNfcForController";
          __int16 v68 = 1024;
          int v69 = 836;
          __int16 v70 = 2080;
          *(void *)CFNumberRef v71 = v23;
          _os_log_impl(&dword_237D7D000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i No data found for %s", buf, 0x1Cu);
        }
        uint64_t v54 = 7;
      }
      NFDataRelease();
      CFRelease(v48);
      break;
    default:
      uint64_t v34 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35) {
        v35(3, "%s:%i Unexpected Si version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 735, *a2, a2[2]);
      }
      dispatch_get_specific(*v34);
      long long v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v37 = *a2;
        int v38 = a2[2];
        *(_DWORD *)buf = 136446978;
        char v67 = "NFRestoreNfcFirmwareNameForController";
        __int16 v68 = 1024;
        int v69 = 735;
        __int16 v70 = 1024;
        v71[0] = v37;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v38;
        int v39 = "%{public}s:%i Unexpected Si version %02x.%02x";
LABEL_73:
        _os_log_impl(&dword_237D7D000, v36, OS_LOG_TYPE_ERROR, v39, buf, 0x1Eu);
      }
LABEL_74:
      uint64_t v54 = 7;
      break;
  }
  return v54;
}

void _AddEntriesIntoDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t NfSecureElementScriptRunLine(uint64_t a1, char *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  bzero(__str, 0x800uLL);
  __s = 0;
  __lasts = 0;
  uint64_t v3 = a2;
  uint64_t v4 = MEMORY[0x263EF8318];
  do
  {
    while (1)
    {
      unsigned int v6 = *v3++;
      unsigned int v5 = v6;
      if ((v6 & 0x80000000) != 0) {
        break;
      }
      if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x4000) == 0) {
        goto LABEL_6;
      }
    }
  }
  while (__maskrune(v5, 0x4000uLL));
LABEL_6:
  if (!v5) {
    return 0;
  }
  __strlcpy_chk();
  strtok_r(__str, " ", &__lasts);
  if (__lasts)
  {
    if (strlen(__lasts) < 5)
    {
      __s = __lasts;
      goto LABEL_13;
    }
    if (*__lasts == 42)
    {
      __s = __lasts + 1;
LABEL_13:
      __lasts = 0;
      goto LABEL_15;
    }
    strtok_r(__lasts, "*", &__s);
  }
LABEL_15:
  uint64_t v8 = (FILE **)MEMORY[0x263EF8358];
  fprintf((FILE *)*MEMORY[0x263EF8358], "> %s\n", __str);
  if (NFDataCreateWithHexString())
  {
    uint64_t v9 = NFDriverSecureElementTransceive();
    NFDataRelease();
    if (v9)
    {
      uint64_t v10 = (char *)NFDataAsHexString();
      fprintf(*v8, "%s\n", v10);
      if (__lasts)
      {
        size_t v11 = strlen(__lasts);
        if (v11 && strncasecmp(v10, __lasts, v11))
        {
          int v12 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i R-APDU does not match expected prefix!", "NfSecureElementScriptRunLine", 78);
          }
          dispatch_get_specific(*v12);
          uint64_t v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            CFStringRef v48 = "NfSecureElementScriptRunLine";
            __int16 v49 = 1024;
            int v50 = 78;
            _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i R-APDU does not match expected prefix!", buf, 0x12u);
          }
          dispatch_get_specific(*v12);
          unint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v15) {
            v15(3, "%s:%i Expected: %s", "NfSecureElementScriptRunLine", 79, __lasts);
          }
          dispatch_get_specific(*v12);
          unint64_t v16 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            CFStringRef v48 = "NfSecureElementScriptRunLine";
            __int16 v49 = 1024;
            int v50 = 79;
            __int16 v51 = 2080;
            uint64_t v52 = __lasts;
            _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Expected: %s", buf, 0x1Cu);
          }
          dispatch_get_specific(*v12);
          int v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v17) {
            v17(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 80, v10);
          }
          dispatch_get_specific(*v12);
          unint64_t v18 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            CFStringRef v48 = "NfSecureElementScriptRunLine";
            __int16 v49 = 1024;
            int v50 = 80;
            __int16 v51 = 2080;
            uint64_t v52 = v10;
            _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
          }
          _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 81);
          uint64_t v7 = 5;
          goto LABEL_45;
        }
      }
      else
      {
        size_t v11 = 0;
      }
      uint64_t v7 = 0;
LABEL_45:
      if (__s)
      {
        size_t v28 = strlen(__s);
        if (v28)
        {
          size_t v29 = strlen(v10);
          if (strncasecmp(&v10[v29 - v28], __s, v28))
          {
            long long v30 = (const void **)MEMORY[0x263F8C6C0];
            dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
            uint64_t v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v31) {
              v31(3, "%s:%i R-APDU does not match expected suffix!", "NfSecureElementScriptRunLine", 90);
            }
            dispatch_get_specific(*v30);
            int v32 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              CFStringRef v48 = "NfSecureElementScriptRunLine";
              __int16 v49 = 1024;
              int v50 = 90;
              _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i R-APDU does not match expected suffix!", buf, 0x12u);
            }
            dispatch_get_specific(*v30);
            int v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v33) {
              v33(3, "%s:%i Expected: %s", "NfSecureElementScriptRunLine", 91, __s);
            }
            dispatch_get_specific(*v30);
            uint64_t v34 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              CFStringRef v48 = "NfSecureElementScriptRunLine";
              __int16 v49 = 1024;
              int v50 = 91;
              __int16 v51 = 2080;
              uint64_t v52 = __s;
              _os_log_impl(&dword_237D7D000, v34, OS_LOG_TYPE_ERROR, "%{public}s:%i Expected: %s", buf, 0x1Cu);
            }
            dispatch_get_specific(*v30);
            int v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v35) {
              v35(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 92, v10);
            }
            dispatch_get_specific(*v30);
            long long v36 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              CFStringRef v48 = "NfSecureElementScriptRunLine";
              __int16 v49 = 1024;
              int v50 = 92;
              __int16 v51 = 2080;
              uint64_t v52 = v10;
              _os_log_impl(&dword_237D7D000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
            }
            _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 93);
            uint64_t v7 = 5;
          }
        }
      }
      else
      {
        size_t v28 = 0;
      }
      if (!(v28 | v11))
      {
        unsigned int ResponseStatus = NFDriverSecureElementGetResponseStatus();
        if (ResponseStatus != 36864)
        {
          unsigned int v38 = ResponseStatus;
          int v39 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v40) {
            v40(3, "%s:%i Command failed: status=0x%04x", "NfSecureElementScriptRunLine", 102, v38);
          }
          dispatch_get_specific(*v39);
          __int16 v41 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            CFStringRef v48 = "NfSecureElementScriptRunLine";
            __int16 v49 = 1024;
            int v50 = 102;
            __int16 v51 = 1024;
            LODWORD(v52) = v38;
            _os_log_impl(&dword_237D7D000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i Command failed: status=0x%04x", buf, 0x18u);
          }
          dispatch_get_specific(*v39);
          int v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v42) {
            v42(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 103, v10);
          }
          dispatch_get_specific(*v39);
          int v43 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            CFStringRef v48 = "NfSecureElementScriptRunLine";
            __int16 v49 = 1024;
            int v50 = 103;
            __int16 v51 = 2080;
            uint64_t v52 = v10;
            _os_log_impl(&dword_237D7D000, v43, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
          }
          if (v38 == 25536)
          {
            uint64_t v7 = 2;
          }
          else if (v38 == 26277)
          {
            uint64_t v7 = 15;
          }
          else
          {
            _NFRestorePushError("com.apple.nfjcop", v38, "Error 0x%04x at %s:%d", v38, "NfSecureElementScriptRunLine", 110);
            uint64_t v7 = 5;
          }
        }
      }
      free(v10);
      NFDataRelease();
      return v7;
    }
    int v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23) {
      v23(3, "%s:%i Transceive failed", "NfSecureElementScriptRunLine", 65);
    }
    dispatch_get_specific(*v22);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      CFStringRef v48 = "NfSecureElementScriptRunLine";
      __int16 v49 = 1024;
      int v50 = 65;
      _os_log_impl(&dword_237D7D000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Transceive failed", buf, 0x12u);
    }
    unsigned int v25 = *MEMORY[0x263F8BD70];
    uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v25, "Error 0x%04x at %s:%d: %llx %s", v25, "NfSecureElementScriptRunLine", 66, StackBreadcrumb, Message);
    return 9;
  }
  else
  {
    int v19 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20) {
      v20(3, "%s:%i Invalid hex string", "NfSecureElementScriptRunLine", 55);
    }
    dispatch_get_specific(*v19);
    uint64_t v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      CFStringRef v48 = "NfSecureElementScriptRunLine";
      __int16 v49 = 1024;
      int v50 = 55;
      _os_log_impl(&dword_237D7D000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid hex string", buf, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 56);
    return 7;
  }
}

uint64_t NfSecureElementScriptRun(uint64_t a1, char *__s)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  size_t v4 = strlen(__s) + 1;
  unsigned int v5 = (char *)malloc_type_calloc(1uLL, v4, 0x100004077774924uLL);
  if (v5)
  {
    unsigned int v6 = v5;
    strlcpy(v5, __s, v4);
    int v24 = v6;
    uint64_t v7 = strtok(v6, "\r\n");
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    if (v7)
    {
      uint64_t v9 = v7;
      int v10 = 0;
      while (1)
      {
        uint64_t v11 = NfSecureElementScriptRunLine(a1, v9);
        if (v11 == 2)
        {
          do
          {
            dispatch_get_specific(*v8);
            uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (Logger) {
              Logger(6, "%s:%i Retry...", "NfSecureElementScriptRun", 152);
            }
            dispatch_get_specific(*v8);
            int v13 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              CFStringRef v26 = "NfSecureElementScriptRun";
              __int16 v27 = 1024;
              int v28 = 152;
              _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Retry...", buf, 0x12u);
            }
            uint64_t v14 = NfSecureElementScriptRunLine(a1, v9);
          }
          while (v14 == 2);
          uint64_t v11 = v14;
        }
        ++v10;
        if (v11) {
          break;
        }
        uint64_t v9 = strtok(0, "\r\n");
        if (!v9) {
          goto LABEL_20;
        }
      }
      dispatch_get_specific(*v8);
      uint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21) {
        v21(3, "%s:%i Failed at line %d: %s", "NfSecureElementScriptRun", 160, v10, v9);
      }
      dispatch_get_specific(*v8);
      int v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        CFStringRef v26 = "NfSecureElementScriptRun";
        __int16 v27 = 1024;
        int v28 = 160;
        __int16 v29 = 1024;
        int v30 = v10;
        __int16 v31 = 2080;
        int v32 = v9;
        _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed at line %d: %s", buf, 0x22u);
      }
      int v20 = v24;
    }
    else
    {
      int v10 = 0;
LABEL_20:
      dispatch_get_specific(*v8);
      unint64_t v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18) {
        v18(6, "%s:%i Executed %d lines successfully", "NfSecureElementScriptRun", 165, v10);
      }
      dispatch_get_specific(*v8);
      int v19 = NFSharedLogGetLogger();
      uint64_t v11 = 0;
      int v20 = v24;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        CFStringRef v26 = "NfSecureElementScriptRun";
        __int16 v27 = 1024;
        int v28 = 165;
        __int16 v29 = 1024;
        int v30 = v10;
        _os_log_impl(&dword_237D7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Executed %d lines successfully", buf, 0x18u);
        uint64_t v11 = 0;
      }
    }
    free(v20);
  }
  else
  {
    unint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    unint64_t v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i calloc failure...", "NfSecureElementScriptRun", 138);
    }
    dispatch_get_specific(*v15);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      CFStringRef v26 = "NfSecureElementScriptRun";
      __int16 v27 = 1024;
      int v28 = 138;
      _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i calloc failure...", buf, 0x12u);
    }
    return 3;
  }
  return v11;
}

uint64_t NfRestoreBundleScan(char *a1, CFMutableDictionaryRef *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  memset(&v47, 0, sizeof(v47));
  if (stat(a1, &v47))
  {
    size_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v6 = (void (*)(uint64_t, const char *, ...))Logger;
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      uint64_t v9 = __error();
      if (a1) {
        int v10 = a1;
      }
      else {
        int v10 = "NULL";
      }
      v6(3, "%s:%i \"%s\" errno=%d Failed to stat at %s", "NfRestoreBundleScan", 203, v8, *v9, v10);
    }
    dispatch_get_specific(*v4);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = __error();
      int v13 = strerror(*v12);
      int v14 = *__error();
      if (a1) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = "NULL";
      }
      *(_DWORD *)buf = 136447234;
      v56 = "NfRestoreBundleScan";
      __int16 v57 = 1024;
      int v58 = 203;
      __int16 v59 = 2080;
      *(void *)CFStringRef v60 = v13;
      *(_WORD *)&v60[8] = 1024;
      *(_DWORD *)&v60[10] = v14;
      __int16 v61 = 2080;
      int v62 = v15;
      _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to stat at %s", buf, 0x2Cu);
    }
    return 7;
  }
  if (((__int16)v47.st_mode & 0x80000000) == 0)
  {
    if ((v47.st_mode & 0x4000) == 0)
    {
      unint64_t v18 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v19) {
        v19(4, "%s:%i Ignoring file of type %d: %s", "NfRestoreBundleScan", 217, v47.st_mode, a1);
      }
      dispatch_get_specific(*v18);
      int v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v56 = "NfRestoreBundleScan";
        __int16 v57 = 1024;
        int v58 = 217;
        __int16 v59 = 1024;
        *(_DWORD *)CFStringRef v60 = v47.st_mode;
        *(_WORD *)&v60[4] = 2080;
        *(void *)&v60[6] = a1;
        _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Ignoring file of type %d: %s", buf, 0x22u);
      }
      return 1;
    }
    CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 10, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __int16 v29 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30) {
      v30(6, "%s:%i %s", "_NfRestoreBundleReadDir", 104, a1);
    }
    dispatch_get_specific(*v29);
    __int16 v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v49 = 136446722;
      int v50 = "_NfRestoreBundleReadDir";
      __int16 v51 = 1024;
      int v52 = 104;
      __int16 v53 = 2080;
      *(void *)uint64_t v54 = a1;
      _os_log_impl(&dword_237D7D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", v49, 0x1Cu);
    }
    int v32 = opendir(a1);
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = readdir(v32);
      if (!v34)
      {
LABEL_46:
        closedir(v33);
        uint64_t v16 = 0;
        *a2 = theDict;
        return v16;
      }
      int v35 = v34;
      while (1)
      {
        if (v35->d_name[0] != 46)
        {
          if (snprintf((char *)buf, 0x400uLL, "%s/%s", a1, v35->d_name) < 0)
          {
            dispatch_get_specific(*v29);
            int v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v44) {
              v44(3, "%s:%i snprintf error", "_NfRestoreBundleReadDir", 119);
            }
            dispatch_get_specific(*v29);
            __int16 v45 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int16 v49 = 136446466;
              int v50 = "_NfRestoreBundleReadDir";
              __int16 v51 = 1024;
              int v52 = 119;
              _os_log_impl(&dword_237D7D000, v45, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", v49, 0x12u);
            }
            closedir(v33);
            CFRelease(theDict);
            return 5;
          }
          value = 0;
          uint64_t v36 = NfRestoreBundleScan(buf, &value);
          if (v36)
          {
            uint64_t v16 = v36;
            dispatch_get_specific(*v29);
            int v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v37) {
              v37(3, "%s:%i Error %d at %s", "_NfRestoreBundleReadDir", 128, v16, (const char *)buf);
            }
            dispatch_get_specific(*v29);
            unsigned int v38 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int16 v49 = 136446978;
              int v50 = "_NfRestoreBundleReadDir";
              __int16 v51 = 1024;
              int v52 = 128;
              __int16 v53 = 1024;
              *(_DWORD *)uint64_t v54 = v16;
              *(_WORD *)&v54[4] = 2080;
              *(void *)&v54[6] = buf;
              _os_log_impl(&dword_237D7D000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Error %d at %s", v49, 0x22u);
            }
            if (v16 != 1 && (v16 != 7 || v35->d_type != 10))
            {
              closedir(v33);
              CFRelease(theDict);
              return v16;
            }
          }
          else
          {
            CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
            CFStringRef v40 = CFStringCreateWithCString(v28, v35->d_name, SystemEncoding);
            __int16 v41 = value;
            CFDictionarySetValue(theDict, v40, value);
            CFRelease(v40);
            CFRelease(v41);
          }
        }
        int v35 = readdir(v33);
        if (!v35) {
          goto LABEL_46;
        }
      }
    }
    dispatch_get_specific(*v29);
    int v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v42) {
      v42(3, "%s:%i Failed to open %s", "_NfRestoreBundleReadDir", 108, a1);
    }
    dispatch_get_specific(*v29);
    int v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v49 = 136446722;
      int v50 = "_NfRestoreBundleReadDir";
      __int16 v51 = 1024;
      int v52 = 108;
      __int16 v53 = 2080;
      *(void *)uint64_t v54 = a1;
      _os_log_impl(&dword_237D7D000, v43, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open %s", v49, 0x1Cu);
    }
    CFRelease(theDict);
    return 7;
  }
  uint64_t v21 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v22 = NFLogGetLogger();
  if (v22)
  {
    __int16 v23 = (void (*)(uint64_t, const char *, ...))v22;
    int v24 = basename(a1);
    v23(6, "%s:%i %s", "_NfRestoreBundleGetFileHandle", 89, v24);
  }
  dispatch_get_specific(*v21);
  unsigned int v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v26 = basename(a1);
    *(_DWORD *)buf = 136446722;
    v56 = "_NfRestoreBundleGetFileHandle";
    __int16 v57 = 1024;
    int v58 = 89;
    __int16 v59 = 2080;
    *(void *)CFStringRef v60 = v26;
    _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }
  CFStringRef v27 = CFStringCreateWithCString(0, a1, 0x8000100u);
  *a2 = CFURLCreateWithString(0, v27, 0);
  CFRelease(v27);
  return 0;
}

uint64_t NfRestoreBundleCreate(char *a1, const char *a2)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  CFPropertyListRef propertyList = 0;
  size_t v4 = ".";
  if (a2) {
    size_t v4 = a2;
  }
  if (snprintf(__str, 0x400uLL, "%s", v4) < 0)
  {
    int v10 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i snprintf error", "NfRestoreBundleCreate", 228);
    }
    dispatch_get_specific(*v10);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v62 = "NfRestoreBundleCreate";
      __int16 v63 = 1024;
      int v64 = 228;
      _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", buf, 0x12u);
    }
    return 3;
  }
  else
  {
    uint64_t v5 = _NfRestoreBundleValidateTargetPath(__str);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v8) {
        v8(3, "%s:%i Failed to build target path: %s", "NfRestoreBundleCreate", 233, a2);
      }
      dispatch_get_specific(*v7);
      uint64_t v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v62 = "NfRestoreBundleCreate";
        __int16 v63 = 1024;
        int v64 = 233;
        __int16 v65 = 2080;
        *(void *)CFBooleanRef v66 = a2;
        _os_log_impl(&dword_237D7D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to build target path: %s", buf, 0x1Cu);
      }
      return v6;
    }
    int v13 = NfRestoreBundleScan(a1, (CFMutableDictionaryRef *)&propertyList);
    if (v13)
    {
      int v14 = v13;
      unint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16) {
        v16(3, "%s:%i Failed to scan directory %u : %s", "NfRestoreBundleCreate", 238, v14, a1);
      }
      dispatch_get_specific(*v15);
      int v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        int v62 = "NfRestoreBundleCreate";
        __int16 v63 = 1024;
        int v64 = 238;
        __int16 v65 = 1024;
        *(_DWORD *)CFBooleanRef v66 = v14;
        *(_WORD *)&v66[4] = 2080;
        *(void *)&v66[6] = a1;
        _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to scan directory %u : %s", buf, 0x22u);
      }
      return 7;
    }
    CFPropertyListRef v18 = propertyList;
    CFErrorRef error = 0;
    CFDataRef v19 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], propertyList, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v19)
    {
      CFDataRef v20 = v19;
      unlink(__str);
      uint64_t v21 = fopen(__str, "w");
      if (v21)
      {
        uint64_t v22 = v21;
        BytePtr = CFDataGetBytePtr(v20);
        size_t Length = CFDataGetLength(v20);
        size_t v25 = fwrite(BytePtr, Length, 1uLL, v22);
        if (v25 == 1)
        {
          uint64_t v6 = 0;
        }
        else
        {
          __int16 v45 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v46) {
            v46(3, "%s:%i Failed to write data to %s", "_NfRestoreBundleWrite", 73, __str);
          }
          dispatch_get_specific(*v45);
          stat v47 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            int v62 = "_NfRestoreBundleWrite";
            __int16 v63 = 1024;
            int v64 = 73;
            __int16 v65 = 2080;
            *(void *)CFBooleanRef v66 = __str;
            _os_log_impl(&dword_237D7D000, v47, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write data to %s", buf, 0x1Cu);
          }
          uint64_t v6 = 7;
        }
        fclose(v22);
        CFRelease(v20);
        if (v25 == 1)
        {
          CFStringRef v48 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          __int16 v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v49) {
            v49(6, "%s:%i Wrote to file: %s", "NfRestoreBundleCreate", 248, __str);
          }
          dispatch_get_specific(*v48);
          int v50 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            int v62 = "NfRestoreBundleCreate";
            __int16 v63 = 1024;
            int v64 = 248;
            __int16 v65 = 2080;
            *(void *)CFBooleanRef v66 = __str;
            _os_log_impl(&dword_237D7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Wrote to file: %s", buf, 0x1Cu);
          }
          if (v18) {
            CFRelease(v18);
          }
          return 0;
        }
      }
      else
      {
        int v35 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v36 = NFLogGetLogger();
        if (v36)
        {
          int v37 = (void (*)(uint64_t, const char *, ...))v36;
          unsigned int v38 = __error();
          int v39 = strerror(*v38);
          CFStringRef v40 = __error();
          v37(3, "%s:%i \"%s\" errno=%d Failed to open %s", "_NfRestoreBundleWrite", 51, v39, *v40, __str);
        }
        dispatch_get_specific(*v35);
        __int16 v41 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          int v42 = __error();
          int v43 = strerror(*v42);
          int v44 = *__error();
          *(_DWORD *)buf = 136447234;
          int v62 = "_NfRestoreBundleWrite";
          __int16 v63 = 1024;
          int v64 = 51;
          __int16 v65 = 2080;
          *(void *)CFBooleanRef v66 = v43;
          *(_WORD *)&v66[8] = 1024;
          *(_DWORD *)&v66[10] = v44;
          __int16 v67 = 2080;
          __int16 v68 = __str;
          _os_log_impl(&dword_237D7D000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to open %s", buf, 0x2Cu);
        }
        CFRelease(v20);
        uint64_t v6 = 7;
      }
    }
    else
    {
      if (error)
      {
        CFStringRef v26 = CFErrorCopyDescription(error);
        CFStringRef v27 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v28 = NFLogGetLogger();
        if (v28)
        {
          __int16 v29 = (void (*)(uint64_t, const char *, ...))v28;
          CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
          CStringPtr = CFStringGetCStringPtr(v26, SystemEncoding);
          v29(3, "%s:%i Encoding error: %s", "_NfRestoreBundleWrite", 37, CStringPtr);
        }
        dispatch_get_specific(*v27);
        int v32 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          CFStringEncoding v33 = CFStringGetSystemEncoding();
          uint64_t v34 = CFStringGetCStringPtr(v26, v33);
          *(_DWORD *)buf = 136446722;
          int v62 = "_NfRestoreBundleWrite";
          __int16 v63 = 1024;
          int v64 = 37;
          __int16 v65 = 2080;
          *(void *)CFBooleanRef v66 = v34;
          _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Encoding error: %s", buf, 0x1Cu);
        }
        CFRelease(v26);
        CFRelease(error);
      }
      else
      {
        __int16 v51 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        int v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v52) {
          v52(3, "%s:%i Unknown encoding error", "_NfRestoreBundleWrite", 42);
        }
        dispatch_get_specific(*v51);
        __int16 v53 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v62 = "_NfRestoreBundleWrite";
          __int16 v63 = 1024;
          int v64 = 42;
          _os_log_impl(&dword_237D7D000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown encoding error", buf, 0x12u);
        }
      }
      uint64_t v6 = 3;
    }
    uint64_t v54 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v55) {
      v55(3, "%s:%i Failed to write to path: %s", "NfRestoreBundleCreate", 243, __str);
    }
    dispatch_get_specific(*v54);
    v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v62 = "NfRestoreBundleCreate";
      __int16 v63 = 1024;
      int v64 = 243;
      __int16 v65 = 2080;
      *(void *)CFBooleanRef v66 = __str;
      _os_log_impl(&dword_237D7D000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write to path: %s", buf, 0x1Cu);
    }
    if (v18) {
      CFRelease(v18);
    }
  }
  return v6;
}

uint64_t _NfRestoreBundleValidateTargetPath(char *a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  memset(&v43, 0, sizeof(v43));
  if (stat(a1, &v43))
  {
    if (*__error() == 2)
    {
      uint64_t v2 = dirname(a1);
      if (stat(v2, &v43))
      {
        uint64_t v3 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
          uint64_t v6 = __error();
          uint64_t v7 = strerror(*v6);
          uint64_t v8 = __error();
          v5(3, "%s:%i \"%s\" errno=%d failed to stat parent: %s", "_NfRestoreBundleValidateTargetPath", 159, v7, *v8, v2);
        }
        dispatch_get_specific(*v3);
        uint64_t v9 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          return 7;
        }
        int v10 = __error();
        uint64_t v11 = strerror(*v10);
        int v12 = *__error();
        *(_DWORD *)buf = 136447234;
        __int16 v45 = "_NfRestoreBundleValidateTargetPath";
        __int16 v46 = 1024;
        int v47 = 159;
        __int16 v48 = 2080;
        __int16 v49 = v11;
        __int16 v50 = 1024;
        int v51 = v12;
        __int16 v52 = 2080;
        __int16 v53 = v2;
        int v13 = "%{public}s:%i \"%s\" errno=%d failed to stat parent: %s";
      }
      else
      {
        if ((v43.st_mode & 0x4000) != 0) {
          return 0;
        }
        __int16 v31 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v32 = NFLogGetLogger();
        if (v32)
        {
          CFStringEncoding v33 = (void (*)(uint64_t, const char *, ...))v32;
          uint64_t v34 = __error();
          int v35 = strerror(*v34);
          uint64_t v36 = __error();
          v33(3, "%s:%i \"%s\" errno=%d parent is not directory: %s", "_NfRestoreBundleValidateTargetPath", 168, v35, *v36, v2);
        }
        dispatch_get_specific(*v31);
        uint64_t v9 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          return 7;
        }
        int v37 = __error();
        unsigned int v38 = strerror(*v37);
        int v39 = *__error();
        *(_DWORD *)buf = 136447234;
        __int16 v45 = "_NfRestoreBundleValidateTargetPath";
        __int16 v46 = 1024;
        int v47 = 168;
        __int16 v48 = 2080;
        __int16 v49 = v38;
        __int16 v50 = 1024;
        int v51 = v39;
        __int16 v52 = 2080;
        __int16 v53 = v2;
        int v13 = "%{public}s:%i \"%s\" errno=%d parent is not directory: %s";
      }
      CFPropertyListRef v18 = v9;
      uint32_t v19 = 44;
    }
    else
    {
      CFDataRef v20 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v21 = NFLogGetLogger();
      if (v21)
      {
        uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
        __int16 v23 = __error();
        int v24 = strerror(*v23);
        size_t v25 = __error();
        v22(3, "%s:%i \"%s\" errno=%d stat failed", "_NfRestoreBundleValidateTargetPath", 172, v24, *v25);
      }
      dispatch_get_specific(*v20);
      CFStringRef v26 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        return 7;
      }
      CFStringRef v27 = __error();
      uint64_t v28 = strerror(*v27);
      int v29 = *__error();
      *(_DWORD *)buf = 136446978;
      __int16 v45 = "_NfRestoreBundleValidateTargetPath";
      __int16 v46 = 1024;
      int v47 = 172;
      __int16 v48 = 2080;
      __int16 v49 = v28;
      __int16 v50 = 1024;
      int v51 = v29;
      int v13 = "%{public}s:%i \"%s\" errno=%d stat failed";
      CFPropertyListRef v18 = v26;
      uint32_t v19 = 34;
    }
LABEL_26:
    _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_ERROR, v13, buf, v19);
    return 7;
  }
  if ((v43.st_mode & 0x4000) == 0)
  {
    uint64_t result = unlink(a1);
    if (!result) {
      return result;
    }
    unint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Failed to delete existing file: %s", "_NfRestoreBundleValidateTargetPath", 191, a1);
    }
    dispatch_get_specific(*v15);
    int v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return 7;
    }
    *(_DWORD *)buf = 136446722;
    __int16 v45 = "_NfRestoreBundleValidateTargetPath";
    __int16 v46 = 1024;
    int v47 = 191;
    __int16 v48 = 2080;
    __int16 v49 = a1;
    int v13 = "%{public}s:%i Failed to delete existing file: %s";
    CFPropertyListRef v18 = v17;
    uint32_t v19 = 28;
    goto LABEL_26;
  }
  size_t v30 = strlen(a1);
  if ((snprintf(&a1[v30], 1024 - v30, "/%s", "StockholmRestore.plist") & 0x80000000) == 0) {
    return _NfRestoreBundleValidateTargetPath(a1);
  }
  CFStringRef v40 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  __int16 v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v41) {
    v41(3, "%s:%i snprintf error", "_NfRestoreBundleValidateTargetPath", 182);
  }
  dispatch_get_specific(*v40);
  int v42 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v45 = "_NfRestoreBundleValidateTargetPath";
    __int16 v46 = 1024;
    int v47 = 182;
    _os_log_impl(&dword_237D7D000, v42, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", buf, 0x12u);
  }
  return 3;
}

void *NfContextInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
  if (v6)
  {
    NFLogSetLogger();
    *uint64_t v6 = a1;
    v6[1] = a2;
    v6[2] = a3;
  }
  return v6;
}

uint64_t NFRestoreLog(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!gNfContext) {
    goto LABEL_5;
  }
  if (*(void *)(gNfContext + 8))
  {
    vsnprintf(__str, 0x400uLL, __format, va);
    return (*(uint64_t (**)(void, uint64_t, const char *, ...))(gNfContext + 8))(*(void *)(gNfContext + 16), a1, "%s\n", __str);
  }
  uint64_t result = NFIsRestoreOS();
  if (result)
  {
LABEL_5:
    vsnprintf(__str, 0x400uLL, __format, va);
    return fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", __str);
  }
  return result;
}

void NfContextFree(void *a1)
{
  if (a1) {
    free(a1);
  }
}

char *NfSecureElementOpen(uint64_t a1, int a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  size_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NfSecureElementOpen", 149);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v58 = "NfSecureElementOpen";
    __int16 v59 = 1024;
    int v60 = 149;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  uint64_t v7 = (char *)malloc_type_calloc(1uLL, 0xE18uLL, 0x10200407C1C0D77uLL);
  if (!v7)
  {
    dispatch_get_specific(*v4);
    int v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v37) {
      v37(3, "%s:%i Failed to allocate NfSecureElement_t", "NfSecureElementOpen", 154);
    }
    dispatch_get_specific(*v4);
    unsigned int v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v58 = "NfSecureElementOpen";
      __int16 v59 = 1024;
      int v60 = 154;
      _os_log_impl(&dword_237D7D000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate NfSecureElement_t", buf, 0x12u);
    }
    return 0;
  }
  uint64_t v8 = v7;
  *(void *)uint64_t v7 = a1;
  *((_DWORD *)v7 + 2) = a2;
  if ((NfSecureElementSetPower((uint64_t)v7, 1) & 1) == 0)
  {
    dispatch_get_specific(*v4);
    int v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v39) {
      v39(3, "%s:%i Failed to enter wired mode", "NfSecureElementOpen", 162);
    }
    dispatch_get_specific(*v4);
    CFStringRef v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v58 = "NfSecureElementOpen";
      __int16 v59 = 1024;
      int v60 = 162;
      _os_log_impl(&dword_237D7D000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to enter wired mode", buf, 0x12u);
    }
    unsigned int v41 = *MEMORY[0x263F8BD70];
    uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v41, "Error 0x%04x at %s:%d: %llx %s", v41, "NfSecureElementOpen", 163, StackBreadcrumb, Message);
    goto LABEL_65;
  }
  if ((NFDriverSecureElementGetOSMode() & 1) == 0)
  {
    dispatch_get_specific(*v4);
    int v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44) {
      v44(4, "%s:%i Failed to get OS mode", "NfSecureElementUpdateOSInfo", 22);
    }
    dispatch_get_specific(*v4);
    __int16 v45 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v58 = "NfSecureElementUpdateOSInfo";
      __int16 v59 = 1024;
      int v60 = 22;
      _os_log_impl(&dword_237D7D000, v45, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get OS mode", buf, 0x12u);
    }
    unsigned int v46 = *MEMORY[0x263F8BD70];
    uint64_t v47 = NFDriverGetStackBreadcrumb();
    uint64_t v55 = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v46, "Error 0x%04x at %s:%d: %llx %s", v46, "NfSecureElementUpdateOSInfo", 23, v47, v55);
    goto LABEL_61;
  }
  if (*((_DWORD *)v8 + 887) == 2 && (NFDriverSecureElementGetOSInfo() & 1) == 0)
  {
    dispatch_get_specific(*v4);
    int v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v51) {
      v51(4, "%s:%i Failed to get OS info", "NfSecureElementUpdateOSInfo", 29);
    }
    dispatch_get_specific(*v4);
    __int16 v52 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v58 = "NfSecureElementUpdateOSInfo";
      __int16 v59 = 1024;
      int v60 = 29;
      _os_log_impl(&dword_237D7D000, v52, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get OS info", buf, 0x12u);
    }
    unsigned int v53 = *MEMORY[0x263F8BD70];
    uint64_t v54 = NFDriverGetStackBreadcrumb();
    v56 = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v53, "Error 0x%04x at %s:%d: %llx %s", v53, "NfSecureElementUpdateOSInfo", 30, v54, v56);
LABEL_61:
    dispatch_get_specific(*v4);
    __int16 v48 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v48) {
      v48(3, "%s:%i Failed to update OS info", "NfSecureElementOpen", 168);
    }
    dispatch_get_specific(*v4);
    __int16 v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v58 = "NfSecureElementOpen";
      __int16 v59 = 1024;
      int v60 = 168;
      _os_log_impl(&dword_237D7D000, v49, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update OS info", buf, 0x12u);
    }
LABEL_65:
    NfSecureElementClose(v8);
    return 0;
  }
  unsigned int v9 = *((_DWORD *)v8 + 889) - 1;
  int v10 = "UNKNOWN";
  if (v9 <= 5) {
    int v10 = off_264D010E8[v9];
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
  {
    if (v8[3599]) {
      int v12 = "YES";
    }
    else {
      int v12 = "NO";
    }
    if (v8[3600]) {
      int v13 = "YES";
    }
    else {
      int v13 = "NO";
    }
    v11(6, "%s:%i id=%s dev=0x%02x hw=0x%08x fw=0x%04x cfw=0x%04x restricted=%s OSUpdate=%s", "NfSecureElementUpdateOSInfo", 54, v8 + 3392, v8[3596], *((_DWORD *)v8 + 894), *((_DWORD *)v8 + 893), *((unsigned __int16 *)v8 + 1792), v12, v13);
  }
  dispatch_get_specific(*v4);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = v8[3596];
    int v16 = *((_DWORD *)v8 + 894);
    int v17 = *((_DWORD *)v8 + 893);
    int v18 = *((unsigned __int16 *)v8 + 1792);
    if (v8[3599]) {
      uint32_t v19 = "YES";
    }
    else {
      uint32_t v19 = "NO";
    }
    if (v8[3600]) {
      CFDataRef v20 = "YES";
    }
    else {
      CFDataRef v20 = "NO";
    }
    *(_DWORD *)buf = 136448258;
    int v58 = "NfSecureElementUpdateOSInfo";
    __int16 v59 = 1024;
    int v60 = 54;
    __int16 v61 = 2080;
    int v62 = v8 + 3392;
    __int16 v63 = 1024;
    int v64 = v15;
    __int16 v65 = 1024;
    int v66 = v16;
    __int16 v67 = 1024;
    int v68 = v17;
    __int16 v69 = 1024;
    int v70 = v18;
    __int16 v71 = 2080;
    CFBooleanRef v72 = v19;
    __int16 v73 = 2080;
    CFStringRef v74 = v20;
    _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i id=%s dev=0x%02x hw=0x%08x fw=0x%04x cfw=0x%04x restricted=%s OSUpdate=%s", buf, 0x48u);
  }
  dispatch_get_specific(*v4);
  uint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v21)
  {
    int v22 = *((_DWORD *)v8 + 887);
    if (v22 == 2) {
      __int16 v23 = "JCOP";
    }
    else {
      __int16 v23 = "UNKNOWN";
    }
    if (v22 == 1) {
      int v24 = "Update";
    }
    else {
      int v24 = v23;
    }
    v21(6, "%s:%i mode=%s counter=%d reference=%d osid=0x%02x othervalid=0x%02x", "NfSecureElementUpdateOSInfo", 62, v24, *((unsigned __int16 *)v8 + 1793), *((unsigned __int16 *)v8 + 1794), v8[3597], v8[3598]);
  }
  dispatch_get_specific(*v4);
  size_t v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = *((_DWORD *)v8 + 887);
    if (v26 == 2) {
      CFStringRef v27 = "JCOP";
    }
    else {
      CFStringRef v27 = "UNKNOWN";
    }
    BOOL v28 = v26 == 1;
    int v29 = *((unsigned __int16 *)v8 + 1793);
    if (v28) {
      CFStringRef v27 = "Update";
    }
    int v30 = *((unsigned __int16 *)v8 + 1794);
    int v31 = v8[3597];
    int v32 = v8[3598];
    *(_DWORD *)buf = 136447746;
    int v58 = "NfSecureElementUpdateOSInfo";
    __int16 v59 = 1024;
    int v60 = 62;
    __int16 v61 = 2080;
    int v62 = v27;
    __int16 v63 = 1024;
    int v64 = v29;
    __int16 v65 = 1024;
    int v66 = v30;
    __int16 v67 = 1024;
    int v68 = v31;
    __int16 v69 = 1024;
    int v70 = v32;
    _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mode=%s counter=%d reference=%d osid=0x%02x othervalid=0x%02x", buf, 0x34u);
  }
  dispatch_get_specific(*v4);
  CFStringEncoding v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v33) {
    v33(6, "%s:%i migration=%s pkgs=%d inst=%d", "NfSecureElementUpdateOSInfo", 67, v10, *((unsigned __int16 *)v8 + 1795), *((unsigned __int16 *)v8 + 1796));
  }
  dispatch_get_specific(*v4);
  uint64_t v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = *((unsigned __int16 *)v8 + 1795);
    int v36 = *((unsigned __int16 *)v8 + 1796);
    *(_DWORD *)buf = 136447234;
    int v58 = "NfSecureElementUpdateOSInfo";
    __int16 v59 = 1024;
    int v60 = 67;
    __int16 v61 = 2080;
    int v62 = v10;
    __int16 v63 = 1024;
    int v64 = v35;
    __int16 v65 = 1024;
    int v66 = v36;
    _os_log_impl(&dword_237D7D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s:%i migration=%s pkgs=%d inst=%d", buf, 0x28u);
  }
  return v8;
}

uint64_t NfSecureElementSetPower(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  size_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i se=%d, enabled=%d", "NfSecureElementSetPower", 80, *(_DWORD *)(a1 + 8), a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)buf = 136446978;
    int v13 = "NfSecureElementSetPower";
    __int16 v14 = 1024;
    int v15 = 80;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i se=%d, enabled=%d", buf, 0x1Eu);
  }
  if (!a2) {
    return NFDriverSetConfiguration();
  }
  if (NFDriverSetConfiguration())
  {
    usleep(0x7D0u);
    return 1;
  }
  else
  {
    unsigned int v9 = *MEMORY[0x263F8BD70];
    uint64_t StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v9, "Error 0x%04x at %s:%d: %llx %s", v9, "NfSecureElementSetPower", 86, StackBreadcrumb, Message);
    return 0;
  }
}

void NfSecureElementClose(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NfSecureElementClose", 181);
  }
  dispatch_get_specific(*v2);
  size_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v8 = "NfSecureElementClose";
    __int16 v9 = 1024;
    int v10 = 181;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (a1)
  {
    NfSecureElementSetPower((uint64_t)a1, 0);
    free(a1);
  }
  else
  {
    dispatch_get_specific(*v2);
    uint64_t v5 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v5) {
      v5(3, "%s:%i se object is not valid", "NfSecureElementClose", 184);
    }
    dispatch_get_specific(*v2);
    uint64_t v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v8 = "NfSecureElementClose";
      __int16 v9 = 1024;
      int v10 = 184;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i se object is not valid", buf, 0x12u);
    }
  }
}

BOOL NFHardwareGetUARTLogEnabled(io_registry_entry_t *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  io_registry_entry_t v1 = *a1;
  if (!v1)
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Not connected", "NFHardwareGetUARTLogEnabled", 23);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v20 = "NFHardwareGetUARTLogEnabled";
    __int16 v21 = 1024;
    int v22 = 23;
    __int16 v9 = "%{public}s:%i Not connected";
    int v10 = v8;
    uint32_t v11 = 18;
    goto LABEL_13;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"uart.log", 0, 0);
  if (!CFProperty)
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(4, "%s:%i Failed to fetch property: %s", "NFHardwareGetUARTLogEnabled", 30, "uart.log");
    }
    dispatch_get_specific(*v12);
    __int16 v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v20 = "NFHardwareGetUARTLogEnabled";
    __int16 v21 = 1024;
    int v22 = 30;
    __int16 v23 = 2080;
    int v24 = "uart.log";
    __int16 v9 = "%{public}s:%i Failed to fetch property: %s";
    int v10 = v14;
    uint32_t v11 = 28;
LABEL_13:
    _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  uint64_t v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  if (v4 == CFBooleanGetTypeID())
  {
    BOOL v5 = v3 == (const void *)*MEMORY[0x263EFFB40];
  }
  else
  {
    int v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Unsupported type: %lu", "NFHardwareGetUARTLogEnabled", 39, v4);
    }
    dispatch_get_specific(*v15);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v20 = "NFHardwareGetUARTLogEnabled";
      __int16 v21 = 1024;
      int v22 = 39;
      __int16 v23 = 2048;
      int v24 = (const char *)v4;
      _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Unsupported type: %lu", buf, 0x1Cu);
    }
    BOOL v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

uint64_t NFHardwareGetRFConfigTLVs(io_registry_entry_t *a1, CFStringRef *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (*a1)
  {
    uint64_t v3 = a2 + 1;
    *((_OWORD *)a2 + 1) = 0uLL;
    CFTypeID v4 = a2 + 2;
    *(_OWORD *)a2 = 0uLL;
    BOOL v5 = a2 + 3;
    _NFHardwareGetRFConfigTLV(a1, @"rf-clock-tlv", a2);
    if (_NFHardwareGetRFConfigTLV(a1, @"rf-config-tlvs", v3) && *v3) {
      return 1;
    }
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 101, "rf-config-tlvs");
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v19 = "NFHardwareGetRFConfigTLVs";
      __int16 v20 = 1024;
      int v21 = 101;
      __int16 v22 = 2080;
      __int16 v23 = "rf-config-tlvs";
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
    }
    if (!_NFHardwareGetRFConfigTLV(a1, @"rf-config-tlvs-10", v4) || !*v4)
    {
      dispatch_get_specific(*v6);
      __int16 v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9) {
        v9(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 106, "rf-config-tlvs-10");
      }
      dispatch_get_specific(*v6);
      int v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v19 = "NFHardwareGetRFConfigTLVs";
        __int16 v20 = 1024;
        int v21 = 106;
        __int16 v22 = 2080;
        __int16 v23 = "rf-config-tlvs-10";
        _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
    uint64_t RFConfigTLV = _NFHardwareGetRFConfigTLV(a1, @"rf-config-tlvs-12", v5);
    if (RFConfigTLV && *v5)
    {
      return 1;
    }
    else
    {
      dispatch_get_specific(*v6);
      int v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15) {
        v15(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 110, "rf-config-tlvs-12");
      }
      dispatch_get_specific(*v6);
      __int16 v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v19 = "NFHardwareGetRFConfigTLVs";
        __int16 v20 = 1024;
        int v21 = 110;
        __int16 v22 = 2080;
        __int16 v23 = "rf-config-tlvs-12";
        _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
  }
  else
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Not connected", "NFHardwareGetRFConfigTLVs", 86);
    }
    dispatch_get_specific(*v12);
    __int16 v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "NFHardwareGetRFConfigTLVs";
      __int16 v20 = 1024;
      int v21 = 86;
      _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Not connected", buf, 0x12u);
    }
    return 0;
  }
  return RFConfigTLV;
}

uint64_t _NFHardwareGetRFConfigTLV(io_registry_entry_t *a1, const __CFString *a2, CFStringRef *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(*a1, a2, 0, 0);
  if (!result) {
    return result;
  }
  BOOL v5 = (const void *)result;
  CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
  if (v6 != CFDataGetTypeID())
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v10 = (void (*)(uint64_t, const char *, ...))Logger;
      CFTypeID TypeID = CFDataGetTypeID();
      CFTypeID v12 = CFGetTypeID(v5);
      v10(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "_NFHardwareGetRFConfigTLV", 69, TypeID, v12);
    }
    dispatch_get_specific(*v8);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v15 = "_NFHardwareGetRFConfigTLV";
      __int16 v16 = 1024;
      int v17 = 69;
      __int16 v18 = 2048;
      CFTypeID v19 = CFDataGetTypeID();
      __int16 v20 = 2048;
      CFTypeID v21 = CFGetTypeID(v5);
      _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
    }
    CFRelease(v5);
    return 0;
  }
  CFStringRef v7 = CFStringCreateFromExternalRepresentation(0, (CFDataRef)v5, 0x600u);
  if (v7) {
    *a3 = v7;
  }
  CFRelease(v5);
  return 1;
}

CFStringRef NFHardwareCopyAntennaName(io_registry_entry_t *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  io_registry_entry_t v1 = *a1;
  if (!v1)
  {
    CFStringRef v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Not connected", "NFHardwareCopyAntennaName", 122);
    }
    dispatch_get_specific(*v7);
    __int16 v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 122;
    int v10 = "%{public}s:%i Not connected";
LABEL_13:
    _os_log_impl(&dword_237D7D000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
    return 0;
  }
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, @"rf-antenna-name", 0, 0);
  if (!CFProperty)
  {
    uint32_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFTypeID v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(4, "%s:%i antenna name is missing - no RF?", "NFHardwareCopyAntennaName", 131);
    }
    dispatch_get_specific(*v11);
    __int16 v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 131;
    int v10 = "%{public}s:%i antenna name is missing - no RF?";
    goto LABEL_13;
  }
  CFDataRef v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  if (v4 == CFDataGetTypeID())
  {
    CFStringRef v5 = CFStringCreateFromExternalRepresentation(0, v3, 0x600u);
    CFRelease(v3);
    return v5;
  }
  int v13 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v14 = NFLogGetLogger();
  if (v14)
  {
    int v15 = (void (*)(uint64_t, const char *, ...))v14;
    CFTypeID TypeID = CFDataGetTypeID();
    CFTypeID v17 = CFGetTypeID(v3);
    v15(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "NFHardwareCopyAntennaName", 143, TypeID, v17);
  }
  dispatch_get_specific(*v13);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 143;
    __int16 v23 = 2048;
    CFTypeID v24 = CFDataGetTypeID();
    __int16 v25 = 2048;
    CFTypeID v26 = CFGetTypeID(v3);
    _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
  }
  CFRelease(v3);
  return 0;
}

_DWORD *NFHardwareLoad(const char *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  _DWORD *v2 = MatchingService;
  if (!MatchingService)
  {
    CFTypeID v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Could not find service: %s", "NFHardwareLoad", 159, a1);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint32_t v11 = "NFHardwareLoad";
      __int16 v12 = 1024;
      int v13 = 159;
      __int16 v14 = 2080;
      int v15 = a1;
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    }
    free(v2);
    return 0;
  }
  return v2;
}

void NFHardwareUnload(io_object_t *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    io_object_t v2 = *a1;
    if (v2 && IOObjectRelease(v2))
    {
      mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i Fail to release service", "NFHardwareUnload", 175);
      }
      dispatch_get_specific(*v3);
      CFStringRef v5 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        CFStringRef v7 = "NFHardwareUnload";
        __int16 v8 = 1024;
        int v9 = 175;
        _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
      }
    }
    free(a1);
  }
}

BOOL NFHardwareHasFollowerReset(const char *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (strcmp(a1, "stockholm-spmi")) {
    return 0;
  }
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("stockholm-spmi");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    __int16 v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareHasFollowerReset", 206);
    }
    dispatch_get_specific(*v8);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "NFHardwareHasFollowerReset";
      __int16 v13 = 1024;
      int v14 = 206;
      _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  io_object_t v5 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"spmiFollowerReset", 0, 0);
  BOOL v1 = CFProperty != 0;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v5);
  return v1;
}

BOOL NFHardwareSupportedSecureTimersInOff()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"se-lpem-enabled", 0, 0);
    BOOL v5 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v3);
  }
  else
  {
    CFTypeID v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareSupportedSecureTimersInOff", 227);
    }
    dispatch_get_specific(*v6);
    __int16 v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v11 = "NFHardwareSupportedSecureTimersInOff";
      __int16 v12 = 1024;
      int v13 = 227;
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v5;
}

uint64_t NFHardwareGetModelID(const char *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"nfccModel", 0, 0);
    if (CFProperty)
    {
      CFDataRef v6 = CFProperty;
      CFTypeID v7 = CFGetTypeID(CFProperty);
      if (v7 == CFDataGetTypeID() && CFDataGetLength(v6)) {
        uint64_t v8 = *CFDataGetBytePtr(v6);
      }
      else {
        uint64_t v8 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      uint64_t v8 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    int v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareGetModelID", 253);
    }
    dispatch_get_specific(*v9);
    uint32_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = "NFHardwareGetModelID";
      __int16 v15 = 1024;
      int v16 = 253;
      _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v8;
}

BOOL NFHardwareIsEos(const char *a1)
{
  return NFHardwareGetModelID(a1) - 209 < 3;
}

uint64_t NFHardwareAllowsVBATOff()
{
  return 1;
}

BOOL NFHardwareSkipSpmiReconfig(const char *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  BOOL v5 = (const void **)MEMORY[0x263F8C6C0];
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"skip-spmi-reconfig", 0, 0);
    BOOL v8 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v6);
  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service %s", "NFHardwareSkipSpmiReconfig", 293, a1);
    }
    dispatch_get_specific(*v5);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v17 = "NFHardwareSkipSpmiReconfig";
      __int16 v18 = 1024;
      int v19 = 293;
      __int16 v20 = 2080;
      __int16 v21 = a1;
      _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service %s", buf, 0x1Cu);
    }
    BOOL v8 = 0;
  }
  dispatch_get_specific(*v5);
  uint32_t v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
  {
    if (v8) {
      __int16 v12 = "not reconfigure";
    }
    else {
      __int16 v12 = "reconfigure";
    }
    v11(6, "%s:%i Will %s spmi for %s", "NFHardwareSkipSpmiReconfig", 296, v12, a1);
  }
  dispatch_get_specific(*v5);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v14 = "not reconfigure";
    }
    else {
      uint64_t v14 = "reconfigure";
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v17 = "NFHardwareSkipSpmiReconfig";
    __int16 v18 = 1024;
    int v19 = 296;
    __int16 v20 = 2080;
    __int16 v21 = v14;
    __int16 v22 = 2080;
    __int16 v23 = a1;
    _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Will %s spmi for %s", buf, 0x26u);
  }
  return v8;
}

BOOL NFHardwareHasVirtualGPIO()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"required-gpios", 0, 0);
    CFDataRef v5 = CFProperty;
    if (CFProperty && (CFTypeID v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex Length = CFDataGetLength(v5);
      CFStringRef v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      if (v9)
      {
        CFStringRef v10 = v9;
        v35.length = CFStringGetLength(v9);
        v35.location = 0;
        BOOL v11 = CFStringFindWithOptions(v10, @"support_virtual_gpio", v35, 0, 0) != 0;
        CFRelease(v10);
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5) {
          CFTypeID v15 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v15 = -1;
        }
        CFTypeID TypeID = CFStringGetTypeID();
        v14(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareHasVirtualGPIO", 324, "required-gpios", v15, TypeID);
      }
      dispatch_get_specific(*v12);
      __int16 v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          CFTypeID v22 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v22 = -1;
        }
        *(_DWORD *)buf = 136447234;
        __int16 v25 = "NFHardwareHasVirtualGPIO";
        __int16 v26 = 1024;
        int v27 = 324;
        __int16 v28 = 2080;
        int v29 = "required-gpios";
        __int16 v30 = 2048;
        CFTypeID v31 = v22;
        __int16 v32 = 2048;
        CFTypeID v33 = CFStringGetTypeID();
        _os_log_impl(&dword_237D7D000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      BOOL v11 = 0;
      BOOL v19 = 0;
      if (!v5) {
        goto LABEL_25;
      }
    }
    CFRelease(v5);
    BOOL v19 = v11;
LABEL_25:
    IOObjectRelease(v3);
    return v19;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17) {
    v17(3, "%s:%i %s doesn't exist", "NFHardwareHasVirtualGPIO", 329, "stockholm");
  }
  dispatch_get_specific(*v16);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v25 = "NFHardwareHasVirtualGPIO";
    __int16 v26 = 1024;
    int v27 = 329;
    __int16 v28 = 2080;
    int v29 = "stockholm";
    _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i %s doesn't exist", buf, 0x1Cu);
  }
  return 0;
}

BOOL NFHardwareGPIOSetPower(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPower", 68, a2);
  }
  dispatch_get_specific(*v4);
  CFTypeID v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetPower";
    __int16 v10 = 1024;
    int v11 = 68;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 0, a2) == 0;
}

uint64_t _NFHardwareGPIOSetBoolean(uint64_t *a1, uint32_t selector, unsigned int a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = a3;
  uint64_t input = a3;
  if (a1)
  {
    uint64_t v6 = *a1;
    mach_port_t v7 = *(_DWORD *)(*a1 + 4);
    if (v7)
    {
      *(unsigned char *)(v6 + 8) = 0;
      uint64_t v8 = IOConnectCallScalarMethod(v7, selector, &input, 1u, 0, 0);
      if (v8)
      {
        CFStringRef v9 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i selector=%d enable=%llu : Failed with %#x", "_NFHardwareGPIOSetBoolean", 56, selector, input, v8);
        }
        dispatch_get_specific(*v9);
        int v11 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          __int16 v21 = "_NFHardwareGPIOSetBoolean";
          __int16 v22 = 1024;
          int v23 = 56;
          __int16 v24 = 1024;
          uint32_t v25 = selector;
          __int16 v26 = 2048;
          uint64_t v27 = input;
          __int16 v28 = 1024;
          int v29 = v8;
          _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Failed with %#x", buf, 0x28u);
        }
        if (v8 == -536870163)
        {
          *(unsigned char *)(*a1 + 8) = 1;
          return 3758097133;
        }
      }
    }
    else
    {
      CFTypeID v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16) {
        v16(3, "%s:%i selector=%d enable=%llu : Not connected", "_NFHardwareGPIOSetBoolean", 48, selector, v3);
      }
      dispatch_get_specific(*v15);
      uint64_t v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v21 = "_NFHardwareGPIOSetBoolean";
        __int16 v22 = 1024;
        int v23 = 48;
        __int16 v24 = 1024;
        uint32_t v25 = selector;
        __int16 v26 = 2048;
        uint64_t v27 = v3;
        _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Not connected", buf, 0x22u);
      }
      return 4294967294;
    }
  }
  else
  {
    __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    unsigned int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Invalid parameter", "_NFHardwareGPIOSetBoolean", 43);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v21 = "_NFHardwareGPIOSetBoolean";
      __int16 v22 = 1024;
      int v23 = 43;
      _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v8;
}

BOOL NFHardwareGPIOSetVBAT(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i VBAT enable=%d", "NFHardwareGPIOSetVBAT", 74, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetVBAT";
    __int16 v10 = 1024;
    int v11 = 74;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i VBAT enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 5u, a2) == 0;
}

BOOL NFHardwareGPIOSetDownloadRequest(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetDownloadRequest", 80, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetDownloadRequest";
    __int16 v10 = 1024;
    int v11 = 80;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 1u, a2) == 0;
}

BOOL NFHardwareGPIOSetPMUStandbyPowerEnabled(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPMUStandbyPowerEnabled", 86, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetPMUStandbyPowerEnabled";
    __int16 v10 = 1024;
    int v11 = 86;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 2u, a2) == 0;
}

BOOL NFHardwareGPIOSetDeviceWake(uint64_t *a1, unsigned int a2)
{
  io_object_t v4 = *(os_unfair_lock_s **)(*a1 + 16);
  if (a2) {
    int v5 = 7;
  }
  else {
    int v5 = 8;
  }
  NFHardwareSerialDebugLog(v4, v5, 0, 0);
  return _NFHardwareGPIOSetBoolean(a1, 3u, a2) == 0;
}

uint64_t NFHardwareGPIOWasItSPMINack(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)a1 + 8);
}

uint64_t NFHardwareGPIOSPMIFollowerReset(uint64_t *a1)
{
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*a1 + 16), 10, 0, 0);

  return _NFHardwareGPIOSetBoolean(a1, 8u, 1u);
}

BOOL NFHardwareGPIOValidateSPMIConfig(uint64_t a1)
{
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  BOOL result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  int v23 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareGPIOValidateSPMIConfig", 114);
  }
  dispatch_get_specific(*v2);
  io_object_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 114;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOValidateSPMIConfig", 117);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 117;
    int v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    __int16 v12 = v15;
    unsigned int v13 = 18;
    goto LABEL_21;
  }
  mach_port_t v5 = *(_DWORD *)(*(void *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Not connected", "NFHardwareGPIOValidateSPMIConfig", 122);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 122;
    int v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  uint64_t v6 = IOConnectCallScalarMethod(v5, 6u, 0, 0, 0, 0);
  if (!v6) {
    return 1;
  }
  mach_port_t v7 = v6;
  dispatch_get_specific(*v2);
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOValidateSPMIConfig", 128, v7);
  }
  dispatch_get_specific(*v2);
  CFStringRef v9 = NFSharedLogGetLogger();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136446722;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 128;
    __int16 v21 = 1024;
    __int16 v22 = v7;
    int v11 = "%{public}s:%i Failed with %#x";
    __int16 v12 = v9;
    unsigned int v13 = 24;
LABEL_21:
    _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

BOOL NFHardwareGPIOConfigureHammerfestSPMI(uint64_t a1)
{
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  BOOL result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  int v23 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareGPIOConfigureHammerfestSPMI", 140);
  }
  dispatch_get_specific(*v2);
  io_object_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 140;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOConfigureHammerfestSPMI", 143);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 143;
    int v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    __int16 v12 = v15;
    unsigned int v13 = 18;
    goto LABEL_21;
  }
  mach_port_t v5 = *(_DWORD *)(*(void *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Not connected", "NFHardwareGPIOConfigureHammerfestSPMI", 148);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 148;
    int v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  uint64_t v6 = IOConnectCallScalarMethod(v5, 7u, 0, 0, 0, 0);
  if (!v6) {
    return 1;
  }
  mach_port_t v7 = v6;
  dispatch_get_specific(*v2);
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOConfigureHammerfestSPMI", 154, v7);
  }
  dispatch_get_specific(*v2);
  CFStringRef v9 = NFSharedLogGetLogger();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136446722;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 154;
    __int16 v21 = 1024;
    __int16 v22 = v7;
    int v11 = "%{public}s:%i Failed with %#x";
    __int16 v12 = v9;
    unsigned int v13 = 24;
LABEL_21:
    _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

void **NFHardwareGPIOOpen(int a1)
{
  kern_return_t v10;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  const void **v20;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v22;
  const void **v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  CFTypeID v33 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (v2)
  {
    uint64_t v3 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040D090CC53uLL);
    if (!v3)
    {
LABEL_28:
      free(v2);
      return 0;
    }
    io_object_t v4 = v3;
    _DWORD *v2 = v3;
    if (a1 == 1)
    {
      uint64_t v6 = "AppleStockholmControl";
      int v5 = 1;
    }
    else
    {
      if (a1 != 2)
      {
        __int16 v20 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i wrong GPIO driver type: %d", "NFHardwareGPIOOpen", 184, a1);
        }
        dispatch_get_specific(*v20);
        __int16 v22 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446722;
        __int16 v28 = "NFHardwareGPIOOpen";
        int v29 = 1024;
        uint64_t v30 = 184;
        CFTypeID v31 = 1024;
        LODWORD(v32) = a1;
        uint64_t v17 = "%{public}s:%i wrong GPIO driver type: %d";
        __int16 v18 = v22;
        BOOL v19 = 24;
        goto LABEL_26;
      }
      int v5 = 0;
      uint64_t v6 = "AppleHammerfestControl";
    }
    *((void *)v4 + 2) = NFHardwareSerialDebugger(v5);
    mach_port_t v7 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v8 = IOServiceNameMatching(v6);
    io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
    *(_DWORD *)io_object_t v4 = MatchingService;
    if (!MatchingService)
    {
      int v23 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24) {
        v24(3, "%s:%i Could not find service: %s", "NFHardwareGPIOOpen", 194, v6);
      }
      dispatch_get_specific(*v23);
      uint32_t v25 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136446722;
      __int16 v28 = "NFHardwareGPIOOpen";
      int v29 = 1024;
      uint64_t v30 = 194;
      CFTypeID v31 = 2080;
      __int16 v32 = v6;
      uint64_t v17 = "%{public}s:%i Could not find service: %s";
      __int16 v18 = v25;
      BOOL v19 = 28;
      goto LABEL_26;
    }
    __int16 v10 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)v4 + 1);
    if (v10)
    {
      int v11 = v10;
      __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      unsigned int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13) {
        v13(3, "%s:%i Could not open service (%#x)", "NFHardwareGPIOOpen", 205, v11);
      }
      dispatch_get_specific(*v12);
      uint64_t v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v28 = "NFHardwareGPIOOpen";
        int v29 = 1024;
        uint64_t v30 = 205;
        CFTypeID v31 = 1024;
        LODWORD(v32) = v11;
        _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not open service (%#x)", buf, 0x18u);
      }
      if (!IOObjectRelease(*(_DWORD *)v4)) {
        goto LABEL_27;
      }
      dispatch_get_specific(*v12);
      CFTypeID v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15) {
        v15(3, "%s:%i Fail to release service", "NFHardwareGPIOOpen", 207);
      }
      dispatch_get_specific(*v12);
      int v16 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136446466;
      __int16 v28 = "NFHardwareGPIOOpen";
      int v29 = 1024;
      uint64_t v30 = 207;
      uint64_t v17 = "%{public}s:%i Fail to release service";
      __int16 v18 = v16;
      BOOL v19 = 18;
LABEL_26:
      _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_27:
      free(*v2);
      goto LABEL_28;
    }
  }
  return v2;
}

void NFHardwareGPIOClose(uint64_t *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = MGGetProductType();
    if (v2 == 3402870384 || v2 == 896202454)
    {
      NFHardwareGPIOSetPower(a1, 1u);
      usleep(0x7D0u);
    }
    uint64_t v3 = (io_object_t *)*a1;
    if (*(_DWORD *)(*a1 + 4))
    {
      if (IOConnectRelease(*(_DWORD *)(*a1 + 4)))
      {
        io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i Fail to release connection", "NFHardwareGPIOClose", 239);
        }
        dispatch_get_specific(*v4);
        uint64_t v6 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v11 = "NFHardwareGPIOClose";
          __int16 v12 = 1024;
          int v13 = 239;
          _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release connection", buf, 0x12u);
        }
      }
      uint64_t v3 = (io_object_t *)*a1;
      *(_DWORD *)(*a1 + 4) = 0;
    }
    if (*v3)
    {
      if (IOObjectRelease(*v3))
      {
        mach_port_t v7 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        CFDictionaryRef v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v8) {
          v8(3, "%s:%i Fail to release service", "NFHardwareGPIOClose", 246);
        }
        dispatch_get_specific(*v7);
        CFStringRef v9 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v11 = "NFHardwareGPIOClose";
          __int16 v12 = 1024;
          int v13 = 246;
          _os_log_impl(&dword_237D7D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
        }
      }
      uint64_t v3 = (io_object_t *)*a1;
      *(_DWORD *)*a1 = 0;
    }
    free(v3);
    free(a1);
  }
}

uint64_t NFHardwareGPIOIsHostWakeCapable()
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"required-gpios", 0, 0);
    CFDataRef v5 = CFProperty;
    if (CFProperty && (CFTypeID v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex Length = CFDataGetLength(v5);
      CFStringRef v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      CFIndex v10 = CFStringGetLength(v9);
      if (!v9) {
        goto LABEL_15;
      }
      CFIndex v11 = v10;
      v55.location = 0;
      v55.length = v10;
      int v12 = CFStringFindWithOptions(v9, @"support_wake_stockholm_soc", v55, 0, 0);
      v56.location = 0;
      v56.length = v11;
      LODWORD(v11) = CFStringFindWithOptions(v9, @"support_wake_stockholm", v56, 0, 0) | v12;
      CFRelease(v9);
      if (v11) {
        uint64_t v13 = 1;
      }
      else {
LABEL_15:
      }
        uint64_t v13 = 0;
      CFRelease(v5);
    }
    else
    {
      uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v16 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5) {
          CFTypeID v17 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v17 = -1;
        }
        CFTypeID TypeID = CFStringGetTypeID();
        v16(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 285, "required-gpios", v17, TypeID);
      }
      dispatch_get_specific(*v14);
      __int16 v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          CFTypeID v23 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v23 = -1;
        }
        *(_DWORD *)buf = 136447234;
        __int16 v45 = "NFHardwareGPIOIsHostWakeCapable";
        __int16 v46 = 1024;
        int v47 = 285;
        __int16 v48 = 2080;
        __int16 v49 = "required-gpios";
        __int16 v50 = 2048;
        CFTypeID v51 = v23;
        __int16 v52 = 2048;
        CFTypeID v53 = CFStringGetTypeID();
        _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (v5) {
        CFRelease(v5);
      }
      uint64_t v13 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    BOOL v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19) {
      v19(3, "%s:%i stockholm doesn't exist", "NFHardwareGPIOIsHostWakeCapable", 290);
    }
    dispatch_get_specific(*v18);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v45 = "NFHardwareGPIOIsHostWakeCapable";
      __int16 v46 = 1024;
      int v47 = 290;
      _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i stockholm doesn't exist", buf, 0x12u);
    }
    uint64_t v13 = 0;
  }
  CFDictionaryRef v24 = IOServiceNameMatching("stockholm-spmi");
  io_service_t v25 = IOServiceGetMatchingService(v0, v24);
  if (v25)
  {
    io_object_t v26 = v25;
    CFDataRef v27 = (const __CFData *)IORegistryEntryCreateCFProperty(v25, @"required-functions", 0, 0);
    CFDataRef v28 = v27;
    if (v27 && (CFTypeID v29 = CFGetTypeID(v27), v29 == CFDataGetTypeID()))
    {
      uint64_t v30 = CFDataGetBytePtr(v28);
      CFIndex v31 = CFDataGetLength(v28);
      CFStringRef v32 = CFStringCreateWithBytes(0, v30, v31, 0x600u, 0);
      CFIndex v33 = CFStringGetLength(v32);
      if (v32)
      {
        v57.length = v33;
        v57.location = 0;
        int v34 = CFStringFindWithOptions(v32, @"support_host_wake_spmi", v57, 0, 0);
        CFRelease(v32);
        if (v34) {
          uint64_t v13 = 1;
        }
      }
    }
    else
    {
      CFRange v35 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v36 = NFLogGetLogger();
      if (v36)
      {
        int v37 = (void (*)(uint64_t, const char *, ...))v36;
        if (v28) {
          CFTypeID v38 = CFGetTypeID(v28);
        }
        else {
          CFTypeID v38 = -1;
        }
        CFTypeID v39 = CFStringGetTypeID();
        v37(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 313, "required-functions", v38, v39);
      }
      dispatch_get_specific(*v35);
      CFStringRef v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        if (v28) {
          CFTypeID v41 = CFGetTypeID(v28);
        }
        else {
          CFTypeID v41 = -1;
        }
        CFTypeID v42 = CFStringGetTypeID();
        *(_DWORD *)buf = 136447234;
        __int16 v45 = "NFHardwareGPIOIsHostWakeCapable";
        __int16 v46 = 1024;
        int v47 = 313;
        __int16 v48 = 2080;
        __int16 v49 = "required-functions";
        __int16 v50 = 2048;
        CFTypeID v51 = v41;
        __int16 v52 = 2048;
        CFTypeID v53 = v42;
        _os_log_impl(&dword_237D7D000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (!v28) {
        goto LABEL_46;
      }
    }
    CFRelease(v28);
LABEL_46:
    IOObjectRelease(v26);
  }
  return v13;
}

uint64_t NFHardwareSerialGetDefaultInterfaceType()
{
  kern_return_t v10;
  BOOL v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  BOOL v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  CFBooleanRef Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  CFDataRef v28 = *MEMORY[0x263EF8340];
  properties = 0;
  io_object_t MatchingService = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
  if (!MatchingService)
  {
    CFDictionaryRef v1 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Could not find service, trying slow path: %s", "NFHardwareSerialGetDefaultInterfaceType", 441, "AppleStockholmControl");
    }
    dispatch_get_specific(*v1);
    io_object_t v3 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
      CFDictionaryRef v24 = 1024;
      io_service_t v25 = 441;
      io_object_t v26 = 2080;
      CFDataRef v27 = "AppleStockholmControl";
      _os_log_impl(&dword_237D7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service, trying slow path: %s", buf, 0x1Cu);
    }
    _NFHardwareDumpIOKit();
    uint64_t result = _NFHardwareLookInTree("nfc,primary,gpio");
    if (!result) {
      return result;
    }
    io_object_t MatchingService = result;
    io_object_t v5 = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
    if (v5) {
      goto LABEL_12;
    }
    unsigned int v6 = 100;
    do
    {
      usleep(0x186A0u);
      io_object_t v5 = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
      if (v5) {
        break;
      }
    }
    while (v6-- > 1);
    if (v5) {
LABEL_12:
    }
      IOObjectRelease(v5);
  }
  IOObjectRelease(MatchingService);
  io_registry_entry_t v8 = _NFHardwareFindMatchingService("AppleStockholmSPMI", "nfc,primary,spmi");
  if (v8)
  {
    io_object_t v9 = v8;
    CFIndex v10 = IORegistryEntryCreateCFProperties(v8, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v10) {
      CFIndex v11 = 1;
    }
    else {
      CFIndex v11 = properties == 0;
    }
    if (v11)
    {
      int v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13) {
        v13(6, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialGetDefaultInterfaceType", 465, v10);
      }
      dispatch_get_specific(*v12);
      uint64_t v14 = NFSharedLogGetLogger();
      CFTypeID v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 136446722;
      CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
      CFDictionaryRef v24 = 1024;
      io_service_t v25 = 465;
      io_object_t v26 = 1024;
      LODWORD(v27) = v10;
      _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
    }
    else if (CFDictionaryContainsKey(properties, @"stockholm-spmi-data-socket"))
    {
      CFDictionaryRef Value = (const __CFBoolean *)CFDictionaryGetValue(properties, @"stockholm-spmi-data-socket");
      CFTypeID v15 = CFBooleanGetValue(Value) != 0;
LABEL_31:
      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      IOObjectRelease(v9);
      if (v15) {
        return 3;
      }
      else {
        return 2;
      }
    }
    CFTypeID v15 = 0;
    goto LABEL_31;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  CFTypeID v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17) {
    v17(6, "%s:%i Could not find service: %s", "NFHardwareSerialGetDefaultInterfaceType", 457, "AppleStockholmSPMI");
  }
  dispatch_get_specific(*v16);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
    CFDictionaryRef v24 = 1024;
    io_service_t v25 = 457;
    io_object_t v26 = 2080;
    CFDataRef v27 = "AppleStockholmSPMI";
    _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
  }
  IOObjectRelease(0);
  return 1;
}

uint64_t _NFHardwareFindMatchingService(const char *a1, const char *a2)
{
  kern_return_t MatchingServices;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const void **v18;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  const char *v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  uint64_t v27;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  const void **v32;
  void (*v33)(uint64_t, const char *, ...);
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  uint64_t v41;

  CFTypeID v41 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to create property matching dictionary", "_NFHardwareFindMatchingService", 358);
    }
    dispatch_get_specific(*v18);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v36 = "_NFHardwareFindMatchingService";
      int v37 = 1024;
      CFTypeID v38 = 358;
      _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create property matching dictionary", buf, 0x12u);
    }
    return 0;
  }
  io_object_t v5 = Mutable;
  CFStringRef v6 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v6)
  {
    __int16 v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22) {
      v22(3, "%s:%i Failed to create CF property string", "_NFHardwareFindMatchingService", 363);
    }
    dispatch_get_specific(*v21);
    CFTypeID v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 363;
    CFDictionaryRef v24 = "%{public}s:%i Failed to create CF property string";
    goto LABEL_21;
  }
  CFStringRef v7 = v6;
  CFDictionarySetValue(v5, @"IONameMatched", v6);
  CFRelease(v7);
  io_registry_entry_t v8 = IOServiceMatching(a1);
  if (!v8)
  {
    io_service_t v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    io_object_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(3, "%s:%i Failed to create matching dictionary", "_NFHardwareFindMatchingService", 372);
    }
    dispatch_get_specific(*v25);
    CFTypeID v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 372;
    CFDictionaryRef v24 = "%{public}s:%i Failed to create matching dictionary";
LABEL_21:
    _os_log_impl(&dword_237D7D000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
LABEL_22:
    CFRelease(v5);
    return 0;
  }
  CFDictionaryRef v9 = v8;
  CFDictionarySetValue(v8, @"IOPropertyMatch", v5);
  CFRelease(v5);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v9, &existing);
  if (MatchingServices)
  {
    CFIndex v11 = MatchingServices;
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Failed to lookup service : 0x%x", "_NFHardwareFindMatchingService", 397, v11);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 397;
    CFTypeID v39 = 1024;
    CFStringRef v40 = v11;
    CFTypeID v15 = "%{public}s:%i Failed to lookup service : 0x%x";
    int v16 = v14;
    CFTypeID v17 = 24;
    goto LABEL_37;
  }
  if (!existing || !IOIteratorIsValid(existing))
  {
    CFStringRef v32 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFIndex v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v33) {
      v33(3, "%s:%i Failed to get iterator for service", "_NFHardwareFindMatchingService", 389);
    }
    dispatch_get_specific(*v32);
    CFIndex v31 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 389;
    CFTypeID v15 = "%{public}s:%i Failed to get iterator for service";
    goto LABEL_36;
  }
  CFDataRef v27 = IOIteratorNext(existing);
  if (v27) {
    goto LABEL_39;
  }
  CFTypeID v29 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v30) {
    v30(3, "%s:%i Failed to get valid service", "_NFHardwareFindMatchingService", 393);
  }
  dispatch_get_specific(*v29);
  CFIndex v31 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 393;
    CFTypeID v15 = "%{public}s:%i Failed to get valid service";
LABEL_36:
    int v16 = v31;
    CFTypeID v17 = 18;
LABEL_37:
    _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_38:
  CFDataRef v27 = 0;
LABEL_39:
  if (existing) {
    IOObjectRelease(existing);
  }
  return v27;
}

void _NFHardwareDumpIOKit()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  mach_port_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 316);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 316;
    _os_log_impl(&dword_237D7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  dispatch_get_specific(*v0);
  CFStringRef v6 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v6) {
    v6(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 318, "stockholm", MatchingService);
  }
  dispatch_get_specific(*v0);
  CFStringRef v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 318;
    __int16 v30 = 2080;
    CFIndex v31 = "stockholm";
    __int16 v32 = 1024;
    io_service_t v33 = MatchingService;
    _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(MatchingService);
  CFDictionaryRef v8 = IOServiceNameMatching("stockholm-spmi");
  io_service_t v9 = IOServiceGetMatchingService(v3, v8);
  dispatch_get_specific(*v0);
  CFIndex v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10) {
    v10(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 322, "stockholm-spmi", v9);
  }
  dispatch_get_specific(*v0);
  CFIndex v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 322;
    __int16 v30 = 2080;
    CFIndex v31 = "stockholm-spmi";
    __int16 v32 = 1024;
    io_service_t v33 = v9;
    _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v9);
  CFDictionaryRef v12 = IOServiceNameMatching("AppleStockholmSPMI");
  io_service_t v13 = IOServiceGetMatchingService(v3, v12);
  dispatch_get_specific(*v0);
  uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v14) {
    v14(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 326, "AppleStockholmSPMI", v13);
  }
  dispatch_get_specific(*v0);
  CFTypeID v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 326;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmSPMI";
    __int16 v32 = 1024;
    io_service_t v33 = v13;
    _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v13);
  CFDictionaryRef v16 = IOServiceNameMatching("AppleStockholmControl");
  io_service_t v17 = IOServiceGetMatchingService(v3, v16);
  dispatch_get_specific(*v0);
  __int16 v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v18) {
    v18(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 330, "AppleStockholmControl", v17);
  }
  dispatch_get_specific(*v0);
  BOOL v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 330;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmControl";
    __int16 v32 = 1024;
    io_service_t v33 = v17;
    _os_log_impl(&dword_237D7D000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v17);
  CFDictionaryRef v20 = IOServiceNameMatching("AppleStockholmControlUserClient");
  io_service_t v21 = IOServiceGetMatchingService(v3, v20);
  dispatch_get_specific(*v0);
  __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v22) {
    v22(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 334, "AppleStockholmControlUserClient", v21);
  }
  dispatch_get_specific(*v0);
  CFTypeID v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 334;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmControlUserClient";
    __int16 v32 = 1024;
    io_service_t v33 = v21;
    _os_log_impl(&dword_237D7D000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v21);
  dispatch_get_specific(*v0);
  CFDictionaryRef v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24) {
    v24(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 338);
  }
  dispatch_get_specific(*v0);
  io_service_t v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 338;
    _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  _NFHardwarePrintNode("stockholm");
  _NFHardwarePrintNode("stockholm-spmi");
  _NFHardwarePrintNode("AppleStockholmSPMI");
  _NFHardwarePrintNode("AppleStockholmControl");
  _NFHardwarePrintNode("AppleStockholmControlUserClient");
  _NFHardwarePrintNode("hammerfest");
  _NFHardwarePrintNode("AppleHammerfestSPMI");
  _NFHardwarePrintNode("AppleHammerfestControl");
}

uint64_t _NFHardwareLookInTree(const char *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  io_object_t object = 0;
  uint64_t RootEntry = IORegistryGetRootEntry(*MEMORY[0x263F0EC88]);
  if (MEMORY[0x237E2FF30](RootEntry, "IOService", 1, &object))
  {
    mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to create iterator", "_NFHardwareLookInTree", 302);
    }
    dispatch_get_specific(*v3);
    io_object_t v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      CFIndex v10 = "_NFHardwareLookInTree";
      __int16 v11 = 1024;
      int v12 = 302;
      _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create iterator", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    uint64_t v6 = _NFHardwareWalkTree(object, a1);
    IOObjectRelease(object);
  }
  return v6;
}

BOOL NFHardwareSerialIsHammerfestAlive()
{
  kern_return_t v5;
  BOOL v6;
  void (*v7)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  BOOL v11;
  CFBooleanRef Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  __int16 v22 = *MEMORY[0x263EF8340];
  mach_port_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialIsHammerfestAlive", 495);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
    __int16 v18 = 1024;
    BOOL v19 = 495;
    _os_log_impl(&dword_237D7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  io_registry_entry_t MatchingService = _NFHardwareFindMatchingService("AppleStockholmSPMI", "nfc,secondary,spmi");
  io_object_t v4 = MatchingService;
  if (MatchingService)
  {
    properties = 0;
    io_object_t v5 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = properties == 0;
    }
    if (v6)
    {
      dispatch_get_specific(*v0);
      CFStringRef v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v7) {
        v7(3, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialIsHammerfestAlive", 510, v5);
      }
      dispatch_get_specific(*v0);
      CFDictionaryRef v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
        __int16 v18 = 1024;
        BOOL v19 = 510;
        CFDictionaryRef v20 = 1024;
        LODWORD(v21) = v5;
        _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
      }
    }
    else if (CFDictionaryContainsKey(properties, @"hammerfest-data-available-event"))
    {
      CFDictionaryRef Value = (const __CFBoolean *)CFDictionaryGetValue(properties, @"hammerfest-data-available-event");
      __int16 v11 = CFBooleanGetValue(Value) != 0;
      goto LABEL_22;
    }
    __int16 v11 = 0;
LABEL_22:
    if (properties) {
      CFRelease(properties);
    }
    goto LABEL_24;
  }
  dispatch_get_specific(*v0);
  io_service_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v9) {
    v9(6, "%s:%i Could not find service: %s", "NFHardwareSerialIsHammerfestAlive", 502, "AppleHammerfestSPMI");
  }
  dispatch_get_specific(*v0);
  CFIndex v10 = NFSharedLogGetLogger();
  __int16 v11 = 0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
    __int16 v18 = 1024;
    BOOL v19 = 502;
    CFDictionaryRef v20 = 2080;
    io_service_t v21 = "AppleHammerfestSPMI";
    _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    __int16 v11 = 0;
  }
LABEL_24:
  IOObjectRelease(v4);
  return v11;
}

uint64_t NFHardwareSerialIsSupported(const char *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFDictionaryRef v1 = "nfc,primary,gpio";
  if (a1 && strcasestr(a1, "hammerfest")) {
    CFDictionaryRef v1 = "nfc,secondary,gpio";
  }
  LODWORD(result) = _NFHardwareFindMatchingService("AppleStockholmControl", v1);
  if (result) {
    goto LABEL_10;
  }
  mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Could not find service with: %s, retrying slow path", "NFHardwareSerialIsSupported", 538, v1);
  }
  dispatch_get_specific(*v3);
  io_object_t v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v7 = "NFHardwareSerialIsSupported";
    __int16 v8 = 1024;
    int v9 = 538;
    __int16 v10 = 2080;
    __int16 v11 = v1;
    _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service with: %s, retrying slow path", buf, 0x1Cu);
  }
  _NFHardwareDumpIOKit();
  uint64_t result = _NFHardwareLookInTree(v1);
  if (result)
  {
LABEL_10:
    IOObjectRelease(result);
    return 1;
  }
  return result;
}

uint64_t NFHardwareSerialReadBlockAbort(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(void *)(a1 + 8) + 88), 4, 0, 0);
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 120))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
    ++*(_DWORD *)(*(void *)(a1 + 8) + 120);
    mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      io_object_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v5(6, "%s:%i Read aborted while in progress since %llu.", "NFHardwareSerialReadBlockAbort", 604, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v3);
    CFStringRef v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      __int16 v10 = "NFHardwareSerialReadBlockAbort";
      __int16 v11 = 1024;
      int v12 = 604;
      __int16 v13 = 2048;
      uint64_t v14 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Read aborted while in progress since %llu.", buf, 0x1Cu);
    }
    *(void *)(*(void *)(a1 + 8) + 128) = 0;
  }
  return 0;
}

uint64_t NFHardwareSerialWriteBlockAbort(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(void *)(a1 + 8) + 88), 6, 0, 0);
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 144))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 136));
    uint64_t v3 = *(void *)(a1 + 8);
    ++*(_DWORD *)(v3 + 144);
    *(void *)(v3 + 152) = 0;
    *(void *)(v3 + 160) = 0;
    *(_DWORD *)(v3 + 168) = 0;
    io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Write aborted while in progress.", "NFHardwareSerialWriteBlockAbort", 622);
    }
    dispatch_get_specific(*v4);
    uint64_t v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v9 = "NFHardwareSerialWriteBlockAbort";
      __int16 v10 = 1024;
      int v11 = 622;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Write aborted while in progress.", buf, 0x12u);
    }
  }
  return 0;
}

uint64_t NFHardwareSerialReadBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v5 + 120))
  {
    uint64_t v6 = *(NSObject **)(v5 + 112);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __NFHardwareSerialReadBlock_block_invoke;
    handler[3] = &unk_264D01120;
    handler[6] = a1;
    handler[7] = a2;
    handler[4] = a4;
    handler[5] = a3;
    dispatch_source_set_event_handler(v6, handler);
    uint64_t v7 = *(void *)(a1 + 8);
    int v8 = *(_DWORD *)(v7 + 120);
    if (v8)
    {
      *(_DWORD *)(v7 + 120) = v8 - 1;
      uint64_t v9 = mach_continuous_time();
      uint64_t v7 = *(void *)(a1 + 8);
      *(void *)(v7 + 128) = v9;
    }
    dispatch_resume(*(dispatch_object_t *)(v7 + 112));
    return 0;
  }
  else
  {
    int v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v13 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v13(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialReadBlock", 664, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v11);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      __int16 v18 = "NFHardwareSerialReadBlock";
      __int16 v19 = 1024;
      int v20 = 664;
      __int16 v21 = 2048;
      uint64_t v22 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_237D7D000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Error : read already in progress.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t __NFHardwareSerialReadBlock_block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  size_t v2 = *(void *)(a1 + 40);
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 112));
  if (data < v2)
  {
    io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Only %lu bytes available, requested %zu !", "NFHardwareSerialReadBlock_block_invoke", 677, data, *(void *)(a1 + 40));
    }
    dispatch_get_specific(*v4);
    uint64_t v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446978;
      uint64_t v36 = "NFHardwareSerialReadBlock_block_invoke";
      __int16 v37 = 1024;
      int v38 = 677;
      __int16 v39 = 2048;
      CFStringRef v40 = (const char *)data;
      __int16 v41 = 2048;
      uint64_t v42 = v7;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only %lu bytes available, requested %zu !", buf, 0x26u);
    }
  }
  int v8 = *(char **)(a1 + 56);
  if (!v8)
  {
    __int16 v30 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFIndex v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31) {
      v31(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 633, "buffer!=((void *)0)");
    }
    dispatch_get_specific(*v30);
    __int16 v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 633;
      __int16 v39 = 2080;
      CFStringRef v40 = "buffer!=((void *)0)";
LABEL_31:
      _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_32:
    abort();
  }
  if (!v2)
  {
    io_service_t v33 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34) {
      v34(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 634, "*length>0");
    }
    dispatch_get_specific(*v33);
    __int16 v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 634;
      __int16 v39 = 2080;
      CFStringRef v40 = "*length>0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  ssize_t v10 = read(*(_DWORD *)v9, *(void **)(a1 + 56), v2);
  if (v10 < 0)
  {
    uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      CFDictionaryRef v16 = (void (*)(uint64_t, const char *, ...))v15;
      io_service_t v17 = __error();
      __int16 v18 = strerror(*v17);
      __int16 v19 = __error();
      v16(3, "%s:%i \"%s\" errno=%d ", "_NFHardwareSerialRead", 640, v18, *v19);
    }
    dispatch_get_specific(*v14);
    int v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = __error();
      uint64_t v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)buf = 136446978;
      uint64_t v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 640;
      __int16 v39 = 2080;
      CFStringRef v40 = v22;
      __int16 v41 = 1024;
      LODWORD(v42) = v23;
      _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    __int16 v13 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t v12 = *(void (**)(void, uint64_t, const char *, char *, ssize_t))(v11 + 80);
    if (v12)
    {
      v12(*(unsigned __int8 *)(v11 + 96), 7, "[RX<]", v8, v10);
      uint64_t v11 = *(void *)(v9 + 8);
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v11 + 88), 3, v8, v10);
    __int16 v13 = (const char *)v10;
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 112));
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  ++*(_DWORD *)(v24 + 120);
  *(void *)(v24 + 128) = 0;
  if ((unint64_t)v13 < *(void *)(a1 + 40))
  {
    io_service_t v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    io_object_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(6, "%s:%i Only got %zu bytes, requested %zu, available %lu.", "NFHardwareSerialReadBlock_block_invoke", 692, (size_t)v13, *(void *)(a1 + 40), data);
    }
    dispatch_get_specific(*v25);
    CFDataRef v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136447234;
      uint64_t v36 = "NFHardwareSerialReadBlock_block_invoke";
      __int16 v37 = 1024;
      int v38 = 692;
      __int16 v39 = 2048;
      CFStringRef v40 = v13;
      __int16 v41 = 2048;
      uint64_t v42 = v28;
      __int16 v43 = 2048;
      uintptr_t v44 = data;
      _os_log_impl(&dword_237D7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only got %zu bytes, requested %zu, available %lu.", buf, 0x30u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t NFHardwareSerialWriteBlock(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  if (!a2)
  {
    uint64_t v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 716, "buffer!=((void *)0)");
    }
    dispatch_get_specific(*v22);
    uint64_t v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    CFRange v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 716;
    __int16 v38 = 2080;
    __int16 v39 = "buffer!=((void *)0)";
LABEL_42:
    _os_log_impl(&dword_237D7D000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    goto LABEL_43;
  }
  if (!a3)
  {
    io_service_t v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    io_object_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 717, "length!=0");
    }
    dispatch_get_specific(*v25);
    uint64_t v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    CFRange v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 717;
    __int16 v38 = 2080;
    __int16 v39 = "length!=0";
    goto LABEL_42;
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if (*(void *)(v7 + 152))
  {
    int v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v9) {
      v9(3, "%s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", "NFHardwareSerialWriteBlock", 721, *(void *)(*(void *)(a1 + 8) + 160), *(_DWORD *)(*(void *)(a1 + 8) + 168), *(_DWORD *)(*(void *)(a1 + 8) + 144));
    }
    dispatch_get_specific(*v8);
    ssize_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v12 = *(const char **)(v11 + 160);
      int v13 = *(_DWORD *)(v11 + 168);
      LODWORD(v11) = *(_DWORD *)(v11 + 144);
      *(_DWORD *)buf = 136447234;
      CFRange v35 = "NFHardwareSerialWriteBlock";
      __int16 v36 = 1024;
      int v37 = 721;
      __int16 v38 = 2048;
      __int16 v39 = v12;
      __int16 v40 = 1024;
      int v41 = v13;
      __int16 v42 = 1024;
      int v43 = v11;
      _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", buf, 0x28u);
    }
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v15 = *(void (**)(void, uint64_t, const char *, char *, unint64_t))(v14 + 80);
    if (v15) {
      v15(*(unsigned __int8 *)(v14 + 96), 7, "[TX>] Failed : Busy", a2, a3);
    }
    return 0xFFFFFFFFLL;
  }
  __int16 v18 = *(void (**)(void, uint64_t, const char *, char *, unint64_t))(v7 + 80);
  if (v18)
  {
    v18(*(unsigned __int8 *)(v7 + 96), 7, "[TX>]", a2, a3);
    uint64_t v7 = *(void *)(a1 + 8);
  }
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v7 + 88), 5, a2, a3);
  uint64_t v19 = *(void *)(a1 + 8);
  if (*(void *)(v19 + 152))
  {
    CFDataRef v27 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28) {
      v28(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 732, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)");
    }
    dispatch_get_specific(*v27);
    uint64_t v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    CFRange v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 732;
    __int16 v38 = 2080;
    __int16 v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)";
    goto LABEL_42;
  }
  if (*(void *)(v19 + 160))
  {
    int v29 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30) {
      v30(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 733, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0");
    }
    dispatch_get_specific(*v29);
    uint64_t v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    CFRange v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 733;
    __int16 v38 = 2080;
    __int16 v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0";
    goto LABEL_42;
  }
  if (*(_DWORD *)(v19 + 144) != 1)
  {
    CFIndex v31 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v32) {
      v32(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 734, "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1");
    }
    dispatch_get_specific(*v31);
    uint64_t v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      CFRange v35 = "NFHardwareSerialWriteBlock";
      __int16 v36 = 1024;
      int v37 = 734;
      __int16 v38 = 2080;
      __int16 v39 = "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1";
      goto LABEL_42;
    }
LABEL_43:
    abort();
  }
  *(void *)(v19 + 152) = a2;
  *(void *)(v19 + 160) = a3;
  *(_DWORD *)(v19 + 168) = 0;
  int v20 = *(NSObject **)(v19 + 136);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __NFHardwareSerialWriteBlock_block_invoke;
  handler[3] = &unk_264D01148;
  handler[4] = a4;
  handler[5] = a1;
  dispatch_source_set_event_handler(v20, handler);
  uint64_t v21 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v21 + 144))
  {
    *(_DWORD *)(v21 + 144) = 0;
    dispatch_resume(*(dispatch_object_t *)(v21 + 136));
  }
  return 0;
}

ssize_t __NFHardwareSerialWriteBlock_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  ssize_t result = write(**(_DWORD **)(a1 + 40), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 152), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 160));
  if (result < 0)
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v8 = (void (*)(uint64_t, const char *, ...))Logger;
      uint64_t v9 = __error();
      ssize_t v10 = strerror(*v9);
      uint64_t v11 = __error();
      v8(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialWriteBlock_block_invoke", 746, v10, *v11);
    }
    dispatch_get_specific(*v6);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = __error();
      uint64_t v14 = strerror(*v13);
      int v15 = *__error();
      *(_DWORD *)buf = 136446978;
      io_service_t v17 = "NFHardwareSerialWriteBlock_block_invoke";
      __int16 v18 = 1024;
      int v19 = 746;
      __int16 v20 = 2080;
      uint64_t v21 = v14;
      __int16 v22 = 1024;
      int v23 = v15;
      _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v3 + 160) = 0;
    goto LABEL_9;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 152) += result;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 160);
  *(_DWORD *)(v3 + 168) += result;
  ssize_t v5 = v4 - result;
  *(void *)(v3 + 160) = v5;
  if (!v5)
  {
LABEL_9:
    *(void *)(v3 + 152) = 0;
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 136));
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 144);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t NFHardwareSerialFlush(int *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)a1 + 1);
  if (*(unsigned char *)(v2 + 97))
  {
    _NFHardwareSerialSetNonBlock(a1, 1);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v2 + 120))
  {
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global);
    dispatch_resume(*(dispatch_object_t *)(v2 + 112));
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 112));
    dispatch_release(*(dispatch_object_t *)(v2 + 112));
    *(void *)(v2 + 112) = 0;
    while (1)
    {
LABEL_5:
      while (1)
      {
        ssize_t v3 = read(*a1, &v27, 1uLL);
        if (v3 < 0) {
          break;
        }
        if (!v3)
        {
          io_service_t v17 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i Unexpected result", "NFHardwareSerialFlush", 819);
          }
          dispatch_get_specific(*v17);
          int v19 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            int v29 = "NFHardwareSerialFlush";
            __int16 v30 = 1024;
            int v31 = 819;
            uint64_t v14 = "%{public}s:%i Unexpected result";
            int v15 = v19;
            uint32_t v16 = 18;
LABEL_18:
            _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
          }
          goto LABEL_19;
        }
      }
      if (*__error() == 35) {
        break;
      }
      if (*__error() != 4)
      {
        uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v5 = NFLogGetLogger();
        if (v5)
        {
          uint64_t v6 = (void (*)(uint64_t, const char *, ...))v5;
          uint64_t v7 = __error();
          int v8 = strerror(*v7);
          uint64_t v9 = __error();
          v6(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialFlush", 813, v8, *v9);
        }
        dispatch_get_specific(*v4);
        ssize_t v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = __error();
          uint64_t v12 = strerror(*v11);
          int v13 = *__error();
          *(_DWORD *)buf = 136446978;
          int v29 = "NFHardwareSerialFlush";
          __int16 v30 = 1024;
          int v31 = 813;
          __int16 v32 = 2080;
          uint64_t v33 = (uint64_t)v12;
          __int16 v34 = 1024;
          int v35 = v13;
          uint64_t v14 = "%{public}s:%i \"%s\" errno=%d ";
          int v15 = v10;
          uint32_t v16 = 34;
          goto LABEL_18;
        }
LABEL_19:
        uint64_t v20 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v20 = 1;
LABEL_21:
    if (*(unsigned char *)(v2 + 97))
    {
      _NFHardwareSerialSetNonBlock(a1, 0);
    }
    else if (!*(void *)(v2 + 112))
    {
      *(void *)(v2 + 112) = dispatch_source_create(MEMORY[0x263EF83E8], *a1, 0, *(dispatch_queue_t *)(v2 + 104));
      dispatch_set_qos_class_fallback();
      dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global_40);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global_45);
      dispatch_activate(*(dispatch_object_t *)(v2 + 112));
      dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
      *(_DWORD *)(v2 + 120) = 1;
      *(void *)(*((void *)a1 + 1) + 128) = 0;
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v2 + 88), 9, 0, 0);
  }
  else
  {
    __int16 v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))v23;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v24(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialFlush", 783, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v22);
    io_object_t v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      int v29 = "NFHardwareSerialFlush";
      __int16 v30 = 1024;
      int v31 = 783;
      __int16 v32 = 2048;
      uint64_t v33 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_237D7D000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    return 0;
  }
  return v20;
}

BOOL _NFHardwareSerialSetNonBlock(int *a1, int a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v4 = fcntl(*a1, 3, 0);
  if (v4 != -1)
  {
    if (a2) {
      int v5 = 4;
    }
    else {
      int v5 = 0;
    }
    if (fcntl(*a1, 4, v4 & 0xFFFFFFFB | v5))
    {
      uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v8 = (void (*)(uint64_t, const char *, ...))Logger;
        uint64_t v9 = __error();
        ssize_t v10 = strerror(*v9);
        uint64_t v11 = __error();
        v8(3, "%s:%i \"%s\" errno=%d Failed to set flags", "_NFHardwareSerialSetNonBlock", 109, v10, *v11);
      }
      dispatch_get_specific(*v6);
      uint64_t v12 = NFSharedLogGetLogger();
      BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v14 = __error();
        int v15 = strerror(*v14);
        int v16 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v36 = "_NFHardwareSerialSetNonBlock";
        __int16 v37 = 1024;
        int v38 = 109;
        __int16 v39 = 2080;
        __int16 v40 = v15;
        __int16 v41 = 1024;
        int v42 = v16;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d Failed to set flags";
LABEL_14:
        _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0;
      }
      return result;
    }
    char v27 = fcntl(*a1, 3, 0);
    uint64_t v28 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if ((v27 & 4) != 0)
    {
      if (v29) {
        v29(6, "%s:%i Socket is non-blocking", "_NFHardwareSerialSetNonBlock", 114);
      }
      dispatch_get_specific(*v28);
      __int16 v34 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v36 = "_NFHardwareSerialSetNonBlock";
      __int16 v37 = 1024;
      int v38 = 114;
      int v31 = "%{public}s:%i Socket is non-blocking";
      __int16 v32 = v34;
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (v29) {
        v29(3, "%s:%i Socket is blocking !!", "_NFHardwareSerialSetNonBlock", 116);
      }
      dispatch_get_specific(*v28);
      __int16 v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        return 1;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v36 = "_NFHardwareSerialSetNonBlock";
      __int16 v37 = 1024;
      int v38 = 116;
      int v31 = "%{public}s:%i Socket is blocking !!";
      __int16 v32 = v30;
      os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_237D7D000, v32, v33, v31, buf, 0x12u);
    return 1;
  }
  __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
    uint64_t v21 = __error();
    __int16 v22 = strerror(*v21);
    uint64_t v23 = __error();
    v20(3, "%s:%i \"%s\" errno=%d Failed to get flags", "_NFHardwareSerialSetNonBlock", 103, v22, *v23);
  }
  dispatch_get_specific(*v18);
  uint64_t v12 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (result)
  {
    uint64_t v24 = __error();
    io_service_t v25 = strerror(*v24);
    int v26 = *__error();
    *(_DWORD *)buf = 136446978;
    uint64_t v36 = "_NFHardwareSerialSetNonBlock";
    __int16 v37 = 1024;
    int v38 = 103;
    __int16 v39 = 2080;
    __int16 v40 = v25;
    __int16 v41 = 1024;
    int v42 = v26;
    io_service_t v17 = "%{public}s:%i \"%s\" errno=%d Failed to get flags";
    goto LABEL_14;
  }
  return result;
}

void __NFHardwareSerialFlush_block_invoke_37()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "NFHardwareSerialFlush_block_invoke", 832);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    int v4 = "NFHardwareSerialFlush_block_invoke";
    __int16 v5 = 1024;
    int v6 = 832;
    _os_log_impl(&dword_237D7D000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

uint64_t NFHardwareSerialReset(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (**(unsigned char **)(a1 + 8)) {
      return 1;
    }
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i ", "NFHardwareSerialReset", 857);
    }
    dispatch_get_specific(*v6);
    int v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 857;
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
    }
    int v21 = 3;
    if (!setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
    {
      unsigned int v10 = -1;
      while (v10 != 2)
      {
        int v21 = 3;
        ++v10;
        if (setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
        {
          BOOL v2 = v10 > 2;
          unsigned int v9 = v10 + 1;
          goto LABEL_19;
        }
      }
      return 1;
    }
    BOOL v2 = 0;
    unsigned int v9 = 0;
LABEL_19:
    dispatch_get_specific(*v6);
    uint64_t v11 = NFLogGetLogger();
    if (v11)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))v11;
      int v13 = __error();
      uint64_t v14 = strerror(*v13);
      int v15 = __error();
      v12(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", "NFHardwareSerialReset", 865, v14, *v15, v9);
    }
    dispatch_get_specific(*v6);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      io_service_t v17 = __error();
      __int16 v18 = strerror(*v17);
      int v19 = *__error();
      *(_DWORD *)buf = 136447234;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 865;
      __int16 v26 = 2080;
      char v27 = v18;
      __int16 v28 = 1024;
      int v29 = v19;
      __int16 v30 = 1024;
      unsigned int v31 = v9;
      _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", buf, 0x28u);
    }
  }
  else
  {
    ssize_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v4 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v4) {
      v4(3, "%s:%i Serial device not opened!", "NFHardwareSerialReset", 849);
    }
    dispatch_get_specific(*v3);
    __int16 v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 849;
      _os_log_impl(&dword_237D7D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Serial device not opened!", buf, 0x12u);
    }
    return 0;
  }
  return v2;
}

BOOL NFHardwareSerialSetBaudRate(uint64_t a1, speed_t a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  speed_t v52 = a2;
  if (a1)
  {
    if (**(unsigned char **)(a1 + 8)) {
      return 1;
    }
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i baudRate=%lu", "NFHardwareSerialSetBaudRate", 884, a2);
    }
    dispatch_get_specific(*v11);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 884;
      __int16 v57 = 2048;
      speed_t v58 = a2;
      _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i baudRate=%lu", buf, 0x1Cu);
    }
    uint64_t v14 = *(void *)(a1 + 8);
    if (*(unsigned char *)(v14 + 1))
    {
      int v15 = (const void *)(v14 + 8);
      socklen_t v51 = 72;
      if (getsockopt(*(_DWORD *)a1, 2, 1078490131, (void *)(v14 + 8), &v51))
      {
        dispatch_get_specific(*v11);
        uint64_t v16 = NFLogGetLogger();
        if (v16)
        {
          io_service_t v17 = (void (*)(uint64_t, const char *, ...))v16;
          __int16 v18 = __error();
          int v19 = strerror(*v18);
          uint64_t v20 = __error();
          v17(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 891, v19, *v20);
        }
        dispatch_get_specific(*v11);
        int v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        __int16 v22 = __error();
        uint64_t v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v54 = "NFHardwareSerialSetBaudRate";
        __int16 v55 = 1024;
        int v56 = 891;
        __int16 v57 = 2080;
        speed_t v58 = (speed_t)v23;
        __int16 v59 = 1024;
        int v60 = v24;
        uint64_t v7 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_18;
      }
      if (!cfsetspeed((termios *)(*(void *)(a1 + 8) + 8), a2))
      {
        if (!setsockopt(*(_DWORD *)a1, 2, -2142735340, v15, 0x48u)) {
          return 1;
        }
        dispatch_get_specific(*v11);
        uint64_t v43 = NFLogGetLogger();
        if (v43)
        {
          uint64_t v44 = (void (*)(uint64_t, const char *, ...))v43;
          uint64_t v45 = __error();
          __int16 v46 = strerror(*v45);
          int v47 = __error();
          v44(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 901, v46, *v47);
        }
        dispatch_get_specific(*v11);
        int v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        __int16 v48 = __error();
        __int16 v49 = strerror(*v48);
        int v50 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v54 = "NFHardwareSerialSetBaudRate";
        __int16 v55 = 1024;
        int v56 = 901;
        __int16 v57 = 2080;
        speed_t v58 = (speed_t)v49;
        __int16 v59 = 1024;
        int v60 = v50;
        uint64_t v7 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
LABEL_18:
        int v8 = v21;
        uint32_t v9 = 34;
        goto LABEL_30;
      }
      dispatch_get_specific(*v11);
      uint64_t v34 = NFLogGetLogger();
      if (v34)
      {
        int v35 = (void (*)(uint64_t, const char *, ...))v34;
        uint64_t v36 = __error();
        __int16 v37 = strerror(*v36);
        int v38 = __error();
        v35(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 896, v37, *v38, a2);
      }
      dispatch_get_specific(*v11);
      __int16 v39 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      __int16 v40 = __error();
      __int16 v41 = strerror(*v40);
      int v42 = *__error();
      *(_DWORD *)buf = 136447234;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 896;
      __int16 v57 = 2080;
      speed_t v58 = (speed_t)v41;
      __int16 v59 = 1024;
      int v60 = v42;
      __int16 v61 = 2048;
      speed_t v62 = a2;
      uint64_t v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      int v8 = v39;
LABEL_29:
      uint32_t v9 = 44;
      goto LABEL_30;
    }
    if ((ioctl(*(_DWORD *)a1, 0x80085402uLL, &v52) & 0x80000000) == 0) {
      return 1;
    }
    dispatch_get_specific(*v11);
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      __int16 v26 = (void (*)(uint64_t, const char *, ...))v25;
      char v27 = __error();
      __int16 v28 = strerror(*v27);
      int v29 = __error();
      v26(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 908, v28, *v29, v52);
    }
    dispatch_get_specific(*v11);
    __int16 v30 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (result)
    {
      unsigned int v31 = __error();
      uint64_t v32 = strerror(*v31);
      int v33 = *__error();
      *(_DWORD *)buf = 136447234;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 908;
      __int16 v57 = 2080;
      speed_t v58 = (speed_t)v32;
      __int16 v59 = 1024;
      int v60 = v33;
      __int16 v61 = 2048;
      speed_t v62 = v52;
      uint64_t v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      int v8 = v30;
      goto LABEL_29;
    }
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v5 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v5) {
      v5(3, "%s:%i Serial device not opened!", "NFHardwareSerialSetBaudRate", 875);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 875;
      uint64_t v7 = "%{public}s:%i Serial device not opened!";
      int v8 = v6;
      uint32_t v9 = 18;
LABEL_30:
      _os_log_impl(&dword_237D7D000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareSerialSetLogFunction(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 8) + 80) = a2;
  return 1;
}

int *NFHardwareSerialOpen(const char *a1, NSObject *a2, BOOL a3)
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v154 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialOpen", 1121, "devicePath != ((void *)0)");
    }
    dispatch_get_specific(*v154);
    v156 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler[0]) = 136446722;
      *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1121;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = "devicePath != ((void *)0)";
      _os_log_impl(&dword_237D7D000, v156, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)handler, 0x1Cu);
    }
    abort();
  }
  int v6 = (int *)malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
  if (!v6) {
    goto LABEL_72;
  }
  uint64_t v7 = (BOOL *)malloc_type_calloc(1uLL, 0xB0uLL, 0x10B0040FC08F2D4uLL);
  if (!v7) {
    goto LABEL_72;
  }
  int v8 = v7;
  *((void *)v6 + 1) = v7;
  BOOL v9 = strcasestr(a1, "hammerfest") == 0;
  v8[96] = v9;
  unsigned int v10 = (os_unfair_lock_s *)NFHardwareSerialDebugger(v9);
  *((void *)v8 + 11) = v10;
  BOOL v11 = 1;
  NFHardwareSerialDebugLog(v10, 1, 0, 0);
  v8[97] = a3;
  if (strlen(a1) >= 5) {
    BOOL v11 = strncmp(a1, "/dev/", 5uLL) != 0;
  }
  v8[1] = v11;
  BOOL *v8 = strcasestr(a1, "spmi") != 0;
  if (v8[1])
  {
    sockaddr v158 = (sockaddr)0;
    long long v159 = 0u;
    int v174 = 0;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v171 = 0u;
    memset(handler, 0, sizeof(handler));
    uint64_t v12 = *((void *)v6 + 1);
    socklen_t v157 = 72;
    int v13 = socket(32, 1, 2);
    *int v6 = v13;
    uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    if (v13 < 0)
    {
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
        int v33 = __error();
        uint64_t v34 = strerror(*v33);
        int v35 = __error();
        v32(3, "%s:%i \"%s\" errno=%d socket", "_NFHardwareSerialOpenSocket", 995, v34, *v35);
      }
      dispatch_get_specific(*v14);
      uint64_t v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        __int16 v37 = __error();
        int v38 = strerror(*v37);
        int v39 = *__error();
        *(_DWORD *)buf = 136446978;
        __int16 v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 995;
        __int16 v164 = 2080;
        int v165 = v38;
        __int16 v166 = 1024;
        int v167 = v39;
        _os_log_impl(&dword_237D7D000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d socket", buf, 0x22u);
      }
      *int v6 = 0;
      goto LABEL_29;
    }
    int v174 = 0;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v171 = 0u;
    memset(handler, 0, sizeof(handler));
    __strlcpy_chk();
    if (ioctl(*v6, 0xC0644E03uLL, handler))
    {
      dispatch_get_specific(*v14);
      uint64_t v15 = NFLogGetLogger();
      if (v15)
      {
        uint64_t v16 = (void (*)(uint64_t, const char *, ...))v15;
        io_service_t v17 = __error();
        __int16 v18 = strerror(*v17);
        int v19 = __error();
        v16(3, "%s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO", "_NFHardwareSerialOpenSocket", 1004, v18, *v19);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v21 = __error();
      __int16 v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)buf = 136446978;
      __int16 v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1004;
      __int16 v164 = 2080;
      int v165 = v22;
      __int16 v166 = 1024;
      int v167 = v23;
      int v24 = "%{public}s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO";
      goto LABEL_27;
    }
    *(_DWORD *)&v158.sa_len = 139296;
    *(_DWORD *)&v158.sa_data[2] = handler[0];
    *(_DWORD *)&v158.sa_data[6] = 0;
    if (connect(*v6, &v158, 0x20u))
    {
      dispatch_get_specific(*v14);
      uint64_t v40 = NFLogGetLogger();
      if (v40)
      {
        __int16 v41 = (void (*)(uint64_t, const char *, ...))v40;
        int v42 = __error();
        uint64_t v43 = strerror(*v42);
        uint64_t v44 = __error();
        v41(3, "%s:%i \"%s\" errno=%d connect", "_NFHardwareSerialOpenSocket", 1015, v43, *v44);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      uint64_t v45 = __error();
      __int16 v46 = strerror(*v45);
      int v47 = *__error();
      *(_DWORD *)buf = 136446978;
      __int16 v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1015;
      __int16 v164 = 2080;
      int v165 = v46;
      __int16 v166 = 1024;
      int v167 = v47;
      int v24 = "%{public}s:%i \"%s\" errno=%d connect";
      goto LABEL_27;
    }
    if (*(unsigned char *)(*((void *)v6 + 1) + 97))
    {
      dispatch_get_specific(*v14);
      CFStringRef v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v74) {
        v74(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenSocket", 1020);
      }
      dispatch_get_specific(*v14);
      uint64_t v75 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1020;
        _os_log_impl(&dword_237D7D000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", buf, 0x12u);
      }
    }
    else if (!_NFHardwareSerialSetNonBlock(v6, 1))
    {
      dispatch_get_specific(*v14);
      uint64_t v107 = NFLogGetLogger();
      if (v107)
      {
        CFDictionaryRef v108 = (void (*)(uint64_t, const char *, ...))v107;
        CFBooleanRef v109 = __error();
        BOOL v110 = strerror(*v109);
        v111 = __error();
        v108(3, "%s:%i \"%s\" errno=%d Failed to set non-blocking.", "_NFHardwareSerialOpenSocket", 1023, v110, *v111);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v112 = __error();
      v113 = strerror(*v112);
      int v114 = *__error();
      *(_DWORD *)buf = 136446978;
      __int16 v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1023;
      __int16 v164 = 2080;
      int v165 = v113;
      __int16 v166 = 1024;
      int v167 = v114;
      int v24 = "%{public}s:%i \"%s\" errno=%d Failed to set non-blocking.";
LABEL_27:
      __int16 v48 = v20;
      uint32_t v49 = 34;
LABEL_28:
      _os_log_impl(&dword_237D7D000, v48, OS_LOG_TYPE_ERROR, v24, buf, v49);
LABEL_29:
      dispatch_get_specific(*v14);
      int v50 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v50) {
        v50(3, "%s:%i failed to open socket %s", "NFHardwareSerialOpen", 1151, a1);
      }
      dispatch_get_specific(*v14);
      socklen_t v51 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      LODWORD(handler[0]) = 136446722;
      *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1151;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = a1;
      speed_t v52 = "%{public}s:%i failed to open socket %s";
LABEL_71:
      _os_log_impl(&dword_237D7D000, v51, OS_LOG_TYPE_ERROR, v52, (uint8_t *)handler, 0x1Cu);
LABEL_72:
      NFHardwareSerialClose((uint64_t)v6);
      return 0;
    }
    if (!**((unsigned char **)v6 + 1))
    {
      if (getsockopt(*v6, 2, 1078490131, (void *)(v12 + 8), &v157))
      {
        dispatch_get_specific(*v14);
        uint64_t v85 = NFLogGetLogger();
        if (v85)
        {
          int v86 = (void (*)(uint64_t, const char *, ...))v85;
          v87 = __error();
          v88 = strerror(*v87);
          int v89 = __error();
          v86(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1036, v88, *v89);
        }
        dispatch_get_specific(*v14);
        uint64_t v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        int v90 = __error();
        v91 = strerror(*v90);
        int v92 = *__error();
        *(_DWORD *)buf = 136446978;
        __int16 v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1036;
        __int16 v164 = 2080;
        int v165 = v91;
        __int16 v166 = 1024;
        int v167 = v92;
        int v24 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
      *(void *)(v12 + 24) = 232192;
      *(void *)(v12 + 8) |= 4uLL;
      cfmakeraw((termios *)(v12 + 8));
      if (cfsetspeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL))
      {
        dispatch_get_specific(*v14);
        uint64_t v115 = NFLogGetLogger();
        if (v115)
        {
          v116 = (void (*)(uint64_t, const char *, ...))v115;
          v117 = __error();
          int v118 = strerror(*v117);
          CFStringRef v119 = __error();
          v116(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenSocket", 1050, v118, *v119, 115200);
        }
        dispatch_get_specific(*v14);
        char v120 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        char v121 = __error();
        v122 = strerror(*v121);
        int v123 = *__error();
        *(_DWORD *)buf = 136447234;
        __int16 v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1050;
        __int16 v164 = 2080;
        int v165 = v122;
        __int16 v166 = 1024;
        int v167 = v123;
        __int16 v168 = 1024;
        int v169 = 115200;
        int v24 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
        __int16 v48 = v120;
        uint32_t v49 = 40;
        goto LABEL_28;
      }
      if (setsockopt(*v6, 2, -2142735340, (const void *)(v12 + 8), 0x48u))
      {
        dispatch_get_specific(*v14);
        uint64_t v134 = NFLogGetLogger();
        if (v134)
        {
          v135 = (void (*)(uint64_t, const char *, ...))v134;
          v136 = __error();
          v137 = strerror(*v136);
          v138 = __error();
          v135(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1055, v137, *v138);
        }
        dispatch_get_specific(*v14);
        uint64_t v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        __int16 v139 = __error();
        int v140 = strerror(*v139);
        int v141 = *__error();
        *(_DWORD *)buf = 136446978;
        __int16 v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1055;
        __int16 v164 = 2080;
        int v165 = v140;
        __int16 v166 = 1024;
        int v167 = v141;
        int v24 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
    }
    goto LABEL_15;
  }
  uint64_t v25 = *((void *)v6 + 1);
  int v26 = open(a1, 131078);
  *int v6 = v26;
  if (v26 < 0)
  {
    CFTypeID v53 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v54 = NFLogGetLogger();
    if (v54)
    {
      __int16 v55 = (void (*)(uint64_t, const char *, ...))v54;
      int v56 = __error();
      __int16 v57 = strerror(*v56);
      speed_t v58 = __error();
      v55(3, "%s:%i \"%s\" errno=%d open", "_NFHardwareSerialOpenDeviceNode", 929, v57, *v58);
    }
    dispatch_get_specific(*v53);
    __int16 v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      int v60 = __error();
      __int16 v61 = strerror(*v60);
      int v62 = *__error();
      LODWORD(handler[0]) = 136446978;
      *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 929;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = v61;
      WORD6(handler[1]) = 1024;
      *(_DWORD *)((char *)&handler[1] + 14) = v62;
      _os_log_impl(&dword_237D7D000, v59, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d open", (uint8_t *)handler, 0x22u);
    }
    *int v6 = 0;
    goto LABEL_67;
  }
  if (**((unsigned char **)v6 + 1)) {
    goto LABEL_15;
  }
  if (ioctl(v26, 0x2000740DuLL))
  {
    uint64_t v63 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v64 = NFLogGetLogger();
    if (v64)
    {
      __int16 v65 = (void (*)(uint64_t, const char *, ...))v64;
      int v66 = __error();
      __int16 v67 = strerror(*v66);
      int v68 = __error();
      v65(3, "%s:%i \"%s\" errno=%d ioctl: TIOCEXCL", "_NFHardwareSerialOpenDeviceNode", 942, v67, *v68);
    }
    dispatch_get_specific(*v63);
    __int16 v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    int v70 = __error();
    __int16 v71 = strerror(*v70);
    int v72 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 942;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v71;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v72;
    __int16 v73 = "%{public}s:%i \"%s\" errno=%d ioctl: TIOCEXCL";
    goto LABEL_65;
  }
  if (tcgetattr(*v6, (termios *)(v25 + 8)))
  {
    BOOL v76 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v77 = NFLogGetLogger();
    if (v77)
    {
      char v78 = (void (*)(uint64_t, const char *, ...))v77;
      CFBooleanRef v79 = __error();
      char v80 = strerror(*v79);
      CFBooleanRef v81 = __error();
      v78(3, "%s:%i \"%s\" errno=%d tcgetattr", "_NFHardwareSerialOpenDeviceNode", 948, v80, *v81);
    }
    dispatch_get_specific(*v76);
    __int16 v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    char v82 = __error();
    v83 = strerror(*v82);
    int v84 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 948;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v83;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v84;
    __int16 v73 = "%{public}s:%i \"%s\" errno=%d tcgetattr";
    goto LABEL_65;
  }
  if (fcntl(*v6, 4, 0))
  {
    v93 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v94 = NFLogGetLogger();
    if (v94)
    {
      uint32_t v95 = (void (*)(uint64_t, const char *, ...))v94;
      v96 = __error();
      v97 = strerror(*v96);
      uint64_t v98 = __error();
      v95(3, "%s:%i \"%s\" errno=%d fcntl: F_SETFL", "_NFHardwareSerialOpenDeviceNode", 954, v97, *v98);
    }
    dispatch_get_specific(*v93);
    __int16 v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v99 = __error();
    v100 = strerror(*v99);
    int v101 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 954;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v100;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v101;
    __int16 v73 = "%{public}s:%i \"%s\" errno=%d fcntl: F_SETFL";
LABEL_65:
    unsigned int v102 = v69;
    uint32_t v103 = 34;
LABEL_66:
    _os_log_impl(&dword_237D7D000, v102, OS_LOG_TYPE_ERROR, v73, (uint8_t *)handler, v103);
    goto LABEL_67;
  }
  *(void *)(v25 + 8) |= 4uLL;
  *(_OWORD *)(v25 + 16) = xmmword_237D96C90;
  *(void *)(v25 + 32) = 0;
  *(_WORD *)(v25 + 56) = 1;
  if (cfsetispeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL)
    || cfsetospeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL))
  {
    v124 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v125 = NFLogGetLogger();
    if (v125)
    {
      unsigned int v126 = (void (*)(uint64_t, const char *, ...))v125;
      v127 = __error();
      v128 = strerror(*v127);
      uint64_t v129 = __error();
      v126(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 967, v128, *v129, 115200);
    }
    dispatch_get_specific(*v124);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    uint64_t v131 = __error();
    v132 = strerror(*v131);
    int v133 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 967;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v132;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v133;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    __int16 v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
    goto LABEL_89;
  }
  if (tcsetattr(*v6, 0, (const termios *)(*((void *)v6 + 1) + 8)))
  {
    char v142 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v143 = NFLogGetLogger();
    if (v143)
    {
      v144 = (void (*)(uint64_t, const char *, ...))v143;
      v145 = __error();
      char v146 = strerror(*v145);
      uint64_t v147 = __error();
      v144(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 972, v146, *v147, 115200);
    }
    dispatch_get_specific(*v142);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    char v148 = __error();
    size_t v149 = strerror(*v148);
    int v150 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 972;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v149;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v150;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    __int16 v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
LABEL_89:
    unsigned int v102 = v130;
    uint32_t v103 = 40;
    goto LABEL_66;
  }
  if (*(unsigned char *)(*((void *)v6 + 1) + 97))
  {
    v151 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v152 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v152) {
      v152(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenDeviceNode", 977);
    }
    dispatch_get_specific(*v151);
    __int16 v153 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(handler[0]) = 136446466;
      *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 977;
      _os_log_impl(&dword_237D7D000, v153, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", (uint8_t *)handler, 0x12u);
    }
    goto LABEL_15;
  }
  if (!_NFHardwareSerialSetNonBlock(v6, 1))
  {
LABEL_67:
    v104 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v105 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v105) {
      v105(3, "%s:%i failed to open device %s", "NFHardwareSerialOpen", 1157, a1);
    }
    dispatch_get_specific(*v104);
    socklen_t v51 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    LODWORD(handler[0]) = 136446722;
    *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 1157;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = a1;
    speed_t v52 = "%{public}s:%i failed to open device %s";
    goto LABEL_71;
  }
LABEL_15:
  *((void *)v8 + 13) = a2;
  dispatch_retain(a2);
  uint64_t v27 = *((void *)v6 + 1);
  if (!*(unsigned char *)(v27 + 97))
  {
    uintptr_t v28 = *v6;
    *(void *)(v27 + 112) = dispatch_source_create(MEMORY[0x263EF83E8], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    dispatch_set_qos_class_fallback();
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v27 + 112), &__block_literal_global_134);
    dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v27 + 112), &__block_literal_global_138);
    dispatch_activate(*(dispatch_object_t *)(v27 + 112));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 112));
    *(_DWORD *)(v27 + 120) = 1;
    *(void *)(*((void *)v6 + 1) + 128) = 0;
    *(void *)(v27 + 152) = 0;
    *(void *)(v27 + 160) = 0;
    int v29 = dispatch_source_create(MEMORY[0x263EF8418], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    *(void *)(v27 + 136) = v29;
    dispatch_source_set_event_handler(v29, &__block_literal_global_141);
    __int16 v30 = *(NSObject **)(v27 + 136);
    *(void *)&handler[0] = MEMORY[0x263EF8330];
    *((void *)&handler[0] + 1) = 0x40000000;
    *(void *)&handler[1] = ___NFHardwareSerialCreateSources_block_invoke_143;
    *((void *)&handler[1] + 1) = &__block_descriptor_tmp_144;
    LODWORD(handler[2]) = v28;
    dispatch_source_set_cancel_handler(v30, handler);
    dispatch_activate(*(dispatch_object_t *)(v27 + 136));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 136));
    *(_DWORD *)(v27 + 144) = 1;
  }
  return v6;
}

void NFHardwareSerialClose(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialClose", 1175);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v10 = "NFHardwareSerialClose";
    __int16 v11 = 1024;
    int v12 = 1175;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5)
    {
      NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v5 + 88), 2, 0, 0);
      uint64_t v6 = *(void *)(a1 + 8);
      if (!*(void *)(v6 + 136) && (*(_DWORD *)a1 & 0x80000000) == 0)
      {
        close(*(_DWORD *)a1);
        *(_DWORD *)a1 = -1;
        uint64_t v6 = *(void *)(a1 + 8);
      }
      if (!*(unsigned char *)(v6 + 97))
      {
        if (*(void *)(v6 + 112))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 112), &__block_literal_global_147);
          uint64_t v7 = *(void *)(a1 + 8);
          if (*(_DWORD *)(v7 + 120))
          {
            dispatch_resume(*(dispatch_object_t *)(v7 + 112));
            uint64_t v7 = *(void *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v7 + 112));
          dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 8) + 112));
          uint64_t v6 = *(void *)(a1 + 8);
          *(void *)(v6 + 112) = 0;
        }
        if (*(void *)(v6 + 136))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 136), &__block_literal_global_151);
          uint64_t v8 = *(void *)(a1 + 8);
          if (*(_DWORD *)(v8 + 144))
          {
            dispatch_resume(*(dispatch_object_t *)(v8 + 136));
            uint64_t v8 = *(void *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v8 + 136));
          dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 8) + 136));
          uint64_t v6 = *(void *)(a1 + 8);
          *(void *)(v6 + 136) = 0;
        }
      }
      if (*(void *)(v6 + 104))
      {
        dispatch_release(*(dispatch_object_t *)(v6 + 104));
        uint64_t v6 = *(void *)(a1 + 8);
        *(void *)(v6 + 104) = 0;
      }
      free((void *)v6);
    }
    free((void *)a1);
  }
}

uint64_t NFHardwareSerialPower()
{
  return 1;
}

BOOL NFHardwareSerialHasCTS(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = *(unsigned __int8 **)(result + 8);
    return v1 && *v1 == 0;
  }
  return result;
}

uint64_t NFHardwareSerialGetCTS(uint64_t result)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  CFDictionaryRef v1 = *(unsigned char **)(result + 8);
  if (!v1) {
    return 0;
  }
  if (!*v1)
  {
    unsigned int v38 = 0;
    if (v1[1])
    {
      socklen_t v37 = 4;
      int v6 = getsockopt(*(_DWORD *)result, 2, 1074033770, &v38, &v37);
      uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      BOOL v9 = Logger;
      if (v6)
      {
        if (Logger)
        {
          unsigned int v10 = __error();
          __int16 v11 = strerror(*v10);
          int v12 = __error();
          v9(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialGetCTS", 1243, v11, *v12);
        }
        dispatch_get_specific(*v7);
        uint64_t v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v14 = __error();
        uint64_t v15 = strerror(*v14);
        int v16 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1243;
        __int16 v43 = 2080;
        uint64_t v44 = v15;
        __int16 v45 = 1024;
        int v46 = v16;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
LABEL_20:
        _os_log_impl(&dword_237D7D000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0xFFFFFFFFLL;
      }
      if (Logger)
      {
        if ((v38 & 0x20) != 0) {
          uintptr_t v28 = "HIGH";
        }
        else {
          uintptr_t v28 = "LOW";
        }
        Logger(6, "%s:%i Flow is %s (line=%x)", "NFHardwareSerialGetCTS", 1247, v28, v38);
      }
      dispatch_get_specific(*v7);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if ((v38 & 0x20) != 0) {
          __int16 v30 = "HIGH";
        }
        else {
          __int16 v30 = "LOW";
        }
        *(_DWORD *)buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1247;
        __int16 v43 = 2080;
        uint64_t v44 = (void *)v30;
        __int16 v45 = 1024;
        int v46 = v38;
        uint64_t v31 = "%{public}s:%i Flow is %s (line=%x)";
        uint64_t v32 = v29;
        uint32_t v33 = 34;
LABEL_41:
        _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
    else
    {
      int v18 = ioctl(*(_DWORD *)result, 0x4004746AuLL, &v38);
      int v19 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      int v21 = v20;
      if (v18)
      {
        if (v20)
        {
          __int16 v22 = __error();
          int v23 = strerror(*v22);
          int v24 = __error();
          v21(3, "%s:%i \"%s\" errno=%d TIOCMSET", "NFHardwareSerialGetCTS", 1251, v23, *v24);
        }
        dispatch_get_specific(*v19);
        uint64_t v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v25 = __error();
        int v26 = strerror(*v25);
        int v27 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1251;
        __int16 v43 = 2080;
        uint64_t v44 = v26;
        __int16 v45 = 1024;
        int v46 = v27;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d TIOCMSET";
        goto LABEL_20;
      }
      if (v20)
      {
        if ((v38 & 0x20) != 0) {
          uint64_t v34 = "HIGH";
        }
        else {
          uint64_t v34 = "LOW";
        }
        v20(6, "%s:%i Flow is %s", "NFHardwareSerialGetCTS", 1254, v34);
      }
      dispatch_get_specific(*v19);
      int v35 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = "HIGH";
        uint64_t v40 = "NFHardwareSerialGetCTS";
        *(_DWORD *)buf = 136446722;
        if ((v38 & 0x20) == 0) {
          uint64_t v36 = "LOW";
        }
        __int16 v41 = 1024;
        int v42 = 1254;
        __int16 v43 = 2080;
        uint64_t v44 = (void *)v36;
        uint64_t v31 = "%{public}s:%i Flow is %s";
        uint64_t v32 = v35;
        uint32_t v33 = 28;
        goto LABEL_41;
      }
    }
    return (v38 >> 5) & 1;
  }
  BOOL v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  ssize_t v3 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v3) {
    v3(6, "%s:%i Ignoring for SPMI", "NFHardwareSerialGetCTS", 1233);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v5)
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v40 = "NFHardwareSerialGetCTS";
    __int16 v41 = 1024;
    int v42 = 1233;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Ignoring for SPMI", buf, 0x12u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetCRCEnabled(uint64_t a1, int a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char **)(a1 + 8);
  if (!*v2) {
    return 1;
  }
  int v25 = a2;
  int v3 = *(_DWORD *)a1;
  if (!v2[1])
  {
    if (ioctl(v3, 0x80047301uLL, &v25))
    {
      uint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        io_service_t v17 = (void (*)(uint64_t, const char *, ...))Logger;
        int v18 = __error();
        int v19 = strerror(*v18);
        uint64_t v20 = __error();
        v17(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", "NFHardwareSerialSetCRCEnabled", 1277, v19, *v20);
      }
      dispatch_get_specific(*v15);
      int v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = __error();
        int v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)buf = 136446978;
        int v27 = "NFHardwareSerialSetCRCEnabled";
        __int16 v28 = 1024;
        int v29 = 1277;
        __int16 v30 = 2080;
        uint64_t v31 = v23;
        __int16 v32 = 1024;
        int v33 = v24;
        _os_log_impl(&dword_237D7D000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", buf, 0x22u);
      }
    }
    return 1;
  }
  if (!setsockopt(v3, 2, -2147192063, &v25, 4u)) {
    return 1;
  }
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v5 = NFLogGetLogger();
  if (v5)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))v5;
    uint64_t v7 = __error();
    uint64_t v8 = strerror(*v7);
    BOOL v9 = __error();
    v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetCRCEnabled", 1271, v8, *v9);
  }
  dispatch_get_specific(*v4);
  unsigned int v10 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v12 = __error();
    uint64_t v13 = strerror(*v12);
    int v14 = *__error();
    *(_DWORD *)buf = 136446978;
    int v27 = "NFHardwareSerialSetCRCEnabled";
    __int16 v28 = 1024;
    int v29 = 1271;
    __int16 v30 = 2080;
    uint64_t v31 = v13;
    __int16 v32 = 1024;
    int v33 = v14;
    _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", buf, 0x22u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetOnDemandClientMode(uint64_t a1, int a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char **)(a1 + 8);
  if (!*v2) {
    return 1;
  }
  int v25 = a2;
  int v3 = *(_DWORD *)a1;
  if (v2[1])
  {
    if (setsockopt(v3, 2, -2147192062, &v25, 4u))
    {
      int v4 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v6 = (void (*)(uint64_t, const char *, ...))Logger;
        uint64_t v7 = __error();
        uint64_t v8 = strerror(*v7);
        BOOL v9 = __error();
        v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1297, v8, *v9);
      }
      dispatch_get_specific(*v4);
      unsigned int v10 = NFSharedLogGetLogger();
      BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v12 = __error();
        uint64_t v13 = strerror(*v12);
        int v14 = *__error();
        *(_DWORD *)buf = 136446978;
        int v27 = "NFHardwareSerialSetOnDemandClientMode";
        __int16 v28 = 1024;
        int v29 = 1297;
        __int16 v30 = 2080;
        uint64_t v31 = v13;
        __int16 v32 = 1024;
        int v33 = v14;
        uint64_t v15 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT";
LABEL_13:
        _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x22u);
        return 0;
      }
      return result;
    }
    return 1;
  }
  if (!ioctl(v3, 0x80047302uLL, &v25)) {
    return 1;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v17 = NFLogGetLogger();
  if (v17)
  {
    int v18 = (void (*)(uint64_t, const char *, ...))v17;
    int v19 = __error();
    uint64_t v20 = strerror(*v19);
    int v21 = __error();
    v18(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1303, v20, *v21);
  }
  dispatch_get_specific(*v16);
  unsigned int v10 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    __int16 v22 = __error();
    int v23 = strerror(*v22);
    int v24 = *__error();
    *(_DWORD *)buf = 136446978;
    int v27 = "NFHardwareSerialSetOnDemandClientMode";
    __int16 v28 = 1024;
    int v29 = 1303;
    __int16 v30 = 2080;
    uint64_t v31 = v23;
    __int16 v32 = 1024;
    int v33 = v24;
    uint64_t v15 = "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT";
    goto LABEL_13;
  }
  return result;
}

uint64_t NFHardwareSerialQuerySPMIError(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  socklen_t v40 = 0;
  uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialQuerySPMIError", 1316);
  }
  dispatch_get_specific(*v8);
  unsigned int v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1316;
    _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a2 || !a3)
  {
    dispatch_get_specific(*v8);
    int v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v24) {
      v24(3, "%s:%i Invalid parameter", "NFHardwareSerialQuerySPMIError", 1319);
    }
    dispatch_get_specific(*v8);
    int v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1319;
    int v21 = "%{public}s:%i Invalid parameter";
LABEL_18:
    __int16 v22 = v25;
    uint32_t v23 = 18;
    goto LABEL_19;
  }
  __int16 v11 = *(unsigned char **)(a1 + 8);
  if (!*v11)
  {
    *a3 = 0;
    return 1;
  }
  if (!v11[1])
  {
    dispatch_get_specific(*v8);
    __int16 v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28) {
      v28(3, "%s:%i Not implemented.", "NFHardwareSerialQuerySPMIError", 1344);
    }
    dispatch_get_specific(*v8);
    int v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1344;
    int v21 = "%{public}s:%i Not implemented.";
    goto LABEL_18;
  }
  socklen_t v40 = *a3;
  if (getsockopt(*(_DWORD *)a1, 2, -1069518077, a2, &v40))
  {
    dispatch_get_specific(*v8);
    uint64_t v12 = NFLogGetLogger();
    if (v12)
    {
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))v12;
      int v14 = __error();
      uint64_t v15 = strerror(*v14);
      int v16 = __error();
      v13(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1332, v15, *v16);
    }
    dispatch_get_specific(*v8);
    uint64_t v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v18 = __error();
    int v19 = strerror(*v18);
    int v20 = *__error();
    *(_DWORD *)buf = 136446978;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1332;
    __int16 v45 = 2080;
    int v46 = v19;
    __int16 v47 = 1024;
    int v48 = v20;
    int v21 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS";
    __int16 v22 = v17;
    uint32_t v23 = 34;
LABEL_19:
    _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    return 0;
  }
  *a3 = v40;
  int v39 = a4;
  int v29 = setsockopt(*(_DWORD *)a1, 2, -1069518077, &v39, 4u);
  BOOL v26 = v29 == 0;
  if (v29)
  {
    dispatch_get_specific(*v8);
    uint64_t v30 = NFLogGetLogger();
    if (v30)
    {
      uint64_t v31 = (void (*)(uint64_t, const char *, ...))v30;
      __int16 v32 = __error();
      int v33 = strerror(*v32);
      uint64_t v34 = __error();
      v31(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1339, v33, *v34);
    }
    dispatch_get_specific(*v8);
    int v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = __error();
      socklen_t v37 = strerror(*v36);
      int v38 = *__error();
      *(_DWORD *)buf = 136446978;
      int v42 = "NFHardwareSerialQuerySPMIError";
      __int16 v43 = 1024;
      int v44 = 1339;
      __int16 v45 = 2080;
      int v46 = v37;
      __int16 v47 = 1024;
      int v48 = v38;
      _os_log_impl(&dword_237D7D000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", buf, 0x22u);
    }
  }
  return v26;
}

void _NFHardwarePrintNode(const char *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (MatchingService)
  {
    if (Logger) {
      Logger(6, "%s:%i %s found", "_NFHardwarePrintNode", 143, a1);
    }
    dispatch_get_specific(*v5);
    uint64_t v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 143;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a1;
      _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s found", buf, 0x1Cu);
    }
    io_registry_entry_t child = 0;
    if (IORegistryEntryGetChildEntry(MatchingService, "IOService", &child))
    {
      dispatch_get_specific(*v5);
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v8) {
        v8(6, "%s:%i %s has no child", "_NFHardwarePrintNode", 156, a1);
      }
      dispatch_get_specific(*v5);
      BOOL v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 156;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        _os_log_impl(&dword_237D7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has no child", buf, 0x1Cu);
      }
    }
    else if (child)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!MEMORY[0x237E2FF60]())
      {
        dispatch_get_specific(*v5);
        __int16 v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v11) {
          v11(6, "%s:%i %s has child %s", "_NFHardwarePrintNode", 151, a1, (const char *)buf);
        }
        dispatch_get_specific(*v5);
        uint64_t v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v42 = 136446978;
          __int16 v43 = "_NFHardwarePrintNode";
          __int16 v44 = 1024;
          int v45 = 151;
          __int16 v46 = 2080;
          __int16 v47 = a1;
          __int16 v48 = 2080;
          uint64_t v49 = buf;
          _os_log_impl(&dword_237D7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has child %s", v42, 0x26u);
        }
      }
      IOObjectRelease(child);
    }
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IONameMatch", 0, 0);
    if (CFProperty)
    {
      CFStringRef v14 = CFProperty;
      StringCFDictionaryRef Value = _NFHardwareGetStringValue(CFProperty);
      dispatch_get_specific(*v5);
      int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        if (StringValue) {
          uint64_t v17 = StringValue;
        }
        else {
          uint64_t v17 = "??";
        }
        v16(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 162, a1, "IONameMatch", v17);
      }
      dispatch_get_specific(*v5);
      int v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (StringValue) {
          int v19 = StringValue;
        }
        else {
          int v19 = "??";
        }
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 162;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IONameMatch";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&uint8_t buf[40] = v19;
        _os_log_impl(&dword_237D7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (StringValue) {
        free(StringValue);
      }
      CFRelease(v14);
    }
    CFStringRef v20 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IONameMatched", 0, 0);
    if (v20)
    {
      CFStringRef v21 = v20;
      __int16 v22 = _NFHardwareGetStringValue(v20);
      dispatch_get_specific(*v5);
      uint32_t v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v23)
      {
        if (v22) {
          int v24 = v22;
        }
        else {
          int v24 = "??";
        }
        v23(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 170, a1, "IONameMatched", v24);
      }
      dispatch_get_specific(*v5);
      int v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v22) {
          BOOL v26 = v22;
        }
        else {
          BOOL v26 = "??";
        }
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IONameMatched";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&uint8_t buf[40] = v26;
        _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v22) {
        free(v22);
      }
      CFRelease(v21);
    }
    CFStringRef v27 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IOMatchCategory", 0, 0);
    if (v27)
    {
      CFStringRef v28 = v27;
      int v29 = _NFHardwareGetStringValue(v27);
      dispatch_get_specific(*v5);
      uint64_t v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v30)
      {
        if (v29) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = "??";
        }
        v30(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 178, a1, "IOMatchCategory", v31);
      }
      dispatch_get_specific(*v5);
      __int16 v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v29) {
          int v33 = v29;
        }
        else {
          int v33 = "??";
        }
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 178;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IOMatchCategory";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&uint8_t buf[40] = v33;
        _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v29) {
        free(v29);
      }
      CFRelease(v28);
    }
    CFStringRef v34 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IOUserClientClass", 0, 0);
    if (v34)
    {
      CFStringRef v35 = v34;
      uint64_t v36 = _NFHardwareGetStringValue(v34);
      dispatch_get_specific(*v5);
      socklen_t v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v37)
      {
        if (v36) {
          int v38 = v36;
        }
        else {
          int v38 = "??";
        }
        v37(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 186, a1, "IOUserClientClass", v38);
      }
      dispatch_get_specific(*v5);
      int v39 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if (v36) {
          socklen_t v40 = v36;
        }
        else {
          socklen_t v40 = "??";
        }
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 186;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IOUserClientClass";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&uint8_t buf[40] = v40;
        _os_log_impl(&dword_237D7D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v36) {
        free(v36);
      }
      CFRelease(v35);
    }
    IOObjectRelease(MatchingService);
  }
  else
  {
    if (Logger) {
      Logger(6, "%s:%i %s NOT found", "_NFHardwarePrintNode", 193, a1);
    }
    dispatch_get_specific(*v5);
    unsigned int v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 193;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a1;
      _os_log_impl(&dword_237D7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s NOT found", buf, 0x1Cu);
    }
  }
}

char *_NFHardwareGetStringValue(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
  {
    CFDictionaryRef v3 = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
    if (v3) {
      CFStringGetCString(a1, v3, 256, 0x8000100u);
    }
    return v3;
  }
  else
  {
    return strdup((const char *)&unk_237D99C43);
  }
}

uint64_t _NFHardwareWalkTree(io_iterator_t a1, const char *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unsigned int v28 = 0;
  if (a1 && IOIteratorIsValid(a1))
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    while (1)
    {
      uint64_t v5 = IOIteratorNext(a1);
      if (!v5) {
        return 0;
      }
      uint64_t v6 = v5;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = 0u;
      memset(__s1, 0, sizeof(__s1));
      uint64_t v7 = MEMORY[0x237E2FF60](v5, __s1) ? 0 : strdup(__s1);
      CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, @"IONameMatch", 0, 0);
      if (CFProperty)
      {
        CFStringRef v9 = CFProperty;
        StringCFDictionaryRef Value = _NFHardwareGetStringValue(CFProperty);
        if (!StringValue) {
          goto LABEL_12;
        }
        __int16 v11 = StringValue;
        if (strcmp(StringValue, a2)) {
          goto LABEL_11;
        }
        dispatch_get_specific(*v4);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 208, "IONameMatch", v11);
        }
        dispatch_get_specific(*v4);
        uint64_t v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(void *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 208;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = "IONameMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = v11;
          _os_log_impl(&dword_237D7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        CFStringRef v16 = (const __CFString *)IORegistryEntryCreateCFProperty(v6, @"IOClass", 0, 0);
        if (v16) {
          break;
        }
      }
LABEL_13:
      if (MEMORY[0x237E2FF50](v6, "IOService", &v28))
      {
        uint64_t v12 = 0;
        BOOL v13 = 0;
      }
      else
      {
        IOObjectRelease(v6);
        uint64_t v12 = _NFHardwareWalkTree(v28, a2);
        BOOL v13 = v12 != 0;
        LODWORD(v6) = v28;
      }
      IOObjectRelease(v6);
      if (v7) {
        free(v7);
      }
      if (v13) {
        return v12;
      }
      if (!IOIteratorIsValid(a1)) {
        goto LABEL_46;
      }
    }
    CFStringRef v9 = v16;
    uint64_t v17 = _NFHardwareGetStringValue(v16);
    if (v17)
    {
      __int16 v11 = v17;
      if (!strcmp(v17, "AppleStockholmControl"))
      {
        dispatch_get_specific(*v4);
        int v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v18) {
          v18(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 220, "IOPropertyMatch", v11);
        }
        dispatch_get_specific(*v4);
        int v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(void *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 220;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = "IOPropertyMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = v11;
          _os_log_impl(&dword_237D7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        dispatch_get_specific(*v4);
        CFStringRef v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v20)
        {
          if (v7) {
            CFStringRef v21 = v7;
          }
          else {
            CFStringRef v21 = "??";
          }
          v20(6, "%s:%i %s has matching {%s / %s}", "_NFHardwareWalkTree", 268, v21, "AppleStockholmControl", a2);
        }
        dispatch_get_specific(*v4);
        __int16 v22 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            uint32_t v23 = v7;
          }
          else {
            uint32_t v23 = "??";
          }
          *(_DWORD *)__s1 = 136447234;
          *(void *)&__s1[4] = "_NFHardwareWalkTree";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 268;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = v23;
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = "AppleStockholmControl";
          *(_WORD *)&__s1[38] = 2080;
          *(void *)&__s1[40] = a2;
          _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has matching {%s / %s}", (uint8_t *)__s1, 0x30u);
        }
        if (v7) {
          free(v7);
        }
        return v6;
      }
LABEL_11:
      free(v11);
    }
LABEL_12:
    CFRelease(v9);
    goto LABEL_13;
  }
  uint64_t v12 = 0;
LABEL_46:
  int v24 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  int v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v25) {
    v25(3, "%s:%i Invalid iterator", "_NFHardwareWalkTree", 257);
  }
  dispatch_get_specific(*v24);
  BOOL v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__s1 = 136446466;
    *(void *)&__s1[4] = "_NFHardwareWalkTree";
    *(_WORD *)&__s1[12] = 1024;
    *(_DWORD *)&__s1[14] = 257;
    _os_log_impl(&dword_237D7D000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", (uint8_t *)__s1, 0x12u);
  }
  return v12;
}

int *NFHardwareSerialDebugger(int a1)
{
  if ((!a1 || (CFTypeID v2 = (int *)gDebuggers_0) == 0) && ((a1 & 1) != 0 || (CFTypeID v2 = (int *)gDebuggers_1) == 0))
  {
    CFTypeID v2 = (int *)malloc_type_calloc(1uLL, 0x58uLL, 0x10300409288EE5CuLL);
    if (v2)
    {
      if (NFHardwareSerialIsInRestoreOS_onceToken != -1) {
        dispatch_once(&NFHardwareSerialIsInRestoreOS_onceToken, &__block_literal_global_0);
      }
      BOOL v3 = NFHardwareSerialIsInRestoreOS_inRestoreOS == 0;
      if (NFHardwareSerialIsInRestoreOS_inRestoreOS) {
        int v4 = 4142;
      }
      else {
        int v4 = 1024;
      }
      if (NFHardwareSerialIsInRestoreOS_inRestoreOS) {
        int v5 = 4096;
      }
      else {
        int v5 = 128;
      }
      int *v2 = v4;
      v2[1] = v5;
      v2[2] = v5;
      int v6 = v4 + 37;
      if (v3) {
        char v7 = 7;
      }
      else {
        char v7 = 12;
      }
      size_t v8 = (v6 << v7);
      v2[6] = v8;
      *((void *)v2 + 2) = malloc_type_calloc(1uLL, v8, 0x100004077774924uLL);
      CFStringRef v9 = malloc_type_calloc(1uLL, *v2, 0x100004077774924uLL);
      uint64_t v10 = *((void *)v2 + 2);
      *((void *)v2 + 4) = v10;
      *((void *)v2 + 5) = v10;
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = v9;
      v2[16] = 0;
      *((unsigned char *)v2 + 68) = a1;
      *((void *)v2 + 9) = 0;
      __int16 v11 = &gDebuggers_1;
      v2[20] = 0;
      if (a1) {
        __int16 v11 = &gDebuggers_0;
      }
      *__int16 v11 = (uint64_t)v2;
    }
  }
  return v2;
}

uint64_t NFHardwareSerialDebugLastMessage(int a1)
{
  CFDictionaryRef v1 = &gDebuggers_1;
  if (!a1) {
    CFDictionaryRef v1 = &gDebuggers_0;
  }
  uint64_t v2 = *v1;
  if (*v1)
  {
    BOOL v3 = (os_unfair_lock_s *)(v2 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 80));
    uint64_t v2 = *(void *)(v2 + 72);
    os_unfair_lock_unlock(v3);
  }
  return v2;
}

void NFHardwareSerialDebugLog(os_unfair_lock_s *a1, int a2, char *a3, unint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v27.tv_sec = 0;
  *(void *)&v27.tv_usec = 0;
  gettimeofday(&v27, 0);
  os_unfair_lock_lock(a1 + 20);
  size_t v8 = *(char **)&a1[4]._os_unfair_lock_opaque;
  if (v8 && *(void *)&a1[14]._os_unfair_lock_opaque)
  {
    CFStringRef v9 = *(char **)&a1[10]._os_unfair_lock_opaque;
    uint64_t v10 = *(char **)v9;
    if (!*(void *)v9)
    {
      *(void *)CFStringRef v9 = v8;
      uint64_t v10 = v8;
    }
    unint64_t v11 = (unint64_t)&v8[a1[6]._os_unfair_lock_opaque];
    unint64_t os_unfair_lock_opaque = (int)a1->_os_unfair_lock_opaque;
    if (os_unfair_lock_opaque >= a4) {
      LODWORD(os_unfair_lock_opaque) = a4;
    }
    int v13 = os_unfair_lock_opaque + 37;
    if ((int)os_unfair_lock_opaque + 37 >= 1)
    {
      CFStringRef v14 = *(char **)&a1[8]._os_unfair_lock_opaque;
      char v15 = 1;
      CFStringRef v16 = v10;
      while (1)
      {
        uint64_t v17 = v14 - v16;
        if (v14 < v16 || v14 == v9 && v14 == v16 && v16 == v8) {
          break;
        }
        if (v17 >= v13) {
          goto LABEL_24;
        }
        int v19 = *(char **)v14;
        *(void *)&a1[8]._unint64_t os_unfair_lock_opaque = *(void *)v14;
        --a1[16]._os_unfair_lock_opaque;
        if (v14 <= v19)
        {
          LODWORD(v17) = v19 - v16;
          CFStringRef v14 = v19;
LABEL_24:
          int v18 = v17;
LABEL_16:
          char v15 = 0;
          v13 -= v18;
          v16 += (int)v17;
          if ((unint64_t)v16 >= v11) {
            CFStringRef v16 = v8;
          }
          goto LABEL_18;
        }
        CFStringRef v14 = v19;
LABEL_18:
        if (v13 <= 0) {
          goto LABEL_30;
        }
      }
      LODWORD(v17) = v11 - v16;
      if ((v15 & ((v11 - v16) < 0x25)) != 0) {
        int v18 = 0;
      }
      else {
        int v18 = v11 - v16;
      }
      goto LABEL_16;
    }
LABEL_30:
    if ((unint64_t)(v10 + 37) > v11)
    {
      *(void *)CFStringRef v9 = v8;
      uint64_t v10 = v8;
    }
    *(timeval *)(v10 + 8) = v27;
    *((_DWORD *)v10 + 6) = a2;
    *(void *)(v10 + 28) = a4;
    uint32_t v23 = v10 + 36;
    int v24 = v11 - (v10 + 36);
    int v25 = os_unfair_lock_opaque - v24;
    if ((int)os_unfair_lock_opaque > v24)
    {
      memcpy(v10 + 36, a3, v24);
      a3 += v24;
      uint32_t v23 = *(char **)&a1[4]._os_unfair_lock_opaque;
      LODWORD(os_unfair_lock_opaque) = v25;
    }
    if (os_unfair_lock_opaque)
    {
      uint64_t v26 = (int)os_unfair_lock_opaque;
      memcpy(v23, a3, (int)os_unfair_lock_opaque);
      a2 = *((_DWORD *)v10 + 6);
    }
    else
    {
      uint64_t v26 = 0;
    }
    *(void *)uint64_t v10 = &v23[v26];
    *(void *)&a1[10]._unint64_t os_unfair_lock_opaque = v10;
    ++a1[16]._os_unfair_lock_opaque;
    if (a2 == 5) {
      *(void *)&a1[12]._unint64_t os_unfair_lock_opaque = v10;
    }
    os_unfair_lock_unlock(a1 + 20);
  }
  else
  {
    CFStringRef v20 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugLog", 274);
    }
    dispatch_get_specific(*v20);
    __int16 v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v29 = "NFHardwareSerialDebugLog";
      __int16 v30 = 1024;
      int v31 = 274;
      _os_log_impl(&dword_237D7D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
    }
  }
}

void NFHardwareSerialDebugDump_wCB(int *a1, void (*a2)(void, CFDataRef))
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  int v4 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 20);
  int v5 = (const void **)MEMORY[0x263F8C6C0];
  if (*((void *)a1 + 2) && *((void *)a1 + 7))
  {
    lock = v4;
    int v6 = (void *)*((void *)a1 + 9);
    if (v6)
    {
      free(v6);
      *((void *)a1 + 9) = 0;
    }
    char v7 = (uint64_t *)*((void *)a1 + 6);
    if (!v7) {
      char v7 = (uint64_t *)*((void *)a1 + 4);
    }
    size_t v8 = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x100004077774924uLL);
    *((void *)a1 + 9) = v8;
    if (v8)
    {
      if (v7 != **((uint64_t ***)a1 + 5))
      {
        CFStringRef v9 = v8;
        int v10 = 255;
        while (1)
        {
          uint64_t v11 = *((unsigned int *)v7 + 6);
          if ((v11 - 11) < 0xFFFFFFF6) {
            goto LABEL_43;
          }
          int v12 = snprintf(v9, v10, "%s", *((const char **)&NFHardwareSerialDebugMsgTypeString + v11));
          BOOL v13 = __OFSUB__(v10, v12);
          v10 -= v12;
          if ((v10 < 0) ^ v13 | (v10 == 0)) {
            goto LABEL_43;
          }
          v9 += v12;
          unint64_t v14 = *(uint64_t *)((char *)v7 + 28);
          if (v14 >= *a1) {
            unint64_t v15 = *a1;
          }
          else {
            unint64_t v15 = *(uint64_t *)((char *)v7 + 28);
          }
          CFStringRef v16 = (unsigned __int8 *)v7 + 36;
          unint64_t v17 = *((void *)a1 + 2) + a1[6];
          if ((unint64_t)v7 + v14 + 36 > v17)
          {
            unint64_t v18 = (int)v17 - (int)v16;
            if (v18 >= v15) {
              unint64_t v19 = v15;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19)
            {
              unint64_t v20 = v19;
              do
              {
                int v21 = *v16++;
                int v22 = snprintf(v9, v10, "%02x", v21);
                BOOL v13 = __OFSUB__(v10, v22);
                v10 -= v22;
                if ((v10 < 0) ^ v13 | (v10 == 0)) {
                  goto LABEL_43;
                }
                v9 += v22;
                --v20;
              }
              while (v20);
              CFStringRef v16 = (unsigned __int8 *)*((void *)a1 + 2);
            }
            else
            {
              CFStringRef v16 = (unsigned __int8 *)*((void *)a1 + 2);
            }
            v15 -= v19;
          }
          if (v15) {
            break;
          }
LABEL_29:
          char v7 = (uint64_t *)*v7;
          if (v7 == **((uint64_t ***)a1 + 5) || v10 <= 0) {
            goto LABEL_43;
          }
        }
        while (1)
        {
          int v23 = *v16++;
          int v24 = snprintf(v9, v10, "%02x", v23);
          BOOL v13 = __OFSUB__(v10, v24);
          v10 -= v24;
          if ((v10 < 0) ^ v13 | (v10 == 0)) {
            break;
          }
          v9 += v24;
          if (!--v15) {
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      dispatch_get_specific(*v5);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i failed to allocate last msg buffer", "_NFHardwareSerialDebugSaveLastMessage", 177);
      }
      dispatch_get_specific(*v5);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v64 = "_NFHardwareSerialDebugSaveLastMessage";
        __int16 v65 = 1024;
        int v66 = 177;
        _os_log_impl(&dword_237D7D000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to allocate last msg buffer", buf, 0x12u);
      }
    }
LABEL_43:
    unint64_t v30 = a1[2];
    if (NFHardwareSerialIsInRestoreOS_onceToken != -1) {
      dispatch_once(&NFHardwareSerialIsInRestoreOS_onceToken, &__block_literal_global_0);
    }
    int v31 = (const void **)MEMORY[0x263F8C6C0];
    if (!NFHardwareSerialIsInRestoreOS_inRestoreOS)
    {
      buf[0] = 0;
      CFStringRef v32 = *((unsigned char *)a1 + 68) ? @"com.apple.stockholm" : (const __CFString *)*MEMORY[0x263EFFE60];
      CFPreferencesAppSynchronize(v32);
      AppIntegerCFDictionaryRef Value = CFPreferencesGetAppIntegerValue(@"UARTDumpMaxEntries", v32, buf);
      if (buf[0]) {
        unint64_t v30 = AppIntegerValue;
      }
    }
    dispatch_get_specific(*v31);
    long long v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34) {
      v34(6, "%s:%i Printing last %ld messages", "NFHardwareSerialDebugDump_wCB", 360, v30);
    }
    dispatch_get_specific(*v31);
    uint64_t v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v64 = "NFHardwareSerialDebugDump_wCB";
      __int16 v65 = 1024;
      int v66 = 360;
      __int16 v67 = 2048;
      unint64_t v68 = v30;
      _os_log_impl(&dword_237D7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Printing last %ld messages", buf, 0x1Cu);
    }
    CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    socklen_t v37 = (uint64_t *)*((void *)a1 + 4);
    while (1)
    {
      uint64_t v38 = *((unsigned int *)v37 + 6);
      if (v38)
      {
        if (v38 < 0xB)
        {
          unint64_t v39 = a1[16];
          if (v30 > v39)
          {
            socklen_t v40 = (const char *)*((void *)&NFHardwareSerialDebugMsgTypeString + v38);
            __int16 v41 = (const char *)&unk_237D99C43;
            if (*(uint64_t *)((char *)v37 + 28) > (unint64_t)*a1) {
              __int16 v41 = "TRUNCATED";
            }
            snprintf((char *)buf, 0x80uLL, "%ld.%.6d %s %s", v37[1], *((_DWORD *)v37 + 4), v40, v41);
            uint64_t v42 = *((void *)a1 + 4);
            unint64_t v43 = *(void *)(v42 + 28);
            if (v43 >= *a1) {
              LODWORD(v44) = *a1;
            }
            else {
              uint64_t v44 = *(void *)(v42 + 28);
            }
            int v45 = (const void *)(v42 + 36);
            unint64_t v46 = v42 + 36 + v43;
            unint64_t v47 = *((void *)a1 + 2) + a1[6];
            if (v46 > v47)
            {
              uint64_t v48 = *((void *)a1 + 7);
              int v49 = v47 - v45;
              if (v49 >= (int)v44) {
                int v50 = v44;
              }
              else {
                int v50 = v49;
              }
              memcpy(*((void **)a1 + 7), v45, v50);
              int v51 = v44 - v50;
              long long v52 = (void *)(v48 + v50);
              int v31 = (const void **)MEMORY[0x263F8C6C0];
              memcpy(v52, *((const void **)a1 + 2), v51);
              int v45 = (const void *)*((void *)a1 + 7);
            }
            if (a2)
            {
              CFDataRef v53 = CFDataCreate(v36, (const UInt8 *)v45, (int)v44);
              if (v53)
              {
                CFDataRef v54 = v53;
                a2(*(unsigned int *)(*((void *)a1 + 4) + 24), v53);
                CFRelease(v54);
              }
              else
              {
                dispatch_get_specific(*v31);
                long long v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v55) {
                  v55(3, "%s:%i failed to msg", "NFHardwareSerialDebugDump_wCB", 409);
                }
                dispatch_get_specific(*v31);
                uint64_t v56 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int16 v59 = 136446466;
                  int v60 = "NFHardwareSerialDebugDump_wCB";
                  __int16 v61 = 1024;
                  int v62 = 409;
                  _os_log_impl(&dword_237D7D000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to msg", v59, 0x12u);
                }
              }
            }
            NFSharedDumpTransport();
            socklen_t v37 = (uint64_t *)*((void *)a1 + 4);
            LODWORD(v39) = a1[16];
          }
          *((_DWORD *)v37 + 6) = 0;
          socklen_t v37 = (uint64_t *)*v37;
          *((void *)a1 + 4) = v37;
          goto LABEL_80;
        }
        *((_DWORD *)v37 + 6) = 0;
      }
      socklen_t v37 = (uint64_t *)*v37;
      *((void *)a1 + 4) = v37;
      LODWORD(v39) = a1[16];
LABEL_80:
      a1[16] = v39 - 1;
      if (v37 == **((uint64_t ***)a1 + 5))
      {
        __int16 v57 = (void *)*((void *)a1 + 2);
        *((void *)a1 + 4) = v57;
        *((void *)a1 + 5) = v57;
        *__int16 v57 = v57;
        NFSharedDumpTransport();
        os_unfair_lock_unlock(lock);
        return;
      }
    }
  }
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v26) {
    v26(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugDump_wCB", 338);
  }
  dispatch_get_specific(*v5);
  timeval v27 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v64 = "NFHardwareSerialDebugDump_wCB";
    __int16 v65 = 1024;
    int v66 = 338;
    _os_log_impl(&dword_237D7D000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
  }
}

void NFHardwareSerialDebugDump()
{
  if (gDebuggers_0) {
    NFHardwareSerialDebugDump_wCB((int *)gDebuggers_0, 0);
  }
  mach_port_t v0 = (int *)gDebuggers_1;
  if (gDebuggers_1)
  {
    NFHardwareSerialDebugDump_wCB(v0, 0);
  }
}

uint64_t NFHardwareSerialDebugMaxEntriesPrinted(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void __NFHardwareSerialIsInRestoreOS_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    NFHardwareSerialIsInRestoreOS_inRestoreOS = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
}

void *NFHardwareInterfaceOpen(const char *a1, NSObject *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v4 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (!v4)
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 59, a1);
    }
    dispatch_get_specific(*v12);
    unint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v35 = "NFHardwareInterfaceOpen";
      __int16 v36 = 1024;
      int v37 = 59;
      __int16 v38 = 2080;
      unint64_t v39 = a1;
      _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    return 0;
  }
  int v5 = v4;
  int v6 = malloc_type_calloc(1uLL, 0xF8uLL, 0x9004090A32887uLL);
  if (!v6)
  {
    unint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFStringRef v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 65, a1);
    }
    dispatch_get_specific(*v15);
    unint64_t v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v35 = "NFHardwareInterfaceOpen";
      __int16 v36 = 1024;
      int v37 = 65;
      __int16 v38 = 2080;
      unint64_t v39 = a1;
      _os_log_impl(&dword_237D7D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  char v7 = v6;
  void *v5 = v6;
  if (!a1) {
    a1 = "com.apple.stockholm";
  }
  size_t v8 = strdup(a1);
  *(void *)char v7 = v8;
  if (!strncmp("com.apple.", v8, 0xAuLL))
  {
    unint64_t v18 = NFHardwareSerialOpen(v8, a2, 0);
    *((void *)v7 + 17) = v18;
    *((void *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = NFHardwareSerialReadBlock;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((void *)v7 + 6) = 0;
    *((void *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((void *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((void *)v7 + 9) = NFHardwareSerialFlush;
    *((void *)v7 + 10) = NFHardwareSerialReset;
    *((void *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (!v18 || (v19 = (unsigned char *)*((void *)v18 + 1)) == 0 || (unint64_t v20 = NFHardwareSerialGetCTS, *v19)) {
      unint64_t v20 = 0;
    }
    *((void *)v7 + 12) = v20;
    *((void *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((void *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((void *)v7 + 15) = NFHardwareSerialQuerySPMIError;
    *((void *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest")) {
      int v21 = 2;
    }
    else {
      int v21 = 1;
    }
    int v22 = NFHardwareGPIOOpen(v21);
    *((void *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((void *)v7 + 19) = NFHardwareGPIOSetPower;
    *((void *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((void *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((void *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((void *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    *((void *)v7 + 28) = NFHardwareGPIOSPMIFollowerReset;
    *((void *)v7 + 29) = NFHardwareGPIOClose;
    *((void *)v7 + 30) = v22;
    *((void *)v7 + 25) = NFHardwareGPIOValidateSPMIConfig;
    *((void *)v7 + 26) = NFHardwareGPIOConfigureHammerfestSPMI;
    if (!v22) {
      goto LABEL_37;
    }
  }
  else
  {
    if (strncmp("/dev/", v8, 5uLL))
    {
      CFStringRef v9 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10) {
        v10(3, "%s:%i Unknown interface %s", "NFHardwareInterfaceOpen", 226, a1);
      }
      dispatch_get_specific(*v9);
      uint64_t v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v35 = "NFHardwareInterfaceOpen";
        __int16 v36 = 1024;
        int v37 = 226;
        __int16 v38 = 2080;
        unint64_t v39 = a1;
        _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown interface %s", buf, 0x1Cu);
      }
LABEL_47:
      free(*(void **)v7);
      free(v7);
LABEL_48:
      free(v5);
      return 0;
    }
    int v23 = NFHardwareSerialOpen(v8, a2, 0);
    *((void *)v7 + 17) = v23;
    *((void *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = NFHardwareSerialReadBlock;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((void *)v7 + 6) = 0;
    *((void *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((void *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((void *)v7 + 9) = NFHardwareSerialFlush;
    *((void *)v7 + 10) = NFHardwareSerialReset;
    *((void *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (!v23 || (int v24 = (unsigned char *)*((void *)v23 + 1)) == 0 || (v25 = NFHardwareSerialGetCTS, *v24)) {
      int v25 = 0;
    }
    *((void *)v7 + 12) = v25;
    *((void *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((void *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((void *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest")) {
      int v26 = 1;
    }
    else {
      int v26 = 2;
    }
    timeval v27 = NFHardwareGPIOOpen(v26);
    *((void *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((void *)v7 + 19) = NFHardwareGPIOSetPower;
    *((void *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((void *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((void *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((void *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    *((void *)v7 + 28) = 0;
    *((void *)v7 + 15) = 0;
    *((void *)v7 + 29) = NFHardwareGPIOClose;
    *((void *)v7 + 30) = v27;
    if (!v27)
    {
LABEL_37:
      unsigned int v28 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29) {
        v29(3, "%s:%i Failed to create context for interface %s", "NFHardwareInterfaceOpen", 234, a1);
      }
      dispatch_get_specific(*v28);
      unint64_t v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v35 = "NFHardwareInterfaceOpen";
        __int16 v36 = 1024;
        int v37 = 234;
        __int16 v38 = 2080;
        unint64_t v39 = a1;
        _os_log_impl(&dword_237D7D000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create context for interface %s", buf, 0x1Cu);
      }
      if (*((void *)v7 + 17))
      {
        int v31 = (void (*)(void))*((void *)v7 + 16);
        if (v31) {
          v31();
        }
      }
      if (*((void *)v7 + 30))
      {
        CFStringRef v32 = (void (*)(void))*((void *)v7 + 29);
        if (v32) {
          v32();
        }
      }
      goto LABEL_47;
    }
  }
  if (!*((void *)v7 + 17)) {
    goto LABEL_37;
  }
  return v5;
}

void NFHardwareInterfaceClose(void **a1)
{
  uint64_t v2 = (void **)*a1;
  BOOL v3 = (void (*)(void *))*((void *)*a1 + 16);
  if (v3) {
    v3(v2[17]);
  }
  int v4 = (void (*)(void *))v2[29];
  if (v4) {
    v4(v2[30]);
  }
  free(*v2);
  int *v2 = 0;
  free(*a1);

  free(a1);
}

uint64_t NFHardwareInterfaceResetSerial(uint64_t *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareInterfaceResetSerial", 269);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    size_t v8 = "NFHardwareInterfaceResetSerial";
    __int16 v9 = 1024;
    int v10 = 269;
    _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  int v5 = *(uint64_t (**)(void))(v1 + 80);
  if (v5) {
    return v5(*(void *)(v1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceSetPower(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 152);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetPMUStandbyEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 160);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetVBAT(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 168);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetDownloadRequest(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 176);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetPMUStandbyPowerEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 184);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetDeviceWake(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 144);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetLogFunction(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 88);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetBaudRate(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 8);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceRead(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceRead", 346);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      size_t v8 = "NFHardwareInterfaceRead";
      __int16 v9 = 1024;
      int v10 = 346;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
    }
    return 0;
  }
}

uint64_t NFHardwareInterfaceReadBlock(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 24);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceReadBlock", 356);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      size_t v8 = "NFHardwareInterfaceReadBlock";
      __int16 v9 = 1024;
      int v10 = 356;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
    }
    return 1;
  }
}

uint64_t NFHardwareInterfaceWrite(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 32);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceWriteBlock(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for writing", "NFHardwareInterfaceWriteBlock", 375);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      size_t v8 = "NFHardwareInterfaceWriteBlock";
      __int16 v9 = 1024;
      int v10 = 375;
      _os_log_impl(&dword_237D7D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for writing", buf, 0x12u);
    }
    return 1;
  }
}

uint64_t NFHardwareInterfaceReadAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 48);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceReadBlockAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 56);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceWriteBlockAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 64);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceFlush(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 72);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceGetFlowControl(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 96);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetCRCEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 104);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetOnDemandClientMode(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 112);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceIsHostWakeCapable(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 192);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceFollowerReset(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 224);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

BOOL NFHardwareInterfaceQuerySPMIError(uint64_t a1)
{
  uint64_t v1 = *(unsigned int (**)(void))(*(void *)a1 + 120);
  return v1 && v1(*(void *)(*(void *)a1 + 136)) != 0;
}

BOOL NFHardwareDebug(void **a1)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    int v4 = (void **)NFHardwareInterfaceOpen("/dev/tty.stockholm", global_queue);
    if (v4)
    {
      uint64_t v2 = v4;
      if (*((void *)*v4 + 12)) {
        goto LABEL_6;
      }
      NFHardwareInterfaceClose(v4);
    }
    return 1;
  }
  uint64_t v2 = a1;
  if (!*((void *)*a1 + 12)) {
    return 1;
  }
LABEL_6:
  int v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i HW Debugging - current FLOW CHECK", "NFHardwareDebug", 485);
  }
  dispatch_get_specific(*v5);
  char v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 485;
    _os_log_impl(&dword_237D7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - current FLOW CHECK", buf, 0x12u);
  }
  size_t v8 = (uint64_t (*)(void))*((void *)*v2 + 12);
  if (v8) {
    int v9 = v8(*((void *)*v2 + 17));
  }
  else {
    int v9 = 1;
  }
  usleep(0xF4240u);
  dispatch_get_specific(*v5);
  int v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10) {
    v10(6, "%s:%i HW Debugging starting - OFF", "NFHardwareDebug", 491);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 491;
    _os_log_impl(&dword_237D7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging starting - OFF", buf, 0x12u);
  }
  int v12 = (uint64_t (*)(void, void))*((void *)*v2 + 19);
  if (v12 && (v12(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    BOOL v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Error", "NFHardwareDebug", 494);
    }
    dispatch_get_specific(*v5);
    unint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 494;
      _os_log_impl(&dword_237D7D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  unint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v15) {
    v15(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 502);
  }
  dispatch_get_specific(*v5);
  CFStringRef v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 502;
    _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  unint64_t v17 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v17) {
    int v18 = 2 * (v17(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v18 = 2;
  }
  BOOL v85 = v9 != 0;
  dispatch_get_specific(*v5);
  unint64_t v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19) {
    v19(6, "%s:%i HW Debugging - ON", "NFHardwareDebug", 506);
  }
  dispatch_get_specific(*v5);
  unint64_t v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 506;
    _os_log_impl(&dword_237D7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - ON", buf, 0x12u);
  }
  int v21 = (uint64_t (*)(void, uint64_t))*((void *)*v2 + 19);
  if (v21 && (v21(*((void *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    int v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22) {
      v22(3, "%s:%i Error", "NFHardwareDebug", 515);
    }
    dispatch_get_specific(*v5);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 515;
      _os_log_impl(&dword_237D7D000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  int v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24) {
    v24(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 519);
  }
  dispatch_get_specific(*v5);
  int v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 519;
    _os_log_impl(&dword_237D7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  int v26 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v26) {
    int v27 = 4 * (v26(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v27 = 4;
  }
  int v84 = v27;
  dispatch_get_specific(*v5);
  unsigned int v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v28) {
    v28(6, "%s:%i HW Debugging - SLEEP + wait 1.5s", "NFHardwareDebug", 524);
  }
  dispatch_get_specific(*v5);
  int v29 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 524;
    _os_log_impl(&dword_237D7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - SLEEP + wait 1.5s", buf, 0x12u);
  }
  unint64_t v30 = (uint64_t (*)(void, void))*((void *)*v2 + 18);
  if (v30 && (v30(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    int v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31) {
      v31(3, "%s:%i Error", "NFHardwareDebug", 527);
    }
    dispatch_get_specific(*v5);
    CFStringRef v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 527;
      _os_log_impl(&dword_237D7D000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x30D40u);
  long long v33 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v33) {
    int v34 = 8 * (v33(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v34 = 8;
  }
  usleep(0x30D40u);
  uint64_t v35 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v35) {
    int v36 = 16 * (v35(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v36 = 16;
  }
  int v80 = v36;
  usleep(0x30D40u);
  int v37 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v37) {
    int v38 = 32 * (v37(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v38 = 32;
  }
  int v83 = v38;
  usleep(0x30D40u);
  unint64_t v39 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v39) {
    int v40 = (v39(*((void *)*v2 + 17)) != 0) << 6;
  }
  else {
    int v40 = 64;
  }
  int v82 = v40;
  usleep(0x30D40u);
  __int16 v41 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v41) {
    int v42 = (v41(*((void *)*v2 + 17)) != 0) << 7;
  }
  else {
    int v42 = 128;
  }
  int v81 = v42;
  usleep(0x30D40u);
  unint64_t v43 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v43) {
    int v44 = (v43(*((void *)*v2 + 17)) != 0) << 8;
  }
  else {
    int v44 = 256;
  }
  int v79 = v44;
  usleep(0x30D40u);
  int v45 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v45) {
    int v46 = (v45(*((void *)*v2 + 17)) != 0) << 9;
  }
  else {
    int v46 = 512;
  }
  usleep(0x30D40u);
  dispatch_get_specific(*v5);
  unint64_t v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v47) {
    v47(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 560);
  }
  dispatch_get_specific(*v5);
  uint64_t v48 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 560;
    _os_log_impl(&dword_237D7D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  int v49 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v49) {
    int v50 = (v49(*((void *)*v2 + 17)) != 0) << 10;
  }
  else {
    int v50 = 1024;
  }
  dispatch_get_specific(*v5);
  int v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v51) {
    v51(6, "%s:%i HW Debugging - WAKE", "NFHardwareDebug", 564);
  }
  dispatch_get_specific(*v5);
  long long v52 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 564;
    _os_log_impl(&dword_237D7D000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - WAKE", buf, 0x12u);
  }
  CFDataRef v53 = (uint64_t (*)(void, uint64_t))*((void *)*v2 + 18);
  if (v53 && (v53(*((void *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    CFDataRef v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v54) {
      v54(3, "%s:%i Error", "NFHardwareDebug", 567);
    }
    dispatch_get_specific(*v5);
    long long v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 567;
      _os_log_impl(&dword_237D7D000, v55, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  uint64_t v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v56) {
    v56(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 571);
  }
  dispatch_get_specific(*v5);
  __int16 v57 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 571;
    _os_log_impl(&dword_237D7D000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  speed_t v58 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v58) {
    int v59 = (v58(*((void *)*v2 + 17)) != 0) << 11;
  }
  else {
    int v59 = 2048;
  }
  dispatch_get_specific(*v5);
  int v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v60) {
    v60(6, "%s:%i HW Debugging - POWERING OFF", "NFHardwareDebug", 575);
  }
  int v61 = v18 | v85 | v84;
  dispatch_get_specific(*v5);
  int v62 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 575;
    _os_log_impl(&dword_237D7D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - POWERING OFF", buf, 0x12u);
  }
  int v63 = v61 | v34;
  uint64_t v64 = (uint64_t (*)(void, void))*((void *)*v2 + 18);
  if (v64 && (v64(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    __int16 v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v65) {
      v65(3, "%s:%i Error", "NFHardwareDebug", 577);
    }
    dispatch_get_specific(*v5);
    int v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 577;
      _os_log_impl(&dword_237D7D000, v66, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  int v67 = v63 | v80;
  unint64_t v68 = (uint64_t (*)(void, void))*((void *)*v2 + 19);
  if (v68 && (v68(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    uint64_t v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v69) {
      v69(3, "%s:%i Error", "NFHardwareDebug", 579);
    }
    dispatch_get_specific(*v5);
    int v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 579;
      _os_log_impl(&dword_237D7D000, v70, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  if (!a1) {
    NFHardwareInterfaceClose(v2);
  }
  int v71 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
  if (v71 == 4095)
  {
    dispatch_get_specific(*v5);
    BOOL v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v76) {
      v76(3, "%s:%i HW error : unit is not powering cycling.", "NFHardwareDebug", 595);
    }
    dispatch_get_specific(*v5);
    __int16 v73 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 595;
      uint64_t v75 = "%{public}s:%i HW error : unit is not powering cycling.";
      goto LABEL_130;
    }
  }
  else
  {
    if (v71)
    {
      dispatch_get_specific(*v5);
      uint64_t v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v77) {
        v77(3, "%s:%i HW debugging result : 0x%04X", "NFHardwareDebug", 598, v71);
      }
      dispatch_get_specific(*v5);
      char v78 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v87 = "NFHardwareDebug";
        __int16 v88 = 1024;
        int v89 = 598;
        __int16 v90 = 1024;
        int v91 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
        _os_log_impl(&dword_237D7D000, v78, OS_LOG_TYPE_ERROR, "%{public}s:%i HW debugging result : 0x%04X", buf, 0x18u);
      }
      return 1;
    }
    dispatch_get_specific(*v5);
    int v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v72) {
      v72(3, "%s:%i HW error : unit is not powering on.", "NFHardwareDebug", 592);
    }
    dispatch_get_specific(*v5);
    __int16 v73 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 592;
      uint64_t v75 = "%{public}s:%i HW error : unit is not powering on.";
LABEL_130:
      _os_log_impl(&dword_237D7D000, v73, OS_LOG_TYPE_ERROR, v75, buf, 0x12u);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareInterfaceValidateSPMIConfig(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 200);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetSPMIConfig(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 208);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceWasItNACK(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 216);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceIsSupported(char *__s2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!__s2 || !strncmp("com.apple.", __s2, 0xAuLL) || !strncmp("/dev/", __s2, 5uLL))
  {
    return NFHardwareSerialIsSupported(__s2);
  }
  else
  {
    uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Unmatched interface %s", "NFHardwareInterfaceIsSupported", 648, __s2);
    }
    dispatch_get_specific(*v2);
    int v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      char v7 = "NFHardwareInterfaceIsSupported";
      __int16 v8 = 1024;
      int v9 = 648;
      __int16 v10 = 2080;
      uint64_t v11 = __s2;
      _os_log_impl(&dword_237D7D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Unmatched interface %s", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t NFHardwareInterfaceHasExternalSPMIIRQ(UInt8 *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("stockholm-spmi");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService) {
    return 0;
  }
  IOObjectRelease(MatchingService);
  CFDictionaryRef v5 = IOServiceNameMatching("stockholm");
  io_service_t v6 = IOServiceGetMatchingService(v2, v5);
  if (v6)
  {
    io_object_t v7 = v6;
    CFDataRef v8 = (const __CFData *)IORegistryEntrySearchCFProperty(v6, "IOService", @"se-spmi-irq", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v8)
    {
      CFDataRef v9 = v8;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        BytePtr = CFDataGetBytePtr(v9);
        if (BytePtr)
        {
          uint64_t v12 = BytePtr;
          if (CFDataGetLength(v9)) {
            *a1 = *v12;
          }
        }
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      uint64_t v13 = 0;
    }
    IOObjectRelease(v7);
  }
  else
  {
    unint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Unexpected state.", "NFHardwareInterfaceHasExternalSPMIIRQ", 681);
    }
    dispatch_get_specific(*v14);
    CFStringRef v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "NFHardwareInterfaceHasExternalSPMIIRQ";
      __int16 v20 = 1024;
      int v21 = 681;
      _os_log_impl(&dword_237D7D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected state.", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v13;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

uint64_t GetElapsedTimeInMillisecondsFromMachTime()
{
  return MEMORY[0x270F9A258]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x270EF3F60](*(void *)&connect);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x270EF4A68](*(void *)&mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t NFDataAsHexString()
{
  return MEMORY[0x270F9A268]();
}

uint64_t NFDataCreateWithBytes()
{
  return MEMORY[0x270F9A270]();
}

uint64_t NFDataCreateWithFile()
{
  return MEMORY[0x270F9A280]();
}

uint64_t NFDataCreateWithHexString()
{
  return MEMORY[0x270F9A288]();
}

uint64_t NFDataRelease()
{
  return MEMORY[0x270F9A2A0]();
}

uint64_t NFDriverAntennaSelfTest()
{
  return MEMORY[0x270F96540]();
}

uint64_t NFDriverClose()
{
  return MEMORY[0x270F96548]();
}

uint64_t NFDriverConfigurRSTNDelay()
{
  return MEMORY[0x270F96550]();
}

uint64_t NFDriverConfigureI2CForLPM()
{
  return MEMORY[0x270F96558]();
}

uint64_t NFDriverConfigureSPMIIRQ()
{
  return MEMORY[0x270F96560]();
}

uint64_t NFDriverDebugDumpMemory()
{
  return MEMORY[0x270F96568]();
}

uint64_t NFDriverDisableBoost()
{
  return MEMORY[0x270F96570]();
}

uint64_t NFDriverDisableLPCDAssist()
{
  return MEMORY[0x270F96578]();
}

uint64_t NFDriverGetControllerInfo()
{
  return MEMORY[0x270F96588]();
}

uint64_t NFDriverGetStackBreadcrumb()
{
  return MEMORY[0x270F96590]();
}

uint64_t NFDriverGetUniqueFDRKey()
{
  return MEMORY[0x270F96598]();
}

uint64_t NFDriverIsSecureElementPresent()
{
  return MEMORY[0x270F965A0]();
}

uint64_t NFDriverLoadStack()
{
  return MEMORY[0x270F965A8]();
}

uint64_t NFDriverNFCCPowerOff()
{
  return MEMORY[0x270F965B0]();
}

uint64_t NFDriverOpen()
{
  return MEMORY[0x270F965B8]();
}

uint64_t NFDriverPrintPageEraseCounter()
{
  return MEMORY[0x270F965C0]();
}

uint64_t NFDriverRFSettingsSetup()
{
  return MEMORY[0x270F965C8]();
}

uint64_t NFDriverReadATETrimVersion()
{
  return MEMORY[0x270F965D0]();
}

uint64_t NFDriverReadPageEraseCounter()
{
  return MEMORY[0x270F965D8]();
}

uint64_t NFDriverResetFWFlags()
{
  return MEMORY[0x270F965E0]();
}

uint64_t NFDriverRunIntegrityDebug()
{
  return MEMORY[0x270F965E8]();
}

uint64_t NFDriverSecureElementGetOSInfo()
{
  return MEMORY[0x270F965F0]();
}

uint64_t NFDriverSecureElementGetOSMode()
{
  return MEMORY[0x270F965F8]();
}

uint64_t NFDriverSecureElementGetResponseStatus()
{
  return MEMORY[0x270F96600]();
}

uint64_t NFDriverSecureElementTransceive()
{
  return MEMORY[0x270F96608]();
}

uint64_t NFDriverSerialDebugLastMessage()
{
  return MEMORY[0x270F96610]();
}

uint64_t NFDriverSetCallback()
{
  return MEMORY[0x270F96618]();
}

uint64_t NFDriverSetConfiguration()
{
  return MEMORY[0x270F96620]();
}

uint64_t NFDriverSetSecureElementPower()
{
  return MEMORY[0x270F96628]();
}

uint64_t NFDriverUnloadStackAndLeaveHWEnabled()
{
  return MEMORY[0x270F96630]();
}

uint64_t NFDriverUpdateFirmware()
{
  return MEMORY[0x270F96638]();
}

uint64_t NFGetProductType()
{
  return MEMORY[0x270F9A2A8]();
}

uint64_t NFIsInternalBuild()
{
  return MEMORY[0x270F9A2B0]();
}

uint64_t NFIsRestoreOS()
{
  return MEMORY[0x270F9A2B8]();
}

uint64_t NFLogGetLogger()
{
  return MEMORY[0x270F9A2C0]();
}

uint64_t NFLogSetLogger()
{
  return MEMORY[0x270F9A2C8]();
}

uint64_t NFProductIsDevBoard()
{
  return MEMORY[0x270F9A2F0]();
}

uint64_t NFProductIsNED()
{
  return MEMORY[0x270F9A2F8]();
}

uint64_t NFProductIsPad()
{
  return MEMORY[0x270F9A300]();
}

uint64_t NFProductIsSIP()
{
  return MEMORY[0x270F9A308]();
}

uint64_t NFSharedDumpTransport()
{
  return MEMORY[0x270F9A320]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x270F9A328]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x270ED8740](a1);
}

void bzero(void *a1, size_t a2)
{
}

void cfmakeraw(termios *a1)
{
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8E98](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA0](a1, a2);
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x270ED9190](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x270ED94F0]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x270EDB598](__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x270EDB6C8](__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}