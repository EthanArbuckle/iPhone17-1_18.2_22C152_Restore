uint64_t NanoPhoneVoicemailMetaReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  NanoPhoneVoicemailBody *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(void *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(void *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_73;
          }
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_75;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_73:
        if (*(unsigned char *)(a2 + *v5)) {
          v20 = 0;
        }
LABEL_75:
        v58 = 32;
        goto LABEL_84;
      case 3u:
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(unsigned char *)(a1 + 112) |= 2u;
        while (2)
        {
          v28 = *v3;
          v29 = *(void *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v30;
            v20 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          v20 = 0;
        }
LABEL_79:
        v58 = 16;
        goto LABEL_84;
      case 4u:
        v32 = 0;
        v33 = 0;
        v20 = 0;
        *(unsigned char *)(a1 + 112) |= 4u;
        while (2)
        {
          v34 = *v3;
          v35 = *(void *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v20 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          v20 = 0;
        }
LABEL_83:
        v58 = 24;
LABEL_84:
        *(void *)(a1 + v58) = v20;
        goto LABEL_96;
      case 5u:
        *(unsigned char *)(a1 + 112) |= 1u;
        v38 = *v3;
        v39 = *(void *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
        {
          v40 = *(void *)(*(void *)(a2 + *v7) + v39);
          *(void *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          v40 = 0;
        }
        *(void *)(a1 + 8) = v40;
        goto LABEL_96;
      case 6u:
        v41 = PBReaderReadString();
        v42 = 88;
        goto LABEL_71;
      case 7u:
        v41 = PBReaderReadString();
        v42 = 40;
        goto LABEL_71;
      case 8u:
        v43 = 0;
        v44 = 0;
        v45 = 0;
        *(unsigned char *)(a1 + 112) |= 8u;
        while (2)
        {
          v46 = *v3;
          v47 = *(void *)(a2 + v46);
          v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v48;
            v45 |= (unint64_t)(v49 & 0x7F) << v43;
            if (v49 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v45) = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_88:
        v59 = 56;
        goto LABEL_93;
      case 9u:
        v41 = PBReaderReadString();
        v42 = 48;
        goto LABEL_71;
      case 0xAu:
        v50 = 0;
        v51 = 0;
        v45 = 0;
        *(unsigned char *)(a1 + 112) |= 0x10u;
        while (2)
        {
          v52 = *v3;
          v53 = *(void *)(a2 + v52);
          v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v54;
            v45 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              v15 = v51++ >= 9;
              if (v15)
              {
                LODWORD(v45) = 0;
                goto LABEL_92;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_92:
        v59 = 60;
LABEL_93:
        *(_DWORD *)(a1 + v59) = v45;
        goto LABEL_96;
      case 0xBu:
        v56 = objc_alloc_init(NanoPhoneVoicemailBody);
        objc_storeStrong((id *)(a1 + 96), v56);
        if (!PBReaderPlaceMark() || (NanoPhoneVoicemailBodyReadFrom((uint64_t)v56, a2) & 1) == 0) {
          goto LABEL_98;
        }
        goto LABEL_67;
      case 0xCu:
        v56 = objc_alloc_init(NanoPhoneVoicemailTranscript);
        objc_storeStrong((id *)(a1 + 104), v56);
        if PBReaderPlaceMark() && (NanoPhoneVoicemailTranscriptReadFrom((uint64_t)v56, a2))
        {
LABEL_67:
          PBReaderRecallMark();

LABEL_96:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_98:

        return 0;
      case 0xDu:
        v41 = PBReaderReadString();
        v42 = 80;
        goto LABEL_71;
      case 0xEu:
        v41 = PBReaderReadString();
        v42 = 64;
        goto LABEL_71;
      case 0xFu:
        v41 = PBReaderReadString();
        v42 = 72;
LABEL_71:
        v57 = *(void **)(a1 + v42);
        *(void *)(a1 + v42) = v41;

        goto LABEL_96;
      default:
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_96;
    }
  }
}

id CTSUServerQueue()
{
  if (CTSUServerQueue_onceToken != -1) {
    dispatch_once(&CTSUServerQueue_onceToken, &__block_literal_global);
  }
  v0 = (void *)CTSUServerQueue_sCTServerQueue;
  return v0;
}

void __CTSUServerQueue_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.bridge.nanophone.ctserverqueue", 0);
  v1 = (void *)CTSUServerQueue_sCTServerQueue;
  CTSUServerQueue_sCTServerQueue = (uint64_t)v0;

  if (!CTSUServerQueue_sCTServerQueue)
  {
    v2 = nph_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      v4 = "dispatch_queue_t CTSUServerQueue(void)_block_invoke";
      _os_log_impl(&dword_234652000, v2, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerQueue", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t CTSUServerConnectionRef()
{
  if (CTSUServerConnectionRef_onceToken != -1) {
    dispatch_once(&CTSUServerConnectionRef_onceToken, &__block_literal_global_3);
  }
  return CTSUServerConnectionRef_sCTServerConnectionRef;
}

void __CTSUServerConnectionRef_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  _CTServerConnectionAddIdentifierException();
  dispatch_queue_t v0 = CTSUServerQueue();
  CTSUServerConnectionRef_sCTServerConnectionRef = _CTServerConnectionCreateOnTargetQueue();

  if (!CTSUServerConnectionRef_sCTServerConnectionRef)
  {
    v1 = nph_general_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315138;
      int v3 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke";
      _os_log_impl(&dword_234652000, v1, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerConnectionRef", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __CTSUServerConnectionRef_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s notification:%@ info:%@", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t isTrashToInboxForVMDNotification(void *a1)
{
  id v1 = a1;
  int v2 = [v1 userInfo];
  int v3 = [v2 valueForKey:*MEMORY[0x263F84D08]];
  unsigned int v4 = [v3 intValue];

  uint64_t v5 = [v1 userInfo];
  uint64_t v6 = [v5 valueForKey:*MEMORY[0x263F84D10]];
  char v7 = [(id)v6 intValue];

  __int16 v8 = [v1 userInfo];

  uint64_t v9 = [v8 valueForKey:*MEMORY[0x263F84D00]];
  LOBYTE(v6) = [v9 intValue];

  uint64_t result = 0;
  if ((v6 & 8) != 0 && (v7 & 8) != 0) {
    return (v4 >> 1) & 1;
  }
  return result;
}

uint64_t syncOperationForVMDNotification(void *a1)
{
  id v1 = a1;
  int v2 = [v1 object];
  if (!v2) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  int v3 = [v1 userInfo];
  unsigned int v4 = [v3 valueForKey:*MEMORY[0x263F84D08]];
  char v5 = [v4 intValue];

  uint64_t v6 = [v1 userInfo];
  char v7 = [v6 valueForKey:*MEMORY[0x263F84D10]];
  int v8 = [v7 intValue];

  uint64_t v9 = [v1 userInfo];
  __int16 v10 = [v9 valueForKey:*MEMORY[0x263F84D00]];
  char v11 = [v10 intValue];

  if (!v8)
  {
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  if ((v11 & 8) == 0 || (v5 & 8) == 0)
  {
    if (isTrashToInboxForVMDNotification(v1))
    {
LABEL_10:
      uint64_t v12 = 1;
      goto LABEL_8;
    }
    if ((v11 & 2) != 0)
    {
      if ((~v5 & 0xA) == 0) {
        goto LABEL_10;
      }
      if ((~v11 & 3) == 0)
      {
        uint64_t v12 = 3;
        goto LABEL_8;
      }
    }
    uint64_t v12 = 2 * (v11 & 1u);
    goto LABEL_8;
  }
  uint64_t v12 = 4;
LABEL_8:

  return v12;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t _NPHActiveCountryCodeDidChange(uint64_t a1, void *a2)
{
  return [a2 _updateActiveCountryCode];
}

uint64_t _NPHHomeCountryCodeDidChange(uint64_t a1, void *a2)
{
  return [a2 _updateHomeCountryCode];
}

uint64_t _NPHNetworkCountryCodeDidChange(uint64_t a1, void *a2)
{
  return [a2 _updateNetworkCountryCode];
}

uint64_t _TUReplyWithMessageStoreNotificationHandler(uint64_t a1, void *a2)
{
  return [a2 _replyWithMessageStoreDidChange];
}

uint64_t NPHIsDebugBuild()
{
  return 0;
}

uint64_t NPHDeviceOSIsInternalInstall()
{
  if (NPHDeviceOSIsInternalInstall_onceToken != -1) {
    dispatch_once(&NPHDeviceOSIsInternalInstall_onceToken, &__block_literal_global_0);
  }
  return __NPHInternalOS;
}

uint64_t __NPHDeviceOSIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  __NPHInternalOS = result;
  return result;
}

uint64_t NPHDeviceHasBaseband()
{
  if (NPHDeviceHasBaseband_onceToken != -1) {
    dispatch_once(&NPHDeviceHasBaseband_onceToken, &__block_literal_global_15);
  }
  return NPHDeviceHasBaseband_isCellularDevice;
}

uint64_t __NPHDeviceHasBaseband_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  NPHDeviceHasBaseband_isCellularDevice = result;
  return result;
}

uint64_t NPHIsWalkaboutEnabled()
{
  if (NPHIsWalkaboutEnabled_onceToken != -1) {
    dispatch_once(&NPHIsWalkaboutEnabled_onceToken, &__block_literal_global_20);
  }
  return __NPHWalkaboutEnabled;
}

uint64_t __NPHIsWalkaboutEnabled_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (v0)
  {
    int v2 = (void *)v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"walkabout"])
      {
        if (NPHDeviceOSIsInternalInstall_onceToken != -1) {
          dispatch_once(&NPHDeviceOSIsInternalInstall_onceToken, &__block_literal_global_0);
        }
        __NPHWalkaboutEnabled = __NPHInternalOS;
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

id NPHWiFiStringKey(void *a1)
{
  id v1 = a1;
  if (MGGetBoolAnswer()) {
    int v2 = @"_WLAN";
  }
  else {
    int v2 = @"_WIFI";
  }
  int v3 = [v1 stringByAppendingString:v2];

  return v3;
}

uint64_t NPHDeriveProgramName(char *a1)
{
  int v2 = strrchr(a1, 47);
  if (v2) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = a1;
  }
  programName = [NSString stringWithUTF8String:v3];
  return MEMORY[0x270F9A758]();
}

void NPHSetTmpDirPrefix()
{
  CFPropertyListRef v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 bundleIdentifier];
  [v1 cStringUsingEncoding:4];
  char v2 = _set_user_dir_suffix();

  if ((v2 & 1) == 0)
  {
    int v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      NPHSetTmpDirPrefix_cold_1(v3);
    }
  }
}

uint64_t NPHSharedUtilitiesLocaleHaptic()
{
  return 0xFFFFFFFFLL;
}

uint64_t NPHSharedUtilitiesLocaleHapticDucked()
{
  return 0xFFFFFFFFLL;
}

id NPHSharedUtilitiesAppendBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MGCopyAnswer();
  int v3 = (void *)v2;
  unsigned int v4 = @"unknown";
  if (v2) {
    unsigned int v4 = (__CFString *)v2;
  }
  char v5 = v4;

  uint64_t v6 = [NSString stringWithFormat:@"%@.%@.", v1, v5];

  return v6;
}

__CFString *NSStringFromTUCallDisconnectedReason(unsigned int a1)
{
  if (a1 < 0x1A && ((0x3EFFFFFu >> a1) & 1) != 0)
  {
    id v1 = off_264BF5E00[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unhadled TUCallDisconnectedReason in %s", "NSString *NSStringFromTUCallDisconnectedReason(TUCallDisconnectedReason)");
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double mach_time_elapsed_to_seconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)(info.numer * a1 / info.denom) / 1000000000.0;
}

void nph_ensure_on_main_queue(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08B88];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

id ListOfVoicemailsToSyncWithManager(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = [a1 allVoicemail];
  if (v1)
  {
    uint64_t v2 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
          memset(&v14, 0, sizeof(v14));
          id v10 = [v9 dataPath];
          int v11 = lstat((const char *)[v10 fileSystemRepresentation], &v14);

          if (!v11)
          {
            off_t st_size = v14.st_size;
            if (MaxVoicemailTotalBytes_onceToken != -1) {
              dispatch_once(&MaxVoicemailTotalBytes_onceToken, &__block_literal_global_16);
            }
            if (st_size + v6 > MaxVoicemailTotalBytes_sMaxVoicemailTotalBytes) {
              goto LABEL_14;
            }
            v6 += v14.st_size;
          }
          [v2 addObject:v9];
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
LABEL_14:
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t MaxVoicemailCount()
{
  if (MaxVoicemailCount_onceToken != -1) {
    dispatch_once(&MaxVoicemailCount_onceToken, &__block_literal_global_1);
  }
  return MaxVoicemailCount_sMaxVoicemailCount;
}

void __MaxVoicemailCount_block_invoke()
{
  MaxVoicemailCount_sMaxVoicemailCount = 20;
  CFPropertyListRef v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"SYNC_MAX_VOICEMAIL_COUNT"];

  id v1 = v2;
  if (v2)
  {
    MaxVoicemailCount_sMaxVoicemailCount = [v2 integerValue];
    id v1 = v2;
  }
}

void __MaxVoicemailTotalBytes_block_invoke()
{
  MaxVoicemailTotalBytes_sMaxVoicemailTotalBytes = 5000000;
  CFPropertyListRef v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"SYNC_MAX_VOICEMAIL_TOTAL_SIZE"];

  id v1 = v2;
  if (v2)
  {
    MaxVoicemailTotalBytes_sMaxVoicemailTotalBytes = [v2 integerValue];
    id v1 = v2;
  }
}

uint64_t NanoPhoneVoicemailBodyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
        uint64_t v23 = PBReaderReadData();
        v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
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

void sub_23465BE00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23465CD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23465D018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

intptr_t __waitForFirstUnlockIfNecessary_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

os_log_t define_nph_log(char *category)
{
  os_log_t v1 = os_log_create("com.apple.NanoPhone", category);
  return v1;
}

id nph_general_log()
{
  if (nph_general_log_onceToken != -1) {
    dispatch_once(&nph_general_log_onceToken, &__block_literal_global_4);
  }
  CFPropertyListRef v0 = (void *)nph_general_log_logger;
  return v0;
}

uint64_t __nph_general_log_block_invoke()
{
  nph_general_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "general");
  return MEMORY[0x270F9A758]();
}

id nph_sos_general_log()
{
  if (nph_sos_general_log_onceToken != -1) {
    dispatch_once(&nph_sos_general_log_onceToken, &__block_literal_global_4);
  }
  CFPropertyListRef v0 = (void *)nph_sos_general_log_logger;
  return v0;
}

uint64_t __nph_sos_general_log_block_invoke()
{
  nph_sos_general_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_general");
  return MEMORY[0x270F9A758]();
}

id nph_sos_newton_log()
{
  if (nph_sos_newton_log_onceToken != -1) {
    dispatch_once(&nph_sos_newton_log_onceToken, &__block_literal_global_7_0);
  }
  CFPropertyListRef v0 = (void *)nph_sos_newton_log_logger;
  return v0;
}

uint64_t __nph_sos_newton_log_block_invoke()
{
  nph_sos_newton_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_newton");
  return MEMORY[0x270F9A758]();
}

uint64_t NanoPhoneVoicemailTranscriptReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
        uint64_t v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
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

uint64_t sub_2346602BC()
{
  uint64_t v0 = sub_234673858();
  __swift_allocate_value_buffer(v0, qword_2687AAA28);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AAA28);
  if (qword_2687AAA78 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AB9E8);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_2346604E4(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_2687AAAD8 + dword_2687AAAD8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_23466058C;
  return v4();
}

uint64_t sub_23466058C(char a1)
{
  id v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_2346606F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTMSAvailability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t variable initialization expression of Log.identifier()
{
  return 0xD000000000000012;
}

uint64_t type metadata accessor for FTMSAvailability()
{
  return self;
}

void type metadata accessor for OSLogType(uint64_t a1)
{
}

uint64_t sub_23466077C(uint64_t a1, uint64_t a2)
{
  return sub_234660AB0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_234660794(uint64_t a1, id *a2)
{
  uint64_t result = sub_234673928();
  *a2 = 0;
  return result;
}

uint64_t sub_23466080C(uint64_t a1, id *a2)
{
  char v3 = sub_234673938();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23466088C@<X0>(uint64_t *a1@<X8>)
{
  sub_234673948();
  uint64_t v2 = sub_234673918();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2346608D0()
{
  uint64_t v0 = sub_234673948();
  uint64_t v2 = v1;
  if (v0 == sub_234673948() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_234673C78();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_23466095C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_234660970@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_234673918();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2346609B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234673948();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned __int8 *sub_2346609E4@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2346609F4(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_234660A00(uint64_t a1)
{
  uint64_t v2 = sub_234662030(&qword_2687AAB10);
  uint64_t v3 = sub_234662030(&qword_2687AAB18);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_234660A98(uint64_t a1, uint64_t a2)
{
  return sub_234660AB0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_234660AB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_234673948();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_234660AF4()
{
  sub_234673948();
  sub_2346739A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_234660B48()
{
  sub_234673948();
  sub_234673C88();
  sub_2346739A8();
  uint64_t v0 = sub_234673C98();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_234660C00()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_234660C38()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_234660CE4;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_2687AAA98 + dword_2687AAA98);
  return v4(v2);
}

uint64_t sub_234660CE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_234660DD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_2346620A8;
  return v6();
}

uint64_t sub_234660EA8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2346620A8;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2687AAAA8 + dword_2687AAAA8);
  return v6(v2, v3, v4);
}

uint64_t sub_234660F68(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2346620A8;
  return v7();
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_234661078(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2346620A8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2687AAAB8 + dword_2687AAAB8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_234661144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234673A88();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_234673A78();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_234661E74(a1, &qword_2687AAA90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_234673A48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2346612F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2346613CC;
  return v6(a1);
}

uint64_t sub_2346613CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2346614C4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2346614FC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_234660CE4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687AAAC8 + dword_2687AAAC8);
  return v6(a1, v4);
}

uint64_t sub_2346615B4()
{
  return MEMORY[0x270FA2498](sub_2346615D0, 0, 0);
}

uint64_t sub_2346615D0()
{
  uint64_t v17 = v0;
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_standardUserDefaults);
  uint64_t v3 = (void *)sub_234673918();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_234673B78();
    swift_unknownObjectRelease();
    sub_234661E74(v0 + 16, &qword_2687AAAE0);
    id v5 = objc_msgSend(v1, sel_standardUserDefaults);
    uint64_t v6 = (void *)sub_234673918();
    id v7 = objc_msgSend(v5, sel_BOOLForKey_, v6);

    if (qword_2687AAA20 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_234673858();
    __swift_project_value_buffer(v8, (uint64_t)qword_2687AAA28);
    unsigned int v9 = sub_234673838();
    os_log_type_t v10 = sub_234673AC8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v0 + 72) = sub_23466A680(0xD000000000000016, 0x8000000234676B20, &v16);
      sub_234673B58();
      *(_WORD *)(v11 + 12) = 1024;
      *(_DWORD *)(v0 + 112) = v7;
      sub_234673B58();
      _os_log_impl(&dword_234652000, v9, v10, "%s: override: %{BOOL}d", (uint8_t *)v11, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v12, -1, -1);
      MEMORY[0x237DC48B0](v11, -1, -1);
    }

    char v13 = *(uint64_t (**)(id))(v0 + 8);
    return v13(v7);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_234661E74(v0 + 16, &qword_2687AAAE0);
    sub_2346737C8();
    *(void *)(v0 + 80) = sub_2346737A8();
    int v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v15;
    *int v15 = v0;
    v15[1] = sub_234661940;
    return MEMORY[0x270F28298]();
  }
}

uint64_t sub_234661940(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v4 = sub_234661C64;
  }
  else
  {
    swift_release();
    id v4 = sub_234661A5C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_234661A5C()
{
  uint64_t v12 = v0;
  if (qword_2687AAA20 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_234673858();
  __swift_project_value_buffer(v1, (uint64_t)qword_2687AAA28);
  id v2 = sub_234673838();
  os_log_type_t v3 = sub_234673AC8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[7] = sub_23466A680(0xD000000000000016, 0x8000000234676B20, &v11);
    sub_234673B58();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v6 = sub_2346737F8();
    v0[8] = sub_23466A680(v6, v7, &v11);
    sub_234673B58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_234652000, v2, v3, "%s: accountStatus: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v5, -1, -1);
    MEMORY[0x237DC48B0](v4, -1, -1);
  }

  BOOL v8 = (v0[12] & 0xFFFFFFFFFFFFFFFELL) != 2;
  unsigned int v9 = (uint64_t (*)(BOOL))v0[1];
  return v9(v8);
}

uint64_t sub_234661C64()
{
  swift_release();
  if (qword_2687AAA20 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAA28);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  BOOL v8 = (void *)v0[13];
  if (v7)
  {
    unsigned int v9 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)unsigned int v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v12;
    sub_234673B58();
    *os_log_type_t v10 = v12;

    _os_log_impl(&dword_234652000, v5, v6, "error loading account status: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v10, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(1);
}

uint64_t sub_234661E74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for AVFileType(uint64_t a1)
{
}

void sub_234661F80(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_234661FC8()
{
  return sub_234662030(&qword_2687AAAF8);
}

uint64_t sub_234661FFC()
{
  return sub_234662030(&qword_2687AAB00);
}

uint64_t sub_234662030(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AVFileType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234662074()
{
  return sub_234662030(&qword_2687AAB08);
}

uint64_t sub_2346620AC()
{
  uint64_t v0 = sub_234673858();
  __swift_allocate_value_buffer(v0, qword_2687AAB20);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AAB20);
  if (qword_2687AAA78 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AB9E8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_234662178()
{
  return sub_234662238(&qword_2687AAB38, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager);
}

uint64_t type metadata accessor for FTMSVoicemailManager(uint64_t a1)
{
  return sub_234669AC8(a1, (uint64_t *)&unk_2687AAB58);
}

uint64_t sub_2346621E0(uint64_t a1)
{
  uint64_t result = sub_234662238(&qword_2687AAB40, MEMORY[0x263F3BB80]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_234662238(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234662280()
{
  return sub_234662238(&qword_2687AAB48, MEMORY[0x263F07508]);
}

uint64_t sub_2346622C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)sub_234673668();
  os_log_type_t v6 = (void *)sub_234673818();

  if (v6)
  {
    uint64_t v7 = sub_2346735C8();
    uint64_t v8 = *(void *)(v7 - 8);
    unsigned int v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v9(v4, 1, 1, v7);
    sub_234662238(&qword_2687AACD8, MEMORY[0x263F06EA8]);
    sub_234673C58();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
    {
      uint64_t v10 = a1;
      uint64_t v11 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v4, v7);
      uint64_t v10 = a1;
      uint64_t v11 = 0;
    }
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v9)(v10, v11, 1, v7);
  }
  else
  {
    uint64_t v12 = sub_2346735C8();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    return v13(a1, 1, 1, v12);
  }
}

uint64_t sub_2346624F0()
{
  uint64_t v0 = sub_234673978();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = (char *)&v30 - v5;
  uint64_t v7 = sub_2346735C8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2346736B8();
  if (!v11 || (uint64_t v12 = (void *)v11, v13 = (void *)sub_234673818(), v12, !v13))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  v31 = v10;
  BOOL v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v14(v4, 1, 1, v7);
  sub_234662238(&qword_2687AACD8, MEMORY[0x263F06EA8]);
  sub_234673C58();

  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v15(v4, 1, v7) != 1)
  {
    uint64_t v30 = v8;
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v4, v7);
    v14(v6, 0, 1, v7);
    if (v15(v6, 1, v7) == 1) {
      goto LABEL_6;
    }
    uint64_t v19 = v31;
    v18(v31, v6, v7);
    uint64_t v20 = sub_2346735D8();
    unint64_t v22 = v21;
    sub_23466B8B0(0, &qword_2687AACE0);
    sub_234673AD8();
    uint64_t v23 = v30;
    if (v34)
    {
      sub_23466B8A0(&v33, v35);
      sub_23466B050((uint64_t)v35, (uint64_t)&v33);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AACF0);
      if (swift_dynamicCast())
      {
        v24 = self;
        sub_23466B8B0(0, &qword_2687AACF8);
        v25 = (void *)sub_2346739E8();
        swift_bridgeObjectRelease();
        id v26 = objc_msgSend(v24, sel_combinedStringFromCaptions_, v25);

        uint64_t v16 = sub_234673948();
        sub_23466B848(v20, v22);
LABEL_12:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
LABEL_23:
        (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v7);
        return v16;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
    }
    else
    {
      sub_234661E74((uint64_t)&v33, &qword_2687AAAE0);
    }
    sub_234673AD8();
    if (v34)
    {
      sub_23466B8A0(&v33, v35);
      sub_23466B050((uint64_t)v35, (uint64_t)&v33);
      sub_23466B8B0(0, &qword_2687AACE8);
      if (swift_dynamicCast())
      {
        id v27 = v32;
        id v28 = objc_msgSend(v32, sel_confidenceRating);
        if ((unint64_t)v28 > 3 || v28 == (id)1)
        {
          sub_23466B848(v20, v22);

          uint64_t v16 = 0;
        }
        else
        {
          id v29 = objc_msgSend(v27, sel_transcriptionString);
          uint64_t v16 = sub_234673948();
          sub_23466B848(v20, v22);
        }
        goto LABEL_12;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
    }
    else
    {
      sub_234661E74((uint64_t)&v33, &qword_2687AAAE0);
    }
    sub_234673968();
    uint64_t v16 = sub_234673958();
    sub_23466B848(v20, v22);
    goto LABEL_23;
  }
  v14(v6, 1, 1, v7);
LABEL_6:
  sub_234661E74((uint64_t)v6, &qword_2687AABD8);
  return 0;
}

uint64_t sub_234662CCC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a5;
  *(unsigned char *)(v5 + 216) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  *(void *)(v5 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE0);
  *(void *)(v5 + 88) = swift_task_alloc();
  *(void *)(v5 + 96) = swift_task_alloc();
  uint64_t v6 = sub_234673638();
  *(void *)(v5 + 104) = v6;
  *(void *)(v5 + 112) = *(void *)(v6 - 8);
  *(void *)(v5 + 120) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  *(void *)(v5 + 128) = swift_task_alloc();
  *(void *)(v5 + 136) = sub_234673A68();
  *(void *)(v5 + 144) = sub_234673A58();
  uint64_t v8 = sub_234673A48();
  *(void *)(v5 + 152) = v8;
  *(void *)(v5 + 160) = v7;
  return MEMORY[0x270FA2498](sub_234662E68, v8, v7);
}

uint64_t sub_234662E68()
{
  if (*(unsigned char *)(v0 + 216) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v1;
    void *v1 = v0;
    v1[1] = sub_234663130;
    return sub_234663B88();
  }
  else
  {
    if (qword_2687AAA48 != -1) {
      swift_once();
    }
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v6 = *(void *)(v0 + 88);
    *(void *)(v0 + 184) = *(void *)(qword_2687AB960 + qword_2687AB968);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_234677560;
    swift_retain();
    _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v9(v4, 1, 1, v5);
    v9(v6, 1, 1, v5);
    uint64_t v10 = sub_2346735C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    id v11 = objc_allocWithZone((Class)sub_234673738());
    *(void *)(v8 + 32) = sub_234673728();
    sub_234673A18();
    *(void *)(v0 + 192) = v8;
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_2346635B0;
    return MEMORY[0x270F28290](v8);
  }
}

uint64_t sub_234663130(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 160);
  uint64_t v4 = *(void *)(v2 + 152);
  return MEMORY[0x270FA2498](sub_234663258, v4, v3);
}

uint64_t sub_234663258()
{
  uint64_t v1 = v0[22];
  swift_release();
  if (!v1)
  {
LABEL_20:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  unint64_t v2 = v0[22];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_234673C28();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
LABEL_4:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v21 = v0[22] & 0xC000000000000001;
    unint64_t v22 = v2;
    while (1)
    {
      if (v21) {
        id v6 = (id)MEMORY[0x237DC3DF0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      uint64_t v8 = v0[16];
      uint64_t v9 = sub_234673A88();
      uint64_t v10 = *(void *)(v9 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
      id v11 = v7;
      uint64_t v12 = sub_234673A58();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v12;
      *(void *)(v13 + 24) = MEMORY[0x263F8F500];
      *(unsigned char *)(v13 + 32) = 0;
      *(void *)(v13 + 40) = v11;
      int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
      uint64_t v15 = v0[16];
      if (v14 == 1)
      {
        sub_234661E74(v0[16], &qword_2687AAA90);
        if (!*(void *)(v13 + 16)) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_234673A78();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v15, v9);
        if (!*(void *)(v13 + 16))
        {
LABEL_15:
          uint64_t v16 = 0;
          uint64_t v18 = 0;
          goto LABEL_16;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v16 = sub_234673A48();
      uint64_t v18 = v17;
      swift_unknownObjectRelease();
LABEL_16:
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = &unk_2687AACC8;
      *(void *)(v19 + 24) = v13;
      if (v18 | v16)
      {
        v0[2] = 0;
        v0[3] = 0;
        v0[4] = v16;
        v0[5] = v18;
      }
      ++v5;
      swift_task_create();

      swift_release();
      unint64_t v2 = v22;
      if (v3 == v5) {
        goto LABEL_19;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2346635B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_2346638BC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_2346636D4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2346636D4()
{
  uint64_t v9 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_234673858();
  __swift_project_value_buffer(v1, (uint64_t)qword_2687AAB20);
  uint64_t v2 = sub_234673838();
  os_log_type_t v3 = sub_234673AC8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 64) = sub_23466A680(0xD000000000000014, 0x8000000234676EC0, &v8);
    sub_234673B58();
    _os_log_impl(&dword_234652000, v2, v3, "%s: success", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v5, -1, -1);
    MEMORY[0x237DC48B0](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2346638BC()
{
  uint64_t v17 = v0;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[26];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v11;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[6] = sub_23466A680(0xD000000000000014, 0x8000000234676EC0, &v16);
    sub_234673B58();
    *(_WORD *)(v9 + 12) = 2112;
    id v12 = v8;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v13;
    sub_234673B58();
    *uint64_t v10 = v13;

    _os_log_impl(&dword_234652000, v5, v6, "%s: error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v11, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_234663B88()
{
  v1[5] = v0;
  uint64_t v2 = sub_234673858();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_234673638();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_234663CA4, 0, 0);
}

uint64_t sub_234663CA4()
{
  *(void *)(v0 + 96) = sub_234673A68();
  *(void *)(v0 + 104) = sub_234673A58();
  uint64_t v2 = sub_234673A48();
  return MEMORY[0x270FA2498](sub_234663D3C, v2, v1);
}

uint64_t sub_234663D3C()
{
  swift_release();
  if (qword_2687AAA48 != -1) {
    swift_once();
  }
  return MEMORY[0x270FA2498](sub_234663DD4, 0, 0);
}

uint64_t sub_234663DD4()
{
  *(void *)(v0 + 112) = sub_234673A58();
  uint64_t v2 = sub_234673A48();
  return MEMORY[0x270FA2498](sub_234663E60, v2, v1);
}

uint64_t sub_234663E60()
{
  swift_release();
  *(void *)(v0 + 120) = qword_2687AB960;
  return MEMORY[0x270FA2498](sub_234663ED4, 0, 0);
}

uint64_t sub_234663ED4()
{
  _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  void *v1 = v0;
  v1[1] = sub_234663F78;
  uint64_t v2 = *(void *)(v0 + 88);
  return sub_234665CC0(v2);
}

uint64_t sub_234663F78(uint64_t a1)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v5 = *(void *)(*(void *)v1 + 72);
  v2[17] = a1;
  swift_task_dealloc();
  os_log_type_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v2[18] = v6;
  v2[19] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v3, v5);
  return MEMORY[0x270FA2498](sub_2346640E4, 0, 0);
}

uint64_t sub_2346640E4()
{
  v37 = v0;
  uint64_t v1 = v0[17];
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE8);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_234677560;
    *(void *)(v2 + 32) = v1;
    uint64_t v36 = v2;
    sub_234673A18();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
    return v3(v36);
  }
  else
  {
    if (qword_2687AAA40 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)v0[5];
    uint64_t v7 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v8 = v0[6];
    uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2687AAB20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    id v10 = v5;
    uint64_t v11 = sub_234673838();
    os_log_type_t v12 = sub_234673AA8();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t type = v12;
      log = v11;
      uint64_t v13 = v0[11];
      uint64_t v14 = v0[9];
      uint64_t v34 = v0[8];
      v35 = (void (*)(uint64_t, uint64_t))v0[18];
      uint64_t v32 = v0[7];
      uint64_t v33 = v0[6];
      id v28 = (void *)v0[5];
      uint64_t v15 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v36 = v29;
      *(_DWORD *)uint64_t v15 = 136315650;
      v0[2] = sub_23466A680(0x6569726575716572, 0xEB00000000292864, &v36);
      sub_234673B58();
      *(_WORD *)(v15 + 12) = 2080;
      _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
      sub_234662238(&qword_2687AABB0, MEMORY[0x263F07508]);
      uint64_t v16 = sub_234673C68();
      unint64_t v18 = v17;
      v35(v13, v14);
      v0[3] = sub_23466A680(v16, v18, &v36);
      sub_234673B58();
      swift_bridgeObjectRelease();

      *(_WORD *)(v15 + 22) = 2080;
      sub_2346736A8();
      uint64_t v19 = sub_234673C68();
      unint64_t v21 = v20;
      v35(v13, v14);
      v0[4] = sub_23466A680(v19, v21, &v36);
      sub_234673B58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_234652000, log, type, "%s: rdar://117099230: previously vended recordUUID: %s missing, falling back to conversationUUID: %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v29, -1, -1);
      MEMORY[0x237DC48B0](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
    }
    else
    {
      uint64_t v23 = v0[7];
      uint64_t v22 = v0[8];
      v25 = (void *)v0[5];
      uint64_t v24 = v0[6];

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    v0[20] = sub_234673A58();
    uint64_t v27 = sub_234673A48();
    return MEMORY[0x270FA2498](sub_234664554, v27, v26);
  }
}

uint64_t sub_234664554()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_2346645BC, 0, 0);
}

uint64_t sub_2346645BC()
{
  *(void *)(v0 + 168) = sub_234673A58();
  uint64_t v2 = sub_234673A48();
  return MEMORY[0x270FA2498](sub_234664648, v2, v1);
}

uint64_t sub_234664648()
{
  swift_release();
  *(void *)(v0 + 176) = qword_2687AB960;
  return MEMORY[0x270FA2498](sub_2346646BC, 0, 0);
}

uint64_t sub_2346646BC()
{
  sub_2346736A8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  void *v1 = v0;
  v1[1] = sub_234664760;
  uint64_t v2 = *(void *)(v0 + 88);
  return sub_2346668E8(v2);
}

uint64_t sub_234664760(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 144);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 72);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v7(a1);
}

uint64_t sub_2346648F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a5;
  *(unsigned char *)(v5 + 248) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  *(void *)(v5 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE0);
  *(void *)(v5 + 88) = swift_task_alloc();
  *(void *)(v5 + 96) = swift_task_alloc();
  uint64_t v6 = sub_234673638();
  *(void *)(v5 + 104) = v6;
  *(void *)(v5 + 112) = *(void *)(v6 - 8);
  *(void *)(v5 + 120) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  *(void *)(v5 + 128) = swift_task_alloc();
  *(void *)(v5 + 136) = sub_234673A68();
  *(void *)(v5 + 144) = sub_234673A58();
  uint64_t v8 = sub_234673A48();
  *(void *)(v5 + 152) = v8;
  *(void *)(v5 + 160) = v7;
  return MEMORY[0x270FA2498](sub_234664A90, v8, v7);
}

uint64_t sub_234664A90()
{
  if (*(unsigned char *)(v0 + 248) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v1;
    void *v1 = v0;
    v1[1] = sub_234664E90;
    return sub_234663B88();
  }
  else
  {
    sub_234673698();
    int v3 = (unsigned __int16)sub_2346737E8();
    if (v3 == (unsigned __int16)sub_2346737E8())
    {
      if (qword_2687AAA48 != -1) {
        swift_once();
      }
      *(void *)(v0 + 184) = *(void *)(qword_2687AB960 + qword_2687AB968);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABF0);
      uint64_t v4 = swift_allocObject();
      *(void *)(v0 + 192) = v4;
      *(_OWORD *)(v4 + 16) = xmmword_234677570;
      swift_retain();
      _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_234665310;
      return MEMORY[0x270F28288](v4);
    }
    else
    {
      if (qword_2687AAA48 != -1) {
        swift_once();
      }
      uint64_t v6 = *(void *)(v0 + 112);
      uint64_t v7 = *(void *)(v0 + 96);
      uint64_t v8 = *(void *)(v0 + 104);
      uint64_t v10 = *(void *)(v0 + 80);
      uint64_t v9 = *(void *)(v0 + 88);
      *(void *)(v0 + 216) = *(void *)(qword_2687AB960 + qword_2687AB968);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE8);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_234677560;
      swift_retain();
      _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
      os_log_type_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v12(v7, 1, 1, v8);
      v12(v9, 1, 1, v8);
      uint64_t v13 = sub_2346735C8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
      id v14 = objc_allocWithZone((Class)sub_234673738());
      *(void *)(v11 + 32) = sub_234673728();
      sub_234673A18();
      *(void *)(v0 + 224) = v11;
      uint64_t v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_23466561C;
      return MEMORY[0x270F28290](v11);
    }
  }
}

uint64_t sub_234664E90(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 160);
  uint64_t v4 = *(void *)(v2 + 152);
  return MEMORY[0x270FA2498](sub_234664FB8, v4, v3);
}

uint64_t sub_234664FB8()
{
  uint64_t v1 = v0[22];
  swift_release();
  if (!v1)
  {
LABEL_20:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  unint64_t v2 = v0[22];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_234673C28();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
LABEL_4:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v21 = v0[22] & 0xC000000000000001;
    unint64_t v22 = v2;
    while (1)
    {
      if (v21) {
        id v6 = (id)MEMORY[0x237DC3DF0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      uint64_t v8 = v0[16];
      uint64_t v9 = sub_234673A88();
      uint64_t v10 = *(void *)(v9 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
      id v11 = v7;
      uint64_t v12 = sub_234673A58();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v12;
      *(void *)(v13 + 24) = MEMORY[0x263F8F500];
      *(unsigned char *)(v13 + 32) = 0;
      *(void *)(v13 + 40) = v11;
      int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
      uint64_t v15 = v0[16];
      if (v14 == 1)
      {
        sub_234661E74(v0[16], &qword_2687AAA90);
        if (!*(void *)(v13 + 16)) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_234673A78();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v15, v9);
        if (!*(void *)(v13 + 16))
        {
LABEL_15:
          uint64_t v16 = 0;
          uint64_t v18 = 0;
          goto LABEL_16;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v16 = sub_234673A48();
      uint64_t v18 = v17;
      swift_unknownObjectRelease();
LABEL_16:
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = &unk_2687AAC00;
      *(void *)(v19 + 24) = v13;
      if (v18 | v16)
      {
        v0[2] = 0;
        v0[3] = 0;
        v0[4] = v16;
        v0[5] = v18;
      }
      ++v5;
      swift_task_create();

      swift_release();
      unint64_t v2 = v22;
      if (v3 == v5) {
        goto LABEL_19;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_234665310()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_234665740;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_234665434;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234665434()
{
  uint64_t v9 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_234673858();
  __swift_project_value_buffer(v1, (uint64_t)qword_2687AAB20);
  uint64_t v2 = sub_234673838();
  os_log_type_t v3 = sub_234673AC8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 64) = sub_23466A680(0xD000000000000015, 0x8000000234676C00, &v8);
    sub_234673B58();
    _os_log_impl(&dword_234652000, v2, v3, "%s: success", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v5, -1, -1);
    MEMORY[0x237DC48B0](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_23466561C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_234665A00;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_23466B900;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234665740()
{
  uint64_t v15 = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = (void *)v0[26];
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[6] = sub_23466A680(0xD000000000000015, 0x8000000234676C00, &v14);
    sub_234673B58();
    *(_WORD *)(v7 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v11;
    sub_234673B58();
    *uint64_t v8 = v11;

    _os_log_impl(&dword_234652000, v5, v6, "%s: error: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v9, -1, -1);
    MEMORY[0x237DC48B0](v7, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_234665A00()
{
  uint64_t v15 = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = (void *)v0[30];
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[6] = sub_23466A680(0xD000000000000015, 0x8000000234676C00, &v14);
    sub_234673B58();
    *(_WORD *)(v7 + 12) = 2112;
    id v10 = v1;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v11;
    sub_234673B58();
    *uint64_t v8 = v11;

    _os_log_impl(&dword_234652000, v5, v6, "%s: error: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v9, -1, -1);
    MEMORY[0x237DC48B0](v7, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_234665CC0(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_234673638();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  uint64_t v4 = sub_234673858();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  sub_234673A68();
  v2[19] = sub_234673A58();
  uint64_t v6 = sub_234673A48();
  v2[20] = v6;
  v2[21] = v5;
  return MEMORY[0x270FA2498](sub_234665E30, v6, v5);
}

uint64_t sub_234665E30()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABF0);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  v0[22] = v5;
  *(_OWORD *)(v5 + 16) = xmmword_234677570;
  uint64_t v6 = *(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[23] = v6;
  v0[24] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v5 + v4, v3, v1);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[25] = v7;
  void *v7 = v0;
  v7[1] = sub_234665F4C;
  return MEMORY[0x270F28278](v5);
}

uint64_t sub_234665F4C(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[26] = a1;
  v3[27] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[20];
    uint64_t v5 = v3[21];
    uint64_t v6 = sub_2346664DC;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[20];
    uint64_t v5 = v3[21];
    uint64_t v6 = sub_234666068;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_234666068()
{
  v37 = v0;
  unint64_t v1 = v0[26];
  uint64_t result = swift_release();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_234673C28();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    id v3 = 0;
    goto LABEL_9;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x237DC3DF0](0, v0[26]);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v3 = *(id *)(v0[26] + 32);
  }
  swift_bridgeObjectRelease();
LABEL_9:
  v35 = v3;
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v5 = v0[9];
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v0[23];
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[15];
  uint64_t v9 = v0[16];
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[11];
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2687AAB20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v12, v8);
  v6(v10, v5, v11);
  uint64_t v13 = v35;
  id v34 = v35;
  uint64_t v14 = sub_234673838();
  os_log_type_t type = sub_234673AC8();
  BOOL v15 = os_log_type_enabled(v14, type);
  uint64_t v16 = v0[18];
  uint64_t v18 = v0[15];
  uint64_t v17 = v0[16];
  uint64_t v19 = v0[14];
  uint64_t v20 = v0[11];
  uint64_t v21 = v0[12];
  if (v15)
  {
    uint64_t v32 = v0[18];
    uint64_t v31 = v0[15];
    uint64_t v22 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v36 = v30;
    *(_DWORD *)uint64_t v22 = 136315650;
    log = v14;
    v0[5] = sub_23466A680(0x286567617373656DLL, 0xEE00293A64697575, &v36);
    sub_234673B58();
    *(_WORD *)(v22 + 12) = 2080;
    sub_234662238(&qword_2687AABB0, MEMORY[0x263F07508]);
    uint64_t v23 = sub_234673C68();
    v0[6] = sub_23466A680(v23, v24, &v36);
    uint64_t v13 = v35;
    sub_234673B58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    *(_WORD *)(v22 + 22) = 2080;
    v0[7] = v35;
    id v25 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC20);
    uint64_t v26 = sub_234673988();
    v0[8] = sub_23466A680(v26, v27, &v36);
    sub_234673B58();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_234652000, log, type, "%s: %s message: %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v30, -1, -1);
    MEMORY[0x237DC48B0](v22, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v32, v31);
  }
  else
  {
    (*(void (**)(void, void))(v21 + 8))(v0[14], v0[11]);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v28 = (uint64_t (*)(void *))v0[1];
  return v28(v13);
}

uint64_t sub_2346664DC()
{
  v35 = v0;
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[27];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[23];
  uint64_t v4 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[13];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[9];
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_2687AAB20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v9, v5);
  v2(v6, v8, v7);
  id v10 = v1;
  id v11 = v1;
  uint64_t v12 = sub_234673838();
  os_log_type_t v13 = sub_234673AA8();
  BOOL v14 = os_log_type_enabled(v12, v13);
  BOOL v15 = (void *)v0[27];
  uint64_t v16 = v0[16];
  uint64_t v17 = v0[17];
  uint64_t v18 = v0[15];
  uint64_t v20 = v0[12];
  uint64_t v19 = v0[13];
  uint64_t v21 = v0[11];
  if (v14)
  {
    uint64_t v33 = v0[15];
    log = v12;
    uint64_t v32 = v0[17];
    uint64_t v22 = swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v22 = 136315650;
    v0[2] = sub_23466A680(0x286567617373656DLL, 0xEE00293A64697575, &v34);
    sub_234673B58();
    *(_WORD *)(v22 + 12) = 2080;
    sub_234662238(&qword_2687AABB0, MEMORY[0x263F07508]);
    uint64_t v23 = sub_234673C68();
    v0[3] = sub_23466A680(v23, v24, &v34);
    sub_234673B58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    *(_WORD *)(v22 + 22) = 2112;
    id v25 = v15;
    uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v26;
    sub_234673B58();
    *uint64_t v29 = v26;

    _os_log_impl(&dword_234652000, log, v13, "%s: %s error: %@)", (uint8_t *)v22, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v31, -1, -1);
    MEMORY[0x237DC48B0](v22, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v32, v33);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27(0);
}

uint64_t sub_2346668E8(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_234673638();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_234673658();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  sub_234673A68();
  v2[17] = sub_234673A58();
  uint64_t v6 = sub_234673A48();
  v2[18] = v6;
  v2[19] = v5;
  return MEMORY[0x270FA2498](sub_234666A48, v6, v5);
}

uint64_t sub_234666A48()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = (uint64_t *)v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[8];
  uint64_t v7 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABF0);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_234677570;
  id v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[20] = v10;
  v0[21] = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v9 + v8, v6, v4);
  *(void *)(v7 + 16) = v9;
  uint64_t *v1 = v7;
  uint64_t v11 = *MEMORY[0x263F3BBC8];
  uint64_t v12 = sub_2346737D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v1, v11, v12);
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F3BB78], v3);
  os_log_type_t v13 = (void *)swift_task_alloc();
  v0[22] = v13;
  *os_log_type_t v13 = v0;
  v13[1] = sub_234666C18;
  uint64_t v14 = v0[16];
  return MEMORY[0x270F28280](v14, 0x7FFFFFFFFFFFFFFFLL, 0);
}

uint64_t sub_234666C18(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 128);
  uint64_t v6 = *(void *)(*v2 + 120);
  uint64_t v7 = *(void *)(*v2 + 112);
  *(void *)(v4 + 184) = a1;
  *(void *)(v4 + 192) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v8 = *(void *)(v3 + 152);
  uint64_t v9 = *(void *)(v3 + 144);
  if (v1) {
    id v10 = sub_234667128;
  }
  else {
    id v10 = sub_234666DB8;
  }
  return MEMORY[0x270FA2498](v10, v9, v8);
}

uint64_t sub_234666DB8()
{
  unint64_t v27 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[8];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[20];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v5 = sub_234673858();
  __swift_project_value_buffer(v5, (uint64_t)qword_2687AAB20);
  v2(v3, v1, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_234673838();
  os_log_type_t v7 = sub_234673AC8();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[13];
  uint64_t v11 = v0[10];
  uint64_t v10 = v0[11];
  if (v8)
  {
    log = v6;
    os_log_type_t type = v7;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v12 = 136315650;
    v0[5] = sub_23466A680(0xD00000000000001BLL, 0x8000000234676C20, &v26);
    sub_234673B58();
    *(_WORD *)(v12 + 12) = 2080;
    sub_234662238(&qword_2687AABB0, MEMORY[0x263F07508]);
    uint64_t v13 = sub_234673C68();
    v0[6] = sub_23466A680(v13, v14, &v26);
    sub_234673B58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    *(_WORD *)(v12 + 22) = 2080;
    uint64_t v15 = sub_234673708();
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x237DC3C50](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    v0[7] = sub_23466A680(v17, v19, &v26);
    sub_234673B58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_234652000, log, type, "%s: %s messages: %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v24, -1, -1);
    MEMORY[0x237DC48B0](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[13], v0[10]);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = v0[23];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(uint64_t))v0[1];
  return v21(v20);
}

uint64_t sub_234667128()
{
  unint64_t v27 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[20];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = sub_234673858();
  __swift_project_value_buffer(v6, (uint64_t)qword_2687AAB20);
  v2(v3, v5, v4);
  id v7 = v1;
  id v8 = v1;
  uint64_t v9 = sub_234673838();
  os_log_type_t v10 = sub_234673AA8();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = (void *)v0[24];
  uint64_t v14 = v0[11];
  uint64_t v13 = v0[12];
  uint64_t v15 = v0[10];
  if (v11)
  {
    os_log_type_t type = v10;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = v25;
    *(_DWORD *)uint64_t v16 = 136315650;
    v0[2] = sub_23466A680(0xD00000000000001BLL, 0x8000000234676C20, &v26);
    sub_234673B58();
    *(_WORD *)(v16 + 12) = 2080;
    sub_234662238(&qword_2687AABB0, MEMORY[0x263F07508]);
    uint64_t v17 = sub_234673C68();
    v0[3] = sub_23466A680(v17, v18, &v26);
    sub_234673B58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    *(_WORD *)(v16 + 22) = 2112;
    id v19 = v12;
    uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v20;
    sub_234673B58();
    void *v24 = v20;

    _os_log_impl(&dword_234652000, v9, type, "%s: %s error: %@)", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v25, -1, -1);
    MEMORY[0x237DC48B0](v16, -1, -1);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21(0);
}

uint64_t sub_2346674B4()
{
  return _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
}

uint64_t sub_2346674D8()
{
  uint64_t v1 = v0 + qword_2687AB990;
  uint64_t v2 = sub_234673638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unownedRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_234667604()
{
  uint64_t result = sub_23466B3CC();
  qword_2687AB960 = result;
  return result;
}

uint64_t sub_234667624()
{
  v1[6] = v0;
  uint64_t v2 = sub_234673858();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_234673658();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  sub_234673A68();
  v1[14] = sub_234673A58();
  uint64_t v5 = sub_234673A48();
  v1[15] = v5;
  v1[16] = v4;
  return MEMORY[0x270FA2498](sub_234667784, v5, v4);
}

uint64_t sub_234667784()
{
  uint64_t v1 = v0[13];
  uint64_t v33 = v0[12];
  uint64_t v34 = v0[11];
  id v2 = objc_msgSend(self, sel_sharedInstance);
  id v3 = objc_msgSend(v2, sel_providerManager);

  id v4 = objc_msgSend(v3, sel_telephonyProvider);
  id v5 = objc_msgSend(v4, sel_identifier);

  uint64_t v6 = sub_234673948();
  uint64_t v31 = v7;
  uint64_t v32 = v6;

  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC58);
  uint64_t v9 = v1 + *(int *)(v8 + 48);
  os_log_type_t v10 = (uint64_t *)(v1 + *(int *)(v8 + 64));
  uint64_t v11 = *MEMORY[0x263F3BB88];
  uint64_t v12 = sub_234673718();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v1, v11, v12);
  uint64_t v13 = *MEMORY[0x263F3BB90];
  uint64_t v14 = sub_234673748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v9, v13, v14);
  uint64_t v15 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC60);
  uint64_t v16 = sub_2346737D8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_234677580;
  uint64_t v21 = (uint64_t *)(v20 + v19);
  uint64_t v22 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC68);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_234677570;
  *(void *)(v23 + 32) = v32;
  *(void *)(v23 + 40) = v31;
  *(void *)(v22 + 16) = v23;
  *uint64_t v21 = v22;
  uint64_t v24 = *(void (**)(uint64_t *, void, uint64_t))(v17 + 104);
  v24(v21, *MEMORY[0x263F3BBE0], v16);
  uint64_t v25 = (uint64_t *)((char *)v21 + v18);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = &unk_26E767660;
  uint64_t *v25 = v26;
  v24(v25, *MEMORY[0x263F3BBD8], v16);
  *(void *)(v15 + 16) = v20;
  *os_log_type_t v10 = v15;
  v24(v10, *MEMORY[0x263F3BBD0], v16);
  (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v1, *MEMORY[0x263F3BB70], v34);
  uint64_t v27 = MaxVoicemailCount();
  uint64_t v28 = (void *)swift_task_alloc();
  v0[17] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_234667B5C;
  uint64_t v29 = v0[13];
  return MEMORY[0x270F28280](v29, v27, 0);
}

uint64_t sub_234667B5C(uint64_t a1)
{
  id v3 = (void *)*v2;
  id v4 = (void *)*v2;
  v4[18] = a1;
  v4[19] = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v3[12] + 8))(v3[13], v3[11]);
  uint64_t v5 = v3[16];
  uint64_t v6 = v3[15];
  if (v1) {
    uint64_t v7 = sub_234667FF4;
  }
  else {
    uint64_t v7 = sub_234667CEC;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_234667CEC()
{
  uint64_t v22 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AC8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = v0[18];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[4] = sub_23466A680(0x6563696F566C6C61, 0xEC0000006C69616DLL, &v21);
    sub_234673B58();
    *(_WORD *)(v9 + 12) = 2048;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_234673C28();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v12 = v0[8];
    uint64_t v19 = v0[7];
    uint64_t v20 = v0[10];
    swift_bridgeObjectRelease();
    v0[5] = v11;
    sub_234673B58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_234652000, v5, v6, "%s: count: %ld", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v10, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v20, v19);
  }
  else
  {
    uint64_t v13 = v0[10];
    uint64_t v14 = v0[7];
    uint64_t v15 = v0[8];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  if ((v0[18] & 0x8000000000000000) != 0 || (v8 & 0x4000000000000000) != 0)
  {
    uint64_t v16 = (uint64_t)sub_23466B2D4(v0[18]);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFF8;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v16);
}

uint64_t sub_234667FF4()
{
  uint64_t v25 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[19];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2687AAB20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  unint64_t v8 = sub_234673838();
  os_log_type_t v9 = sub_234673AA8();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[19];
  uint64_t v13 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v14 = v0[7];
  if (v10)
  {
    uint64_t v23 = v0[9];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v22 = v14;
    v0[2] = sub_23466A680(0x6563696F566C6C61, 0xEC0000006C69616DLL, &v24);
    sub_234673B58();
    *(_WORD *)(v15 + 12) = 2112;
    id v17 = v11;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v18;
    sub_234673B58();
    *uint64_t v16 = v18;

    _os_log_impl(&dword_234652000, v8, v9, "%s: error: %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v21, -1, -1);
    MEMORY[0x237DC48B0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v22);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_2346682EC()
{
  uint64_t v1 = v0;
  uint64_t v18 = sub_234673AE8();
  uint64_t v2 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC88);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + *(void *)(*(void *)v1 + 96);
  uint64_t v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC90);
  sub_234673898();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  uint64_t v14 = v1 + *(void *)(*(void *)v1 + 104);
  uint64_t v19 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC98);
  sub_234673898();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v14, v8, v5);
  *(void *)(v1 + *(void *)(*(void *)v1 + 112)) = MEMORY[0x263F8EE88];
  id v15 = objc_msgSend(self, sel_defaultCenter);
  sub_234673AF8();

  sub_234662238(&qword_2687AACA0, MEMORY[0x263F07CB0]);
  swift_retain();
  uint64_t v16 = v18;
  sub_2346738F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v16);
  swift_beginAccess();
  sub_234673868();
  swift_endAccess();
  swift_release();
  return v1;
}

uint64_t sub_234668678()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_234673858();
  __swift_project_value_buffer(v4, (uint64_t)qword_2687AAB20);
  swift_retain_n();
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AC8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v17 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_retain();
    uint64_t v9 = sub_234673988();
    uint64_t v16 = sub_23466A680(v9, v10, &v17);
    sub_234673B58();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v16 = sub_23466A680(0xD000000000000010, 0x8000000234676E80, &v17);
    sub_234673B58();
    _os_log_impl(&dword_234652000, v5, v6, "%s: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v8, -1, -1);
    MEMORY[0x237DC48B0](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v11 = sub_234673A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
  sub_234673A68();
  swift_retain();
  uint64_t v12 = sub_234673A58();
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v1;
  sub_23466B904((uint64_t)v3, (uint64_t)&unk_2687AAC38, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_234668988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  v4[5] = sub_234673A68();
  v4[6] = sub_234673A58();
  uint64_t v5 = (void *)swift_task_alloc();
  v4[7] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_234668A38;
  return sub_234667624();
}

uint64_t sub_234668A38(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_234673A48();
    uint64_t v7 = v6;
    uint64_t v8 = sub_234668CCC;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_234673A48();
    uint64_t v7 = v9;
    uint64_t v8 = sub_234668BB8;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_234668BB8()
{
  uint64_t v1 = v0[9];
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  uint64_t v3 = sub_234673708();
  void *v2 = v3;
  uint64_t v4 = type metadata accessor for FTMSVoicemailManager.Account(0);
  v2[1] = v4;
  swift_getKeyPath();
  swift_task_dealloc();
  uint64_t v5 = (void *)swift_task_alloc();
  *uint64_t v5 = v3;
  v5[1] = v4;
  swift_getKeyPath();
  swift_task_dealloc();
  v0[3] = v1;
  swift_retain();
  sub_2346738C8();
  sub_23466A160();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_234668CCC()
{
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[8];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_234673B58();
    *unint64_t v10 = v12;

    _os_log_impl(&dword_234652000, v5, v6, "error loading voicemail: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v10, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_234668ED8(int a1)
{
  *(void *)(v2 + 56) = v1;
  *(_DWORD *)(v2 + 144) = a1;
  uint64_t v3 = sub_234673658();
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = *(void *)(v3 - 8);
  *(void *)(v2 + 80) = swift_task_alloc();
  sub_234673A68();
  *(void *)(v2 + 88) = sub_234673A58();
  uint64_t v5 = sub_234673A48();
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 104) = v4;
  return MEMORY[0x270FA2498](sub_234668FD0, v5, v4);
}

uint64_t sub_234668FD0()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(uint64_t **)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  int v4 = *(_DWORD *)(v0 + 144);
  uint64_t v5 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AACB8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_234677570;
  *(_DWORD *)(v6 + 32) = v4;
  *(void *)(v5 + 16) = v6;
  uint64_t *v1 = v5;
  uint64_t v7 = *MEMORY[0x263F3BBC0];
  uint64_t v8 = sub_2346737D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v1, v7, v8);
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F3BB78], v3);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_23466914C;
  uint64_t v10 = *(void *)(v0 + 80);
  return MEMORY[0x270F28280](v10, 0x7FFFFFFFFFFFFFFFLL, 0);
}

uint64_t sub_23466914C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = *(void *)(*v2 + 72);
  uint64_t v7 = *(void *)(*v2 + 64);
  *(void *)(v4 + 120) = a1;
  *(void *)(v4 + 128) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v8 = *(void *)(v3 + 104);
  uint64_t v9 = *(void *)(v3 + 96);
  if (v1) {
    uint64_t v10 = sub_234669608;
  }
  else {
    uint64_t v10 = sub_2346692EC;
  }
  return MEMORY[0x270FA2498](v10, v9, v8);
}

uint64_t sub_2346692EC()
{
  uint64_t v18 = v0;
  unint64_t v1 = *(void *)(v0 + 120);
  uint64_t result = swift_release();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_234673C28();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    id v3 = 0;
    goto LABEL_9;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x237DC3DF0](0, *(void *)(v0 + 120));
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v3 = *(id *)(*(void *)(v0 + 120) + 32);
  }
  swift_bridgeObjectRelease();
LABEL_9:
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_234673858();
  __swift_project_value_buffer(v5, (uint64_t)qword_2687AAB20);
  id v6 = v3;
  uint64_t v7 = sub_234673838();
  os_log_type_t v8 = sub_234673AC8();
  if (os_log_type_enabled(v7, v8))
  {
    id v16 = v3;
    int v9 = *(_DWORD *)(v0 + 144);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136315650;
    *(void *)(v0 + 40) = sub_23466A680(0xD000000000000015, 0x8000000234676EA0, &v17);
    sub_234673B58();
    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 136) = v9;
    id v3 = v16;
    sub_234673B58();
    *(_WORD *)(v10 + 18) = 2080;
    *(void *)(v0 + 48) = v16;
    id v12 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC20);
    uint64_t v13 = sub_234673988();
    *(void *)(v0 + 24) = sub_23466A680(v13, v14, &v17);
    sub_234673B58();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_234652000, v7, v8, "%s: %d message: %s", (uint8_t *)v10, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v11, -1, -1);
    MEMORY[0x237DC48B0](v10, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(id))(v0 + 8);
  return v15(v3);
}

uint64_t sub_234669608()
{
  uint64_t v18 = v0;
  swift_release();
  if (qword_2687AAA40 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = sub_234673858();
  __swift_project_value_buffer(v2, (uint64_t)qword_2687AAB20);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_234673838();
  os_log_type_t v6 = sub_234673AA8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = *(void **)(v0 + 128);
  if (v7)
  {
    int v16 = *(_DWORD *)(v0 + 144);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v9 = 136315650;
    *(void *)(v0 + 16) = sub_23466A680(0xD000000000000015, 0x8000000234676EA0, &v17);
    sub_234673B58();
    *(_WORD *)(v9 + 12) = 1024;
    *(_DWORD *)(v0 + 140) = v16;
    sub_234673B58();
    *(_WORD *)(v9 + 18) = 2112;
    id v12 = v8;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 32) = v13;
    sub_234673B58();
    *uint64_t v10 = v13;

    _os_log_impl(&dword_234652000, v5, v6, "%s: %d error: %@)", (uint8_t *)v9, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v11, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  unint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14(0);
}

uint64_t sub_2346698D4()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_234669914()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_234669A54()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FTMSVoicemailManager.Account(uint64_t a1)
{
  return sub_234669AC8(a1, (uint64_t *)&unk_2687AAB68);
}

uint64_t sub_234669AC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234669B00()
{
  return swift_initClassMetadata2();
}

uint64_t sub_234669B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + qword_2687AB990;
  uint64_t v4 = sub_234673638();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_234669BB4()
{
  return sub_234669BD8();
}

uint64_t sub_234669BD8()
{
  return 0;
}

uint64_t sub_234669FA0(void *a1)
{
  a1[1] = sub_234662238(&qword_2687AAB78, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager.Account);
  a1[2] = sub_234662238(&qword_2687AAB80, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager.Account);
  uint64_t result = sub_234662238(&qword_2687AAB88, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager.Account);
  a1[3] = result;
  return result;
}

uint64_t sub_23466A04C()
{
  return sub_234662238(&qword_2687AAB90, MEMORY[0x263F3BB80]);
}

uint64_t sub_23466A094()
{
  return sub_234662238(&qword_2687AAB98, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager.Account);
}

uint64_t sub_23466A0DC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_234662238(&qword_2687AABA0, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager);
  uint64_t result = sub_234662238(&qword_2687AABA8, (void (*)(uint64_t))type metadata accessor for FTMSVoicemailManager);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23466A160()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_234673858();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2687AAA70 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2687AADD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  BOOL v7 = sub_234673838();
  int v8 = sub_234673AC8();
  if (os_log_type_enabled(v7, (os_log_type_t)v8))
  {
    int v24 = v8;
    os_log_t v25 = v7;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v28 = v23;
    *(_DWORD *)uint64_t v9 = 136315650;
    unint64_t v26 = v1;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC48);
    uint64_t v10 = sub_234673988();
    unint64_t v26 = sub_23466A680(v10, v11, &v28);
    sub_234673B58();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    unint64_t v26 = sub_23466A680(0x69616D6563696F76, 0xEA0000000000736CLL, &v28);
    uint64_t v12 = sub_234673B58();
    *(_WORD *)(v9 + 22) = 2080;
    MEMORY[0x270FA5388](v12);
    uint64_t v13 = sub_234673708();
    *(&v23 - 2) = v13;
    uint64_t v14 = type metadata accessor for FTMSVoicemailManager.Account(0);
    *(&v23 - 1) = v14;
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v23 - 2) = v13;
    *(&v23 - 1) = v14;
    swift_getKeyPath();
    sub_2346738B8();
    swift_release();
    swift_release();
    unint64_t v16 = v26;
    if (v26)
    {
      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_234673C28();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = 0;
    }
    unint64_t v26 = v17;
    BOOL v27 = v16 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC50);
    uint64_t v18 = sub_234673988();
    unint64_t v26 = sub_23466A680(v18, v19, &v28);
    sub_234673B58();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v20 = v25;
    _os_log_impl(&dword_234652000, v25, (os_log_type_t)v24, "%s.%s: count: %s", (uint8_t *)v9, 0x20u);
    uint64_t v21 = v23;
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v21, -1, -1);
    MEMORY[0x237DC48B0](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23466A5A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234671DF8();
  *a1 = result;
  return result;
}

uint64_t sub_23466A5CC()
{
  return sub_234671EAC();
}

uint64_t sub_23466A5F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC48);
  sub_23466B644(&qword_2687AACA8, &qword_2687AAC48);
  sub_234673878();
  sub_234673888();
  return swift_release();
}

uint64_t sub_23466A680(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23466A754(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23466B050((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23466B050((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23466A754(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_234673B68();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23466A910(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_234673BB8();
  if (!v8)
  {
    sub_234673C18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_234673C38();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23466A910(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23466A9A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23466AB88(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23466AB88(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23466A9A8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_23466AB20(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_234673B98();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_234673C18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2346739C8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_234673C38();
    __break(1u);
LABEL_14:
    uint64_t result = sub_234673C18();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23466AB20(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23466AB88(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC28);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_234673C38();
  __break(1u);
  return result;
}

void (*sub_23466ACD8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23466AD88(v6, a2, a3);
  return sub_23466AD40;
}

void sub_23466AD40(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23466AD88(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x237DC3DF0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)unint64_t v3 = v4;
    return sub_23466AE08;
  }
  __break(1u);
  return result;
}

void sub_23466AE08(id *a1)
{
}

uint64_t sub_23466AE14(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = sub_2346620A8;
  return sub_2346648F4(a1, v4, v5, v6, v7);
}

uint64_t sub_23466AED8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23466AF10(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2346620A8;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687AAD38 + dword_2687AAD38);
  return v6(a1, v4);
}

uint64_t sub_23466AFC8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23466B050(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23466B0B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_234673C28();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_234673C28();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23466B644(&qword_2687AAC78, &qword_2687AAC70);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC70);
          uint64_t v12 = sub_23466ACD8(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_234673708();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_234673C38();
  __break(1u);
  return result;
}

void *sub_23466B2D4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABE8);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23466B0B0((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_234673C28();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_23466B3CC()
{
  type metadata accessor for FTMSVoicemailManager(0);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + qword_2687AAB50) = MEMORY[0x263F8EE88];
  uint64_t v1 = qword_2687AB968;
  sub_2346737C8();
  swift_retain();
  *(void *)(v0 + v1) = sub_2346737A8();
  swift_release();
  uint64_t v2 = sub_2346682EC();
  swift_retain_n();
  swift_retain();
  sub_2346737B8();
  swift_release();
  sub_234668678();
  swift_release();
  return v2;
}

uint64_t sub_23466B490()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23466B4D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_234660CE4;
  return sub_234668988(a1, v4, v5, v6);
}

uint64_t sub_23466B584@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234671DF8();
  *a1 = result;
  return result;
}

uint64_t sub_23466B5B0()
{
  return sub_234671EAC();
}

uint64_t sub_23466B5DC()
{
  return 16;
}

__n128 sub_23466B5E8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_23466B63C()
{
  return sub_23466A5F8();
}

uint64_t sub_23466B644(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23466B6CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2346620A8;
  return sub_234662CCC(a1, v4, v5, v6, v7);
}

uint64_t sub_23466B790(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_234660CE4;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687AAD38 + dword_2687AAD38);
  return v6(a1, v4);
}

uint64_t sub_23466B848(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

_OWORD *sub_23466B8A0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23466B8B0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_23466B904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234673A88();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_234673A78();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_234661E74(a1, &qword_2687AAA90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_234673A48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23466BAB0()
{
  uint64_t v0 = sub_234673858();
  __swift_allocate_value_buffer(v0, qword_2687AAD00);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AAD00);
  if (qword_2687AAA78 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AB9E8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_23466BB78(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_234673608();
  uint64_t v4 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_234673638();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (!v11) {
    goto LABEL_17;
  }
  id v12 = v11;
  _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
  uint64_t v13 = sub_23466C174();
  uint64_t v15 = v14;
  unint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  objc_msgSend(v12, sel_setVoicemailNumber_, v13);
  _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0();
  uint64_t v17 = sub_23466C4E0();
  v16(v10, v7);
  objc_msgSend(v12, sel_setIdentifier_, v17);
  objc_msgSend(v12, sel_setRemoteUID_, v15);
  sub_234673688();
  sub_2346735F8();
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v38);
  objc_msgSend(v12, sel_setDate_, v19);
  sub_2346736C8();
  os_log_t v20 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setSender_, v20);

  sub_2346736C8();
  uint64_t v21 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setCallbackNumber_, v21);

  sub_2346736E8();
  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v22 <= -2147483650.0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v22 >= 2147483650.0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(v12, sel_setDuration_, (int)v22);
  uint64_t v23 = v37;
  sub_2346622C8(v37);
  uint64_t v24 = sub_2346735C8();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_234661E74(v23, &qword_2687AABD8);
    unint64_t v26 = 0;
  }
  else
  {
    sub_234673598();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    unint64_t v26 = (void *)sub_234673918();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v12, sel_setDataPath_, v26);

  sub_2346736F8();
  BOOL v27 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setProviderID_, v27);

  objc_msgSend(v12, sel_setFlags_, sub_2346736D8() & 1 | 2);
  id v28 = objc_msgSend(objc_allocWithZone((Class)NanoPhoneVoicemailBody), sel_init);
  objc_msgSend(v12, sel_setVoicemailBody_, v28);

  id v29 = objc_msgSend(v12, sel_voicemailBody);
  if (!v29) {
    goto LABEL_18;
  }
  uint64_t v30 = v29;
  objc_msgSend(v29, sel_setVoicemailNumber_, objc_msgSend(v12, sel_voicemailNumber));

  sub_2346624F0();
  uint64_t v31 = v12;
  if (!v32)
  {
LABEL_13:

    return;
  }
  id v33 = objc_msgSend(objc_allocWithZone((Class)NanoPhoneVoicemailTranscript), sel_init);
  objc_msgSend(v12, sel_setVoicemailTranscript_, v33);

  id v34 = objc_msgSend(v12, sel_voicemailTranscript);
  if (!v34) {
    goto LABEL_19;
  }
  uint64_t v35 = v34;
  objc_msgSend(v34, sel_setVoicemailNumber_, objc_msgSend(v12, sel_voicemailNumber));

  id v36 = objc_msgSend(v12, sel_voicemailTranscript);
  if (v36)
  {
    uint64_t v31 = (void *)sub_234673918();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_setTranscriptionString_, v31);

    goto LABEL_13;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_23466C174()
{
  unint64_t v0 = sub_234673628();
  char v1 = v0;
  char v3 = v2;
  unint64_t v4 = v0 >> 8;
  unint64_t v5 = v0 >> 16;
  unint64_t v6 = v0 >> 24;
  unint64_t v7 = HIDWORD(v0);
  unint64_t v8 = v0 >> 40;
  unint64_t v9 = HIWORD(v0);
  unint64_t v31 = HIBYTE(v0);
  unint64_t v32 = v2 >> 8;
  unint64_t v33 = v2 >> 16;
  unint64_t v34 = v2 >> 24;
  unint64_t v35 = HIDWORD(v2);
  unint64_t v36 = v2 >> 40;
  unint64_t v37 = HIWORD(v2);
  unint64_t v38 = HIBYTE(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC28);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_234677720;
  *(unsigned char *)(v10 + 32) = v1;
  *(unsigned char *)(v10 + 33) = v4;
  *(unsigned char *)(v10 + 34) = v5;
  *(unsigned char *)(v10 + 35) = v6;
  *(unsigned char *)(v10 + 36) = v7;
  *(unsigned char *)(v10 + 37) = v8;
  *(unsigned char *)(v10 + 38) = v9;
  *(unsigned char *)(v10 + 39) = v31;
  uint64_t v11 = sub_234670980(v10);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_234677720;
  *(unsigned char *)(v14 + 32) = v3;
  *(unsigned char *)(v14 + 33) = v32;
  *(unsigned char *)(v14 + 34) = v33;
  *(unsigned char *)(v14 + 35) = v34;
  *(unsigned char *)(v14 + 36) = v35;
  *(unsigned char *)(v14 + 37) = v36;
  *(unsigned char *)(v14 + 38) = v37;
  *(unsigned char *)(v14 + 39) = v38;
  uint64_t v15 = sub_234670980(v14);
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = v11;
  switch(v13 >> 62)
  {
    case 1uLL:
      if ((int)v11 > v11 >> 32)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      sub_2346717B8(v11, v13);
      uint64_t v19 = sub_2346734F8();
      if (!v19)
      {
LABEL_25:
        sub_234673508();
        __break(1u);
LABEL_26:
        sub_234673508();
        __break(1u);
LABEL_27:
        sub_234673508();
        __break(1u);
LABEL_28:
        sub_234673508();
        __break(1u);
        JUMPOUT(0x23466C4C0);
      }
      uint64_t v20 = v19;
      uint64_t v21 = sub_234673518();
      uint64_t v22 = (int)v11 - v21;
      if (__OFSUB__((int)v11, v21))
      {
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      sub_234673508();
      uint64_t v18 = *(void *)(v20 + v22);
      sub_23466B848(v11, v13);
LABEL_10:
      switch(v17 >> 62)
      {
        case 1uLL:
          if ((int)v15 > v15 >> 32) {
            goto LABEL_21;
          }
          sub_2346717B8(v15, v17);
          if (!sub_2346734F8()) {
            goto LABEL_27;
          }
          if (__OFSUB__((int)v15, sub_234673518())) {
            goto LABEL_24;
          }
          sub_234673508();
          sub_23466B848(v15, v17);
LABEL_18:
          sub_23466B848(v15, v17);
          sub_23466B848(v11, v13);
          return v18;
        case 2uLL:
          uint64_t v29 = *(void *)(v15 + 16);
          swift_retain();
          swift_retain();
          if (!sub_2346734F8()) {
            goto LABEL_28;
          }
          if (__OFSUB__(v29, sub_234673518())) {
            goto LABEL_22;
          }
          sub_234673508();
          swift_release();
          swift_release();
          goto LABEL_18;
        default:
          goto LABEL_18;
      }
    case 2uLL:
      uint64_t v23 = *(void *)(v11 + 16);
      swift_retain();
      swift_retain();
      uint64_t v24 = sub_2346734F8();
      if (!v24) {
        goto LABEL_26;
      }
      uint64_t v25 = v24;
      uint64_t v26 = sub_234673518();
      BOOL v27 = __OFSUB__(v23, v26);
      uint64_t v28 = v23 - v26;
      if (v27) {
        goto LABEL_20;
      }
      sub_234673508();
      uint64_t v18 = *(void *)(v25 + v28);
      swift_release();
      swift_release();
      goto LABEL_10;
    case 3uLL:
      uint64_t v18 = 0;
      goto LABEL_10;
    default:
      goto LABEL_10;
  }
}

uint64_t sub_23466C4E0()
{
  unint64_t v0 = sub_234673628();
  char v1 = v0;
  unint64_t v2 = v0 >> 8;
  unint64_t v3 = v0 >> 16;
  unint64_t v4 = v0 >> 24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC28);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_234677720;
  *(unsigned char *)(v5 + 32) = v1;
  *(unsigned char *)(v5 + 33) = v2;
  *(unsigned char *)(v5 + 34) = v3;
  *(unsigned char *)(v5 + 35) = v4;
  *(_DWORD *)(v5 + 36) = 0;
  uint64_t v6 = sub_234670980(v5);
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = v6;
  switch(v8 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      uint64_t v10 = sub_2346734F8();
      if (!v10)
      {
LABEL_14:
        sub_234673508();
        __break(1u);
LABEL_15:
        sub_234673508();
        __break(1u);
        JUMPOUT(0x23466C648);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_234673518();
      uint64_t v13 = (int)v6 - v12;
      if (__OFSUB__((int)v6, v12))
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      sub_234673508();
      uint64_t v9 = *(void *)(v11 + v13);
LABEL_10:
      sub_23466B848(v6, v8);
      return v9;
    case 2uLL:
      uint64_t v14 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v15 = sub_2346734F8();
      if (!v15) {
        goto LABEL_15;
      }
      uint64_t v16 = v15;
      uint64_t v17 = sub_234673518();
      BOOL v18 = __OFSUB__(v14, v17);
      uint64_t v19 = v14 - v17;
      if (v18) {
        goto LABEL_12;
      }
      sub_234673508();
      uint64_t v9 = *(void *)(v16 + v19);
      swift_release();
      swift_release();
      goto LABEL_10;
    case 3uLL:
      uint64_t v9 = 0;
      goto LABEL_10;
    default:
      goto LABEL_10;
  }
}

uint64_t sub_23466C658()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AABD8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v78 = (uint64_t)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v77 = (char *)&v66 - v7;
  uint64_t v82 = sub_234673548();
  uint64_t v8 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_2346735C8();
  uint64_t v83 = *(void *)(v81 - 8);
  uint64_t v11 = *(void *)(v83 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v81);
  v76 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v66 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  BOOL v18 = (char *)&v66 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  v80 = (char *)&v66 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v66 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v66 - v24;
  id v26 = objc_msgSend(v0, sel_dataPath);
  if (!v26) {
    return 0;
  }
  BOOL v27 = v26;
  v74 = v15;
  v75 = v18;
  v79 = v25;
  uint64_t v28 = sub_234673948();

  sub_234673998();
  char v29 = sub_2346739D8();
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0)
  {
    v67 = v3;
    id v73 = self;
    id v30 = objc_msgSend(v73, sel_defaultManager);
    id v31 = objc_msgSend(v30, sel_temporaryDirectory);

    unint64_t v32 = v80;
    sub_234673588();

    id v84 = objc_msgSend(v0, sel_voicemailNumber);
    id v84 = (id)sub_234673C68();
    uint64_t v85 = v33;
    unint64_t v34 = *(void (**)(void))(v8 + 104);
    unsigned int v70 = *MEMORY[0x263F06E50];
    uint64_t v35 = v82;
    uint64_t v71 = v8 + 104;
    v69 = (void (*)(char *, void, uint64_t))v34;
    v34(v10);
    sub_234671810();
    sub_2346735B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v35);
    swift_bridgeObjectRelease();
    uint64_t v37 = v83 + 8;
    unint64_t v36 = *(void (**)(char *, uint64_t))(v83 + 8);
    v68 = v10;
    uint64_t v38 = v81;
    v36(v32, v81);
    sub_234673578();
    uint64_t v72 = v37;
    v36(v23, v38);
    v39 = v36;
    id v40 = objc_msgSend(v73, sel_defaultManager);
    sub_234673598();
    v41 = (void *)sub_234673918();
    swift_bridgeObjectRelease();
    unsigned __int8 v42 = objc_msgSend(v40, sel_fileExistsAtPath_, v41);

    if (v42)
    {
      swift_bridgeObjectRelease();
      v43 = v79;
LABEL_5:
      uint64_t v28 = sub_234673598();
      v39(v43, v38);
      return v28;
    }
    v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56);
    v44(v77, 1, 1, v38);
    v69(v68, v70, v82);
    v45 = v75;
    sub_2346735A8();
    uint64_t v46 = v78;
    sub_23466CE38(v45, v78);
    uint64_t v47 = v38;
    v44((char *)v46, 0, 1, v38);
    uint64_t v48 = v83;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48))(v46, 1, v38) != 1)
    {
      v77 = *(char **)(v48 + 32);
      v50 = v74;
      ((void (*)(char *, uint64_t, uint64_t))v77)(v74, v46, v38);
      uint64_t v82 = (uint64_t)dispatch_semaphore_create(0);
      uint64_t v51 = sub_234673A88();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v67, 1, 1, v51);
      v52 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
      v53 = v80;
      v52(v80, v50, v47);
      v54 = v76;
      v43 = v79;
      v52(v76, v79, v47);
      uint64_t v55 = *(unsigned __int8 *)(v48 + 80);
      uint64_t v56 = (v55 + 32) & ~v55;
      v57 = v39;
      uint64_t v58 = (v11 + v55 + v56) & ~v55;
      unint64_t v59 = (v11 + v58 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v60 = swift_allocObject();
      uint64_t v61 = v60 + v56;
      *(void *)(v60 + 16) = 0;
      *(void *)(v60 + 24) = 0;
      v62 = (void (*)(uint64_t, char *, uint64_t))v77;
      ((void (*)(uint64_t, char *, uint64_t))v77)(v61, v53, v81);
      uint64_t v63 = v60 + v58;
      v39 = v57;
      uint64_t v38 = v81;
      v62(v63, v54, v81);
      v64 = (void *)v82;
      *(void *)(v60 + v59) = v82;
      id v65 = v64;
      sub_23466B904((uint64_t)v67, (uint64_t)&unk_2687AADA8, v60);
      swift_release();
      sub_234673B08();

      v57(v74, v38);
      v57(v75, v38);
      goto LABEL_5;
    }
    v39(v45, v38);
    v39(v79, v38);
    sub_234661E74(v46, &qword_2687AABD8);
    return 0;
  }
  return v28;
}

id sub_23466CE38@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  v77 = a1;
  v79[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_234673548();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_2346735C8();
  uint64_t v76 = *(void *)(v74 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v74);
  uint64_t v71 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_t v70 = (os_log_t)((char *)v64 - v9);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v72 = (char *)v64 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v64 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v64 - v15;
  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_defaultManager);
  id v19 = objc_msgSend(v18, sel_temporaryDirectory);

  sub_234673588();
  v79[0] = (id)sub_234673558();
  v79[1] = v20;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06E50], v2);
  sub_234671810();
  sub_2346735B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  uint64_t v21 = v76 + 8;
  uint64_t v22 = v14;
  uint64_t v23 = v74;
  v75 = *(void (**)(char *, uint64_t))(v76 + 8);
  v75(v22, v74);
  id v24 = objc_msgSend(v17, sel_defaultManager);
  sub_234673598();
  uint64_t v25 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  LODWORD(v18) = objc_msgSend(v24, sel_fileExistsAtPath_, v25);

  if (!v18) {
    goto LABEL_10;
  }
  if (qword_2687AAA50 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_234673858();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_2687AAD00);
  uint64_t v28 = v72;
  uint64_t v66 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  uint64_t v67 = v76 + 16;
  v66(v72, v16, v23);
  uint64_t v68 = v27;
  char v29 = sub_234673838();
  os_log_type_t v30 = sub_234673AC8();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    unint64_t v32 = (void *)swift_slowAlloc();
    uint64_t v69 = v21;
    uint64_t v33 = v32;
    v79[0] = v32;
    id v65 = v17;
    *(_DWORD *)id v31 = 136315138;
    v64[1] = v31 + 4;
    sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
    uint64_t v34 = sub_234673C68();
    uint64_t v78 = sub_23466A680(v34, v35, (uint64_t *)v79);
    uint64_t v17 = v65;
    sub_234673B58();
    swift_bridgeObjectRelease();
    v75(v28, v23);
    _os_log_impl(&dword_234652000, v29, v30, "A file already exists at outputURL %s! Checking if it's equal", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v33, -1, -1);
    MEMORY[0x237DC48B0](v31, -1, -1);
  }
  else
  {
    v75(v28, v23);
  }

  id v36 = objc_msgSend(v17, sel_defaultManager);
  sub_234673598();
  uint64_t v37 = v17;
  uint64_t v38 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  sub_234673598();
  v39 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  unsigned int v40 = objc_msgSend(v36, sel_contentsEqualAtPath_andPath_, v38, v39);

  uint64_t v17 = v37;
  if (v40)
  {
    os_log_t v41 = v70;
    unsigned __int8 v42 = v66;
    v66((char *)v70, v77, v23);
    v43 = v71;
    v42(v71, v16, v23);
    v44 = sub_234673838();
    os_log_type_t v45 = sub_234673AC8();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v72 = (char *)swift_slowAlloc();
      v79[0] = v72;
      *(_DWORD *)uint64_t v47 = 136315394;
      sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
      v77 = v16;
      LODWORD(v69) = v46;
      uint64_t v48 = sub_234673C68();
      uint64_t v78 = sub_23466A680(v48, v49, (uint64_t *)v79);
      sub_234673B58();
      swift_bridgeObjectRelease();
      os_log_t v50 = v41;
      uint64_t v51 = v75;
      v75((char *)v50, v23);
      *(_WORD *)(v47 + 12) = 2080;
      os_log_t v70 = v44;
      v52 = v71;
      uint64_t v16 = v77;
      uint64_t v53 = sub_234673C68();
      uint64_t v78 = sub_23466A680(v53, v54, (uint64_t *)v79);
      sub_234673B58();
      swift_bridgeObjectRelease();
      v51(v52, v23);
      v44 = v70;
      _os_log_impl(&dword_234652000, v70, (os_log_type_t)v69, "%s and %s have the same contents!", (uint8_t *)v47, 0x16u);
      uint64_t v55 = v72;
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v55, -1, -1);
      MEMORY[0x237DC48B0](v47, -1, -1);
    }
    else
    {
      uint64_t v63 = v75;
      v75((char *)v41, v23);
      v63(v43, v23);
    }

    return (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v76 + 32))(v73, v16, v23);
  }
  else
  {
LABEL_10:
    id v56 = objc_msgSend(v17, sel_defaultManager);
    v57 = (void *)sub_234673568();
    uint64_t v58 = (void *)sub_234673568();
    v79[0] = 0;
    unsigned int v59 = objc_msgSend(v56, sel_copyItemAtURL_toURL_error_, v57, v58, v79);

    id v60 = v79[0];
    if (v59)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v73, v16, v23);
      return v60;
    }
    else
    {
      id v62 = v79[0];
      sub_234673538();

      swift_willThrow();
      return (id)((uint64_t (*)(char *, uint64_t))v75)(v16, v23);
    }
  }
}

uint64_t sub_23466D734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_23466D7D4;
  return sub_23466D94C(a4, a5);
}

uint64_t sub_23466D7D4()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_234671B0C;
  }
  else
  {
    uint64_t v1 = sub_23466D8EC;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_23466D8EC()
{
  sub_234673B18();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23466D94C(uint64_t a1, uint64_t a2)
{
  v2[30] = a1;
  v2[31] = a2;
  uint64_t v3 = sub_2346735C8();
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23466DA34, 0, 0);
}

uint64_t sub_23466DA34()
{
  uint64_t v71 = v0;
  if (qword_2687AAA50 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v5 = sub_234673858();
  v0[38] = __swift_project_value_buffer(v5, (uint64_t)qword_2687AAD00);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[39] = v6;
  v0[40] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  id v65 = v6;
  v6(v2, v1, v3);
  uint64_t v7 = sub_234673838();
  os_log_type_t v8 = sub_234673AC8();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[37];
  uint64_t v12 = v0[32];
  uint64_t v11 = v0[33];
  uint64_t v69 = v0;
  if (v9)
  {
    os_log_type_t typea = v8;
    uint64_t v13 = v0 + 28;
    uint64_t v14 = v0 + 29;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v70[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    *uint64_t v13 = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v70);
    sub_234673B58();
    *(_WORD *)(v15 + 12) = 2080;
    sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
    uint64_t v17 = sub_234673C68();
    *uint64_t v14 = sub_23466A680(v17, v18, v70);
    sub_234673B58();
    swift_bridgeObjectRelease();
    id v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(v10, v12);
    _os_log_impl(&dword_234652000, v7, typea, "%s: MOV to AMR conversion started for %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v16, -1, -1);
    uint64_t v0 = v69;
    MEMORY[0x237DC48B0](v15, -1, -1);
  }
  else
  {
    id v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(v10, v12);
  }

  v0[41] = v19;
  uint64_t v20 = (void *)sub_234673568();
  id v21 = objc_msgSend(self, sel_assetWithURL_, v20);
  v0[42] = v21;

  sub_234673948();
  id v22 = objc_allocWithZone(MEMORY[0x263EFA4A8]);
  id v23 = v21;
  id v24 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithAsset_presetName_, v23, v24);
  v0[43] = v25;

  if (v25)
  {
    *(void *)os_log_type_t type = v23;
    id v26 = objc_msgSend(v25, sel_supportedFileTypes);
    type metadata accessor for AVFileType(0);
    uint64_t v28 = v27;
    uint64_t v29 = sub_2346739F8();

    id v30 = (id)*MEMORY[0x263EF9848];
    LOBYTE(v26) = sub_23466EFD4((uint64_t)v30, v29);

    if (v26)
    {
      swift_bridgeObjectRetain();
      id v31 = sub_234673838();
      os_log_type_t v32 = sub_234673AC8();
      if (os_log_type_enabled(v31, v32))
      {
        os_log_type_t v67 = v32;
        uint64_t v33 = v69;
        uint64_t v34 = swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        v70[0] = v66;
        *(_DWORD *)uint64_t v34 = 136315394;
        v69[26] = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v70);
        sub_234673B58();
        *(_WORD *)(v34 + 12) = 2080;
        uint64_t v35 = swift_bridgeObjectRetain();
        uint64_t v36 = MEMORY[0x237DC3C50](v35, v28);
        unint64_t v38 = v37;
        swift_bridgeObjectRelease();
        v69[27] = sub_23466A680(v36, v38, v70);
        sub_234673B58();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_234652000, v31, v67, "%s: Supported file types: %s", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x237DC48B0](v66, -1, -1);
        MEMORY[0x237DC48B0](v34, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        uint64_t v33 = v69;
      }
      id v56 = (void *)sub_234673568();
      objc_msgSend(v25, sel_setOutputURL_, v56);

      objc_msgSend(v25, sel_setOutputFileType_, v30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AADC8);
      uint64_t v57 = sub_234673648();
      v33[44] = v57;
      uint64_t v58 = (void *)swift_task_alloc();
      v33[45] = v58;
      *uint64_t v58 = v33;
      v58[1] = sub_23466E4DC;
      return MEMORY[0x270F9C8E8](v33 + 16, v57);
    }
    uint64_t v45 = v69[34];
    uint64_t v46 = v69[32];
    uint64_t v47 = v69[30];
    swift_bridgeObjectRelease();
    v65(v45, v47, v46);
    uint64_t v48 = sub_234673838();
    os_log_type_t v49 = sub_234673AA8();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v51 = v69[34];
    uint64_t v52 = v69[32];
    if (v50)
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      v70[0] = v68;
      *(_DWORD *)uint64_t v53 = 136315394;
      v69[17] = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v70);
      sub_234673B58();
      *(_WORD *)(v53 + 12) = 2080;
      sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
      uint64_t v54 = sub_234673C68();
      v69[15] = sub_23466A680(v54, v55, v70);
      sub_234673B58();
      swift_bridgeObjectRelease();
      v19(v51, v52);
      _os_log_impl(&dword_234652000, v48, v49, "%s: AVFoundation doesn't support exporting this file as a .amr file. Input file: %s", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v68, -1, -1);
      MEMORY[0x237DC48B0](v53, -1, -1);
    }
    else
    {
      v19(v69[34], v69[32]);
    }

    id v23 = *(id *)type;
    uint64_t v59 = sub_234673808();
    sub_234671AC4(&qword_2687AADB8, MEMORY[0x263F3BBF0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v59 - 8) + 104))(v60, *MEMORY[0x263F3BBE8], v59);
    swift_willThrow();

    uint64_t v0 = v69;
  }
  else
  {
    v39 = sub_234673838();
    uint64_t v40 = sub_234673AA8();
    if (os_log_type_enabled(v39, (os_log_type_t)v40))
    {
      os_log_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v70[0] = v42;
      *(_DWORD *)os_log_t v41 = 136315138;
      v0[18] = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v70);
      sub_234673B58();
      _os_log_impl(&dword_234652000, v39, (os_log_type_t)v40, "%s: Failed to setup export session for .mov to .amr conversion!", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v42, -1, -1);
      MEMORY[0x237DC48B0](v41, -1, -1);
    }

    uint64_t v43 = sub_234673808();
    sub_234671AC4(&qword_2687AADB8, MEMORY[0x263F3BBF0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v43 - 8) + 104))(v44, *MEMORY[0x263F3BBE8], v43);
    swift_willThrow();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v61 = (uint64_t (*)(void))v0[1];
  return v61();
}

uint64_t sub_23466E4DC()
{
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_23466EF34;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_23466E5F8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23466E5F8()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[43];
  sub_23466B8B0(0, &qword_2687AADD0);
  uint64_t v2 = (void *)sub_2346739E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setMetadata_, v2);

  id v3 = v1;
  uint64_t v4 = sub_234673838();
  os_log_type_t v5 = sub_234673AC8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[43];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[24] = sub_23466A680(0xD000000000000011, 0x80000002346770C0, &v15);
    sub_234673B58();
    *(_WORD *)(v7 + 12) = 2112;
    v0[25] = v6;
    id v8 = v6;
    sub_234673B58();
    *uint64_t v13 = v6;

    _os_log_impl(&dword_234652000, v4, v5, "%s: Set exportSession properties %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v14, -1, -1);
    MEMORY[0x237DC48B0](v7, -1, -1);
  }
  else
  {
    BOOL v9 = (void *)v0[43];
  }
  uint64_t v10 = (void *)v0[43];
  v0[2] = v0;
  v0[3] = sub_23466E8E8;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23466F12C;
  v0[13] = &block_descriptor;
  v0[14] = v11;
  objc_msgSend(v10, sel_exportAsynchronouslyWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23466E8E8()
{
  return MEMORY[0x270FA2498](sub_23466E9C8, 0, 0);
}

uint64_t sub_23466E9C8()
{
  uint64_t v39 = v0;
  id v1 = objc_msgSend(*(id *)(v0 + 344), sel_error);
  uint64_t v2 = *(void (**)(void, void, uint64_t))(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 256);
  if (v1)
  {
    uint64_t v4 = v1;
    v2(*(void *)(v0 + 288), *(void *)(v0 + 240), v3);
    id v5 = v4;
    uint64_t v6 = sub_234673838();
    os_log_type_t v7 = sub_234673AA8();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void *)(v0 + 288);
    uint64_t v10 = *(void *)(v0 + 256);
    if (v8)
    {
      id v31 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
      os_log_type_t type = v7;
      uint64_t v11 = swift_slowAlloc();
      uint64_t v33 = (void *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v38[0] = v36;
      *(_DWORD *)uint64_t v11 = 136315650;
      *(void *)(v0 + 168) = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v38);
      sub_234673B58();
      *(_WORD *)(v11 + 12) = 2080;
      sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
      uint64_t v12 = sub_234673C68();
      *(void *)(v0 + 176) = sub_23466A680(v12, v13, v38);
      sub_234673B58();
      swift_bridgeObjectRelease();
      v31(v9, v10);
      *(_WORD *)(v11 + 22) = 2112;
      id v14 = v5;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 184) = v15;
      sub_234673B58();
      *uint64_t v33 = v15;

      _os_log_impl(&dword_234652000, v6, type, "%s: Conversion failed for %s with error %@", (uint8_t *)v11, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAAE8);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v33, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v36, -1, -1);
      MEMORY[0x237DC48B0](v11, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v0 + 328))(*(void *)(v0 + 288), *(void *)(v0 + 256));
    }
    uint64_t v28 = *(void **)(v0 + 336);
    uint64_t v27 = *(void **)(v0 + 344);
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v2(*(void *)(v0 + 280), *(void *)(v0 + 248), v3);
    uint64_t v16 = sub_234673838();
    os_log_type_t v17 = sub_234673AC8();
    BOOL v18 = os_log_type_enabled(v16, v17);
    id v19 = *(void **)(v0 + 344);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    uint64_t v21 = *(void *)(v0 + 280);
    uint64_t v22 = *(void *)(v0 + 256);
    if (v18)
    {
      unint64_t v37 = *(void **)(v0 + 336);
      os_log_type_t typea = *(void **)(v0 + 344);
      uint64_t v23 = swift_slowAlloc();
      os_log_type_t v32 = v20;
      uint64_t v24 = swift_slowAlloc();
      v38[0] = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      *(void *)(v0 + 152) = sub_23466A680(0xD000000000000011, 0x80000002346770C0, v38);
      sub_234673B58();
      *(_WORD *)(v23 + 12) = 2080;
      sub_234671AC4(&qword_2687AADC0, MEMORY[0x263F06EA8]);
      uint64_t v25 = sub_234673C68();
      *(void *)(v0 + 160) = sub_23466A680(v25, v26, v38);
      sub_234673B58();
      swift_bridgeObjectRelease();
      v32(v21, v22);
      _os_log_impl(&dword_234652000, v16, v17, "%s: MOV to AMR conversion finished for %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v24, -1, -1);
      MEMORY[0x237DC48B0](v23, -1, -1);
    }
    else
    {

      v20(v21, v22);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v29();
}

uint64_t sub_23466EF34()
{
  id v1 = *(void **)(v0 + 344);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23466EFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_234673948();
  uint64_t v5 = v4;
  if (v3 == sub_234673948() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_234673C78();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_234673948();
    uint64_t v14 = v13;
    if (v12 == sub_234673948() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_234673C78();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23466F12C(uint64_t a1)
{
  return MEMORY[0x270FA2400](*(void *)(a1 + 32));
}

uint64_t sub_23466F1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  size_t v3 = sub_234670708((size_t)&v9, (unint64_t)&v10);
  uint64_t v9 = a2;
  size_t v4 = sub_234670708((size_t)&v9, (unint64_t)&v10);
  unint64_t v5 = *(void *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v5 == 1)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v5 < 3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v5 == 3)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v5 < 5)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v5 == 5)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v5 < 7)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v5 == 7)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  size_t v6 = v4;
  swift_release();
  unint64_t v7 = *(void *)(v6 + 16);
  if (!v7)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v7 == 1)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v7 < 3)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v7 == 3)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v7 < 5)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v7 == 5)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v7 < 7)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  if (v7 == 7) {
    goto LABEL_33;
  }
  swift_release();
  return sub_234673618();
}

uint64_t sub_23466F394()
{
  uint64_t result = sub_234673918();
  qword_2687AB970 = result;
  return result;
}

uint64_t sub_23466F3CC()
{
  if (qword_2687AAA58 != -1) {
    swift_once();
  }
  uint64_t result = sub_234673948();
  qword_2687AB978 = result;
  unk_2687AB980 = v1;
  return result;
}

id sub_23466F428()
{
  if (qword_2687AAA60 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_234673918();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_23466F4B4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FTMSVoicemailManager_ObjC()), sel_init);
  qword_2687AB988 = (uint64_t)result;
  return result;
}

uint64_t sub_23466F5C0()
{
  return swift_bridgeObjectRetain();
}

void sub_23466F668()
{
  uint64_t v1 = sub_2346734D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  size_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2687AAA58 != -1) {
    swift_once();
  }
  size_t v6 = (void *)qword_2687AB970;
  v10[3] = type metadata accessor for FTMSVoicemailManager_ObjC();
  v10[0] = v0;
  id v7 = v6;
  id v8 = v0;
  sub_2346734C8();
  uint64_t v9 = (void *)sub_2346734B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  objc_msgSend(v5, sel_postNotification_, v9);
}

id sub_23466F7DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAD58);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  size_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAD60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_allVoicemail] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_cancellables] = MEMORY[0x263F8EE88];
  uint64_t v9 = (objc_class *)type metadata accessor for FTMSVoicemailManager_ObjC();
  v15.receiver = v0;
  v15.super_class = v9;
  id v10 = objc_msgSendSuper2(&v15, sel_init);
  uint64_t v11 = qword_2687AAA48;
  id v12 = v10;
  if (v11 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC88);
  sub_2346738A8();
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAD68);
  sub_23466B644(&qword_2687AAD70, &qword_2687AAD58);
  sub_2346738E8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_getKeyPath();
  v14[1] = v12;
  sub_23466B644(&qword_2687AAD78, &qword_2687AAD60);
  sub_234673908();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  sub_234673868();
  swift_endAccess();
  swift_release();

  return v12;
}

unint64_t *sub_23466FB0C@<X0>(unint64_t *result@<X0>, void *a2@<X8>)
{
  unint64_t v3 = *result;
  if (!*result)
  {
    uint64_t v7 = 0;
LABEL_14:
    *a2 = v7;
    return result;
  }
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_234673C28();
  if (!v4)
  {
LABEL_13:
    id result = (unint64_t *)swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v8 = MEMORY[0x263F8EE78];
  id result = (unint64_t *)sub_234673BE8();
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_23466B8B0(0, &qword_2687AAD80);
    uint64_t v5 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x237DC3DF0](v5, v3);
      }
      else {
        id v6 = *(id *)(v3 + 8 * v5 + 32);
      }
      ++v5;
      sub_23466BB78(v6);
      sub_234673BC8();
      sub_234673BF8();
      sub_234673C08();
      sub_234673BD8();
    }
    while (v4 != v5);
    uint64_t v7 = v8;
    id result = (unint64_t *)swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void sub_23466FC78(void *a1, void *a2)
{
  *(void *)(*a2 + OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_allVoicemail) = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_23466F668();
}

uint64_t sub_23466FCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  v5[2] = swift_task_alloc();
  v5[3] = sub_234673A68();
  v5[4] = sub_234673A58();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[5] = v7;
  void *v7 = v5;
  v7[1] = sub_23466FDBC;
  return sub_234670A40(a5);
}

uint64_t sub_23466FDBC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_234673A48();
  return MEMORY[0x270FA2498](sub_23466FF00, v3, v2);
}

uint64_t sub_23466FF00()
{
  uint64_t v1 = v0[6];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[6];
    uint64_t v3 = v0[2];
    uint64_t v4 = sub_234673A88();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    id v5 = v2;
    uint64_t v6 = sub_234673A58();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8F500];
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = v8;
    *(unsigned char *)(v7 + 32) = 1;
    *(void *)(v7 + 40) = v5;
    sub_23466B904(v3, (uint64_t)&unk_2687AACC8, v7);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_234670044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  v5[2] = swift_task_alloc();
  v5[3] = sub_234673A68();
  v5[4] = sub_234673A58();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[5] = v7;
  void *v7 = v5;
  v7[1] = sub_234670120;
  return sub_234670A40(a5);
}

uint64_t sub_234670120(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_234673A48();
  return MEMORY[0x270FA2498](sub_234670264, v3, v2);
}

uint64_t sub_234670264()
{
  uint64_t v1 = v0[6];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[6];
    uint64_t v3 = v0[2];
    uint64_t v4 = sub_234673A88();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    id v5 = v2;
    uint64_t v6 = sub_234673A58();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8F500];
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = v8;
    *(unsigned char *)(v7 + 32) = 1;
    *(void *)(v7 + 40) = v5;
    sub_23466B904(v3, (uint64_t)&unk_2687AAC00, v7);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_2346703A8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_234673A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_234673A68();
  id v12 = a3;
  id v13 = a1;
  id v14 = v12;
  uint64_t v15 = sub_234673A58();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v13;
  v16[5] = v14;
  sub_23466B904((uint64_t)v10, a5, (uint64_t)v16);

  return swift_release();
}

id sub_2346704F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTMSVoicemailManager_ObjC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FTMSVoicemailManager_ObjC()
{
  return self;
}

uint64_t sub_234670598(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_234660CE4;
  return sub_234670044(a1, v4, v5, v7, v6);
}

uint64_t sub_234670658()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unsigned char *sub_234670690@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    id result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    id result = (unsigned char *)sub_2346707BC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    id result = (unsigned char *)sub_234670880((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    id result = (unsigned char *)sub_2346708FC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

size_t sub_234670708(size_t result, unint64_t a2)
{
  if (!result) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = (const void *)result;
  int64_t v4 = a2 - result;
  if (a2 == result) {
    return MEMORY[0x263F8EE78];
  }
  if (v4 < 1)
  {
    unint64_t v5 = (void *)MEMORY[0x263F8EE78];
    if (!a2) {
      goto LABEL_13;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC28);
    unint64_t v5 = (void *)swift_allocObject();
    id result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2) {
      goto LABEL_13;
    }
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_2346707BC(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_234670880(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_234673528();
  swift_allocObject();
  uint64_t result = sub_2346734E8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2346735E8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2346708FC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_234673528();
  swift_allocObject();
  uint64_t result = sub_2346734E8();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_234670980(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAD88);
  uint64_t v10 = sub_23466B644(&qword_2687AAD90, &qword_2687AAD88);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  int64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_234670690(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t sub_234670A40(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_234673638();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_234673A68();
  v1[10] = sub_234673A58();
  uint64_t v4 = sub_234673A48();
  v1[11] = v4;
  v1[12] = v3;
  return MEMORY[0x270FA2498](sub_234670B44, v4, v3);
}

uint64_t sub_234670B44()
{
  sub_23466F1AC((uint64_t)objc_msgSend(*(id *)(v0 + 40), sel_voicemailNumber), (uint64_t)objc_msgSend(*(id *)(v0 + 40), sel_remoteUID));
  if (qword_2687AAA48 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  void *v1 = v0;
  v1[1] = sub_234670C54;
  uint64_t v2 = *(void *)(v0 + 72);
  return sub_234665CC0(v2);
}

uint64_t sub_234670C54(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  return MEMORY[0x270FA2498](sub_234670D7C, v4, v3);
}

uint64_t sub_234670D7C()
{
  uint64_t v32 = v0;
  if (*(void *)(v0 + 112))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 48));
    swift_release();
    uint64_t v1 = *(void *)(v0 + 112);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v26(v1);
  }
  id v2 = objc_msgSend(*(id *)(v0 + 40), sel_identifier);
  if (v2 != (id)(int)v2)
  {
    swift_release();
    if (qword_2687AAA50 != -1) {
      swift_once();
    }
    uint64_t v4 = *(void *)(v0 + 64);
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = *(void **)(v0 + 40);
    uint64_t v8 = sub_234673858();
    __swift_project_value_buffer(v8, (uint64_t)qword_2687AAD00);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
    id v9 = v7;
    uint64_t v10 = sub_234673838();
    os_log_type_t v11 = sub_234673AA8();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v14 = *(void *)(v0 + 72);
    uint64_t v16 = *(void *)(v0 + 48);
    uint64_t v15 = *(void *)(v0 + 56);
    uint64_t v17 = *(void **)(v0 + 40);
    if (v12)
    {
      uint64_t v30 = *(void *)(v0 + 72);
      os_log_type_t type = v11;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v31 = v29;
      *(_DWORD *)uint64_t v18 = 136315650;
      log = v10;
      *(void *)(v0 + 16) = sub_23466A680(0xD000000000000013, 0x80000002346770A0, &v31);
      sub_234673B58();
      *(_WORD *)(v18 + 12) = 2080;
      sub_234671AC4(&qword_2687AABB0, MEMORY[0x263F07508]);
      uint64_t v19 = sub_234673C68();
      *(void *)(v0 + 24) = sub_23466A680(v19, v20, &v31);
      sub_234673B58();
      swift_bridgeObjectRelease();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v21(v13, v16);
      *(_WORD *)(v18 + 22) = 2048;
      id v22 = objc_msgSend(v17, sel_identifier);

      *(void *)(v0 + 32) = v22;
      sub_234673B58();

      _os_log_impl(&dword_234652000, log, type, "%s: no Message with recordUUID: %s or voicemailID: %lld", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v29, -1, -1);
      MEMORY[0x237DC48B0](v18, -1, -1);

      v21(v30, v16);
    }
    else
    {

      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v25(v13, v16);
      v25(v14, v16);
    }
    uint64_t v1 = 0;
    goto LABEL_13;
  }
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_2346711A0;
  return sub_234668ED8((int)v2);
}

uint64_t sub_2346711A0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  return MEMORY[0x270FA2498](sub_2346712C8, v4, v3);
}

uint64_t sub_2346712C8()
{
  uint64_t v30 = v0;
  uint64_t v1 = v0[16];
  swift_release();
  if (v1)
  {
    (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
    uint64_t v2 = v0[16];
  }
  else
  {
    if (qword_2687AAA50 != -1) {
      swift_once();
    }
    uint64_t v3 = (void *)v0[5];
    uint64_t v4 = v0[8];
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v8 = sub_234673858();
    __swift_project_value_buffer(v8, (uint64_t)qword_2687AAD00);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v5, v6);
    id v9 = v3;
    uint64_t v10 = sub_234673838();
    os_log_type_t v11 = sub_234673AA8();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = v0[8];
    uint64_t v14 = v0[9];
    uint64_t v16 = v0[6];
    uint64_t v15 = v0[7];
    uint64_t v17 = (void *)v0[5];
    if (v12)
    {
      log = v10;
      os_log_type_t type = v11;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315650;
      uint64_t v29 = v27;
      v0[2] = sub_23466A680(0xD000000000000013, 0x80000002346770A0, &v29);
      sub_234673B58();
      *(_WORD *)(v18 + 12) = 2080;
      sub_234671AC4(&qword_2687AABB0, MEMORY[0x263F07508]);
      uint64_t v19 = sub_234673C68();
      v0[3] = sub_23466A680(v19, v20, &v29);
      sub_234673B58();
      swift_bridgeObjectRelease();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v21(v13, v16);
      *(_WORD *)(v18 + 22) = 2048;
      id v22 = objc_msgSend(v17, sel_identifier);

      v0[4] = v22;
      sub_234673B58();

      _os_log_impl(&dword_234652000, log, type, "%s: no Message with recordUUID: %s or voicemailID: %lld", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x237DC48B0](v27, -1, -1);
      MEMORY[0x237DC48B0](v18, -1, -1);

      v21(v14, v16);
    }
    else
    {

      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v23(v13, v16);
      v23(v14, v16);
    }
    uint64_t v2 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
  return v24(v2);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_234671694(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2346620A8;
  return sub_23466FCE0(a1, v4, v5, v7, v6);
}

uint64_t sub_234671758@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*a1 + OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_allVoicemail);
  return swift_bridgeObjectRetain();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2346717B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_234671810()
{
  unint64_t result = qword_2687AAD98;
  if (!qword_2687AAD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2687AAD98);
  }
  return result;
}

uint64_t sub_234671864()
{
  uint64_t v1 = sub_2346735C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  unint64_t v8 = (v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8 + 8, v6);
}

uint64_t sub_23467196C()
{
  uint64_t v2 = *(void *)(sub_2346735C8() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (v5 + v3 + v4) & ~v3;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = *(void *)(v0 + ((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_2346620A8;
  v10[2] = v9;
  os_log_type_t v11 = (void *)swift_task_alloc();
  v10[3] = v11;
  *os_log_type_t v11 = v10;
  v11[1] = sub_23466D7D4;
  return sub_23466D94C(v7, v8);
}

uint64_t sub_234671AC4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234671B14()
{
  uint64_t result = sub_234673638();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_234671BF0()
{
  uint64_t v1 = v0 + qword_2687AB990;
  uint64_t v2 = sub_234673638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectUnownedDestroy();
  return v0;
}

uint64_t sub_234671CC4()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  sub_234673A38();
  sub_234673B48();
  uint64_t v2 = sub_2346738D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 104);
  sub_234673A38();
  uint64_t v4 = sub_2346738D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_234671DF8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2346738B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_234671EAC()
{
  return sub_234672194();
}

uint64_t sub_234671F68()
{
  uint64_t v0 = sub_234673858();
  __swift_allocate_value_buffer(v0, qword_2687AADD8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AADD8);
  if (qword_2687AAA78 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2687AB9E8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_234672030()
{
  return sub_23467253C((void (*)(void))sub_234671BF0);
}

uint64_t type metadata accessor for BaseVoicemailAccount()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_234672060()
{
  sub_234673A38();
  sub_234673B48();
  uint64_t result = sub_2346738D8();
  if (v1 <= 0x3F)
  {
    sub_234673A38();
    uint64_t result = sub_2346738D8();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

BOOL sub_234672164(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_234672170(uint64_t *a1, uint64_t *a2)
{
  return sub_234672164(*a1, *a2);
}

uint64_t sub_234672194()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_234673858();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2687AAA70 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_2687AADD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_retain_n();
  uint64_t v8 = sub_234673838();
  int v9 = sub_234673AC8();
  if (os_log_type_enabled(v8, (os_log_type_t)v9))
  {
    int v23 = v9;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v24 = (uint64_t)v1;
    uint64_t v11 = *(void *)(v2 + 80);
    type metadata accessor for BaseVoicemailManager();
    swift_retain();
    uint64_t v12 = sub_234673988();
    uint64_t v24 = sub_23466A680(v12, v13, &v26);
    sub_234673B58();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v24 = sub_23466A680(0x69616D6563696F76, 0xEA0000000000736CLL, &v26);
    sub_234673B58();
    *(_WORD *)(v10 + 22) = 2080;
    uint64_t v14 = sub_234671DF8();
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = MEMORY[0x237DC3C70](v14, v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v24 = v16;
    BOOL v25 = v15 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAC50);
    uint64_t v17 = sub_234673988();
    uint64_t v24 = sub_23466A680(v17, v18, &v26);
    sub_234673B58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_234652000, v8, (os_log_type_t)v23, "%s.%s: count: %s", (uint8_t *)v10, 0x20u);
    uint64_t v19 = v22;
    swift_arrayDestroy();
    MEMORY[0x237DC48B0](v19, -1, -1);
    MEMORY[0x237DC48B0](v10, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_234672524()
{
  return sub_23467253C((void (*)(void))sub_234671CC4);
}

uint64_t sub_23467253C(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x270FA0228](v1, v2, v3);
}

uint64_t type metadata accessor for BaseVoicemailManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2346725B0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BaseVoicemailManager();
  uint64_t result = sub_234673878();
  *a1 = result;
  return result;
}

uint64_t sub_2346725F4()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_234672608()
{
  return 16;
}

__n128 sub_234672614(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_234672654()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for Localization()
{
  return self;
}

uint64_t sub_2346726B8()
{
  uint64_t v0 = sub_234673858();
  __swift_allocate_value_buffer(v0, qword_2687AB9E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2687AB9E8);
  return sub_234673848();
}

uint64_t Log.error(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90280]);
}

uint64_t sub_23467274C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAEF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2346727B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAEF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23467281C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAEF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23467287C()
{
  unint64_t result = qword_2687AAEF8;
  if (!qword_2687AAEF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687AAEF8);
  }
  return result;
}

unint64_t sub_2346728BC()
{
  unint64_t result = qword_2687AAF10;
  if (!qword_2687AAF10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687AAF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687AAF10);
  }
  return result;
}

uint64_t sub_234672918(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t Log.warning(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90290]);
}

uint64_t Log.fault(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90288]);
}

uint64_t Log.info(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90270]);
}

uint64_t Log.default(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90290]);
}

uint64_t Log.debug(category:message:arg:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2346729A8(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90278]);
}

uint64_t sub_2346729A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void))
{
  a8();
  long long v20 = xmmword_234677570;
  sub_23467274C(a5, (uint64_t)v21);
  sub_23467274C((uint64_t)v21, (uint64_t)v19);
  sub_2346727B4((uint64_t)v19, (uint64_t)&v16);
  if (v17)
  {
    sub_234672918(&v16, (uint64_t)v18);
    sub_234672918(v18, (uint64_t)&v16);
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_234672C90(0, v10[2] + 1, 1, v10);
    }
    unint64_t v12 = v10[2];
    unint64_t v11 = v10[3];
    if (v12 >= v11 >> 1) {
      uint64_t v10 = sub_234672C90((void *)(v11 > 1), v12 + 1, 1, v10);
    }
    v10[2] = v12 + 1;
    sub_234672918(&v16, (uint64_t)&v10[5 * v12 + 4]);
  }
  else
  {
    sub_23467281C((uint64_t)&v16);
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAEF0);
  swift_arrayDestroy();
  sub_23467287C();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  sub_234673C68();
  unint64_t v13 = (void *)sub_234673B38();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAF00);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_234677570;
  *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAF08);
  *(void *)(v14 + 64) = sub_2346728BC();
  *(void *)(v14 + 32) = v10;
  swift_bridgeObjectRetain();
  sub_234673828();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t os_log_type_t.description.getter(unsigned __int8 a1)
{
  if (sub_234673AA8() == a1) {
    return 0x524F525245;
  }
  if (sub_234673AB8() == a1) {
    return 0x544C554146;
  }
  if (sub_234673A98() == a1) {
    return 1330007625;
  }
  return 0x4755424544;
}

uint64_t sub_234672C88()
{
  return os_log_type_t.description.getter(*v0);
}

void *sub_234672C90(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAF00);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_234672F04(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *initializeBufferWithCopyOfBuffer for Log(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Log()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Log(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for Log(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Log(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Log(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t sub_234672F04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAF18);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_234673C38();
  __break(1u);
  return result;
}

id sub_234673018()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84CE8]), sel_initWithStateSync_mailSync_delegate_delegateQueue_, 1, 0, 0, 0);
  qword_2687ABA00 = (uint64_t)result;
  return result;
}

id sub_23467305C()
{
  if (qword_2687AAA80 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2687ABA00;
  return v0;
}

void NPHSetTmpDirPrefix_cold_1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = "void NPHSetTmpDirPrefix(void)";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_234652000, a1, OS_LOG_TYPE_ERROR, "%s: failed, errno: %d", (uint8_t *)&v3, 0x12u);
}

uint64_t sub_2346734B8()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_2346734C8()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_2346734D8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2346734E8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2346734F8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_234673508()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_234673518()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_234673528()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_234673538()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_234673548()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_234673558()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_234673568()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_234673578()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_234673588()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_234673598()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2346735A8()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2346735B8()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2346735C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2346735D8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2346735E8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2346735F8()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_234673608()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_234673618()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_234673628()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_234673638()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_234673648()
{
  return MEMORY[0x270F9C898]();
}

uint64_t sub_234673658()
{
  return MEMORY[0x270F281F8]();
}

uint64_t sub_234673668()
{
  return MEMORY[0x270F28200]();
}

uint64_t _s20FaceTimeMessageStore0C0C12TelephonyRPCE2id10Foundation4UUIDVvg_0()
{
  return MEMORY[0x270F28208]();
}

uint64_t sub_234673688()
{
  return MEMORY[0x270F28210]();
}

uint64_t sub_234673698()
{
  return MEMORY[0x270F28218]();
}

uint64_t sub_2346736A8()
{
  return MEMORY[0x270F28220]();
}

uint64_t sub_2346736B8()
{
  return MEMORY[0x270F28228]();
}

uint64_t sub_2346736C8()
{
  return MEMORY[0x270F28230]();
}

uint64_t sub_2346736D8()
{
  return MEMORY[0x270F28238]();
}

uint64_t sub_2346736E8()
{
  return MEMORY[0x270F28240]();
}

uint64_t sub_2346736F8()
{
  return MEMORY[0x270F28248]();
}

uint64_t sub_234673708()
{
  return MEMORY[0x270F28250]();
}

uint64_t sub_234673718()
{
  return MEMORY[0x270F28258]();
}

uint64_t sub_234673728()
{
  return MEMORY[0x270F28260]();
}

uint64_t sub_234673738()
{
  return MEMORY[0x270F28268]();
}

uint64_t sub_234673748()
{
  return MEMORY[0x270F28270]();
}

uint64_t sub_2346737A8()
{
  return MEMORY[0x270F282A0]();
}

uint64_t sub_2346737B8()
{
  return MEMORY[0x270F282A8]();
}

uint64_t sub_2346737C8()
{
  return MEMORY[0x270F282B0]();
}

uint64_t sub_2346737D8()
{
  return MEMORY[0x270F282B8]();
}

uint64_t sub_2346737E8()
{
  return MEMORY[0x270F282C0]();
}

uint64_t sub_2346737F8()
{
  return MEMORY[0x270F282C8]();
}

uint64_t sub_234673808()
{
  return MEMORY[0x270F282D0]();
}

uint64_t sub_234673818()
{
  return MEMORY[0x270F282D8]();
}

uint64_t sub_234673828()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_234673838()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_234673848()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_234673858()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_234673868()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_234673878()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_234673888()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_234673898()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2346738A8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2346738B8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2346738C8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2346738D8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2346738E8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_2346738F8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_234673908()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_234673918()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_234673928()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_234673938()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_234673948()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_234673958()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_234673968()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_234673978()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_234673988()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_234673998()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2346739A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2346739B8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2346739C8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2346739D8()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2346739E8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2346739F8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_234673A08()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_234673A18()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_234673A28()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_234673A38()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_234673A48()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_234673A58()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_234673A68()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_234673A78()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_234673A88()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_234673A98()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_234673AA8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_234673AB8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_234673AC8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_234673AD8()
{
  return MEMORY[0x270EF1FA8]();
}

uint64_t sub_234673AE8()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_234673AF8()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_234673B08()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_234673B18()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_234673B38()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_234673B48()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_234673B58()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_234673B68()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_234673B78()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_234673B88()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_234673B98()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_234673BA8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_234673BB8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_234673BC8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_234673BD8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_234673BE8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_234673BF8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_234673C08()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_234673C18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_234673C28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_234673C38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_234673C58()
{
  return MEMORY[0x270F9F210]();
}

uint64_t sub_234673C68()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_234673C78()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_234673C88()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_234673C98()
{
  return MEMORY[0x270F9FC90]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
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

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionAddIdentifierException()
{
  return MEMORY[0x270EE8748]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x270F796D8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}