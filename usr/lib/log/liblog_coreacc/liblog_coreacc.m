id convertNSDataToNSString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v3;
    v6 = [v5 bytes];
    v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v5 length])
    {
      v8 = 0;
      do
        [v7 appendFormat:v4, *(unsigned __int8 *)(v6 + v8++)];
      while (v8 < [v5 length]);
    }
    v9 = [NSString stringWithString:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  v5 = [v4 componentsJoinedByString:&stru_26E546BE8];

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x263F08708] hexadecimalCharacterSet];
    v3 = [v2 invertedSet];
    v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    v5 = [v4 componentsJoinedByString:&stru_26E546BE8];

    id v1 = v5;
    v6 = (const char *)[v1 UTF8String];
    size_t v7 = strlen(v6) >> 1;
    v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)[v1 length] >= 2)
    {
      unint64_t v9 = 0;
      int v10 = 0;
      do
      {
        uint64_t v11 = 0;
        __int16 v22 = -21846;
        char v12 = 1;
        do
        {
          char v13 = v12;
          int v14 = v6[v11 | (2 * v10)];
          unsigned int v15 = v14 - 48;
          unsigned int v16 = v14 - 65;
          if ((v14 - 97) >= 6) {
            char v17 = 0;
          }
          else {
            char v17 = v14 - 87;
          }
          char v18 = v14 - 55;
          if (v16 > 5) {
            char v18 = v17;
          }
          if (v15 < 0xA) {
            char v18 = v15;
          }
          *((unsigned char *)&v22 + v11) = v18;
          uint64_t v11 = 1;
          char v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        unint64_t v9 = (v10 + 1);
        unint64_t v19 = [v1 length];
        int v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    v20 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = [MEMORY[0x263EFF9C0] set];
  unsigned int outCount = 0;
  uint64_t v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  char v12 = v11;
  if (outCount)
  {
    unint64_t v13 = 0;
    p_name = &v11->name;
    do
    {
      if (([a1 instancesRespondToSelector:*p_name] & 1) == 0)
      {
        unsigned int v15 = NSStringFromSelector(*p_name);
        [v10 addObject:v15];
      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && [v10 count])
  {
    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v16 = 1;
  if (a5)
  {
LABEL_11:
    *a5 = [MEMORY[0x263EFFA08] setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = (void *)MEMORY[0x263EFF9D0];
  id v2 = a1;
  v3 = [v1 null];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1 = a1;
  if (isNSObjectNull(v1)) {
    id v2 = 0;
  }
  else {
    id v2 = v1;
  }

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

id castNSObjectToType(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id readJSONFile(uint64_t a1)
{
  if (a1)
  {
    id v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = [MEMORY[0x263F08900] JSONObjectWithData:v1 options:0 error:&v5];
      v3 = v2;
      if (!v5)
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    v3 = 0;
    goto LABEL_6;
  }
  v3 = 0;
LABEL_8:

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = (id)MEMORY[0x263EFFA78];
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v9];
    v6 = v5;
    if (v9) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 writeToFile:v4 atomically:1];
    }
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
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
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
        long long v10 = [v9 initWithBase64EncodedString:v8 options:0];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 stringWithFormat:@"<decode failure [%s]: <%@: %@>>", a1, v6, v3];

  if (!strcmp(a1, "BOOL"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [v3 BOOLValue];

      if (v8) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
    }
  }
  if (!strcmp(a1, "bytes"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v12 = convertNSDataToNSString(v3, @"%02X ");
    goto LABEL_23;
  }
  if (!strcmp(a1, "ACCConnection_Type_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [v3 intValue];
      if (v9 <= 9)
      {
        long long v10 = NSString;
        long long v11 = kACCConnection_Type_Strings;
        goto LABEL_22;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Status_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v18 = [v3 intValue];
      if (v18 < 4)
      {
        long long v13 = off_264B9BB10[v18];
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Type_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v26 = [v3 intValue];
      if (v26 < 7 && ((0x5Fu >> v26) & 1) != 0)
      {
        long long v13 = off_264B9BB30[v26];
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Version_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v27 = [v3 intValue];
      switch(v27)
      {
        case 0:
          long long v13 = @"[Unknown]";
          goto LABEL_24;
        case 3:
          long long v13 = @"[V3]";
          goto LABEL_24;
        case 2:
          long long v13 = @"[V2]";
          goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_V2_Info_CertClass_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [v3 intValue];
      if (!v29)
      {
        long long v13 = @"[00 - Apple]";
        goto LABEL_24;
      }
      if (v29 == 255)
      {
        long long v13 = @"[FF - Unknown]";
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCEndpoint_TransportType_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [v3 intValue];
      if (v9 <= 0xF)
      {
        long long v10 = NSString;
        long long v11 = kACCEndpoint_TransportType_Strings;
        goto LABEL_22;
      }
    }
  }
  else if (!strcmp(a1, "ACCEndpoint_Protocol_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [v3 intValue];
      if (v9 <= 0x11)
      {
        long long v10 = NSString;
        long long v11 = kACCEndpoint_Protocol_Strings;
LABEL_22:
        uint64_t v12 = [v10 stringWithFormat:@"[%s]", v11[v9]];
LABEL_23:
        long long v13 = (__CFString *)v12;
LABEL_24:

        uint64_t v7 = v13;
      }
    }
  }
LABEL_25:
  if (!strcmp(a1, "ACCDeviceNotification_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v16 = [v3 intValue];
      if (v16 < 6 && ((0x2Fu >> v16) & 1) != 0)
      {
        uint64_t v17 = &off_264B9BB68[v16];
LABEL_46:
        unint64_t v19 = *v17;

        uint64_t v7 = v19;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_PlaybackStatus_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v14 = [v3 intValue];
      if (v14 < 5)
      {
        long long v15 = off_264B9BB98;
        goto LABEL_45;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_ShuffleMode_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v14 = [v3 intValue];
      if (v14 < 3)
      {
        long long v15 = off_264B9BBC0;
        goto LABEL_45;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_RepeatMode_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v14 = [v3 intValue];
      if (v14 < 3)
      {
        long long v15 = off_264B9BBD8;
LABEL_45:
        uint64_t v17 = &v15[v14];
        goto LABEL_46;
      }
    }
  }
  if (!strcmp(a1, "iAP2Feature_t"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v20 = [v3 intValue];
      if (v20 <= 0x1C)
      {
        v21 = off_264B9BBF0[v20];

        uint64_t v7 = v21;
      }
    }
  }
  if (strcmp(a1, "iAP2Feature_AccAuthentication_State_t"))
  {
    if (!strcmp(a1, "iAP2Feature_Identification_State_t"))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v22 = [v3 intValue];
        if (v22 < 7)
        {
          v23 = off_264B9BCF0;
          goto LABEL_109;
        }
      }
      goto LABEL_111;
    }
    if (!strcmp(a1, "iAP2ParamID_IdentificationInfo_HIDComponent_Function_t"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_111;
      }
      unsigned int v24 = [v3 intValue];
      if (v24 >= 9 || ((0x1DFu >> v24) & 1) == 0) {
        goto LABEL_111;
      }
      v25 = off_264B9BD28[v24];
    }
    else
    {
      if (!strcmp(a1, "iAP2PacketServiceType_t"))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v22 = [v3 intValue];
          if (v22 < 4)
          {
            v23 = off_264B9BD70;
            goto LABEL_109;
          }
        }
        goto LABEL_111;
      }
      if (strcmp(a1, "iAP2ParamID_RequestAppLaunch_AppLaunchMethod_t"))
      {
        if (!strcmp(a1, "ACCCommunications_CallService_t"))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v22 = [v3 intValue];
            if (v22 < 4)
            {
              v23 = off_264B9BD90;
              goto LABEL_109;
            }
          }
        }
        else if (!strcmp(a1, "ACCCommunications_CommunicationsUpdate_RegistrationStatus_t"))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v22 = [v3 intValue];
            if (v22 < 7)
            {
              v23 = off_264B9BDB0;
              goto LABEL_109;
            }
          }
        }
        else
        {
          if (!strcmp(a1, "ACCCommunications_CallControls_AcceptAction_t"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_111;
            }
            int v32 = [v3 intValue];
            if (v32)
            {
              if (v32 != 1) {
                goto LABEL_111;
              }
              v25 = @"[End and Accept]";
            }
            else
            {
              v25 = @"[Accept/Hold and Accept]";
            }
            goto LABEL_110;
          }
          if (!strcmp(a1, "ACCCommunications_CallControls_EndAction_t"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ![v3 intValue])
            {
              v25 = @"[End]";
              goto LABEL_110;
            }
          }
          else if (!strcmp(a1, "ACCCommunications_CallControls_DTMFTone_t"))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v22 = [v3 intValue];
              if (v22 < 0xC)
              {
                v23 = off_264B9BDE8;
                goto LABEL_109;
              }
            }
          }
          else
          {
            if (!strcmp(a1, "ACCCommunications_ListUpdate_Type_t"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_111;
              }
              int v33 = [v3 intValue];
              if (v33)
              {
                if (v33 != 1) {
                  goto LABEL_111;
                }
                v25 = @"[Favorites]";
              }
              else
              {
                v25 = @"[Recents]";
              }
              goto LABEL_110;
            }
            if (!strcmp(a1, "FairPlaySAPSessionState"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unint64_t v34 = [v3 unsignedIntegerValue];
                if (v34 < 3)
                {
                  v25 = off_264B9BE48[v34];
                  goto LABEL_110;
                }
              }
            }
            else if (!strcmp(a1, "MFAACertificateManager_CertStatus_t"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v22 = [v3 intValue];
                if (v22 < 5)
                {
                  v23 = off_264B9BE60;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "CertificateType_t"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v22 = [v3 intValue];
                if (v22 < 3)
                {
                  v23 = off_264B9BE88;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "MFAACertificateManager_SWAuth_CertType_t"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v22 = [v3 intValue];
                if (v22 < 4)
                {
                  v23 = off_264B9BEA0;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "SeciAuthVersion"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v22 = [v3 intValue];
                if (v22 < 6)
                {
                  v23 = off_264B9BEC0;
LABEL_109:
                  v25 = v23[v22];
                  goto LABEL_110;
                }
              }
            }
          }
        }
        goto LABEL_111;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_111;
      }
      int v28 = [v3 intValue];
      if (!v28)
      {
        v25 = @"[With User Alert]";
        goto LABEL_110;
      }
      if (v28 != 1) {
        goto LABEL_111;
      }
      v25 = @"[Without User Alert]";
    }
LABEL_110:

    uint64_t v7 = v25;
    goto LABEL_111;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v22 = [v3 intValue];
    if (v22 < 3)
    {
      v23 = off_264B9BCD8;
      goto LABEL_109;
    }
  }
LABEL_111:
  uint64_t v30 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v7];

  return v30;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}