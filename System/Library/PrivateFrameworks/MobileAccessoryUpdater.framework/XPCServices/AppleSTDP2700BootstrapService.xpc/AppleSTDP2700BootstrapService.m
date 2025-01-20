uint64_t DPFUSessionGetTypeID()
{
  uint64_t result;

  result = __kDPFUSessionTypeID;
  if (!__kDPFUSessionTypeID)
  {
    pthread_once(&__DPFUSessionTypeInit, (void (*)(void))__DPFUSessionRegister);
    return __kDPFUSessionTypeID;
  }
  return result;
}

uint64_t __DPFUSessionRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kDPFUSessionTypeID = result;
  return result;
}

uint64_t DPFUSessionCreate(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a3 >= 3) {
    v4 = 0;
  }
  else {
    v4 = (char *)&__DPFUProtocolInfo + 24 * a3;
  }
  if (a2 && a3 <= 2)
  {
    if (!__kDPFUSessionTypeID) {
      pthread_once(&__DPFUSessionTypeInit, (void (*)(void))__DPFUSessionRegister);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v3 = Instance;
    if (Instance)
    {
      *(void *)(Instance + 48) = 0;
      *(_OWORD *)(Instance + 16) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(void *)(Instance + 16) = a2;
      *(void *)(Instance + 24) = v4;
      *(_DWORD *)(Instance + 48) = 5;
      *(unsigned char *)(Instance + 53) = 1;
      CFRetain(a2);
    }
  }
  return v3;
}

uint64_t DPFUSessionSetProgressCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

double DPFUSessionGetDeviceInfo(uint64_t a1, uint64_t a2)
{
  if (!IODPDeviceReadDPCD())
  {
    double result = v4;
    *(double *)a2 = v4;
    *(_DWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t DPFUSessionSetRestartAfterUpdate(uint64_t result, char a2)
{
  *(unsigned char *)(result + 53) = a2;
  return result;
}

uint64_t DPFUSessionSetExpectDeviceTerminationUponRestart(uint64_t result, char a2)
{
  *(unsigned char *)(result + 54) = a2;
  return result;
}

uint64_t DPFUSessionEnterUpdateMode(uint64_t a1)
{
  uint64_t result = __DPFUDeviceSetProperty(*(void *)(a1 + 16));
  if (!result)
  {
    uint64_t result = __DPFUDeviceSetProperty(*(void *)(a1 + 16));
    if (!result)
    {
      uint64_t result = __DPFUSessionWrite(a1, 0, (uint64_t)&kAppleOUI, 3u);
      if (!result)
      {
        uint64_t v3 = (unsigned char *)(a1 + 52);
        uint64_t result = __DPFUSessionGetMode(a1, (unsigned char *)(a1 + 52));
        if (!result)
        {
          if (*(int *)(a1 + 48) < 6) {
            return 0;
          }
          unsigned int v10 = *v3;
          if (v10 > 0x77)
          {
            if (v10 == 120)
            {
              v11 = "Eight-Byte Update Mode";
              goto LABEL_16;
            }
            if (v10 == 127)
            {
              v11 = "32-KByte Update Mode";
              goto LABEL_16;
            }
          }
          else
          {
            if (!*v3)
            {
              v11 = "Normal Mode";
              goto LABEL_16;
            }
            if (v10 == 113)
            {
              v11 = "Single-Byte Update Mode";
LABEL_16:
              __DPFULog(6, "Initial Device Mode: %s (0x%02x)", v4, v5, v6, v7, v8, v9, (char)v11);
              return 0;
            }
          }
          v11 = "Unknown Mode";
          goto LABEL_16;
        }
      }
    }
  }
  return result;
}

uint64_t __DPFUDeviceSetProperty(uint64_t a1)
{
  uint64_t v1 = 3758097088;
  if (!a1) {
    return 3758097101;
  }
  if (!IODPDeviceGetAVDevice()) {
    return v1;
  }
  return _IOAVDeviceSetProperty();
}

uint64_t __DPFUSessionWrite(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  if (!a4) {
    return 0;
  }
  for (unsigned int i = 0; i < a4; i += v8)
  {
    if (a4 - i >= 0x1000) {
      int v8 = 4096;
    }
    else {
      int v8 = a4 - i;
    }
    uint64_t v9 = IODPDeviceWriteDPCD();
    uint64_t v10 = v9;
    if (v9 && (*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
    {
      mach_error_string(v9);
      __DPFULog(0, "Error writing to device address 0x%08x offset 0x%08x: %s (0x%08x)", v11, v12, v13, v14, v15, v16, a2);
    }
  }
  return v10;
}

uint64_t __DPFUSessionGetMode(uint64_t a1, unsigned char *a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = __DPFUSessionRead(a1);
  if (!result)
  {
    if (*(int *)(a1 + 48) >= 7) {
      __DPFULog(7, "Current Device Mode: %s%s (0x%02x)", v5, v6, v7, v8, v9, v10, (char)"");
    }
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

void __DPFULog(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (isatty(2))
  {
    fputs("dpfu: ", __stderrp);
    vfprintf(__stderrp, a2, &a9);
    fputc(10, __stderrp);
  }
  else
  {
    vsyslog(a1, a2, &a9);
  }
}

const char *DPFUGetDeviceModeString(int a1)
{
  if (a1 > 119)
  {
    if (a1 != 120)
    {
      if (a1 == 127) {
        return "32-KByte Update Mode";
      }
      return "Unknown Mode";
    }
    return "Eight-Byte Update Mode";
  }
  else
  {
    if (a1)
    {
      if (a1 == 113) {
        return "Single-Byte Update Mode";
      }
      return "Unknown Mode";
    }
    return "Normal Mode";
  }
}

uint64_t DPFUSessionLeaveUpdateMode(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 54)) {
    return 0;
  }
  else {
    return __DPFUDeviceSetProperty(*(void *)(a1 + 16));
  }
}

uint64_t dpfuUpdateDeviceWithContentsOfFile(const char *a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (const void *)IODPDeviceCreate();
  uint64_t v13 = DPFUSessionCreate((uint64_t)kCFAllocatorDefault, v12, a2);
  CFRelease(v12);
  if (v13)
  {
    *(void *)(v13 + 32) = a5;
    *(void *)(v13 + 40) = a6;
    uint64_t updated = DPFUSessionEnterUpdateMode(v13);
    if (updated)
    {
      uint64_t v26 = updated;
    }
    else
    {
      uint64_t v26 = DPFUSessionInstallFilePayload(v13, a1, a3, v21, v22, v23, v24, v25);
      if (a4 && !*(unsigned char *)(v13 + 54)) {
        __DPFUDeviceSetProperty(*(void *)(v13 + 16));
      }
    }
    CFRelease((CFTypeRef)v13);
  }
  else
  {
    uint64_t v26 = 3758097136;
    if ((MEMORY[0x30] & 0x80000000) == 0) {
      __DPFULog(0, "Can't create device update session", v14, v15, v16, v17, v18, v19, v28);
    }
  }
  return v26;
}

uint64_t DPFUSessionInstallFilePayload(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  uint64_t v11 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(a1 + 48) & 0x80000000) == 0) {
    __DPFULog(0, "DPFUSessionInstallFilePayload( %s)", a3, a4, a5, a6, a7, a8, (char)a2);
  }
  uint64_t v12 = 3758097136;
  uint64_t v13 = malloc_type_calloc(1uLL, *(unsigned int *)(v11 + 8), 0x22EAC47BuLL);
  if (!v13) {
    return 3758097085;
  }
  v20 = v13;
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "Opening package file: %s", v14, v15, v16, v17, v18, v19, (char)a2);
  }
  uint64_t v21 = fopen(a2, "rb");
  int v28 = *(_DWORD *)(a1 + 48);
  if (!v21)
  {
    if (v28 >= 5) {
      __DPFULog(5, "  Error opening file: %s", v22, v23, v24, v25, v26, v27, (char)a2);
    }
    goto LABEL_26;
  }
  v29 = v21;
  if (v28 >= 5) {
    __DPFULog(5, "  Successfully opened %s", v22, v23, v24, v25, v26, v27, (char)a2);
  }
  uint64_t v30 = __DPFUSessionPrepareForDownload(a1);
  if (v30)
  {
LABEL_30:
    uint64_t v12 = v30;
    goto LABEL_24;
  }
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "Writing Data from File...", v31, v32, v33, v34, v35, v36, v54);
  }
  uint64_t v43 = 0;
  if (feof(v29))
  {
LABEL_21:
    uint64_t v30 = __DPFUSessionFinishDownload(a1, v43, v37, v38, v39, v40, v41, v42);
    if (!v30)
    {
      uint64_t v30 = __DPFUSessionInstallUpdate(a1, v52, v31, v32, v33, v34, v35, v36);
      if (!v30)
      {
        uint64_t v12 = __DPFUSessionFinishUpdate(a1, v8, v31, v32, v33, v34, v35, v36);
        if (v12) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    goto LABEL_30;
  }
  while (1)
  {
    size_t v44 = fread(v20, 1uLL, *(unsigned int *)(v11 + 8), v29);
    if (v44 != *(_DWORD *)(v11 + 8) && !feof(v29) && *(int *)(a1 + 48) >= 7) {
      __DPFULog(7, "Warning: attempted to read %u bytes, fread returned %lu", v45, v46, v47, v48, v49, v50, *(_DWORD *)(v11 + 8));
    }
    if (!v44) {
      goto LABEL_20;
    }
    uint64_t v51 = __DPFUSessionDownloadData(a1, (uint64_t)v20, v44);
    if (v51) {
      break;
    }
    uint64_t v43 = (v43 + v44);
    __DPFUSessionUpdateProgress(a1, v43, 0, v32, v33, v34, v35, v36);
LABEL_20:
    if (feof(v29)) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = v51;
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "  Error writing data after %u successful bytes", v31, v32, v33, v34, v35, v36, v43);
  }
LABEL_24:
  __DPFUSessionRequestMode(a1, 0, v31, v32, v33, v34, v35, v36);
LABEL_25:
  fclose(v29);
LABEL_26:
  free(v20);
  return v12;
}

uint64_t __DPFUSessionPrepareForDownload(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 24);
  unsigned __int8 v60 = 0;
  uint64_t Status = __DPFUSessionGetStatus(a1, &v60);
  if (Status) {
    return Status;
  }
  int v10 = v60;
  if (*(int *)(a1 + 48) >= 6)
  {
    char v11 = DPFUGetDeviceStatusString(v60);
    __DPFULog(6, "Initial Device Status: %s (0x%02x)", v12, v13, v14, v15, v16, v17, v11);
  }
  int v18 = *(unsigned __int8 *)(a1 + 52);
  int v19 = *v2;
  if (v18 == v19 && v10 == 2)
  {
    if (*(int *)(a1 + 48) < 6) {
      goto LABEL_76;
    }
    if (*(unsigned __int8 *)(a1 + 52) > 0x77u)
    {
      if (v18 == 120)
      {
        uint64_t v22 = "Eight-Byte Update Mode";
        goto LABEL_42;
      }
      if (v18 == 127)
      {
        uint64_t v22 = "32-KByte Update Mode";
        goto LABEL_42;
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 52))
      {
        uint64_t v22 = "Normal Mode";
        goto LABEL_42;
      }
      if (v18 == 113)
      {
        uint64_t v22 = "Single-Byte Update Mode";
LABEL_42:
        __DPFULog(6, "Device already in %s", v4, v5, v6, v7, v8, v9, (char)v22);
        goto LABEL_76;
      }
    }
    uint64_t v22 = "Unknown Mode";
    goto LABEL_42;
  }
  unsigned __int8 v59 = 0;
  if (*(int *)(a1 + 48) < 5) {
    goto LABEL_29;
  }
  if (v19 > 119)
  {
    if (v19 == 120)
    {
      uint64_t v21 = "Eight-Byte Update Mode";
      goto LABEL_28;
    }
    if (v19 == 127)
    {
      uint64_t v21 = "32-KByte Update Mode";
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v21 = "Unknown Mode";
    goto LABEL_28;
  }
  if (!v19)
  {
    uint64_t v21 = "Normal Mode";
    goto LABEL_28;
  }
  if (v19 != 113) {
    goto LABEL_27;
  }
  uint64_t v21 = "Single-Byte Update Mode";
LABEL_28:
  __DPFULog(5, "Requesting %s...", v4, v5, v6, v7, v8, v9, (char)v21);
  int v19 = *v2;
LABEL_29:
  uint64_t Status = __DPFUSessionRequestMode(a1, v19, v4, v5, v6, v7, v8, v9);
  if (Status) {
    return Status;
  }
  do
  {
    uint64_t Status = __DPFUSessionGetMode(a1, &v59);
    if (Status) {
      return Status;
    }
    usleep(0x3E8u);
    int v29 = v59;
  }
  while ((v59 & 0x80) != 0);
  if (*(int *)(a1 + 48) >= 6)
  {
    if (v59 > 0x77u)
    {
      if (v59 == 120)
      {
        uint64_t v30 = "Eight-Byte Update Mode";
        goto LABEL_46;
      }
      if (v59 == 127)
      {
        uint64_t v30 = "32-KByte Update Mode";
        goto LABEL_46;
      }
    }
    else
    {
      if (!v59)
      {
        uint64_t v30 = "Normal Mode";
        goto LABEL_46;
      }
      if (v59 == 113)
      {
        uint64_t v30 = "Single-Byte Update Mode";
LABEL_46:
        __DPFULog(6, "  New Mode: %s (0x%02x)", v23, v24, v25, v26, v27, v28, (char)v30);
        int v29 = v59;
        goto LABEL_47;
      }
    }
    uint64_t v30 = "Unknown Mode";
    goto LABEL_46;
  }
LABEL_47:
  int v31 = v29;
  if (!v29)
  {
    if (*(int *)(a1 + 48) < 5) {
      goto LABEL_60;
    }
    unsigned int v32 = *v2;
    if (v32 > 0x77)
    {
      if (v32 == 120)
      {
        uint64_t v33 = "Eight-Byte Update Mode";
        goto LABEL_59;
      }
      if (v32 == 127)
      {
        uint64_t v33 = "32-KByte Update Mode";
        goto LABEL_59;
      }
    }
    else
    {
      if (!*v2)
      {
        uint64_t v33 = "Normal Mode";
        goto LABEL_59;
      }
      if (v32 == 113)
      {
        uint64_t v33 = "Single-Byte Update Mode";
LABEL_59:
        __DPFULog(5, "Requesting %s Again...", v23, v24, v25, v26, v27, v28, (char)v33);
LABEL_60:
        uint64_t Status = __DPFUSessionRequestMode(a1, *v2, v23, v24, v25, v26, v27, v28);
        if (!Status)
        {
          do
          {
            uint64_t Status = __DPFUSessionGetMode(a1, &v59);
            if (Status) {
              return Status;
            }
            usleep(0x3E8u);
            int v31 = v59;
          }
          while ((v59 & 0x80) != 0);
          if (*(int *)(a1 + 48) < 6) {
            goto LABEL_75;
          }
          if (v59 > 0x77u)
          {
            if (v59 == 120)
            {
              uint64_t v34 = "Eight-Byte Update Mode";
              goto LABEL_74;
            }
            if (v59 == 127)
            {
              uint64_t v34 = "32-KByte Update Mode";
              goto LABEL_74;
            }
          }
          else
          {
            if (!v59)
            {
              uint64_t v34 = "Normal Mode";
              goto LABEL_74;
            }
            if (v59 == 113)
            {
              uint64_t v34 = "Single-Byte Update Mode";
LABEL_74:
              __DPFULog(6, "  New Mode: %s (0x%02x)", v23, v24, v25, v26, v27, v28, (char)v34);
              int v31 = v59;
              goto LABEL_75;
            }
          }
          uint64_t v34 = "Unknown Mode";
          goto LABEL_74;
        }
        return Status;
      }
    }
    uint64_t v33 = "Unknown Mode";
    goto LABEL_59;
  }
LABEL_75:
  int v35 = *v2;
  if (v31 != v35)
  {
    uint64_t v49 = 3758097112;
    if (*(int *)(a1 + 48) < 5) {
      return v49;
    }
    if (*v2 > 0x77u)
    {
      if (v35 == 120)
      {
        v57 = "Eight-Byte Update Mode";
        goto LABEL_101;
      }
      if (v35 == 127)
      {
        v57 = "32-KByte Update Mode";
        goto LABEL_101;
      }
    }
    else
    {
      if (!*v2)
      {
        v57 = "Normal Mode";
        goto LABEL_101;
      }
      if (v35 == 113)
      {
        v57 = "Single-Byte Update Mode";
LABEL_101:
        __DPFULog(5, "Unable to Enter %s...", v23, v24, v25, v26, v27, v28, (char)v57);
        return v49;
      }
    }
    v57 = "Unknown Mode";
    goto LABEL_101;
  }
LABEL_76:
  uint64_t Status = __DPFUSessionPollStatus(a1, &v60, 0x3E8u, 0x3E8u);
  if (Status) {
    return Status;
  }
  if (*(int *)(a1 + 48) >= 6)
  {
    char v42 = DPFUGetDeviceStatusString(v60);
    __DPFULog(6, "  Current Status in this Mode: %s (0x%02x)", v43, v44, v45, v46, v47, v48, v42);
  }
  uint64_t v49 = 3758097112;
  if (v60 == 2)
  {
    if (*(int *)(a1 + 48) >= 5) {
      __DPFULog(5, "Commanding Download...", v36, v37, v38, v39, v40, v41, v58);
    }
    uint64_t Status = __DPFUSessionSendHostCommand(a1, 1, v36, v37, v38, v39, v40, v41);
    if (!Status)
    {
      uint64_t Status = __DPFUSessionPollStatus(a1, &v60, 0x3E8u, 0x3E8u);
      if (!Status)
      {
        if (v60 == 2)
        {
          if (*(int *)(a1 + 48) >= 5) {
            __DPFULog(5, "  Download Ready", v50, v51, v52, v53, v54, v55, v58);
          }
          return 0;
        }
        return v49;
      }
    }
    return Status;
  }
  return v49;
}

uint64_t __DPFUSessionDownloadData(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = __DPFUSessionWrite(a1, *(_DWORD *)(*(void *)(a1 + 24) + 4), a2, a3);
  if (!result)
  {
    uint64_t result = __DPFUSessionSendHostCommand(a1, 2, v5, v6, v7, v8, v9, v10);
    if (!result)
    {
      char v11 = 0;
      uint64_t result = __DPFUSessionPollStatus(a1, &v11, 0, 0xAu);
      if (!result)
      {
        if ((v11 & 0xFE) == 2) {
          return 0;
        }
        else {
          return 3758097084;
        }
      }
    }
  }
  return result;
}

void __DPFUSessionUpdateProgress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 & 0x3FF) == 0 || a3)
  {
    if (*(int *)(a1 + 48) >= 5) {
      __DPFULog(5, "  %u bytes written", a3, a4, a5, a6, a7, a8, a2);
    }
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v10(a2, v11);
    }
  }
}

uint64_t __DPFUSessionFinishDownload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a2;
  unsigned __int8 v25 = 0;
  __DPFUSessionUpdateProgress(a1, a2, 1, a4, a5, a6, a7, a8);
  uint64_t result = __DPFUSessionGetStatus(a1, &v25);
  if (!result)
  {
    int v17 = v25;
    if (*(int *)(a1 + 48) >= 6)
    {
      char v18 = DPFUGetDeviceStatusString(v25);
      __DPFULog(6, "Final Status: %s (0x%02x)", v19, v20, v21, v22, v23, v24, v18);
    }
    if (v17 == 3)
    {
      if (*(int *)(a1 + 48) >= 5) {
        __DPFULog(5, "Successfully wrote %u total bytes", v11, v12, v13, v14, v15, v16, v8);
      }
      return 0;
    }
    else
    {
      return 3758097098;
    }
  }
  return result;
}

uint64_t __DPFUSessionInstallUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "Commanding Validate...", a3, a4, a5, a6, a7, a8, v25);
  }
  uint64_t v9 = __DPFUSessionSendHostCommand(a1, 4, a3, a4, a5, a6, a7, a8);
  if (v9) {
    return v9;
  }
  unsigned __int8 v26 = 0;
  uint64_t v9 = __DPFUSessionPollStatus(a1, &v26, 0, 0x186A0u);
  if (v9) {
    return v9;
  }
  uint64_t v16 = 3758097084;
  if (v26 != 4) {
    return 3758097105;
  }
  if (*(int *)(a1 + 48) >= 5)
  {
    __DPFULog(5, "  Validated", v10, v11, v12, v13, v14, v15, v25);
    if (*(int *)(a1 + 48) >= 5) {
      __DPFULog(5, "Commanding Install...", v10, v11, v12, v13, v14, v15, v25);
    }
  }
  uint64_t v9 = __DPFUSessionSendHostCommand(a1, 5, v10, v11, v12, v13, v14, v15);
  if (v9) {
    return v9;
  }
  uint64_t v9 = __DPFUSessionPollStatus(a1, &v26, 0, 0xAu);
  if (v9) {
    return v9;
  }
  int v23 = v26;
  if (v26 == 127)
  {
    if (*(int *)(a1 + 48) < 5) {
      return v16;
    }
    __DPFULog(5, "  Error Installing image!", v17, v18, v19, v20, v21, v22, v25);
    int v23 = v26;
  }
  if (v23 == 5)
  {
    if (*(int *)(a1 + 48) >= 5) {
      __DPFULog(5, "  Installed", v17, v18, v19, v20, v21, v22, v25);
    }
    return 0;
  }
  return v16;
}

uint64_t __DPFUSessionFinishUpdate(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v21 = 0;
  if (!*(unsigned char *)(a1 + 53)) {
    return __DPFUDeviceSetProperty(*(void *)(a1 + 16));
  }
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "Commanding Restart...", a3, a4, a5, a6, a7, a8, v20);
  }
  uint64_t result = __DPFUSessionSendHostCommand(a1, 6, a3, a4, a5, a6, a7, a8);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 54)) {
      return 0;
    }
    while (1)
    {
      uint64_t result = __DPFUSessionGetMode(a1, &v21);
      if (result) {
        return result;
      }
      if (*(int *)(a1 + 48) < 6) {
        goto LABEL_20;
      }
      if (v21 > 0x77u)
      {
        if (v21 == 120)
        {
          uint64_t v17 = "Eight-Byte Update Mode";
          goto LABEL_19;
        }
        if (v21 != 127) {
          goto LABEL_16;
        }
        uint64_t v17 = "32-KByte Update Mode";
      }
      else
      {
        if (!v21)
        {
          uint64_t v17 = "Normal Mode";
          goto LABEL_19;
        }
        if (v21 != 113)
        {
LABEL_16:
          uint64_t v17 = "Unknown Mode";
          goto LABEL_19;
        }
        uint64_t v17 = "Single-Byte Update Mode";
      }
LABEL_19:
      __DPFULog(6, "Device Mode: %s (0x%02x)", v11, v12, v13, v14, v15, v16, (char)v17);
LABEL_20:
      int v18 = v21;
      if (v21)
      {
        usleep(0x3E8u);
        int v18 = v21;
      }
      if (v18 == a2)
      {
        if (*(int *)(a1 + 48) < 5) {
          return __DPFUDeviceSetProperty(*(void *)(a1 + 16));
        }
        if (a2 > 119)
        {
          if (a2 == 120)
          {
            uint64_t v19 = "Eight-Byte Update Mode";
            goto LABEL_34;
          }
          if (a2 == 127)
          {
            uint64_t v19 = "32-KByte Update Mode";
            goto LABEL_34;
          }
        }
        else
        {
          if (!a2)
          {
            uint64_t v19 = "Normal Mode";
            goto LABEL_34;
          }
          if (a2 == 113)
          {
            uint64_t v19 = "Single-Byte Update Mode";
LABEL_34:
            __DPFULog(5, "  Restarted in mode: %s (0x%02x)", v11, v12, v13, v14, v15, v16, (char)v19);
            return __DPFUDeviceSetProperty(*(void *)(a1 + 16));
          }
        }
        uint64_t v19 = "Unknown Mode";
        goto LABEL_34;
      }
    }
  }
  return result;
}

uint64_t __DPFUSessionRequestMode(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = a2 | 0x80;
  if (*(int *)(a1 + 48) >= 7)
  {
    if (a2 > 119)
    {
      if (a2 == 120)
      {
        uint64_t v9 = "Eight-Byte Update Mode";
        goto LABEL_12;
      }
      if (a2 == 127)
      {
        uint64_t v9 = "32-KByte Update Mode";
        goto LABEL_12;
      }
    }
    else
    {
      if (!a2)
      {
        uint64_t v9 = "Normal Mode";
        goto LABEL_12;
      }
      if (a2 == 113)
      {
        uint64_t v9 = "Single-Byte Update Mode";
LABEL_12:
        __DPFULog(7, "Requesting Device Mode: %s (0x%02x)", a3, a4, a5, a6, a7, a8, (char)v9);
        return __DPFUSessionWrite(a1, 13, (uint64_t)&v11, 1u);
      }
    }
    uint64_t v9 = "Unknown Mode";
    goto LABEL_12;
  }
  return __DPFUSessionWrite(a1, 13, (uint64_t)&v11, 1u);
}

uint64_t DPFUSessionInstallMemoryPayload(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = __DPFUSessionPrepareForDownload(a1);
  if (v9) {
    goto LABEL_20;
  }
  if (*(int *)(a1 + 48) >= 5) {
    __DPFULog(5, "Writing Data from Memory...", v10, v11, v12, v13, v14, v15, v23);
  }
  if (a3)
  {
    uint64_t v16 = 0;
    unsigned int v17 = 0;
    while (1)
    {
      unsigned int v18 = a3 - v16 >= *(unsigned int *)(v8 + 8) ? *(_DWORD *)(v8 + 8) : a3 - v16;
      uint64_t v19 = __DPFUSessionDownloadData(a1, a2 + v16, v18);
      if (v19) {
        break;
      }
      __DPFUSessionUpdateProgress(a1, v18 + v17, 0, v11, v12, v13, v14, v15);
      v17 += v18;
      uint64_t v16 = v17;
      if (v17 >= a3) {
        goto LABEL_13;
      }
    }
    uint64_t v21 = v19;
    if (*(int *)(a1 + 48) >= 5) {
      __DPFULog(5, "  Error writing data after %u successful bytes", v10, v11, v12, v13, v14, v15, v17);
    }
    goto LABEL_16;
  }
  uint64_t v16 = 0;
LABEL_13:
  uint64_t v9 = __DPFUSessionFinishDownload(a1, v16, v10, v11, v12, v13, v14, v15);
  if (v9 || (uint64_t v9 = __DPFUSessionInstallUpdate(a1, v20, v10, v11, v12, v13, v14, v15), v9))
  {
LABEL_20:
    uint64_t v21 = v9;
    goto LABEL_16;
  }
  uint64_t v21 = __DPFUSessionFinishUpdate(a1, a4, v10, v11, v12, v13, v14, v15);
  if (v21) {
LABEL_16:
  }
    __DPFUSessionRequestMode(a1, 0, v10, v11, v12, v13, v14, v15);
  return v21;
}

uint64_t DPFUSessionSetLogLevel(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

const char *DPFUGetDeviceStatusString(int a1)
{
  uint64_t result = "Idle";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "Busy";
      break;
    case 2:
      uint64_t result = "Ready";
      break;
    case 3:
      uint64_t result = "Data End";
      break;
    case 4:
      uint64_t result = "Validated";
      break;
    case 5:
      uint64_t result = "Installed";
      break;
    default:
      uint64_t v4 = "None";
      if (a1 != 255) {
        uint64_t v4 = "Unknown";
      }
      if (a1 == 127) {
        uint64_t result = "Error";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }
  return result;
}

void __DPFUSessionFinalize(uint64_t a1)
{
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t __DPFUSessionRead(uint64_t a1)
{
  uint64_t DPCD = IODPDeviceReadDPCD();
  uint64_t v3 = DPCD;
  if (DPCD && (*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
  {
    char v4 = mach_error_string(DPCD);
    __DPFULog(0, "Error reading from device: %s (0x%08x)", v5, v6, v7, v8, v9, v10, v4);
  }
  return v3;
}

uint64_t __DPFUSessionGetStatus(uint64_t a1, unsigned char *a2)
{
  uint64_t deadline = 0;
  uint64_t result = __DPFUClockIntervalToDeadline(&deadline);
  if (!result)
  {
    uint64_t result = __DPFUSessionRead(a1);
    if (!result)
    {
      mach_wait_until(deadline);
      uint64_t result = __DPFUClockIntervalToDeadline(&deadline);
      if (!result)
      {
        uint64_t result = __DPFUSessionRead(a1);
        if (!result)
        {
          uint64_t result = 0;
          *a2 = 0;
        }
      }
    }
  }
  return result;
}

uint64_t __DPFUSessionPollStatus(uint64_t a1, unsigned char *a2, useconds_t a3, useconds_t a4)
{
  if (!a2) {
    return 3758097090;
  }
  unsigned __int8 v18 = 0;
  for (uint64_t result = __DPFUSessionGetStatus(a1, &v18); !result; uint64_t result = __DPFUSessionGetStatus(a1, &v18))
  {
    int v9 = v18;
    if (*(int *)(a1 + 48) >= 6)
    {
      char v10 = DPFUGetDeviceStatusString(v18);
      __DPFULog(6, "  Device Status: %s (0x%02x)", v11, v12, v13, v14, v15, v16, v10);
    }
    useconds_t v17 = a4;
    if (v9 == 1 || a3 && (useconds_t v17 = a3, v9 == 255))
    {
      usleep(v17);
    }
    else if (v9 != 255)
    {
      uint64_t result = 0;
      *a2 = v9;
      return result;
    }
  }
  return result;
}

uint64_t __DPFUSessionSendHostCommand(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = a2 | 0x80;
  if (*(int *)(a1 + 48) >= 7)
  {
    if ((a2 - 1) > 5) {
      int v9 = "Unknown";
    }
    else {
      int v9 = (&off_100004200)[a2 - 1];
    }
    __DPFULog(7, "Sending Host Command: %s (0x%02x)", a3, a4, a5, a6, a7, a8, (char)v9);
  }
  return __DPFUSessionWrite(a1, 14, (uint64_t)&v11, 1u);
}

uint64_t __DPFUClockIntervalToDeadline(void *a1)
{
  mach_timebase_info info = 0;
  uint64_t v2 = mach_timebase_info(&info);
  if (!v2)
  {
    unint64_t v3 = 100000 * (unint64_t)info.denom / info.numer;
    *a1 = mach_absolute_time() + v3;
  }
  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t IODPDeviceCreate()
{
  return _IODPDeviceCreate();
}

uint64_t IODPDeviceCreateWithService()
{
  return _IODPDeviceCreateWithService();
}

uint64_t IODPDeviceGetAVDevice()
{
  return _IODPDeviceGetAVDevice();
}

uint64_t IODPDeviceReadDPCD()
{
  return _IODPDeviceReadDPCD();
}

uint64_t IODPDeviceWriteDPCD()
{
  return _IODPDeviceWriteDPCD();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int isatty(int a1)
{
  return _isatty(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return _mach_wait_until(deadline);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return [a1 startService];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}