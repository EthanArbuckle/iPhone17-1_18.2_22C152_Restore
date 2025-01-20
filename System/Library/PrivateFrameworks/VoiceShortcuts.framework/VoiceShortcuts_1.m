id VCSYChangeClassFromMessageType(int a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  unsigned char v14[128];
  void v15[2];
  uint64_t vars8;

  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    v4 = v3;
    v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "messageType", (void)v10) == a1)
        {
          v8 = v7;
          goto LABEL_11;
        }
      }
      v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

uint64_t VCPBChangeTypeFromSYChangeType(uint64_t a1)
{
  if (a1 == 2) {
    unsigned int v1 = 2;
  }
  else {
    unsigned int v1 = 1;
  }
  if (a1 == 3) {
    return 3;
  }
  else {
    return v1;
  }
}

uint64_t VCPBWorkflowReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v19 = 96;
          goto LABEL_66;
        case 3u:
          *(unsigned char *)(a1 + 128) |= 0x10u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v23 = v22 + 4, v22 + 4 <= *(void *)(a2 + *v4)))
          {
            int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
          }
          else
          {
            int v24 = 0;
            *(unsigned char *)(a2 + *v5) = 1;
          }
          uint64_t v56 = 56;
          goto LABEL_84;
        case 4u:
          *(unsigned char *)(a1 + 128) |= 0x20u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v27 = v26 + 4, v26 + 4 <= *(void *)(a2 + *v4)))
          {
            int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
          }
          else
          {
            int v24 = 0;
            *(unsigned char *)(a2 + *v5) = 1;
          }
          uint64_t v56 = 60;
LABEL_84:
          *(_DWORD *)(a1 + v56) = v24;
          continue;
        case 5u:
          *(unsigned char *)(a1 + 128) |= 1u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v57 = 8;
          goto LABEL_89;
        case 6u:
          *(unsigned char *)(a1 + 128) |= 8u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v57 = 32;
LABEL_89:
          *(void *)(a1 + v57) = v30;
          continue;
        case 7u:
          v33 = PBReaderReadString();
          if (v33) {
            [(id)a1 addWorkflowTypes:v33];
          }
          goto LABEL_38;
        case 8u:
          v33 = PBReaderReadString();
          if (v33) {
            [(id)a1 addInputClasses:v33];
          }
LABEL_38:

          continue;
        case 9u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 48;
          goto LABEL_66;
        case 0xAu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 64;
          goto LABEL_66;
        case 0xBu:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 128) |= 4u;
          while (2)
          {
            uint64_t v37 = *v3;
            uint64_t v38 = *(void *)(a2 + v37);
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
              *(void *)(a2 + v37) = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                BOOL v15 = v35++ >= 9;
                if (v15)
                {
                  uint64_t v36 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v36 = 0;
          }
LABEL_70:
          uint64_t v55 = 24;
          goto LABEL_75;
        case 0xCu:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 128) |= 2u;
          while (2)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v45;
              v36 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                BOOL v15 = v42++ >= 9;
                if (v15)
                {
                  uint64_t v36 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v36 = 0;
          }
LABEL_74:
          uint64_t v55 = 16;
LABEL_75:
          *(void *)(a1 + v55) = v36;
          continue;
        case 0xDu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 88;
          goto LABEL_66;
        case 0xEu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 80;
          goto LABEL_66;
        case 0xFu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 40;
          goto LABEL_66;
        case 0x10u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *(unsigned char *)(a1 + 128) |= 0x40u;
          break;
        case 0x11u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 112;
LABEL_66:
          v54 = *(void **)(a1 + v19);
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
        uint64_t v50 = *v3;
        uint64_t v51 = *(void *)(a2 + v50);
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)(a2 + *v4)) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
        *(void *)(a2 + v50) = v52;
        v49 |= (unint64_t)(v53 & 0x7F) << v47;
        if ((v53 & 0x80) == 0) {
          goto LABEL_77;
        }
        v47 += 7;
        BOOL v15 = v48++ >= 9;
        if (v15)
        {
          LODWORD(v49) = 0;
          goto LABEL_79;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v49) = 0;
      }
LABEL_79:
      *(_DWORD *)(a1 + 104) = v49;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C7E5B998(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

id VCLatestUniqueChanges(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend(v1, "reverseObjectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v10 = [v9 objectIdentifier];
        char v11 = [v2 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          [v3 insertObject:v9 atIndex:0];
          uint64_t v12 = [v9 objectIdentifier];
          [v2 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

__CFString *VCDescriptionForChangeType(uint64_t a1)
{
  id v1 = @"Add";
  if (a1 == 2) {
    id v1 = @"Update";
  }
  if (a1 == 3) {
    return @"Delete";
  }
  else {
    return v1;
  }
}

id VCDescriptionForChange(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 changeType];
  uint64_t v6 = @"Add";
  if (v5 == 2) {
    uint64_t v6 = @"Update";
  }
  if (v5 == 3) {
    uint64_t v6 = @"Delete";
  }
  uint64_t v7 = v6;
  char v8 = [v2 objectIdentifier];
  unsigned int v9 = [v1 stringWithFormat:@"<%@: %p type=%@ identifier=%@>", v4, v2, v7, v8];

  return v9;
}

void sub_1C7E5C164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getWFRunQueueLogObject()
{
  if (getWFRunQueueLogObject_onceToken != -1) {
    dispatch_once(&getWFRunQueueLogObject_onceToken, &__block_literal_global_3065);
  }
  v0 = (void *)getWFRunQueueLogObject_log;
  return v0;
}

uint64_t __getWFRunQueueLogObject_block_invoke()
{
  getWFRunQueueLogObject_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4FB4D40], "RunQueue");
  return MEMORY[0x1F41817F8]();
}

void *__ActionKitLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/ActionKit.framework/ActionKit", 2);
  ActionKitLibrary_sLib = (uint64_t)result;
  return result;
}

id VCDaemonXPCInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2280E60];
  VCVoiceShortcutManagerConfigureXPCInterface();
  WFDatabaseProxyConfigureXPCInterface();
  return v0;
}

void sub_1C7E67424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3704(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3705(uint64_t a1)
{
}

void sub_1C7E678AC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t WFDatabaseChangesContainObjectType(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v26 = (id *)&a9;
  id v10 = a2;
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
    do
    {
      unint64_t v13 = (void *)MEMORY[0x1C87C4C10]();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            if ([*(id *)(*((void *)&v22 + 1) + 8 * v18) objectType] == a1)
            {

              uint64_t v20 = 1;
              goto LABEL_14;
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      uint64_t v19 = v26++;
      id v12 = *v19;
    }
    while (v12);
  }
  uint64_t v20 = 0;
LABEL_14:

  return v20;
}

id getWFSiriVocabLogObject()
{
  if (getWFSiriVocabLogObject_onceToken != -1) {
    dispatch_once(&getWFSiriVocabLogObject_onceToken, &__block_literal_global_3804);
  }
  v0 = (void *)getWFSiriVocabLogObject_log;
  return v0;
}

uint64_t __getWFSiriVocabLogObject_block_invoke()
{
  getWFSiriVocabLogObject_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4FB4D40], "SiriVocab");
  return MEMORY[0x1F41817F8]();
}

void sub_1C7E6965C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3925(uint64_t a1)
{
}

void sub_1C7E6A0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VCNotificationTitleForTriggerWithPendingCount(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v4 = [v3 localizedDescriptionWithConfigurationSummaryWithCount:a2];
  }
  else
  {
    uint64_t v4 = [v3 localizedDescriptionWithConfigurationSummary];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

BOOL VCLocaleIsRTL()
{
  v0 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v2 = [v1 localeIdentifier];
  BOOL v3 = [v0 characterDirectionForLanguage:v2] == 2;

  return v3;
}

id VCLocalSpotlightStateFileURL()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_realLibraryDirectoryURL");
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"Shortcuts/Spotlight.dat" isDirectory:0];

  return v1;
}

VCSpotlightState *VCGetLocalSpotlightState()
{
  v0 = [VCSpotlightState alloc];
  uint64_t v1 = VCLocalSpotlightStateFileURL();
  id v2 = [v1 path];
  BOOL v3 = [(VCSpotlightState *)v0 initWithPath:v2];

  if ([(VCSpotlightState *)v3 identifier]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

uint64_t VCAccessSyncServiceIntentDefinitionState(void *a1, void *a2, NSObject **a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __VCAccessSyncServiceIntentDefinitionState_block_invoke;
  v9[3] = &unk_1E6540D78;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = VCAccessSyncServiceState(a1, @"IntentDefinitions.plist", v9, a3);

  return v7;
}

BOOL __VCAccessSyncServiceIntentDefinitionState_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v13 = 0;
  uint64_t v4 = [MEMORY[0x1E4FB72B0] modelOfClass:objc_opt_class() fromJSONDictionary:v3 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "VCAccessSyncServiceIntentDefinitionState_block_invoke";
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s VCIntentDefinitionSyncDataHandler failed to deserialize sync state into dictionary: %{public}@", buf, 0x16u);
    }
  }
  if (!v4) {
    uint64_t v4 = objc_opt_new();
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v12 = 0;
    uint64_t v7 = [MEMORY[0x1E4FB72B0] JSONDictionaryFromModel:v4 error:&v12];
    id v8 = v12;
    BOOL v9 = v7 != 0;
    if (v7)
    {
      [v3 removeAllObjects];
      [v3 addEntriesFromDictionary:v7];
    }
    else
    {
      id v10 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "VCAccessSyncServiceIntentDefinitionState_block_invoke";
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s VCIntentDefinitionSyncDataHandler failed to serialize sync state into dictionary: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void sub_1C7E6C2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4151(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4152(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4935(uint64_t a1)
{
}

void sub_1C7E779C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5165(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5166(uint64_t a1)
{
}

void sub_1C7E782E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C7E789D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E78FC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id getMRMediaSuggestionRequestClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getMRMediaSuggestionRequestClass_softClass;
  uint64_t v7 = getMRMediaSuggestionRequestClass_softClass;
  if (!getMRMediaSuggestionRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMRMediaSuggestionRequestClass_block_invoke;
    v3[3] = &unk_1E6541E40;
    v3[4] = &v4;
    __getMRMediaSuggestionRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C7E790A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMRMediaSuggestionRequestOptionsClass_block_invoke(uint64_t a1)
{
  MediaRemoteLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MRMediaSuggestionRequestOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRMediaSuggestionRequestOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMRMediaSuggestionRequestOptionsClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"VCVoiceShortcutManagerAccessWrapper.m", 66, @"Unable to find class %s", "MRMediaSuggestionRequestOptions");

    __break(1u);
  }
}

void __getMRMediaSuggestionPreferencesClass_block_invoke(uint64_t a1)
{
  MediaRemoteLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MRMediaSuggestionPreferences");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRMediaSuggestionPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMRMediaSuggestionPreferencesClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"VCVoiceShortcutManagerAccessWrapper.m", 67, @"Unable to find class %s", "MRMediaSuggestionPreferences");

    __break(1u);
  }
}

void sub_1C7E795AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void *__getMRSuggestionContextHomeScreenSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MediaRemoteLibrary();
  uint64_t result = dlsym(v2, "MRSuggestionContextHomeScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMRSuggestionContextHomeScreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *MediaRemoteLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaRemoteLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E65412C0;
    uint64_t v6 = 0;
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)MediaRemoteLibraryCore_frameworkLibrary;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *MediaRemoteLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"VCVoiceShortcutManagerAccessWrapper.m", 64, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MediaRemoteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaRemoteLibraryCore_frameworkLibrary = result;
  return result;
}

void __getMRMediaSuggestionRequestClass_block_invoke(uint64_t a1)
{
  MediaRemoteLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MRMediaSuggestionRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMRMediaSuggestionRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMRMediaSuggestionRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"VCVoiceShortcutManagerAccessWrapper.m", 65, @"Unable to find class %s", "MRMediaSuggestionRequest");

    __break(1u);
  }
}

void sub_1C7E7A780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id VCWorkflowReferencesFromDescriptors(void *a1, void *a2)
{
  id v3 = a1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __VCWorkflowReferencesFromDescriptors_block_invoke;
  v7[3] = &unk_1E6541380;
  id v8 = v3;
  id v4 = v3;
  long long v5 = objc_msgSend(a2, "if_compactMap:", v7);

  return v5;
}

id __VCWorkflowReferencesFromDescriptors_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 objectType])
  {
    id v4 = 0;
  }
  else
  {
    long long v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 identifier];
    id v4 = [v5 referenceForWorkflowID:v6 includingTombstones:1];
  }
  return v4;
}

void VCVoiceShortcutFromWorkflow(void *a1, void *a2, int a3, char a4, void *a5)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a5;
  id v12 = (void (**)(void, void, void))v11;
  if (v9)
  {
    if (a3)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"workflowSubtitle", @"associatedAppBundleIdentifier", @"creationDate", @"modificationDate", 0);
    }
    id v52 = 0;
    uint64_t v14 = [v10 recordWithDescriptor:v9 properties:v13 error:&v52];
    id v15 = v52;
    if (v14)
    {
      id v41 = v10;
      uint64_t v16 = [v9 identifier];
      uint64_t v17 = [v14 name];
      if (objc_msgSend(v17, "wf_isEmpty"))
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4FB4C38];
        uint64_t v53 = *MEMORY[0x1E4F28588];
        v54[0] = @"Shortcut has no name";
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
        uint64_t v21 = v20 = v16;
        long long v22 = [v18 errorWithDomain:v19 code:1009 userInfo:v21];

        long long v23 = v20;
        ((void (**)(void, void, void *))v12)[2](v12, 0, v22);
      }
      else
      {
        id v38 = v15;
        long long v24 = [v14 workflowSubtitle];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __VCVoiceShortcutFromWorkflow_block_invoke;
        aBlock[3] = &unk_1E65413A8;
        char v40 = v16;
        id v46 = v16;
        uint64_t v37 = v17;
        id v47 = v17;
        id v39 = v24;
        id v48 = v39;
        id v25 = v14;
        id v49 = v25;
        id v26 = v9;
        id v50 = v26;
        unint64_t v27 = v12;
        id v51 = v27;
        uint64_t v28 = _Block_copy(aBlock);
        unint64_t v29 = (void (**)(void, void))v28;
        if (a3)
        {
          uint64_t v36 = v13;
          uint64_t v30 = [v26 associatedAppBundleIdentifier];
          uint64_t v31 = [v30 length];

          if (!v31 || (a4 & 1) != 0)
          {
            v33 = (void *)[objc_alloc(MEMORY[0x1E4F30678]) initWithWorkflowReference:v26 includeIcon:v31 == 0];
            [v33 _setLaunchId:*MEMORY[0x1E4FB4BB8]];
            if (v31) {
              [v33 setIconForAssociatedApplicationInWorkflow:v26];
            }
            char v34 = (void *)[objc_alloc(MEMORY[0x1E4F30738]) initWithIntent:v33];
            ((void (**)(void, void *))v29)[2](v29, v34);
          }
          else
          {
            unint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4FB7390]) initWithRecord:v25 reference:v26 storageProvider:0 error:0];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __VCVoiceShortcutFromWorkflow_block_invoke_2;
            v42[3] = &unk_1E65413D0;
            uint64_t v43 = v27;
            uint64_t v44 = v29;
            [v32 generateShortcutRepresentation:v42];
          }
          uint64_t v13 = v36;
        }
        else
        {
          (*((void (**)(void *, void))v28 + 2))(v28, 0);
        }
        unsigned int v35 = v29;
        uint64_t v17 = v37;
        id v15 = v38;

        long long v22 = v39;
        long long v23 = v40;
      }

      id v10 = v41;
    }
    else
    {
      ((void (**)(void, void, id))v12)[2](v12, 0, v15);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __VCVoiceShortcutFromWorkflow_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB4538];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v18 = [*(id *)(a1 + 56) associatedAppBundleIdentifier];
  uint64_t v8 = [v18 length];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 56) associatedAppBundleIdentifier];
  }
  else
  {
    id v9 = (void *)*MEMORY[0x1E4FB4BE8];
  }
  id v10 = [*(id *)(a1 + 56) creationDate];
  id v11 = [*(id *)(a1 + 56) modificationDate];
  id v12 = [*(id *)(a1 + 64) lastRunDate];
  uint64_t v13 = [*(id *)(a1 + 64) runEventsCount];
  id v19 = 0;
  uint64_t v14 = (void *)[v17 initWithIdentifier:v16 phrase:v6 shortcutName:v6 shortcutDescription:v7 associatedAppBundleIdentifier:v9 dateCreated:v10 dateLastModified:v11 lastRunDate:v12 runEventsCount:v13 shortcut:v4 keyImageData:0 error:&v19];

  id v15 = v19;
  if (v8) {

  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __VCVoiceShortcutFromWorkflow_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void VCVoiceShortcutsFromWorkflows(void *a1, void *a2, char a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __VCVoiceShortcutsFromWorkflows_block_invoke;
    v9[3] = &unk_1E6541420;
    id v10 = v7;
    char v11 = a3;
    objc_msgSend(a1, "if_mapAsynchronously:completionHandler:", v9, a4);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(a4 + 16))(a4, 0, 0);
  }
}

void __VCVoiceShortcutsFromWorkflows_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __VCVoiceShortcutsFromWorkflows_block_invoke_2;
  v9[3] = &unk_1E65413F8;
  id v10 = v6;
  id v8 = v6;
  VCVoiceShortcutFromWorkflow(a2, v7, a1, 0, v9);
}

uint64_t __VCVoiceShortcutsFromWorkflows_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id VCWorkflowReferencesForAccessSpecifier(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v6 allowUnrestrictedAccess])
  {
    id v7 = [v5 sortedVisibleWorkflowsByName];
  }
  else
  {
    id v8 = [v6 associatedAppBundleIdentifier];
    id v7 = [v5 sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:v8];
  }
  id v9 = [v7 descriptors];
  id v10 = [v7 fetchError];

  if (v10)
  {
    if (a3)
    {
      [v7 fetchError];
      id v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = v9;
  }

  return v11;
}

uint64_t WFWorkflowStatusXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F229C6E8];
}

uint64_t WFWorkflowStatusHostXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F227A430];
}

void sub_1C7E82224(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id getFCActivityManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getFCActivityManagerClass_softClass;
  uint64_t v7 = getFCActivityManagerClass_softClass;
  if (!getFCActivityManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFCActivityManagerClass_block_invoke;
    v3[3] = &unk_1E6541E40;
    v3[4] = &v4;
    __getFCActivityManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C7E83438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFCActivityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!FocusLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __FocusLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E6541988;
    uint64_t v8 = 0;
    FocusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FocusLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *FocusLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFContextualActionSpotlightSyncService.m", 39, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("FCActivityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getFCActivityManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFContextualActionSpotlightSyncService.m", 40, @"Unable to find class %s", "FCActivityManager");

LABEL_10:
    __break(1u);
  }
  getFCActivityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FocusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FocusLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __WFToggleContextualActions_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void sub_1C7E84084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_1C7E84A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_1C7E84BB0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1C7E85994(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_1C7E85A90(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E85B88(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E85C80(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E85D78(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E85E64(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E85F5C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E861C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1C7E86B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMTAlarmManagerClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MTAlarmManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMTAlarmManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMTAlarmManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFContextualActionSpotlightSyncService.m", 45, @"Unable to find class %s", "MTAlarmManager");

    __break(1u);
  }
}

void __getMTAlarmDataSourceClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MTAlarmDataSource");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMTAlarmDataSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMTAlarmDataSourceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFContextualActionSpotlightSyncService.m", 46, @"Unable to find class %s", "MTAlarmDataSource");

    __break(1u);
  }
}

void MobileTimerLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __MobileTimerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E65419A0;
    uint64_t v5 = 0;
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *MobileTimerLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFContextualActionSpotlightSyncService.m", 43, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MobileTimerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileTimerLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__6185(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6186(uint64_t a1)
{
}

void sub_1C7E87CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_destroyWeak(v17);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak((id *)(v18 - 56));
  _Unwind_Resume(a1);
}

void sub_1C7E88298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C7E88874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E8A548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6435(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6436(uint64_t a1)
{
}

void sub_1C7E8A710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E8AED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6550(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6551(uint64_t a1)
{
}

void sub_1C7E8B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C7E8BB2C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E8BD6C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1C7E8C2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__6702(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6703(uint64_t a1)
{
}

void sub_1C7E8D008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWFPhotoMediaContentItemClass_block_invoke(uint64_t a1)
{
  ContentKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WFPhotoMediaContentItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWFPhotoMediaContentItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWFPhotoMediaContentItemClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFOnScreenContentManager.m", 27, @"Unable to find class %s", "WFPhotoMediaContentItem");

    __break(1u);
  }
}

void __getWFCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContentKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WFCNContactStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWFCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWFCNContactStoreClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFOnScreenContentManager.m", 29, @"Unable to find class %s", "WFCNContactStore");

    __break(1u);
  }
}

id getWFContentItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getWFContentItemClass_softClass;
  uint64_t v7 = getWFContentItemClass_softClass;
  if (!getWFContentItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getWFContentItemClass_block_invoke;
    v3[3] = &unk_1E6541E40;
    v3[4] = &v4;
    __getWFContentItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C7E8D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWFContentItemClass_block_invoke(uint64_t a1)
{
  ContentKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WFContentItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWFContentItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWFContentItemClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFOnScreenContentManager.m", 26, @"Unable to find class %s", "WFContentItem");

    __break(1u);
  }
}

void ContentKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContentKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ContentKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6541E60;
    uint64_t v5 = 0;
    ContentKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContentKitLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *ContentKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFOnScreenContentManager.m", 22, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ContentKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContentKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1C7E8DE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6819(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6820(uint64_t a1)
{
}

uint64_t VCPBSpotlightBookmarkReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        long long v23 = objc_alloc_init(VCPBSpotlightPair);
        [a1 addPairs:v23];
        if (!PBReaderPlaceMark() || (VCPBSpotlightPairReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        a1[1] = v19;
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

void sub_1C7E92D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E93068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C7E939F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E93B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C7E95240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFTriggerEventInfoDictionaryConverter(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    char v17 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v16, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
    id v18 = 0;
    unint64_t v12 = [v17 unarchivedObjectOfClasses:v11 fromData:v1 error:&v18];
    id v13 = v18;

    if (!v12)
    {
      BOOL v14 = getWFTriggersLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "WFTriggerEventInfoDictionaryConverter";
        __int16 v21 = 2114;
        id v22 = v13;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_FAULT, "%s Conversion from data to NSDictionary failed with error: %{public}@", buf, 0x16u);
      }

      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

id WFSerializedTriggerEventInfo(void *a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:@"NewValue"];
  uint64_t v3 = (void *)v2;
  if (v2) {
    uint64_t v4 = (void *)v2;
  }
  else {
    uint64_t v4 = v1;
  }
  id v5 = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v1 objectForKey:@"NewValue"];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      uint64_t v10 = getWFTriggersLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = "WFSerializedTriggerEventInfo";
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to cast message or email eventInfo to NSArray", buf, 0xCu);
      }
      goto LABEL_15;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v19 = @"NewValue";
    v20[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v14 = 0;
    uint64_t v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
    uint64_t v10 = v14;

    if (v9) {
      goto LABEL_16;
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
    uint64_t v10 = v13;
    if (v9) {
      goto LABEL_16;
    }
  }
  uint64_t v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "WFSerializedTriggerEventInfo";
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Could not encode object with error: %{public}@", buf, 0x16u);
  }

LABEL_15:
  uint64_t v9 = 0;
LABEL_16:

  return v9;
}

uint64_t sub_1C7E97DA0()
{
  return MEMORY[0x1F40D45C0]();
}

uint64_t sub_1C7E97DB0()
{
  return MEMORY[0x1F40D4620]();
}

uint64_t sub_1C7E97DC0()
{
  return MEMORY[0x1F40E2E28]();
}

uint64_t sub_1C7E97DD0()
{
  return MEMORY[0x1F40E2E50]();
}

uint64_t sub_1C7E97DE0()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1C7E97DF0()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1C7E97E00()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1C7E97E10()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C7E97E20()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C7E97E30()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C7E97E40()
{
  return MEMORY[0x1F40E3540]();
}

uint64_t sub_1C7E97E50()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C7E97E60()
{
  return MEMORY[0x1F40E3560]();
}

uint64_t sub_1C7E97E70()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1C7E97E80()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1C7E97E90()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C7E97EA0()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1C7E97EB0()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1C7E97EC0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C7E97ED0()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1C7E97EE0()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1C7E97EF0()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1C7E97F00()
{
  return MEMORY[0x1F40E4138]();
}

uint64_t sub_1C7E97F50()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1C7E97F80()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1C7E97F90()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C7E97FA0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C7E97FB0()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1C7E97FC0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C7E97FD0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C7E97FE0()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1C7E97FF0()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1C7E98000()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C7E98010()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C7E98020()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C7E98030()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C7E98040()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C7E98050()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1C7E98060()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C7E98070()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t _s14VoiceShortcuts12ToprakEngineC9TaskTokenV2eeoiySbAEyxq_q0_q1__G_AGtFZ_0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1C7E98090()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C7E980A0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C7E980B0()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1C7E980C0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1C7E980D0()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1C7E980E0()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1C7E980F0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1C7E98100()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1C7E98110()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C7E98120()
{
  return MEMORY[0x1F4176CC8]();
}

uint64_t sub_1C7E98130()
{
  return MEMORY[0x1F4176CD0]();
}

uint64_t sub_1C7E98140()
{
  return MEMORY[0x1F4176CD8]();
}

uint64_t sub_1C7E98150()
{
  return MEMORY[0x1F4176CE0]();
}

uint64_t sub_1C7E98160()
{
  return MEMORY[0x1F4176CE8]();
}

uint64_t sub_1C7E98170()
{
  return MEMORY[0x1F4176CF0]();
}

uint64_t sub_1C7E98180()
{
  return MEMORY[0x1F4176CF8]();
}

uint64_t sub_1C7E98190()
{
  return MEMORY[0x1F4176D00]();
}

uint64_t sub_1C7E981A0()
{
  return MEMORY[0x1F4176D08]();
}

uint64_t sub_1C7E981B0()
{
  return MEMORY[0x1F4176D10]();
}

uint64_t sub_1C7E981C0()
{
  return MEMORY[0x1F4176D18]();
}

uint64_t sub_1C7E981D0()
{
  return MEMORY[0x1F4176D20]();
}

uint64_t sub_1C7E981E0()
{
  return MEMORY[0x1F411A7E0]();
}

uint64_t sub_1C7E981F0()
{
  return MEMORY[0x1F411A808]();
}

uint64_t sub_1C7E98200()
{
  return MEMORY[0x1F411A888]();
}

uint64_t sub_1C7E98210()
{
  return MEMORY[0x1F411A898]();
}

uint64_t sub_1C7E98220()
{
  return MEMORY[0x1F411A968]();
}

uint64_t sub_1C7E98230()
{
  return MEMORY[0x1F411A998]();
}

uint64_t sub_1C7E98240()
{
  return MEMORY[0x1F411AA28]();
}

uint64_t sub_1C7E98250()
{
  return MEMORY[0x1F411AA78]();
}

uint64_t sub_1C7E98260()
{
  return MEMORY[0x1F411AA80]();
}

uint64_t sub_1C7E98270()
{
  return MEMORY[0x1F411AAB8]();
}

uint64_t sub_1C7E98280()
{
  return MEMORY[0x1F411AB98]();
}

uint64_t sub_1C7E98290()
{
  return MEMORY[0x1F411ABD0]();
}

uint64_t sub_1C7E982A0()
{
  return MEMORY[0x1F411ABD8]();
}

uint64_t sub_1C7E982B0()
{
  return MEMORY[0x1F411ABE0]();
}

uint64_t sub_1C7E982C0()
{
  return MEMORY[0x1F411ABE8]();
}

uint64_t sub_1C7E982D0()
{
  return MEMORY[0x1F411ABF0]();
}

uint64_t sub_1C7E982F0()
{
  return MEMORY[0x1F411AC18]();
}

uint64_t sub_1C7E98300()
{
  return MEMORY[0x1F411AC20]();
}

uint64_t sub_1C7E98310()
{
  return MEMORY[0x1F411AC28]();
}

uint64_t sub_1C7E98320()
{
  return MEMORY[0x1F411AC30]();
}

uint64_t sub_1C7E98340()
{
  return MEMORY[0x1F411ACC0]();
}

uint64_t sub_1C7E98350()
{
  return MEMORY[0x1F411ACC8]();
}

uint64_t sub_1C7E98360()
{
  return MEMORY[0x1F411AD20]();
}

uint64_t sub_1C7E98370()
{
  return MEMORY[0x1F411AD58]();
}

uint64_t sub_1C7E98380()
{
  return MEMORY[0x1F411AD68]();
}

uint64_t sub_1C7E98390()
{
  return MEMORY[0x1F411AD70]();
}

uint64_t sub_1C7E983A0()
{
  return MEMORY[0x1F411AD78]();
}

uint64_t sub_1C7E983B0()
{
  return MEMORY[0x1F411AD80]();
}

uint64_t sub_1C7E983C0()
{
  return MEMORY[0x1F411AE10]();
}

uint64_t sub_1C7E983D0()
{
  return MEMORY[0x1F411AE18]();
}

uint64_t sub_1C7E983E0()
{
  return MEMORY[0x1F411AE20]();
}

uint64_t sub_1C7E983F0()
{
  return MEMORY[0x1F411B048]();
}

uint64_t sub_1C7E98400()
{
  return MEMORY[0x1F411B058]();
}

uint64_t sub_1C7E98410()
{
  return MEMORY[0x1F411B060]();
}

uint64_t sub_1C7E98420()
{
  return MEMORY[0x1F411B070]();
}

uint64_t sub_1C7E98430()
{
  return MEMORY[0x1F411B280]();
}

uint64_t sub_1C7E98440()
{
  return MEMORY[0x1F411B290]();
}

uint64_t sub_1C7E98450()
{
  return MEMORY[0x1F411B2C8]();
}

uint64_t sub_1C7E98460()
{
  return MEMORY[0x1F411B368]();
}

uint64_t sub_1C7E98470()
{
  return MEMORY[0x1F411B3B0]();
}

uint64_t sub_1C7E98480()
{
  return MEMORY[0x1F4167D30]();
}

uint64_t sub_1C7E98490()
{
  return MEMORY[0x1F4167D38]();
}

uint64_t sub_1C7E984A0()
{
  return MEMORY[0x1F4167D40]();
}

uint64_t sub_1C7E984B0()
{
  return MEMORY[0x1F4167D48]();
}

uint64_t sub_1C7E984C0()
{
  return MEMORY[0x1F4167D50]();
}

uint64_t sub_1C7E984D0()
{
  return MEMORY[0x1F4167D58]();
}

uint64_t sub_1C7E984E0()
{
  return MEMORY[0x1F4167D60]();
}

uint64_t sub_1C7E984F0()
{
  return MEMORY[0x1F4167D68]();
}

uint64_t sub_1C7E98500()
{
  return MEMORY[0x1F4167D78]();
}

uint64_t sub_1C7E98510()
{
  return MEMORY[0x1F4167D80]();
}

uint64_t sub_1C7E98520()
{
  return MEMORY[0x1F4167D88]();
}

uint64_t sub_1C7E98530()
{
  return MEMORY[0x1F4167D90]();
}

uint64_t sub_1C7E98540()
{
  return MEMORY[0x1F4167D98]();
}

uint64_t sub_1C7E98550()
{
  return MEMORY[0x1F4167DA0]();
}

uint64_t sub_1C7E98560()
{
  return MEMORY[0x1F4167DA8]();
}

uint64_t sub_1C7E98570()
{
  return MEMORY[0x1F4167DB0]();
}

uint64_t sub_1C7E98580()
{
  return MEMORY[0x1F4167DB8]();
}

uint64_t sub_1C7E98590()
{
  return MEMORY[0x1F4167DC0]();
}

uint64_t sub_1C7E985A0()
{
  return MEMORY[0x1F4167DC8]();
}

uint64_t sub_1C7E985B0()
{
  return MEMORY[0x1F4167DD0]();
}

uint64_t sub_1C7E985C0()
{
  return MEMORY[0x1F4167DD8]();
}

uint64_t sub_1C7E985D0()
{
  return MEMORY[0x1F4167DE0]();
}

uint64_t sub_1C7E985E0()
{
  return MEMORY[0x1F4167DE8]();
}

uint64_t sub_1C7E985F0()
{
  return MEMORY[0x1F4167DF0]();
}

uint64_t sub_1C7E98600()
{
  return MEMORY[0x1F4167DF8]();
}

uint64_t sub_1C7E98610()
{
  return MEMORY[0x1F4167E00]();
}

uint64_t sub_1C7E98620()
{
  return MEMORY[0x1F4167E08]();
}

uint64_t sub_1C7E98630()
{
  return MEMORY[0x1F4167E10]();
}

uint64_t sub_1C7E98640()
{
  return MEMORY[0x1F4167E18]();
}

uint64_t sub_1C7E98650()
{
  return MEMORY[0x1F4167E20]();
}

uint64_t sub_1C7E98660()
{
  return MEMORY[0x1F4167E28]();
}

uint64_t sub_1C7E98670()
{
  return MEMORY[0x1F4167E30]();
}

uint64_t sub_1C7E98680()
{
  return MEMORY[0x1F4167E40]();
}

uint64_t sub_1C7E98690()
{
  return MEMORY[0x1F4167E48]();
}

uint64_t sub_1C7E986A0()
{
  return MEMORY[0x1F4167E50]();
}

uint64_t sub_1C7E986B0()
{
  return MEMORY[0x1F4167E58]();
}

uint64_t sub_1C7E986C0()
{
  return MEMORY[0x1F4167E60]();
}

uint64_t sub_1C7E986D0()
{
  return MEMORY[0x1F4167E68]();
}

uint64_t sub_1C7E986E0()
{
  return MEMORY[0x1F4167E70]();
}

uint64_t sub_1C7E986F0()
{
  return MEMORY[0x1F4167E78]();
}

uint64_t sub_1C7E98700()
{
  return MEMORY[0x1F4167E80]();
}

uint64_t sub_1C7E98710()
{
  return MEMORY[0x1F4167E88]();
}

uint64_t sub_1C7E98720()
{
  return MEMORY[0x1F4167E90]();
}

uint64_t sub_1C7E98730()
{
  return MEMORY[0x1F4167E98]();
}

uint64_t sub_1C7E98740()
{
  return MEMORY[0x1F4167EA0]();
}

uint64_t sub_1C7E98750()
{
  return MEMORY[0x1F4167EA8]();
}

uint64_t sub_1C7E98760()
{
  return MEMORY[0x1F4167EB0]();
}

uint64_t sub_1C7E98770()
{
  return MEMORY[0x1F4167EB8]();
}

uint64_t sub_1C7E98780()
{
  return MEMORY[0x1F4167EC8]();
}

uint64_t sub_1C7E98790()
{
  return MEMORY[0x1F4167ED0]();
}

uint64_t sub_1C7E987A0()
{
  return MEMORY[0x1F4167ED8]();
}

uint64_t sub_1C7E987B0()
{
  return MEMORY[0x1F4167EE0]();
}

uint64_t sub_1C7E987C0()
{
  return MEMORY[0x1F4167EF0]();
}

uint64_t sub_1C7E987D0()
{
  return MEMORY[0x1F4167F10]();
}

uint64_t sub_1C7E987E0()
{
  return MEMORY[0x1F4167F18]();
}

uint64_t sub_1C7E987F0()
{
  return MEMORY[0x1F4167F20]();
}

uint64_t sub_1C7E98800()
{
  return MEMORY[0x1F4167F28]();
}

uint64_t sub_1C7E98810()
{
  return MEMORY[0x1F4167F30]();
}

uint64_t sub_1C7E98820()
{
  return MEMORY[0x1F4167F38]();
}

uint64_t sub_1C7E98830()
{
  return MEMORY[0x1F4167F40]();
}

uint64_t sub_1C7E98840()
{
  return MEMORY[0x1F4167F48]();
}

uint64_t sub_1C7E98850()
{
  return MEMORY[0x1F4167F50]();
}

uint64_t sub_1C7E98860()
{
  return MEMORY[0x1F4167F58]();
}

uint64_t sub_1C7E98870()
{
  return MEMORY[0x1F4167F80]();
}

uint64_t sub_1C7E98880()
{
  return MEMORY[0x1F4167F88]();
}

uint64_t sub_1C7E98890()
{
  return MEMORY[0x1F4167F90]();
}

uint64_t sub_1C7E988A0()
{
  return MEMORY[0x1F4167F98]();
}

uint64_t sub_1C7E988B0()
{
  return MEMORY[0x1F4167FA0]();
}

uint64_t sub_1C7E988C0()
{
  return MEMORY[0x1F4167FA8]();
}

uint64_t sub_1C7E988D0()
{
  return MEMORY[0x1F4167FB0]();
}

uint64_t sub_1C7E988E0()
{
  return MEMORY[0x1F4127110]();
}

uint64_t sub_1C7E988F0()
{
  return MEMORY[0x1F4127118]();
}

uint64_t sub_1C7E98900()
{
  return MEMORY[0x1F4127340]();
}

uint64_t sub_1C7E98910()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C7E98920()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C7E98930()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C7E98940()
{
  return MEMORY[0x1F4187B38]();
}

uint64_t sub_1C7E98950()
{
  return MEMORY[0x1F4187B40]();
}

uint64_t sub_1C7E98960()
{
  return MEMORY[0x1F4187B48]();
}

uint64_t sub_1C7E98970()
{
  return MEMORY[0x1F4187B60]();
}

uint64_t sub_1C7E98980()
{
  return MEMORY[0x1F4187B68]();
}

uint64_t sub_1C7E98990()
{
  return MEMORY[0x1F4187B70]();
}

uint64_t sub_1C7E989A0()
{
  return MEMORY[0x1F4187BC0]();
}

uint64_t sub_1C7E989B0()
{
  return MEMORY[0x1F4187BC8]();
}

uint64_t sub_1C7E989C0()
{
  return MEMORY[0x1F4187BD0]();
}

uint64_t sub_1C7E989D0()
{
  return MEMORY[0x1F4187BE0]();
}

uint64_t sub_1C7E989E0()
{
  return MEMORY[0x1F40D66E8]();
}

uint64_t sub_1C7E989F0()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1C7E98A00()
{
  return MEMORY[0x1F40D67B8]();
}

uint64_t sub_1C7E98A10()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1C7E98A20()
{
  return MEMORY[0x1F40D69B0]();
}

uint64_t sub_1C7E98A30()
{
  return MEMORY[0x1F40D69D8]();
}

uint64_t sub_1C7E98A40()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1C7E98A50()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t sub_1C7E98A60()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1C7E98A70()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1C7E98A80()
{
  return MEMORY[0x1F40D6AA8]();
}

uint64_t sub_1C7E98A90()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1C7E98AA0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C7E98AB0()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1C7E98AC0()
{
  return MEMORY[0x1F40D6D08]();
}

uint64_t sub_1C7E98AD0()
{
  return MEMORY[0x1F4164488]();
}

uint64_t sub_1C7E98AE0()
{
  return MEMORY[0x1F4164490]();
}

uint64_t sub_1C7E98AF0()
{
  return MEMORY[0x1F41644A0]();
}

uint64_t sub_1C7E98B00()
{
  return MEMORY[0x1F41644B8]();
}

uint64_t sub_1C7E98B10()
{
  return MEMORY[0x1F41644D8]();
}

uint64_t sub_1C7E98B20()
{
  return MEMORY[0x1F41644E8]();
}

uint64_t sub_1C7E98B30()
{
  return MEMORY[0x1F41644F8]();
}

uint64_t sub_1C7E98B40()
{
  return MEMORY[0x1F4164510]();
}

uint64_t sub_1C7E98B50()
{
  return MEMORY[0x1F4164520]();
}

uint64_t sub_1C7E98B60()
{
  return MEMORY[0x1F41645D8]();
}

uint64_t sub_1C7E98B70()
{
  return MEMORY[0x1F41645F8]();
}

uint64_t sub_1C7E98B80()
{
  return MEMORY[0x1F4164600]();
}

uint64_t sub_1C7E98B90()
{
  return MEMORY[0x1F4164608]();
}

uint64_t sub_1C7E98BA0()
{
  return MEMORY[0x1F4164610]();
}

uint64_t sub_1C7E98BB0()
{
  return MEMORY[0x1F41646B0]();
}

uint64_t sub_1C7E98BC0()
{
  return MEMORY[0x1F4164750]();
}

uint64_t sub_1C7E98BD0()
{
  return MEMORY[0x1F4164758]();
}

uint64_t sub_1C7E98BE0()
{
  return MEMORY[0x1F4164760]();
}

uint64_t sub_1C7E98BF0()
{
  return MEMORY[0x1F4164768]();
}

uint64_t sub_1C7E98C10()
{
  return MEMORY[0x1F4164778]();
}

uint64_t sub_1C7E98C20()
{
  return MEMORY[0x1F4164780]();
}

uint64_t sub_1C7E98C40()
{
  return MEMORY[0x1F4164790]();
}

uint64_t sub_1C7E98C50()
{
  return MEMORY[0x1F4164798]();
}

uint64_t sub_1C7E98C60()
{
  return MEMORY[0x1F41647A0]();
}

uint64_t sub_1C7E98C70()
{
  return MEMORY[0x1F41647A8]();
}

uint64_t sub_1C7E98C90()
{
  return MEMORY[0x1F41647C8]();
}

uint64_t sub_1C7E98CA0()
{
  return MEMORY[0x1F41647D8]();
}

uint64_t sub_1C7E98CB0()
{
  return MEMORY[0x1F41647E8]();
}

uint64_t sub_1C7E98CC0()
{
  return MEMORY[0x1F41647F0]();
}

uint64_t sub_1C7E98CD0()
{
  return MEMORY[0x1F4164800]();
}

uint64_t sub_1C7E98CE0()
{
  return MEMORY[0x1F4164808]();
}

uint64_t sub_1C7E98CF0()
{
  return MEMORY[0x1F4164810]();
}

uint64_t sub_1C7E98D00()
{
  return MEMORY[0x1F4164818]();
}

uint64_t sub_1C7E98D10()
{
  return MEMORY[0x1F4164820]();
}

uint64_t sub_1C7E98D20()
{
  return MEMORY[0x1F4164828]();
}

uint64_t sub_1C7E98D30()
{
  return MEMORY[0x1F4164830]();
}

uint64_t sub_1C7E98D40()
{
  return MEMORY[0x1F4164838]();
}

uint64_t sub_1C7E98D50()
{
  return MEMORY[0x1F4164840]();
}

uint64_t sub_1C7E98D60()
{
  return MEMORY[0x1F4164848]();
}

uint64_t sub_1C7E98D70()
{
  return MEMORY[0x1F4164850]();
}

uint64_t sub_1C7E98D80()
{
  return MEMORY[0x1F4164858]();
}

uint64_t sub_1C7E98D90()
{
  return MEMORY[0x1F4164870]();
}

uint64_t sub_1C7E98DA0()
{
  return MEMORY[0x1F4164878]();
}

uint64_t sub_1C7E98DC0()
{
  return MEMORY[0x1F4164888]();
}

uint64_t sub_1C7E98DD0()
{
  return MEMORY[0x1F4164890]();
}

uint64_t sub_1C7E98DE0()
{
  return MEMORY[0x1F4164898]();
}

uint64_t sub_1C7E98DF0()
{
  return MEMORY[0x1F41648A0]();
}

uint64_t sub_1C7E98E00()
{
  return MEMORY[0x1F41648A8]();
}

uint64_t sub_1C7E98E10()
{
  return MEMORY[0x1F41648B0]();
}

uint64_t sub_1C7E98E20()
{
  return MEMORY[0x1F41648B8]();
}

uint64_t sub_1C7E98E30()
{
  return MEMORY[0x1F41648C0]();
}

uint64_t sub_1C7E98E40()
{
  return MEMORY[0x1F41648C8]();
}

uint64_t sub_1C7E98E50()
{
  return MEMORY[0x1F41648D0]();
}

uint64_t sub_1C7E98E60()
{
  return MEMORY[0x1F41648D8]();
}

uint64_t sub_1C7E98E70()
{
  return MEMORY[0x1F41648E0]();
}

uint64_t sub_1C7E98E80()
{
  return MEMORY[0x1F4164AD0]();
}

uint64_t sub_1C7E98E90()
{
  return MEMORY[0x1F4164AD8]();
}

uint64_t sub_1C7E98EA0()
{
  return MEMORY[0x1F4164AE0]();
}

uint64_t sub_1C7E98EB0()
{
  return MEMORY[0x1F4164AE8]();
}

uint64_t sub_1C7E98EC0()
{
  return MEMORY[0x1F4164AF0]();
}

uint64_t sub_1C7E98ED0()
{
  return MEMORY[0x1F4164AF8]();
}

uint64_t sub_1C7E98EE0()
{
  return MEMORY[0x1F4164B00]();
}

uint64_t sub_1C7E98EF0()
{
  return MEMORY[0x1F4164B10]();
}

uint64_t sub_1C7E98F00()
{
  return MEMORY[0x1F4164B18]();
}

uint64_t sub_1C7E98F10()
{
  return MEMORY[0x1F4164B30]();
}

uint64_t sub_1C7E98F20()
{
  return MEMORY[0x1F4164B38]();
}

uint64_t sub_1C7E98F30()
{
  return MEMORY[0x1F4164B40]();
}

uint64_t sub_1C7E98F40()
{
  return MEMORY[0x1F4164B48]();
}

uint64_t sub_1C7E98F50()
{
  return MEMORY[0x1F4164B50]();
}

uint64_t sub_1C7E98F60()
{
  return MEMORY[0x1F4164B98]();
}

uint64_t sub_1C7E98F70()
{
  return MEMORY[0x1F4164C40]();
}

uint64_t sub_1C7E98F80()
{
  return MEMORY[0x1F4164CD0]();
}

uint64_t sub_1C7E98F90()
{
  return MEMORY[0x1F4164CD8]();
}

uint64_t sub_1C7E98FA0()
{
  return MEMORY[0x1F4164CE8]();
}

uint64_t sub_1C7E98FB0()
{
  return MEMORY[0x1F4164CF0]();
}

uint64_t sub_1C7E98FC0()
{
  return MEMORY[0x1F4164CF8]();
}

uint64_t sub_1C7E98FD0()
{
  return MEMORY[0x1F4164D10]();
}

uint64_t sub_1C7E98FE0()
{
  return MEMORY[0x1F4164D48]();
}

uint64_t sub_1C7E98FF0()
{
  return MEMORY[0x1F4164D50]();
}

uint64_t sub_1C7E99000()
{
  return MEMORY[0x1F4164D60]();
}

uint64_t sub_1C7E99010()
{
  return MEMORY[0x1F4164D68]();
}

uint64_t sub_1C7E99020()
{
  return MEMORY[0x1F4164D78]();
}

uint64_t sub_1C7E99040()
{
  return MEMORY[0x1F4164DD8]();
}

uint64_t sub_1C7E99050()
{
  return MEMORY[0x1F4164E18]();
}

uint64_t sub_1C7E99060()
{
  return MEMORY[0x1F4164E20]();
}

uint64_t sub_1C7E99070()
{
  return MEMORY[0x1F4164E30]();
}

uint64_t sub_1C7E99080()
{
  return MEMORY[0x1F4164E38]();
}

uint64_t sub_1C7E99090()
{
  return MEMORY[0x1F4164E40]();
}

uint64_t sub_1C7E990A0()
{
  return MEMORY[0x1F4164E50]();
}

uint64_t sub_1C7E990B0()
{
  return MEMORY[0x1F4164E58]();
}

uint64_t sub_1C7E990C0()
{
  return MEMORY[0x1F4164E60]();
}

uint64_t sub_1C7E990D0()
{
  return MEMORY[0x1F4164E68]();
}

uint64_t sub_1C7E990E0()
{
  return MEMORY[0x1F4164E70]();
}

uint64_t sub_1C7E990F0()
{
  return MEMORY[0x1F4164EA0]();
}

uint64_t sub_1C7E99100()
{
  return MEMORY[0x1F4164EB8]();
}

uint64_t sub_1C7E99110()
{
  return MEMORY[0x1F4164EC0]();
}

uint64_t sub_1C7E99120()
{
  return MEMORY[0x1F4164EF0]();
}

uint64_t sub_1C7E99130()
{
  return MEMORY[0x1F4164F00]();
}

uint64_t sub_1C7E99140()
{
  return MEMORY[0x1F4164F08]();
}

uint64_t sub_1C7E99150()
{
  return MEMORY[0x1F4164F18]();
}

uint64_t sub_1C7E99160()
{
  return MEMORY[0x1F4164F20]();
}

uint64_t sub_1C7E99170()
{
  return MEMORY[0x1F4164F28]();
}

uint64_t sub_1C7E99180()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C7E99190()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C7E991A0()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C7E991B0()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1C7E991C0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C7E991D0()
{
  return MEMORY[0x1F4104390]();
}

uint64_t sub_1C7E991E0()
{
  return MEMORY[0x1F41043B0]();
}

uint64_t sub_1C7E991F0()
{
  return MEMORY[0x1F41043C8]();
}

uint64_t sub_1C7E99200()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1C7E99210()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C7E99220()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C7E99230()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C7E99240()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C7E99250()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1C7E99260()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1C7E99270()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C7E99280()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C7E99290()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C7E992A0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C7E992B0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C7E992C0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C7E992D0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C7E992E0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C7E992F0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1C7E99300()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C7E99310()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C7E99320()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C7E99330()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C7E99340()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1C7E99350()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C7E99360()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C7E99370()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C7E99380()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1C7E99390()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C7E993A0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C7E993B0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C7E993C0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C7E993D0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C7E993E0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C7E993F0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1C7E99400()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C7E99410()
{
  return MEMORY[0x1F4167FB8]();
}

uint64_t sub_1C7E99420()
{
  return MEMORY[0x1F4167FC0]();
}

uint64_t sub_1C7E99430()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C7E99440()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C7E99450()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C7E99460()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1C7E99470()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C7E99480()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C7E99490()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C7E994A0()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1C7E994D0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C7E994E0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C7E994F0()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_1C7E99500()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C7E99510()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1C7E99520()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1C7E99530()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C7E99550()
{
  return MEMORY[0x1F4187D70]();
}

uint64_t sub_1C7E99560()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1C7E99580()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1C7E995A0()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1C7E995B0()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1C7E995D0()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1C7E995F0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C7E99600()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C7E99610()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C7E99620()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C7E99630()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C7E99640()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C7E99650()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C7E99660()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C7E99670()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1C7E99680()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1C7E99690()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C7E996A0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C7E996B0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C7E996C0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C7E996D0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C7E996E0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C7E996F0()
{
  return MEMORY[0x1F40D61D8]();
}

uint64_t sub_1C7E99700()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1C7E99710()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C7E99720()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C7E99730()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C7E99740()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C7E99750()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C7E99760()
{
  return MEMORY[0x1F4164FB0]();
}

uint64_t sub_1C7E99770()
{
  return MEMORY[0x1F4167FD8]();
}

uint64_t sub_1C7E99780()
{
  return MEMORY[0x1F40D4A90]();
}

uint64_t sub_1C7E99790()
{
  return MEMORY[0x1F40D4A98]();
}

uint64_t sub_1C7E997A0()
{
  return MEMORY[0x1F40D6228]();
}

uint64_t sub_1C7E997B0()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1C7E997C0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C7E997D0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C7E997E0()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1C7E997F0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C7E99800()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C7E99820()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C7E99830()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C7E99840()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C7E99850()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1C7E99860()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1C7E99880()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C7E99890()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C7E998A0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C7E998B0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C7E998C0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C7E998D0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C7E998E0()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1C7E998F0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C7E99900()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C7E99910()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C7E99920()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C7E99930()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C7E99940()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C7E99950()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C7E99960()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C7E99970()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C7E99980()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_1C7E99990()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C7E999A0()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C7E999B0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C7E999C0()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1C7E999D0()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1C7E999E0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C7E999F0()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C7E99A00()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C7E99A10()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C7E99A20()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C7E99A30()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C7E99A40()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C7E99A50()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C7E99A60()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1C7E99A70()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1C7E99A80()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1C7E99A90()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1C7E99AA0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C7E99AB0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C7E99AC0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C7E99AD0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C7E99AE0()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1C7E99AF0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C7E99B00()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C7E99B10()
{
  return MEMORY[0x1F4188038]();
}

uint64_t sub_1C7E99B30()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C7E99B50()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C7E99B60()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C7E99B70()
{
  return MEMORY[0x1F4185540]();
}

uint64_t sub_1C7E99B80()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C7E99B90()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C7E99BA0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C7E99BB0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1C7E99BC0()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C7E99BD0()
{
  return MEMORY[0x1F4185668]();
}

uint64_t sub_1C7E99BE0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C7E99BF0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C7E99C00()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1C7E99C20()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C7E99C40()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1C7E99C50()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1C7E99C60()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C7E99C70()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1C7E99C80()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C7E99C90()
{
  return MEMORY[0x1F4185BA0]();
}

uint64_t sub_1C7E99CB0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1C7E99CC0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C7E99CD0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C7E99D00()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C7E99D10()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C7E99D20()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C7E99D30()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C7E99D40()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C7E99D50()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C7E99D60()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C7E99D70()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C7E99D80()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C7E99D90()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C7E99DC0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1F40D6288]();
}

uint64_t CKErrorIsCode()
{
  return MEMORY[0x1F40D6330]();
}

uint64_t CKStringFromWalrusStatus()
{
  return MEMORY[0x1F40D64C0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t FPDocumentURLFromBookmarkableString()
{
  return MEMORY[0x1F40E0A78]();
}

uint64_t FPItemURLForCrossDeviceItemID()
{
  return MEMORY[0x1F40E0B50]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1F4122C08]();
}

uint64_t INIntentDefinitionLocalizableFileURLsForBundleRecord()
{
  return MEMORY[0x1F40E9AD8]();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return MEMORY[0x1F40E9B58]();
}

uint64_t INRemoveItemAtPath()
{
  return MEMORY[0x1F40E9B68]();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x1F40ED008]();
}

uint64_t MobileInstallationGetSystemAppMigrationStatus()
{
  return MEMORY[0x1F412F8F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x1F41471C8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t VCDeviceHasBeenUnlocked()
{
  return MEMORY[0x1F4167FE0]();
}

uint64_t VCInactiveAppsFromList()
{
  return MEMORY[0x1F4167FE8]();
}

uint64_t VCIsInternalBuild()
{
  return MEMORY[0x1F4167FF8]();
}

uint64_t VCVoiceShortcutManagerConfigureXPCInterface()
{
  return MEMORY[0x1F4168008]();
}

uint64_t WFAllWalletTransactionMerchantTypes()
{
  return MEMORY[0x1F4112E28]();
}

uint64_t WFAssetsDirectory()
{
  return MEMORY[0x1F4176D28]();
}

uint64_t WFBundledDefinitionDirectoryURL()
{
  return MEMORY[0x1F4176D30]();
}

uint64_t WFDatabaseProxyConfigureXPCInterface()
{
  return MEMORY[0x1F4176D38]();
}

uint64_t WFDefinitionDirectoryURLForBundleIdentifier()
{
  return MEMORY[0x1F4176D40]();
}

uint64_t WFDefinitionDirectoryURLsForBundleIdentifier()
{
  return MEMORY[0x1F4176D48]();
}

uint64_t WFGetAzulBuiltInCollectionIdentifiers()
{
  return MEMORY[0x1F4176D50]();
}

uint64_t WFGetBootSessionUUID()
{
  return MEMORY[0x1F4176D58]();
}

uint64_t WFGetBuiltInCollectionIdentifiers()
{
  return MEMORY[0x1F4176D60]();
}

uint64_t WFInstalledAppsEnumerator()
{
  return MEMORY[0x1F4112E90]();
}

uint64_t WFLinkActionSerializedParametersForLNAction()
{
  return MEMORY[0x1F4176D68]();
}

uint64_t WFPendingTriggerEventIDsFromNotificationUserInfo()
{
  return MEMORY[0x1F4176D70]();
}

uint64_t WFProcessIsRunningInUserSetup()
{
  return MEMORY[0x1F4176D78]();
}

uint64_t WFReadableTriggerNotificationLevel()
{
  return MEMORY[0x1F4176D80]();
}

uint64_t WFRecoverDatabaseContentsIfNeeded()
{
  return MEMORY[0x1F4176D88]();
}

uint64_t WFRunSourceIsSpotlight()
{
  return MEMORY[0x1F4168070]();
}

uint64_t WFSerializedIdentifierFromLinkValue()
{
  return MEMORY[0x1F4176D90]();
}

uint64_t WFSpotlightResultRunnableAccessorySystemImageNameKey()
{
  return MEMORY[0x1F4168078]();
}

uint64_t WFStaticContextualActionDefinitionsForSurface()
{
  return MEMORY[0x1F4168088]();
}

uint64_t WFStringForDialogPresentationMode()
{
  return MEMORY[0x1F4176D98]();
}

uint64_t WFSyncedDefinitionDirectoryURL()
{
  return MEMORY[0x1F4176DA0]();
}

uint64_t WFSystemImageNameForGlyphCharacter()
{
  return MEMORY[0x1F4168090]();
}

uint64_t WFSystemStaccatoActionIdentifiersBySection()
{
  return MEMORY[0x1F41680A0]();
}

uint64_t WFToggleAccessibilityContextualActions()
{
  return MEMORY[0x1F41680A8]();
}

uint64_t WFToggleSettingContextualActions()
{
  return MEMORY[0x1F41680B0]();
}

uint64_t WFTriggerIDFromNotificationUserInfo()
{
  return MEMORY[0x1F4176DA8]();
}

uint64_t WFTriggerIDsToDisableFromNotificationUserInfo()
{
  return MEMORY[0x1F4176DB0]();
}

uint64_t WFTriggerIDsToDisableNotificationUserInfoFromTriggers()
{
  return MEMORY[0x1F4176DB8]();
}

uint64_t WFTriggerNotificationUserInfo()
{
  return MEMORY[0x1F4176DC0]();
}

uint64_t WFUIPresenterHostXPCInterface()
{
  return MEMORY[0x1F4176DC8]();
}

uint64_t WFUIPresenterXPCInterface()
{
  return MEMORY[0x1F4176DD0]();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  return MEMORY[0x1F4178A00]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1F4178A18]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x1F4178A70]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1F4178CF0]();
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  return MEMORY[0x1F4178E00]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x1F4178E60]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x1F4178E88]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179120]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x1F4179210]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1F40DF020]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionRegisterBlockForNotification()
{
  return MEMORY[0x1F40DF1C8]();
}

uint64_t _LSVersionNumberCompare()
{
  return MEMORY[0x1F40DEEC0]();
}

uint64_t _LSVersionNumberMakeWithString()
{
  return MEMORY[0x1F40DEEC8]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1F40CB578]();
}

uint64_t container_delete()
{
  return MEMORY[0x1F40CB5A8]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t getWFAppIntentsLogObject()
{
  return MEMORY[0x1F41680D8]();
}

uint64_t getWFCloudKitSyncLogObject()
{
  return MEMORY[0x1F41680E0]();
}

uint64_t getWFDialogLogObject()
{
  return MEMORY[0x1F4168108]();
}

uint64_t getWFEventTrackerLogObject()
{
  return MEMORY[0x1F4168110]();
}

uint64_t getWFFilesLogObject()
{
  return MEMORY[0x1F4168118]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x1F4168128]();
}

uint64_t getWFSecurityLogObject()
{
  return MEMORY[0x1F4168168]();
}

uint64_t getWFSessionKitLogObject()
{
  return MEMORY[0x1F4168170]();
}

uint64_t getWFSpotlightSyncLogObject()
{
  return MEMORY[0x1F4168178]();
}

uint64_t getWFStaccatoLogObject()
{
  return MEMORY[0x1F4168180]();
}

uint64_t getWFTopHitsLogObject()
{
  return MEMORY[0x1F41681A8]();
}

uint64_t getWFTriggerNotificationsLogObject()
{
  return MEMORY[0x1F41681B0]();
}

uint64_t getWFTriggersLogObject()
{
  return MEMORY[0x1F41681B8]();
}

uint64_t getWFWalrusLogObject()
{
  return MEMORY[0x1F41681C0]();
}

uint64_t getWFWatchSyncLogObject()
{
  return MEMORY[0x1F41681C8]();
}

uint64_t getWFWidgetLogObject()
{
  return MEMORY[0x1F41681D8]();
}

uint64_t getWFWorkflowExecutionLogObject()
{
  return MEMORY[0x1F41681E0]();
}

uint64_t getWFXPCRunnerLogObject()
{
  return MEMORY[0x1F41681F0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1F40CD5B0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x1F40CE968]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x1F40CE9A8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}