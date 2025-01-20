id sub_2608C6D80(void *a1)
{
  void *v1;
  void *v2;
  uint64_t vars8;

  if (a1)
  {
    v1 = sub_2608CA760(MEMORY[0x263F08C38], a1);
    v2 = [v1 UUIDString];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t sub_2608C6DE4(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 BOOLValue];
    int v4 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    int v4 = 2;
  }
  *__error() = v4;

  return v3;
}

uint64_t sub_2608C6E6C(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = [v4 intValue];
    int v5 = 0;
  }
  else
  {
    int v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_2608C6EF4(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = [v4 unsignedIntValue];
    int v5 = 0;
  }
  else
  {
    int v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_2608C6F7C(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = [v4 longLongValue];
    int v5 = 0;
  }
  else
  {
    int v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_2608C7004(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = [v4 unsignedLongLongValue];
    int v5 = 0;
  }
  else
  {
    int v5 = 2;
  }
  *__error() = v5;

  return a3;
}

id sub_2608C708C(void *a1, uint64_t a2)
{
  if (a1)
  {
    v2 = [a1 objectForKey:a2];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if (isKindOfClass)
    {
      *int v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *int v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_2608C711C(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = [a1 objectForKey:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v3);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *__error() = 2;

              v8 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }

      v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v3, v10);
      *__error() = 0;
LABEL_14:
    }
    else
    {
      v8 = 0;
      *__error() = 2;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id sub_2608C72C8(void *a1, uint64_t a2)
{
  if (a1)
  {
    v2 = [a1 objectForKey:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = sub_2608CA760(MEMORY[0x263F08C38], v2);
      int v4 = 2 * (v3 == 0);
    }
    else
    {
      id v3 = 0;
      int v4 = 2;
    }
    *__error() = v4;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id sub_2608C7374(void *a1, uint64_t a2)
{
  if (a1)
  {
    v2 = [a1 objectForKey:a2];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if (isKindOfClass)
    {
      *int v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *int v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_2608C7404(void *a1, uint64_t a2)
{
  if (a1)
  {
    v2 = [a1 objectForKey:a2];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if (isKindOfClass)
    {
      *int v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *int v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_2608C7494(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v9 = 0;
    v1 = [MEMORY[0x263F08AC0] dataWithPropertyList:a1 format:200 options:0 error:&v9];
    id v2 = v9;
    if (!v1)
    {
      if (qword_26A8C3828 != -1) {
        dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
      }
      id v3 = (id)qword_26A8C3820;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        unsigned int v4 = sub_2608CE99C();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          unsigned int v5 = v4;
        }
        else {
          unsigned int v5 = v4 & 0xFFFFFFFE;
        }
        if (v5)
        {
          int v10 = 138543362;
          id v11 = v2;
          uint64_t v6 = _os_log_send_and_compose_impl();
          v7 = (void *)v6;
          if (v6) {
            sub_2608CE9C4(v6);
          }
        }
        else
        {
          v7 = 0;
        }
        free(v7);
      }
    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id sub_2608C7624(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v9 = 0;
    v1 = [MEMORY[0x263F08AC0] dataWithPropertyList:a1 format:200 options:0 error:&v9];
    id v2 = v9;
    if (!v1)
    {
      if (qword_26A8C3828 != -1) {
        dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
      }
      id v3 = (id)qword_26A8C3820;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        unsigned int v4 = sub_2608CE99C();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          unsigned int v5 = v4;
        }
        else {
          unsigned int v5 = v4 & 0xFFFFFFFE;
        }
        if (v5)
        {
          int v10 = 138412290;
          id v11 = v2;
          uint64_t v6 = _os_log_send_and_compose_impl();
          v7 = (void *)v6;
          if (v6) {
            sub_2608CE9C4(v6);
          }
        }
        else
        {
          v7 = 0;
        }
        free(v7);
      }
    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id sub_2608C77B4(uint64_t a1)
{
  v16[3] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v15 = 0;
    v1 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:0 error:&v15];
    id v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_26A8C3828 != -1) {
          dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
        }
        id v3 = (id)qword_26A8C3820;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          unsigned int v4 = sub_2608CE99C();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            unsigned int v5 = v4;
          }
          else {
            unsigned int v5 = v4 & 0xFFFFFFFE;
          }
          if (v5)
          {
            uint64_t v6 = _os_log_send_and_compose_impl();
            v7 = (void *)v6;
            if (v6) {
              sub_2608CE9C4(v6);
            }
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        id v13 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_26A8C3828 != -1) {
        dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
      }
      v8 = (id)qword_26A8C3820;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_2608CE99C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(void *)((char *)v16 + 4) = v2;
          uint64_t v11 = _os_log_send_and_compose_impl();
          uint64_t v12 = (void *)v11;
          if (v11) {
            sub_2608CE9C4(v11);
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        free(v12);
      }
    }
    id v13 = v1;
LABEL_29:

    goto LABEL_30;
  }
  id v13 = 0;
LABEL_30:
  return v13;
}

id sub_2608C7A44(uint64_t a1)
{
  v16[3] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v15 = 0;
    v1 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:0 error:&v15];
    id v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_26A8C3828 != -1) {
          dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
        }
        id v3 = (id)qword_26A8C3820;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          unsigned int v4 = sub_2608CE99C();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
            unsigned int v5 = v4;
          }
          else {
            unsigned int v5 = v4 & 0xFFFFFFFE;
          }
          if (v5)
          {
            uint64_t v6 = _os_log_send_and_compose_impl();
            v7 = (void *)v6;
            if (v6) {
              sub_2608CE9C4(v6);
            }
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        id v13 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_26A8C3828 != -1) {
        dispatch_once(&qword_26A8C3828, &unk_270CA9F88);
      }
      v8 = (id)qword_26A8C3820;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_2608CE99C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(void *)((char *)v16 + 4) = v2;
          uint64_t v11 = _os_log_send_and_compose_impl();
          uint64_t v12 = (void *)v11;
          if (v11) {
            sub_2608CE9C4(v11);
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        free(v12);
      }
    }
    id v13 = v1;
LABEL_29:

    goto LABEL_30;
  }
  id v13 = 0;
LABEL_30:
  return v13;
}

uint64_t sub_2608C7CD4()
{
  qword_26A8C3820 = (uint64_t)os_log_create(off_26A8C3818, "default");
  return MEMORY[0x270F9A758]();
}

id sub_2608C7D1C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      id v3 = [&stru_270CAA088 dataUsingEncoding:4];
    }
    id v3 = v3;
    a1 = v3;
  }

  return a1;
}

uint64_t sub_2608CA718()
{
  qword_26B3F3E60 = (uint64_t)os_log_create(off_26A8C3818, "sideeffect");
  return MEMORY[0x270F9A758]();
}

id sub_2608CA760(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];

  return v3;
}

id sub_2608CA7C0(uint64_t a1, const __CFUUID *a2)
{
  self;
  if (a2)
  {
    id v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
    if (!v3) {
      sub_2608D4DD0();
    }
    unsigned int v4 = v3;
    unsigned int v5 = sub_2608CA760(MEMORY[0x263F08C38], v3);
    CFRelease(v4);
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5;
}

CFUUIDRef sub_2608CA844(void *a1)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v2 = [a1 UUIDString];
  CFUUIDRef v3 = CFUUIDCreateFromString(v1, v2);

  if (!v3) {
    sub_2608D4DD0();
  }
  return v3;
}

id sub_2608CA8A4()
{
  self;
  if (qword_26A8C3838 != -1) {
    dispatch_once(&qword_26A8C3838, &unk_270CA9FC8);
  }
  v0 = (void *)qword_26A8C3830;
  return v0;
}

uint64_t sub_2608CA8FC()
{
  qword_26A8C3830 = objc_alloc_init(UMLProviderSideEffects);
  return MEMORY[0x270F9A758]();
}

id sub_2608CA9C8()
{
  return sub_2608CA8A4();
}

uint64_t sub_2608CA9D4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_2608CA9E0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

uint64_t sub_2608CA9F0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

void sub_2608CA9FC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

uint64_t sub_2608CC384(uint64_t a1, void *a2, _removefile_state *a3, void *a4)
{
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (a1)
  {
    if (a4) {
      *a4 = 0;
    }
    HIDWORD(v36) = 0;
    if (removefile_state_set(a3, 3u, sub_2608CC9B0))
    {
      int v8 = *__error();
      HIDWORD(v36) = v8;
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      unsigned int v9 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(void *)v37 = 0;
        unsigned int v10 = sub_2608CE99C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          unsigned int v11 = v10;
        }
        else {
          unsigned int v11 = v10 & 0xFFFFFFFE;
        }
        if (v11)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = v8;
          LODWORD(v36) = 8;
          v35 = v38;
          goto LABEL_22;
        }
        goto LABEL_24;
      }
      goto LABEL_26;
    }
    if (removefile_state_set(a3, 4u, (char *)&v36 + 4))
    {
      HIDWORD(v36) = *__error();
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      unsigned int v9 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(void *)v37 = 0;
        unsigned int v12 = sub_2608CE99C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = v12 & 0xFFFFFFFE;
        }
        if (v13)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = HIDWORD(v36);
          LODWORD(v36) = 8;
          v35 = v38;
LABEL_22:
          uint64_t v14 = _os_log_send_and_compose_impl();
          id v15 = (void *)v14;
          if (v14) {
            sub_2608CE9C4(v14);
          }
          goto LABEL_25;
        }
LABEL_24:
        id v15 = 0;
LABEL_25:
        free(v15);
      }
LABEL_26:

      if (a4)
      {
LABEL_27:
        objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08438], SHIDWORD(v36), 0, v35, v36, *(void *)v37, *(_OWORD *)&v37[8]);
        a1 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_73;
      }
LABEL_72:
      a1 = 0;
      goto LABEL_73;
    }
    id v16 = v7;
    if (removefile((const char *)[v16 UTF8String], a3, 1u))
    {
      HIDWORD(v36) = *__error();
      if (HIDWORD(v36) != 2)
      {
        if (qword_26B3F3E78 != -1) {
          dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
        }
        v22 = (id)qword_26B3F3E68;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38[0] = 0;
          unsigned int v23 = sub_2608CE99C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            unsigned int v24 = v23;
          }
          else {
            unsigned int v24 = v23 & 0xFFFFFFFE;
          }
          if (v24)
          {
LABEL_58:
            *(_DWORD *)v37 = 138543618;
            *(void *)&v37[4] = v16;
            *(_WORD *)&v37[12] = 1024;
            *(_DWORD *)&v37[14] = HIDWORD(v36);
            LODWORD(v36) = 18;
            v35 = v37;
            uint64_t v27 = _os_log_send_and_compose_impl();
            v28 = (void *)v27;
            if (v27) {
              sub_2608CE9C4(v27);
            }
            goto LABEL_70;
          }
LABEL_69:
          v28 = 0;
LABEL_70:
          free(v28);
        }
LABEL_71:

        if (a4) {
          goto LABEL_27;
        }
        goto LABEL_72;
      }
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v17 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v38[0] = 0;
        unsigned int v18 = sub_2608CE99C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          unsigned int v19 = v18;
        }
        else {
          unsigned int v19 = v18 & 0xFFFFFFFE;
        }
        if (v19)
        {
          *(_DWORD *)v37 = 138543362;
          *(void *)&v37[4] = v16;
          LODWORD(v36) = 12;
          v35 = v37;
          uint64_t v20 = _os_log_send_and_compose_impl();
          v21 = (void *)v20;
          if (v20) {
            sub_2608CE9C4(v20);
          }
        }
        else
        {
          v21 = 0;
        }
        free(v21);
      }
    }
    if ((v36 & 0xFFFFFFFD00000000) != 0)
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v22 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v38[0] = 0;
        unsigned int v25 = sub_2608CE99C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26) {
          goto LABEL_58;
        }
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v29 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v38[0] = 0;
      unsigned int v30 = sub_2608CE99C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v31 = v30;
      }
      else {
        unsigned int v31 = v30 & 0xFFFFFFFE;
      }
      if (v31)
      {
        *(_DWORD *)v37 = 138543362;
        *(void *)&v37[4] = v16;
        uint64_t v32 = _os_log_send_and_compose_impl();
        v33 = (void *)v32;
        if (v32) {
          sub_2608CE9C4(v32);
        }
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }

    a1 = 1;
  }
LABEL_73:

  return a1;
}

uint64_t sub_2608CC9B0(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    int v5 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    uint64_t v6 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(void *)&v43.st_dev = 0;
      unsigned int v7 = sub_2608CE99C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        *(_DWORD *)v40 = 67109120;
        *(_DWORD *)&v40[4] = v5;
        uint64_t v9 = _os_log_send_and_compose_impl();
        unsigned int v10 = (void *)v9;
        if (v9) {
          sub_2608CE9C4(v9);
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }

    return 0;
  }
  int v11 = dst;
  if (dst == 1)
  {
    memset(&v43, 0, sizeof(v43));
    if (lstat(a2, &v43))
    {
      int v17 = *__error();
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      unsigned int v18 = (id)qword_26B3F3E68;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
      unsigned int v19 = sub_2608CE99C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20) {
        goto LABEL_30;
      }
      goto LABEL_72;
    }
    if ((v43.st_flags & 2) != 0)
    {
      if (lchflags(a2, v43.st_flags & 0xFFFFFFFD))
      {
        int v17 = *__error();
        if (qword_26B3F3E78 != -1) {
          dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
        }
        unsigned int v18 = (id)qword_26B3F3E68;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_74;
        }
        unsigned int v24 = sub_2608CE99C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
LABEL_30:
          *(_DWORD *)v40 = 136446466;
          *(void *)&v40[4] = a2;
          __int16 v41 = 1024;
          int v42 = v17;
          goto LABEL_31;
        }
LABEL_72:
        v22 = 0;
LABEL_73:
        free(v22);
LABEL_74:

        goto LABEL_75;
      }
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      unsigned int v26 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        unsigned int v27 = sub_2608CE99C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
          unsigned int v28 = v27;
        }
        else {
          unsigned int v28 = v27 & 0xFFFFFFFE;
        }
        if (v28)
        {
          *(_DWORD *)v40 = 136446210;
          *(void *)&v40[4] = a2;
          uint64_t v29 = _os_log_send_and_compose_impl();
          unsigned int v30 = (void *)v29;
          if (v29) {
            sub_2608CE9C4(v29);
          }
        }
        else
        {
          unsigned int v30 = 0;
        }
        free(v30);
      }

      if (unlink(a2))
      {
        int v31 = *__error();
        if (v31 != 2)
        {
          if (qword_26B3F3E78 != -1) {
            dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
          }
          unsigned int v18 = (id)qword_26B3F3E68;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          unsigned int v32 = sub_2608CE99C();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            unsigned int v33 = v32;
          }
          else {
            unsigned int v33 = v32 & 0xFFFFFFFE;
          }
          if (v33)
          {
            *(_DWORD *)v40 = 136446466;
            *(void *)&v40[4] = a2;
            __int16 v41 = 1024;
            int v42 = v31;
LABEL_31:
            uint64_t v21 = _os_log_send_and_compose_impl();
            v22 = (void *)v21;
            if (v21) {
              sub_2608CE9C4(v21);
            }
            goto LABEL_73;
          }
          goto LABEL_72;
        }
      }
      int dst = 0;
    }
LABEL_75:
    int v11 = dst;
    goto LABEL_76;
  }
  if (dst == 2)
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    unsigned int v12 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(void *)v40 = 0;
      unsigned int v13 = sub_2608CE99C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        v43.st_dev = 136446210;
        *(void *)&v43.st_mode = a2;
        uint64_t v15 = _os_log_send_and_compose_impl();
        id v16 = (void *)v15;
        if (v15) {
          sub_2608CE9C4(v15);
        }
      }
      else
      {
        id v16 = 0;
      }
      free(v16);
    }

    return 0;
  }
LABEL_76:
  if (v11)
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v34 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(void *)v40 = 0;
      unsigned int v35 = sub_2608CE99C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = v35 & 0xFFFFFFFE;
      }
      if (v36)
      {
        v43.st_dev = 136446466;
        *(void *)&v43.st_mode = a2;
        WORD2(v43.st_ino) = 1024;
        *(_DWORD *)((char *)&v43.st_ino + 6) = dst;
        uint64_t v37 = _os_log_send_and_compose_impl();
        v38 = (void *)v37;
        if (v37) {
          sub_2608CE9C4(v37);
        }
      }
      else
      {
        v38 = 0;
      }
      free(v38);
    }

    if (!*a3) {
      *a3 = dst;
    }
  }
  return 0;
}

uint64_t sub_2608CDB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v10 = [NSString stringWithUTF8String:a4];
  int v11 = [NSString stringWithUTF8String:a5];
  unsigned int v12 = (uint64_t (**)(void, void, void, void, void))MEMORY[0x26121F660](a6);
  uint64_t v13 = ((uint64_t (**)(void, uint64_t, uint64_t, void *, void *))v12)[2](v12, a1, a2, v10, v11);

  return v13;
}

uint64_t sub_2608CDBFC()
{
  qword_26B3F3E68 = (uint64_t)os_log_create(off_26A8C3818, "sideeffect");
  return MEMORY[0x270F9A758]();
}

uint64_t UMLCreatePrimaryUserLayout(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v8 = +[UMLManager sharedManager];
  id v13 = 0;
  uint64_t v9 = [v8 createUserLayoutForUserwithUserID:501 withAKSSetup:a3 onUserVolumePath:a2 fromSystemVolumePath:a1 withError:&v13];
  id v10 = v13;
  int v11 = v10;
  if (a4 && (v9 & 1) == 0 && v10) {
    *a4 = v10;
  }

  return v9;
}

uint64_t sub_2608CE90C()
{
  qword_26A8C3840 = (uint64_t)os_log_create(off_26A8C3818, "userlayout");
  return MEMORY[0x270F9A758]();
}

uint64_t UMLSetLogHandler()
{
  qword_26A8C3850 = MEMORY[0x26121F660]();
  return MEMORY[0x270F9A758]();
}

void *UMLSetInternalLogHandlers(void *result, void *a2)
{
  off_26B3F3E50 = result;
  off_26B3F3E58 = a2;
  return result;
}

uint64_t sub_2608CE99C()
{
  if (off_26B3F3E50) {
    return off_26B3F3E50();
  }
  else {
    return 2 * (qword_26A8C3850 != 0);
  }
}

uint64_t sub_2608CE9C4(uint64_t a1)
{
  CFAllocatorRef v1 = (uint64_t (*)(uint64_t, uint64_t))off_26B3F3E58;
  if (off_26B3F3E58)
  {
    return v1(a1, a1);
  }
  else
  {
    if (!qword_26A8C3850) {
      sub_2608D4DEC();
    }
    CFUUIDRef v3 = *(uint64_t (**)(void))(qword_26A8C3850 + 16);
    return v3();
  }
}

void sub_2608CEA80()
{
  v0 = [UMLManager alloc];
  sub_2608CA9C8();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  CFAllocatorRef v1 = sub_2608CEAF0((id *)&v0->super.isa, v3);
  id v2 = (void *)qword_26A8C3858;
  qword_26A8C3858 = (uint64_t)v1;
}

id *sub_2608CEAF0(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)UMLManager;
    int v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (!v5) {
      sub_2608D4DD0();
    }
    a1 = v5;

    objc_storeStrong(a1 + 1, a2);
    uint64_t v6 = objc_opt_new();
    id v7 = a1[2];
    a1[2] = (id)v6;
  }
  return a1;
}

uint64_t sub_2608CFF04(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 2)
  {
    if (qword_26A8C3870 != -1) {
      dispatch_once(&qword_26A8C3870, &unk_270CAA048);
    }
    id v10 = (id)qword_26A8C3868;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = sub_2608CE99C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        unsigned int v14 = (void *)v13;
        if (v13) {
          sub_2608CE9C4(v13);
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
      free(v14);
    }

    id v16 = *(void **)(a1 + 32);
    if (v16) {
      id v16 = (void *)v16[1];
    }
    int v17 = v16;
    unsigned int v18 = sub_2608CA9F0((uint64_t)v17);
    char v19 = [v18 chownPath:v9 toUser:*(unsigned int *)(a1 + 40) group:*(unsigned int *)(a1 + 40) error:0];

    if (v19)
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      unsigned int v20 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v21 = sub_2608CE99C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          unsigned int v22 = v21;
        }
        else {
          unsigned int v22 = v21 & 0xFFFFFFFE;
        }
        if (v22)
        {
          uint64_t v23 = _os_log_send_and_compose_impl();
          unsigned int v24 = (void *)v23;
          if (v23) {
            sub_2608CE9C4(v23);
          }
        }
        else
        {
          unsigned int v24 = 0;
        }
        free(v24);
      }
      uint64_t v15 = 0;
    }
    else
    {
      if (qword_26A8C3870 != -1) {
        dispatch_once(&qword_26A8C3870, &unk_270CAA048);
      }
      unsigned int v20 = (id)qword_26A8C3868;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        unsigned int v25 = sub_2608CE99C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26)
        {
          uint64_t v27 = _os_log_send_and_compose_impl();
          unsigned int v28 = (void *)v27;
          if (v27) {
            sub_2608CE9C4(v27);
          }
        }
        else
        {
          unsigned int v28 = 0;
        }
        free(v28);
      }
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t sub_2608D1748()
{
  qword_26A8C3868 = (uint64_t)os_log_create(off_26A8C3818, "userlayout");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2608D4D88()
{
  qword_26A8C3878 = (uint64_t)os_log_create(off_26A8C3818, "userlayout");
  return MEMORY[0x270F9A758]();
}

void sub_2608D4DD0()
{
}

void sub_2608D4DEC()
{
}

uint64_t AKSIdentityAddPersona()
{
  return MEMORY[0x270F0E380]();
}

uint64_t AKSIdentityCreate()
{
  return MEMORY[0x270F0E388]();
}

uint64_t AKSIdentityDelete()
{
  return MEMORY[0x270F0E390]();
}

uint64_t AKSIdentityDeletePersona()
{
  return MEMORY[0x270F0E398]();
}

uint64_t AKSIdentityLoad()
{
  return MEMORY[0x270F0E3A0]();
}

uint64_t AKSIdentityLogin()
{
  return MEMORY[0x270F0E3A8]();
}

uint64_t AKSIdentityUnload()
{
  return MEMORY[0x270F0E3B0]();
}

uint64_t AKSVolumeBootstrapFS()
{
  return MEMORY[0x270F0E3B8]();
}

uint64_t AKSVolumeMap()
{
  return MEMORY[0x270F0E3C0]();
}

uint64_t AKSVolumeUnmap()
{
  return MEMORY[0x270F0E3C8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x270F0E3F8]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x270F0E418]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x270F0E420]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x270F0E428]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x270ED9100](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x270ED9108]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x270ED9110](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x270ED9120](s, *(void *)&flag, src);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x270EDA010](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA018](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270EDA020](a1, *(void *)&a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x270EDB1F0](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x270EDB1F8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x270EDB200](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x270EDB208](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x270EDB210](state, *(void *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x270EDB248](a1, a2, *(void *)&a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}