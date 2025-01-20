void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_22481071C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_224810E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_224814B80(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_224816C58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_224816E58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_224816FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t SharedChannelPublishOffGridPayloadRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
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
        uint64_t v17 = PBReaderReadData();
        v18 = *(void **)(a1 + 16);
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

uint64_t SharedChannelCreateRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_33;
      case 2u:
        unsigned int v20 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 16), v20);
        if PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v23;
        goto LABEL_38;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_33:
        v27 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

uint64_t DecryptedParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_32;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_32;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
LABEL_32:
          char v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

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
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_34;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_36:
      *(void *)(a1 + 8) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22481B384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityPollingResponseReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x268092000uLL;
  unint64_t v8 = 0x268092000uLL;
  unsigned int v9 = (int *)MEMORY[0x263F62268];
  unint64_t v10 = 0x268092000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 1880)] |= 0x10u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v9) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_68;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_70;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_70:
        uint64_t v60 = *(int *)(v8 + 1884);
        goto LABEL_92;
      case 2u:
        uint64_t v27 = PBReaderReadData();
        uint64_t v28 = *(int *)(v10 + 1888);
        v29 = *(void **)&a1[v28];
        *(void *)&a1[v28] = v27;

        goto LABEL_93;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        a1[*(int *)(v7 + 1880)] |= 1u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v9) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v17 = v31++ >= 9;
              if (v17)
              {
                uint64_t v32 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_74:
        uint64_t v61 = 8;
        goto LABEL_79;
      case 4u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v32 = 0;
        a1[*(int *)(v7 + 1880)] |= 2u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v9) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v32 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v17 = v37++ >= 9;
              if (v17)
              {
                uint64_t v32 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_78:
        uint64_t v61 = 16;
LABEL_79:
        *(void *)&a1[v61] = v32;
        goto LABEL_93;
      case 5u:
        unint64_t v41 = v7;
        unint64_t v42 = v10;
        unint64_t v43 = v8;
        v44 = objc_alloc_init(ChannelActivityParticipantPayload);
        [a1 addParticipantPayload:v44];
        if PBReaderPlaceMark() && (ChannelActivityParticipantPayloadReadFrom((uint64_t)v44, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v43;
          unint64_t v10 = v42;
          unint64_t v7 = v41;
LABEL_93:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 6u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 1880)] |= 4u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v22 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v17 = v46++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_83:
        uint64_t v60 = 32;
        goto LABEL_92;
      case 7u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 1880)] |= 0x20u;
        while (2)
        {
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v9) + v53);
            *(void *)(a2 + v52) = v53 + 1;
            v22 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_87:
        uint64_t v60 = 44;
        goto LABEL_92;
      case 8u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 1880)] |= 8u;
        while (2)
        {
          uint64_t v57 = *v3;
          unint64_t v58 = *(void *)(a2 + v57);
          if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v9) + v58);
            *(void *)(a2 + v57) = v58 + 1;
            v22 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              BOOL v17 = v56++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_91:
        uint64_t v60 = 36;
LABEL_92:
        *(_DWORD *)&a1[v60] = v22;
        goto LABEL_93;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_93;
    }
  }
}

void sub_22481E2D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22481F0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
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

void sub_2248204F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_224827E1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_224827F90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22482B990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22482E4B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_22482EDFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22482F84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak((id *)(v12 - 136));
  _Unwind_Resume(a1);
}

void sub_2248306F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_2248312DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_224831A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_224832644(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_224832B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224836DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 128));
  _Unwind_Resume(a1);
}

void sub_2248374B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_224838738(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1, void *a2)
{
  return [a2 status];
}

BOOL SharedChannelPublishResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionOffGridPacketInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
          goto LABEL_32;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_32;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_32;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
LABEL_32:
          unsigned int v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

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
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_34;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_36:
      *(void *)(a1 + 8) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SharedChannelProvisionOffGridPayloadRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(ChannelDeferredPublishInfo);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (ChannelDeferredPublishInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionStoragePacketInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
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
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 40) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 24;
              goto LABEL_31;
            case 3u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 16;
              goto LABEL_31;
            case 4u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 32;
LABEL_31:
              unsigned int v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_36:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
          *(void *)(a1 + 8) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionStorageValueReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        *(unsigned char *)(a1 + 20) |= 1u;
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
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(SharedChannelProvisionStoragePacketInfo);
        [(id)a1 addChannelPublishProvisionPacketInfo:v17];
        if (!PBReaderPlaceMark()
          || (SharedChannelProvisionStoragePacketInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22484529C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
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

uint64_t ChannelActivityParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadData();
        char v18 = *(void **)(a1 + 16);
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

uint64_t ChannelIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
LABEL_24:
          unsigned int v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 16) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t SharedChannelPublishPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadData();
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

uint64_t SharedChannelCreateResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
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
            goto LABEL_46;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_48;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_48:
        uint64_t v36 = 28;
        goto LABEL_53;
      case 2u:
        char v24 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 16), v24);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v24, a2))
        {
          PBReaderRecallMark();

LABEL_58:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_52:
        uint64_t v36 = 24;
LABEL_53:
        *(_DWORD *)(a1 + v36) = v19;
        goto LABEL_58;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                uint64_t v32 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_57:
        *(void *)(a1 + 8) = v32;
        goto LABEL_58;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_58;
    }
  }
}

uint64_t ChannelActivityDeactivationRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2)) {
          goto LABEL_26;
        }
        goto LABEL_43;
      case 2u:
        char v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v17);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2))
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      case 3u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 40;
        goto LABEL_36;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_40:
        *(void *)(a1 + 8) = v23;
        goto LABEL_41;
      case 5u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 16;
LABEL_36:
        uint64_t v27 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_41;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

void sub_224850C38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_224850D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AuthCredentialReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
        if (v9++ >= 9)
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        [(id)a1 clearOneofValuesForAuthCredentialOneof];
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 8) = 2;
        uint64_t v24 = objc_alloc_init(SharedOwnershipAuth);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || !SharedOwnershipAuthReadFrom((uint64_t)v24, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        [(id)a1 clearOneofValuesForAuthCredentialOneof];
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 8) = 1;
        uint64_t v25 = PBReaderReadString();
        char v26 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v25;
      }
      else if (v17)
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        unsigned int v18 = 0;
        while (1)
        {
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 == -1 || v20 >= *(void *)(a2 + *v4)) {
            break;
          }
          unint64_t v21 = v20 + 1;
          int v22 = *(char *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v21;
          if (v22 < 0 && v18++ <= 8) {
            continue;
          }
          goto LABEL_35;
        }
        *(unsigned char *)(a2 + *v5) = 1;
      }
LABEL_35:
      ;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SharedChannelPublishRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = objc_alloc_init(ChannelPublishPayload);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (ChannelPublishPayloadReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ChannelPublishPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x268092000uLL;
  unint64_t v8 = 0x268092000uLL;
  unsigned int v9 = (int *)MEMORY[0x263F62268];
  unint64_t v10 = 0x268092000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v9) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_70;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            uint64_t v22 = 0;
            goto LABEL_72;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_70:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_72:
        uint64_t v62 = *(int *)(v8 + 2560);
        goto LABEL_77;
      case 2u:
        unint64_t v27 = v7;
        unint64_t v28 = v10;
        unint64_t v29 = v8;
        char v30 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v30);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v30, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v29;
          unint64_t v10 = v28;
          unint64_t v7 = v27;
LABEL_96:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v31 = PBReaderReadData();
        uint64_t v32 = *(int *)(v10 + 2568);
        goto LABEL_68;
      case 4u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 2u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v9) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v22 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              BOOL v17 = v34++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_76:
        uint64_t v62 = 16;
LABEL_77:
        *(void *)(a1 + v62) = v22;
        goto LABEL_96;
      case 5u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 4u;
        while (2)
        {
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v9) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v17 = v39++ >= 9;
              if (v17)
              {
                LODWORD(v40) = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_81:
        uint64_t v63 = 48;
        goto LABEL_95;
      case 6u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 0x10u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v17 = v45++ >= 9;
              if (v17)
              {
                uint64_t v46 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v46 = 0;
        }
LABEL_85:
        BOOL v64 = v46 != 0;
        uint64_t v65 = 56;
        goto LABEL_90;
      case 7u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v52 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 0x20u;
        while (2)
        {
          uint64_t v53 = *v3;
          unint64_t v54 = *(void *)(a2 + v53);
          if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + *v9) + v54);
            *(void *)(a2 + v53) = v54 + 1;
            v52 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                uint64_t v52 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v52 = 0;
        }
LABEL_89:
        BOOL v64 = v52 != 0;
        uint64_t v65 = 57;
LABEL_90:
        *(unsigned char *)(a1 + v65) = v64;
        goto LABEL_96;
      case 8u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2556)) |= 8u;
        while (2)
        {
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v9) + v59);
            *(void *)(a2 + v58) = v59 + 1;
            v40 |= (unint64_t)(v60 & 0x7F) << v56;
            if (v60 < 0)
            {
              v56 += 7;
              BOOL v17 = v57++ >= 9;
              if (v17)
              {
                LODWORD(v40) = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_94:
        uint64_t v63 = 52;
LABEL_95:
        *(_DWORD *)(a1 + v63) = v40;
        goto LABEL_96;
      case 9u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 24;
LABEL_68:
        uint64_t v61 = *(void **)(a1 + v32);
        *(void *)(a1 + v32) = v31;

        goto LABEL_96;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_96;
    }
  }
}

void sub_2248585D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224859500(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_224859948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_224859F24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22485A854(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22485AD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22485AFD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL SharedChannelProvisionOffGridPayloadResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SharedChannelProvisionOffGridPacketReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
          goto LABEL_25;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_25;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
LABEL_25:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22485F1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadData();
        char v25 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v24;
      }
      else
      {
        if (v17 == 2)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_43;
            }
            v26 += 7;
            BOOL v14 = v27++ >= 9;
            if (v14)
            {
              uint64_t v20 = 0;
              goto LABEL_45;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_45:
          uint64_t v32 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
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
              goto LABEL_39;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              uint64_t v20 = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_41:
          uint64_t v32 = 8;
        }
        *(void *)(a1 + v32) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SignedParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(DecryptedParticipantPayload);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (DecryptedParticipantPayloadReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    unint64_t v17 = *(DecryptedParticipantPayload **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ChannelActivityUpdatePayloadReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadData();
        char v25 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v24;
      }
      else if (v17 == 2)
      {
        char v26 = objc_alloc_init(ChannelActivityParticipantPayload);
        [(id)a1 addParticipantPayload:v26];
        if (!PBReaderPlaceMark()
          || (ChannelActivityParticipantPayloadReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
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
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
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

uint64_t ChannelDeferredPublishInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        unint64_t v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2)) {
          goto LABEL_26;
        }
        goto LABEL_53;
      case 2u:
        unint64_t v17 = objc_alloc_init(SharedChannelProvisionOffGridPacketInfo);
        [(id)a1 addChannelProvisionOffGridPacketInfo:v17];
        if (PBReaderPlaceMark()
          && (SharedChannelProvisionOffGridPacketInfoReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_51:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_53:

        return 0;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_45:
        uint64_t v32 = 32;
        goto LABEL_50;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_49:
        uint64_t v32 = 36;
LABEL_50:
        *(_DWORD *)(a1 + v32) = v21;
        goto LABEL_51;
      case 5u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v30;

        goto LABEL_51;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_51;
    }
  }
}

BOOL SharedChannelPublishOffGridPayloadResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
            goto LABEL_41;
          }
        }
        char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    char v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ChannelActivityActivationRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2)) {
          goto LABEL_26;
        }
        goto LABEL_55;
      case 2u:
        char v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v17);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2))
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_53:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_55:

        return 0;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 64) |= 2u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_48:
        *(_DWORD *)(a1 + 48) = v21;
        goto LABEL_53;
      case 4u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 56;
        goto LABEL_44;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 64) |= 1u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_52:
        *(void *)(a1 + 8) = v29;
        goto LABEL_53;
      case 6u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 40;
        goto LABEL_44;
      case 7u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 16;
LABEL_44:
        char v33 = *(void **)(a1 + v26);
        *(void *)(a1 + v26) = v25;

        goto LABEL_53;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_53;
    }
  }
}

void sub_22486503C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_224865A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224865CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224865E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486699C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224866E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2248672C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224867964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224867D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2248680E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2248683CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224868614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224868B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2248695F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2248697F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224869CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224869EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486A440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486A774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486AAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486AD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486B194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486B56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486B860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486BFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486C3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486C7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486CCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486CF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486D300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486D8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486E71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486E978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486EB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486EDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486F034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486F2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486F600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486F87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486FA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22486FFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224870228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2248703F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224870DBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_224871F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22487231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_224872A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_224872E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_224873AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_224873F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_224874588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityPollingRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2)) {
          goto LABEL_26;
        }
        goto LABEL_43;
      case 2u:
        char v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2))
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_43:

        return 0;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_41;
      case 4u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 40;
        goto LABEL_36;
      case 5u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 8;
LABEL_36:
        char v27 = *(void **)(a1 + v26);
        *(void *)(a1 + v26) = v25;

        goto LABEL_41;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

void sub_224878EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22487A5D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityDeactivationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
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
              goto LABEL_51;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_53;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_51:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_53:
          uint64_t v42 = 28;
          goto LABEL_67;
        case 2u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v24;

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_57:
          uint64_t v43 = 8;
          goto LABEL_62;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v28 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_61:
          uint64_t v43 = 16;
LABEL_62:
          *(void *)(a1 + v43) = v28;
          continue;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v40 + 1;
        v19 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0) {
          goto LABEL_64;
        }
        v37 += 7;
        BOOL v14 = v38++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_66;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_66:
      uint64_t v42 = 24;
LABEL_67:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SharedChannelActivityResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      if (v9++ >= 9)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_37;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_37;
      case 1u:
        [(id)a1 clearOneofValuesForResponse];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        uint64_t v24 = objc_alloc_init(ChannelActivityActivationResponse);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ChannelActivityActivationResponseReadFrom(v24, a2) & 1) == 0) {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 2u:
        [(id)a1 clearOneofValuesForResponse];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        uint64_t v24 = objc_alloc_init(ChannelActivityDeactivationResponse);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (ChannelActivityDeactivationResponseReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        [(id)a1 clearOneofValuesForResponse];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        uint64_t v24 = objc_alloc_init(ChannelActivityPollingResponse);
        objc_storeStrong((id *)(a1 + 24), v24);
        if PBReaderPlaceMark() && (ChannelActivityPollingResponseReadFrom(v24, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_37;
    }
  }
}

BOOL SharedOwnershipAuthReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
LABEL_24:
          unint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22487EC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityActivationResponseReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x268092000uLL;
  unint64_t v8 = 0x268092000uLL;
  unsigned int v9 = (int *)MEMORY[0x263F62268];
  unint64_t v10 = 0x268092000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 3152)] |= 0x20u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v9) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_75;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_77;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_75:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_77:
        uint64_t v65 = *(int *)(v8 + 3156);
        goto LABEL_103;
      case 2u:
        uint64_t v27 = PBReaderReadData();
        uint64_t v28 = *(int *)(v10 + 3160);
        uint64_t v29 = *(void **)&a1[v28];
        *(void *)&a1[v28] = v27;

        goto LABEL_104;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        a1[*(int *)(v7 + 3152)] |= 2u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v9) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v17 = v31++ >= 9;
              if (v17)
              {
                uint64_t v32 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_81:
        uint64_t v66 = 16;
        goto LABEL_98;
      case 4u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v32 = 0;
        a1[*(int *)(v7 + 3152)] |= 4u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v9) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v32 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v17 = v37++ >= 9;
              if (v17)
              {
                uint64_t v32 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_85:
        uint64_t v66 = 24;
        goto LABEL_98;
      case 5u:
        unint64_t v41 = v7;
        unint64_t v42 = v10;
        unint64_t v43 = v8;
        char v44 = objc_alloc_init(ChannelActivityParticipantPayload);
        [a1 addParticipantPayload:v44];
        if PBReaderPlaceMark() && (ChannelActivityParticipantPayloadReadFrom((uint64_t)v44, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v43;
          unint64_t v10 = v42;
          unint64_t v7 = v41;
LABEL_104:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 6u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 3152)] |= 8u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v22 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v17 = v46++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_89:
        uint64_t v65 = 40;
        goto LABEL_103;
      case 7u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 3152)] |= 0x40u;
        while (2)
        {
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v9) + v53);
            *(void *)(a2 + v52) = v53 + 1;
            v22 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_93:
        uint64_t v65 = 52;
        goto LABEL_103;
      case 8u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v32 = 0;
        a1[*(int *)(v7 + 3152)] |= 1u;
        while (2)
        {
          uint64_t v57 = *v3;
          unint64_t v58 = *(void *)(a2 + v57);
          if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v9) + v58);
            *(void *)(a2 + v57) = v58 + 1;
            v32 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              BOOL v17 = v56++ >= 9;
              if (v17)
              {
                uint64_t v32 = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_97:
        uint64_t v66 = 8;
LABEL_98:
        *(void *)&a1[v66] = v32;
        goto LABEL_104;
      case 9u:
        char v60 = 0;
        unsigned int v61 = 0;
        uint64_t v22 = 0;
        a1[*(int *)(v7 + 3152)] |= 0x10u;
        while (2)
        {
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v9) + v63);
            *(void *)(a2 + v62) = v63 + 1;
            v22 |= (unint64_t)(v64 & 0x7F) << v60;
            if (v64 < 0)
            {
              v60 += 7;
              BOOL v17 = v61++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_102:
        uint64_t v65 = 44;
LABEL_103:
        *(_DWORD *)&a1[v65] = v22;
        goto LABEL_104;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_104;
    }
  }
}

uint64_t SharedChannelActivityRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
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
      if (v9++ >= 9)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_37;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_37;
      case 1u:
        [(id)a1 clearOneofValuesForRequest];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        unint64_t v24 = objc_alloc_init(ChannelActivityActivationRequest);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ChannelActivityActivationRequestReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 2u:
        [(id)a1 clearOneofValuesForRequest];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        unint64_t v24 = objc_alloc_init(ChannelActivityDeactivationRequest);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (ChannelActivityDeactivationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        [(id)a1 clearOneofValuesForRequest];
        *(unsigned char *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        unint64_t v24 = objc_alloc_init(ChannelActivityPollingRequest);
        objc_storeStrong((id *)(a1 + 24), v24);
        if PBReaderPlaceMark() && (ChannelActivityPollingRequestReadFrom((uint64_t)v24, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_37;
    }
  }
}

uint64_t sub_2248828F4()
{
  uint64_t v0 = sub_2248C46A8();
  __swift_allocate_value_buffer(v0, qword_26AC07D28);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AC07D28);
  return sub_2248C4688();
}

Swift::Void __swiftcall SKALocalStatusServer.objcShutdown()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388]();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2248C4938();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2248BA318((uint64_t)v3, &qword_26AC07700);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_2248C4928();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2248C48F8();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268093910;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_224882B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_224882BA4, a4, 0);
}

uint64_t sub_224882BA4()
{
  sub_224882C04();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_224882C04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07588);
  MEMORY[0x270FA5388]();
  uint64_t v3 = &v33[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_2248C43F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2248C4708();
  uint64_t v8 = v0 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_2248BAB80(v8, (uint64_t)v3, &qword_26AC07588);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2248BA318((uint64_t)v3, &qword_26AC07588);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t v9 = *(void **)(v1 + 184);
    uint64_t v10 = (void *)sub_2248C43D8();
    objc_msgSend(v9, sel_unregisterIDSDeviceChangedObserver_, v10);

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  objc_msgSend(*(id *)(v1 + 192), sel_invalidate);
  uint64_t v11 = v1 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects;
  swift_beginAccess();
  uint64_t v12 = *(void *)v11 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(*(void *)v11 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  uint64_t v15 = v14 & *(void *)(*(void *)v11 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  while (1)
  {
    if (v15)
    {
      v15 &= v15 - 1;
      goto LABEL_8;
    }
    int64_t v19 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    if (v19 >= v16) {
      goto LABEL_26;
    }
    uint64_t v20 = *(void *)(v12 + 8 * v19);
    ++v18;
    if (!v20)
    {
      int64_t v18 = v19 + 1;
      if (v19 + 1 >= v16) {
        goto LABEL_26;
      }
      uint64_t v20 = *(void *)(v12 + 8 * v18);
      if (!v20)
      {
        int64_t v18 = v19 + 2;
        if (v19 + 2 >= v16) {
          goto LABEL_26;
        }
        uint64_t v20 = *(void *)(v12 + 8 * v18);
        if (!v20)
        {
          int64_t v18 = v19 + 3;
          if (v19 + 3 >= v16) {
            goto LABEL_26;
          }
          uint64_t v20 = *(void *)(v12 + 8 * v18);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v15 = (v20 - 1) & v20;
LABEL_8:
    v33[8] = 1;
    swift_retain();
    sub_2248C46B8();
    uint64_t result = swift_release();
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v16)
  {
LABEL_26:
    swift_release();
    uint64_t v22 = (uint64_t *)(v1 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    swift_beginAccess();
    uint64_t v23 = *v22;
    uint64_t v24 = v23 + 64;
    uint64_t v25 = 1 << *(unsigned char *)(v23 + 32);
    uint64_t v26 = -1;
    if (v25 < 64) {
      uint64_t v26 = ~(-1 << v25);
    }
    uint64_t v27 = v26 & *(void *)(v23 + 64);
    int64_t v28 = (unint64_t)(v25 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v29 = 0;
    while (1)
    {
      if (v27)
      {
        v27 &= v27 - 1;
      }
      else
      {
        int64_t v30 = v29 + 1;
        if (__OFADD__(v29, 1)) {
          goto LABEL_50;
        }
        if (v30 >= v28) {
          return swift_release();
        }
        uint64_t v31 = *(void *)(v24 + 8 * v30);
        ++v29;
        if (!v31)
        {
          int64_t v29 = v30 + 1;
          if (v30 + 1 >= v28) {
            return swift_release();
          }
          uint64_t v31 = *(void *)(v24 + 8 * v29);
          if (!v31)
          {
            int64_t v29 = v30 + 2;
            if (v30 + 2 >= v28) {
              return swift_release();
            }
            uint64_t v31 = *(void *)(v24 + 8 * v29);
            if (!v31)
            {
              int64_t v29 = v30 + 3;
              if (v30 + 3 >= v28) {
                return swift_release();
              }
              uint64_t v31 = *(void *)(v24 + 8 * v29);
              if (!v31)
              {
                int64_t v32 = v30 + 4;
                if (v32 >= v28) {
                  return swift_release();
                }
                uint64_t v31 = *(void *)(v24 + 8 * v32);
                if (!v31)
                {
                  while (1)
                  {
                    int64_t v29 = v32 + 1;
                    if (__OFADD__(v32, 1)) {
                      goto LABEL_52;
                    }
                    if (v29 >= v28) {
                      return swift_release();
                    }
                    uint64_t v31 = *(void *)(v24 + 8 * v29);
                    ++v32;
                    if (v31) {
                      goto LABEL_47;
                    }
                  }
                }
                int64_t v29 = v32;
              }
            }
          }
        }
LABEL_47:
        uint64_t v27 = (v31 - 1) & v31;
      }
      v33[7] = 1;
      swift_retain();
      sub_2248C46B8();
      uint64_t result = swift_release();
    }
  }
  uint64_t v20 = *(void *)(v12 + 8 * v21);
  if (v20)
  {
    int64_t v18 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v18 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v18 >= v16) {
      goto LABEL_26;
    }
    uint64_t v20 = *(void *)(v12 + 8 * v18);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
  return result;
}

uint64_t sub_22488309C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C4938();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2248C4928();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2248BA318(a1, &qword_26AC07700);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2248C48F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
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

uint64_t sub_224883290()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_224883338;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_224882BA4, v2, 0);
}

uint64_t sub_224883338()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_224883468()
{
  return 0xD000000000000018;
}

uint64_t sub_224883484()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_2248834B4()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_2248834D0()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_224883500()
{
  return *(id *)(v0 + 144);
}

id sub_224883508()
{
  return *(id *)(v0 + 152);
}

id sub_224883510()
{
  return *(id *)(v0 + 160);
}

uint64_t sub_224883518()
{
  return swift_unknownObjectRetain();
}

id sub_224883520()
{
  return *(id *)(v0 + 176);
}

uint64_t sub_224883528()
{
  return swift_unknownObjectRetain();
}

id sub_224883530()
{
  return *(id *)(v0 + 192);
}

uint64_t sub_224883538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2248C43F8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

uint64_t sub_2248835A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  return sub_2248BAB80(v3, a1, &qword_26AC07588);
}

uint64_t sub_224883600(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_2248AC25C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_22488365C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2248836B8()
{
  return sub_22488393C();
}

uint64_t sub_2248836C4(uint64_t a1)
{
  return sub_224883990(a1, &OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
}

uint64_t (*sub_2248836D0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22488372C()
{
  return sub_22488393C();
}

uint64_t sub_224883738(uint64_t a1)
{
  return sub_224883990(a1, &OBJC_IVAR___SKALocalStatusServer_observationTimestamps);
}

uint64_t (*sub_224883744())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2248837A0()
{
  return 0;
}

uint64_t sub_2248837A8()
{
  return swift_retain();
}

uint64_t sub_2248837F4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_224883848())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2248838A4()
{
  return 1;
}

uint64_t sub_2248838AC()
{
  return 259200;
}

uint64_t sub_2248838B8()
{
  return sub_22488393C();
}

uint64_t sub_2248838C4(uint64_t a1)
{
  return sub_224883990(a1, &OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
}

uint64_t (*sub_2248838D0())()
{
  return j__swift_endAccess;
}

uint64_t sub_224883930()
{
  return sub_22488393C();
}

uint64_t sub_22488393C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_224883984(uint64_t a1)
{
  return sub_224883990(a1, &OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
}

uint64_t sub_224883990(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2248839E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_224883A3C()
{
  return 0;
}

id *SKALocalStatusServer.__allocating_init(idsDeviceProvider:)(void *a1)
{
  return SKALocalStatusServer.init(idsDeviceProvider:)(a1);
}

id *SKALocalStatusServer.init(idsDeviceProvider:)(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388]();
  v78 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07588);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_2248C49E8();
  uint64_t v71 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388]();
  v72 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_2248C49D8();
  MEMORY[0x270FA5388]();
  v70 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2248C4778();
  MEMORY[0x270FA5388]();
  v68 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v1[14] = 0xD000000000000018;
  v1[15] = 0x80000002248CE9B0;
  v1[16] = 0xD00000000000001DLL;
  v1[17] = 0x80000002248CE9D0;
  uint64_t v10 = (char *)v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  uint64_t v11 = sub_2248C43F8();
  uint64_t v12 = *(void *)(v11 - 8);
  v75 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 56);
  uint64_t v76 = v11;
  uint64_t v74 = v12 + 56;
  v75(v10, 1, 1);
  *(void *)((char *)v1 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask) = 0;
  *((unsigned char *)v1 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) = 1;
  *(void *)((char *)v1 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds) = 259200;
  uint64_t v13 = (char *)v1 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  sub_2248AC790();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2248CBE90;
  *(void *)(v14 + 32) = sub_2248C4478();
  *(void *)(v14 + 40) = sub_2248C44D8();
  *(void *)(v14 + 48) = sub_2248C44B8();
  uint64_t v15 = qword_26AC07D40;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2248C46A8();
  __swift_project_value_buffer(v16, (uint64_t)qword_26AC07D28);
  swift_bridgeObjectRetain();
  unsigned int v17 = sub_2248C4698();
  os_log_type_t v18 = sub_2248C49C8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    v67 = a1;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v66 = v6;
    uint64_t v22 = v21;
    uint64_t aBlock = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076C8);
    uint64_t v24 = MEMORY[0x22A6193B0](v14, v23);
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v79 = sub_2248AD104(v24, v26, &aBlock);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22480C000, v17, v18, "Loaded XPC invocation classes: [%s]", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v22;
    uint64_t v6 = v66;
    MEMORY[0x22A61A430](v27, -1, -1);
    int64_t v28 = v20;
    a1 = v67;
    MEMORY[0x22A61A430](v28, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_2248BA1D4(0, &qword_26AC07710);
  sub_2248C4768();
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_2248AD9A0(&qword_26AC07708, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076F0);
  sub_2248BA0BC(&qword_26AC076F8, &qword_26AC076F0);
  sub_2248C4A68();
  (*(void (**)(char *, void, uint64_t))(v71 + 104))(v72, *MEMORY[0x263F8F130], v73);
  int64_t v30 = (void *)sub_2248C4A08();
  v2[18] = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076C0);
  sub_2248C44A8();
  sub_2248C4498();
  id v31 = v30;
  v2[19] = sub_2248C4728();
  v2[20] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SKALocalStatusServer.DatabaseDelegate()), sel_init);
  id v32 = objc_msgSend(self, sel_sharedInstance);
  id v33 = objc_msgSend(v32, sel_databaseProvider);

  v2[21] = v33;
  v2[22] = objc_msgSend(objc_allocWithZone((Class)SKADatabaseManager), sel_initWithDatabaseProvider_delegate_, v33, v2[20]);
  v2[23] = a1;
  *(void *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs) = v29;
  id v34 = objc_allocWithZone(MEMORY[0x263F62B70]);
  swift_unknownObjectRetain();
  id v35 = objc_msgSend(v34, sel_init);
  v2[24] = v35;
  objc_msgSend(v35, sel_setDispatchQueue_, v2[18]);
  objc_msgSend(v35, sel_setControlFlags_, 6);
  *(void *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects) = sub_2248846EC(v29, (uint64_t *)&unk_26AC07458, (uint64_t *)&unk_26AC074D0);
  *(void *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects) = sub_2248846EC(v29, &qword_26AC07450, (uint64_t *)&unk_26AC07748);
  *(void *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_observationTimestamps) = sub_2248848DC(v29);
  *(void *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_failedDeliveries) = sub_224884ADC(v29);
  swift_release();
  v86.receiver = v2;
  v86.super_class = ObjectType;
  char v36 = (id *)objc_msgSendSuper2(&v86, sel_init);
  id v37 = v36[19];
  uint64_t v38 = v36;
  id v39 = v37;
  sub_2248C4718();

  id v40 = v36[19];
  sub_2248C4738();

  v84 = sub_2248AC8B4;
  v85 = v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v81 = 1107296256;
  v82 = sub_224885AAC;
  v83 = &block_descriptor;
  unint64_t v41 = _Block_copy(&aBlock);
  unint64_t v42 = v38;
  swift_release();
  id v43 = objc_msgSend(a1, sel_registerIDSDeviceChangedObserver_, v41);
  _Block_release(v41);
  sub_2248C43E8();

  ((void (*)(char *, void, uint64_t, uint64_t))v75)(v6, 0, 1, v76);
  uint64_t v44 = (uint64_t)v42 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_2248AC25C((uint64_t)v6, v44);
  swift_endAccess();
  id v45 = v42[24];
  unsigned int v46 = (void *)sub_2248C47F8();
  v84 = sub_2248AC8D4;
  v85 = v42;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v81 = 1107296256;
  v82 = (uint64_t (*)())sub_224885EC0;
  v83 = &block_descriptor_8;
  uint64_t v47 = _Block_copy(&aBlock);
  unint64_t v48 = v42;
  swift_release();
  objc_msgSend(v45, sel_registerRequestID_options_handler_, v46, 0, v47);
  _Block_release(v47);

  id v49 = v42[24];
  v84 = sub_2248AC8DC;
  v85 = v48;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v81 = 1107296256;
  v82 = (uint64_t (*)())sub_2248883D4;
  v83 = &block_descriptor_11;
  char v50 = _Block_copy(&aBlock);
  unsigned int v51 = v48;
  id v52 = v49;
  swift_release();
  objc_msgSend(v52, sel_setDeviceFoundHandler_, v50);
  _Block_release(v50);

  id v53 = v42[24];
  v84 = sub_2248AC91C;
  v85 = v51;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v81 = 1107296256;
  v82 = (uint64_t (*)())sub_2248883D4;
  v83 = &block_descriptor_14;
  char v54 = _Block_copy(&aBlock);
  char v55 = v51;
  id v56 = v53;
  swift_release();
  objc_msgSend(v56, sel_setDeviceLostHandler_, v54);
  _Block_release(v54);

  id v57 = v42[24];
  v84 = sub_224888BE4;
  v85 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v81 = 1107296256;
  v82 = (uint64_t (*)())sub_224888E8C;
  v83 = &block_descriptor_17;
  unint64_t v58 = _Block_copy(&aBlock);
  id v59 = v57;
  objc_msgSend(v59, sel_activateWithCompletion_, v58);
  _Block_release(v58);

  uint64_t v60 = sub_2248C4938();
  uint64_t v61 = (uint64_t)v78;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v78, 1, 1, v60);
  uint64_t v62 = (void *)swift_allocObject();
  v62[2] = 0;
  v62[3] = 0;
  v62[4] = v55;
  unint64_t v63 = v55;
  sub_22488309C(v61, (uint64_t)&unk_268093930, (uint64_t)v62);
  swift_unknownObjectRelease();

  swift_release();
  return v63;
}

id sub_2248846B8()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

unint64_t sub_2248846EC(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = sub_2248C4BF8();
  uint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v16, (uint64_t)v9, a2);
    unint64_t result = sub_2248AD8B4((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v20) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2248848DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076E8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093C68);
  uint64_t v6 = sub_2248C4BF8();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v12, (uint64_t)v5, &qword_26AC076E8);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_2248AD83C(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v19 = (uint64_t *)(v7[6] + 16 * result);
    *char v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_2248C43C8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_224884ADC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26AC075E0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093BB0);
  uint64_t v6 = sub_2248C4BF8();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v12, (uint64_t)v5, qword_26AC075E0);
    unint64_t result = sub_2248AD75C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
    sub_2248B9E38((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
    unint64_t result = sub_2248B9E38(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_12;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v7;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_224884D0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B90);
  uint64_t v2 = sub_2248C4BF8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v6, (uint64_t)v15, &qword_268093D10);
    unint64_t result = sub_2248AD9E8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2248B9820(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_224884E50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB8);
  uint64_t v6 = sub_2248C4BF8();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v12, (uint64_t)v5, &qword_268093CE0);
    unint64_t result = sub_2248AD8B4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22488504C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2248C4BF8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_2248AD83C(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_224885164(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B98);
  uint64_t v2 = sub_2248C4BF8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2248BAB80(v6, (uint64_t)&v15, &qword_268093BA0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2248AD83C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2248B9820(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22488529C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2248C4938();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = a1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2248BA318((uint64_t)v3, &qword_26AC07700);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_2248C4928();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2248C48F8();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268093D30;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2248854E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_224885500, a4, 0);
}

uint64_t sub_224885500()
{
  sub_224885560();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_224885560()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v46 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = sub_22489104C((unsigned char *)0xD000000000000019, 0x80000002248CF330);
  unint64_t v5 = v4;
  if (v4 >> 62)
  {
    uint64_t v6 = sub_2248C4BC8();
    if (v6)
    {
LABEL_3:
      uint64_t v47 = (void *)MEMORY[0x263F8EE78];
      sub_2248B26D4(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
      {
        __break(1u);
LABEL_34:
        swift_once();
        goto LABEL_30;
      }
      uint64_t v45 = v0;
      uint64_t v7 = 0;
      uint64_t v8 = v47;
      do
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v9 = (id)MEMORY[0x22A619600](v7, v5);
        }
        else {
          id v9 = *(id *)(v5 + 8 * v7 + 32);
        }
        uint64_t v10 = v9;
        id v11 = objc_msgSend(v9, sel_uniqueID);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sub_2248C4808();
          uint64_t v15 = v14;
        }
        else
        {

          uint64_t v13 = 0;
          uint64_t v15 = 0;
        }
        uint64_t v47 = v8;
        unint64_t v17 = v8[2];
        unint64_t v16 = v8[3];
        if (v17 >= v16 >> 1)
        {
          sub_2248B26D4(v16 > 1, v17 + 1, 1);
          uint64_t v8 = v47;
        }
        ++v7;
        v8[2] = v17 + 1;
        uint64_t v18 = &v8[2 * v17];
        v18[4] = v13;
        v18[5] = v15;
      }
      while (v6 != v7);
      swift_bridgeObjectRelease();
      uint64_t v1 = v45;
      uint64_t v19 = v8[2];
      if (v19) {
        goto LABEL_15;
      }
LABEL_26:
      uint64_t v21 = (void *)MEMORY[0x263F8EE78];
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  uint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (!v19) {
    goto LABEL_26;
  }
LABEL_15:
  swift_bridgeObjectRetain();
  BOOL v20 = v8 + 5;
  uint64_t v21 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v23 = *v20;
    if (*v20)
    {
      uint64_t v24 = *(v20 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v21 = sub_2248AC9F4(0, v21[2] + 1, 1, v21);
      }
      unint64_t v26 = v21[2];
      unint64_t v25 = v21[3];
      if (v26 >= v25 >> 1) {
        uint64_t v21 = sub_2248AC9F4((void *)(v25 > 1), v26 + 1, 1, v21);
      }
      v21[2] = v26 + 1;
      BOOL v22 = &v21[2 * v26];
      v22[4] = v24;
      v22[5] = v23;
    }
    v20 += 2;
    --v19;
  }
  while (v19);
  swift_bridgeObjectRelease();
LABEL_27:
  uint64_t v27 = sub_2248B55D8((uint64_t)v21);
  swift_bridgeObjectRelease();
  int64_t v28 = (void *)(v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
  swift_beginAccess();
  uint64_t v29 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_2248B5670(v29);
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_2248A7BD0(v27);
  swift_bridgeObjectRelease();
  LOBYTE(v27) = sub_2248A7F04(v31, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27) {
    return swift_bridgeObjectRelease();
  }
  *int64_t v28 = v8;
  swift_bridgeObjectRelease();
  if (qword_26AC07D40 != -1) {
    goto LABEL_34;
  }
LABEL_30:
  uint64_t v33 = sub_2248C46A8();
  __swift_project_value_buffer(v33, (uint64_t)qword_26AC07D28);
  id v34 = sub_2248C4698();
  os_log_type_t v35 = sub_2248C49C8();
  if (os_log_type_enabled(v34, v35))
  {
    char v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v36 = 0;
    _os_log_impl(&dword_22480C000, v34, v35, "IDSDevices changed", v36, 2u);
    MEMORY[0x22A61A430](v36, -1, -1);
  }

  id v37 = objc_msgSend(*(id *)(v1 + 168), sel_newBackgroundContext);
  swift_beginAccess();
  uint64_t v38 = swift_bridgeObjectRetain();
  size_t v39 = sub_2248B2540(v38);
  swift_bridgeObjectRelease();
  sub_22488CC30(v39, (uint64_t)v37);
  swift_release();
  sub_22488FC20();
  uint64_t v40 = sub_2248C4938();
  uint64_t v41 = (uint64_t)v46;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v46, 1, 1, v40);
  uint64_t v42 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
  id v43 = (void *)swift_allocObject();
  v43[2] = v1;
  v43[3] = v42;
  v43[4] = v1;
  v43[5] = v37;
  swift_retain_n();
  sub_22488309C(v41, (uint64_t)&unk_268093D48, (uint64_t)v43);
  return swift_release();
}

uint64_t sub_224885AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388]();
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2248C4938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  void v13[4] = a5;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22488309C((uint64_t)v11, (uint64_t)&unk_268093D00, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_224885BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[35] = a7;
  v8[36] = a8;
  v8[33] = a5;
  v8[34] = a6;
  v8[32] = a4;
  return MEMORY[0x270FA2498](sub_224885C1C, a4, 0);
}

uint64_t sub_224885C1C()
{
  sub_2248B58A4(v0[33], v0[34]);
  v0[37] = 0;
  return MEMORY[0x270FA2498](sub_224885CAC, 0, 0);
}

uint64_t sub_224885CAC()
{
  uint64_t v1 = (void (*)(void))v0[35];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2248CBEA0;
  v0[30] = 0x73736563637573;
  v0[31] = 0xE700000000000000;
  sub_2248C4AA8();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  sub_224884D0C(inited);
  v1();
  swift_bridgeObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_224885DA8()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = (void (*)(unint64_t, void, void *))v0[35];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2248CBEA0;
  v0[28] = 0x73736563637573;
  v0[29] = 0xE700000000000000;
  sub_2248C4AA8();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 0;
  unint64_t v4 = sub_224884D0C(inited);
  id v5 = v1;
  v2(v4, 0, v1);

  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_224885EC0(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t))(a1 + 32);
  uint64_t v7 = sub_2248C4798();
  if (a3) {
    a3 = sub_2248C4798();
  }
  uint64_t v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_retain();
  v6(v7, a3, sub_2248BA4AC, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_224885FD0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2;
  if (a1)
  {
    uint64_t v7 = (void *)sub_2248C4788();
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v6 = (void *)sub_2248C4788();
LABEL_4:
  if (a3) {
    uint64_t v8 = sub_2248C4308();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  (*(void (**)(uint64_t, void *, void *))(a4 + 16))(a4, v7, v6);
}

uint64_t sub_2248860B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_224886160, 0, 0);
}

uint64_t sub_224886160()
{
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_2248C46A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AC07D28);
  id v3 = v1;
  unint64_t v4 = sub_2248C4698();
  os_log_type_t v5 = sub_2248C49C8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[6];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[5] = v7;
    id v9 = v7;
    sub_2248C4A28();
    *uint64_t v14 = v7;

    _os_log_impl(&dword_22480C000, v4, v5, "receiveStatusCompanionLink deviceFound {device: %@}", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v14, -1, -1);
    MEMORY[0x22A61A430](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[7];
  sub_2248C43A8();
  uint64_t v12 = sub_2248C43C8();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  return MEMORY[0x270FA2498](sub_224886388, v11, 0);
}

uint64_t sub_224886388()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  sub_2248BAB80(v2, v1, &qword_268093940);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2248923FC(v1, v4, v3);
  swift_endAccess();
  sub_2248BA318(v2, &qword_268093940);
  return MEMORY[0x270FA2498](sub_224886478, 0, 0);
}

uint64_t sub_224886478()
{
  uint64_t v15 = v0;
  uint64_t v2 = v0[8];
  unint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  strcpy((char *)v14, "deviceFound[");
  BYTE5(v14[1]) = 0;
  HIWORD(v14[1]) = -5120;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2248B5808(8, v2, v1, v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x22A619320](v5, v7, v9, v11);
  sub_2248C4858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2248C4858();
  uint64_t v12 = v14[1];
  v0[12] = v14[0];
  v0[13] = v12;
  return MEMORY[0x270FA2498](sub_224886590, v3, 0);
}

uint64_t sub_224886590()
{
  sub_2248866F8(v0[12], v0[13]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_22488661C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2248BAB80(a1, (uint64_t)v8, &qword_268093940);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2248923FC((uint64_t)v8, a2, a3);
  return swift_endAccess();
}

uint64_t sub_2248866F8(unint64_t a1, uint64_t a2)
{
  v250[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CA0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v228 = (char *)&v214 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v227 = (uint64_t)&v214 - v7;
  uint64_t v239 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v230 = *(void *)(v239 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v239);
  uint64_t v10 = (uint64_t)&v214 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v223 = (char *)&v214 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v218 = (char *)&v214 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v238 = (uint64_t)&v214 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v246 = (uint64_t *)((char *)&v214 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (uint64_t)&v214 - v19;
  if (qword_26AC07D40 != -1) {
    goto LABEL_147;
  }
  while (1)
  {
    uint64_t v21 = sub_2248C46A8();
    uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26AC07D28);
    swift_bridgeObjectRetain_n();
    uint64_t v245 = v22;
    uint64_t v23 = sub_2248C4698();
    os_log_type_t v24 = sub_2248C49C8();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v224 = v10;
    if (v25)
    {
      uint64_t v26 = v20;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      int64_t v28 = (void *)swift_slowAlloc();
      v250[0] = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      v249 = (void *)sub_2248AD104(a1, a2, (uint64_t *)v250);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22480C000, v23, v24, "reconcileObservations START {reason: %s}", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v28, -1, -1);
      uint64_t v29 = v27;
      uint64_t v20 = v26;
      MEMORY[0x22A61A430](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v30 = v229;
    id v31 = objc_msgSend(*(id *)(v229 + 184), sel_idsDevices);
    if (!v31)
    {
      uint64_t v71 = sub_2248C4648();
      sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
      v72 = (void *)swift_allocError();
      *uint64_t v73 = 0x6369766544736469;
      v73[1] = 0xEA00000000007365;
      (*(void (**)(void *, void, uint64_t))(*(void *)(v71 - 8) + 104))(v73, *MEMORY[0x263F526C0], v71);
      swift_willThrow();
LABEL_32:
      uint64_t v76 = 0;
      goto LABEL_33;
    }
    id v32 = v31;
    sub_2248BA1D4(0, (unint64_t *)&unk_26AC07738);
    a1 = sub_2248C48A8();

    id v33 = objc_msgSend(*(id *)(v30 + 192), sel_activeDevices);
    sub_2248BA1D4(0, &qword_268093B38);
    uint64_t v34 = sub_2248C48A8();

    id v35 = objc_msgSend(*(id *)(v30 + 168), sel_newBackgroundContext);
    char v36 = *(void **)(v30 + 176);
    uint64_t v10 = (uint64_t)v35;
    v250[0] = 0;
    id v37 = objc_msgSend(v36, sel_allSubscribedLocalStatusesInDatabaseContext_error_, v35, v250);
    id v38 = v250[0];
    if (!v37)
    {
      uint64_t v74 = (void *)v10;
      id v75 = v250[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v72 = (void *)sub_2248C4318();

      swift_willThrow();
      goto LABEL_32;
    }
    size_t v39 = v37;
    sub_2248BA1D4(0, &qword_268093CA8);
    unint64_t v40 = sub_2248C48A8();
    id v41 = v38;

    unint64_t v236 = sub_224884E50(MEMORY[0x263F8EE78]);
    if (v40 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v42 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v235 = a1;
    unint64_t v244 = v34;
    id v216 = (id)v10;
    if (v42)
    {
      v233 = 0;
      v237 = 0;
      unint64_t v242 = v40 & 0xC000000000000001;
      v243 = (void (**)(uint64_t, uint64_t, uint64_t))(v230 + 16);
      v241 = (uint64_t *)(v230 + 8);
      uint64_t v43 = 4;
      *(void *)&long long v240 = v40;
      while (1)
      {
        a2 = v43 - 4;
        if (v242) {
          id v44 = (id)MEMORY[0x22A619600](v43 - 4, v40);
        }
        else {
          id v44 = *(id *)(v40 + 8 * v43);
        }
        uint64_t v45 = v44;
        uint64_t v46 = v43 - 3;
        if (__OFADD__(a2, 1)) {
          goto LABEL_141;
        }
        uint64_t v47 = v237;
        sub_2248A67BC(v20);
        v237 = v47;
        if (v47) {
          break;
        }
        a1 = v42;
        unint64_t v48 = *v243;
        uint64_t v49 = (uint64_t)v246;
        uint64_t v10 = v20;
        (*v243)((uint64_t)v246, v20, v239);
        a2 = v45;
        sub_2248BA1C4((uint64_t)v233);
        char v50 = (void *)v236;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v250[0] = v50;
        unint64_t v53 = sub_2248AD8B4(v49);
        uint64_t v54 = v50[2];
        BOOL v55 = (v52 & 1) == 0;
        uint64_t v56 = v54 + v55;
        if (__OFADD__(v54, v55)) {
          goto LABEL_142;
        }
        char v57 = v52;
        if (v50[3] >= v56)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2248B10BC();
            char v50 = v250[0];
          }
        }
        else
        {
          sub_2248AE908(v56, isUniquelyReferenced_nonNull_native);
          unint64_t v58 = v250[0];
          unint64_t v59 = sub_2248AD8B4((uint64_t)v246);
          if ((v57 & 1) != (v60 & 1)) {
            goto LABEL_152;
          }
          unint64_t v53 = v59;
          char v50 = v58;
        }
        swift_bridgeObjectRelease();
        uint64_t v42 = a1;
        if (v57)
        {
          swift_bridgeObjectRetain();
        }
        else
        {
          v50[(v53 >> 6) + 8] |= 1 << v53;
          uint64_t v20 = (uint64_t)v50;
          unint64_t v61 = v50[6] + *(void *)(v230 + 72) * v53;
          swift_bridgeObjectRetain();
          unint64_t v62 = v61;
          char v50 = (void *)v20;
          v48(v62, (uint64_t)v246, v239);
          *(void *)(*(void *)(v20 + 56) + 8 * v53) = MEMORY[0x263F8EE78];
          uint64_t v63 = *(void *)(v20 + 16);
          BOOL v64 = __OFADD__(v63, 1);
          uint64_t v65 = v63 + 1;
          if (v64) {
            goto LABEL_144;
          }
          *(void *)(v20 + 16) = v65;
        }
        uint64_t v66 = v50;
        uint64_t v67 = v50[7];
        unint64_t v236 = (unint64_t)v66;
        uint64_t v68 = swift_bridgeObjectRelease();
        MEMORY[0x22A619380](v68);
        uint64_t v20 = v10;
        if (*(void *)((*(void *)(v67 + 8 * v53) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v67 + 8 * v53) & 0xFFFFFFFFFFFFFF8)
                                                                                                 + 0x18) >> 1)
          sub_2248C48D8();
        sub_2248C48E8();
        sub_2248C48C8();

        uint64_t v10 = (uint64_t)v241;
        uint64_t v69 = (void (*)(uint64_t *, uint64_t))*v241;
        uint64_t v70 = v239;
        ((void (*)(uint64_t *, uint64_t))*v241)(v246, v239);
        v69((uint64_t *)v20, v70);
        ++v43;
        v233 = sub_2248A6B44;
        unint64_t v40 = v240;
        if (v46 == a1) {
          goto LABEL_39;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v72 = v237;
      uint64_t v76 = v233;
LABEL_33:
      id v77 = v72;
      id v78 = v72;
      uint64_t v79 = sub_2248C4698();
      os_log_type_t v80 = sub_2248C49C8();
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v81 = (uint8_t *)swift_slowAlloc();
        v82 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v81 = 138412290;
        id v83 = v72;
        v84 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v250[0] = v84;
        sub_2248C4A28();
        void *v82 = v84;

        _os_log_impl(&dword_22480C000, v79, v80, "reconcileObservations FAILED {error: %@}", v81, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v82, -1, -1);
        MEMORY[0x22A61A430](v81, -1, -1);
      }
      else
      {
      }
      v85 = v76;
      return sub_2248BA1C4((uint64_t)v85);
    }
    v233 = 0;
    v237 = 0;
LABEL_39:
    swift_bridgeObjectRelease();
    v249 = (void *)sub_22488504C(MEMORY[0x263F8EE78], &qword_268093C48);
    unint64_t v87 = v235;
    if (v235 >> 62)
    {
      swift_bridgeObjectRetain();
      a2 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      a2 = *(void *)((v235 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v88 = v244;
    uint64_t v89 = v239;
    if (a2) {
      break;
    }
LABEL_62:
    swift_bridgeObjectRelease();
    uint64_t v113 = *(void *)(v236 + 64);
    unint64_t v217 = v236 + 64;
    uint64_t v114 = 1 << *(unsigned char *)(v236 + 32);
    uint64_t v115 = -1;
    if (v114 < 64) {
      uint64_t v115 = ~(-1 << v114);
    }
    unint64_t v235 = v115 & v113;
    v232 = (uint64_t *)(v229 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
    v231 = (void (**)(char *, uint64_t, uint64_t))(v230 + 16);
    v226 = (void (**)(uint64_t, uint64_t, uint64_t))(v230 + 32);
    v225 = (uint64_t *)(v230 + 8);
    v219 = (void **)&v248;
    int64_t v220 = (unint64_t)(v114 + 63) >> 6;
    int64_t v215 = v220 - 1;
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    *(void *)&long long v116 = 136315138;
    long long v222 = v116;
    uint64_t v221 = MEMORY[0x263F8EE58] + 8;
    *(void *)&long long v116 = 136315394;
    long long v240 = v116;
    while (1)
    {
      a2 = (uint64_t)v228;
      if (v235)
      {
        unint64_t v118 = __clz(__rbit64(v235));
        v235 &= v235 - 1;
        uint64_t v234 = v10;
        unint64_t v119 = v118 | (v10 << 6);
LABEL_70:
        unint64_t v120 = v236;
        (*(void (**)(char *, unint64_t, uint64_t))(v230 + 16))(v228, *(void *)(v236 + 48) + *(void *)(v230 + 72) * v119, v89);
        uint64_t v121 = *(void *)(v120 + 56);
        uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB0);
        *(void *)(a2 + *(int *)(v122 + 48)) = *(void *)(v121 + 8 * v119);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v122 - 8) + 56))(a2, 0, 1, v122);
        swift_bridgeObjectRetain();
        goto LABEL_77;
      }
      int64_t v123 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_145;
      }
      if (v123 >= v220)
      {
        uint64_t v234 = v10;
      }
      else
      {
        unint64_t v124 = *(void *)(v217 + 8 * v123);
        if (v124) {
          goto LABEL_74;
        }
        uint64_t v160 = v10 + 2;
        if (v10 + 2 >= v220) {
          goto LABEL_132;
        }
        unint64_t v124 = *(void *)(v217 + 8 * v160);
        if (v124) {
          goto LABEL_104;
        }
        if (v10 + 3 >= v220)
        {
          uint64_t v234 = v10 + 2;
        }
        else
        {
          unint64_t v124 = *(void *)(v217 + 8 * (v10 + 3));
          if (v124)
          {
            int64_t v123 = v10 + 3;
            goto LABEL_74;
          }
          uint64_t v160 = v10 + 4;
          if (v10 + 4 < v220)
          {
            unint64_t v124 = *(void *)(v217 + 8 * v160);
            if (v124)
            {
LABEL_104:
              int64_t v123 = v160;
LABEL_74:
              unint64_t v235 = (v124 - 1) & v124;
              unint64_t v119 = __clz(__rbit64(v124)) + (v123 << 6);
              uint64_t v234 = v123;
              goto LABEL_70;
            }
            while (1)
            {
              int64_t v123 = v160 + 1;
              if (__OFADD__(v160, 1)) {
                __break(1u);
              }
              if (v123 >= v220) {
                break;
              }
              unint64_t v124 = *(void *)(v217 + 8 * v123);
              ++v160;
              if (v124) {
                goto LABEL_74;
              }
            }
            int64_t v123 = v215;
LABEL_132:
            uint64_t v234 = v123;
            goto LABEL_76;
          }
          uint64_t v234 = v10 + 3;
        }
      }
LABEL_76:
      uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(a2, 1, 1, v125);
      unint64_t v235 = 0;
LABEL_77:
      uint64_t v126 = v227;
      sub_2248BA210(a2, v227, &qword_268093CA0);
      uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 48))(v126, 1, v127) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v211 = sub_2248C4698();
        os_log_type_t v212 = sub_2248C49C8();
        if (os_log_type_enabled(v211, v212))
        {
          v213 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v213 = 0;
          _os_log_impl(&dword_22480C000, v211, v212, "reconcileObservations END", v213, 2u);
          MEMORY[0x22A61A430](v213, -1, -1);
        }

        swift_bridgeObjectRelease();
        v85 = v233;
        return sub_2248BA1C4((uint64_t)v85);
      }
      unint64_t v128 = *(void *)(v126 + *(int *)(v127 + 48));
      (*v226)(v238, v126, v239);
      v248 = (void *)sub_22488504C(MEMORY[0x263F8EE78], &qword_268093CC0);
      if (v128 >> 62) {
        break;
      }
      uint64_t v10 = *(void *)((v128 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v129 = &selRef__setNonWakingTopics_;
      if (v10) {
        goto LABEL_80;
      }
LABEL_117:
      uint64_t v161 = swift_bridgeObjectRelease();
      MEMORY[0x270FA5388](v161);
      *(&v214 - 4) = (uint64_t)&v248;
      *(&v214 - 3) = (uint64_t)&v249;
      v163 = v237;
      uint64_t v162 = v238;
      *(&v214 - 2) = v229;
      *(&v214 - 1) = v162;
      sub_224894B18((void (*)(id *))sub_2248BA274, (uint64_t)(&v214 - 6), v88);
      v165 = v164;
      v237 = v163;
      swift_bridgeObjectRetain_n();
      v166 = sub_2248C4698();
      os_log_type_t v167 = sub_2248C49C8();
      if (os_log_type_enabled(v166, v167))
      {
        uint64_t v168 = swift_slowAlloc();
        v169 = (void *)swift_slowAlloc();
        v250[0] = v169;
        *(_DWORD *)uint64_t v168 = v222;
        swift_bridgeObjectRetain();
        uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
        uint64_t v171 = MEMORY[0x22A6193B0](v165, v170);
        unint64_t v173 = v172;
        swift_bridgeObjectRelease();
        *(void *)(v168 + 4) = sub_2248AD104(v171, v173, (uint64_t *)v250);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22480C000, v166, v167, "reconcileObservations - Observations %s", (uint8_t *)v168, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v169, -1, -1);
        MEMORY[0x22A61A430](v168, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v174 = v232;
      swift_beginAccess();
      if (*(void *)(*v174 + 16) && (sub_2248AD8B4(v238), (v175 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_2248C46D8();
        char v176 = sub_2248ABB68((uint64_t)v250[0], (uint64_t)v165);
        swift_bridgeObjectRelease();
        if (v176)
        {
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v20 = *v225;
          a1 = (unint64_t)v225 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          uint64_t v89 = v239;
        }
        else
        {
          v250[0] = v165;
          sub_2248C46C8();
          swift_bridgeObjectRelease();
          v198 = v218;
          uint64_t v199 = v239;
          (*v231)(v218, v238, v239);
          swift_retain_n();
          v200 = sub_2248C4698();
          os_log_type_t v201 = sub_2248C49C8();
          BOOL v202 = os_log_type_enabled(v200, v201);
          v203 = v225;
          a1 = (unint64_t)v225 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          if (v202)
          {
            uint64_t v204 = swift_slowAlloc();
            v243 = (void (**)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
            v250[0] = v243;
            *(_DWORD *)uint64_t v204 = v240;
            sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
            uint64_t v205 = sub_2248C4C18();
            uint64_t v207 = sub_2248AD104(v205, v206, (uint64_t *)v250);
            v246 = (uint64_t *)a1;
            uint64_t v247 = v207;
            sub_2248C4A28();
            swift_bridgeObjectRelease();
            v208 = (void (*)(void, void))*v203;
            ((void (*)(char *, uint64_t))*v203)(v198, v199);
            uint64_t v20 = (uint64_t)v208;
            *(_WORD *)(v204 + 12) = 2048;
            sub_2248C46D8();
            uint64_t v209 = *(void *)(v247 + 16);
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v247 = v209;
            a1 = (unint64_t)v246;
            sub_2248C4A28();
            swift_release();
            _os_log_impl(&dword_22480C000, v200, v201, "reconcileObservations publishing observations to exisitng subject {identifier: %s, observations.count: %ld}", (uint8_t *)v204, 0x16u);
            v210 = v243;
            swift_arrayDestroy();
            MEMORY[0x22A61A430](v210, -1, -1);
            MEMORY[0x22A61A430](v204, -1, -1);
            swift_release();
          }
          else
          {
            swift_release_n();
            uint64_t v20 = *v203;
            ((void (*)(char *, uint64_t))*v203)(v198, v199);

            swift_release();
          }
          uint64_t v89 = v199;
          unint64_t v88 = v244;
        }
        uint64_t v10 = v234;
      }
      else
      {
        swift_endAccess();
        v250[0] = (id)MEMORY[0x263F8EE78];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07490);
        swift_allocObject();
        uint64_t v177 = sub_2248C46E8();
        v178 = *v231;
        uint64_t v179 = (uint64_t)v223;
        uint64_t v181 = v238;
        uint64_t v180 = v239;
        (*v231)(v223, v238, v239);
        v182 = v232;
        swift_beginAccess();
        swift_retain();
        char v183 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v247 = *v182;
        uint64_t *v182 = 0x8000000000000000;
        sub_2248B04B4(v177, v179, v183, (uint64_t *)&unk_26AC074D0);
        uint64_t *v182 = v247;
        swift_bridgeObjectRelease();
        v184 = (void (**)(uint64_t, uint64_t, uint64_t))*v225;
        v246 = (uint64_t *)((unint64_t)v225 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
        v243 = v184;
        ((void (*)(uint64_t, uint64_t))v184)(v179, v180);
        swift_endAccess();
        v250[0] = v165;
        sub_2248C46C8();
        swift_bridgeObjectRelease();
        uint64_t v185 = v224;
        v178((char *)v224, v181, v180);
        swift_retain_n();
        v186 = sub_2248C4698();
        os_log_type_t v187 = sub_2248C49C8();
        int v188 = v187;
        if (os_log_type_enabled(v186, v187))
        {
          uint64_t v189 = swift_slowAlloc();
          v190 = (void *)swift_slowAlloc();
          v250[0] = v190;
          *(_DWORD *)uint64_t v189 = v240;
          LODWORD(v242) = v188;
          sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
          uint64_t v191 = sub_2248C4C18();
          uint64_t v247 = sub_2248AD104(v191, v192, (uint64_t *)v250);
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          uint64_t v193 = v185;
          uint64_t v194 = v180;
          v195 = v243;
          ((void (*)(uint64_t, uint64_t))v243)(v193, v180);
          uint64_t v20 = (uint64_t)v195;
          *(_WORD *)(v189 + 12) = 2048;
          sub_2248C46D8();
          uint64_t v196 = *(void *)(v247 + 16);
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v247 = v196;
          sub_2248C4A28();
          swift_release();
          _os_log_impl(&dword_22480C000, v186, (os_log_type_t)v242, "reconcileObservations published observations to new subject {identifier: %s, observations.count: %ld}", (uint8_t *)v189, 0x16u);
          swift_arrayDestroy();
          v197 = v190;
          unint64_t v88 = v244;
          MEMORY[0x22A61A430](v197, -1, -1);
          MEMORY[0x22A61A430](v189, -1, -1);
          swift_release();

          uint64_t v89 = v194;
        }
        else
        {
          swift_release_n();
          v117 = v243;
          ((void (*)(uint64_t, uint64_t))v243)(v185, v180);
          uint64_t v20 = (uint64_t)v117;

          swift_release();
          uint64_t v89 = v180;
        }
        uint64_t v10 = v234;
        a1 = (unint64_t)v246;
      }
      ((void (*)(uint64_t, uint64_t))v20)(v238, v89);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    v129 = &selRef__setNonWakingTopics_;
    if (!v10) {
      goto LABEL_117;
    }
LABEL_80:
    unint64_t v242 = v128;
    v243 = (void (**)(uint64_t, uint64_t, uint64_t))(v128 & 0xC000000000000001);
    a2 = 4;
    v241 = (uint64_t *)v10;
    while (2)
    {
      uint64_t v131 = a2 - 4;
      if (v243)
      {
        id v132 = (id)MEMORY[0x22A619600](a2 - 4, v128);
        uint64_t v133 = a2 - 3;
        if (__OFADD__(v131, 1)) {
          goto LABEL_137;
        }
LABEL_88:
        v246 = (uint64_t *)v133;
        id v134 = v132;
        v135 = sub_2248C4698();
        os_log_type_t v136 = sub_2248C49C8();
        uint64_t v20 = v136;
        if (os_log_type_enabled(v135, v136))
        {
          uint64_t v137 = swift_slowAlloc();
          v138 = (void *)swift_slowAlloc();
          v139 = (void *)swift_slowAlloc();
          v250[0] = v139;
          *(_DWORD *)uint64_t v137 = v240;
          id v140 = [v134 v129[337]];
          uint64_t v141 = sub_2248C4808();
          unint64_t v143 = v142;

          *(void *)(v137 + 4) = sub_2248AD104(v141, v143, (uint64_t *)v250);
          v129 = &selRef__setNonWakingTopics_;
          swift_bridgeObjectRelease();
          *(_WORD *)(v137 + 12) = 2112;
          *(void *)(v137 + 14) = v134;
          void *v138 = v134;

          _os_log_impl(&dword_22480C000, v135, (os_log_type_t)v20, "status.idsIdentifier %s, status %@", (uint8_t *)v137, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v138, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v139, -1, -1);
          MEMORY[0x22A61A430](v137, -1, -1);
        }
        else
        {
        }
        uint64_t v10 = (uint64_t)[v134 v129[337]];
        a1 = sub_2248C4808();
        uint64_t v145 = v144;

        id v146 = v134;
        char v147 = swift_isUniquelyReferenced_nonNull_native();
        v148 = v248;
        v250[0] = v248;
        v248 = (void *)0x8000000000000000;
        unint64_t v150 = sub_2248AD83C(a1, v145);
        uint64_t v151 = v148[2];
        BOOL v152 = (v149 & 1) == 0;
        uint64_t v153 = v151 + v152;
        if (__OFADD__(v151, v152)) {
          goto LABEL_138;
        }
        uint64_t v20 = v149;
        if (v148[3] >= v153)
        {
          if (v147)
          {
            v156 = v250[0];
            if ((v149 & 1) == 0) {
              goto LABEL_98;
            }
          }
          else
          {
            sub_2248B0F10(&qword_268093CC0);
            v156 = v250[0];
            if ((v20 & 1) == 0) {
              goto LABEL_98;
            }
          }
        }
        else
        {
          sub_2248AE5FC(v153, v147, &qword_268093CC0);
          unint64_t v154 = sub_2248AD83C(a1, v145);
          if ((v20 & 1) != (v155 & 1)) {
            goto LABEL_151;
          }
          unint64_t v150 = v154;
          v156 = v250[0];
          if ((v20 & 1) == 0)
          {
LABEL_98:
            v156[(v150 >> 6) + 8] |= 1 << v150;
            v157 = (unint64_t *)(v156[6] + 16 * v150);
            unint64_t *v157 = a1;
            v157[1] = v145;
            *(void *)(v156[7] + 8 * v150) = v146;
            uint64_t v158 = v156[2];
            BOOL v64 = __OFADD__(v158, 1);
            uint64_t v159 = v158 + 1;
            if (v64) {
              goto LABEL_139;
            }
            v156[2] = v159;
            swift_bridgeObjectRetain();
            goto LABEL_82;
          }
        }
        uint64_t v130 = v156[7];

        *(void *)(v130 + 8 * v150) = v146;
        v129 = &selRef__setNonWakingTopics_;
LABEL_82:
        uint64_t v10 = (uint64_t)v248;
        v248 = v156;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++a2;
        unint64_t v128 = v242;
        unint64_t v88 = v244;
        if (v246 == v241) {
          goto LABEL_117;
        }
        continue;
      }
      break;
    }
    id v132 = *(id *)(v128 + 8 * a2);
    uint64_t v133 = a2 - 3;
    if (!__OFADD__(v131, 1)) {
      goto LABEL_88;
    }
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    swift_once();
  }
  v246 = (uint64_t *)(v87 & 0xC000000000000001);
  uint64_t v90 = 4;
  while (1)
  {
    if (v246) {
      id v91 = (id)MEMORY[0x22A619600](v90 - 4, v87);
    }
    else {
      id v91 = *(id *)(v87 + 8 * v90);
    }
    v92 = v91;
    uint64_t v10 = v90 - 3;
    if (__OFADD__(v90 - 4, 1)) {
      goto LABEL_140;
    }
    id v93 = objc_msgSend(v91, sel_uniqueID);
    if (v93) {
      break;
    }

LABEL_44:
    ++v90;
    uint64_t v89 = v239;
    if (v10 == a2) {
      goto LABEL_62;
    }
  }
  v94 = v93;
  uint64_t v95 = sub_2248C4808();
  a1 = v96;

  id v97 = v92;
  char v98 = swift_isUniquelyReferenced_nonNull_native();
  v99 = v249;
  v250[0] = v249;
  v249 = (void *)0x8000000000000000;
  unint64_t v101 = sub_2248AD83C(v95, a1);
  uint64_t v102 = v99[2];
  BOOL v103 = (v100 & 1) == 0;
  uint64_t v104 = v102 + v103;
  if (__OFADD__(v102, v103)) {
    goto LABEL_143;
  }
  uint64_t v20 = v100;
  if (v99[3] >= v104)
  {
    if (v98)
    {
      v107 = v250[0];
      if (v100) {
        goto LABEL_58;
      }
    }
    else
    {
      sub_2248B0F10(&qword_268093C48);
      v107 = v250[0];
      if (v20) {
        goto LABEL_58;
      }
    }
LABEL_54:
    v107[(v101 >> 6) + 8] |= 1 << v101;
    v108 = (uint64_t *)(v107[6] + 16 * v101);
    uint64_t *v108 = v95;
    v108[1] = a1;
    *(void *)(v107[7] + 8 * v101) = v97;
    uint64_t v109 = v107[2];
    BOOL v64 = __OFADD__(v109, 1);
    uint64_t v110 = v109 + 1;
    if (v64) {
      goto LABEL_146;
    }
    v107[2] = v110;
    swift_bridgeObjectRetain();
LABEL_59:
    v249 = v107;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v88 = v244;
    unint64_t v87 = v235;
    goto LABEL_44;
  }
  sub_2248AE5FC(v104, v98, &qword_268093C48);
  unint64_t v105 = sub_2248AD83C(v95, a1);
  if ((v20 & 1) == (v106 & 1))
  {
    unint64_t v101 = v105;
    v107 = v250[0];
    if ((v20 & 1) == 0) {
      goto LABEL_54;
    }
LABEL_58:
    uint64_t v111 = v107[7];
    uint64_t v112 = 8 * v101;

    *(void *)(v111 + v112) = v97;
    goto LABEL_59;
  }
LABEL_151:
  sub_2248C4C58();
  __break(1u);
LABEL_152:
  uint64_t result = sub_2248C4C58();
  __break(1u);
  return result;
}

void sub_2248883D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_22488843C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a1, sel_idsDeviceIdentifier);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_2248C4808();
    uint64_t v15 = v14;

    uint64_t v16 = sub_2248C4938();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = a1;
    v17[5] = a2;
    v17[6] = v13;
    v17[7] = v15;
    id v18 = a1;
    swift_retain();
    sub_22488309C((uint64_t)v10, a4, (uint64_t)v17);
    swift_release();
  }
  else
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2248C46A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_26AC07D28);
    id v20 = a1;
    v26[0] = (id)sub_2248C4698();
    os_log_type_t v21 = sub_2248C49B8();
    if (os_log_type_enabled((os_log_t)v26[0], v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      v26[1] = v20;
      id v24 = v20;
      sub_2248C4A28();
      *uint64_t v23 = v20;

      _os_log_impl(&dword_22480C000, (os_log_t)v26[0], v21, a5, v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v23, -1, -1);
      MEMORY[0x22A61A430](v22, -1, -1);
    }
    else
    {

      id v25 = v26[0];
    }
  }
}

uint64_t sub_224888714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248887BC, 0, 0);
}

uint64_t sub_2248887BC()
{
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_2248C46A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AC07D28);
  id v3 = v1;
  id v4 = sub_2248C4698();
  os_log_type_t v5 = sub_2248C49C8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[6];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[5] = v7;
    id v9 = v7;
    sub_2248C4A28();
    *uint64_t v14 = v7;

    _os_log_impl(&dword_22480C000, v4, v5, "receiveStatusCompanionLink deviceLost {device: %@}", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v14, -1, -1);
    MEMORY[0x22A61A430](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[7];
  uint64_t v12 = sub_2248C43C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  return MEMORY[0x270FA2498](sub_2248889DC, v11, 0);
}

uint64_t sub_2248889DC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  sub_2248BAB80(v2, v1, &qword_268093940);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2248923FC(v1, v4, v3);
  swift_endAccess();
  sub_2248BA318(v2, &qword_268093940);
  return MEMORY[0x270FA2498](sub_224888ACC, 0, 0);
}

uint64_t sub_224888ACC()
{
  uint64_t v2 = v0[8];
  unint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2248B5808(8, v2, v1, v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x22A619320](v5, v7, v9, v11);
  sub_2248C4858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2248C4858();
  v0[12] = 0x6F4C656369766564;
  v0[13] = 0xEB000000005B7473;
  return MEMORY[0x270FA2498](sub_2248BAC90, v3, 0);
}

void sub_224888BE4(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2248C46A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_26AC07D28);
    id v4 = a1;
    id v5 = a1;
    oslog = sub_2248C4698();
    os_log_type_t v6 = sub_2248C49A8();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      id v9 = a1;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_2248C4A28();
      *uint64_t v8 = v14;

      _os_log_impl(&dword_22480C000, oslog, v6, "receiveStatusCompanionLink activate FAILED {error: %@}", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v8, -1, -1);
      MEMORY[0x22A61A430](v7, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2248C46A8();
    __swift_project_value_buffer(v10, (uint64_t)qword_26AC07D28);
    oslog = sub_2248C4698();
    os_log_type_t v11 = sub_2248C49C8();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22480C000, oslog, v11, "receiveStatusCompanionLink activate SUCCESS", v12, 2u);
      MEMORY[0x22A61A430](v12, -1, -1);
    }
  }
}

void sub_224888E8C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_224888EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  void *v6 = v4;
  v6[1] = sub_2248BAC98;
  v6[9] = a4;
  return MEMORY[0x270FA2498](sub_224888FC4, a4, 0);
}

uint64_t sub_224888FA4()
{
  *(void *)(v1 + 72) = v0;
  return MEMORY[0x270FA2498](sub_224888FC4, v0, 0);
}

uint64_t sub_224888FC4()
{
  uint64_t v1 = v0;
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2248C46A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AC07D28);
  uint64_t v3 = sub_2248C4698();
  os_log_type_t v4 = sub_2248C49C8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v3, v4, "runStartOperations START", v5, 2u);
    MEMORY[0x22A61A430](v5, -1, -1);
  }
  os_log_type_t v6 = v0 + 9;

  uint64_t v7 = (__CFString *)sub_2248C47F8();
  uint64_t v8 = (__CFString *)sub_2248C47F8();
  CFPropertyListRef v9 = CFPreferencesCopyAppValue(v7, v8);

  if (v9)
  {
    v0[2] = v9;
    if (swift_dynamicCast())
    {
      uint64_t v10 = *v6;
      uint64_t v11 = OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds;
      *(void *)(*v6 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds) = v0[5];
      swift_retain();
      uint64_t v12 = sub_2248C4698();
      os_log_type_t v13 = sub_2248C49C8();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134217984;
        v0[2] = *(void *)(v10 + v11);
        sub_2248C4A28();
        swift_release();
        _os_log_impl(&dword_22480C000, v12, v13, "Set custom screen off status timeout: %ld seconds", v14, 0xCu);
        MEMORY[0x22A61A430](v14, -1, -1);
      }
      else
      {

        swift_release();
      }
    }
  }
  id v41 = v0 + 9;
  id v15 = objc_msgSend(*(id *)(*v6 + 168), sel_newBackgroundContext);
  unint64_t v16 = sub_22489104C((unsigned char *)0xD000000000000014, 0x80000002248CF240);
  unint64_t v17 = v16;
  if (v16 >> 62)
  {
    uint64_t v18 = sub_2248C4BC8();
    unint64_t v40 = v15;
    if (v18) {
      goto LABEL_12;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
    goto LABEL_26;
  }
  uint64_t v18 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v40 = v15;
  if (!v18) {
    goto LABEL_25;
  }
LABEL_12:
  uint64_t v42 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2248B26D4(0, v18 & ~(v18 >> 63), 0);
  if (v18 < 0)
  {
    __break(1u);
    return result;
  }
  size_t v39 = v1;
  uint64_t v20 = 0;
  uint64_t v21 = v42;
  do
  {
    if ((v17 & 0xC000000000000001) != 0) {
      id v22 = (id)MEMORY[0x22A619600](v20, v17);
    }
    else {
      id v22 = *(id *)(v17 + 8 * v20 + 32);
    }
    uint64_t v23 = v22;
    id v24 = objc_msgSend(v22, sel_uniqueID);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = sub_2248C4808();
      uint64_t v28 = v27;
    }
    else
    {

      uint64_t v26 = 0;
      uint64_t v28 = 0;
    }
    unint64_t v30 = *(void *)(v42 + 16);
    unint64_t v29 = *(void *)(v42 + 24);
    if (v30 >= v29 >> 1) {
      sub_2248B26D4(v29 > 1, v30 + 1, 1);
    }
    ++v20;
    *(void *)(v42 + 16) = v30 + 1;
    uint64_t v31 = v42 + 16 * v30;
    *(void *)(v31 + 32) = v26;
    *(void *)(v31 + 40) = v28;
  }
  while (v18 != v20);
  swift_bridgeObjectRelease();
  uint64_t v1 = v39;
LABEL_26:
  id v32 = (void *)(*v41 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
  swift_beginAccess();
  *id v32 = v21;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v33 = swift_bridgeObjectRetain();
  size_t v34 = sub_2248B2540(v33);
  swift_bridgeObjectRelease();
  sub_22488CC30(v34, (uint64_t)v40);
  swift_release();
  sub_22488FEB4(v40, 0x68636E75614CLL, 0xE600000000000000);
  swift_release();
  id v35 = sub_2248C4698();
  os_log_type_t v36 = sub_2248C49C8();
  if (os_log_type_enabled(v35, v36))
  {
    id v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v37 = 0;
    _os_log_impl(&dword_22480C000, v35, v36, "runStartOperations END", v37, 2u);
    MEMORY[0x22A61A430](v37, -1, -1);
  }

  id v38 = (uint64_t (*)(void))v1[1];
  return v38();
}

uint64_t sub_224889674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[20] = a6;
  v7[21] = v6;
  v7[18] = a4;
  v7[19] = a5;
  v7[16] = a2;
  v7[17] = a3;
  v7[15] = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076A0);
  v7[22] = v8;
  v7[23] = *(void *)(v8 - 8);
  v7[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076D8);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  v7[27] = v9;
  v7[28] = *(void *)(v9 - 8);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  uint64_t v10 = sub_2248C45D8();
  v7[32] = v10;
  v7[33] = *(void *)(v10 - 8);
  v7[34] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  v7[35] = v11;
  v7[36] = *(void *)(v11 - 8);
  v7[37] = swift_task_alloc();
  v7[38] = swift_task_alloc();
  v7[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248898D8, v6, 0);
}

uint64_t sub_2248898D8()
{
  uint64_t v117 = v0;
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v5 = sub_2248C46A8();
  *(void *)(v0 + 320) = __swift_project_value_buffer(v5, (uint64_t)qword_26AC07D28);
  uint64_t v6 = *(NSObject **)(v3 + 16);
  *(void *)(v0 + 328) = v6;
  *(void *)(v0 + 336) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  os_log_t log = v6;
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(v1, v4, v2);
  uint64_t v7 = sub_2248C4698();
  os_log_type_t v8 = sub_2248C49C8();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 312);
  uint64_t v12 = *(void *)(v0 + 280);
  uint64_t v11 = *(void *)(v0 + 288);
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v115 = v14;
    sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
    uint64_t v15 = sub_2248C4C18();
    *(void *)(v0 + 112) = sub_2248AD104(v15, v16, &v115);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v10, v12);
    _os_log_impl(&dword_22480C000, v7, v8, "Publish START {key: %s}", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v14, -1, -1);
    MEMORY[0x22A61A430](v13, -1, -1);
  }
  else
  {
    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(*(void *)(v0 + 312), *(void *)(v0 + 280));
  }

  *(void *)(v0 + 344) = v17;
  uint64_t v18 = *(void *)(v0 + 272);
  unint64_t v20 = *(void *)(v0 + 144);
  uint64_t v19 = *(void *)(v0 + 152);
  uint64_t v21 = *(void *)(v0 + 136);
  id v22 = objc_msgSend(*(id *)(*(void *)(v0 + 168) + 168), sel_newBackgroundContext);
  *(void *)(v0 + 352) = v22;
  LSKStatusOptions.targetDeviceFlags.getter(v18);
  char v23 = sub_22488BDF4(v21, v20, v19, (uint64_t)v22, v18);
  if ((v23 & 1) == 0)
  {
    unint64_t v30 = (uint64_t *)(*(void *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    swift_beginAccess();
    uint64_t v31 = *v30;
    if (!*(void *)(v31 + 16) || (unint64_t v32 = sub_2248AD8B4(*(void *)(v0 + 152)), (v33 & 1) == 0))
    {
      uint64_t v47 = *(void *)(v0 + 232);
      uint64_t v48 = *(void *)(v0 + 152);
      swift_endAccess();
      sub_2248914E8(v48, (uint64_t)v22, v47);
      uint64_t v49 = *(void *)(v0 + 128);
      (*(void (**)(void, void, void))(*(void *)(v0 + 224) + 32))(*(void *)(v0 + 248), *(void *)(v0 + 232), *(void *)(v0 + 216));
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 1, 1, v50);
LABEL_24:
      (*(void (**)(void, void, void))(v0 + 328))(*(void *)(v0 + 296), *(void *)(v0 + 152), *(void *)(v0 + 280));
      uint64_t v56 = sub_2248C4698();
      os_log_type_t v57 = sub_2248C49C8();
      BOOL v58 = os_log_type_enabled(v56, v57);
      unint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
      uint64_t v60 = *(void *)(v0 + 296);
      uint64_t v61 = *(void *)(v0 + 272);
      uint64_t v62 = *(void *)(v0 + 280);
      uint64_t v64 = *(void *)(v0 + 256);
      uint64_t v63 = *(void *)(v0 + 264);
      if (v58)
      {
        type = *(void **)(v0 + 352);
        uint64_t v114 = *(void *)(v0 + 272);
        uint64_t v65 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        uint64_t v115 = v66;
        *(_DWORD *)uint64_t v65 = 136315138;
        sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
        uint64_t v67 = sub_2248C4C18();
        *(void *)(v0 + 72) = sub_2248AD104(v67, v68, &v115);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        v59(v60, v62);
        _os_log_impl(&dword_22480C000, v56, v57, "Publish END {key: %s}", v65, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v66, -1, -1);
        MEMORY[0x22A61A430](v65, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v114, v64);
      }
      else
      {

        v59(v60, v62);
        (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v64);
      }
      (*(void (**)(void, void, void))(*(void *)(v0 + 224) + 32))(*(void *)(v0 + 120), *(void *)(v0 + 248), *(void *)(v0 + 216));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v69 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_7;
    }
    uint64_t v34 = *(void *)(v0 + 240);
    uint64_t v35 = *(void *)(v0 + 216);
    uint64_t v36 = *(void *)(v0 + 224);
    uint64_t v37 = *(void *)(*(void *)(v31 + 56) + 8 * v32);
    swift_endAccess();
    swift_retain();
    sub_2248C46D8();
    sub_2248C46D8();
    uint64_t v38 = sub_2248C4428();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    uint64_t v39 = *(void *)(v38 + 16);
    swift_bridgeObjectRelease();
    uint64_t v40 = *(void *)(v0 + 200);
    if (v39)
    {
      uint64_t v42 = *(void *)(v0 + 184);
      uint64_t v41 = *(void *)(v0 + 192);
      uint64_t v43 = *(void *)(v0 + 176);
      *(void *)(v0 + 64) = v37;
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076B0);
      uint64_t v45 = sub_2248BA0BC(&qword_26AC076A8, (uint64_t *)&unk_26AC076B0);
      MEMORY[0x22A6191F0](v44, v45);
      sub_2248BA0BC((unint64_t *)&unk_26AC07690, &qword_26AC076A0);
      sub_2248BA0BC(&qword_26AC075A8, &qword_26AC075B0);
      sub_2248BA0BC(&qword_26AC075A0, &qword_26AC075B0);
      sub_2248C4968();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v40, 0, 1, v46);
    }
    else
    {
      swift_release();
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v40, 1, 1, v54);
    }
    uint64_t v55 = *(void *)(v0 + 200);
LABEL_23:
    sub_2248BA210(v55, *(void *)(v0 + 128), (uint64_t *)&unk_26AC076D8);
    goto LABEL_24;
  }
  uint64_t v26 = *(void *)(v0 + 280);
  uint64_t v25 = *(void *)(v0 + 288);
  uint64_t v27 = *(void *)(v0 + 152);
  sub_22488C8B8(v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07758);
  unint64_t v28 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_2248CBEA0;
  ((void (*)(unint64_t, uint64_t, uint64_t))log)(v29 + v28, v27, v26);
  sub_22488CC30(v29, (uint64_t)v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22488FC20();
  uint64_t v115 = 0x5B6873696C627550;
  unint64_t v116 = 0xE800000000000000;
  *(void *)(v0 + 360) = sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
  sub_2248C4C18();
  sub_2248C4858();
  swift_bridgeObjectRelease();
  sub_2248C4858();
  uint64_t v51 = sub_22488FEB4(v22, v115, v116);
  *(void *)(v0 + 368) = v51;
  uint64_t v52 = v51;
  swift_bridgeObjectRelease();
  if (v52)
  {
    unint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v53;
    *unint64_t v53 = v0;
    v53[1] = sub_22488A934;
    return MEMORY[0x270FA1FD0]();
  }
  unint64_t v70 = sub_22489104C((unsigned char *)0xD000000000000017, 0x80000002248CEAE0);
  if (v70 >> 62) {
    uint64_t v71 = sub_2248C4BC8();
  }
  else {
    uint64_t v71 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v72 = *(void *)(v0 + 304);
  uint64_t v73 = *(void *)(v0 + 280);
  uint64_t v74 = *(void *)(v0 + 152);
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t, uint64_t))log)(v72, v74, v73);
  id v75 = sub_2248C4698();
  os_log_type_t v76 = sub_2248C49C8();
  BOOL v77 = os_log_type_enabled(v75, v76);
  uint64_t v78 = *(void *)(v0 + 304);
  uint64_t v79 = *(void *)(v0 + 280);
  if (v77)
  {
    uint64_t v110 = v71;
    uint64_t v80 = swift_slowAlloc();
    uint64_t v111 = swift_slowAlloc();
    uint64_t v115 = v111;
    *(_DWORD *)uint64_t v80 = 136315394;
    uint64_t v81 = sub_2248C4C18();
    *(void *)(v0 + 88) = sub_2248AD104(v81, v82, &v115);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    v17(v78, v79);
    *(_WORD *)(v80 + 12) = 2080;
    *(void *)(v0 + 96) = v110;
    uint64_t v83 = sub_2248C4C18();
    *(void *)(v0 + 104) = sub_2248AD104(v83, v84, &v115);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22480C000, v75, v76, "No delivery task for publish. No IDS devices? {key: %s, idsDevices.count: %s}", (uint8_t *)v80, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v111, -1, -1);
    MEMORY[0x22A61A430](v80, -1, -1);
  }
  else
  {
    v17(*(void *)(v0 + 304), *(void *)(v0 + 280));
  }

  v85 = (uint64_t *)(*(void *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
  swift_beginAccess();
  uint64_t v86 = *v85;
  if (*(void *)(v86 + 16))
  {
    unint64_t v87 = sub_2248AD8B4(*(void *)(v0 + 152));
    if (v88)
    {
      uint64_t v89 = *(void *)(v0 + 240);
      uint64_t v90 = *(void *)(v0 + 216);
      uint64_t v91 = *(void *)(v0 + 224);
      uint64_t v92 = *(void *)(*(void *)(v86 + 56) + 8 * v87);
      swift_endAccess();
      swift_retain();
      sub_2248C46D8();
      sub_2248C46D8();
      uint64_t v93 = sub_2248C4428();
      (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v89, v90);
      uint64_t v94 = *(void *)(v93 + 16);
      swift_bridgeObjectRelease();
      uint64_t v95 = *(void *)(v0 + 208);
      if (v94)
      {
        uint64_t v97 = *(void *)(v0 + 184);
        uint64_t v96 = *(void *)(v0 + 192);
        uint64_t v98 = *(void *)(v0 + 176);
        *(void *)(v0 + 80) = v92;
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076B0);
        uint64_t v100 = sub_2248BA0BC(&qword_26AC076A8, (uint64_t *)&unk_26AC076B0);
        MEMORY[0x22A6191F0](v99, v100);
        sub_2248BA0BC((unint64_t *)&unk_26AC07690, &qword_26AC076A0);
        sub_2248BA0BC(&qword_26AC075A8, &qword_26AC075B0);
        sub_2248BA0BC(&qword_26AC075A0, &qword_26AC075B0);
        sub_2248C4968();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v96, v98);
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v95, 0, 1, v101);
      }
      else
      {
        swift_release();
        uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v95, 1, 1, v109);
      }
      uint64_t v55 = *(void *)(v0 + 208);
      goto LABEL_23;
    }
  }
  uint64_t v102 = *(void **)(v0 + 352);
  uint64_t v103 = *(void *)(v0 + 272);
  uint64_t v104 = *(void *)(v0 + 256);
  uint64_t v105 = *(void *)(v0 + 264);
  swift_endAccess();
  uint64_t v115 = 0;
  unint64_t v116 = 0xE000000000000000;
  sub_2248C4AE8();
  swift_bridgeObjectRelease();
  uint64_t v115 = 0xD000000000000014;
  unint64_t v116 = 0x80000002248CEB00;
  sub_2248C4C18();
  sub_2248C4858();
  swift_bridgeObjectRelease();
  uint64_t v106 = v115;
  unint64_t v107 = v116;
  sub_2248AD94C();
  swift_allocError();
  *(void *)uint64_t v108 = v106;
  *(void *)(v108 + 8) = v107;
  *(unsigned char *)(v108 + 16) = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v103, v104);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v69 = *(uint64_t (**)(void))(v0 + 8);
LABEL_7:
  return v69();
}

uint64_t sub_22488A934()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22488AA44, v1, 0);
}

uint64_t sub_22488AA44()
{
  uint64_t v42 = v0;
  swift_release();
  uint64_t v1 = (uint64_t *)(*(void *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_2248AD8B4(*(void *)(v0 + 152)), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 216);
    uint64_t v6 = *(void *)(v0 + 224);
    uint64_t v8 = *(void *)(*(void *)(v2 + 56) + 8 * v3);
    swift_endAccess();
    swift_retain();
    sub_2248C46D8();
    sub_2248C46D8();
    uint64_t v9 = sub_2248C4428();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v10 = *(void *)(v9 + 16);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v0 + 208);
    if (v10)
    {
      uint64_t v12 = *(void *)(v0 + 184);
      uint64_t v13 = *(void *)(v0 + 192);
      uint64_t v14 = *(void *)(v0 + 176);
      *(void *)(v0 + 80) = v8;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076B0);
      uint64_t v16 = sub_2248BA0BC(&qword_26AC076A8, (uint64_t *)&unk_26AC076B0);
      MEMORY[0x22A6191F0](v15, v16);
      sub_2248BA0BC((unint64_t *)&unk_26AC07690, &qword_26AC076A0);
      sub_2248BA0BC(&qword_26AC075A8, &qword_26AC075B0);
      sub_2248BA0BC(&qword_26AC075A0, &qword_26AC075B0);
      sub_2248C4968();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
    }
    else
    {
      swift_release();
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
    }
    sub_2248BA210(*(void *)(v0 + 208), *(void *)(v0 + 128), (uint64_t *)&unk_26AC076D8);
    (*(void (**)(void, void, void))(v0 + 328))(*(void *)(v0 + 296), *(void *)(v0 + 152), *(void *)(v0 + 280));
    uint64_t v25 = sub_2248C4698();
    os_log_type_t v26 = sub_2248C49C8();
    BOOL v27 = os_log_type_enabled(v25, v26);
    unint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    uint64_t v29 = *(void *)(v0 + 296);
    uint64_t v30 = *(void *)(v0 + 272);
    uint64_t v31 = *(void *)(v0 + 280);
    uint64_t v33 = *(void *)(v0 + 256);
    uint64_t v32 = *(void *)(v0 + 264);
    if (v27)
    {
      uint64_t v39 = *(void **)(v0 + 352);
      uint64_t v40 = *(void *)(v0 + 272);
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v41[0] = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
      uint64_t v36 = sub_2248C4C18();
      *(void *)(v0 + 72) = sub_2248AD104(v36, v37, v41);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      v28(v29, v31);
      _os_log_impl(&dword_22480C000, v25, v26, "Publish END {key: %s}", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v35, -1, -1);
      MEMORY[0x22A61A430](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v40, v33);
    }
    else
    {

      v28(v29, v31);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v33);
    }
    (*(void (**)(void, void, void))(*(void *)(v0 + 224) + 32))(*(void *)(v0 + 120), *(void *)(v0 + 248), *(void *)(v0 + 216));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 352);
    uint64_t v19 = *(void *)(v0 + 272);
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v21 = *(void *)(v0 + 264);
    swift_endAccess();
    sub_2248C4AE8();
    swift_bridgeObjectRelease();
    v41[0] = 0xD000000000000014;
    v41[1] = 0x80000002248CEB00;
    sub_2248C4C18();
    sub_2248C4858();
    swift_bridgeObjectRelease();
    sub_2248AD94C();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000014;
    *(void *)(v22 + 8) = 0x80000002248CEB00;
    *(unsigned char *)(v22 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t LSKStatusOptions.targetDeviceFlags.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07508);
  uint64_t v2 = MEMORY[0x270FA5388](v153);
  uint64_t v126 = (BOOL *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v125 = (BOOL *)&v120 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v131 = (BOOL *)&v120 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v144 = (BOOL *)&v120 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (BOOL *)&v120 - v10;
  uint64_t v11 = sub_2248C45D8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (BOOL *)&v120 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v130 = (char *)&v120 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  char v23 = (BOOL *)&v120 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v129 = (char *)&v120 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  unint64_t v28 = (BOOL *)&v120 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  unint64_t v150 = (char *)&v120 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v145 = (char *)&v120 - v32;
  MEMORY[0x270FA5388](v31);
  id v134 = (BOOL *)&v120 - v33;
  uint64_t v147 = sub_2248C44E8();
  uint64_t v34 = *(void *)(v147 - 8);
  MEMORY[0x270FA5388](v147);
  id v146 = (char *)&v120 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&qword_26AC07540);
  uint64_t v151 = v12;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_2248CBEA0;
  sub_2248C45A8();
  uint64_t v154 = v36;
  uint64_t v37 = sub_2248AD9A0((unint64_t *)&qword_26AC074E8, MEMORY[0x263F52678]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&qword_26AC074F0);
  sub_2248BA0BC((unint64_t *)&unk_26AC074F8, (uint64_t *)&qword_26AC074F0);
  uint64_t v149 = v37;
  sub_2248C4A68();
  uint64_t v38 = sub_2248C44F8();
  uint64_t v39 = *(void *)(v38 + 16);
  if (v39)
  {
    uint64_t v138 = v11;
    unint64_t v128 = v28;
    uint64_t v122 = v23;
    int64_t v123 = v18;
    unint64_t v124 = v15;
    uint64_t v41 = *(void (**)(void, void, void))(v34 + 16);
    uint64_t v40 = v34 + 16;
    unint64_t v143 = v41;
    unint64_t v42 = (*(unsigned __int8 *)(v40 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 64);
    uint64_t v120 = v38;
    unint64_t v43 = v38 + v42;
    uint64_t v44 = *(void *)(v40 + 56);
    uint64_t v141 = (uint64_t (**)(char *, uint64_t))(v40 + 72);
    uint64_t v142 = v44;
    int v140 = *MEMORY[0x263F52630];
    int v132 = *MEMORY[0x263F52628];
    int v127 = *MEMORY[0x263F52620];
    v139 = (void (**)(char *, uint64_t, uint64_t))(v151 + 16);
    v135 = (void (**)(BOOL *, char *, uint64_t))(v151 + 32);
    os_log_type_t v136 = (void (**)(BOOL *, uint64_t))(v151 + 8);
    uint64_t v121 = (void (**)(char *, uint64_t))(v40 - 8);
    uint64_t v148 = a1;
    uint64_t v45 = a1;
    uint64_t v46 = v150;
    uint64_t v47 = v145;
    uint64_t v48 = v134;
    uint64_t v137 = v40;
    do
    {
      BOOL v58 = v146;
      uint64_t v57 = v147;
      v143(v146, v43, v147);
      int v59 = (*v141)(v58, v57);
      uint64_t v151 = v39;
      unint64_t v152 = v43;
      if (v59 == v140)
      {
        sub_2248C4578();
        uint64_t v60 = *v139;
        uint64_t v61 = v45;
        uint64_t v62 = v138;
        (*v139)(v46, v61, v138);
        sub_2248C4A48();
        sub_2248AD9A0((unint64_t *)&qword_26AC074E0, MEMORY[0x263F52678]);
        char v63 = sub_2248C47E8();
        uint64_t v64 = &v133[*(int *)(v153 + 48)];
        BOOL v65 = (v63 & 1) == 0;
        *uint64_t v133 = v65;
        if (v63)
        {
          uint64_t v50 = *v135;
          (*v135)(v64, v47, v62);
          uint64_t v51 = v151;
          uint64_t v49 = v136;
        }
        else
        {
          uint64_t v49 = v136;
          (*v136)((BOOL *)v47, v62);
          v60((char *)v64, (uint64_t)v48, v62);
          v60(v46, (uint64_t)v48, v62);
          sub_2248C4A58();
          uint64_t v50 = *v135;
          uint64_t v51 = v151;
        }
        uint64_t v52 = *(int *)(v153 + 48);
        unint64_t v53 = v144;
        uint64_t v54 = &v144[v52];
        *uint64_t v144 = v65;
        v50(&v53[v52], (char *)v64, v62);
        uint64_t v55 = *v49;
        (*v49)(v54, v62);
        v55(v48, v62);
        uint64_t v45 = v148;
        unint64_t v56 = v152;
        uint64_t v47 = v145;
        uint64_t v46 = v150;
      }
      else if (v59 == v132)
      {
        uint64_t v66 = v128;
        sub_2248C4598();
        uint64_t v67 = v138;
        unint64_t v68 = *v139;
        (*v139)(v46, v45, v138);
        uint64_t v69 = v129;
        sub_2248C4A48();
        sub_2248AD9A0((unint64_t *)&qword_26AC074E0, MEMORY[0x263F52678]);
        char v70 = sub_2248C47E8();
        uint64_t v71 = &v131[*(int *)(v153 + 48)];
        BOOL v72 = (v70 & 1) == 0;
        *uint64_t v131 = v72;
        if (v70)
        {
          uint64_t v73 = *v135;
          (*v135)(v71, v69, v67);
          uint64_t v51 = v151;
          uint64_t v74 = v136;
        }
        else
        {
          uint64_t v90 = v69;
          uint64_t v74 = v136;
          (*v136)((BOOL *)v90, v67);
          v68((char *)v71, (uint64_t)v66, v67);
          v68(v46, (uint64_t)v66, v67);
          sub_2248C4A58();
          uint64_t v73 = *v135;
          uint64_t v51 = v151;
        }
        uint64_t v91 = *(int *)(v153 + 48);
        uint64_t v92 = v144;
        uint64_t v93 = &v144[v91];
        *uint64_t v144 = v72;
        v73(&v92[v91], (char *)v71, v67);
        uint64_t v94 = *v74;
        (*v74)(v93, v67);
        v94(v66, v67);
        uint64_t v45 = v148;
        uint64_t v46 = v150;
        uint64_t v47 = v145;
        uint64_t v48 = v134;
        unint64_t v56 = v152;
      }
      else
      {
        uint64_t v75 = v45;
        os_log_type_t v76 = v130;
        BOOL v77 = v139;
        if (v59 == v127)
        {
          uint64_t v78 = v122;
          sub_2248C4588();
          uint64_t v79 = *v77;
          uint64_t v80 = v150;
          uint64_t v81 = v138;
          (*v77)(v150, v75, v138);
          sub_2248C4A48();
          sub_2248AD9A0((unint64_t *)&qword_26AC074E0, MEMORY[0x263F52678]);
          char v82 = sub_2248C47E8();
          uint64_t v83 = &v125[*(int *)(v153 + 48)];
          BOOL v84 = (v82 & 1) == 0;
          *uint64_t v125 = v84;
          if (v82)
          {
            v85 = *v135;
            uint64_t v86 = v83;
            (*v135)(v83, v76, v81);
            unint64_t v87 = v86;
            uint64_t v88 = v81;
            uint64_t v47 = v145;
            uint64_t v89 = v136;
          }
          else
          {
            uint64_t v89 = v136;
            unint64_t v107 = v76;
            uint64_t v108 = v83;
            (*v136)((BOOL *)v107, v81);
            v79((char *)v108, (uint64_t)v78, v81);
            v79(v80, (uint64_t)v78, v81);
            sub_2248C4A58();
            unint64_t v87 = v108;
            v85 = *v135;
            uint64_t v88 = v81;
            uint64_t v47 = v145;
          }
          uint64_t v51 = v151;
          uint64_t v109 = *(int *)(v153 + 48);
          uint64_t v110 = v144;
          uint64_t v111 = &v144[v109];
          *uint64_t v144 = v84;
          v85(&v110[v109], (char *)v87, v88);
          uint64_t v112 = *v89;
          (*v89)(v111, v88);
          v112(v78, v88);
          uint64_t v45 = v148;
          uint64_t v46 = v150;
          uint64_t v48 = v134;
          unint64_t v56 = v152;
        }
        else
        {
          uint64_t v95 = v123;
          sub_2248C45A8();
          uint64_t v96 = *v77;
          uint64_t v97 = v150;
          uint64_t v98 = v138;
          (*v77)(v150, v75, v138);
          uint64_t v99 = v124;
          sub_2248C4A48();
          sub_2248AD9A0((unint64_t *)&qword_26AC074E0, MEMORY[0x263F52678]);
          char v100 = sub_2248C47E8();
          uint64_t v101 = &v126[*(int *)(v153 + 48)];
          BOOL v102 = (v100 & 1) == 0;
          *uint64_t v126 = v102;
          if (v100)
          {
            uint64_t v103 = *v135;
            uint64_t v104 = v101;
            (*v135)(v101, v99, v98);
            uint64_t v105 = v104;
            uint64_t v48 = v134;
            uint64_t v106 = v136;
          }
          else
          {
            uint64_t v106 = v136;
            uint64_t v113 = v99;
            uint64_t v114 = v101;
            (*v136)((BOOL *)v113, v98);
            v96((char *)v114, (uint64_t)v95, v98);
            v96(v97, (uint64_t)v95, v98);
            sub_2248C4A58();
            uint64_t v105 = v114;
            uint64_t v48 = v134;
            uint64_t v103 = *v135;
          }
          uint64_t v51 = v151;
          uint64_t v115 = *(int *)(v153 + 48);
          unint64_t v116 = v144;
          uint64_t v117 = &v144[v115];
          *uint64_t v144 = v102;
          v103(&v116[v115], (char *)v105, v98);
          uint64_t v118 = *v106;
          (*v106)(v117, v98);
          v118(v95, v98);
          (*v121)(v146, v147);
          uint64_t v45 = v148;
          uint64_t v46 = v150;
          unint64_t v56 = v152;
          uint64_t v47 = v145;
        }
      }
      unint64_t v43 = v56 + v142;
      uint64_t v39 = v51 - 1;
    }
    while (v39);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22488BDF4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v6;
  uint64_t v112 = a5;
  unint64_t v113 = a2;
  uint64_t v111 = a1;
  v115[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = sub_2248C4678();
  uint64_t v107 = *(void *)(v9 - 8);
  uint64_t v108 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v106 = (char *)v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2248C43C8();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v110 = (char *)v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v109 = (char *)v98 - v14;
  uint64_t v15 = sub_2248C45D8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void **)(v5 + 176);
  v115[0] = 0;
  id v20 = objc_msgSend(v19, sel_allPublishedLocalStatusesInDatabaseContext_error_, a4, v115);
  id v21 = v115[0];
  if (v20)
  {
    uint64_t v22 = v20;
    id v103 = v19;
    uint64_t v104 = a4;
    uint64_t v102 = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
    unint64_t v23 = sub_2248C48A8();
    id v24 = v21;

    uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
    uint64_t v25 = sub_2248C45F8();
    uint64_t v27 = v26;
    swift_bridgeObjectRetain();
    uint64_t v105 = v25;
    uint64_t v28 = v25;
    uint64_t v29 = v7;
    id v30 = sub_2248B729C(v23, v28, v27);
    v98[1] = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v30)
    {
      if (qword_26AC07D40 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_2248C46A8();
      __swift_project_value_buffer(v41, (uint64_t)qword_26AC07D28);
      swift_bridgeObjectRetain_n();
      unint64_t v42 = sub_2248C4698();
      os_log_type_t v43 = sub_2248C49C8();
      BOOL v44 = os_log_type_enabled(v42, v43);
      uint64_t v100 = v27;
      if (v44)
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = (void *)swift_slowAlloc();
        v115[0] = v46;
        *(_DWORD *)uint64_t v45 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v114 = sub_2248AD104(v105, v27, (uint64_t *)v115);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22480C000, v42, v43, "Creating local status {identifier: %s}", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v46, -1, -1);
        MEMORY[0x22A61A430](v45, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v49 = (uint64_t)v109;
      sub_2248C43A8();
      uint64_t v50 = (uint64_t)v110;
      sub_2248C43A8();
      uint64_t v51 = v106;
      sub_2248C4628();
      uint64_t v52 = sub_2248C4668();
      uint64_t v54 = v53;
      (*(void (**)(char *, uint64_t))(v107 + 8))(v51, v108);
      uint64_t v55 = sub_2248C4608();
      uint64_t v57 = v56;
      uint64_t v58 = v111;
      unint64_t v59 = v113;
      sub_2248BA100(v111, v113);
      uint64_t v60 = sub_2248C45C8();
      id v61 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatus);
      id v62 = sub_2248AB730(v105, v100, v49, v50, v52, v54, v55, v57, v58, v59, v60);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = xmmword_2248CBEB0;
      *(void *)(v63 + 32) = v62;
      v115[0] = (id)v63;
      sub_2248C48C8();
      id v30 = v62;
      uint64_t v40 = sub_2248C4898();
      swift_bridgeObjectRelease();
      v115[0] = 0;
      LODWORD(v60) = objc_msgSend(v103, sel_createOrUpdatePublishedLocalStatuses_databaseContext_error_, v40, v104, v115);

      LOBYTE(v40) = v115[0];
      if (v60)
      {
        id v64 = v115[0];
LABEL_30:
        LOBYTE(v40) = 1;
        goto LABEL_32;
      }
      id v65 = v115[0];
      sub_2248C4318();

      swift_willThrow();
      goto LABEL_32;
    }
    id v31 = objc_msgSend(v30, sel_payload);
    unint64_t v32 = v113;
    id v99 = v30;
    if (v31)
    {
      uint64_t v33 = v31;
      uint64_t v34 = sub_2248C4338();
      unint64_t v36 = v35;

      if (v32 >> 60 != 15)
      {
        uint64_t v37 = v111;
        sub_2248BA100(v111, v113);
        sub_2248B9CD8(v34, v36);
        char v38 = sub_2248B5340(v34, v36, v37, v113);
        uint64_t v39 = v37;
        unint64_t v32 = v113;
        sub_2248B7CDC(v39, v113);
        sub_2248B7CF0(v34, v36);
        sub_2248B7CF0(v34, v36);
        (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v112, v15);
        id v30 = v99;
        if ((v38 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_14;
      }
    }
    else
    {
      if (v113 >> 60 == 15)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v112, v15);
LABEL_14:
        id v47 = objc_msgSend(v30, sel_targetDevicesFlags);
        uint64_t v48 = sub_2248C45C8();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
        if (v47 != (id)v48)
        {
LABEL_23:
          swift_bridgeObjectRetain();
          id v67 = objc_msgSend(v30, sel_creationDate);
          uint64_t v100 = v27;
          uint64_t v68 = (uint64_t)v109;
          sub_2248C4398();

          uint64_t v69 = (uint64_t)v110;
          sub_2248C43A8();
          char v70 = v106;
          sub_2248C4628();
          uint64_t v71 = sub_2248C4668();
          uint64_t v73 = v72;
          (*(void (**)(char *, uint64_t))(v107 + 8))(v70, v108);
          uint64_t v74 = sub_2248C4608();
          unint64_t v75 = v32;
          uint64_t v77 = v76;
          uint64_t v78 = v111;
          sub_2248BA100(v111, v75);
          uint64_t v79 = sub_2248C45C8();
          id v80 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatus);
          unint64_t v97 = v75;
          unint64_t v81 = v100;
          uint64_t v96 = v78;
          uint64_t v82 = v105;
          id v83 = sub_2248AB730(v105, v100, v68, v69, v71, v73, v74, v77, v96, v97, v79);
          if (qword_26AC07D40 != -1) {
            swift_once();
          }
          uint64_t v84 = sub_2248C46A8();
          __swift_project_value_buffer(v84, (uint64_t)qword_26AC07D28);
          swift_bridgeObjectRetain();
          v85 = sub_2248C4698();
          os_log_type_t v86 = sub_2248C49C8();
          if (os_log_type_enabled(v85, v86))
          {
            unint64_t v87 = (uint8_t *)swift_slowAlloc();
            uint64_t v88 = v82;
            uint64_t v89 = (void *)swift_slowAlloc();
            v115[0] = v89;
            *(_DWORD *)unint64_t v87 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v114 = sub_2248AD104(v88, v81, (uint64_t *)v115);
            sub_2248C4A28();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_22480C000, v85, v86, "Updating local status {identifier: %s}", v87, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A61A430](v89, -1, -1);
            MEMORY[0x22A61A430](v87, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          id v30 = v99;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
          uint64_t v90 = swift_allocObject();
          *(_OWORD *)(v90 + 16) = xmmword_2248CBEB0;
          *(void *)(v90 + 32) = v83;
          v115[0] = (id)v90;
          sub_2248C48C8();
          uint64_t v40 = (uint64_t)v83;
          uint64_t v91 = (void *)sub_2248C4898();
          swift_bridgeObjectRelease();
          v115[0] = 0;
          unsigned int v92 = objc_msgSend(v103, sel_createOrUpdatePublishedLocalStatuses_databaseContext_error_, v91, v104, v115);

          if (!v92)
          {
            id v94 = v115[0];
            sub_2248C4318();

            swift_willThrow();
            goto LABEL_32;
          }
          id v93 = v115[0];

          goto LABEL_30;
        }
        swift_bridgeObjectRelease();
        LOBYTE(v40) = 0;
LABEL_32:

        return v40 & 1;
      }
      uint64_t v34 = 0;
      unint64_t v36 = 0xF000000000000000;
    }
    uint64_t v66 = v111;
    sub_2248BA100(v111, v32);
    sub_2248B7CDC(v34, v36);
    sub_2248B7CDC(v66, v32);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v112, v15);
    id v30 = v99;
LABEL_22:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    goto LABEL_23;
  }
  uint64_t v40 = (uint64_t)v115[0];
  sub_2248C4318();

  swift_willThrow();
  return v40 & 1;
}

uint64_t sub_22488C8B8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
  swift_beginAccess();
  if (!*(void *)(*(void *)v7 + 16)) {
    return swift_endAccess();
  }
  sub_2248AD8B4(a1);
  char v9 = v8;
  uint64_t result = swift_endAccess();
  if (v9)
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_2248C46A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_26AC07D28);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
    uint64_t v12 = sub_2248C4698();
    os_log_type_t v13 = sub_2248C49C8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v22[0] = v20;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v19 = v14 + 4;
      sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
      uint64_t v15 = sub_2248C4C18();
      uint64_t v21 = sub_2248AD104(v15, v16, v22);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      _os_log_impl(&dword_22480C000, v12, v13, "Resetting subject for %s", v14, 0xCu);
      uint64_t v17 = v20;
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v17, -1, -1);
      MEMORY[0x22A61A430](v14, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }

    swift_beginAccess();
    if (*(void *)(*(void *)v7 + 16) && (sub_2248AD8B4(a1), (v18 & 1) != 0))
    {
      swift_endAccess();
      LOBYTE(v22[0]) = 1;
      swift_retain();
      sub_2248C46B8();
      swift_release();
    }
    else
    {
      swift_endAccess();
    }
    swift_beginAccess();
    sub_2248AE110(a1);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

void sub_22488CC30(uint64_t a1, uint64_t a2)
{
  uint64_t v371 = a2;
  uint64_t v368 = a1;
  v425[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v409 = sub_2248C43C8();
  uint64_t v364 = *(void *)(v409 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v408 = (char *)&v359 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v407 = (char *)&v359 - v4;
  uint64_t v5 = (_DWORD *)sub_2248C46A8();
  os_log_t v404 = (os_log_t)*((void *)v5 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t)&v359 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v382 = (char *)&v359 - v10;
  MEMORY[0x270FA5388](v9);
  v395 = (char *)&v359 - v11;
  uint64_t v12 = sub_2248C45D8();
  v402 = *(char **)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)&v359 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AC07D40 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v397 = __swift_project_value_buffer((uint64_t)v5, (uint64_t)qword_26AC07D28);
    uint64_t v15 = sub_2248C4698();
    os_log_type_t v16 = sub_2248C49C8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_22480C000, v15, v16, "reconcilePendingStatusesOnDevices START", v17, 2u);
      MEMORY[0x22A61A430](v17, -1, -1);
    }

    uint64_t v18 = v410;
    uint64_t v19 = sub_22489104C((unsigned char *)0xD000000000000030, 0x80000002248CF000);
    uint64_t v20 = *(void **)(v18 + 176);
    v422 = 0;
    id v367 = v20;
    id v21 = objc_msgSend(v20, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v371, &v422);
    uint64_t v22 = v422;
    if (!v21)
    {
      v278 = v422;
      swift_bridgeObjectRelease();
      sub_2248C4318();

      swift_willThrow();
      return;
    }
    unint64_t v23 = v21;
    unint64_t v378 = v19;
    uint64_t v363 = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07728);
    unint64_t v24 = sub_2248C48A8();
    uint64_t v25 = v22;

    unint64_t v26 = sub_22488504C(MEMORY[0x263F8EE78], (uint64_t *)&unk_268093C58);
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v27 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v403 = v26;
    v383 = v5;
    uint64_t v362 = v8;
    uint64_t v388 = v12;
    id v406 = (id)isUniquelyReferenced_nonNull_native;
    if (v27) {
      break;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    v422 = 0;
    id v49 = objc_msgSend(v367, sel_allPublishedLocalStatusesInDatabaseContext_error_, v371, &v422);
    uint64_t v50 = v422;
    if (!v49)
    {
      v279 = v422;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2248C4318();

      swift_willThrow();
LABEL_276:
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v51 = v49;
    uint64_t v377 = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
    uint64_t v412 = sub_2248C48A8();
    uint64_t v52 = v50;

    unint64_t v421 = MEMORY[0x263F8EE78];
    uint64_t v53 = v405;
    uint64_t v54 = sub_2248925D8(v24, (uint64_t)v419, (SEL *)&selRef_idsIdentifier);
    uint64_t v366 = v53;
    swift_bridgeObjectRelease();
    uint64_t v55 = sub_2248B55D8(v54);
    swift_bridgeObjectRelease();
    uint64_t v420 = v55;
    unint64_t v57 = v378;
    if (!(v378 >> 62))
    {
      uint64_t v58 = *(void *)((v378 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v58) {
        goto LABEL_27;
      }
LABEL_194:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v421 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v327 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
        if (!v327) {
          goto LABEL_203;
        }
LABEL_196:
        unint64_t v280 = v421;
        swift_bridgeObjectRetain_n();
        v281 = sub_2248C4698();
        os_log_type_t v282 = sub_2248C49C8();
        if (os_log_type_enabled(v281, v282))
        {
          v283 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v283 = 134217984;
          if (v280 >> 62)
          {
            swift_bridgeObjectRetain();
            v284 = sub_2248C4BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            v284 = *(NSObject **)((v280 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          v422 = v284;
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22480C000, v281, v282, "reconcilePendingStatusesOnDevices inserting new devices {devicesToSave.count: %ld}", v283, 0xCu);
          MEMORY[0x22A61A430](v283, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v285 = (void *)sub_2248C4898();
        swift_bridgeObjectRelease();
        v425[0] = 0;
        unsigned int v286 = objc_msgSend(v367, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v285, v371, v425);

        if (v286)
        {
          id v287 = v425[0];
          goto LABEL_203;
        }
        id v314 = v425[0];
        swift_bridgeObjectRelease();
        sub_2248C4318();

        swift_willThrow();
        goto LABEL_275;
      }
      if (*(void *)((v421 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_196;
      }
LABEL_203:
      if (*(void *)(v420 + 16))
      {
        v288 = sub_2248C4698();
        os_log_type_t v289 = sub_2248C49C8();
        if (os_log_type_enabled(v288, v289))
        {
          v290 = (uint8_t *)swift_slowAlloc();
          v291 = (void *)swift_slowAlloc();
          v425[0] = v291;
          *(_DWORD *)v290 = 136315138;
          swift_beginAccess();
          uint64_t v12 = v420;
          swift_bridgeObjectRetain();
          uint64_t v292 = sub_2248C4978();
          unint64_t v294 = v293;
          swift_bridgeObjectRelease();
          unint64_t v424 = sub_2248AD104(v292, v294, (uint64_t *)v425);
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22480C000, v288, v289, "reconcilePendingStatusesOnDevices removing ids lost devices {deviceIDsToRemove: %s}", v290, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v291, -1, -1);
          MEMORY[0x22A61A430](v290, -1, -1);
        }

        swift_beginAccess();
        uint64_t v295 = swift_bridgeObjectRetain();
        sub_2248B2458(v295);
        swift_bridgeObjectRelease();
        v296 = (void *)sub_2248C4898();
        swift_release();
        unint64_t v424 = 0;
        unsigned int v297 = objc_msgSend(v367, sel_deletePublishedLocalStatusDevices_databaseContext_error_, v296, v371, &v424);

        if (v297)
        {
          id v298 = (id)v424;
          goto LABEL_208;
        }
        id v315 = (id)v424;
        swift_bridgeObjectRelease();
        sub_2248C4318();

        swift_willThrow();
LABEL_275:
        swift_bridgeObjectRelease();
        goto LABEL_276;
      }
LABEL_208:
      v299 = (void *)MEMORY[0x263F8EE78];
      unint64_t v424 = MEMORY[0x263F8EE78];
      id v418 = 0;
      id v300 = objc_msgSend(v367, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v371, &v418, v359, v360);
      id v301 = v418;
      if (!v300)
      {
        id v317 = v418;
        swift_bridgeObjectRelease();
        v318 = (void *)sub_2248C4318();

        swift_willThrow();
        id v319 = v318;
        id v320 = v318;
        v321 = sub_2248C4698();
        os_log_type_t v322 = sub_2248C49A8();
        if (os_log_type_enabled(v321, v322))
        {
          v323 = (uint8_t *)swift_slowAlloc();
          v324 = (void *)swift_slowAlloc();
          *(_DWORD *)v323 = 138412290;
          id v325 = v318;
          unint64_t v326 = _swift_stdlib_bridgeErrorToNSError();
          unint64_t v424 = v326;
          sub_2248C4A28();
          void *v324 = v326;

          _os_log_impl(&dword_22480C000, v321, v322, "Failed to fetch all published local status devices while evaluating recent statuses: %@", v323, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v324, -1, -1);
          MEMORY[0x22A61A430](v323, -1, -1);
        }
        else
        {
        }
        goto LABEL_270;
      }
      v302 = v300;
      unint64_t v303 = sub_2248C48A8();
      id v304 = v301;

      swift_retain();
      uint64_t v305 = v366;
      unint64_t v306 = sub_2248B7444(v303);
      uint64_t v8 = v305;
      swift_bridgeObjectRelease();
      swift_release();
      id v418 = v299;
      if (!(v306 >> 62))
      {
        uint64_t v307 = *(void *)((v306 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v307) {
          goto LABEL_211;
        }
LABEL_233:
        swift_bridgeObjectRelease();
        unint64_t v316 = MEMORY[0x263F8EE78];
LABEL_234:
        uint64_t v405 = v316;
        os_log_t v400 = (os_log_t)v8;
        if ((v316 & 0x8000000000000000) != 0 || (v316 & 0x4000000000000000) != 0) {
          goto LABEL_262;
        }
        for (i = *(char **)(v316 + 16); i; unint64_t v316 = v405)
        {
          v329 = 0;
          uint64_t v412 = OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds;
          os_log_t v404 = (os_log_t)(v316 & 0xC000000000000001);
          v401 = (char *)(v316 + 32);
          v330 = (void (**)(char *, uint64_t))(v364 + 8);
          v402 = i;
          v331 = v407;
          while (1)
          {
            if (v404)
            {
              id v332 = (id)MEMORY[0x22A619600](v329, v316);
            }
            else
            {
              if ((unint64_t)v329 >= *(void *)(v316 + 16)) {
                goto LABEL_261;
              }
              id v332 = *(id *)&v401[8 * (void)v329];
            }
            v333 = v332;
            BOOL v47 = __OFADD__(v329, 1);
            v334 = ((char *)&v329->isa + 1);
            if (v47) {
              break;
            }
            id v335 = objc_msgSend(v332, sel_pendingStatuses);
            unint64_t v336 = sub_2248C48A8();

            v411 = v334;
            id v406 = v333;
            if (v336 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v337 = sub_2248C4BC8();
              swift_bridgeObjectRelease();
              if (!v337) {
                goto LABEL_238;
              }
            }
            else
            {
              uint64_t v337 = *(void *)((v336 & 0xFFFFFFFFFFFFFF8) + 0x10);
              if (!v337) {
                goto LABEL_238;
              }
            }
            if (v337 < 1) {
              goto LABEL_260;
            }
            uint64_t v338 = 0;
            v413 = (void (**)(uint64_t, uint64_t))(v336 & 0xC000000000000001);
            unint64_t v414 = v336;
            do
            {
              if (v413) {
                id v339 = (id)MEMORY[0x22A619600](v338, v336);
              }
              else {
                id v339 = *(id *)(v336 + 8 * v338 + 32);
              }
              v340 = v339;
              id v341 = objc_msgSend(v339, sel_modificationDate);
              v342 = v408;
              sub_2248C4398();

              sub_2248C4358();
              v343 = *v330;
              uint64_t v344 = v409;
              (*v330)(v342, v409);
              sub_2248C43A8();
              char v345 = sub_2248C4378();
              v343(v342, v344);
              uint64_t v346 = ((uint64_t (*)(char *, uint64_t))v343)(v331, v344);
              if (v345)
              {
                MEMORY[0x22A619380](v346);
                if (*(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_2248C48D8();
                }
                sub_2248C48E8();
                sub_2248C48C8();
              }
              else
              {
              }
              unint64_t v336 = v414;
              ++v338;
            }
            while (v337 != v338);
LABEL_238:

            swift_bridgeObjectRelease();
            v329 = v411;
            unint64_t v316 = v405;
            if (v411 == v402) {
              goto LABEL_263;
            }
          }
          __break(1u);
LABEL_260:
          __break(1u);
LABEL_261:
          __break(1u);
LABEL_262:
          swift_bridgeObjectRetain();
          i = (char *)sub_2248C4BC8();
          swift_release();
        }
LABEL_263:
        swift_release();
        if (v424 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v347 = sub_2248C4BC8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v347 = *(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v347)
        {
          uint64_t v348 = v410;
          *(unsigned char *)(v410 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) = 0;
          v349 = *(void **)(v348 + OBJC_IVAR___SKALocalStatusServer_browseTask);
          if (v349)
          {
            id v350 = v349;
            objc_msgSend(v350, sel_setControlFlags_, 6);
            v351 = sub_2248C4698();
            os_log_type_t v352 = sub_2248C49C8();
            if (os_log_type_enabled(v351, v352))
            {
              v353 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v353 = 0;
              _os_log_impl(&dword_22480C000, v351, v352, "Removed bleScreenOff control flag from browseCompanionLink since all pending statuses are at least 3 days old", v353, 2u);
              MEMORY[0x22A61A430](v353, -1, -1);
            }
          }
        }
LABEL_270:
        unint64_t v354 = v421;
        swift_bridgeObjectRetain();
        v355 = sub_2248C4698();
        os_log_type_t v356 = sub_2248C49C8();
        if (os_log_type_enabled(v355, v356))
        {
          uint64_t v357 = swift_slowAlloc();
          *(_DWORD *)uint64_t v357 = 134218240;
          if (v354 >> 62)
          {
            swift_bridgeObjectRetain();
            unint64_t v358 = sub_2248C4BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v358 = *(void *)((v354 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          unint64_t v424 = v358;
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          *(_WORD *)(v357 + 12) = 2048;
          swift_beginAccess();
          id v418 = *(id *)(v420 + 16);
          sub_2248C4A28();
          _os_log_impl(&dword_22480C000, v355, v356, "reconcilePendingStatusesOnDevices END {devicesToSave.count: %ld, deviceIDsToRemove.count: %ld}", (uint8_t *)v357, 0x16u);
          MEMORY[0x22A61A430](v357, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_275;
      }
      uint64_t v307 = sub_2248C4BC8();
      if (!v307) {
        goto LABEL_233;
      }
LABEL_211:
      if (v307 >= 1)
      {
        for (uint64_t j = 0; j != v307; ++j)
        {
          if ((v306 & 0xC000000000000001) != 0) {
            id v309 = (id)MEMORY[0x22A619600](j, v306);
          }
          else {
            id v309 = *(id *)(v306 + 8 * j + 32);
          }
          v310 = v309;
          id v311 = objc_msgSend(v309, sel_pendingStatuses);
          unint64_t v312 = sub_2248C48A8();

          if (v312 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v313 = sub_2248C4BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v313 = *(void *)((v312 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (v313)
          {
            sub_2248C4B38();
            sub_2248C4B58();
            sub_2248C4B68();
            sub_2248C4B48();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v316 = (unint64_t)v418;
        uint64_t v8 = v305;
        goto LABEL_234;
      }
      __break(1u);
LABEL_280:

      __break(1u);
LABEL_281:
      __break(1u);
LABEL_282:

      __break(1u);
    }
LABEL_193:
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    unint64_t v57 = v378;
    if (!v58) {
      goto LABEL_194;
    }
LABEL_27:
    unint64_t v59 = 0;
    unint64_t v375 = v57 & 0xC000000000000001;
    uint64_t v370 = v57 & 0xFFFFFFFFFFFFFF8;
    unint64_t v369 = v57 + 32;
    uint64_t v60 = v412 & 0xFFFFFFFFFFFFFF8;
    uint64_t v405 = v412 & 0xFFFFFFFFFFFFFF8;
    if (v412 < 0) {
      uint64_t v60 = v412;
    }
    uint64_t v360 = v60;
    unint64_t v414 = v412 & 0xC000000000000001;
    v401 = (char *)(v412 + 32);
    v413 = (void (**)(uint64_t, uint64_t))(v402 + 8);
    os_log_t v392 = v404 + 2;
    os_log_t v391 = v404 + 1;
    v380 = v419;
    unint64_t v372 = (unint64_t)v412 >> 62;
    *(void *)&long long v56 = 136315394;
    long long v379 = v56;
    uint64_t v359 = MEMORY[0x263F8EE58] + 8;
    *(void *)&long long v56 = 136315138;
    long long v361 = v56;
    uint64_t v374 = v58;
LABEL_36:
    if (v375)
    {
      id v67 = (id)MEMORY[0x22A619600](v59, v57);
    }
    else
    {
      if (v59 >= *(void *)(v370 + 16)) {
        goto LABEL_189;
      }
      id v67 = *(id *)(v369 + 8 * v59);
    }
    uint64_t v68 = v67;
    BOOL v47 = __OFADD__(v59++, 1);
    if (v47) {
      goto LABEL_188;
    }
    id v69 = objc_msgSend(v67, sel_uniqueID, v359, v360);
    if (!v69) {
      goto LABEL_34;
    }
    char v70 = v69;
    uint64_t v376 = sub_2248C4808();
    uint64_t v381 = v71;

    v425[0] = (id)MEMORY[0x263F8EE78];
    if (v372)
    {
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_2248C4BC8();
    }
    else
    {
      uint64_t v72 = *(void *)(v405 + 16);
      swift_bridgeObjectRetain();
    }
    unint64_t v390 = v59;
    if (!v72)
    {
      swift_bridgeObjectRelease();
      unint64_t v86 = MEMORY[0x263F8EE78];
      if (MEMORY[0x263F8EE78] >> 62) {
        goto LABEL_95;
      }
LABEL_63:
      if (*(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_64;
      }
LABEL_96:
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t v73 = 0;
    while (1)
    {
      if (v414)
      {
        uint64_t v74 = (_DWORD *)MEMORY[0x22A619600](v73, v412);
      }
      else
      {
        if (v73 >= *(void *)(v405 + 16)) {
          goto LABEL_183;
        }
        uint64_t v74 = *(id *)&v401[8 * v73];
      }
      uint64_t v5 = v74;
      BOOL v47 = __OFADD__(v73++, 1);
      if (v47) {
        break;
      }
      objc_msgSend(v74, sel_targetDevicesFlags);
      sub_2248C45B8();
      uint64_t v8 = sub_2248C4568();
      uint64_t v75 = isUniquelyReferenced_nonNull_native;
      uint64_t v76 = isUniquelyReferenced_nonNull_native;
      uint64_t v77 = v12;
      (*v413)(v76, v12);
      uint64_t v78 = v68;
      id v79 = objc_msgSend(v68, sel_deviceType);
      if (*(void *)(v8 + 16))
      {
        id v80 = v79;
        sub_2248C4CD8();
        sub_2248C4CE8();
        uint64_t v81 = sub_2248C4D08();
        uint64_t v82 = -1 << *(unsigned char *)(v8 + 32);
        unint64_t v83 = v81 & ~v82;
        if ((*(void *)(v8 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v83))
        {
          uint64_t v84 = *(void *)(v8 + 48);
          if (*(id *)(v84 + 8 * v83) == v80)
          {
LABEL_59:
            swift_bridgeObjectRelease();
            uint64_t v5 = v5;
            MEMORY[0x22A619380]();
            uint64_t v8 = *(void *)(((unint64_t)v425[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
            uint64_t v68 = v78;
            if ((unint64_t)v8 >= *(void *)(((unint64_t)v425[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2248C48D8();
            }
            sub_2248C48E8();
            sub_2248C48C8();

            goto LABEL_47;
          }
          uint64_t v85 = ~v82;
          while (1)
          {
            unint64_t v83 = (v83 + 1) & v85;
            if (((*(void *)(v8 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v83) & 1) == 0) {
              break;
            }
            if (*(id *)(v84 + 8 * v83) == v80) {
              goto LABEL_59;
            }
          }
        }
      }

      swift_bridgeObjectRelease();
      uint64_t v68 = v78;
LABEL_47:
      uint64_t v12 = v77;
      uint64_t isUniquelyReferenced_nonNull_native = v75;
      if (v73 == v72)
      {
        swift_bridgeObjectRelease();
        unint64_t v86 = (unint64_t)v425[0];
        unint64_t v59 = v390;
        if (!((unint64_t)v425[0] >> 62)) {
          goto LABEL_63;
        }
LABEL_95:
        swift_bridgeObjectRetain();
        uint64_t v121 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
        if (!v121) {
          goto LABEL_96;
        }
LABEL_64:
        uint64_t v87 = v376;
        uint64_t v88 = v381;
        sub_2248B1FA8(v376, v381);
        swift_bridgeObjectRelease();
        uint64_t v89 = v403;
        if (!v403[2].isa) {
          goto LABEL_31;
        }
        swift_bridgeObjectRetain();
        unint64_t v90 = sub_2248AD83C(v87, v88);
        if ((v91 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_31:
          id v61 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
          id v62 = (void *)sub_2248C47F8();
          swift_bridgeObjectRelease();
          uint64_t v8 = v377;
          uint64_t v63 = (void *)sub_2248C4898();
          swift_bridgeObjectRelease();
          id v64 = (void *)sub_2248C4898();
          id v65 = objc_msgSend(v61, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v62, v63, v64);

          id v66 = v65;
          MEMORY[0x22A619380]();
          uint64_t v5 = *(_DWORD **)((v421 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if ((unint64_t)v5 >= *(void *)((v421 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2248C48D8();
          }
          sub_2248C48E8();
          sub_2248C48C8();

LABEL_34:
          goto LABEL_35;
        }
        id v396 = v68;
        id v92 = *((id *)v89[7].isa + v90);
        swift_bridgeObjectRelease();
        id v93 = objc_msgSend(v92, sel_pendingStatuses);
        uint64_t v12 = v377;
        unint64_t v94 = sub_2248C48A8();

        uint64_t v95 = v366;
        uint64_t v96 = sub_2248925D8(v94, (uint64_t)v417, (SEL *)&selRef_identifier);
        swift_bridgeObjectRelease();
        id v97 = objc_msgSend(v92, sel_deliveredStatuses);
        uint64_t v5 = (_DWORD *)sub_2248C48A8();

        uint64_t v98 = sub_2248925D8((unint64_t)v5, (uint64_t)v416, (SEL *)&selRef_identifier);
        swift_bridgeObjectRelease();
        v422 = v96;
        sub_2248B2138(v98);
        os_log_t v404 = (os_log_t)sub_2248B55D8((uint64_t)v422);
        swift_bridgeObjectRelease();
        uint64_t v99 = sub_224892754(v368);
        v389 = sub_2248B55D8(v99);
        swift_bridgeObjectRelease();
        unint64_t v100 = swift_bridgeObjectRetain();
        uint64_t v101 = sub_2248925D8(v100, (uint64_t)v415, (SEL *)&selRef_identifier);
        uint64_t v366 = v95;
        swift_bridgeObjectRelease();
        uint64_t v102 = sub_2248B55D8(v101);
        swift_bridgeObjectRelease();
        unint64_t v424 = MEMORY[0x263F8EE78];
        id v365 = v92;
        id v103 = objc_msgSend(v92, sel_pendingStatuses);
        unint64_t v104 = sub_2248C48A8();

        if (!(v104 >> 62))
        {
          uint64_t v8 = *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v8) {
            goto LABEL_68;
          }
LABEL_99:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v423 = MEMORY[0x263F8EE78];
          unint64_t v387 = (unint64_t)v425[0];
          if ((unint64_t)v425[0] >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v122 = sub_2248C4BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v122 = *(void *)(((unint64_t)v425[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          int64_t v123 = v383;
          unint64_t v59 = v390;
          uint64_t v12 = (uint64_t)v389;
          if (v122)
          {
            unint64_t v124 = 0;
            unint64_t v394 = v387 & 0xC000000000000001;
            v373 = (char *)(v387 + 32);
            os_log_t v400 = v404 + 7;
            v399 = v389 + 7;
            v393 = (char *)v122;
            while (1)
            {
              if (v394)
              {
                uint64_t v125 = MEMORY[0x22A619600](v124, v387);
                BOOL v47 = __OFADD__(v124, 1);
                uint64_t v126 = v124 + 1;
                if (v47) {
                  goto LABEL_184;
                }
              }
              else
              {
                uint64_t v125 = *(id *)&v373[8 * (void)v124];
                BOOL v47 = __OFADD__(v124, 1);
                uint64_t v126 = v124 + 1;
                if (v47) {
                  goto LABEL_184;
                }
              }
              v402 = v126;
              v411 = v125;
              id v127 = [v125 identifier];
              uint64_t v128 = sub_2248C4808();
              uint64_t v130 = v129;

              if (!v404[2].isa) {
                goto LABEL_126;
              }
              os_log_t v131 = v404;
              sub_2248C4CD8();
              sub_2248C4838();
              uint64_t v132 = sub_2248C4D08();
              uint64_t v133 = -1 << LOBYTE(v131[4].isa);
              unint64_t v134 = v132 & ~v133;
              if (((*(unint64_t *)((char *)&v400->isa + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134) & 1) == 0) {
                goto LABEL_126;
              }
              Class isa = v404[6].isa;
              os_log_type_t v136 = (void *)((char *)isa + 16 * v134);
              BOOL v137 = *v136 == v128 && v136[1] == v130;
              if (!v137 && (sub_2248C4C28() & 1) == 0) {
                break;
              }
LABEL_117:
              swift_bridgeObjectRelease();
LABEL_133:
              uint64_t v170 = v411;
              id v171 = [v411 identifier];
              uint64_t v8 = sub_2248C4808();
              uint64_t v5 = v172;

              if (*(void *)(v12 + 16))
              {
                sub_2248C4CD8();
                sub_2248C4838();
                uint64_t v173 = sub_2248C4D08();
                uint64_t v174 = -1 << *(unsigned char *)(v12 + 32);
                unint64_t v175 = v173 & ~v174;
                if (((*(unint64_t *)((char *)&v399->isa + ((v175 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v175) & 1) == 0) {
                  goto LABEL_156;
                }
                uint64_t v176 = *(void *)(v12 + 48);
                uint64_t v177 = (void *)(v176 + 16 * v175);
                BOOL v178 = *v177 == v8 && v177[1] == (void)v5;
                if (!v178 && (sub_2248C4C28() & 1) == 0)
                {
                  uint64_t v212 = ~v174;
                  while (1)
                  {
                    unint64_t v175 = (v175 + 1) & v212;
                    if (((*(unint64_t *)((char *)&v399->isa + ((v175 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v175) & 1) == 0) {
                      break;
                    }
                    v213 = (void *)(v176 + 16 * v175);
                    BOOL v214 = *v213 == v8 && v213[1] == (void)v5;
                    if (v214 || (sub_2248C4C28() & 1) != 0) {
                      goto LABEL_140;
                    }
                  }
LABEL_156:

                  goto LABEL_104;
                }
LABEL_140:
                swift_bridgeObjectRelease();
                uint64_t v179 = v382;
                ((void (*)(char *, uint64_t, _DWORD *))v392->isa)(v382, v397, v123);
                uint64_t v180 = v411;
                id v181 = v396;
                v182 = v180;
                uint64_t v8 = (uint64_t)v181;
                char v183 = sub_2248C4698();
                int v184 = sub_2248C49C8();
                v411 = v183;
                BOOL v185 = os_log_type_enabled(v183, (os_log_type_t)v184);
                v398 = v182;
                if (v185)
                {
                  int v386 = v184;
                  uint64_t v186 = swift_slowAlloc();
                  os_log_type_t v187 = swift_slowAlloc();
                  v422 = v187;
                  *(_DWORD *)uint64_t v186 = v379;
                  id v188 = [v182 identifier];
                  uint64_t v189 = sub_2248C4808();
                  v190 = v182;
                  unint64_t v192 = v191;

                  id v418 = (id)sub_2248AD104(v189, v192, (uint64_t *)&v422);
                  sub_2248C4A28();

                  swift_bridgeObjectRelease();
                  *(_WORD *)(v186 + 12) = 2080;
                  id v193 = objc_msgSend((id)v8, sel_uniqueID);
                  if (!v193) {
                    goto LABEL_282;
                  }
                  uint64_t v194 = v193;
                  v385 = (v186 + 14);
                  uint64_t v195 = sub_2248C4808();
                  unint64_t v197 = v196;

                  uint64_t v199 = sub_2248B5808(8, v195, v197, v198);
                  uint64_t v201 = v200;
                  uint64_t v203 = v202;
                  uint64_t v205 = v204;
                  swift_bridgeObjectRelease();
                  uint64_t v206 = MEMORY[0x22A619320](v199, v201, v203, v205);
                  unint64_t v208 = v207;
                  swift_bridgeObjectRelease();
                  id v418 = (id)sub_2248AD104(v206, v208, (uint64_t *)&v422);
                  sub_2248C4A28();

                  swift_bridgeObjectRelease();
                  uint64_t v209 = v411;
                  _os_log_impl(&dword_22480C000, v411, (os_log_type_t)v386, "Adding reset status to pending statuses {status: %s, device: %s", (uint8_t *)v186, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x22A61A430](v187, -1, -1);
                  MEMORY[0x22A61A430](v186, -1, -1);

                  int64_t v123 = v383;
                  uint64_t v210 = ((uint64_t (*)(char *, _DWORD *))v391->isa)(v382, v383);
                  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
                  unint64_t v59 = v390;
                  uint64_t v12 = (uint64_t)v389;
                }
                else
                {

                  uint64_t v210 = ((uint64_t (*)(char *, _DWORD *))v391->isa)(v179, v123);
                }
                MEMORY[0x22A619380](v210);
                uint64_t v5 = *(_DWORD **)((v424 & 0xFFFFFFFFFFFFFF8) + 0x10);
                v211 = v393;
                unint64_t v124 = v402;
                if ((unint64_t)v5 >= *(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_2248C48D8();
                }
                sub_2248C48E8();
                sub_2248C48C8();
                if (v124 == v211) {
                  goto LABEL_157;
                }
              }
              else
              {

LABEL_104:
                swift_bridgeObjectRelease();
                unint64_t v124 = v402;
                if (v402 == v393) {
                  goto LABEL_157;
                }
              }
            }
            uint64_t v138 = ~v133;
            while (1)
            {
              unint64_t v134 = (v134 + 1) & v138;
              if (((*(unint64_t *)((char *)&v400->isa + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134) & 1) == 0) {
                break;
              }
              v139 = (void *)((char *)isa + 16 * v134);
              BOOL v140 = *v139 == v128 && v139[1] == v130;
              if (v140 || (sub_2248C4C28() & 1) != 0) {
                goto LABEL_117;
              }
            }
LABEL_126:
            swift_bridgeObjectRelease();
            uint64_t v141 = v395;
            ((void (*)(char *, uint64_t, _DWORD *))v392->isa)(v395, v397, v123);
            uint64_t v142 = v411;
            id v143 = v396;
            uint64_t v8 = v142;
            uint64_t v12 = (uint64_t)v143;
            uint64_t v144 = sub_2248C4698();
            int v145 = sub_2248C49C8();
            v398 = v144;
            if (os_log_type_enabled(v144, (os_log_type_t)v145))
            {
              int v386 = v145;
              uint64_t v146 = swift_slowAlloc();
              v385 = swift_slowAlloc();
              v422 = v385;
              *(_DWORD *)uint64_t v146 = v379;
              id v147 = objc_msgSend((id)v8, sel_identifier);
              uint64_t v148 = sub_2248C4808();
              unint64_t v150 = v149;

              id v418 = (id)sub_2248AD104(v148, v150, (uint64_t *)&v422);
              sub_2248C4A28();

              swift_bridgeObjectRelease();
              *(_WORD *)(v146 + 12) = 2080;
              id v151 = objc_msgSend((id)v12, sel_uniqueID);
              if (!v151) {
                goto LABEL_280;
              }
              unint64_t v152 = v151;
              uint64_t v384 = v146 + 14;
              uint64_t v153 = sub_2248C4808();
              unint64_t v155 = v154;

              uint64_t v157 = sub_2248B5808(8, v153, v155, v156);
              uint64_t v159 = v158;
              uint64_t v161 = v160;
              uint64_t v163 = v162;
              swift_bridgeObjectRelease();
              uint64_t v164 = MEMORY[0x22A619320](v157, v159, v161, v163);
              unint64_t v166 = v165;
              swift_bridgeObjectRelease();
              id v418 = (id)sub_2248AD104(v164, v166, (uint64_t *)&v422);
              sub_2248C4A28();

              swift_bridgeObjectRelease();
              os_log_type_t v167 = v398;
              _os_log_impl(&dword_22480C000, v398, (os_log_type_t)v386, "Adding new pending status to database device {status: %s, device: %s}", (uint8_t *)v146, 0x16u);
              uint64_t v168 = v385;
              swift_arrayDestroy();
              MEMORY[0x22A61A430](v168, -1, -1);
              MEMORY[0x22A61A430](v146, -1, -1);

              int64_t v123 = v383;
              ((void (*)(char *, _DWORD *))v391->isa)(v395, v383);
              uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
              unint64_t v59 = v390;
            }
            else
            {

              ((void (*)(char *, _DWORD *))v391->isa)(v141, v123);
            }
            id v169 = (id)v8;
            MEMORY[0x22A619380]();
            uint64_t v12 = (uint64_t)v389;
            if (*(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2248C48D8();
            }
            sub_2248C48E8();
            sub_2248C48C8();
            goto LABEL_133;
          }
LABEL_157:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          id v215 = v396;
          if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
          {
            uint64_t v238 = sub_2248C4BC8();
            uint64_t v239 = MEMORY[0x263F8EE78];
            if (v238)
            {
              long long v240 = v238;
              uint64_t v241 = 0;
              v411 = v238;
              do
              {
                unint64_t v242 = (v241 + 1);
                if (__OFADD__(v241, 1)) {
                  goto LABEL_281;
                }
                uint64_t v5 = *(id *)(v239 + 8 * v241 + 32);
                id v243 = objc_msgSend(v5, sel_identifier);
                uint64_t v244 = sub_2248C4808();
                uint64_t v246 = v245;

                LOBYTE(v243) = sub_2248942A8(v244, v246, (uint64_t)v389);
                uint64_t v247 = swift_bridgeObjectRelease();
                if (v243)
                {
                  v248 = v215;
                  uint64_t v249 = v362;
                  v250 = v383;
                  ((void (*)(uint64_t, uint64_t, _DWORD *))v392->isa)(v362, v397, v383);
                  id v251 = v248;
                  v252 = v5;
                  uint64_t v5 = v251;
                  uint64_t v8 = v252;
                  v253 = sub_2248C4698();
                  int v254 = sub_2248C49C8();
                  if (os_log_type_enabled(v253, (os_log_type_t)v254))
                  {
                    LODWORD(v400) = v254;
                    os_log_t v404 = v253;
                    v255 = v5;
                    uint64_t v5 = (_DWORD *)swift_slowAlloc();
                    v399 = swift_slowAlloc();
                    v422 = v399;
                    _DWORD *v5 = v379;
                    id v256 = objc_msgSend((id)v8, sel_identifier);
                    uint64_t v257 = sub_2248C4808();
                    unint64_t v259 = v258;

                    *(void *)(v5 + 1) = sub_2248AD104(v257, v259, (uint64_t *)&v422);
                    v402 = (char *)v8;

                    swift_bridgeObjectRelease();
                    *((_WORD *)v5 + 6) = 2080;
                    uint64_t v8 = (uint64_t)v255;
                    id v260 = objc_msgSend(v255, sel_uniqueID);
                    if (!v260) {
                      goto LABEL_284;
                    }
                    v261 = v260;
                    uint64_t v262 = sub_2248C4808();
                    unint64_t v264 = v263;

                    uint64_t v266 = sub_2248B5808(8, v262, v264, v265);
                    uint64_t v268 = v267;
                    uint64_t v270 = v269;
                    uint64_t v272 = v271;
                    swift_bridgeObjectRelease();
                    uint64_t v273 = MEMORY[0x22A619320](v266, v268, v270, v272);
                    unint64_t v275 = v274;
                    swift_bridgeObjectRelease();
                    *(void *)((char *)v5 + 14) = sub_2248AD104(v273, v275, (uint64_t *)&v422);

                    swift_bridgeObjectRelease();
                    os_log_t v276 = v404;
                    _os_log_impl(&dword_22480C000, v404, (os_log_type_t)v400, "Removing reset status from delivered statuses {status: %s, device: %s}", (uint8_t *)v5, 0x16u);
                    v277 = v399;
                    swift_arrayDestroy();
                    MEMORY[0x22A61A430](v277, -1, -1);
                    MEMORY[0x22A61A430](v5, -1, -1);

                    ((void (*)(uint64_t, _DWORD *))v391->isa)(v362, v383);
                    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
                  }
                  else
                  {

                    ((void (*)(uint64_t, _DWORD *))v391->isa)(v249, v250);
                  }
                  id v215 = v396;
                  long long v240 = v411;
                }
                else
                {
                  MEMORY[0x22A619380](v247);
                  uint64_t v8 = *(void *)((v423 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  if ((unint64_t)v8 >= *(void *)((v423 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_2248C48D8();
                  }
                  sub_2248C48E8();
                  sub_2248C48C8();
                }
                ++v241;
                BOOL v116 = v242 == v240;
                uint64_t v239 = MEMORY[0x263F8EE78];
                unint64_t v59 = v390;
              }
              while (!v116);
            }
          }
          swift_bridgeObjectRelease();
          if (*(void *)(v368 + 16))
          {
            unint64_t v216 = v381;
            swift_bridgeObjectRetain_n();
            unint64_t v217 = sub_2248C4698();
            os_log_type_t v218 = sub_2248C49C8();
            if (os_log_type_enabled(v217, v218))
            {
              uint64_t v219 = swift_slowAlloc();
              v411 = swift_slowAlloc();
              v422 = v411;
              *(_DWORD *)uint64_t v219 = v361;
              os_log_t v404 = (os_log_t)(v219 + 4);
              swift_bridgeObjectRetain();
              uint64_t v221 = sub_2248B5808(8, v376, v216, v220);
              uint64_t v223 = v222;
              uint64_t v225 = v224;
              uint64_t v227 = v226;
              swift_bridgeObjectRelease();
              uint64_t v228 = v225;
              uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
              uint64_t v229 = MEMORY[0x22A619320](v221, v223, v228, v227);
              unint64_t v231 = v230;
              swift_bridgeObjectRelease();
              id v418 = (id)sub_2248AD104(v229, v231, (uint64_t *)&v422);
              sub_2248C4A28();
              swift_bridgeObjectRelease_n();
              unint64_t v59 = v390;
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_22480C000, v217, v218, "Saving modified status to database {device: %s}", (uint8_t *)v219, 0xCu);
              v232 = v411;
              swift_arrayDestroy();
              MEMORY[0x22A61A430](v232, -1, -1);
              MEMORY[0x22A61A430](v219, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            uint64_t v12 = v388;
            id v233 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
            uint64_t v234 = (void *)sub_2248C47F8();
            swift_bridgeObjectRelease();
            uint64_t v8 = sub_2248C4898();
            swift_bridgeObjectRelease();
            unint64_t v235 = (void *)sub_2248C4898();
            swift_bridgeObjectRelease();
            id v236 = objc_msgSend(v233, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v234, v8, v235);

            id v237 = v236;
            MEMORY[0x22A619380]();
            uint64_t v5 = *(_DWORD **)((v421 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if ((unint64_t)v5 >= *(void *)((v421 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2248C48D8();
            }
            sub_2248C48E8();
            sub_2248C48C8();
          }
          else
          {
            swift_bridgeObjectRelease();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v12 = v388;
          }
LABEL_35:
          unint64_t v57 = v378;
          if (v59 == v374) {
            goto LABEL_194;
          }
          goto LABEL_36;
        }
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
        if (!v8) {
          goto LABEL_99;
        }
LABEL_68:
        if (v8 >= 1)
        {
          uint64_t v105 = 0;
          v402 = (char *)(v104 & 0xC000000000000001);
          v399 = (v104 + 32);
          v411 = (v102 + 56);
          os_log_t v400 = (os_log_t)v8;
          while (1)
          {
            if (v402) {
              uint64_t v106 = (objc_class *)MEMORY[0x22A619600](v105, v104);
            }
            else {
              uint64_t v106 = v399[v105].isa;
            }
            uint64_t v107 = v106;
            id v108 = [(objc_class *)v106 identifier];
            uint64_t v109 = sub_2248C4808();
            uint64_t v5 = v110;

            if (*(void *)(v102 + 16))
            {
              sub_2248C4CD8();
              sub_2248C4838();
              uint64_t v111 = sub_2248C4D08();
              uint64_t v112 = -1 << *(unsigned char *)(v102 + 32);
              unint64_t v113 = v111 & ~v112;
              if ((*(unint64_t *)((char *)&v411->isa + ((v113 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v113))
              {
                uint64_t v114 = *(void *)(v102 + 48);
                uint64_t v115 = (void *)(v114 + 16 * v113);
                BOOL v116 = *v115 == v109 && v115[1] == (void)v5;
                if (v116 || (sub_2248C4C28() & 1) != 0)
                {
LABEL_82:
                  uint64_t v117 = swift_bridgeObjectRelease();
                  MEMORY[0x22A619380](v117);
                  uint64_t v5 = *(_DWORD **)((v424 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  uint64_t v8 = (uint64_t)v400;
                  if ((unint64_t)v5 >= *(void *)((v424 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_2248C48D8();
                  }
                  sub_2248C48E8();
                  sub_2248C48C8();
                  goto LABEL_71;
                }
                uint64_t v118 = ~v112;
                while (1)
                {
                  unint64_t v113 = (v113 + 1) & v118;
                  if (((*(unint64_t *)((char *)&v411->isa + ((v113 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v113) & 1) == 0) {
                    break;
                  }
                  unint64_t v119 = (void *)(v114 + 16 * v113);
                  BOOL v120 = *v119 == v109 && v119[1] == (void)v5;
                  if (v120 || (sub_2248C4C28() & 1) != 0) {
                    goto LABEL_82;
                  }
                }
              }

              swift_bridgeObjectRelease();
              uint64_t v8 = (uint64_t)v400;
            }
            else
            {

              swift_bridgeObjectRelease();
            }
LABEL_71:
            ++v105;
            uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
            if (v105 == v8) {
              goto LABEL_99;
            }
          }
        }
        __break(1u);
        goto LABEL_193;
      }
    }
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    __break(1u);
LABEL_186:
    __break(1u);
LABEL_187:
    __break(1u);
LABEL_188:
    __break(1u);
LABEL_189:
    __break(1u);
  }
  v413 = (void (**)(uint64_t, uint64_t))(v24 & 0xC000000000000001);
  uint64_t v8 = 4;
  v411 = v24;
  while (1)
  {
    if (v413) {
      id v30 = (id)MEMORY[0x22A619600](v8 - 4, v24);
    }
    else {
      id v30 = *(id *)(v24 + 8 * v8);
    }
    id v31 = v30;
    if (__OFADD__(v8 - 4, 1)) {
      goto LABEL_185;
    }
    unint64_t v414 = v8 - 3;
    id v32 = objc_msgSend(v30, sel_idsIdentifier);
    uint64_t v5 = (_DWORD *)sub_2248C4808();
    uint64_t v34 = v33;

    id v35 = v31;
    unint64_t v36 = v403;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v422 = v36;
    unint64_t v38 = sub_2248AD83C((uint64_t)v5, v34);
    Class v39 = v36[2].isa;
    BOOL v40 = (v37 & 1) == 0;
    uint64_t v41 = (uint64_t)v39 + v40;
    if (__OFADD__(v39, v40)) {
      goto LABEL_186;
    }
    uint64_t v12 = v37;
    if ((uint64_t)v36[3].isa < v41) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_2248B0F10((uint64_t *)&unk_268093C58);
    }
LABEL_21:
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v406;
    BOOL v44 = v422;
    v403 = v422;
    if (v12)
    {
      Class v28 = v422[7].isa;
      uint64_t v29 = 8 * v38;

      *(void *)((char *)v28 + v29) = v35;
    }
    else
    {
      v422[(v38 >> 6) + 8].Class isa = (Class)((uint64_t)v422[(v38 >> 6) + 8].isa | (1 << v38));
      uint64_t v45 = (void *)((char *)v44[6].isa + 16 * v38);
      *uint64_t v45 = v5;
      v45[1] = v34;
      *((void *)v44[7].isa + v38) = v35;
      Class v46 = v44[2].isa;
      BOOL v47 = __OFADD__(v46, 1);
      uint64_t v48 = (Class)((char *)v46 + 1);
      if (v47) {
        goto LABEL_187;
      }
      v44[2].Class isa = v48;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v8;
    uint64_t v12 = v388;
    unint64_t v24 = (unint64_t)v411;
    if (v414 == v27) {
      goto LABEL_24;
    }
  }
  sub_2248AE5FC(v41, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_268093C58);
  unint64_t v42 = sub_2248AD83C((uint64_t)v5, v34);
  if ((v12 & 1) == (v43 & 1))
  {
    unint64_t v38 = v42;
    goto LABEL_21;
  }
  sub_2248C4C58();
  __break(1u);
LABEL_284:

  __break(1u);
}

void sub_22488FC20()
{
  uint64_t v1 = v0 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  if (v2)
  {
    uint64_t v3 = qword_26AC07D40;
    id v4 = v2;
    swift_bridgeObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2248C46A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_26AC07D28);
    id v6 = v4;
    swift_bridgeObjectRetain_n();
    id v7 = v6;
    uint64_t v8 = sub_2248C4698();
    os_log_type_t v9 = sub_2248C49C8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = v18;
      *(_DWORD *)uint64_t v10 = 136315138;
      id v11 = objc_msgSend(v7, sel_activeDevices);
      uint64_t v12 = sub_2248BA1D4(0, &qword_268093B38);
      uint64_t v13 = sub_2248C48A8();

      uint64_t v14 = MEMORY[0x22A6193B0](v13, v12);
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_2248AD104(v14, v16, &v19);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v8, v9, "Stopping existing browser task {activeDevices.count: %s}", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v18, -1, -1);
      MEMORY[0x22A61A430](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    objc_msgSend(v7, sel_invalidate);
    swift_bridgeObjectRelease();

    uint64_t v17 = *(void **)v1;
    *(void *)uint64_t v1 = 0;
    *(void *)(v1 + 8) = 0;
    *(unsigned char *)(v1 + 16) = 0;
    sub_2248B7C9C(v17);
  }
}

uint64_t sub_22488FEB4(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v115 = a2;
  uint64_t v118 = a1;
  uint64_t v153 = *MEMORY[0x263EF8340];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v110 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  unint64_t v147 = *(void *)(v122 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v122);
  uint64_t v121 = (char *)&v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v141 = (uint64_t)&v109 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07468);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2248C4678();
  unint64_t v146 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  BOOL v137 = (char *)&v109 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  os_log_type_t v136 = (char *)&v109 - v19;
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  int v145 = *(char **)(v148 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v148);
  BOOL v120 = (char *)&v109 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unint64_t v119 = (char *)&v109 - v23;
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (unint64_t)&v109 - v24;
  if (qword_26AC07D40 != -1) {
LABEL_49:
  }
    swift_once();
  uint64_t v26 = sub_2248C46A8();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_26AC07D28);
  swift_bridgeObjectRetain_n();
  uint64_t v123 = v27;
  Class v28 = sub_2248C4698();
  os_log_type_t v29 = sub_2248C49C8();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v134 = v6;
  uint64_t v133 = v16;
  unint64_t v140 = v25;
  unint64_t v111 = a3;
  if (v30)
  {
    id v31 = v15;
    id v32 = v5;
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    unint64_t v34 = swift_slowAlloc();
    unint64_t v151 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v150 = sub_2248AD104(v115, a3, (uint64_t *)&v151);
    uint64_t v6 = v134;
    sub_2248C4A28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22480C000, v28, v29, "deliverAllPendingStatuses START {reason: %s}", v33, 0xCu);
    swift_arrayDestroy();
    unint64_t v35 = v34;
    unint64_t v15 = v31;
    MEMORY[0x22A61A430](v35, -1, -1);
    unint64_t v36 = v33;
    uint64_t v5 = v32;
    MEMORY[0x22A61A430](v36, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v37 = sub_22489104C((unsigned char *)0xD000000000000025, 0x80000002248CEDF0);
  unint64_t v38 = *(void **)(v6 + 176);
  unint64_t v151 = 0;
  id v39 = objc_msgSend(v38, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v118, &v151);
  id v40 = (id)v151;
  if (!v39)
  {
    id v81 = (id)v151;
    swift_bridgeObjectRelease();
LABEL_42:
    sub_2248C4318();

    return swift_willThrow();
  }
  uint64_t v41 = v39;
  unint64_t v130 = v37;
  sub_2248BA1D4(0, (unint64_t *)&unk_26AC07728);
  unint64_t v42 = sub_2248C48A8();
  id v43 = v40;

  swift_retain();
  BOOL v44 = v5;
  uint64_t v5 = (uint64_t *)sub_2248B7444(v42);
  v139 = v44;
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v151 = 0;
  id v45 = objc_msgSend(v38, sel_allPublishedLocalStatusesInDatabaseContext_error_, v118, &v151);
  id v46 = (id)v151;
  if (!v45)
  {
    id v81 = (id)v151;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  BOOL v47 = v45;
  uint64_t v143 = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
  unint64_t v25 = sub_2248C48A8();
  id v48 = v46;

  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_2248C4BC8();
  }
  else
  {
    uint64_t v16 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v50 = v133;
  unint64_t v149 = (unint64_t)v5;
  if (v16)
  {
    uint64_t v142 = (uint64_t *)(v6 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    unint64_t v132 = v25 & 0xC000000000000001;
    os_log_t v131 = (unsigned int (**)(char *, uint64_t, uint64_t))(v146 + 48);
    uint64_t v129 = (void (**)(char *, char *, uint64_t))(v146 + 32);
    uint64_t v128 = (void (**)(char *, char *, uint64_t))(v146 + 16);
    id v127 = (void (**)(char *, uint64_t))(v146 + 8);
    uint64_t v126 = (void (**)(uint64_t, uint64_t))(v145 + 8);
    uint64_t v138 = v145 + 16;
    uint64_t v114 = &v151;
    uint64_t v117 = (void (**)(char *, uint64_t, uint64_t))(v147 + 16);
    BOOL v116 = (void (**)(uint64_t, uint64_t))(v147 + 8);
    a3 = 4;
    *(void *)&long long v49 = 136315138;
    long long v113 = v49;
    uint64_t v112 = MEMORY[0x263F8EE58] + 8;
    uint64_t v125 = v15;
    unint64_t v144 = v25;
    uint64_t v124 = v16;
    do
    {
      unint64_t v59 = a3 - 4;
      if (v132)
      {
        uint64_t v60 = (char *)MEMORY[0x22A619600](a3 - 4, v25);
        unint64_t v61 = a3 - 3;
        if (__OFADD__(v59, 1)) {
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v60 = (char *)*(id *)(v25 + 8 * a3);
        unint64_t v61 = a3 - 3;
        if (__OFADD__(v59, 1))
        {
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
      }
      unint64_t v146 = v61;
      unint64_t v147 = a3;
      id v62 = v60;
      id v63 = objc_msgSend(v60, sel_keyDomain);
      sub_2248C4808();

      sub_2248C4658();
      if ((*v131)(v15, 1, v50) == 1)
      {
        sub_2248BA318((uint64_t)v15, &qword_26AC07468);
        uint64_t v93 = sub_2248C4648();
        sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
        swift_allocError();
        uint64_t v95 = v94;
        unint64_t v151 = 0;
        unint64_t v152 = 0xE000000000000000;
        sub_2248C4AE8();
        swift_bridgeObjectRelease();
        unint64_t v151 = 0xD00000000000001FLL;
        unint64_t v152 = 0x80000002248CEB20;
        id v96 = objc_msgSend(v62, sel_keyDomain);
        sub_2248C4808();

        sub_2248C4858();
        swift_bridgeObjectRelease();
        unint64_t v97 = v152;
        *uint64_t v95 = v151;
        v95[1] = v97;
        (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v93 - 8) + 104))(v95, *MEMORY[0x263F526B8], v93);
        swift_willThrow();
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v64 = v6;
      id v65 = v136;
      (*v129)(v136, v15, v50);
      (*v128)(v137, v65, v50);
      int v145 = v62;
      id v66 = objc_msgSend(v62, sel_keyName);
      sub_2248C4808();

      sub_2248B040C();
      sub_2248B0460();
      uint64_t v67 = v140;
      sub_2248C4618();
      (*v127)(v65, v50);
      uint64_t v68 = v142;
      swift_beginAccess();
      if (*(void *)(*v68 + 16) && (sub_2248AD8B4(v67), (v69 & 1) != 0))
      {
        swift_endAccess();
        (*v126)(v67, v148);

        uint64_t v6 = v64;
        unint64_t v25 = v144;
        unint64_t v15 = v125;
      }
      else
      {
        swift_endAccess();
        char v70 = v139;
        sub_224892D18(v67, v144, v149, v130, v141);
        if (v70)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v126)(v67, v148);
          return swift_bridgeObjectRelease();
        }
        v139 = 0;
        uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))v138;
        uint64_t v72 = v119;
        uint64_t v73 = v148;
        (*(void (**)(char *, uint64_t, uint64_t))v138)(v119, v67, v148);
        uint64_t v74 = sub_2248C4698();
        os_log_type_t v75 = sub_2248C49C8();
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v76 = (uint8_t *)swift_slowAlloc();
          unint64_t v77 = swift_slowAlloc();
          unint64_t v151 = v77;
          *(_DWORD *)uint64_t v76 = v113;
          sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
          uint64_t v78 = sub_2248C4C18();
          uint64_t v150 = sub_2248AD104(v78, v79, (uint64_t *)&v151);
          uint64_t v73 = v148;
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          v135 = *v126;
          v135((uint64_t)v72, v73);
          _os_log_impl(&dword_22480C000, v74, v75, "Adding new delivery subject {key: %s}", v76, 0xCu);
          swift_arrayDestroy();
          unint64_t v80 = v77;
          uint64_t v67 = v140;
          MEMORY[0x22A61A430](v80, -1, -1);
          MEMORY[0x22A61A430](v76, -1, -1);
        }
        else
        {
          v135 = *v126;
          v135((uint64_t)v72, v73);
        }

        uint64_t v51 = (uint64_t)v120;
        v71(v120, v67, v73);
        uint64_t v52 = v67;
        uint64_t v53 = v73;
        uint64_t v54 = v141;
        uint64_t v55 = v122;
        (*v117)(v121, v141, v122);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076B0);
        swift_allocObject();
        uint64_t v56 = sub_2248C46E8();
        uint64_t v5 = v142;
        swift_beginAccess();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v150 = *v5;
        uint64_t *v5 = 0x8000000000000000;
        sub_2248B04B4(v56, v51, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_26AC07748);
        uint64_t *v5 = v150;
        swift_bridgeObjectRelease();
        uint64_t v58 = v135;
        v135(v51, v53);
        swift_endAccess();

        (*v116)(v54, v55);
        v58(v52, v53);
        uint64_t v6 = v134;
        unint64_t v15 = v125;
        uint64_t v50 = v133;
        unint64_t v25 = v144;
      }
      a3 = v147 + 1;
      uint64_t v16 = v124;
    }
    while (v146 != v124);
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  unint64_t v151 = MEMORY[0x263F8EE78];
  unint64_t v82 = v149;
  if (!(v149 >> 62))
  {
    uint64_t v83 = *(void *)((v149 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v83) {
      goto LABEL_29;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    unint64_t v92 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  uint64_t v83 = sub_2248C4BC8();
  swift_bridgeObjectRelease();
  if (!v83) {
    goto LABEL_52;
  }
LABEL_29:
  if (v83 < 1) {
    __break(1u);
  }
  uint64_t v84 = 0;
  unint64_t v85 = v82 & 0xC000000000000001;
  do
  {
    if (v85) {
      id v86 = (id)MEMORY[0x22A619600](v84, v82);
    }
    else {
      id v86 = *(id *)(v82 + 8 * v84 + 32);
    }
    uint64_t v87 = v86;
    id v88 = objc_msgSend(v86, sel_pendingStatuses);
    unint64_t v89 = sub_2248C48A8();

    if (v89 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v90 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v90 = *(void *)((v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v90)
    {
      sub_2248C4B38();
      sub_2248C4B58();
      sub_2248C4B68();
      sub_2248C4B48();
    }
    else
    {
    }
    ++v84;
    unint64_t v82 = v149;
  }
  while (v83 != v84);
  swift_bridgeObjectRelease();
  unint64_t v92 = v151;
  if ((v151 & 0x8000000000000000) != 0)
  {
LABEL_56:
    swift_retain();
    uint64_t v105 = sub_2248C4BC8();
    swift_release();
    if (!v105) {
      goto LABEL_57;
    }
LABEL_55:
    uint64_t v98 = sub_2248C4938();
    uint64_t v99 = (uint64_t)v110;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56))(v110, 1, 1, v98);
    uint64_t v100 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
    uint64_t v101 = (void *)swift_allocObject();
    v101[2] = v6;
    v101[3] = v100;
    v101[4] = v92;
    v101[5] = v6;
    unint64_t v102 = v111;
    v101[6] = v115;
    v101[7] = v102;
    id v103 = v118;
    v101[8] = v118;
    swift_retain_n();
    swift_bridgeObjectRetain();
    id v104 = v103;
    return sub_22488309C(v99, (uint64_t)&unk_268093B20, (uint64_t)v101);
  }
LABEL_53:
  if ((v92 & 0x4000000000000000) != 0) {
    goto LABEL_56;
  }
  if (*(void *)(v92 + 16)) {
    goto LABEL_55;
  }
LABEL_57:
  swift_release();
  uint64_t v106 = sub_2248C4698();
  os_log_type_t v107 = sub_2248C49C8();
  if (os_log_type_enabled(v106, v107))
  {
    id v108 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v108 = 0;
    _os_log_impl(&dword_22480C000, v106, v107, "deliverAllPendingStatuses SKIP. No devices with pending statuses", v108, 2u);
    MEMORY[0x22A61A430](v108, -1, -1);
  }

  return 0;
}

uint64_t sub_22489104C(unsigned char *a1, unint64_t a2)
{
  id v5 = objc_msgSend(*(id *)(v2 + 184), sel_idsDevices);
  if (!v5)
  {
    if (qword_26AC07D40 == -1) {
      goto LABEL_27;
    }
    goto LABEL_34;
  }
  uint64_t v6 = v5;
  sub_2248BA1D4(0, (unint64_t *)&unk_26AC07738);
  a2 = sub_2248C48A8();

  a1 = sub_2248943E0();
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (!(a2 >> 62))
  {
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_4;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2248C4BC8();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_31;
  }
LABEL_4:
  if (v7 < 1)
  {
    __break(1u);
LABEL_34:
    swift_once();
LABEL_27:
    uint64_t v23 = sub_2248C46A8();
    __swift_project_value_buffer(v23, (uint64_t)qword_26AC07D28);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_2248C4698();
    os_log_type_t v25 = sub_2248C49A8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v29[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_2248AD104((uint64_t)a1, a2, v29);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22480C000, v24, v25, "%s FAILED - idsDeviceProviding.idsDevices is nil", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v27, -1, -1);
      MEMORY[0x22A61A430](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v8 = 0;
  unint64_t v9 = a2 & 0xC000000000000001;
  unint64_t v10 = a2 + 32;
  uint64_t v11 = a1 + 56;
  unint64_t v28 = a2;
  do
  {
    if (v9) {
      id v13 = (id)MEMORY[0x22A619600](v8, a2);
    }
    else {
      id v13 = *(id *)(v10 + 8 * v8);
    }
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_deviceType);
    if (*((void *)a1 + 2))
    {
      id v16 = v15;
      sub_2248C4CD8();
      sub_2248C4CE8();
      uint64_t v17 = sub_2248C4D08();
      uint64_t v18 = -1 << a1[32];
      unint64_t v19 = v17 & ~v18;
      if ((*(void *)&v11[(v19 >> 3) & 0xFFFFFFFFFFFFFF8] >> v19))
      {
        uint64_t v20 = *((void *)a1 + 6);
        if (*(id *)(v20 + 8 * v19) == v16)
        {
LABEL_20:
          switch((unint64_t)objc_msgSend(v14, sel_deviceType))
          {
            case 1uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] >= 14) {
                goto LABEL_7;
              }
              break;
            case 2uLL:
            case 3uLL:
            case 4uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] > 16) {
                goto LABEL_7;
              }
              break;
            case 9uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] > 0)
              {
LABEL_7:
                id v12 = v14;
                MEMORY[0x22A619380]();
                if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_2248C48D8();
                }
                sub_2248C48E8();
                sub_2248C48C8();
                a2 = v28;
              }
              break;
            default:
              break;
          }
        }
        else
        {
          uint64_t v21 = ~v18;
          while (1)
          {
            unint64_t v19 = (v19 + 1) & v21;
            if (((*(void *)&v11[(v19 >> 3) & 0xFFFFFFFFFFFFFF8] >> v19) & 1) == 0) {
              break;
            }
            if (*(id *)(v20 + 8 * v19) == v16) {
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v8;
  }
  while (v8 != v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_2248914E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v25[1] = *(id *)MEMORY[0x263EF8340];
  id v7 = objc_msgSend(*(id *)(v3 + 184), sel_idsDevices);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_2248BA1D4(0, (unint64_t *)&unk_26AC07738);
    unint64_t v9 = sub_2248C48A8();

    unint64_t v10 = *(void **)(v3 + 176);
    v25[0] = 0;
    id v11 = objc_msgSend(v10, sel_allPublishedLocalStatusesInDatabaseContext_error_, a2, v25);
    id v12 = v25[0];
    if (v11)
    {
      id v13 = v11;
      sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
      unint64_t v14 = sub_2248C48A8();
      id v15 = v12;

      v25[0] = 0;
      id v16 = objc_msgSend(v10, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, a2, v25);
      id v17 = v25[0];
      if (v16)
      {
        uint64_t v18 = v16;
        sub_2248BA1D4(0, (unint64_t *)&unk_26AC07728);
        unint64_t v19 = sub_2248C48A8();
        id v20 = v17;

        sub_224892D18(a1, v14, v19, v9, a3);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      id v24 = v25[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v24 = v25[0];
      swift_bridgeObjectRelease();
    }
    sub_2248C4318();
  }
  else
  {
    uint64_t v22 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    *uint64_t v23 = 0xD00000000000001DLL;
    v23[1] = 0x80000002248CF040;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v23, *MEMORY[0x263F526C0], v22);
  }
  return swift_willThrow();
}

void sub_2248917B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v29 = a2;
  uint64_t v27 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076A0);
  uint64_t v26 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = (uint64_t *)(v3 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
  swift_beginAccess();
  uint64_t v15 = *v14;
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_2248AD8B4(a3), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
    swift_endAccess();
    swift_retain();
    sub_2248C46D8();
    uint64_t v28 = v18;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076B0);
    uint64_t v20 = sub_2248BA0BC(&qword_26AC076A8, (uint64_t *)&unk_26AC076B0);
    MEMORY[0x22A6191F0](v19, v20);
    sub_2248BA0BC((unint64_t *)&unk_26AC07690, &qword_26AC076A0);
    sub_2248BA0BC(&qword_26AC075A8, &qword_26AC075B0);
    sub_2248BA0BC(&qword_26AC075A0, &qword_26AC075B0);
    uint64_t v21 = v29;
    sub_2248C4968();
    swift_release();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    swift_endAccess();
    id v23 = objc_msgSend(*(id *)(v5 + 168), sel_newBackgroundContext);
    sub_2248914E8(a3, (uint64_t)v23, (uint64_t)v10);

    if (!v4)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v27, v10, v7);
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v29, 1, 1, v24);
    }
  }
}

uint64_t sub_224891B50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07478);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v62 = *(void *)(v65 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v65);
  os_log_t v60 = (os_log_t)((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v52 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v52 - v13;
  uint64_t v15 = (uint64_t *)(v2 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
  swift_beginAccess();
  uint64_t v16 = *v15;
  if (*(void *)(*v15 + 16) && (unint64_t v17 = sub_2248AD8B4(a1), (v18 & 1) != 0))
  {
    uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
    swift_endAccess();
    uint64_t v20 = qword_26AC07D40;
    swift_retain();
    if (v20 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2248C46A8();
    __swift_project_value_buffer(v21, (uint64_t)qword_26AC07D28);
    uint64_t v22 = v62;
    uint64_t v23 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v14, a1, v65);
    swift_retain_n();
    uint64_t v24 = sub_2248C4698();
    os_log_type_t v25 = sub_2248C49C8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      v66[0] = v64;
      *(_DWORD *)uint64_t v26 = 136315394;
      uint64_t v59 = v4;
      unint64_t v61 = (char *)(v26 + 4);
      sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
      os_log_t v60 = v24;
      uint64_t v27 = v65;
      uint64_t v28 = sub_2248C4C18();
      uint64_t v67 = sub_2248AD104(v28, v29, v66);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v27);
      *(_WORD *)(v26 + 12) = 2048;
      unint64_t v61 = v7;
      sub_2248C46D8();
      uint64_t v30 = *(void *)(v67 + 16);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v67 = v30;
      uint64_t v4 = v59;
      uint64_t v7 = v61;
      sub_2248C4A28();
      swift_release();
      os_log_t v31 = v60;
      _os_log_impl(&dword_22480C000, v60, v25, "Subribing to existing subject {key: %s, observations.count: %ld}", (uint8_t *)v26, 0x16u);
      uint64_t v32 = v64;
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v32, -1, -1);
      MEMORY[0x22A61A430](v26, -1, -1);
    }
    else
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v23);

      swift_release();
    }
    v66[0] = v19;
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07490);
    uint64_t v50 = sub_2248BA0BC(&qword_26AC07488, &qword_26AC07490);
    MEMORY[0x22A6191F0](v49, v50);
  }
  else
  {
    uint64_t v64 = a1;
    unint64_t v61 = v7;
    uint64_t v59 = v4;
    swift_endAccess();
    v66[0] = MEMORY[0x263F8EE78];
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07490);
    swift_allocObject();
    uint64_t v33 = sub_2248C46E8();
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v58 = v5;
    uint64_t v34 = sub_2248C46A8();
    __swift_project_value_buffer(v34, (uint64_t)qword_26AC07D28);
    uint64_t v35 = v62;
    uint64_t v36 = v65;
    uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
    v56(v12, v64, v65);
    uint64_t v37 = sub_2248C4698();
    os_log_type_t v38 = sub_2248C49C8();
    if (os_log_type_enabled(v37, v38))
    {
      os_log_t v54 = v37;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v55 = v33;
      id v40 = (uint8_t *)v39;
      uint64_t v53 = swift_slowAlloc();
      v66[0] = v53;
      *(_DWORD *)id v40 = 136315138;
      uint64_t v52 = v40 + 4;
      sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
      uint64_t v41 = sub_2248C4C18();
      uint64_t v67 = sub_2248AD104(v41, v42, v66);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      id v43 = *(void (**)(char *, uint64_t))(v35 + 8);
      v43(v12, v36);
      uint64_t v37 = v54;
      _os_log_impl(&dword_22480C000, v54, v38, "Subscribing to new subject {key: %s}", v40, 0xCu);
      uint64_t v44 = v53;
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v44, -1, -1);
      id v45 = v40;
      uint64_t v33 = v55;
      MEMORY[0x22A61A430](v45, -1, -1);
    }
    else
    {
      id v43 = *(void (**)(char *, uint64_t))(v35 + 8);
      v43(v12, v36);
    }

    uint64_t v4 = v59;
    os_log_t v46 = v60;
    v56((char *)v60, v64, v36);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v67 = *v15;
    *uint64_t v15 = 0x8000000000000000;
    sub_2248B04B4(v33, (uint64_t)v46, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_26AC074D0);
    *uint64_t v15 = v67;
    swift_bridgeObjectRelease();
    v43((char *)v46, v36);
    swift_endAccess();
    v66[0] = v33;
    uint64_t v48 = sub_2248BA0BC(&qword_26AC07488, &qword_26AC07490);
    uint64_t v7 = v61;
    MEMORY[0x22A6191F0](v57, v48);
    uint64_t v5 = v58;
  }
  sub_2248BA0BC(&qword_26AC07470, (uint64_t *)&unk_26AC07478);
  sub_2248B0384(&qword_26AC074C8, &qword_26AC073F8);
  sub_2248B0384((unint64_t *)&unk_26AC074B8, &qword_26AC073F0);
  sub_2248C4968();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2248923FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2248C43C8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_2248BA318(a1, &qword_268093940);
    sub_2248ADF68(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_2248BA318((uint64_t)v10, &qword_268093940);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_2248B0204((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2248925D8(unint64_t a1, uint64_t a2, SEL *a3)
{
  unint64_t v4 = v3;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    if (!v6) {
      return v7;
    }
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2248B26F4(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    unint64_t v18 = v4;
    uint64_t v9 = 0;
    uint64_t v7 = v20;
    while (v6 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x22A619600](v9, a1);
      }
      else {
        id v10 = *(id *)(a1 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      id v12 = objc_msgSend(v10, *a3, v18);
      uint64_t v13 = sub_2248C4808();
      uint64_t v15 = v14;

      unint64_t v4 = *(void *)(v20 + 16);
      unint64_t v16 = *(void *)(v20 + 24);
      if (v4 >= v16 >> 1) {
        sub_2248B26F4(v16 > 1, v4 + 1, 1);
      }
      ++v9;
      *(void *)(v20 + 16) = v4 + 1;
      uint64_t v17 = v20 + 16 * v4;
      *(void *)(v17 + 32) = v13;
      *(void *)(v17 + 40) = v15;
      if (v6 == v9) {
        return v7;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_224892754(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_2248B26F4(0, v1, 0);
    uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8) - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      swift_getKeyPath();
      swift_getAtKeyPath();
      swift_release();
      uint64_t v2 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2248B26F4(0, *(void *)(v13 + 16) + 1, 1);
        uint64_t v2 = v13;
      }
      unint64_t v8 = *(void *)(v2 + 16);
      unint64_t v7 = *(void *)(v2 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_2248B26F4(v7 > 1, v8 + 1, 1);
        uint64_t v2 = v13;
      }
      *(void *)(v2 + 16) = v8 + 1;
      uint64_t v9 = v2 + 16 * v8;
      *(void *)(v9 + 32) = v11;
      *(void *)(v9 + 40) = v12;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2248928D4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (uint64_t)v29 - v6;
  uint64_t v36 = sub_2248C43C8();
  uint64_t v7 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  id v40 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (!v9) {
    return v10;
  }
  v29[1] = v1;
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_2248B2714(0, v9, 0);
  uint64_t result = sub_2248B5128(a1);
  uint64_t v13 = result;
  uint64_t v14 = 0;
  uint64_t v15 = a1 + 64;
  uint64_t v33 = v7 + 32;
  uint64_t v34 = a1;
  char v16 = *(unsigned char *)(a1 + 32);
  v29[0] = a1 + 88;
  int64_t v30 = v9;
  uint64_t v31 = v12;
  uint64_t v32 = a1 + 64;
  uint64_t v17 = (uint64_t)v35;
  while ((v13 & 0x8000000000000000) == 0 && v13 < 1 << v16)
  {
    unint64_t v20 = (unint64_t)v13 >> 6;
    if ((*(void *)(v15 + 8 * ((unint64_t)v13 >> 6)) & (1 << v13)) == 0) {
      goto LABEL_27;
    }
    if (*(_DWORD *)(a1 + 36) != v12) {
      goto LABEL_28;
    }
    uint64_t v21 = v37;
    sub_2248B95B0(*(void *)(a1 + 56) + *(void *)(v38 + 72) * v13, v37, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_2248B9E38(v21, v17, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_2248C4348();
    sub_2248C4358();
    sub_2248B9618(v17, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    uint64_t v10 = v41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2248B2714(0, *(void *)(v10 + 16) + 1, 1);
      uint64_t v10 = v41;
    }
    unint64_t v23 = *(void *)(v10 + 16);
    unint64_t v22 = *(void *)(v10 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_2248B2714(v22 > 1, v23 + 1, 1);
      uint64_t v10 = v41;
    }
    *(void *)(v10 + 16) = v23 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v23, v40, v36);
    uint64_t v41 = v10;
    a1 = v34;
    char v16 = *(unsigned char *)(v34 + 32);
    unint64_t v18 = 1 << v16;
    if (v13 >= 1 << v16) {
      goto LABEL_29;
    }
    uint64_t v15 = v32;
    uint64_t v24 = *(void *)(v32 + 8 * v20);
    if ((v24 & (1 << v13)) == 0) {
      goto LABEL_30;
    }
    LODWORD(v12) = v31;
    if (*(_DWORD *)(v34 + 36) != v31) {
      goto LABEL_31;
    }
    unint64_t v25 = v24 & (-2 << (v13 & 0x3F));
    if (v25)
    {
      unint64_t v18 = __clz(__rbit64(v25)) | v13 & 0xFFFFFFFFFFFFFFC0;
      int64_t v19 = v30;
    }
    else
    {
      unint64_t v26 = v20 + 1;
      unint64_t v27 = (v18 + 63) >> 6;
      int64_t v19 = v30;
      if (v20 + 1 < v27)
      {
        unint64_t v28 = *(void *)(v32 + 8 * v26);
        if (!v28)
        {
          unint64_t v26 = v20 + 2;
          if (v20 + 2 >= v27) {
            goto LABEL_4;
          }
          unint64_t v28 = *(void *)(v32 + 8 * v26);
          if (!v28)
          {
            while (v27 - 3 != v20)
            {
              unint64_t v28 = *(void *)(v29[0] + 8 * v20++);
              if (v28)
              {
                unint64_t v26 = v20 + 2;
                goto LABEL_19;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_19:
        unint64_t v18 = __clz(__rbit64(v28)) + (v26 << 6);
      }
    }
LABEL_4:
    ++v14;
    uint64_t v13 = v18;
    if (v14 == v19) {
      return v10;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_224892D18@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v7 = v5;
  unint64_t v172 = a3;
  uint64_t v151 = a5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v158 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v150 = (char *)&v141 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_2248C4548();
  unint64_t v175 = *(void (***)(char *, void, uint64_t))(v180 - 8);
  MEMORY[0x270FA5388](v180);
  uint64_t v179 = (char *)&v141 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_2248C4558();
  uint64_t v181 = *(void *)(v178 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v178);
  int v184 = (char *)&v141 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v166 = (char *)&v141 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v163 = (char *)&v141 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v156 = (char *)&v141 - v20;
  uint64_t v155 = sub_2248C43C8();
  uint64_t v173 = *(char **)(v155 - 8);
  MEMORY[0x270FA5388](v155);
  uint64_t v161 = (char *)&v141 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  uint64_t v149 = *(void *)(v157 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v157);
  uint64_t v148 = (uint64_t)&v141 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v160 = (uint64_t)&v141 - v24;
  uint64_t v162 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x270FA5388](v162);
  os_log_type_t v167 = (char *)&v141 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = v11;
  uint64_t v165 = a1;
  uint64_t v26 = sub_2248C45F8();
  uint64_t v28 = v27;
  swift_bridgeObjectRetain();
  unint64_t v29 = sub_2248B729C(a2, v26, v28);
  unint64_t v30 = v6;
  swift_bridgeObjectRelease();
  id v159 = v29;
  if (!v29)
  {
    uint64_t v131 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    uint64_t v133 = v132;
    uint64_t v189 = 0x6620737574617473;
    unint64_t v190 = 0xEB0000000020726FLL;
    sub_2248C4858();
    swift_bridgeObjectRelease();
    unint64_t v134 = v190;
    *uint64_t v133 = v189;
    v133[1] = v134;
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v131 - 8) + 104))(v133, *MEMORY[0x263F526C0], v131);
    return swift_willThrow();
  }
  uint64_t v187 = v26;
  uint64_t v188 = v28;
  unint64_t isUniquelyReferenced_nonNull_native = sub_22488504C(MEMORY[0x263F8EE78], &qword_268093C48);
  if (a4 >> 62) {
    goto LABEL_110;
  }
  uint64_t v32 = *(char **)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_4:
  unint64_t v177 = v7;
  unint64_t v146 = v30;
  if (v32)
  {
    unint64_t v185 = a4 & 0xC000000000000001;
    unint64_t v7 = 4;
    unint64_t v182 = a4;
    do
    {
      if (v185) {
        id v34 = (id)MEMORY[0x22A619600](v7 - 4, a4);
      }
      else {
        id v34 = *(id *)(a4 + 8 * v7);
      }
      unint64_t v30 = (unint64_t)v34;
      if (__OFADD__(v7 - 4, 1))
      {
LABEL_105:
        __break(1u);
LABEL_106:
        __break(1u);
LABEL_107:
        __break(1u);
LABEL_108:
        __break(1u);
LABEL_109:
        __break(1u);
LABEL_110:
        swift_bridgeObjectRetain();
        uint64_t v32 = (char *)sub_2248C4BC8();
        goto LABEL_4;
      }
      uint64_t v186 = (char *)(v7 - 3);
      id v35 = objc_msgSend(v34, sel_uniqueID);
      if (!v35)
      {
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
        goto LABEL_120;
      }
      uint64_t v36 = v35;
      uint64_t v37 = sub_2248C4808();
      uint64_t v39 = v38;

      a4 = (unint64_t)(id)v30;
      unint64_t v40 = isUniquelyReferenced_nonNull_native;
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v189 = v40;
      unint64_t v30 = sub_2248AD83C(v37, v39);
      uint64_t v42 = *(void *)(v40 + 16);
      BOOL v43 = (v41 & 1) == 0;
      uint64_t v44 = v42 + v43;
      if (__OFADD__(v42, v43)) {
        goto LABEL_106;
      }
      char v45 = v41;
      if (*(void *)(v40 + 24) >= v44)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t isUniquelyReferenced_nonNull_native = v40;
          if (v41) {
            goto LABEL_6;
          }
        }
        else
        {
          sub_2248B0F10(&qword_268093C48);
          unint64_t isUniquelyReferenced_nonNull_native = v189;
          if (v45) {
            goto LABEL_6;
          }
        }
      }
      else
      {
        sub_2248AE5FC(v44, isUniquelyReferenced_nonNull_native, &qword_268093C48);
        unint64_t isUniquelyReferenced_nonNull_native = v189;
        unint64_t v46 = sub_2248AD83C(v37, v39);
        if ((v45 & 1) != (v47 & 1)) {
          goto LABEL_123;
        }
        unint64_t v30 = v46;
        if (v45)
        {
LABEL_6:
          uint64_t v33 = *(void *)(isUniquelyReferenced_nonNull_native + 56);
          v30 *= 8;

          *(void *)(v33 + v30) = a4;
          goto LABEL_7;
        }
      }
      *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v30 >> 6) + 64) |= 1 << v30;
      uint64_t v48 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v30);
      *uint64_t v48 = v37;
      v48[1] = v39;
      *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v30) = a4;
      uint64_t v49 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
      BOOL v50 = __OFADD__(v49, 1);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_108;
      }
      *(void *)(isUniquelyReferenced_nonNull_native + 16) = v51;
      swift_bridgeObjectRetain();
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      ++v7;
      a4 = v182;
    }
    while (v186 != v32);
  }
  swift_bridgeObjectRelease();
  if (v172 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_2248C4BC8();
    if (v52) {
      goto LABEL_26;
    }
LABEL_112:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v136 = objc_msgSend(v159, sel_payload);
    if (v136)
    {
      BOOL v137 = v136;
      uint64_t v138 = sub_2248C4338();
      unint64_t v140 = v139;
    }
    else
    {
      uint64_t v138 = 0;
      unint64_t v140 = 0xF000000000000000;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v158 + 16))(v150, v165, v164);
    uint64_t v189 = v138;
    unint64_t v190 = v140;
    sub_2248B040C();
    sub_2248B0460();
    sub_2248BA060();
    sub_2248C4418();

    return swift_bridgeObjectRelease();
  }
  uint64_t v52 = *(void *)((v172 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v52) {
    goto LABEL_112;
  }
LABEL_26:
  unint64_t v7 = 0;
  unint64_t v154 = (uint64_t *)(v177 + OBJC_IVAR___SKALocalStatusServer_failedDeliveries);
  unint64_t v177 = v172 & 0xC000000000000001;
  uint64_t v169 = v172 & 0xFFFFFFFFFFFFFF8;
  unint64_t v168 = v172 + 32;
  uint64_t v153 = (void (**)(char *, uint64_t, uint64_t))(v158 + 16);
  unint64_t v144 = (void (**)(char *, char *, uint64_t))(v173 + 16);
  unsigned int v143 = *MEMORY[0x263F52660];
  uint64_t v174 = v181 + 32;
  v175 += 13;
  uint64_t v142 = (void (**)(char *, uint64_t))(v173 + 8);
  unsigned int v147 = *MEMORY[0x263F52668];
  unsigned int v152 = *MEMORY[0x263F52670];
  unint64_t v53 = MEMORY[0x263F8EE78];
  unsigned int v171 = *MEMORY[0x263F52658];
  unint64_t v183 = isUniquelyReferenced_nonNull_native;
  uint64_t v176 = v52;
  while (1)
  {
    if (v177)
    {
      uint64_t v56 = (char *)MEMORY[0x22A619600](v7, v172);
      BOOL v50 = __OFADD__(v7++, 1);
      if (v50) {
        goto LABEL_107;
      }
    }
    else
    {
      if (v7 >= *(void *)(v169 + 16)) {
        goto LABEL_109;
      }
      uint64_t v56 = (char *)*(id *)(v168 + 8 * v7);
      BOOL v50 = __OFADD__(v7++, 1);
      if (v50) {
        goto LABEL_107;
      }
    }
    unint64_t v185 = v7;
    uint64_t v186 = v56;
    id v57 = objc_msgSend(v56, sel_idsIdentifier);
    uint64_t v58 = sub_2248C4808();
    uint64_t v60 = v59;

    unint64_t isUniquelyReferenced_nonNull_native = v183;
    if (!*(void *)(v183 + 16) || (unint64_t v61 = sub_2248AD83C(v58, v60), (v62 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v55 = v186;
      id v76 = objc_msgSend(v186, sel_idsIdentifier);
      sub_2248C4808();

      (*v175)(v179, v171, v180);
      sub_2248C4538();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v53 = sub_2248ACD74(0, *(void *)(v53 + 16) + 1, 1, v53);
      }
      uint64_t v54 = v176;
      unint64_t v7 = v185;
      unint64_t v30 = *(void *)(v53 + 16);
      unint64_t v77 = *(void *)(v53 + 24);
      if (v30 >= v77 >> 1) {
        unint64_t v53 = sub_2248ACD74(v77 > 1, v30 + 1, 1, v53);
      }
      *(void *)(v53 + 16) = v30 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v181 + 32))(v53+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v30, v184, v178);
      goto LABEL_29;
    }
    uint64_t v173 = (char *)*(id *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v61);
    swift_bridgeObjectRelease();
    id v63 = objc_msgSend(v186, sel_pendingStatuses);
    uint64_t v170 = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
    unint64_t v64 = sub_2248C48A8();

    unint64_t v182 = v53;
    if (!(v64 >> 62))
    {
      uint64_t v65 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v65) {
        break;
      }
      goto LABEL_51;
    }
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_2248C4BC8();
    if (v65) {
      break;
    }
LABEL_51:
    swift_bridgeObjectRelease_n();
    unint64_t v74 = v182;
    os_log_type_t v75 = v186;
LABEL_75:
    id v112 = objc_msgSend(v75, sel_deliveredStatuses);
    unint64_t v113 = sub_2248C48A8();

    unint64_t v182 = v74;
    if (v113 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v114 = sub_2248C4BC8();
      if (v114)
      {
LABEL_77:
        unint64_t v7 = v113 & 0xC000000000000001;
        uint64_t v115 = 4;
        while (1)
        {
          unint64_t isUniquelyReferenced_nonNull_native = v115 - 4;
          id v116 = v7 ? (id)MEMORY[0x22A619600](v115 - 4, v113) : *(id *)(v113 + 8 * v115);
          uint64_t v117 = v116;
          unint64_t v30 = v115 - 3;
          if (__OFADD__(isUniquelyReferenced_nonNull_native, 1)) {
            break;
          }
          id v118 = objc_msgSend(v116, sel_identifier);
          a4 = sub_2248C4808();
          uint64_t v120 = v119;

          if (a4 == v187 && v120 == v188)
          {

            swift_bridgeObjectRelease();
LABEL_90:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v123 = objc_msgSend(v186, sel_idsIdentifier);
            sub_2248C4808();

            uint64_t v124 = v173;
            id v125 = objc_msgSend(v173, sel_name);
            unint64_t v53 = v182;
            if (!v125) {
              goto LABEL_117;
            }
            uint64_t v126 = v125;
            a4 = sub_2248C4808();

            id v127 = objc_msgSend(v124, sel_modelIdentifier);
            if (v127)
            {
              uint64_t v128 = v127;
              sub_2248C4808();

              (*v175)(v179, v152, v180);
              sub_2248C4538();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v53 = sub_2248ACD74(0, *(void *)(v53 + 16) + 1, 1, v53);
              }
              unint64_t isUniquelyReferenced_nonNull_native = v183;
              uint64_t v54 = v176;
              unint64_t v7 = v185;
              uint64_t v129 = v186;
              unint64_t v30 = *(void *)(v53 + 16);
              unint64_t v130 = *(void *)(v53 + 24);
              if (v30 >= v130 >> 1) {
                unint64_t v53 = sub_2248ACD74(v130 > 1, v30 + 1, 1, v53);
              }
              *(void *)(v53 + 16) = v30 + 1;
              (*(void (**)(unint64_t, char *, uint64_t))(v181 + 32))(v53+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v30, v166, v178);

              goto LABEL_28;
            }
            goto LABEL_118;
          }
          char v122 = sub_2248C4C28();
          swift_bridgeObjectRelease();

          if (v122) {
            goto LABEL_90;
          }
          ++v115;
          if (v30 == v114) {
            goto LABEL_27;
          }
        }
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
    }
    else
    {
      uint64_t v114 = *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v114) {
        goto LABEL_77;
      }
    }
LABEL_27:

    swift_bridgeObjectRelease_n();
    unint64_t v53 = v182;
    unint64_t isUniquelyReferenced_nonNull_native = v183;
    uint64_t v54 = v176;
    unint64_t v7 = v185;
LABEL_28:
    uint64_t v55 = v173;
LABEL_29:

    if (v7 == v54) {
      goto LABEL_112;
    }
  }
  unint64_t v7 = v64 & 0xC000000000000001;
  uint64_t v66 = 4;
  while (1)
  {
    unint64_t isUniquelyReferenced_nonNull_native = v66 - 4;
    if (v7) {
      id v67 = (id)MEMORY[0x22A619600](v66 - 4, v64);
    }
    else {
      id v67 = *(id *)(v64 + 8 * v66);
    }
    uint64_t v68 = v67;
    unint64_t v30 = v66 - 3;
    if (__OFADD__(isUniquelyReferenced_nonNull_native, 1))
    {
      __break(1u);
      goto LABEL_104;
    }
    id v69 = objc_msgSend(v67, sel_identifier);
    a4 = sub_2248C4808();
    uint64_t v71 = v70;

    if (a4 == v187 && v71 == v188) {
      break;
    }
    char v73 = sub_2248C4C28();
    swift_bridgeObjectRelease();

    if (v73) {
      goto LABEL_58;
    }
    ++v66;
    if (v30 == v65) {
      goto LABEL_51;
    }
  }

  swift_bridgeObjectRelease();
LABEL_58:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v78 = (uint64_t)v167;
  (*v153)(v167, v165, v164);
  unint64_t v79 = v186;
  id v80 = objc_msgSend(v186, sel_idsIdentifier);
  uint64_t v81 = sub_2248C4808();
  uint64_t v83 = v82;

  uint64_t v84 = (uint64_t *)(v78 + *(int *)(v162 + 20));
  uint64_t *v84 = v81;
  v84[1] = v83;
  unint64_t v85 = v154;
  swift_beginAccess();
  uint64_t v86 = *v85;
  unint64_t v74 = v182;
  if (*(void *)(v86 + 16))
  {
    unint64_t v87 = sub_2248AD75C(v78);
    if (v88)
    {
      uint64_t v89 = v148;
      sub_2248B95B0(*(void *)(v86 + 56) + *(void *)(v149 + 72) * v87, v148, type metadata accessor for SKALocalStatusServer.FailedDelivery);
      sub_2248B9E38(v89, v160, type metadata accessor for SKALocalStatusServer.FailedDelivery);
      swift_endAccess();
      sub_2248C4348();
      sub_2248C4358();
      id v90 = objc_msgSend(v79, sel_idsIdentifier);
      sub_2248C4808();

      char v91 = v173;
      id v92 = objc_msgSend(v173, sel_name);
      if (!v92) {
        goto LABEL_121;
      }
      uint64_t v93 = v92;
      sub_2248C4808();

      id v94 = objc_msgSend(v91, sel_modelIdentifier);
      if (v94)
      {
        uint64_t v95 = v94;
        uint64_t v145 = sub_2248C4808();
        a4 = v96;

        uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093C40);
        uint64_t v98 = v179;
        uint64_t v99 = &v179[*(int *)(v97 + 48)];
        (*v144)(v179, v161, v155);
        uint64_t v100 = (void *)(v160 + *(int *)(v157 + 24));
        uint64_t v101 = v100[1];
        *(void *)uint64_t v99 = *v100;
        *((void *)v99 + 1) = v101;
        (*v175)(v98, v143, v180);
        swift_bridgeObjectRetain();
        sub_2248C4538();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v74 = sub_2248ACD74(0, *(void *)(v74 + 16) + 1, 1, v74);
        }
        uint64_t v102 = (uint64_t)v167;
        os_log_type_t v75 = v186;
        unint64_t v30 = *(void *)(v74 + 16);
        unint64_t v103 = *(void *)(v74 + 24);
        if (v30 >= v103 >> 1) {
          unint64_t v74 = sub_2248ACD74(v103 > 1, v30 + 1, 1, v74);
        }
        *(void *)(v74 + 16) = v30 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v181 + 32))(v74+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v30, v156, v178);
        (*v142)(v161, v155);
        sub_2248B9618(v160, type metadata accessor for SKALocalStatusServer.FailedDelivery);
LABEL_74:
        sub_2248B9618(v102, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        goto LABEL_75;
      }
      goto LABEL_122;
    }
  }
  swift_endAccess();
  id v104 = objc_msgSend(v79, sel_idsIdentifier);
  sub_2248C4808();

  uint64_t v105 = v173;
  id v106 = objc_msgSend(v173, sel_name);
  if (!v106) {
    goto LABEL_119;
  }
  os_log_type_t v107 = v106;
  sub_2248C4808();
  a4 = v108;

  id v109 = objc_msgSend(v105, sel_modelIdentifier);
  if (v109)
  {
    uint64_t v110 = v109;
    sub_2248C4808();

    (*v175)(v179, v147, v180);
    sub_2248C4538();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v74 = sub_2248ACD74(0, *(void *)(v74 + 16) + 1, 1, v74);
    }
    uint64_t v102 = (uint64_t)v167;
    os_log_type_t v75 = v186;
    unint64_t v30 = *(void *)(v74 + 16);
    unint64_t v111 = *(void *)(v74 + 24);
    if (v30 >= v111 >> 1) {
      unint64_t v74 = sub_2248ACD74(v111 > 1, v30 + 1, 1, v74);
    }
    *(void *)(v74 + 16) = v30 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v181 + 32))(v74+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v30, v163, v178);
    goto LABEL_74;
  }
LABEL_120:
  __break(1u);
LABEL_121:
  __break(1u);
LABEL_122:
  __break(1u);
LABEL_123:
  uint64_t result = sub_2248C4C58();
  __break(1u);
  return result;
}

uint64_t sub_2248942A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_2248C4CD8();
    sub_2248C4838();
    uint64_t v6 = sub_2248C4D08();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2248C4C28() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2248C4C28() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_2248943E0()
{
  v31[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v30 = sub_2248C45D8();
  uint64_t v1 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(*(id *)(v0 + 168), sel_newBackgroundContext);
  unint64_t v5 = *(void **)(v0 + 176);
  v31[0] = 0;
  id v6 = objc_msgSend(v5, sel_allPublishedLocalStatusesInDatabaseContext_error_, v4, v31);
  id v7 = v31[0];
  if (!v6)
  {
    id v18 = v31[0];
    uint64_t v3 = (char *)sub_2248C4318();

    swift_willThrow();
    if (qword_26AC07D40 == -1)
    {
LABEL_12:
      uint64_t v19 = sub_2248C46A8();
      __swift_project_value_buffer(v19, (uint64_t)qword_26AC07D28);
      uint64_t v20 = v3;
      uint64_t v21 = v3;
      uint64_t v22 = sub_2248C4698();
      os_log_type_t v23 = sub_2248C49A8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 138412290;
        uint64_t v26 = v3;
        uint64_t v27 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v31[0] = v27;
        sub_2248C4A28();
        *uint64_t v25 = v27;

        _os_log_impl(&dword_22480C000, v22, v23, "Filtered Device Types FAILED - error reading allPublishedLocalStatuses: %@", v24, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v25, -1, -1);
        MEMORY[0x22A61A430](v24, -1, -1);
      }
      else
      {
      }
      return (id)MEMORY[0x263F8EE88];
    }
LABEL_20:
    swift_once();
    goto LABEL_12;
  }
  unint64_t v8 = v6;
  sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
  unint64_t v9 = sub_2248C48A8();
  id v10 = v7;

  v31[0] = (id)MEMORY[0x263F8EE88];
  if (!(v9 >> 62))
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_4;
    }
LABEL_17:

    swift_bridgeObjectRelease();
    return (id)MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_2248C4BC8();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_17;
  }
LABEL_4:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v29 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = (void (**)(char *, uint64_t))(v1 + 8);
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x22A619600](v12, v9);
    }
    else {
      id v14 = *(id *)(v9 + 8 * v12 + 32);
    }
    unint64_t v15 = v14;
    ++v12;
    objc_msgSend(v14, sel_targetDevicesFlags);
    sub_2248C45B8();
    uint64_t v16 = sub_2248C4568();
    (*v13)(v3, v30);
    sub_2248947E8(v16);
  }
  while (v11 != v12);

  swift_bridgeObjectRelease();
  return v31[0];
}

uint64_t sub_2248947E8(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    uint64_t result = sub_2248B1B0C(&v13, *(void *)(*(void *)(v1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_224894944(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22489104C((unsigned char *)0xD000000000000025, 0x80000002248CEF30);
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v21 = a1;
    uint64_t v22 = a2;
    if (v6) {
      goto LABEL_3;
    }
LABEL_17:
    unint64_t v9 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease_n();
    char v20 = sub_224894E94(v21, v22, v9);
    swift_bridgeObjectRelease();
    return v20 & 1;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2248C4BC8();
  uint64_t v6 = result;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x22A619600](v8, v5);
      }
      else {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
      }
      unint64_t v11 = v10;
      id v12 = objc_msgSend(v10, sel_uniqueID, v21, v22);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = sub_2248C4808();
        uint64_t v16 = v15;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v9 = sub_2248AC9F4(0, v9[2] + 1, 1, v9);
        }
        unint64_t v18 = v9[2];
        unint64_t v17 = v9[3];
        if (v18 >= v17 >> 1) {
          unint64_t v9 = sub_2248AC9F4((void *)(v17 > 1), v18 + 1, 1, v9);
        }
        v9[2] = v18 + 1;
        uint64_t v19 = &v9[2 * v18];
        v19[4] = v14;
        v19[5] = v16;
      }
      else
      {
      }
      ++v8;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_224894B18(void (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093CD0);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
  uint64_t v28 = *(v8 - 1);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v32 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v27 = (char *)&v25 - v11;
  if (a3 >> 62) {
    goto LABEL_20;
  }
  uint64_t v12 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; uint64_t v12 = sub_2248C4BC8())
  {
    uint64_t v30 = (unsigned int (**)(char *, uint64_t, void *))(v28 + 48);
    unint64_t v31 = a3 & 0xC000000000000001;
    uint64_t v29 = v28 + 32;
    id v35 = v8;
    unint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t v13 = 4;
    unint64_t v26 = a3;
    uint64_t v14 = (void (**)(char *, char *, void *))(v28 + 32);
    while (1)
    {
      uint64_t v15 = v31 ? (void *)MEMORY[0x22A619600](v13 - 4, a3) : *(id *)(a3 + 8 * v13);
      uint64_t v8 = v15;
      uint64_t v16 = v13 - 3;
      if (__OFADD__(v13 - 4, 1)) {
        break;
      }
      id v37 = v15;
      v33(&v37);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }

      unint64_t v17 = v35;
      if ((*v30)(v7, 1, v35) == 1)
      {
        sub_2248BA318((uint64_t)v7, &qword_268093CD0);
      }
      else
      {
        unint64_t v18 = *v14;
        uint64_t v19 = v27;
        (*v14)(v27, v7, v17);
        v18(v32, v19, v17);
        unint64_t v20 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v20 = sub_2248ACB04(0, *(void *)(v20 + 16) + 1, 1, v20);
        }
        unint64_t v22 = *(void *)(v20 + 16);
        unint64_t v21 = *(void *)(v20 + 24);
        unint64_t v36 = v20;
        if (v22 >= v21 >> 1) {
          unint64_t v36 = sub_2248ACB04(v21 > 1, v22 + 1, 1, v36);
        }
        os_log_type_t v23 = v35;
        unint64_t v24 = v36;
        *(void *)(v36 + 16) = v22 + 1;
        v18((char *)(v24+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v22), v32, v23);
        a3 = v26;
      }
      ++v13;
      if (v16 == v12) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
}

uint64_t sub_224894E94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2248C4C28();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2248C4C28() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_224894F5C@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t result = sub_2248C45F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_224894F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[87] = v4;
  v5[86] = a4;
  v5[85] = a3;
  v5[84] = a2;
  v5[83] = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_26AC07620);
  v5[88] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  v5[89] = v6;
  v5[90] = *(void *)(v6 - 8);
  v5[91] = swift_task_alloc();
  v5[92] = swift_task_alloc();
  uint64_t v7 = sub_2248C4758();
  v5[93] = v7;
  v5[94] = *(void *)(v7 - 8);
  v5[95] = swift_task_alloc();
  uint64_t v8 = sub_2248C4778();
  v5[96] = v8;
  v5[97] = *(void *)(v8 - 8);
  v5[98] = swift_task_alloc();
  uint64_t v9 = sub_2248C43C8();
  v5[99] = v9;
  v5[100] = *(void *)(v9 - 8);
  v5[101] = swift_task_alloc();
  v5[102] = swift_task_alloc();
  v5[103] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v5[104] = v10;
  v5[105] = *(void *)(v10 - 8);
  v5[106] = swift_task_alloc();
  v5[107] = swift_task_alloc();
  v5[108] = swift_task_alloc();
  v5[109] = swift_task_alloc();
  v5[110] = swift_task_alloc();
  v5[111] = swift_task_alloc();
  v5[112] = __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  v5[113] = swift_task_alloc();
  v5[114] = swift_task_alloc();
  v5[115] = swift_task_alloc();
  v5[116] = swift_task_alloc();
  v5[117] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  v5[118] = v11;
  v5[119] = *(void *)(v11 - 8);
  v5[120] = swift_task_alloc();
  v5[121] = swift_task_alloc();
  v5[122] = swift_task_alloc();
  v5[123] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  v5[124] = v12;
  v5[125] = *(void *)(v12 - 8);
  v5[126] = swift_task_alloc();
  v5[127] = swift_task_alloc();
  v5[128] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_224895410, v4, 0);
}

uint64_t sub_224895410()
{
  uint64_t v437 = v0;
  v436[9] = *MEMORY[0x263EF8340];
  v432 = (_OWORD *)(v0 + 656);
  if (qword_26AC07D40 != -1) {
    goto LABEL_140;
  }
  while (1)
  {
    uint64_t v1 = (id *)(v0 + 664);
    int64_t v2 = *(void **)(v0 + 664);
    uint64_t v3 = sub_2248C46A8();
    *(void *)(v0 + 1032) = __swift_project_value_buffer(v3, (uint64_t)qword_26AC07D28);
    swift_bridgeObjectRetain_n();
    id v4 = v2;
    uint64_t v5 = sub_2248C4698();
    os_log_type_t v6 = sub_2248C49C8();
    BOOL v7 = os_log_type_enabled(v5, v6);
    unint64_t v8 = *(void *)(v0 + 680);
    unint64_t v414 = (id *)(v0 + 664);
    if (v7)
    {
      uint64_t v9 = *(void *)(v0 + 672);
      uint64_t v10 = *(void **)(v0 + 664);
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = (void *)swift_slowAlloc();
      uint64_t v418 = swift_slowAlloc();
      v436[0] = v418;
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 656) = sub_2248AD104(v9, v8, v436);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2112;
      *(void *)(v0 + 472) = v10;
      id v13 = v10;
      sub_2248C4A28();
      *uint64_t v12 = v10;

      _os_log_impl(&dword_22480C000, v5, v6, "Send pending status START {reason: %s, clDevice: %@}", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v12, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v418, -1, -1);
      uint64_t v14 = v11;
      uint64_t v1 = (id *)(v0 + 664);
      MEMORY[0x22A61A430](v14, -1, -1);
    }
    else
    {
      id v15 = *v1;

      swift_bridgeObjectRelease_n();
    }
    id v16 = objc_msgSend(*v1, sel_idsDeviceIdentifier);
    if (!v16)
    {
      id v37 = v1;
      id v38 = *v1;
      uint64_t v39 = sub_2248C4698();
      os_log_type_t v40 = sub_2248C49B8();
      BOOL v41 = os_log_type_enabled(v39, v40);
      uint64_t v42 = *v37;
      if (!v41)
      {

        goto LABEL_36;
      }
      BOOL v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v43 = 138412290;
      *(void *)(v0 + 552) = v42;
      id v45 = v42;
      sub_2248C4A28();
      void *v44 = v42;

      _os_log_impl(&dword_22480C000, v39, v40, "Send pending status FAILED. idsIdentifier is nil {clDevice: %@}", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      unint64_t v46 = v44;
      goto LABEL_18;
    }
    unint64_t v17 = v16;
    uint64_t v18 = *(void *)(v0 + 696);
    uint64_t v19 = *(void *)(v0 + 688);
    uint64_t v20 = sub_2248C4808();
    id v22 = v21;

    *(void *)(v0 + 1040) = v20;
    *(void *)(v0 + 1048) = v22;
    os_log_type_t v23 = *(void **)(v18 + 176);
    *(void *)(v0 + 1056) = v23;
    *(void *)(v0 + 544) = 0;
    id v24 = objc_msgSend(v23, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v19, v0 + 544);
    uint64_t v25 = *(void **)(v0 + 544);
    if (!v24)
    {
      id v60 = v25;
      swift_bridgeObjectRelease();
      unint64_t v61 = (void *)sub_2248C4318();

      swift_willThrow();
LABEL_26:
      id v62 = *(id *)(v0 + 664);
      id v63 = v61;
      id v64 = v62;
      id v65 = v61;
      uint64_t v66 = sub_2248C4698();
      os_log_type_t v67 = sub_2248C49B8();
      BOOL v68 = os_log_type_enabled(v66, v67);
      id v69 = *(void **)(v0 + 664);
      if (v68)
      {
        uint64_t v70 = swift_slowAlloc();
        uint64_t v71 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v70 = 138412546;
        *(void *)(v0 + 536) = v69;
        id v72 = v69;
        sub_2248C4A28();
        *uint64_t v71 = v69;

        *(_WORD *)(v70 + 12) = 2112;
        id v73 = v61;
        uint64_t v74 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 504) = v74;
        sub_2248C4A28();
        v71[1] = v74;

        _os_log_impl(&dword_22480C000, v66, v67, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v70, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v71, -1, -1);
        MEMORY[0x22A61A430](v70, -1, -1);
      }
      else
      {
      }
      goto LABEL_36;
    }
    unint64_t v26 = v24;
    *(void *)(v0 + 1064) = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07728);
    unint64_t v27 = sub_2248C48A8();
    id v28 = v25;

    swift_bridgeObjectRetain();
    uint64_t v29 = 0;
    unint64_t v30 = sub_2248B75CC(v27, v20, (uint64_t)v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30 >> 62)
    {
LABEL_142:
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v32 = v0 + 648;
    if (!v31)
    {
      id v75 = *v414;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v76 = v75;
      uint64_t v39 = sub_2248C4698();
      os_log_type_t v77 = sub_2248C49C8();
      BOOL v78 = os_log_type_enabled(v39, v77);
      id v79 = *v414;
      if (v78)
      {
        id v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = (void *)swift_slowAlloc();
        *(_DWORD *)id v80 = 138412290;
        *(void *)unint64_t v32 = v79;
        id v82 = v79;
        sub_2248C4A28();
        *uint64_t v81 = v79;

        _os_log_impl(&dword_22480C000, v39, v77, "Send pending status SKIPPED. No status devices. {clDevice: %@}", v80, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v81, -1, -1);
        char v47 = v80;
LABEL_32:
        MEMORY[0x22A61A430](v47, -1, -1);

LABEL_36:
        BOOL v433 = 0;
        goto LABEL_37;
      }
LABEL_35:

      goto LABEL_36;
    }
    v436[0] = MEMORY[0x263F8EE78];
    if (v31 < 1)
    {
LABEL_144:
      __break(1u);
    }
    else
    {
      id v403 = v22;
      uint64_t v410 = v29;
      uint64_t aBlock = (void *)(v0 + 80);
      uint64_t v371 = v0 + 432;
      uint64_t v373 = v0 + 440;
      uint64_t v374 = v0 + 496;
      v432 = (_OWORD *)(v0 + 168);
      id v367 = (uint64_t *)(v0 + 456);
      uint64_t v368 = (void *)(v0 + 464);
      uint64_t v370 = (uint64_t *)(v0 + 488);
      os_log_t v392 = (void *)(v0 + 528);
      unint64_t v394 = (void *)(v0 + 520);
      unint64_t v375 = (void *)(v0 + 624);
      uint64_t v388 = (void *)(v0 + 632);
      os_log_t v404 = (v0 + 640);
      unint64_t v369 = (unsigned char *)(v0 + 1176);
      swift_bridgeObjectRetain();
      uint64_t v33 = 0;
      do
      {
        if ((v30 & 0xC000000000000001) != 0) {
          id v34 = (id)MEMORY[0x22A619600](v33, v30);
        }
        else {
          id v34 = *(id *)(v30 + 8 * v33 + 32);
        }
        id v35 = v34;
        ++v33;
        id v22 = objc_msgSend(v34, sel_pendingStatuses);
        *(void *)(v0 + 1088) = sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
        unint64_t v36 = sub_2248C48A8();

        sub_2248B228C(v36);
      }
      while (v31 != v33);
      swift_bridgeObjectRelease_n();
      unint64_t v32 = v436[0];
      *(void *)(v0 + 1072) = v436[0];
      unint64_t v30 = v32 >> 62;
      if (!(v32 >> 62))
      {
        uint64_t v48 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
LABEL_21:
    *(void *)(v0 + 1080) = v48;
    if (!v48)
    {
      id v83 = *v414;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v84 = v83;
      uint64_t v39 = sub_2248C4698();
      os_log_type_t v85 = sub_2248C49C8();
      BOOL v86 = os_log_type_enabled(v39, v85);
      id v79 = *v414;
      if (!v86) {
        goto LABEL_35;
      }
      BOOL v43 = (uint8_t *)swift_slowAlloc();
      unint64_t v87 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v43 = 138412290;
      v404->Class isa = (Class)v79;
      id v88 = v79;
      sub_2248C4A28();
      *unint64_t v87 = v79;

      _os_log_impl(&dword_22480C000, v39, v85, "Send pending status SKIPPED. No pending statuses. {clDevice: %@}", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      unint64_t v46 = v87;
LABEL_18:
      MEMORY[0x22A61A430](v46, -1, -1);
      char v47 = v43;
      goto LABEL_32;
    }
    uint64_t v49 = *(void *)(v0 + 696);
    BOOL v50 = *(void **)(v0 + 664);
    id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62B70]), sel_init);
    *(void *)(v0 + 1096) = v51;
    objc_msgSend(v51, sel_setDestinationDevice_, v50);
    objc_msgSend(v51, sel_setControlFlags_, 4194560);
    *(void *)(v0 + 1104) = *(void *)(v49 + 144);
    objc_msgSend(v51, sel_setDispatchQueue_);
    id v52 = v50;
    swift_bridgeObjectRetain_n();
    id v53 = v52;
    uint64_t v54 = sub_2248C4698();
    int v55 = sub_2248C49C8();
    if (os_log_type_enabled(v54, (os_log_type_t)v55))
    {
      LODWORD(v403) = v55;
      id v56 = *v414;
      unint64_t v382 = (unint64_t)v53;
      uint64_t v57 = swift_slowAlloc();
      unint64_t v384 = v30;
      unint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 138412546;
      id v22 = (id)(v57 + 4);
      *unint64_t v375 = v56;
      id v58 = v56;
      sub_2248C4A28();
      *(void *)unint64_t v30 = v382;

      *(_WORD *)(v57 + 12) = 2048;
      if (v384)
      {
        swift_bridgeObjectRetain();
        uint64_t v59 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v59 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      id v92 = v410;
      swift_bridgeObjectRelease();
      *uint64_t v388 = v59;
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v54, (os_log_type_t)v55, "Send pending status CONTINUE {clDevice: %@, pendingStatuses.count: %ld}", (uint8_t *)v57, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v30, -1, -1);
      MEMORY[0x22A61A430](v57, -1, -1);
    }
    else
    {
      id v91 = *v414;

      swift_bridgeObjectRelease_n();
      id v92 = v410;
    }

    *(void *)(v0 + 488) = MEMORY[0x263F8EE78];
    *(void *)(v0 + 1112) = OBJC_IVAR___SKALocalStatusServer_failedDeliveries;
    if (v48 < 1) {
      break;
    }
    uint64_t v93 = 0;
    id v94 = (void *)MEMORY[0x263F8EE78];
    do
    {
      *(void *)(v0 + 1128) = v94;
      *(void *)(v0 + 1120) = v93;
      uint64_t v101 = *(void *)(v0 + 1024);
      uint64_t v102 = *(void **)(*(void *)(v0 + 1072) + 8 * v93 + 32);
      *(void *)(v0 + 1136) = v102;
      id v103 = v102;
      sub_2248A67BC(v101);
      if (v92)
      {
        id v104 = *(void **)(v0 + 1136);
        id v105 = *(id *)(v0 + 664);
        id v106 = v104;
        os_log_type_t v107 = v92;
        id v108 = v105;
        id v109 = v106;
        uint64_t v110 = v92;
        unint64_t v111 = sub_2248C4698();
        os_log_type_t v112 = sub_2248C49A8();
        BOOL v113 = os_log_type_enabled(v111, v112);
        uint64_t v114 = *(void **)(v0 + 1136);
        uint64_t v115 = *(void **)(v0 + 664);
        if (v113)
        {
          os_log_type_t v411 = v112;
          uint64_t v116 = swift_slowAlloc();
          uint64_t v117 = (void *)swift_slowAlloc();
          uint64_t v419 = swift_slowAlloc();
          v436[0] = v419;
          *(_DWORD *)uint64_t v116 = 136315650;
          id v118 = objc_msgSend(v114, sel_identifier);
          uint64_t v119 = sub_2248C4808();
          os_log_t v404 = v111;
          unint64_t v121 = v120;

          *(void *)(v0 + 512) = sub_2248AD104(v119, v121, v436);
          sub_2248C4A28();

          swift_bridgeObjectRelease();
          *(_WORD *)(v116 + 12) = 2112;
          char v122 = v92;
          uint64_t v123 = _swift_stdlib_bridgeErrorToNSError();
          *unint64_t v394 = v123;
          sub_2248C4A28();
          *uint64_t v117 = v123;

          *(_WORD *)(v116 + 22) = 2112;
          *os_log_t v392 = v115;
          id v124 = v115;
          sub_2248C4A28();
          v117[1] = v115;

          _os_log_impl(&dword_22480C000, v404, v411, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v116, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v117, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v419, -1, -1);
          MEMORY[0x22A61A430](v116, -1, -1);
        }
        else
        {
        }
        unint64_t v139 = (void *)sub_2248C4308();
        id v140 = objc_msgSend(v139, sel_userInfo);
        uint64_t v141 = sub_2248C4798();

        if (*(void *)(v141 + 16)
          && (unint64_t v142 = sub_2248AD83C(0x4D726F7272457563, 0xEA00000000006773), (v143 & 1) != 0))
        {
          sub_2248B9678(*(void *)(v141 + 56) + 32 * v142, (uint64_t)v432);
        }
        else
        {
          _OWORD *v432 = 0u;
          v432[1] = 0u;
        }
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 192))
        {
          if (swift_dynamicCast())
          {
            uint64_t v144 = *(void *)(v0 + 416);
            uint64_t v145 = *(void *)(v0 + 424);
LABEL_69:
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            id v94 = *(void **)(v0 + 1128);
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              id v94 = sub_2248ACFDC(0, v94[2] + 1, 1, *(void **)(v0 + 1128));
            }
            unint64_t v187 = v94[2];
            unint64_t v186 = v94[3];
            if (v187 >= v186 >> 1) {
              id v94 = sub_2248ACFDC((void *)(v186 > 1), v187 + 1, 1, v94);
            }
            uint64_t v188 = *(void *)(v0 + 1136);
            v94[2] = v187 + 1;
            uint64_t v189 = &v94[3 * v187];
            v189[4] = v188;
            v189[5] = v144;
            v189[6] = v145;

            goto LABEL_47;
          }
        }
        else
        {
          sub_2248BA318((uint64_t)v432, &qword_268093B58);
        }
        swift_getErrorValue();
        uint64_t v144 = sub_2248C4C88();
        uint64_t v145 = v184;
        goto LABEL_69;
      }
      uint64_t v125 = *(void *)(v0 + 1048);
      uint64_t v126 = *(void *)(v0 + 1040);
      uint64_t v127 = *(void *)(v0 + 984);
      uint64_t v128 = *(void *)(v0 + 944);
      uint64_t v129 = (uint64_t *)(*(void *)(v0 + 696) + *(void *)(v0 + 1112));
      (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 1000) + 16))(v127, *(void *)(v0 + 1024), *(void *)(v0 + 992));
      unint64_t v130 = (void *)(v127 + *(int *)(v128 + 20));
      *unint64_t v130 = v126;
      v130[1] = v125;
      swift_beginAccess();
      uint64_t v131 = *v129;
      uint64_t v132 = *(void *)(*v129 + 16);
      swift_bridgeObjectRetain();
      if (v132 && (unint64_t v133 = sub_2248AD75C(*(void *)(v0 + 984)), (v134 & 1) != 0))
      {
        uint64_t v420 = *(void *)(v0 + 936);
        uint64_t v135 = *(void *)(v0 + 928);
        uint64_t v136 = *(void *)(v0 + 888);
        uint64_t v137 = *(void *)(v0 + 880);
        uint64_t v138 = *(void *)(v0 + 800);
        uint64_t v412 = *(void *)(v0 + 792);
        sub_2248B95B0(*(void *)(v131 + 56) + *(void *)(*(void *)(v0 + 840) + 72) * v133, v137, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_2248B9E38(v137, v136, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_2248C4348();
        sub_2248C4358();
        sub_2248B9618(v136, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v138 + 56))(v135, 0, 1, v412);
        sub_2248BA210(v135, v420, &qword_268093940);
      }
      else
      {
        uint64_t v146 = *(void *)(v0 + 936);
        uint64_t v147 = *(void *)(v0 + 800);
        uint64_t v148 = *(void *)(v0 + 792);
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v147 + 56))(v146, 1, 1, v148);
      }
      uint64_t v149 = *(void *)(v0 + 920);
      uint64_t v150 = *(void *)(v0 + 800);
      uint64_t v151 = *(void *)(v0 + 792);
      sub_2248BAB80(*(void *)(v0 + 936), v149, &qword_268093940);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v149, 1, v151) == 1)
      {
        sub_2248BA318(*(void *)(v0 + 920), &qword_268093940);
LABEL_131:
        unint64_t v259 = *(void **)(v0 + 664);
        sub_2248BAB80(*(void *)(v0 + 936), *(void *)(v0 + 912), &qword_268093940);
        id v260 = v259;
        id v261 = v103;
        id v262 = v260;
        id v263 = v261;
        unint64_t v264 = sub_2248C4698();
        os_log_type_t v265 = sub_2248C49C8();
        BOOL v266 = os_log_type_enabled(v264, v265);
        uint64_t v267 = *(void *)(v0 + 912);
        if (v266)
        {
          uint64_t v415 = *(void *)(v0 + 904);
          uint64_t v268 = *(void **)(v0 + 664);
          v429 = v264;
          uint64_t v269 = swift_slowAlloc();
          uint64_t v270 = (void *)swift_slowAlloc();
          uint64_t v434 = swift_slowAlloc();
          v436[0] = v434;
          *(_DWORD *)uint64_t v269 = 138412802;
          *(void *)(v0 + 576) = v263;
          id v271 = v263;
          sub_2248C4A28();
          *uint64_t v270 = v263;

          *(_WORD *)(v269 + 12) = 2112;
          *(void *)(v0 + 584) = v268;
          id v272 = v268;
          sub_2248C4A28();
          v270[1] = v268;

          *(_WORD *)(v269 + 22) = 2080;
          sub_2248BAB80(v267, v415, &qword_268093940);
          uint64_t v273 = sub_2248C4818();
          *(void *)(v0 + 592) = sub_2248AD104(v273, v274, v436);
          sub_2248C4A28();
          swift_bridgeObjectRelease();
          sub_2248BA318(v267, &qword_268093940);
          _os_log_impl(&dword_22480C000, v429, v265, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v269, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v270, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v434, -1, -1);
          MEMORY[0x22A61A430](v269, -1, -1);
        }
        else
        {
          id v275 = *v414;

          sub_2248BA318(v267, &qword_268093940);
        }
        os_log_t v276 = *(void **)(v0 + 1096);
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 24) = sub_2248985E8;
        uint64_t v277 = swift_continuation_init();
        *(void *)(v0 + 128) = MEMORY[0x263EF8330];
        *(void *)(v0 + 136) = 0x40000000;
        *(void *)(v0 + 144) = sub_2248A07BC;
        *(void *)(v0 + 152) = &block_descriptor_64;
        *(void *)(v0 + 160) = v277;
        objc_msgSend(v276, sel_activateWithCompletion_, v0 + 128);
        return MEMORY[0x270FA23F0](v0 + 16);
      }
      uint64_t v152 = *(void *)(v0 + 816);
      uint64_t v153 = *(void *)(v0 + 800);
      uint64_t v154 = *(void *)(v0 + 792);
      (*(void (**)(void, void, uint64_t))(v153 + 32))(*(void *)(v0 + 824), *(void *)(v0 + 920), v154);
      sub_2248C43A8();
      char v155 = sub_2248C4378();
      unint64_t v156 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
      v156(v152, v154);
      if ((v155 & 1) == 0)
      {
        v156(*(void *)(v0 + 824), *(void *)(v0 + 792));
        goto LABEL_131;
      }
      unint64_t v421 = v156;
      v413 = v94;
      (*(void (**)(void, void, void))(*(void *)(v0 + 800) + 16))(*(void *)(v0 + 808), *(void *)(v0 + 824), *(void *)(v0 + 792));
      swift_bridgeObjectRetain_n();
      id v157 = v103;
      uint64_t v158 = sub_2248C4698();
      os_log_type_t v159 = sub_2248C49C8();
      os_log_t v404 = v158;
      BOOL v160 = os_log_type_enabled(v158, v159);
      unint64_t v161 = *(void *)(v0 + 1048);
      if (v160)
      {
        uint64_t v376 = *(void *)(v0 + 1040);
        uint64_t v383 = *(void *)(v0 + 1000);
        uint64_t v386 = *(void *)(v0 + 992);
        uint64_t v390 = *(void *)(v0 + 1024);
        uint64_t v380 = *(void *)(v0 + 936);
        uint64_t v381 = *(void *)(v0 + 984);
        uint64_t v379 = *(void *)(v0 + 824);
        uint64_t v162 = *(void *)(v0 + 808);
        uint64_t v163 = *(void *)(v0 + 792);
        os_log_type_t type = v159;
        uint64_t v164 = swift_slowAlloc();
        uint64_t v377 = swift_slowAlloc();
        v436[0] = v377;
        *(_DWORD *)uint64_t v164 = 136315650;
        sub_2248AD9A0(&qword_268093B80, MEMORY[0x263F07490]);
        uint64_t v165 = sub_2248C4C18();
        *(void *)(v0 + 600) = sub_2248AD104(v165, v166, v436);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        v421(v162, v163);
        *(_WORD *)(v164 + 12) = 2080;
        id v167 = objc_msgSend(v157, sel_identifier);
        uint64_t v168 = sub_2248C4808();
        unint64_t v169 = v161;
        uint64_t v170 = v157;
        unint64_t v172 = v171;

        *(void *)(v0 + 608) = sub_2248AD104(v168, v172, v436);
        sub_2248C4A28();

        swift_bridgeObjectRelease();
        *(_WORD *)(v164 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v174 = sub_2248B5808(8, v376, v169, v173);
        uint64_t v176 = v175;
        uint64_t v178 = v177;
        uint64_t v180 = v179;
        swift_bridgeObjectRelease();
        uint64_t v181 = MEMORY[0x22A619320](v174, v176, v178, v180);
        unint64_t v183 = v182;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 616) = sub_2248AD104(v181, v183, v436);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22480C000, v404, type, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v164, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v377, -1, -1);
        MEMORY[0x22A61A430](v164, -1, -1);

        v421(v379, v163);
        sub_2248BA318(v380, &qword_268093940);
        sub_2248B9618(v381, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v383 + 8))(v390, v386);
      }
      else
      {
        uint64_t v95 = *(void *)(v0 + 1000);
        uint64_t v385 = *(void *)(v0 + 992);
        uint64_t v389 = *(void *)(v0 + 1024);
        uint64_t v96 = *(void *)(v0 + 984);
        uint64_t v97 = *(void *)(v0 + 936);
        uint64_t v98 = *(void *)(v0 + 824);
        uint64_t v99 = *(void *)(v0 + 808);
        uint64_t v100 = *(void *)(v0 + 792);

        swift_bridgeObjectRelease_n();
        v421(v99, v100);

        v421(v98, v100);
        sub_2248BA318(v97, &qword_268093940);
        sub_2248B9618(v96, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v389, v385);
      }
      id v94 = v413;
LABEL_47:
      id v92 = 0;
      uint64_t v93 = *(void *)(v0 + 1120) + 1;
    }
    while (v93 != *(void *)(v0 + 1080));
    uint64_t v410 = (void **)v94;
    unint64_t v190 = *(void **)(v0 + 1096);
    uint64_t v191 = *(void *)(v0 + 784);
    uint64_t v192 = *(void *)(v0 + 776);
    uint64_t v422 = *(void *)(v0 + 768);
    uint64_t v193 = *(void *)(v0 + 760);
    uint64_t v194 = *(void *)(v0 + 752);
    id v22 = *(id *)(v0 + 744);
    uint64_t v427 = *(void *)(v0 + 688);
    v432 = *(_OWORD **)(v0 + 1056);
    swift_bridgeObjectRelease();
    uint64_t v195 = swift_allocObject();
    *(void *)(v195 + 16) = v190;
    *(void *)(v0 + 112) = sub_2248B95A0;
    *(void *)(v0 + 120) = v195;
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 1107296256;
    *(void *)(v0 + 96) = sub_224885AAC;
    *(void *)(v0 + 104) = &block_descriptor_63;
    unint64_t v32 = (unint64_t)_Block_copy(aBlock);
    id v196 = v190;
    sub_2248C4768();
    *(void *)(v0 + 448) = MEMORY[0x263F8EE78];
    sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
    sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
    sub_2248C4A68();
    MEMORY[0x22A6194F0](0, v191, v193, v32);
    _Block_release((const void *)v32);
    (*(void (**)(uint64_t, id))(v194 + 8))(v193, v22);
    (*(void (**)(uint64_t, uint64_t))(v192 + 8))(v191, v422);
    swift_release();
    *(void *)(v0 + 440) = 0;
    id v197 = objc_msgSend(v432, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v427, v373);
    unint64_t v198 = *(void **)(v0 + 440);
    if (!v197)
    {
      uint64_t v257 = *(void **)(v0 + 1096);
      id v258 = v198;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v61 = (void *)sub_2248C4318();

      swift_willThrow();
      goto LABEL_26;
    }
    uint64_t v199 = v197;
    uint64_t v200 = sub_2248C48A8();
    id v201 = v198;

    unint64_t v202 = swift_bridgeObjectRetain();
    uint64_t v203 = sub_2248925D8(v202, v371, (SEL *)&selRef_identifier);
    id v403 = 0;
    unint64_t v204 = v200;
    swift_bridgeObjectRelease();
    unint64_t v30 = sub_2248B55D8(v203);
    swift_bridgeObjectRelease();
    uint64_t v48 = (uint64_t)v410;
    unint64_t v382 = v204;
    if (v204 >> 62) {
      goto LABEL_147;
    }
    uint64_t v205 = *(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v29 = (void **)(v0 + 664);
    if (!v205) {
      goto LABEL_148;
    }
LABEL_77:
    unint64_t v206 = 0;
    os_log_t v392 = (void *)(v382 & 0xC000000000000001);
    unint64_t v428 = v30 + 56;
    uint64_t v388 = (void *)v205;
    while (2)
    {
      if (v392)
      {
        id v207 = (id)MEMORY[0x22A619600](v206, v382);
      }
      else
      {
        if (v206 >= *(void *)((v382 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_144;
        }
        id v207 = *(id *)(v382 + 32 + 8 * v206);
      }
      BOOL v208 = __OFADD__(v206, 1);
      uint64_t v209 = (void *)(v206 + 1);
      if (v208)
      {
        __break(1u);
        goto LABEL_142;
      }
      os_log_t v400 = v209;
      uint64_t v210 = *v29;
      unint64_t v32 = (unint64_t)v207;
      id v211 = objc_msgSend(v207, sel_idsIdentifier);
      uint64_t v212 = sub_2248C4808();
      uint64_t v214 = v213;

      id v215 = objc_msgSend(v210, sel_idsDeviceIdentifier);
      if (!v215)
      {

        swift_bridgeObjectRelease();
        goto LABEL_79;
      }
      id v22 = v215;
      unint64_t v394 = (void *)v32;
      uint64_t v216 = sub_2248C4808();
      uint64_t v218 = v217;

      if (v212 == v216 && v214 == v218)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_90;
      }
      char v219 = sub_2248C4C28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v219 & 1) == 0)
      {

        goto LABEL_79;
      }
LABEL_90:
      id v220 = objc_msgSend((id)v32, sel_pendingStatuses);
      unint64_t v221 = sub_2248C48A8();

      swift_bridgeObjectRetain();
      sub_2248B7788(v221, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v435 = *(void *)(v0 + 488);
      swift_bridgeObjectRetain();
      id v222 = objc_msgSend((id)v32, sel_deliveredStatuses);
      unint64_t v223 = sub_2248C48A8();

      if (!(v223 >> 62))
      {
        uint64_t v224 = *(void *)((v223 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v224) {
          goto LABEL_92;
        }
LABEL_123:
        id v22 = *(id *)(v0 + 1064);
        unint64_t v424 = *(void **)(v0 + 1056);
        v432 = *(_OWORD **)(v0 + 688);
        swift_bridgeObjectRelease();
        id v246 = objc_msgSend(v394, sel_idsIdentifier);
        sub_2248C4808();

        id v247 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
        unint64_t v32 = sub_2248C47F8();
        swift_bridgeObjectRelease();
        v248 = (void *)sub_2248C4898();
        swift_bridgeObjectRelease();
        uint64_t v249 = (void *)sub_2248C4898();
        swift_bridgeObjectRelease();
        id v250 = objc_msgSend(v247, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v32, v248, v249);

        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
        uint64_t v251 = swift_allocObject();
        *(_OWORD *)(v251 + 16) = xmmword_2248CBEB0;
        *(void *)(v251 + 32) = v250;
        v436[0] = v251;
        sub_2248C48C8();
        id v252 = v250;
        v253 = (void *)sub_2248C4898();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 496) = 0;
        unsigned int v254 = objc_msgSend(v424, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v253, v432, v374);

        v255 = *(void **)(v0 + 496);
        if (!v254)
        {
          v278 = *(void **)(v0 + 1096);
          id v279 = v255;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v61 = (void *)sub_2248C4318();

          swift_willThrow();
          goto LABEL_26;
        }
        id v256 = v255;

        uint64_t v48 = (uint64_t)v410;
        uint64_t v29 = (void **)(v0 + 664);
LABEL_79:
        unint64_t v206 = (unint64_t)v400;
        if (v400 == v388) {
          goto LABEL_148;
        }
        continue;
      }
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v224 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    if (!v224) {
      goto LABEL_123;
    }
LABEL_92:
    unint64_t v225 = 0;
    v432 = (_OWORD *)(v223 & 0xC000000000000001);
    unint64_t v423 = v223;
    os_log_t v404 = (v223 + 32);
    uint64_t v407 = v223 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v432)
      {
        uint64_t v226 = (objc_class *)MEMORY[0x22A619600](v225, v423);
      }
      else
      {
        if (v225 >= *(void *)(v407 + 16)) {
          goto LABEL_139;
        }
        uint64_t v226 = v404[v225].isa;
      }
      uint64_t v227 = v226;
      BOOL v208 = __OFADD__(v225++, 1);
      if (v208) {
        break;
      }
      id v228 = [(objc_class *)v226 identifier];
      uint64_t v229 = sub_2248C4808();
      uint64_t v231 = v230;

      if (*(void *)(v30 + 16))
      {
        sub_2248C4CD8();
        sub_2248C4838();
        uint64_t v232 = sub_2248C4D08();
        uint64_t v233 = -1 << *(unsigned char *)(v30 + 32);
        unint64_t v234 = v232 & ~v233;
        if ((*(void *)(v428 + ((v234 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v234))
        {
          uint64_t v235 = *(void *)(v30 + 48);
          id v236 = (void *)(v235 + 16 * v234);
          BOOL v237 = *v236 == v229 && v236[1] == v231;
          if (v237 || (sub_2248C4C28() & 1) != 0)
          {
LABEL_93:

            swift_bridgeObjectRelease();
            if (v225 == v224) {
              goto LABEL_123;
            }
            continue;
          }
          uint64_t v397 = ~v233;
          unint64_t v238 = (v234 + 1) & ~v233;
          if ((*(void *)(v428 + ((v238 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v238))
          {
            uint64_t v239 = (void *)(v235 + 16 * v238);
            BOOL v240 = *v239 == v229 && v239[1] == v231;
            if (v240 || (sub_2248C4C28() & 1) != 0) {
              goto LABEL_93;
            }
            for (unint64_t i = v238 + 1; ; unint64_t i = v242 + 1)
            {
              unint64_t v242 = i & v397;
              if (((*(void *)(v428 + (((i & v397) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v397)) & 1) == 0) {
                break;
              }
              id v243 = (void *)(v235 + 16 * v242);
              BOOL v244 = *v243 == v229 && v243[1] == v231;
              if (v244 || (sub_2248C4C28() & 1) != 0) {
                goto LABEL_93;
              }
            }
          }
        }
      }
      uint64_t v245 = swift_bridgeObjectRelease();
      MEMORY[0x22A619380](v245);
      if (*(void *)((v435 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v435 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2248C48D8();
      }
      sub_2248C48E8();
      sub_2248C48C8();
      if (v225 == v224) {
        goto LABEL_123;
      }
    }
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    swift_once();
  }
  __break(1u);
LABEL_147:
  swift_bridgeObjectRetain();
  uint64_t v205 = sub_2248C4BC8();
  swift_bridgeObjectRelease();
  uint64_t v29 = (void **)(v0 + 664);
  if (v205) {
    goto LABEL_77;
  }
LABEL_148:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v280 = *(void *)(v48 + 16);
  BOOL v433 = v280 == 0;
  if (v280)
  {
    uint64_t v405 = *(void *)(v0 + 832);
    v398 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 720) + 8);
    uint64_t v401 = *(void *)(v0 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    swift_bridgeObjectRetain();
    v281 = (void *)(v48 + 48);
    while (1)
    {
      uint64_t v288 = *(void *)(v0 + 1016);
      uint64_t v289 = *(v281 - 1);
      uint64_t v290 = *v281;
      id v291 = (id)*(v281 - 2);
      swift_bridgeObjectRetain();
      sub_2248A67BC(v288);
      unint64_t v61 = v403;
      uint64_t v292 = *(void *)(v0 + 1048);
      if (v403) {
        break;
      }
      uint64_t v425 = v289;
      v430 = v291;
      v408 = v281;
      uint64_t v416 = v280;
      uint64_t v293 = *(void *)(v0 + 1040);
      uint64_t v294 = *(void *)(v0 + 976);
      uint64_t v295 = *(void *)(v0 + 944);
      v296 = (uint64_t *)(*(void *)(v0 + 696) + *(void *)(v0 + 1112));
      (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 1000) + 16))(v294, *(void *)(v0 + 1016), *(void *)(v0 + 992));
      unsigned int v297 = (void *)(v294 + *(int *)(v295 + 20));
      *unsigned int v297 = v293;
      v297[1] = v292;
      swift_beginAccess();
      uint64_t v298 = *v296;
      uint64_t v299 = *(void *)(*v296 + 16);
      swift_bridgeObjectRetain();
      if (v299 && (unint64_t v300 = sub_2248AD75C(*(void *)(v0 + 976)), (v301 & 1) != 0))
      {
        uint64_t v302 = *(void *)(v0 + 968);
        uint64_t v303 = *(void *)(v0 + 872);
        uint64_t v304 = *(void *)(v0 + 864);
        uint64_t v305 = *(void *)(v0 + 856);
        id v395 = *(id *)(v0 + 848);
        uint64_t v306 = *(void *)(v0 + 800);
        uint64_t v387 = *(void *)(v0 + 976);
        uint64_t v391 = *(void *)(v0 + 792);
        uint64_t v307 = (uint64_t *)(*(void *)(v0 + 696) + *(void *)(v0 + 1112));
        sub_2248B95B0(*(void *)(v298 + 56) + *(void *)(*(void *)(v0 + 840) + 72) * v300, v304, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_2248B9E38(v304, v303, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_2248B95B0(v387, v302, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v306 + 16))(v305, v303, v391);
        sub_2248C43A8();
        v308 = (void *)(v305 + *(int *)(v405 + 24));
        void *v308 = v425;
        v308[1] = v290;
        swift_beginAccess();
        sub_2248B9E38(v305, (uint64_t)v395, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        char v309 = swift_isUniquelyReferenced_nonNull_native();
        v436[0] = *v307;
        *uint64_t v307 = 0x8000000000000000;
        sub_2248B0674((uint64_t)v395, v302, v309);
        *uint64_t v307 = v436[0];
        swift_bridgeObjectRelease();
        sub_2248B9618(v302, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
        sub_2248B9618(v303, type metadata accessor for SKALocalStatusServer.FailedDelivery);
      }
      else
      {
        uint64_t v310 = *(void *)(v0 + 976);
        uint64_t v311 = *(void *)(v0 + 968);
        uint64_t v312 = *(void *)(v0 + 856);
        uint64_t v313 = *(void *)(v0 + 848);
        id v314 = (uint64_t *)(*(void *)(v0 + 696) + *(void *)(v0 + 1112));
        swift_endAccess();
        sub_2248B95B0(v310, v311, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_2248C43A8();
        sub_2248C43A8();
        id v315 = (void *)(v312 + *(int *)(v405 + 24));
        *id v315 = v425;
        v315[1] = v290;
        swift_beginAccess();
        sub_2248B9E38(v312, v313, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        char v316 = swift_isUniquelyReferenced_nonNull_native();
        v436[0] = *v314;
        *id v314 = 0x8000000000000000;
        sub_2248B0674(v313, v311, v316);
        *id v314 = v436[0];
        swift_bridgeObjectRelease();
        sub_2248B9618(v311, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
      }
      sub_2248914E8(*(void *)(v0 + 1016), *(void *)(v0 + 688), *(void *)(v0 + 736));
      swift_beginAccess();
      if (*(void *)(*(void *)v401 + 16) && (sub_2248AD8B4(*(void *)(v0 + 1016)), (v317 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_2248C46C8();
        swift_release();
      }
      else
      {
        swift_endAccess();
      }
      uint64_t v282 = *(void *)(v0 + 1016);
      uint64_t v283 = *(void *)(v0 + 1000);
      uint64_t v284 = *(void *)(v0 + 992);
      uint64_t v285 = *(void *)(v0 + 976);
      uint64_t v286 = *(void *)(v0 + 736);
      uint64_t v287 = *(void *)(v0 + 712);

      (*v398)(v286, v287);
      sub_2248B9618(v285, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v283 + 8))(v282, v284);
      id v403 = 0;
      v281 = v408 + 3;
      uint64_t v280 = v416 - 1;
      if (v416 == 1)
      {
        swift_bridgeObjectRelease();
        id v403 = 0;
        goto LABEL_162;
      }
    }
    v318 = *(void **)(v0 + 1096);
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_187:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
LABEL_162:
  uint64_t v319 = *v370;
  if ((unint64_t)*v370 >> 62) {
    goto LABEL_189;
  }
  uint64_t v320 = *(void *)((v319 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v320; uint64_t v320 = sub_2248C4BC8())
  {
    uint64_t v321 = 0;
    uint64_t v393 = *(void *)(v0 + 1000);
    id v396 = *(void **)(v0 + 952);
    uint64_t v322 = *(void *)(v0 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    unint64_t v417 = v319 & 0xC000000000000001;
    id v406 = (void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 840) + 56);
    v399 = (void (**)(void, void))(*(void *)(v0 + 720) + 8);
    uint64_t v409 = v319;
    uint64_t v402 = v320;
    while (1)
    {
      id v327 = v417 ? (id)MEMORY[0x22A619600](v321, v319) : *(id *)(v319 + 8 * v321 + 32);
      v328 = v327;
      if (__OFADD__(v321, 1)) {
        break;
      }
      sub_2248A67BC(*(void *)(v0 + 1008));
      unint64_t v61 = v403;
      uint64_t v329 = *(void *)(v0 + 1048);
      if (v403)
      {
        uint64_t v359 = *(void **)(v0 + 1096);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        goto LABEL_187;
      }
      uint64_t v426 = v321 + 1;
      v431 = v328;
      v330 = (uint64_t *)v322;
      uint64_t v331 = *(void *)(v0 + 1040);
      uint64_t v332 = *(void *)(v0 + 960);
      uint64_t v333 = *(void *)(v0 + 944);
      (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 1000) + 16))(v332, *(void *)(v0 + 1008), *(void *)(v0 + 992));
      v334 = (void *)(v332 + *(int *)(v333 + 20));
      void *v334 = v331;
      v334[1] = v329;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v335 = sub_2248AD75C(v332);
      char v337 = v336;
      swift_bridgeObjectRelease();
      if (v337)
      {
        uint64_t v338 = *(void *)(v0 + 1112);
        uint64_t v339 = *(void *)(v0 + 696);
        char v340 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v341 = *(void *)(v339 + v338);
        v436[0] = v341;
        *(void *)(v339 + v338) = 0x8000000000000000;
        if ((v340 & 1) == 0)
        {
          sub_2248B15F4();
          uint64_t v341 = v436[0];
        }
        uint64_t v342 = *(void *)(v0 + 1112);
        uint64_t v343 = *(void *)(v0 + 840);
        uint64_t v344 = *(void *)(v0 + 704);
        uint64_t v345 = *(void *)(v0 + 696);
        sub_2248B9618(*(void *)(v341 + 48) + v396[9] * v335, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_2248B9E38(*(void *)(v341 + 56) + *(void *)(v343 + 72) * v335, v344, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_2248AFE60(v335, v341);
        *(void *)(v345 + v342) = v341;
        swift_bridgeObjectRelease();
        uint64_t v346 = 0;
      }
      else
      {
        uint64_t v346 = 1;
      }
      uint64_t v347 = *(void *)(v0 + 1008);
      uint64_t v348 = *(void *)(v0 + 728);
      uint64_t v349 = *(void *)(v0 + 704);
      uint64_t v350 = *(void *)(v0 + 688);
      (*v406)(v349, v346, 1, *(void *)(v0 + 832));
      sub_2248BA318(v349, qword_26AC07620);
      swift_endAccess();
      sub_2248914E8(v347, v350, v348);
      uint64_t v322 = (uint64_t)v330;
      swift_beginAccess();
      if (*(void *)(*v330 + 16) && (sub_2248AD8B4(*(void *)(v0 + 1008)), (v351 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_2248C46C8();
        uint64_t v352 = *(void *)(sub_2248C4408() + 16);
        swift_bridgeObjectRelease();
        uint64_t v319 = v409;
        if (v352)
        {
          swift_release();
        }
        else
        {
          uint64_t v353 = *(void *)(v0 + 1008);
          *unint64_t v369 = 1;
          sub_2248C46B8();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v354 = sub_2248AD8B4(v353);
          char v356 = v355;
          swift_bridgeObjectRelease();
          if (v356)
          {
            char v357 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v358 = *v330;
            v436[0] = *v330;
            uint64_t *v330 = 0x8000000000000000;
            if ((v357 & 1) == 0)
            {
              sub_2248B1358((uint64_t *)&unk_26AC07748);
              uint64_t v358 = v436[0];
            }
            (*(void (**)(unint64_t, void))(*(void *)(v0 + 1000) + 8))(*(void *)(v358 + 48) + *(void *)(v393 + 72) * v354, *(void *)(v0 + 992));
            sub_2248AFB70(v354, v358);
            uint64_t *v330 = v358;
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();

          swift_release();
        }
      }
      else
      {
        swift_endAccess();

        uint64_t v319 = v409;
      }
      uint64_t v323 = *(void *)(v0 + 1008);
      uint64_t v324 = *(void *)(v0 + 1000);
      uint64_t v325 = *(void *)(v0 + 992);
      uint64_t v326 = *(void *)(v0 + 960);
      (*v399)(*(void *)(v0 + 728), *(void *)(v0 + 712));
      sub_2248B9618(v326, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v324 + 8))(v323, v325);
      id v403 = 0;
      ++v321;
      if (v426 == v402) {
        goto LABEL_190;
      }
    }
    __break(1u);
LABEL_189:
    swift_bridgeObjectRetain();
  }
LABEL_190:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v360 = *(void *)(v0 + 488);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v361 = sub_2248C4698();
  os_log_type_t v362 = sub_2248C49C8();
  if (os_log_type_enabled(v361, v362))
  {
    uint64_t v363 = swift_slowAlloc();
    *(_DWORD *)uint64_t v363 = 134218240;
    if (v360 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v364 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v364 = *(void *)((v360 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *id v367 = v364;
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v363 + 12) = 2048;
    id v365 = v410[2];
    swift_bridgeObjectRelease();
    *uint64_t v368 = v365;
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22480C000, v361, v362, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v363, 0x16u);
    MEMORY[0x22A61A430](v363, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v366 = *(void **)(v0 + 1096);
  sub_2248A0898(*(void *)(v0 + 688));

LABEL_37:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v89 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v89(v433);
}

uint64_t sub_2248985E8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 1144) = v2;
  uint64_t v3 = *(void *)(v1 + 696);
  if (v2) {
    id v4 = sub_22489DEE4;
  }
  else {
    id v4 = sub_224898734;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_224898734()
{
  uint64_t v1 = v0[142];
  uint64_t v2 = v0[137];
  uint64_t v3 = v0[87];
  sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
  id v4 = (void *)swift_task_alloc();
  v0[144] = v4;
  v4[2] = v3;
  v4[3] = v1;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[145] = v5;
  void *v5 = v0;
  v5[1] = sub_2248988A4;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_2248988A4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 696);
    id v4 = sub_22489B5DC;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 696);
    swift_task_dealloc();
    id v4 = sub_224898A18;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_224898A18()
{
  unint64_t v403 = i;
  v402[9] = *MEMORY[0x263EF8340];
  uint64_t v1 = i + 488;
  uint64_t v2 = *(void **)(i + 1136);
  id v3 = *(id *)(i + 664);
  id v4 = v2;
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = sub_2248C4698();
  os_log_type_t v8 = sub_2248C49C8();
  unint64_t v400 = i;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void **)(i + 1136);
    uint64_t v10 = *(void **)(i + 664);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v390 = (void *)swift_slowAlloc();
    uint64_t v396 = swift_slowAlloc();
    v402[0] = v396;
    *(_DWORD *)uint64_t v11 = 136315394;
    id v12 = objc_msgSend(v9, sel_identifier);
    uint64_t v13 = sub_2248C4808();
    unint64_t v15 = v14;

    *(void *)(i + 560) = sub_2248AD104(v13, v15, v402);
    sub_2248C4A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    *(void *)(i + 568) = v10;
    id v16 = v10;
    uint64_t v1 = i + 488;
    sub_2248C4A28();
    *uint64_t v390 = v10;

    _os_log_impl(&dword_22480C000, v7, v8, "Status send END {status: %s, device: %@}", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v390, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v396, -1, -1);
    MEMORY[0x22A61A430](v11, -1, -1);
  }
  else
  {
    unint64_t v17 = *(void **)(i + 1136);
    uint64_t v18 = *(void **)(i + 664);
  }
  MEMORY[0x22A619380]();
  if (*(void *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    goto LABEL_101;
  while (1)
  {
    char v340 = (uint64_t *)(i + 512);
    uint64_t v19 = *(void *)(i + 1024);
    uint64_t v20 = *(void *)(i + 1000);
    unint64_t v21 = (uint64_t *)v1;
    uint64_t v22 = *(void *)(i + 992);
    uint64_t v23 = *(void *)(i + 984);
    uint64_t v24 = *(void *)(v400 + 936);
    sub_2248C48E8();
    uint64_t v339 = v21;
    sub_2248C48C8();
    uint64_t v25 = v24;
    unint64_t v26 = v400;
    sub_2248BA318(v25, &qword_268093940);
    sub_2248B9618(v23, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v22);
    unint64_t v27 = *(void **)(v400 + 1168);
    id v28 = *(void **)(v400 + 1128);
    uint64_t v29 = *(void *)(v400 + 1120) + 1;
    if (v29 != *(void *)(v400 + 1080)) {
      break;
    }
LABEL_6:
    unint64_t v30 = v27;
LABEL_7:
    os_log_type_t v362 = v28;
    id v364 = v30;
    uint64_t v31 = (const void *)(v26 + 80);
    unint64_t v32 = *(void **)(v26 + 1096);
    uint64_t v391 = *(void **)(v26 + 1056);
    unint64_t v397 = v26 + 440;
    uint64_t v33 = *(void *)(v400 + 784);
    uint64_t v373 = *(void *)(v400 + 776);
    uint64_t v377 = *(void *)(v400 + 768);
    uint64_t v34 = *(void *)(v400 + 760);
    uint64_t v35 = *(void *)(v400 + 752);
    uint64_t v36 = *(void *)(v400 + 744);
    uint64_t v383 = *(void *)(v400 + 688);
    swift_bridgeObjectRelease();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v32;
    *(void *)(v400 + 112) = sub_2248B95A0;
    *(void *)(v400 + 120) = v37;
    *(void *)(v400 + 80) = MEMORY[0x263EF8330];
    *(void *)(v400 + 88) = 1107296256;
    *(void *)(v400 + 96) = sub_224885AAC;
    *(void *)(v400 + 104) = &block_descriptor_63;
    id v38 = _Block_copy(v31);
    id v39 = v32;
    sub_2248C4768();
    *(void *)(v400 + 448) = MEMORY[0x263F8EE78];
    sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
    sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
    sub_2248C4A68();
    MEMORY[0x22A6194F0](0, v33, v34, v38);
    _Block_release(v38);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    uint64_t v40 = v33;
    unint64_t v41 = v400;
    (*(void (**)(uint64_t, uint64_t))(v373 + 8))(v40, v377);
    swift_release();
    *(void *)(v400 + 440) = 0;
    id v42 = objc_msgSend(v391, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v383, v397);
    BOOL v43 = *(void **)(v400 + 440);
    if (!v42)
    {
      uint64_t v203 = *(void **)(v400 + 1096);
      id v204 = v43;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v205 = (void *)sub_2248C4318();

      swift_willThrow();
      goto LABEL_144;
    }
    uint64_t v44 = v42;
    unint64_t i = sub_2248C48A8();
    id v45 = v43;

    unint64_t v46 = swift_bridgeObjectRetain();
    uint64_t v47 = sub_2248925D8(v46, v400 + 432, (SEL *)&selRef_identifier);
    id v374 = v364;
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_2248B55D8(v47);
    swift_bridgeObjectRelease();
    if (i >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
      if (!v48)
      {
LABEL_103:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v231 = v362[2];
        BOOL v351 = v231 == 0;
        if (!v231) {
          goto LABEL_117;
        }
        id v367 = *(int **)(v41 + 832);
        typea = (void (**)(uint64_t, uint64_t))(*(void *)(v41 + 720) + 8);
        uint64_t v358 = *(void *)(v41 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
        uint64_t v232 = (void *)(swift_bridgeObjectRetain() + 48);
        while (2)
        {
          uint64_t v239 = *(void *)(v41 + 1016);
          uint64_t v240 = *(v232 - 1);
          uint64_t v241 = *v232;
          id v242 = (id)*(v232 - 2);
          swift_bridgeObjectRetain();
          sub_2248A67BC(v239);
          uint64_t v243 = *(void *)(v41 + 1048);
          if (v374)
          {
            uint64_t v273 = *(void **)(v41 + 1096);
            swift_bridgeObjectRelease_n();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            swift_bridgeObjectRelease();
            uint64_t v205 = v374;
            goto LABEL_144;
          }
          uint64_t v388 = v242;
          uint64_t v371 = v232;
          uint64_t v381 = v231;
          uint64_t v244 = *(void *)(v41 + 1112);
          uint64_t v245 = *(void *)(v41 + 1040);
          uint64_t v246 = *(void *)(v41 + 1016);
          uint64_t v247 = *(void *)(v41 + 1000);
          uint64_t v248 = *(void *)(v41 + 992);
          uint64_t v249 = *(void *)(v41 + 976);
          uint64_t v250 = *(void *)(v400 + 944);
          uint64_t v251 = (uint64_t *)(*(void *)(v400 + 696) + v244);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v247 + 16))(v249, v246, v248);
          id v252 = (void *)(v249 + *(int *)(v250 + 20));
          void *v252 = v245;
          v252[1] = v243;
          swift_beginAccess();
          uint64_t v253 = *v251;
          uint64_t v254 = *(void *)(*v251 + 16);
          swift_bridgeObjectRetain();
          if (v254 && (unint64_t v255 = sub_2248AD75C(*(void *)(v400 + 976)), (v256 & 1) != 0))
          {
            uint64_t v341 = *(void *)(v400 + 976);
            uint64_t v257 = *(void *)(v400 + 968);
            uint64_t v258 = *(void *)(v400 + 872);
            uint64_t v259 = *(void *)(v400 + 864);
            uint64_t v260 = *(void *)(v400 + 856);
            uint64_t v349 = *(void *)(v400 + 848);
            uint64_t v261 = *(void *)(v400 + 800);
            uint64_t v344 = *(void *)(v400 + 792);
            id v262 = (uint64_t *)(*(void *)(v400 + 696) + *(void *)(v400 + 1112));
            sub_2248B95B0(*(void *)(v253 + 56) + *(void *)(*(void *)(v400 + 840) + 72) * v255, v259, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            sub_2248B9E38(v259, v258, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            swift_endAccess();
            sub_2248B95B0(v341, v257, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v261 + 16))(v260, v258, v344);
            sub_2248C43A8();
            id v263 = (void *)(v260 + v367[6]);
            *id v263 = v240;
            v263[1] = v241;
            swift_beginAccess();
            sub_2248B9E38(v260, v349, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v402[0] = *v262;
            *id v262 = 0x8000000000000000;
            sub_2248B0674(v349, v257, isUniquelyReferenced_nonNull_native);
            *id v262 = v402[0];
            swift_bridgeObjectRelease();
            sub_2248B9618(v257, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            swift_endAccess();
            sub_2248B9618(v258, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          }
          else
          {
            uint64_t v265 = *(void *)(v400 + 976);
            uint64_t v266 = *(void *)(v400 + 968);
            uint64_t v267 = *(void *)(v400 + 856);
            uint64_t v268 = *(void *)(v400 + 848);
            uint64_t v269 = (uint64_t *)(*(void *)(v400 + 696) + *(void *)(v400 + 1112));
            swift_endAccess();
            sub_2248B95B0(v265, v266, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            sub_2248C43A8();
            sub_2248C43A8();
            uint64_t v270 = (void *)(v267 + v367[6]);
            *uint64_t v270 = v240;
            v270[1] = v241;
            swift_beginAccess();
            sub_2248B9E38(v267, v268, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            char v271 = swift_isUniquelyReferenced_nonNull_native();
            v402[0] = *v269;
            *uint64_t v269 = 0x8000000000000000;
            sub_2248B0674(v268, v266, v271);
            *uint64_t v269 = v402[0];
            swift_bridgeObjectRelease();
            sub_2248B9618(v266, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            swift_endAccess();
          }
          sub_2248914E8(*(void *)(v400 + 1016), *(void *)(v400 + 688), *(void *)(v400 + 736));
          unint64_t v41 = v400;
          swift_beginAccess();
          if (*(void *)(*(void *)v358 + 16) && (sub_2248AD8B4(*(void *)(v400 + 1016)), (v272 & 1) != 0))
          {
            swift_endAccess();
            swift_retain();
            sub_2248C46C8();
            swift_release();
          }
          else
          {
            swift_endAccess();
          }
          uint64_t v233 = *(void *)(v400 + 1016);
          uint64_t v234 = *(void *)(v400 + 1000);
          uint64_t v235 = *(void *)(v400 + 992);
          uint64_t v236 = *(void *)(v400 + 976);
          uint64_t v237 = *(void *)(v400 + 736);
          uint64_t v238 = *(void *)(v400 + 712);

          (*typea)(v237, v238);
          sub_2248B9618(v236, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          (*(void (**)(uint64_t, uint64_t))(v234 + 8))(v233, v235);
          id v374 = 0;
          uint64_t v232 = v371 + 3;
          uint64_t v231 = v381 - 1;
          if (v381 != 1) {
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
        id v374 = 0;
LABEL_117:
        uint64_t v274 = *v339;
        if ((unint64_t)*v339 >> 62) {
          goto LABEL_149;
        }
        uint64_t v275 = *(void *)((v274 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v275)
        {
LABEL_150:
          unint64_t v327 = v400;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v328 = *(void *)(v400 + 488);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v329 = sub_2248C4698();
          os_log_type_t v330 = sub_2248C49C8();
          if (os_log_type_enabled(v329, v330))
          {
            uint64_t v331 = swift_slowAlloc();
            *(_DWORD *)uint64_t v331 = 134218240;
            if (v328 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v332 = sub_2248C4BC8();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v332 = *(void *)((v328 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            swift_bridgeObjectRelease();
            *(void *)(v400 + 456) = v332;
            unint64_t v327 = v400;
            sub_2248C4A28();
            swift_bridgeObjectRelease();
            *(_WORD *)(v331 + 12) = 2048;
            uint64_t v333 = v362[2];
            swift_bridgeObjectRelease();
            *(void *)(v400 + 464) = v333;
            sub_2248C4A28();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22480C000, v329, v330, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v331, 0x16u);
            MEMORY[0x22A61A430](v331, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }

          v334 = *(void **)(v327 + 1096);
          sub_2248A0898(*(void *)(v327 + 688));

          goto LABEL_156;
        }
        while (2)
        {
          uint64_t v276 = 0;
          uint64_t v342 = *(void *)(v400 + 1000);
          uint64_t v350 = *(void *)(v400 + 952);
          *(void *)typeb = *(void *)(v400 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
          unint64_t v382 = v274 & 0xC000000000000001;
          uint64_t v368 = (void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v400 + 840) + 56);
          uint64_t v372 = v274;
          uint64_t v353 = (void (**)(void, void))(*(void *)(v400 + 720) + 8);
          uint64_t v361 = v275;
LABEL_120:
          if (v382) {
            id v277 = (id)MEMORY[0x22A619600](v276, v274);
          }
          else {
            id v277 = *(id *)(v274 + 8 * v276 + 32);
          }
          v278 = v277;
          if (__OFADD__(v276, 1))
          {
            __break(1u);
LABEL_149:
            swift_bridgeObjectRetain();
            uint64_t v275 = sub_2248C4BC8();
            if (!v275) {
              goto LABEL_150;
            }
            continue;
          }
          break;
        }
        unint64_t v41 = v400;
        sub_2248A67BC(*(void *)(v400 + 1008));
        uint64_t v205 = v374;
        uint64_t v279 = *(void *)(v400 + 1048);
        if (v374)
        {
          uint64_t v313 = *(void **)(v400 + 1096);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_144;
        }
        uint64_t v280 = *(void *)(v400 + 1040);
        uint64_t v281 = *(void *)(v400 + 960);
        uint64_t v282 = *(void *)(v400 + 944);
        (*(void (**)(uint64_t, void, void))(*(void *)(v400 + 1000) + 16))(v281, *(void *)(v400 + 1008), *(void *)(v400 + 992));
        uint64_t v283 = (void *)(v281 + *(int *)(v282 + 20));
        void *v283 = v280;
        v283[1] = v279;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v284 = sub_2248AD75C(v281);
        char v286 = v285;
        swift_bridgeObjectRelease();
        uint64_t v389 = v276 + 1;
        if (v286)
        {
          uint64_t v287 = *(void *)(v400 + 1112);
          uint64_t v288 = *(void *)(v400 + 696);
          char v289 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v290 = *(void *)(v288 + v287);
          v402[0] = v290;
          *(void *)(v288 + v287) = 0x8000000000000000;
          if ((v289 & 1) == 0)
          {
            sub_2248B15F4();
            uint64_t v290 = v402[0];
          }
          id v291 = v278;
          uint64_t v292 = *(void *)(v400 + 1112);
          uint64_t v293 = *(void *)(v400 + 840);
          uint64_t v294 = *(void *)(v400 + 704);
          uint64_t v295 = *(void *)(v400 + 696);
          sub_2248B9618(*(void *)(v290 + 48) + *(void *)(v350 + 72) * v284, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_2248B9E38(*(void *)(v290 + 56) + *(void *)(v293 + 72) * v284, v294, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_2248AFE60(v284, v290);
          *(void *)(v295 + v292) = v290;
          swift_bridgeObjectRelease();
          uint64_t v296 = 0;
        }
        else
        {
          id v291 = v278;
          uint64_t v296 = 1;
        }
        uint64_t v297 = *(void *)(v400 + 1008);
        uint64_t v298 = *(void *)(v400 + 728);
        uint64_t v299 = *(void *)(v400 + 704);
        uint64_t v300 = *(void *)(v400 + 688);
        (*v368)(v299, v296, 1, *(void *)(v400 + 832));
        sub_2248BA318(v299, qword_26AC07620);
        swift_endAccess();
        sub_2248914E8(v297, v300, v298);
        swift_beginAccess();
        if (*(void *)(**(void **)typeb + 16) && (sub_2248AD8B4(*(void *)(v400 + 1008)), (v301 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_2248C46C8();
          uint64_t v302 = *(void *)(sub_2248C4408() + 16);
          swift_bridgeObjectRelease();
          if (v302)
          {
            swift_release();
            goto LABEL_135;
          }
          uint64_t v307 = *(void *)(v400 + 1008);
          *(unsigned char *)(v400 + 1176) = 1;
          sub_2248C46B8();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v308 = sub_2248AD8B4(v307);
          char v310 = v309;
          swift_bridgeObjectRelease();
          if (v310)
          {
            char v311 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v312 = **(void **)typeb;
            v402[0] = **(void **)typeb;
            **(void **)typeb = 0x8000000000000000;
            if ((v311 & 1) == 0)
            {
              sub_2248B1358((uint64_t *)&unk_26AC07748);
              uint64_t v312 = v402[0];
            }
            (*(void (**)(unint64_t, void))(*(void *)(v400 + 1000) + 8))(*(void *)(v312 + 48) + *(void *)(v342 + 72) * v308, *(void *)(v400 + 992));
            sub_2248AFB70(v308, v312);
            **(void **)typeb = v312;
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();

          swift_release();
        }
        else
        {
          swift_endAccess();
LABEL_135:
        }
        uint64_t v303 = *(void *)(v400 + 1008);
        uint64_t v304 = *(void *)(v400 + 1000);
        uint64_t v305 = *(void *)(v400 + 992);
        uint64_t v306 = *(void *)(v400 + 960);
        (*v353)(*(void *)(v400 + 728), *(void *)(v400 + 712));
        sub_2248B9618(v306, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v304 + 8))(v303, v305);
        id v374 = 0;
        ++v276;
        uint64_t v274 = v372;
        if (v389 == v361) {
          goto LABEL_150;
        }
        goto LABEL_120;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((i & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v48) {
        goto LABEL_103;
      }
    }
    unint64_t v49 = 0;
    unint64_t v359 = i & 0xC000000000000001;
    unint64_t v343 = i + 32;
    uint64_t v345 = i & 0xFFFFFFFFFFFFFF8;
    uint64_t v398 = v1 + 56;
    *(void *)os_log_type_t type = i;
    uint64_t v347 = v48;
    while (1)
    {
      if (v359)
      {
        id v50 = (id)MEMORY[0x22A619600](v49, i);
      }
      else
      {
        if (v49 >= *(void *)(v345 + 16)) {
          goto LABEL_100;
        }
        id v50 = *(id *)(v343 + 8 * v49);
      }
      id v51 = v50;
      BOOL v52 = __OFADD__(v49, 1);
      unint64_t v53 = v49 + 1;
      if (v52) {
        goto LABEL_99;
      }
      unint64_t v369 = v53;
      uint64_t v54 = *(void **)(v41 + 664);
      id v55 = objc_msgSend(v50, sel_idsIdentifier);
      id v56 = v51;
      uint64_t v57 = sub_2248C4808();
      uint64_t v59 = v58;

      id v60 = objc_msgSend(v54, sel_idsDeviceIdentifier);
      if (!v60)
      {

        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      unint64_t v61 = v60;
      id v365 = v56;
      uint64_t v62 = sub_2248C4808();
      uint64_t v64 = v63;

      if (v57 == v62 && v59 == v64) {
        break;
      }
      char v65 = sub_2248C4C28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v65) {
        goto LABEL_24;
      }

LABEL_12:
      unint64_t v41 = v400;
LABEL_13:
      unint64_t v49 = v369;
      if (v369 == v48) {
        goto LABEL_103;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_24:
    unint64_t i = v400;
    id v66 = objc_msgSend(v56, sel_pendingStatuses, v337);
    unint64_t v67 = sub_2248C48A8();

    swift_bridgeObjectRetain();
    sub_2248B7788(v67, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v401 = *(void *)(v400 + 488);
    swift_bridgeObjectRetain();
    id v68 = objc_msgSend(v56, sel_deliveredStatuses);
    unint64_t v69 = sub_2248C48A8();

    if (!(v69 >> 62))
    {
      uint64_t v70 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v70) {
        goto LABEL_26;
      }
LABEL_51:
      id v90 = *(void **)(v400 + 1056);
      uint64_t v393 = *(void *)(v400 + 688);
      swift_bridgeObjectRelease();
      id v91 = objc_msgSend(v365, sel_idsIdentifier);
      sub_2248C4808();

      id v92 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
      uint64_t v93 = (void *)sub_2248C47F8();
      swift_bridgeObjectRelease();
      id v94 = (void *)sub_2248C4898();
      swift_bridgeObjectRelease();
      uint64_t v95 = (void *)sub_2248C4898();
      swift_bridgeObjectRelease();
      id v96 = objc_msgSend(v92, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v93, v94, v95);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
      uint64_t v97 = swift_allocObject();
      *(_OWORD *)(v97 + 16) = xmmword_2248CBEB0;
      *(void *)(v97 + 32) = v96;
      v402[0] = v97;
      sub_2248C48C8();
      id v98 = v96;
      uint64_t v99 = (void *)sub_2248C4898();
      swift_bridgeObjectRelease();
      *(void *)(v400 + 496) = 0;
      unsigned int v100 = objc_msgSend(v90, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v99, v393, v400 + 496);

      unint64_t v41 = v400;
      uint64_t v101 = *(void **)(v400 + 496);
      if (v100)
      {
        id v102 = v101;

        unint64_t i = *(void *)type;
        uint64_t v48 = v347;
        goto LABEL_13;
      }
      uint64_t v229 = *(void **)(v400 + 1096);
      id v230 = v101;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v205 = (void *)sub_2248C4318();

      swift_willThrow();
LABEL_144:
      id v314 = *(id *)(v41 + 664);
      id v315 = v205;
      id v316 = v314;
      id v317 = v205;
      v318 = sub_2248C4698();
      os_log_type_t v319 = sub_2248C49B8();
      BOOL v320 = os_log_type_enabled(v318, v319);
      uint64_t v321 = *(void **)(v41 + 664);
      if (v320)
      {
        uint64_t v322 = swift_slowAlloc();
        uint64_t v323 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v322 = 138412546;
        *(void *)(v41 + 536) = v321;
        id v324 = v321;
        sub_2248C4A28();
        void *v323 = v321;

        *(_WORD *)(v322 + 12) = 2112;
        id v325 = v205;
        uint64_t v326 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v400 + 504) = v326;
        sub_2248C4A28();
        v323[1] = v326;

        _os_log_impl(&dword_22480C000, v318, v319, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v322, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v323, -1, -1);
        MEMORY[0x22A61A430](v322, -1, -1);
      }
      else
      {
      }
      BOOL v351 = 0;
LABEL_156:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v335 = *(uint64_t (**)(BOOL))(v400 + 8);
      return v335(v351);
    }
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    if (!v70) {
      goto LABEL_51;
    }
LABEL_26:
    unint64_t v71 = 0;
    unint64_t v72 = v69;
    unint64_t v73 = v69 & 0xC000000000000001;
    uint64_t v384 = v72 & 0xFFFFFFFFFFFFFF8;
    unint64_t v392 = v72;
    unint64_t v378 = v72 + 32;
    while (1)
    {
      if (v73)
      {
        id v74 = (id)MEMORY[0x22A619600](v71, v392);
      }
      else
      {
        if (v71 >= *(void *)(v384 + 16)) {
          goto LABEL_98;
        }
        id v74 = *(id *)(v378 + 8 * v71);
      }
      id v75 = v74;
      BOOL v52 = __OFADD__(v71++, 1);
      if (v52) {
        break;
      }
      id v76 = objc_msgSend(v74, sel_identifier);
      uint64_t v77 = sub_2248C4808();
      uint64_t v79 = v78;

      if (*(void *)(v1 + 16))
      {
        sub_2248C4CD8();
        sub_2248C4838();
        uint64_t v80 = sub_2248C4D08();
        unint64_t i = -1 << *(unsigned char *)(v1 + 32);
        unint64_t v81 = v80 & ~i;
        if ((*(void *)(v398 + ((v81 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v81))
        {
          uint64_t v82 = *(void *)(v1 + 48);
          id v83 = (void *)(v82 + 16 * v81);
          BOOL v84 = *v83 == v77 && v83[1] == v79;
          if (v84 || (sub_2248C4C28() & 1) != 0)
          {
LABEL_27:

            swift_bridgeObjectRelease();
            if (v71 == v70) {
              goto LABEL_51;
            }
            continue;
          }
          unint64_t v85 = v81 + 1;
          unint64_t v86 = ~i;
          for (unint64_t i = v85 & ~i; ((*(void *)(v398 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v86)
          {
            unint64_t v87 = (void *)(v82 + 16 * i);
            BOOL v88 = *v87 == v77 && v87[1] == v79;
            if (v88 || (sub_2248C4C28() & 1) != 0) {
              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v89 = swift_bridgeObjectRelease();
      MEMORY[0x22A619380](v89);
      if (*(void *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2248C48D8();
      }
      sub_2248C48E8();
      sub_2248C48C8();
      if (v71 == v70) {
        goto LABEL_51;
      }
    }
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    sub_2248C48D8();
  }
  uint64_t v338 = (_OWORD *)(v400 + 168);
  char v337 = (void *)(v400 + 528);
  while (2)
  {
    uint64_t v363 = v28;
LABEL_60:
    *(void *)(v26 + 1128) = v28;
    *(void *)(v26 + 1120) = v29;
    uint64_t v124 = *(void *)(v26 + 1024);
    uint64_t v125 = *(void **)(*(void *)(v26 + 1072) + 8 * v29 + 32);
    *(void *)(v26 + 1136) = v125;
    id v126 = v125;
    uint64_t v127 = v27;
    sub_2248A67BC(v124);
    if (v27)
    {
      unint64_t v166 = *(void **)(v26 + 1136);
      id v167 = *(id *)(v26 + 664);
      id v168 = v166;
      id v169 = v127;
      id v170 = v167;
      id v171 = v168;
      id v172 = v127;
      unint64_t v173 = sub_2248C4698();
      os_log_type_t v174 = sub_2248C49A8();
      BOOL v175 = os_log_type_enabled(v173, v174);
      uint64_t v176 = *(void **)(v26 + 1136);
      uint64_t v177 = *(void **)(v26 + 664);
      if (v175)
      {
        uint64_t v178 = swift_slowAlloc();
        uint64_t v179 = (void *)swift_slowAlloc();
        uint64_t v395 = swift_slowAlloc();
        v402[0] = v395;
        *(_DWORD *)uint64_t v178 = 136315650;
        id v180 = objc_msgSend(v176, sel_identifier);
        uint64_t v181 = sub_2248C4808();
        uint64_t v386 = v173;
        unint64_t v183 = v182;

        uint64_t *v340 = sub_2248AD104(v181, v183, v402);
        sub_2248C4A28();

        swift_bridgeObjectRelease();
        *(_WORD *)(v178 + 12) = 2112;
        id v184 = v127;
        uint64_t v185 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v400 + 520) = v185;
        sub_2248C4A28();
        *uint64_t v179 = v185;

        *(_WORD *)(v178 + 22) = 2112;
        *char v337 = v177;
        id v186 = v177;
        sub_2248C4A28();
        v179[1] = v177;

        _os_log_impl(&dword_22480C000, v386, v174, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v178, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
        swift_arrayDestroy();
        unint64_t v187 = v179;
        unint64_t v26 = v400;
        MEMORY[0x22A61A430](v187, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v395, -1, -1);
        MEMORY[0x22A61A430](v178, -1, -1);
      }
      else
      {
      }
      uint64_t v188 = (void *)sub_2248C4308();
      id v189 = objc_msgSend(v188, sel_userInfo);
      uint64_t v190 = sub_2248C4798();

      if (*(void *)(v190 + 16) && (unint64_t v191 = sub_2248AD83C(0x4D726F7272457563, 0xEA00000000006773), (v192 & 1) != 0))
      {
        sub_2248B9678(*(void *)(v190 + 56) + 32 * v191, (uint64_t)v338);
      }
      else
      {
        *uint64_t v338 = 0u;
        *(_OWORD *)(v400 + 184) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v26 + 192))
      {
        if (swift_dynamicCast())
        {
          uint64_t v193 = *(void *)(v26 + 416);
          uint64_t v194 = *(void *)(v26 + 424);
          goto LABEL_81;
        }
      }
      else
      {
        sub_2248BA318((uint64_t)v338, &qword_268093B58);
      }
      swift_getErrorValue();
      uint64_t v193 = sub_2248C4C88();
      uint64_t v194 = v195;
LABEL_81:
      char v196 = swift_isUniquelyReferenced_nonNull_native();
      id v197 = *(void **)(v26 + 1128);
      if ((v196 & 1) == 0) {
        id v197 = sub_2248ACFDC(0, v197[2] + 1, 1, v197);
      }
      unint64_t v199 = v197[2];
      unint64_t v198 = v197[3];
      if (v199 >= v198 >> 1) {
        id v197 = sub_2248ACFDC((void *)(v198 > 1), v199 + 1, 1, v197);
      }
      uint64_t v200 = *(void *)(v26 + 1136);
      v197[2] = v199 + 1;
      id v201 = &v197[3 * v199];
      v201[4] = v200;
      v201[5] = v193;
      v201[6] = v194;
      unint64_t v202 = v197;

      id v28 = v202;
      unint64_t v27 = 0;
      unint64_t v30 = 0;
      uint64_t v29 = *(void *)(v26 + 1120) + 1;
      if (v29 == *(void *)(v26 + 1080)) {
        goto LABEL_7;
      }
      continue;
    }
    break;
  }
  uint64_t v128 = *(void *)(v26 + 1048);
  uint64_t v129 = *(void *)(v26 + 1040);
  uint64_t v130 = *(void *)(v26 + 984);
  uint64_t v131 = *(void *)(v26 + 944);
  uint64_t v132 = (uint64_t *)(*(void *)(v26 + 696) + *(void *)(v26 + 1112));
  (*(void (**)(uint64_t, void, void))(*(void *)(v26 + 1000) + 16))(v130, *(void *)(v26 + 1024), *(void *)(v26 + 992));
  unint64_t v133 = (void *)(v130 + *(int *)(v131 + 20));
  *unint64_t v133 = v129;
  v133[1] = v128;
  swift_beginAccess();
  uint64_t v134 = *v132;
  uint64_t v135 = *(void *)(*v132 + 16);
  swift_bridgeObjectRetain();
  if (v135 && (unint64_t v136 = sub_2248AD75C(*(void *)(v26 + 984)), (v137 & 1) != 0))
  {
    uint64_t v138 = *(void *)(v26 + 936);
    uint64_t v139 = *(void *)(v26 + 928);
    uint64_t v140 = *(void *)(v26 + 888);
    uint64_t v141 = *(void *)(v400 + 880);
    uint64_t v142 = *(void *)(v400 + 800);
    uint64_t v143 = *(void *)(v400 + 792);
    sub_2248B95B0(*(void *)(v134 + 56) + *(void *)(*(void *)(v400 + 840) + 72) * v136, v141, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_2248B9E38(v141, v140, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    swift_endAccess();
    sub_2248C4348();
    unint64_t v26 = v400;
    sub_2248C4358();
    sub_2248B9618(v140, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v142 + 56))(v139, 0, 1, v143);
    sub_2248BA210(v139, v138, &qword_268093940);
  }
  else
  {
    uint64_t v144 = *(void *)(v26 + 936);
    uint64_t v145 = *(void *)(v26 + 800);
    uint64_t v146 = *(void *)(v26 + 792);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v145 + 56))(v144, 1, 1, v146);
  }
  uint64_t v147 = *(void *)(v26 + 920);
  uint64_t v148 = *(void *)(v26 + 800);
  uint64_t v149 = *(void *)(v26 + 792);
  sub_2248BAB80(*(void *)(v26 + 936), v147, &qword_268093940);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v148 + 48))(v147, 1, v149) == 1)
  {
    sub_2248BA318(*(void *)(v26 + 920), &qword_268093940);
    goto LABEL_90;
  }
  uint64_t v150 = *(void *)(v26 + 816);
  uint64_t v151 = *(void *)(v26 + 800);
  uint64_t v152 = *(void *)(v26 + 792);
  (*(void (**)(void, void, uint64_t))(v151 + 32))(*(void *)(v26 + 824), *(void *)(v26 + 920), v152);
  sub_2248C43A8();
  char v153 = sub_2248C4378();
  uint64_t v154 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
  v154(v150, v152);
  if (v153)
  {
    (*(void (**)(void, void, void))(*(void *)(v26 + 800) + 16))(*(void *)(v26 + 808), *(void *)(v26 + 824), *(void *)(v26 + 792));
    swift_bridgeObjectRetain_n();
    id v394 = v126;
    char v155 = sub_2248C4698();
    os_log_type_t v156 = sub_2248C49C8();
    uint64_t v385 = v155;
    BOOL v157 = os_log_type_enabled(v155, v156);
    unint64_t v158 = *(void *)(v26 + 1048);
    if (v157)
    {
      uint64_t v348 = *(void *)(v26 + 1040);
      uint64_t v379 = *(void *)(v26 + 1024);
      uint64_t v370 = *(void *)(v26 + 1000);
      uint64_t v375 = *(void *)(v26 + 992);
      id v366 = *(id *)(v26 + 984);
      uint64_t v357 = *(void *)(v26 + 824);
      uint64_t v360 = *(void *)(v26 + 936);
      uint64_t v103 = *(void *)(v26 + 808);
      uint64_t v104 = *(void *)(v26 + 792);
      uint64_t v105 = swift_slowAlloc();
      uint64_t v352 = swift_slowAlloc();
      v402[0] = v352;
      *(_DWORD *)uint64_t v105 = 136315650;
      sub_2248AD9A0(&qword_268093B80, MEMORY[0x263F07490]);
      uint64_t v106 = sub_2248C4C18();
      *(void *)(v400 + 600) = sub_2248AD104(v106, v107, v402);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      v154(v103, v104);
      *(_WORD *)(v105 + 12) = 2080;
      id v108 = objc_msgSend(v394, sel_identifier);
      uint64_t v109 = sub_2248C4808();
      uint64_t v346 = v154;
      unint64_t v111 = v110;

      *(void *)(v400 + 608) = sub_2248AD104(v109, v111, v402);
      sub_2248C4A28();

      swift_bridgeObjectRelease();
      *(_WORD *)(v105 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v113 = sub_2248B5808(8, v348, v158, v112);
      uint64_t v115 = v114;
      uint64_t v117 = v116;
      uint64_t v119 = v118;
      swift_bridgeObjectRelease();
      uint64_t v120 = v117;
      unint64_t v26 = v400;
      uint64_t v121 = MEMORY[0x22A619320](v113, v115, v120, v119);
      unint64_t v123 = v122;
      swift_bridgeObjectRelease();
      *(void *)(v400 + 616) = sub_2248AD104(v121, v123, v402);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v385, v156, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v105, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v352, -1, -1);
      MEMORY[0x22A61A430](v105, -1, -1);

      v346(v357, v104);
      sub_2248BA318(v360, &qword_268093940);
      sub_2248B9618((uint64_t)v366, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v370 + 8))(v379, v375);
    }
    else
    {
      uint64_t v159 = *(void *)(v26 + 1000);
      uint64_t v376 = *(void *)(v26 + 992);
      uint64_t v380 = *(void *)(v26 + 1024);
      uint64_t v160 = *(void *)(v26 + 984);
      uint64_t v161 = *(void *)(v400 + 936);
      uint64_t v162 = *(void *)(v400 + 824);
      uint64_t v163 = *(void *)(v400 + 808);
      uint64_t v164 = *(void *)(v400 + 792);

      swift_bridgeObjectRelease_n();
      v154(v163, v164);

      v154(v162, v164);
      uint64_t v165 = v161;
      unint64_t v26 = v400;
      sub_2248BA318(v165, &qword_268093940);
      sub_2248B9618(v160, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v159 + 8))(v380, v376);
    }
    unint64_t v27 = 0;
    uint64_t v29 = *(void *)(v26 + 1120) + 1;
    id v28 = v363;
    if (v29 == *(void *)(v26 + 1080)) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
  v154(*(void *)(v26 + 824), *(void *)(v26 + 792));
LABEL_90:
  unint64_t v206 = *(void **)(v26 + 664);
  sub_2248BAB80(*(void *)(v26 + 936), *(void *)(v26 + 912), &qword_268093940);
  id v207 = v206;
  id v208 = v126;
  id v209 = v207;
  id v210 = v208;
  id v211 = sub_2248C4698();
  os_log_type_t v212 = sub_2248C49C8();
  BOOL v213 = os_log_type_enabled(v211, v212);
  uint64_t v214 = *(void *)(v26 + 912);
  if (v213)
  {
    uint64_t v387 = *(void *)(v26 + 904);
    id v215 = *(void **)(v26 + 664);
    uint64_t v216 = swift_slowAlloc();
    uint64_t v217 = (void *)swift_slowAlloc();
    uint64_t v399 = swift_slowAlloc();
    v402[0] = v399;
    *(_DWORD *)uint64_t v216 = 138412802;
    *(void *)(v400 + 576) = v210;
    id v218 = v210;
    sub_2248C4A28();
    *uint64_t v217 = v210;

    *(_WORD *)(v216 + 12) = 2112;
    *(void *)(v400 + 584) = v215;
    id v219 = v215;
    sub_2248C4A28();
    v217[1] = v215;

    *(_WORD *)(v216 + 22) = 2080;
    sub_2248BAB80(v214, v387, &qword_268093940);
    uint64_t v220 = sub_2248C4818();
    *(void *)(v400 + 592) = sub_2248AD104(v220, v221, v402);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    sub_2248BA318(v214, &qword_268093940);
    _os_log_impl(&dword_22480C000, v211, v212, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v216, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    id v222 = v217;
    unint64_t v26 = v400;
    MEMORY[0x22A61A430](v222, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v399, -1, -1);
    MEMORY[0x22A61A430](v216, -1, -1);
  }
  else
  {
    unint64_t v223 = *(void **)(v26 + 664);

    sub_2248BA318(v214, &qword_268093940);
  }

  uint64_t v224 = *(void *)(v26 + 1136);
  uint64_t v225 = *(void *)(v26 + 1096);
  uint64_t v226 = *(void *)(v26 + 696);
  sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
  uint64_t v227 = (void *)swift_task_alloc();
  *(void *)(v26 + 1152) = v227;
  v227[2] = v226;
  v227[3] = v224;
  v227[4] = v225;
  id v228 = (void *)swift_task_alloc();
  *(void *)(v26 + 1160) = v228;
  void *v228 = v26;
  v228[1] = sub_2248988A4;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_22489B5DC()
{
  uint64_t v373 = v0;
  uint64_t v1 = (void *)v0;
  uint64_t aBlock = (void *)(v0 + 80);
  id v314 = (_OWORD *)(v0 + 168);
  v372[9] = *MEMORY[0x263EF8340];
  uint64_t v307 = v0 + 432;
  uint64_t v309 = v0 + 440;
  uint64_t v313 = v0 + 496;
  uint64_t v306 = (uint64_t *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 1024);
  char v310 = (NSObject **)(v0 + 528);
  char v311 = (uint64_t *)(v0 + 520);
  uint64_t v312 = (uint64_t *)(v0 + 512);
  uint64_t v3 = *(void *)(v0 + 1000);
  uint64_t v4 = v1[124];
  uint64_t v5 = v1[123];
  uint64_t v6 = v1[117];
  uint64_t v305 = v1 + 147;
  swift_task_dealloc();
  sub_2248BA318(v6, &qword_268093940);
  sub_2248B9618(v5, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v7 = (void *)v1[146];
  uint64_t v370 = v1;
  os_log_type_t v8 = (void *)v1[142];
  id v9 = (id)v1[83];
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  id v13 = v10;
  id v14 = v7;
  unint64_t v15 = sub_2248C4698();
  os_log_type_t v16 = sub_2248C49A8();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v18 = (void *)v1[142];
  uint64_t v19 = v1[83];
  if (v17)
  {
    uint64_t v20 = swift_slowAlloc();
    unint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v358 = swift_slowAlloc();
    v372[0] = v358;
    *(_DWORD *)uint64_t v20 = 136315650;
    id v22 = objc_msgSend(v18, sel_identifier);
    uint64_t v23 = sub_2248C4808();
    uint64_t v350 = v15;
    unint64_t v25 = v24;

    *uint64_t v312 = sub_2248AD104(v23, v25, v372);
    sub_2248C4A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    id v26 = v7;
    uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
    *char v311 = v27;
    sub_2248C4A28();
    *unint64_t v21 = v27;

    *(_WORD *)(v20 + 22) = 2112;
    void *v310 = v19;
    id v28 = v19;
    sub_2248C4A28();
    v21[1] = v19;

    uint64_t v19 = v350;
    _os_log_impl(&dword_22480C000, v350, v16, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    uint64_t v29 = v21;
    uint64_t v1 = v370;
    MEMORY[0x22A61A430](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v358, -1, -1);
    MEMORY[0x22A61A430](v20, -1, -1);
  }
  else
  {
  }
  unint64_t v30 = (void *)sub_2248C4308();
  id v31 = objc_msgSend(v30, sel_userInfo);
  uint64_t v32 = sub_2248C4798();

  if (*(void *)(v32 + 16) && (unint64_t v33 = sub_2248AD83C(0x4D726F7272457563, 0xEA00000000006773), (v34 & 1) != 0))
  {
    sub_2248B9678(*(void *)(v32 + 56) + 32 * v33, (uint64_t)v314);
  }
  else
  {
    *id v314 = 0u;
    v314[1] = 0u;
  }
  swift_bridgeObjectRelease();
  if (!v1[24])
  {
    sub_2248BA318((uint64_t)v314, &qword_268093B58);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    swift_getErrorValue();
    uint64_t v35 = sub_2248C4C88();
    uint64_t v36 = v37;
    goto LABEL_13;
  }
  uint64_t v35 = v1[52];
  uint64_t v36 = v1[53];
LABEL_13:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  id v39 = (void *)v1[141];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    id v39 = sub_2248ACFDC(0, v39[2] + 1, 1, v39);
  }
  unint64_t v41 = v39[2];
  unint64_t v40 = v39[3];
  if (v41 >= v40 >> 1) {
    id v39 = sub_2248ACFDC((void *)(v40 > 1), v41 + 1, 1, v39);
  }
  uint64_t v42 = v1[142];
  v39[2] = v41 + 1;
  uint64_t v349 = v39;
  BOOL v43 = &v39[3 * v41];
  v43[4] = v42;
  v43[5] = v35;
  v43[6] = v36;

  uint64_t v44 = v1[140] + 1;
  if (v44 != v1[135])
  {
    while (1)
    {
      v1[141] = v349;
      v1[140] = v44;
      uint64_t v66 = v1[128];
      unint64_t v67 = *(void **)(v1[134] + 8 * v44 + 32);
      v1[142] = v67;
      id v68 = v67;
      sub_2248A67BC(v66);
      uint64_t v69 = v1[131];
      uint64_t v70 = v1[130];
      uint64_t v71 = v1[123];
      uint64_t v72 = v1[118];
      unint64_t v73 = (uint64_t *)(v1[87] + v1[139]);
      (*(void (**)(uint64_t, void, void))(v1[125] + 16))(v71, v1[128], v1[124]);
      id v74 = (void *)(v71 + *(int *)(v72 + 20));
      *id v74 = v70;
      v74[1] = v69;
      swift_beginAccess();
      uint64_t v75 = *v73;
      uint64_t v76 = *(void *)(*v73 + 16);
      swift_bridgeObjectRetain();
      if (v76 && (unint64_t v77 = sub_2248AD75C(v1[123]), (v78 & 1) != 0))
      {
        uint64_t v79 = v1[117];
        uint64_t v80 = v1[116];
        uint64_t v81 = v1[111];
        uint64_t v82 = v370[110];
        uint64_t v83 = v370[100];
        uint64_t v84 = v370[99];
        sub_2248B95B0(*(void *)(v75 + 56) + *(void *)(v370[105] + 72) * v77, v82, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_2248B9E38(v82, v81, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_2248C4348();
        uint64_t v1 = v370;
        sub_2248C4358();
        sub_2248B9618(v81, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v83 + 56))(v80, 0, 1, v84);
        sub_2248BA210(v80, v79, &qword_268093940);
      }
      else
      {
        uint64_t v85 = v1[117];
        uint64_t v86 = v1[100];
        uint64_t v87 = v1[99];
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56))(v85, 1, 1, v87);
      }
      uint64_t v88 = v1[115];
      uint64_t v89 = v1[100];
      uint64_t v90 = v1[99];
      sub_2248BAB80(v1[117], v88, &qword_268093940);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v88, 1, v90) == 1)
      {
        sub_2248BA318(v1[115], &qword_268093940);
        goto LABEL_80;
      }
      uint64_t v91 = v1[102];
      uint64_t v92 = v1[100];
      uint64_t v93 = v1[99];
      (*(void (**)(void, void, uint64_t))(v92 + 32))(v1[103], v1[115], v93);
      sub_2248C43A8();
      char v94 = sub_2248C4378();
      uint64_t v95 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      v95(v91, v93);
      if ((v94 & 1) == 0) {
        break;
      }
      (*(void (**)(void, void, void))(v1[100] + 16))(v1[101], v1[103], v1[99]);
      swift_bridgeObjectRetain_n();
      id v96 = v68;
      uint64_t v97 = sub_2248C4698();
      os_log_type_t v98 = sub_2248C49C8();
      unint64_t v359 = v97;
      BOOL v99 = os_log_type_enabled(v97, v98);
      unint64_t v351 = v1[131];
      if (v99)
      {
        uint64_t v317 = v1[130];
        uint64_t v342 = v1[124];
        uint64_t v344 = v1[128];
        uint64_t v334 = v1[123];
        uint64_t v338 = v1[125];
        uint64_t v328 = v1[103];
        uint64_t v330 = v1[117];
        uint64_t v45 = v1[101];
        os_log_type_t typeb = v98;
        uint64_t v46 = v1[99];
        uint64_t v47 = swift_slowAlloc();
        uint64_t v322 = swift_slowAlloc();
        v372[0] = v322;
        *(_DWORD *)uint64_t v47 = 136315650;
        sub_2248AD9A0(&qword_268093B80, MEMORY[0x263F07490]);
        uint64_t v320 = v46;
        uint64_t v48 = sub_2248C4C18();
        unint64_t v49 = v1;
        v1[75] = sub_2248AD104(v48, v50, v372);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        v95(v45, v46);
        *(_WORD *)(v47 + 12) = 2080;
        id v51 = objc_msgSend(v96, sel_identifier);
        uint64_t v52 = sub_2248C4808();
        unint64_t v54 = v53;

        v49[76] = sub_2248AD104(v52, v54, v372);
        sub_2248C4A28();

        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_2248B5808(8, v317, v351, v55);
        uint64_t v58 = v57;
        uint64_t v60 = v59;
        uint64_t v62 = v61;
        swift_bridgeObjectRelease();
        uint64_t v63 = MEMORY[0x22A619320](v56, v58, v60, v62);
        unint64_t v65 = v64;
        swift_bridgeObjectRelease();
        v49[77] = sub_2248AD104(v63, v65, v372);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22480C000, v359, typeb, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v47, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v322, -1, -1);
        MEMORY[0x22A61A430](v47, -1, -1);

        v95(v328, v320);
        sub_2248BA318(v330, &qword_268093940);
        sub_2248B9618(v334, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v338 + 8))(v344, v342);
      }
      else
      {
        uint64_t v100 = v1[125];
        uint64_t v343 = v1[124];
        uint64_t v345 = v1[128];
        uint64_t v101 = v1[123];
        unint64_t v49 = v1;
        uint64_t v102 = v1[117];
        uint64_t v103 = v49[103];
        uint64_t v104 = v49[101];
        uint64_t v105 = v49[99];

        swift_bridgeObjectRelease_n();
        v95(v104, v105);

        v95(v103, v105);
        sub_2248BA318(v102, &qword_268093940);
        sub_2248B9618(v101, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v345, v343);
      }
      uint64_t v44 = v49[140] + 1;
      uint64_t v1 = v49;
      if (v44 == v49[135]) {
        goto LABEL_29;
      }
    }
    v95(v1[103], v1[99]);
LABEL_80:
    uint64_t v178 = (void *)v1[83];
    sub_2248BAB80(v1[117], v1[114], &qword_268093940);
    id v179 = v178;
    id v180 = v68;
    id v181 = v179;
    id v182 = v180;
    unint64_t v183 = sub_2248C4698();
    os_log_type_t v184 = sub_2248C49C8();
    BOOL v185 = os_log_type_enabled(v183, v184);
    uint64_t v186 = v1[114];
    if (v185)
    {
      uint64_t v355 = v1[113];
      unint64_t v187 = (void *)v1[83];
      uint64_t v188 = swift_slowAlloc();
      id v189 = (void *)swift_slowAlloc();
      uint64_t v367 = swift_slowAlloc();
      v372[0] = v367;
      *(_DWORD *)uint64_t v188 = 138412802;
      v370[72] = v182;
      id v190 = v182;
      sub_2248C4A28();
      *id v189 = v182;

      *(_WORD *)(v188 + 12) = 2112;
      v370[73] = v187;
      id v191 = v187;
      sub_2248C4A28();
      v189[1] = v187;

      *(_WORD *)(v188 + 22) = 2080;
      sub_2248BAB80(v186, v355, &qword_268093940);
      uint64_t v192 = sub_2248C4818();
      v370[74] = sub_2248AD104(v192, v193, v372);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      sub_2248BA318(v186, &qword_268093940);
      _os_log_impl(&dword_22480C000, v183, v184, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v188, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      uint64_t v194 = v189;
      uint64_t v1 = v370;
      MEMORY[0x22A61A430](v194, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v367, -1, -1);
      MEMORY[0x22A61A430](v188, -1, -1);
    }
    else
    {
      uint64_t v195 = (void *)v1[83];

      sub_2248BA318(v186, &qword_268093940);
    }

    uint64_t v196 = v1[142];
    uint64_t v197 = v1[137];
    uint64_t v198 = v1[87];
    sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
    unint64_t v199 = (void *)swift_task_alloc();
    v1[144] = v199;
    v199[2] = v198;
    v199[3] = v196;
    v199[4] = v197;
    uint64_t v200 = (void *)swift_task_alloc();
    v1[145] = v200;
    void *v200 = v1;
    v200[1] = sub_2248988A4;
    return MEMORY[0x270FA2360]();
  }
LABEL_29:
  uint64_t v106 = (void *)v1[137];
  unint64_t v107 = (void *)v1[132];
  uint64_t v108 = v1[98];
  uint64_t v109 = v1[97];
  uint64_t v352 = v1[96];
  uint64_t v110 = v370[95];
  uint64_t v111 = v370[94];
  uint64_t v112 = v370[93];
  uint64_t v360 = v370[86];
  id v365 = v107;
  swift_bridgeObjectRelease();
  uint64_t v113 = swift_allocObject();
  *(void *)(v113 + 16) = v106;
  v370[14] = sub_2248B95A0;
  v370[15] = v113;
  v370[10] = MEMORY[0x263EF8330];
  v370[11] = 1107296256;
  v370[12] = sub_224885AAC;
  v370[13] = &block_descriptor_63;
  uint64_t v114 = _Block_copy(aBlock);
  id v115 = v106;
  sub_2248C4768();
  v370[56] = MEMORY[0x263F8EE78];
  sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
  sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
  sub_2248C4A68();
  MEMORY[0x22A6194F0](0, v108, v110, v114);
  _Block_release(v114);
  uint64_t v116 = v110;
  uint64_t v117 = (uint64_t)v370;
  (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v116, v112);
  (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v352);
  swift_release();
  v370[55] = 0;
  id v118 = objc_msgSend(v365, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v360, v309);
  uint64_t v119 = (void *)v370[55];
  if (!v118)
  {
    id v201 = (void *)v370[137];
    id v202 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v203 = (void *)sub_2248C4318();

    swift_willThrow();
    goto LABEL_88;
  }
  uint64_t v120 = v118;
  unint64_t v121 = sub_2248C48A8();
  id v122 = v119;

  unint64_t v123 = swift_bridgeObjectRetain();
  uint64_t v124 = sub_2248925D8(v123, v307, (SEL *)&selRef_identifier);
  swift_bridgeObjectRelease();
  uint64_t v125 = sub_2248B55D8(v124);
  swift_bridgeObjectRelease();
  if (v121 >> 62) {
    goto LABEL_93;
  }
  uint64_t v126 = *(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v126)
  {
LABEL_94:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v205 = v349[2];
    BOOL v329 = v205 == 0;
    if (v205)
    {
      uint64_t v336 = *(void *)(v117 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      uint64_t v340 = *(void *)(v117 + 832);
      uint64_t v332 = (void (**)(uint64_t, uint64_t))(*(void *)(v117 + 720) + 8);
      unint64_t v206 = (void *)(swift_bridgeObjectRetain() + 48);
      do
      {
        uint64_t v213 = *(void *)(v117 + 1016);
        uint64_t v214 = *(v206 - 1);
        uint64_t v215 = *v206;
        id v216 = (id)*(v206 - 2);
        swift_bridgeObjectRetain();
        sub_2248A67BC(v213);
        uint64_t v217 = *(void *)(v117 + 1048);
        uint64_t v363 = v214;
        uint64_t v368 = v216;
        uint64_t v347 = v206;
        uint64_t v356 = v205;
        uint64_t v218 = *(void *)(v117 + 1040);
        uint64_t v219 = *(void *)(v117 + 976);
        uint64_t v220 = *(void *)(v117 + 944);
        unint64_t v221 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
        (*(void (**)(uint64_t, void, void))(*(void *)(v117 + 1000) + 16))(v219, *(void *)(v117 + 1016), *(void *)(v117 + 992));
        id v222 = (void *)(v219 + *(int *)(v220 + 20));
        *id v222 = v218;
        v222[1] = v217;
        swift_beginAccess();
        uint64_t v223 = *v221;
        uint64_t v224 = *(void *)(*v221 + 16);
        swift_bridgeObjectRetain();
        if (v224 && (unint64_t v225 = sub_2248AD75C(*(void *)(v117 + 976)), (v226 & 1) != 0))
        {
          uint64_t v227 = *(void *)(v117 + 968);
          uint64_t v228 = *(void *)(v117 + 872);
          uint64_t v229 = *(void *)(v117 + 864);
          uint64_t v230 = *(void *)(v117 + 856);
          uint64_t typec = *(void *)(v117 + 848);
          uint64_t v231 = *(void *)(v117 + 800);
          uint64_t v316 = *(void *)(v117 + 976);
          uint64_t v319 = *(void *)(v117 + 792);
          uint64_t v232 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
          sub_2248B95B0(*(void *)(v223 + 56) + *(void *)(*(void *)(v117 + 840) + 72) * v225, v229, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_2248B9E38(v229, v228, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          swift_endAccess();
          sub_2248B95B0(v316, v227, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v231 + 16))(v230, v228, v319);
          sub_2248C43A8();
          uint64_t v233 = (void *)(v230 + *(int *)(v340 + 24));
          *uint64_t v233 = v363;
          v233[1] = v215;
          swift_beginAccess();
          sub_2248B9E38(v230, typec, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          char v234 = swift_isUniquelyReferenced_nonNull_native();
          v372[0] = *v232;
          uint64_t *v232 = 0x8000000000000000;
          sub_2248B0674(typec, v227, v234);
          uint64_t *v232 = v372[0];
          swift_bridgeObjectRelease();
          sub_2248B9618(v227, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
          sub_2248B9618(v228, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        }
        else
        {
          uint64_t v235 = *(void *)(v117 + 976);
          uint64_t v236 = *(void *)(v117 + 968);
          uint64_t v237 = *(void *)(v117 + 856);
          uint64_t v238 = *(void *)(v117 + 848);
          uint64_t v239 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
          swift_endAccess();
          sub_2248B95B0(v235, v236, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_2248C43A8();
          sub_2248C43A8();
          uint64_t v240 = (void *)(v237 + *(int *)(v340 + 24));
          *uint64_t v240 = v363;
          v240[1] = v215;
          swift_beginAccess();
          sub_2248B9E38(v237, v238, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          char v241 = swift_isUniquelyReferenced_nonNull_native();
          v372[0] = *v239;
          *uint64_t v239 = 0x8000000000000000;
          sub_2248B0674(v238, v236, v241);
          *uint64_t v239 = v372[0];
          swift_bridgeObjectRelease();
          sub_2248B9618(v236, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
        }
        sub_2248914E8(*(void *)(v117 + 1016), *(void *)(v117 + 688), *(void *)(v117 + 736));
        swift_beginAccess();
        if (*(void *)(*(void *)v336 + 16) && (sub_2248AD8B4(v370[127]), (v242 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_2248C46C8();
          swift_release();
        }
        else
        {
          swift_endAccess();
        }
        uint64_t v117 = (uint64_t)v370;
        uint64_t v207 = v370[127];
        uint64_t v208 = v370[125];
        uint64_t v209 = v370[124];
        uint64_t v210 = v370[122];
        uint64_t v211 = v370[92];
        uint64_t v212 = v370[89];

        (*v332)(v211, v212);
        sub_2248B9618(v210, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v208 + 8))(v207, v209);
        unint64_t v206 = v347 + 3;
        uint64_t v205 = v356 - 1;
      }
      while (v356 != 1);
      swift_bridgeObjectRelease();
    }
    uint64_t v243 = *v306;
    if ((unint64_t)*v306 >> 62) {
      goto LABEL_134;
    }
    uint64_t v244 = *(void *)((v243 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v244; uint64_t v244 = sub_2248C4BC8())
    {
      uint64_t v245 = 0;
      uint64_t v323 = *(void *)(v117 + 1000);
      *(void *)typea = *(void *)(v117 + 952);
      uint64_t v364 = *(void *)(v117 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      unint64_t v357 = v243 & 0xC000000000000001;
      uint64_t v348 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 + 840) + 56);
      uint64_t v333 = (void (**)(void, void))(*(void *)(v117 + 720) + 8);
      uint64_t v337 = v244;
      uint64_t v341 = v243;
      while (1)
      {
        id v251 = v357 ? (id)MEMORY[0x22A619600](v245, v243) : *(id *)(v243 + 8 * v245 + 32);
        id v252 = v251;
        uint64_t v253 = v245 + 1;
        if (__OFADD__(v245, 1)) {
          break;
        }
        sub_2248A67BC(*(void *)(v117 + 1008));
        uint64_t v254 = *(void *)(v117 + 1048);
        unint64_t v369 = v252;
        uint64_t v255 = *(void *)(v117 + 1040);
        uint64_t v256 = *(void *)(v117 + 960);
        uint64_t v257 = *(void *)(v117 + 944);
        (*(void (**)(uint64_t, void, void))(*(void *)(v117 + 1000) + 16))(v256, *(void *)(v117 + 1008), *(void *)(v117 + 992));
        uint64_t v258 = (void *)(v256 + *(int *)(v257 + 20));
        *uint64_t v258 = v255;
        v258[1] = v254;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v259 = sub_2248AD75C(v256);
        LOBYTE(v254) = v260;
        swift_bridgeObjectRelease();
        if (v254)
        {
          uint64_t v261 = *(void *)(v117 + 1112);
          uint64_t v262 = *(void *)(v117 + 696);
          char v263 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v264 = *(void *)(v262 + v261);
          v372[0] = v264;
          *(void *)(v262 + v261) = 0x8000000000000000;
          if ((v263 & 1) == 0)
          {
            sub_2248B15F4();
            uint64_t v264 = v372[0];
          }
          uint64_t v265 = *(void *)(v117 + 1112);
          uint64_t v266 = *(void *)(v117 + 840);
          uint64_t v267 = *(void *)(v117 + 704);
          uint64_t v268 = v370[87];
          sub_2248B9618(*(void *)(v264 + 48) + *(void *)(*(void *)typea + 72) * v259, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_2248B9E38(*(void *)(v264 + 56) + *(void *)(v266 + 72) * v259, v267, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_2248AFE60(v259, v264);
          *(void *)(v268 + v265) = v264;
          uint64_t v117 = (uint64_t)v370;
          swift_bridgeObjectRelease();
          uint64_t v269 = 0;
        }
        else
        {
          uint64_t v269 = 1;
        }
        uint64_t v270 = *(void *)(v117 + 1008);
        uint64_t v271 = *(void *)(v117 + 832);
        uint64_t v272 = *(void *)(v117 + 728);
        uint64_t v273 = *(void *)(v117 + 704);
        uint64_t v274 = *(void *)(v117 + 688);
        (*v348)(v273, v269, 1, v271);
        sub_2248BA318(v273, qword_26AC07620);
        swift_endAccess();
        sub_2248914E8(v270, v274, v272);
        swift_beginAccess();
        uint64_t v117 = (uint64_t)v370;
        uint64_t v243 = v341;
        if (*(void *)(*(void *)v364 + 16) && (sub_2248AD8B4(v370[126]), (v275 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_2248C46C8();
          uint64_t v276 = *(void *)(sub_2248C4408() + 16);
          swift_bridgeObjectRelease();
          uint64_t v246 = v337;
          if (v276)
          {
            swift_release();
          }
          else
          {
            uint64_t v277 = v370[126];
            *uint64_t v305 = 1;
            sub_2248C46B8();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            unint64_t v278 = sub_2248AD8B4(v277);
            char v280 = v279;
            swift_bridgeObjectRelease();
            if (v280)
            {
              char v281 = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v282 = *(void *)v364;
              v372[0] = *(void *)v364;
              *(void *)uint64_t v364 = 0x8000000000000000;
              if ((v281 & 1) == 0)
              {
                sub_2248B1358((uint64_t *)&unk_26AC07748);
                uint64_t v282 = v372[0];
              }
              (*(void (**)(unint64_t, void))(v370[125] + 8))(*(void *)(v282 + 48) + *(void *)(v323 + 72) * v278, v370[124]);
              sub_2248AFB70(v278, v282);
              *(void *)uint64_t v364 = v282;
              swift_bridgeObjectRelease();
            }
            swift_endAccess();
            swift_release();

            swift_release();
            uint64_t v117 = (uint64_t)v370;
          }
        }
        else
        {
          swift_endAccess();

          uint64_t v246 = v337;
        }
        uint64_t v247 = *(void *)(v117 + 1008);
        uint64_t v248 = *(void *)(v117 + 1000);
        uint64_t v249 = *(void *)(v117 + 992);
        uint64_t v250 = *(void *)(v117 + 960);
        (*v333)(*(void *)(v117 + 728), *(void *)(v117 + 712));
        sub_2248B9618(v250, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v248 + 8))(v247, v249);
        ++v245;
        if (v253 == v246) {
          goto LABEL_135;
        }
      }
      __break(1u);
LABEL_134:
      swift_bridgeObjectRetain();
    }
LABEL_135:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v296 = *(void *)(v117 + 488);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v297 = sub_2248C4698();
    os_log_type_t v298 = sub_2248C49C8();
    if (os_log_type_enabled(v297, v298))
    {
      uint64_t v299 = swift_slowAlloc();
      *(_DWORD *)uint64_t v299 = 134218240;
      if (v296 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v300 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v300 = *(void *)((v296 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v117 + 456) = v300;
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v299 + 12) = 2048;
      uint64_t v301 = v349[2];
      swift_bridgeObjectRelease();
      *(void *)(v117 + 464) = v301;
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v297, v298, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v299, 0x16u);
      MEMORY[0x22A61A430](v299, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v302 = *(void **)(v117 + 1096);
    sub_2248A0898(*(void *)(v117 + 688));

    goto LABEL_141;
  }
LABEL_32:
  unint64_t v127 = 0;
  unint64_t v331 = v121 & 0xC000000000000001;
  unint64_t v315 = v121 + 32;
  uint64_t v318 = v121 & 0xFFFFFFFFFFFFFF8;
  uint64_t v366 = v125 + 56;
  *(void *)os_log_type_t type = v121;
  uint64_t v321 = v126;
  while (1)
  {
    if (v331)
    {
      id v128 = (id)MEMORY[0x22A619600](v127, v121);
    }
    else
    {
      if (v127 >= *(void *)(v318 + 16)) {
        goto LABEL_92;
      }
      id v128 = *(id *)(v315 + 8 * v127);
    }
    id v129 = v128;
    BOOL v130 = __OFADD__(v127, 1);
    unint64_t v131 = v127 + 1;
    if (v130) {
      goto LABEL_91;
    }
    unint64_t v339 = v131;
    uint64_t v132 = *(void **)(v117 + 664);
    id v133 = objc_msgSend(v128, sel_idsIdentifier);
    uint64_t v134 = v129;
    uint64_t v135 = sub_2248C4808();
    uint64_t v137 = v136;

    id v138 = objc_msgSend(v132, sel_idsDeviceIdentifier);
    if (!v138)
    {

      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    uint64_t v139 = v138;
    unint64_t v335 = v134;
    uint64_t v140 = sub_2248C4808();
    uint64_t v142 = v141;

    if (v135 == v140 && v137 == v142) {
      break;
    }
    char v143 = sub_2248C4C28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v143) {
      goto LABEL_46;
    }

LABEL_34:
    uint64_t v117 = (uint64_t)v370;
LABEL_35:
    unint64_t v127 = v339;
    if (v339 == v126) {
      goto LABEL_94;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  id v144 = objc_msgSend(v134, sel_pendingStatuses);
  unint64_t v145 = sub_2248C48A8();

  swift_bridgeObjectRetain();
  sub_2248B7788(v145, v125);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v371 = v370[61];
  swift_bridgeObjectRetain();
  id v146 = objc_msgSend(v134, sel_deliveredStatuses);
  unint64_t v147 = sub_2248C48A8();

  if (v147 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v117 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    if (!v117) {
      goto LABEL_73;
    }
LABEL_48:
    unint64_t v148 = v147;
    unint64_t v149 = 0;
    unint64_t v121 = v148 & 0xC000000000000001;
    uint64_t v353 = v148 & 0xFFFFFFFFFFFFFF8;
    unint64_t v361 = v148;
    unint64_t v346 = v148 + 32;
    while (1)
    {
      while (1)
      {
        if (v121)
        {
          id v150 = (id)MEMORY[0x22A619600](v149, v361);
        }
        else
        {
          if (v149 >= *(void *)(v353 + 16)) {
            goto LABEL_90;
          }
          id v150 = *(id *)(v346 + 8 * v149);
        }
        uint64_t v151 = v150;
        BOOL v130 = __OFADD__(v149++, 1);
        if (v130)
        {
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          swift_bridgeObjectRetain();
          uint64_t v126 = sub_2248C4BC8();
          swift_bridgeObjectRelease();
          if (!v126) {
            goto LABEL_94;
          }
          goto LABEL_32;
        }
        id v152 = objc_msgSend(v150, sel_identifier);
        uint64_t v153 = sub_2248C4808();
        uint64_t v155 = v154;

        if (*(void *)(v125 + 16))
        {
          sub_2248C4CD8();
          sub_2248C4838();
          uint64_t v156 = sub_2248C4D08();
          uint64_t v157 = -1 << *(unsigned char *)(v125 + 32);
          unint64_t v158 = v156 & ~v157;
          if ((*(void *)(v366 + ((v158 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v158)) {
            break;
          }
        }
LABEL_70:
        uint64_t v165 = swift_bridgeObjectRelease();
        MEMORY[0x22A619380](v165);
        if (*(void *)((v371 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v371 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2248C48D8();
        }
        sub_2248C48E8();
        sub_2248C48C8();
        if (v149 == v117) {
          goto LABEL_73;
        }
      }
      uint64_t v159 = *(void *)(v125 + 48);
      uint64_t v160 = (void *)(v159 + 16 * v158);
      BOOL v161 = *v160 == v153 && v160[1] == v155;
      if (!v161 && (sub_2248C4C28() & 1) == 0)
      {
        uint64_t v162 = ~v157;
        do
        {
          unint64_t v158 = (v158 + 1) & v162;
          if (((*(void *)(v366 + ((v158 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v158) & 1) == 0) {
            goto LABEL_70;
          }
          uint64_t v163 = (void *)(v159 + 16 * v158);
          BOOL v164 = *v163 == v153 && v163[1] == v155;
        }
        while (!v164 && (sub_2248C4C28() & 1) == 0);
      }

      swift_bridgeObjectRelease();
      if (v149 == v117) {
        goto LABEL_73;
      }
    }
  }
  uint64_t v117 = *(void *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v117) {
    goto LABEL_48;
  }
LABEL_73:
  unint64_t v354 = (void *)v370[132];
  uint64_t v362 = v370[86];
  swift_bridgeObjectRelease();
  id v166 = objc_msgSend(v335, sel_idsIdentifier);
  sub_2248C4808();

  id v167 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
  id v168 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  id v169 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  id v170 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  id v171 = objc_msgSend(v167, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v168, v169, v170);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
  uint64_t v172 = swift_allocObject();
  *(_OWORD *)(v172 + 16) = xmmword_2248CBEB0;
  *(void *)(v172 + 32) = v171;
  v372[0] = v172;
  sub_2248C48C8();
  id v173 = v171;
  os_log_type_t v174 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  v370[62] = 0;
  uint64_t v117 = (uint64_t)v370;
  unsigned int v175 = objc_msgSend(v354, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v174, v362, v313);

  uint64_t v176 = (void *)v370[62];
  if (v175)
  {
    id v177 = v176;

    unint64_t v121 = *(void *)type;
    uint64_t v126 = v321;
    goto LABEL_35;
  }
  id v201 = (void *)v370[137];
  id v204 = v176;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v203 = (void *)sub_2248C4318();

  swift_willThrow();
LABEL_88:

  id v283 = *(id *)(v117 + 664);
  id v284 = v203;
  id v285 = v283;
  id v286 = v203;
  uint64_t v287 = sub_2248C4698();
  os_log_type_t v288 = sub_2248C49B8();
  BOOL v289 = os_log_type_enabled(v287, v288);
  uint64_t v290 = *(void **)(v117 + 664);
  if (v289)
  {
    uint64_t v291 = swift_slowAlloc();
    uint64_t v292 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v291 = 138412546;
    v370[67] = v290;
    id v293 = v290;
    sub_2248C4A28();
    *uint64_t v292 = v290;

    *(_WORD *)(v291 + 12) = 2112;
    id v294 = v203;
    uint64_t v295 = _swift_stdlib_bridgeErrorToNSError();
    v370[63] = v295;
    sub_2248C4A28();
    v292[1] = v295;

    _os_log_impl(&dword_22480C000, v287, v288, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v291, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v292, -1, -1);
    MEMORY[0x22A61A430](v291, -1, -1);
  }
  else
  {
  }
  BOOL v329 = 0;
LABEL_141:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v303 = (uint64_t (*)(BOOL))v370[1];
  return v303(v329);
}

uint64_t sub_22489DEE4()
{
  uint64_t v370 = v0;
  uint64_t v1 = (void *)v0;
  uint64_t aBlock = (void *)(v0 + 80);
  char v311 = (_OWORD *)(v0 + 168);
  v369[9] = *MEMORY[0x263EF8340];
  uint64_t v304 = v0 + 432;
  uint64_t v306 = v0 + 440;
  uint64_t v310 = v0 + 496;
  uint64_t v303 = (uint64_t *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 1024);
  uint64_t v307 = (NSObject **)(v0 + 528);
  unint64_t v308 = (uint64_t *)(v0 + 520);
  uint64_t v309 = (uint64_t *)(v0 + 512);
  uint64_t v3 = *(void *)(v0 + 1000);
  uint64_t v4 = v1[124];
  uint64_t v5 = v1[123];
  uint64_t v6 = v1[117];
  uint64_t v302 = v1 + 147;
  swift_willThrow();
  sub_2248BA318(v6, &qword_268093940);
  sub_2248B9618(v5, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v7 = (void *)v1[143];
  uint64_t v367 = v1;
  os_log_type_t v8 = (void *)v1[142];
  id v9 = (id)v1[83];
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  id v13 = v10;
  id v14 = v7;
  unint64_t v15 = sub_2248C4698();
  os_log_type_t v16 = sub_2248C49A8();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v18 = (void *)v1[142];
  uint64_t v19 = v1[83];
  if (v17)
  {
    uint64_t v20 = swift_slowAlloc();
    unint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v355 = swift_slowAlloc();
    v369[0] = v355;
    *(_DWORD *)uint64_t v20 = 136315650;
    id v22 = objc_msgSend(v18, sel_identifier);
    uint64_t v23 = sub_2248C4808();
    uint64_t v347 = v15;
    unint64_t v25 = v24;

    *uint64_t v309 = sub_2248AD104(v23, v25, v369);
    sub_2248C4A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    id v26 = v7;
    uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v308 = v27;
    sub_2248C4A28();
    *unint64_t v21 = v27;

    *(_WORD *)(v20 + 22) = 2112;
    *uint64_t v307 = v19;
    id v28 = v19;
    sub_2248C4A28();
    v21[1] = v19;

    uint64_t v19 = v347;
    _os_log_impl(&dword_22480C000, v347, v16, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    uint64_t v29 = v21;
    uint64_t v1 = v367;
    MEMORY[0x22A61A430](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v355, -1, -1);
    MEMORY[0x22A61A430](v20, -1, -1);
  }
  else
  {
  }
  unint64_t v30 = (void *)sub_2248C4308();
  id v31 = objc_msgSend(v30, sel_userInfo);
  uint64_t v32 = sub_2248C4798();

  if (*(void *)(v32 + 16) && (unint64_t v33 = sub_2248AD83C(0x4D726F7272457563, 0xEA00000000006773), (v34 & 1) != 0))
  {
    sub_2248B9678(*(void *)(v32 + 56) + 32 * v33, (uint64_t)v311);
  }
  else
  {
    *char v311 = 0u;
    v311[1] = 0u;
  }
  swift_bridgeObjectRelease();
  if (!v1[24])
  {
    sub_2248BA318((uint64_t)v311, &qword_268093B58);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    swift_getErrorValue();
    uint64_t v35 = sub_2248C4C88();
    uint64_t v36 = v37;
    goto LABEL_13;
  }
  uint64_t v35 = v1[52];
  uint64_t v36 = v1[53];
LABEL_13:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  id v39 = (void *)v1[141];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    id v39 = sub_2248ACFDC(0, v39[2] + 1, 1, v39);
  }
  unint64_t v41 = v39[2];
  unint64_t v40 = v39[3];
  if (v41 >= v40 >> 1) {
    id v39 = sub_2248ACFDC((void *)(v40 > 1), v41 + 1, 1, v39);
  }
  uint64_t v42 = v1[142];
  v39[2] = v41 + 1;
  unint64_t v346 = v39;
  BOOL v43 = &v39[3 * v41];
  v43[4] = v42;
  v43[5] = v35;
  v43[6] = v36;

  uint64_t v44 = v1[140] + 1;
  if (v44 != v1[135])
  {
    while (1)
    {
      v1[141] = v346;
      v1[140] = v44;
      uint64_t v66 = v1[128];
      unint64_t v67 = *(void **)(v1[134] + 8 * v44 + 32);
      v1[142] = v67;
      id v68 = v67;
      sub_2248A67BC(v66);
      uint64_t v69 = v1[131];
      uint64_t v70 = v1[130];
      uint64_t v71 = v1[123];
      uint64_t v72 = v1[118];
      unint64_t v73 = (uint64_t *)(v1[87] + v1[139]);
      (*(void (**)(uint64_t, void, void))(v1[125] + 16))(v71, v1[128], v1[124]);
      id v74 = (void *)(v71 + *(int *)(v72 + 20));
      *id v74 = v70;
      v74[1] = v69;
      swift_beginAccess();
      uint64_t v75 = *v73;
      uint64_t v76 = *(void *)(*v73 + 16);
      swift_bridgeObjectRetain();
      if (v76 && (unint64_t v77 = sub_2248AD75C(v1[123]), (v78 & 1) != 0))
      {
        uint64_t v79 = v1[117];
        uint64_t v80 = v1[116];
        uint64_t v81 = v1[111];
        uint64_t v82 = v367[110];
        uint64_t v83 = v367[100];
        uint64_t v84 = v367[99];
        sub_2248B95B0(*(void *)(v75 + 56) + *(void *)(v367[105] + 72) * v77, v82, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_2248B9E38(v82, v81, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_2248C4348();
        uint64_t v1 = v367;
        sub_2248C4358();
        sub_2248B9618(v81, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v83 + 56))(v80, 0, 1, v84);
        sub_2248BA210(v80, v79, &qword_268093940);
      }
      else
      {
        uint64_t v85 = v1[117];
        uint64_t v86 = v1[100];
        uint64_t v87 = v1[99];
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56))(v85, 1, 1, v87);
      }
      uint64_t v88 = v1[115];
      uint64_t v89 = v1[100];
      uint64_t v90 = v1[99];
      sub_2248BAB80(v1[117], v88, &qword_268093940);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v88, 1, v90) == 1)
      {
        sub_2248BA318(v1[115], &qword_268093940);
        goto LABEL_80;
      }
      uint64_t v91 = v1[102];
      uint64_t v92 = v1[100];
      uint64_t v93 = v1[99];
      (*(void (**)(void, void, uint64_t))(v92 + 32))(v1[103], v1[115], v93);
      sub_2248C43A8();
      char v94 = sub_2248C4378();
      uint64_t v95 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      v95(v91, v93);
      if ((v94 & 1) == 0) {
        break;
      }
      (*(void (**)(void, void, void))(v1[100] + 16))(v1[101], v1[103], v1[99]);
      swift_bridgeObjectRetain_n();
      id v96 = v68;
      uint64_t v97 = sub_2248C4698();
      os_log_type_t v98 = sub_2248C49C8();
      uint64_t v356 = v97;
      BOOL v99 = os_log_type_enabled(v97, v98);
      unint64_t v348 = v1[131];
      if (v99)
      {
        uint64_t v314 = v1[130];
        uint64_t v339 = v1[124];
        uint64_t v341 = v1[128];
        uint64_t v331 = v1[123];
        uint64_t v335 = v1[125];
        uint64_t v325 = v1[103];
        uint64_t v327 = v1[117];
        uint64_t v45 = v1[101];
        os_log_type_t typeb = v98;
        uint64_t v46 = v1[99];
        uint64_t v47 = swift_slowAlloc();
        uint64_t v319 = swift_slowAlloc();
        v369[0] = v319;
        *(_DWORD *)uint64_t v47 = 136315650;
        sub_2248AD9A0(&qword_268093B80, MEMORY[0x263F07490]);
        uint64_t v317 = v46;
        uint64_t v48 = sub_2248C4C18();
        unint64_t v49 = v1;
        v1[75] = sub_2248AD104(v48, v50, v369);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        v95(v45, v46);
        *(_WORD *)(v47 + 12) = 2080;
        id v51 = objc_msgSend(v96, sel_identifier);
        uint64_t v52 = sub_2248C4808();
        unint64_t v54 = v53;

        v49[76] = sub_2248AD104(v52, v54, v369);
        sub_2248C4A28();

        swift_bridgeObjectRelease();
        *(_WORD *)(v47 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_2248B5808(8, v314, v348, v55);
        uint64_t v58 = v57;
        uint64_t v60 = v59;
        uint64_t v62 = v61;
        swift_bridgeObjectRelease();
        uint64_t v63 = MEMORY[0x22A619320](v56, v58, v60, v62);
        unint64_t v65 = v64;
        swift_bridgeObjectRelease();
        v49[77] = sub_2248AD104(v63, v65, v369);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22480C000, v356, typeb, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v47, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v319, -1, -1);
        MEMORY[0x22A61A430](v47, -1, -1);

        v95(v325, v317);
        sub_2248BA318(v327, &qword_268093940);
        sub_2248B9618(v331, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v335 + 8))(v341, v339);
      }
      else
      {
        uint64_t v100 = v1[125];
        uint64_t v340 = v1[124];
        uint64_t v342 = v1[128];
        uint64_t v101 = v1[123];
        unint64_t v49 = v1;
        uint64_t v102 = v1[117];
        uint64_t v103 = v49[103];
        uint64_t v104 = v49[101];
        uint64_t v105 = v49[99];

        swift_bridgeObjectRelease_n();
        v95(v104, v105);

        v95(v103, v105);
        sub_2248BA318(v102, &qword_268093940);
        sub_2248B9618(v101, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v342, v340);
      }
      uint64_t v44 = v49[140] + 1;
      uint64_t v1 = v49;
      if (v44 == v49[135]) {
        goto LABEL_29;
      }
    }
    v95(v1[103], v1[99]);
LABEL_80:
    uint64_t v178 = (void *)v1[83];
    sub_2248BAB80(v1[117], v1[114], &qword_268093940);
    id v179 = v178;
    id v180 = v68;
    id v181 = v179;
    id v182 = v180;
    unint64_t v183 = sub_2248C4698();
    os_log_type_t v184 = sub_2248C49C8();
    BOOL v185 = os_log_type_enabled(v183, v184);
    uint64_t v186 = v1[114];
    if (v185)
    {
      uint64_t v352 = v1[113];
      unint64_t v187 = (void *)v1[83];
      uint64_t v188 = swift_slowAlloc();
      id v189 = (void *)swift_slowAlloc();
      uint64_t v364 = swift_slowAlloc();
      v369[0] = v364;
      *(_DWORD *)uint64_t v188 = 138412802;
      v367[72] = v182;
      id v190 = v182;
      sub_2248C4A28();
      *id v189 = v182;

      *(_WORD *)(v188 + 12) = 2112;
      v367[73] = v187;
      id v191 = v187;
      sub_2248C4A28();
      v189[1] = v187;

      *(_WORD *)(v188 + 22) = 2080;
      sub_2248BAB80(v186, v352, &qword_268093940);
      uint64_t v192 = sub_2248C4818();
      v367[74] = sub_2248AD104(v192, v193, v369);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      sub_2248BA318(v186, &qword_268093940);
      _os_log_impl(&dword_22480C000, v183, v184, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v188, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      uint64_t v194 = v189;
      uint64_t v1 = v367;
      MEMORY[0x22A61A430](v194, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v364, -1, -1);
      MEMORY[0x22A61A430](v188, -1, -1);
    }
    else
    {
      uint64_t v195 = (void *)v1[83];

      sub_2248BA318(v186, &qword_268093940);
    }

    uint64_t v196 = (void *)v1[137];
    v1[2] = v1;
    v1[3] = sub_2248985E8;
    uint64_t v197 = swift_continuation_init();
    v1[16] = MEMORY[0x263EF8330];
    v1[17] = 0x40000000;
    v1[18] = sub_2248A07BC;
    v1[19] = &block_descriptor_64;
    v1[20] = v197;
    objc_msgSend(v196, sel_activateWithCompletion_, v1 + 16);
    return MEMORY[0x270FA23F0](v1 + 2);
  }
LABEL_29:
  uint64_t v106 = (void *)v1[137];
  unint64_t v107 = (void *)v1[132];
  uint64_t v108 = v1[98];
  uint64_t v109 = v1[97];
  uint64_t v349 = v1[96];
  uint64_t v110 = v367[95];
  uint64_t v111 = v367[94];
  uint64_t v112 = v367[93];
  uint64_t v357 = v367[86];
  uint64_t v362 = v107;
  swift_bridgeObjectRelease();
  uint64_t v113 = swift_allocObject();
  *(void *)(v113 + 16) = v106;
  v367[14] = sub_2248B95A0;
  v367[15] = v113;
  v367[10] = MEMORY[0x263EF8330];
  v367[11] = 1107296256;
  v367[12] = sub_224885AAC;
  v367[13] = &block_descriptor_63;
  uint64_t v114 = _Block_copy(aBlock);
  id v115 = v106;
  sub_2248C4768();
  v367[56] = MEMORY[0x263F8EE78];
  sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
  sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
  sub_2248C4A68();
  MEMORY[0x22A6194F0](0, v108, v110, v114);
  _Block_release(v114);
  uint64_t v116 = v110;
  uint64_t v117 = (uint64_t)v367;
  (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v116, v112);
  (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v349);
  swift_release();
  v367[55] = 0;
  id v118 = objc_msgSend(v362, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v357, v306);
  uint64_t v119 = (void *)v367[55];
  if (!v118)
  {
    uint64_t v198 = (void *)v367[137];
    id v199 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v200 = (void *)sub_2248C4318();

    swift_willThrow();
    goto LABEL_88;
  }
  uint64_t v120 = v118;
  unint64_t v121 = sub_2248C48A8();
  id v122 = v119;

  unint64_t v123 = swift_bridgeObjectRetain();
  uint64_t v124 = sub_2248925D8(v123, v304, (SEL *)&selRef_identifier);
  swift_bridgeObjectRelease();
  uint64_t v125 = sub_2248B55D8(v124);
  swift_bridgeObjectRelease();
  if (v121 >> 62) {
    goto LABEL_93;
  }
  uint64_t v126 = *(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v126)
  {
LABEL_94:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v202 = v346[2];
    BOOL v326 = v202 == 0;
    if (v202)
    {
      uint64_t v333 = *(void *)(v117 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      uint64_t v337 = *(void *)(v117 + 832);
      BOOL v329 = (void (**)(uint64_t, uint64_t))(*(void *)(v117 + 720) + 8);
      uint64_t v203 = (void *)(swift_bridgeObjectRetain() + 48);
      do
      {
        uint64_t v210 = *(void *)(v117 + 1016);
        uint64_t v211 = *(v203 - 1);
        uint64_t v212 = *v203;
        id v213 = (id)*(v203 - 2);
        swift_bridgeObjectRetain();
        sub_2248A67BC(v210);
        uint64_t v214 = *(void *)(v117 + 1048);
        uint64_t v360 = v211;
        id v365 = v213;
        uint64_t v344 = v203;
        uint64_t v353 = v202;
        uint64_t v215 = *(void *)(v117 + 1040);
        uint64_t v216 = *(void *)(v117 + 976);
        uint64_t v217 = *(void *)(v117 + 944);
        uint64_t v218 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
        (*(void (**)(uint64_t, void, void))(*(void *)(v117 + 1000) + 16))(v216, *(void *)(v117 + 1016), *(void *)(v117 + 992));
        uint64_t v219 = (void *)(v216 + *(int *)(v217 + 20));
        *uint64_t v219 = v215;
        v219[1] = v214;
        swift_beginAccess();
        uint64_t v220 = *v218;
        uint64_t v221 = *(void *)(*v218 + 16);
        swift_bridgeObjectRetain();
        if (v221 && (unint64_t v222 = sub_2248AD75C(*(void *)(v117 + 976)), (v223 & 1) != 0))
        {
          uint64_t v224 = *(void *)(v117 + 968);
          uint64_t v225 = *(void *)(v117 + 872);
          uint64_t v226 = *(void *)(v117 + 864);
          uint64_t v227 = *(void *)(v117 + 856);
          uint64_t typec = *(void *)(v117 + 848);
          uint64_t v228 = *(void *)(v117 + 800);
          uint64_t v313 = *(void *)(v117 + 976);
          uint64_t v316 = *(void *)(v117 + 792);
          uint64_t v229 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
          sub_2248B95B0(*(void *)(v220 + 56) + *(void *)(*(void *)(v117 + 840) + 72) * v222, v226, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_2248B9E38(v226, v225, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          swift_endAccess();
          sub_2248B95B0(v313, v224, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v228 + 16))(v227, v225, v316);
          sub_2248C43A8();
          uint64_t v230 = (void *)(v227 + *(int *)(v337 + 24));
          *uint64_t v230 = v360;
          v230[1] = v212;
          swift_beginAccess();
          sub_2248B9E38(v227, typec, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          char v231 = swift_isUniquelyReferenced_nonNull_native();
          v369[0] = *v229;
          *uint64_t v229 = 0x8000000000000000;
          sub_2248B0674(typec, v224, v231);
          *uint64_t v229 = v369[0];
          swift_bridgeObjectRelease();
          sub_2248B9618(v224, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
          sub_2248B9618(v225, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        }
        else
        {
          uint64_t v232 = *(void *)(v117 + 976);
          uint64_t v233 = *(void *)(v117 + 968);
          uint64_t v234 = *(void *)(v117 + 856);
          uint64_t v235 = *(void *)(v117 + 848);
          uint64_t v236 = (uint64_t *)(*(void *)(v117 + 696) + *(void *)(v117 + 1112));
          swift_endAccess();
          sub_2248B95B0(v232, v233, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_2248C43A8();
          sub_2248C43A8();
          uint64_t v237 = (void *)(v234 + *(int *)(v337 + 24));
          void *v237 = v360;
          v237[1] = v212;
          swift_beginAccess();
          sub_2248B9E38(v234, v235, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          char v238 = swift_isUniquelyReferenced_nonNull_native();
          v369[0] = *v236;
          *uint64_t v236 = 0x8000000000000000;
          sub_2248B0674(v235, v233, v238);
          *uint64_t v236 = v369[0];
          swift_bridgeObjectRelease();
          sub_2248B9618(v233, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
        }
        sub_2248914E8(*(void *)(v117 + 1016), *(void *)(v117 + 688), *(void *)(v117 + 736));
        swift_beginAccess();
        if (*(void *)(*(void *)v333 + 16) && (sub_2248AD8B4(v367[127]), (v239 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_2248C46C8();
          swift_release();
        }
        else
        {
          swift_endAccess();
        }
        uint64_t v117 = (uint64_t)v367;
        uint64_t v204 = v367[127];
        uint64_t v205 = v367[125];
        uint64_t v206 = v367[124];
        uint64_t v207 = v367[122];
        uint64_t v208 = v367[92];
        uint64_t v209 = v367[89];

        (*v329)(v208, v209);
        sub_2248B9618(v207, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v205 + 8))(v204, v206);
        uint64_t v203 = v344 + 3;
        uint64_t v202 = v353 - 1;
      }
      while (v353 != 1);
      swift_bridgeObjectRelease();
    }
    uint64_t v240 = *v303;
    if ((unint64_t)*v303 >> 62) {
      goto LABEL_134;
    }
    uint64_t v241 = *(void *)((v240 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v241; uint64_t v241 = sub_2248C4BC8())
    {
      uint64_t v242 = 0;
      uint64_t v320 = *(void *)(v117 + 1000);
      *(void *)typea = *(void *)(v117 + 952);
      uint64_t v361 = *(void *)(v117 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      unint64_t v354 = v240 & 0xC000000000000001;
      uint64_t v345 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 + 840) + 56);
      uint64_t v330 = (void (**)(void, void))(*(void *)(v117 + 720) + 8);
      uint64_t v334 = v241;
      uint64_t v338 = v240;
      while (1)
      {
        id v248 = v354 ? (id)MEMORY[0x22A619600](v242, v240) : *(id *)(v240 + 8 * v242 + 32);
        id v249 = v248;
        uint64_t v250 = v242 + 1;
        if (__OFADD__(v242, 1)) {
          break;
        }
        sub_2248A67BC(*(void *)(v117 + 1008));
        uint64_t v251 = *(void *)(v117 + 1048);
        uint64_t v366 = v249;
        uint64_t v252 = *(void *)(v117 + 1040);
        uint64_t v253 = *(void *)(v117 + 960);
        uint64_t v254 = *(void *)(v117 + 944);
        (*(void (**)(uint64_t, void, void))(*(void *)(v117 + 1000) + 16))(v253, *(void *)(v117 + 1008), *(void *)(v117 + 992));
        uint64_t v255 = (void *)(v253 + *(int *)(v254 + 20));
        void *v255 = v252;
        v255[1] = v251;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v256 = sub_2248AD75C(v253);
        LOBYTE(v251) = v257;
        swift_bridgeObjectRelease();
        if (v251)
        {
          uint64_t v258 = *(void *)(v117 + 1112);
          uint64_t v259 = *(void *)(v117 + 696);
          char v260 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v261 = *(void *)(v259 + v258);
          v369[0] = v261;
          *(void *)(v259 + v258) = 0x8000000000000000;
          if ((v260 & 1) == 0)
          {
            sub_2248B15F4();
            uint64_t v261 = v369[0];
          }
          uint64_t v262 = *(void *)(v117 + 1112);
          uint64_t v263 = *(void *)(v117 + 840);
          uint64_t v264 = *(void *)(v117 + 704);
          uint64_t v265 = v367[87];
          sub_2248B9618(*(void *)(v261 + 48) + *(void *)(*(void *)typea + 72) * v256, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_2248B9E38(*(void *)(v261 + 56) + *(void *)(v263 + 72) * v256, v264, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_2248AFE60(v256, v261);
          *(void *)(v265 + v262) = v261;
          uint64_t v117 = (uint64_t)v367;
          swift_bridgeObjectRelease();
          uint64_t v266 = 0;
        }
        else
        {
          uint64_t v266 = 1;
        }
        uint64_t v267 = *(void *)(v117 + 1008);
        uint64_t v268 = *(void *)(v117 + 832);
        uint64_t v269 = *(void *)(v117 + 728);
        uint64_t v270 = *(void *)(v117 + 704);
        uint64_t v271 = *(void *)(v117 + 688);
        (*v345)(v270, v266, 1, v268);
        sub_2248BA318(v270, qword_26AC07620);
        swift_endAccess();
        sub_2248914E8(v267, v271, v269);
        swift_beginAccess();
        uint64_t v117 = (uint64_t)v367;
        uint64_t v240 = v338;
        if (*(void *)(*(void *)v361 + 16) && (sub_2248AD8B4(v367[126]), (v272 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_2248C46C8();
          uint64_t v273 = *(void *)(sub_2248C4408() + 16);
          swift_bridgeObjectRelease();
          uint64_t v243 = v334;
          if (v273)
          {
            swift_release();
          }
          else
          {
            uint64_t v274 = v367[126];
            unsigned char *v302 = 1;
            sub_2248C46B8();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            unint64_t v275 = sub_2248AD8B4(v274);
            char v277 = v276;
            swift_bridgeObjectRelease();
            if (v277)
            {
              char v278 = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v279 = *(void *)v361;
              v369[0] = *(void *)v361;
              *(void *)uint64_t v361 = 0x8000000000000000;
              if ((v278 & 1) == 0)
              {
                sub_2248B1358((uint64_t *)&unk_26AC07748);
                uint64_t v279 = v369[0];
              }
              (*(void (**)(unint64_t, void))(v367[125] + 8))(*(void *)(v279 + 48) + *(void *)(v320 + 72) * v275, v367[124]);
              sub_2248AFB70(v275, v279);
              *(void *)uint64_t v361 = v279;
              swift_bridgeObjectRelease();
            }
            swift_endAccess();
            swift_release();

            swift_release();
            uint64_t v117 = (uint64_t)v367;
          }
        }
        else
        {
          swift_endAccess();

          uint64_t v243 = v334;
        }
        uint64_t v244 = *(void *)(v117 + 1008);
        uint64_t v245 = *(void *)(v117 + 1000);
        uint64_t v246 = *(void *)(v117 + 992);
        uint64_t v247 = *(void *)(v117 + 960);
        (*v330)(*(void *)(v117 + 728), *(void *)(v117 + 712));
        sub_2248B9618(v247, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v244, v246);
        ++v242;
        if (v250 == v243) {
          goto LABEL_135;
        }
      }
      __break(1u);
LABEL_134:
      swift_bridgeObjectRetain();
    }
LABEL_135:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v293 = *(void *)(v117 + 488);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v294 = sub_2248C4698();
    os_log_type_t v295 = sub_2248C49C8();
    if (os_log_type_enabled(v294, v295))
    {
      uint64_t v296 = swift_slowAlloc();
      *(_DWORD *)uint64_t v296 = 134218240;
      if (v293 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v297 = sub_2248C4BC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v297 = *(void *)((v293 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v117 + 456) = v297;
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v296 + 12) = 2048;
      uint64_t v298 = v346[2];
      swift_bridgeObjectRelease();
      *(void *)(v117 + 464) = v298;
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v294, v295, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v296, 0x16u);
      MEMORY[0x22A61A430](v296, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v299 = *(void **)(v117 + 1096);
    sub_2248A0898(*(void *)(v117 + 688));

    goto LABEL_141;
  }
LABEL_32:
  unint64_t v127 = 0;
  unint64_t v328 = v121 & 0xC000000000000001;
  unint64_t v312 = v121 + 32;
  uint64_t v315 = v121 & 0xFFFFFFFFFFFFFF8;
  uint64_t v363 = v125 + 56;
  *(void *)os_log_type_t type = v121;
  uint64_t v318 = v126;
  while (1)
  {
    if (v328)
    {
      id v128 = (id)MEMORY[0x22A619600](v127, v121);
    }
    else
    {
      if (v127 >= *(void *)(v315 + 16)) {
        goto LABEL_92;
      }
      id v128 = *(id *)(v312 + 8 * v127);
    }
    id v129 = v128;
    BOOL v130 = __OFADD__(v127, 1);
    unint64_t v131 = v127 + 1;
    if (v130) {
      goto LABEL_91;
    }
    unint64_t v336 = v131;
    uint64_t v132 = *(void **)(v117 + 664);
    id v133 = objc_msgSend(v128, sel_idsIdentifier);
    uint64_t v134 = v129;
    uint64_t v135 = sub_2248C4808();
    uint64_t v137 = v136;

    id v138 = objc_msgSend(v132, sel_idsDeviceIdentifier);
    if (!v138)
    {

      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    uint64_t v139 = v138;
    uint64_t v332 = v134;
    uint64_t v140 = sub_2248C4808();
    uint64_t v142 = v141;

    if (v135 == v140 && v137 == v142) {
      break;
    }
    char v143 = sub_2248C4C28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v143) {
      goto LABEL_46;
    }

LABEL_34:
    uint64_t v117 = (uint64_t)v367;
LABEL_35:
    unint64_t v127 = v336;
    if (v336 == v126) {
      goto LABEL_94;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  id v144 = objc_msgSend(v134, sel_pendingStatuses);
  unint64_t v145 = sub_2248C48A8();

  swift_bridgeObjectRetain();
  sub_2248B7788(v145, v125);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v368 = v367[61];
  swift_bridgeObjectRetain();
  id v146 = objc_msgSend(v134, sel_deliveredStatuses);
  unint64_t v147 = sub_2248C48A8();

  if (v147 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v117 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    if (!v117) {
      goto LABEL_73;
    }
LABEL_48:
    unint64_t v148 = v147;
    unint64_t v149 = 0;
    unint64_t v121 = v148 & 0xC000000000000001;
    uint64_t v350 = v148 & 0xFFFFFFFFFFFFFF8;
    unint64_t v358 = v148;
    unint64_t v343 = v148 + 32;
    while (1)
    {
      while (1)
      {
        if (v121)
        {
          id v150 = (id)MEMORY[0x22A619600](v149, v358);
        }
        else
        {
          if (v149 >= *(void *)(v350 + 16)) {
            goto LABEL_90;
          }
          id v150 = *(id *)(v343 + 8 * v149);
        }
        uint64_t v151 = v150;
        BOOL v130 = __OFADD__(v149++, 1);
        if (v130)
        {
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          swift_bridgeObjectRetain();
          uint64_t v126 = sub_2248C4BC8();
          swift_bridgeObjectRelease();
          if (!v126) {
            goto LABEL_94;
          }
          goto LABEL_32;
        }
        id v152 = objc_msgSend(v150, sel_identifier);
        uint64_t v153 = sub_2248C4808();
        uint64_t v155 = v154;

        if (*(void *)(v125 + 16))
        {
          sub_2248C4CD8();
          sub_2248C4838();
          uint64_t v156 = sub_2248C4D08();
          uint64_t v157 = -1 << *(unsigned char *)(v125 + 32);
          unint64_t v158 = v156 & ~v157;
          if ((*(void *)(v363 + ((v158 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v158)) {
            break;
          }
        }
LABEL_70:
        uint64_t v165 = swift_bridgeObjectRelease();
        MEMORY[0x22A619380](v165);
        if (*(void *)((v368 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v368 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2248C48D8();
        }
        sub_2248C48E8();
        sub_2248C48C8();
        if (v149 == v117) {
          goto LABEL_73;
        }
      }
      uint64_t v159 = *(void *)(v125 + 48);
      uint64_t v160 = (void *)(v159 + 16 * v158);
      BOOL v161 = *v160 == v153 && v160[1] == v155;
      if (!v161 && (sub_2248C4C28() & 1) == 0)
      {
        uint64_t v162 = ~v157;
        do
        {
          unint64_t v158 = (v158 + 1) & v162;
          if (((*(void *)(v363 + ((v158 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v158) & 1) == 0) {
            goto LABEL_70;
          }
          uint64_t v163 = (void *)(v159 + 16 * v158);
          BOOL v164 = *v163 == v153 && v163[1] == v155;
        }
        while (!v164 && (sub_2248C4C28() & 1) == 0);
      }

      swift_bridgeObjectRelease();
      if (v149 == v117) {
        goto LABEL_73;
      }
    }
  }
  uint64_t v117 = *(void *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v117) {
    goto LABEL_48;
  }
LABEL_73:
  unint64_t v351 = (void *)v367[132];
  uint64_t v359 = v367[86];
  swift_bridgeObjectRelease();
  id v166 = objc_msgSend(v332, sel_idsIdentifier);
  sub_2248C4808();

  id v167 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
  id v168 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  id v169 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  id v170 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  id v171 = objc_msgSend(v167, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v168, v169, v170);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07778);
  uint64_t v172 = swift_allocObject();
  *(_OWORD *)(v172 + 16) = xmmword_2248CBEB0;
  *(void *)(v172 + 32) = v171;
  v369[0] = v172;
  sub_2248C48C8();
  id v173 = v171;
  os_log_type_t v174 = (void *)sub_2248C4898();
  swift_bridgeObjectRelease();
  v367[62] = 0;
  uint64_t v117 = (uint64_t)v367;
  unsigned int v175 = objc_msgSend(v351, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v174, v359, v310);

  uint64_t v176 = (void *)v367[62];
  if (v175)
  {
    id v177 = v176;

    unint64_t v121 = *(void *)type;
    uint64_t v126 = v318;
    goto LABEL_35;
  }
  uint64_t v198 = (void *)v367[137];
  id v201 = v176;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v200 = (void *)sub_2248C4318();

  swift_willThrow();
LABEL_88:

  id v280 = *(id *)(v117 + 664);
  id v281 = v200;
  id v282 = v280;
  id v283 = v200;
  id v284 = sub_2248C4698();
  os_log_type_t v285 = sub_2248C49B8();
  BOOL v286 = os_log_type_enabled(v284, v285);
  uint64_t v287 = *(void **)(v117 + 664);
  if (v286)
  {
    uint64_t v288 = swift_slowAlloc();
    BOOL v289 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v288 = 138412546;
    v367[67] = v287;
    id v290 = v287;
    sub_2248C4A28();
    *BOOL v289 = v287;

    *(_WORD *)(v288 + 12) = 2112;
    id v291 = v200;
    uint64_t v292 = _swift_stdlib_bridgeErrorToNSError();
    v367[63] = v292;
    sub_2248C4A28();
    v289[1] = v292;

    _os_log_impl(&dword_22480C000, v284, v285, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v288, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v289, -1, -1);
    MEMORY[0x22A61A430](v288, -1, -1);
  }
  else
  {
  }
  BOOL v326 = 0;
LABEL_141:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v300 = (uint64_t (*)(BOOL))v367[1];
  return v300(v326);
}

uint64_t sub_2248A07A4@<X0>(uint64_t a1@<X8>)
{
  return sub_2248A67BC(a1);
}

uint64_t sub_2248A07BC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093BA8);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_2248A0854(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2248A0898(uint64_t a1)
{
  uint64_t v2 = v1;
  v43[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)*((void *)v1 + 22);
  v43[0] = 0;
  id v5 = objc_msgSend(v4, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, a1, v43);
  id v6 = v43[0];
  if (v5)
  {
    uint64_t v7 = v5;
    sub_2248BA1D4(0, (unint64_t *)&unk_26AC07728);
    unint64_t v8 = sub_2248C48A8();
    id v9 = v6;

    swift_retain();
    unint64_t v10 = sub_2248B7444(v8);
    swift_bridgeObjectRelease();
    swift_release();
    v43[0] = (id)MEMORY[0x263F8EE78];
    if (v10 >> 62)
    {
      uint64_t v11 = sub_2248C4BC8();
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_4:
        if (v11 < 1)
        {
          __break(1u);
LABEL_31:
          swift_once();
LABEL_26:
          uint64_t v32 = sub_2248C46A8();
          __swift_project_value_buffer(v32, (uint64_t)qword_26AC07D28);
          swift_bridgeObjectRetain();
          unint64_t v33 = sub_2248C4698();
          os_log_type_t v34 = sub_2248C49C8();
          if (os_log_type_enabled(v33, v34))
          {
            unint64_t v41 = v2;
            uint64_t v35 = (uint8_t *)swift_slowAlloc();
            uint64_t v36 = (void *)swift_slowAlloc();
            v43[0] = v36;
            *(_DWORD *)uint64_t v35 = 136315138;
            uint64_t v37 = swift_bridgeObjectRetain();
            uint64_t v38 = MEMORY[0x22A6193B0](v37, MEMORY[0x263F8D310]);
            unint64_t v40 = v39;
            swift_bridgeObjectRelease();
            sub_2248AD104(v38, v40, (uint64_t *)v43);
            sub_2248C4A28();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22480C000, v33, v34, "Updated browseCompanionLink device filter: %s", v35, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A61A430](v36, -1, -1);
            MEMORY[0x22A61A430](v35, -1, -1);
            swift_bridgeObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
          }
          return;
        }
        for (uint64_t i = 0; i != v11; ++i)
        {
          if ((v10 & 0xC000000000000001) != 0) {
            id v13 = (id)MEMORY[0x22A619600](i, v10);
          }
          else {
            id v13 = *(id *)(v10 + 8 * i + 32);
          }
          id v14 = v13;
          id v15 = objc_msgSend(v13, sel_pendingStatuses);
          sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
          unint64_t v16 = sub_2248C48A8();

          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v17 = sub_2248C4BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (v17)
          {
            sub_2248C4B38();
            sub_2248C4B58();
            sub_2248C4B68();
            sub_2248C4B48();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        id v18 = v43[0];
LABEL_24:
        unint64_t v30 = *(void **)&v2[OBJC_IVAR___SKALocalStatusServer_browseTask];
        if (!v30)
        {
          swift_release();
          return;
        }
        uint64_t v2 = v30;
        swift_bridgeObjectRetain();
        sub_2248925D8((unint64_t)v18, (uint64_t)v42, (SEL *)&selRef_idsIdentifier);
        swift_release();
        id v31 = (void *)sub_2248C4898();
        objc_msgSend(v2, sel_setDeviceFilter_, v31);

        if (qword_26AC07D40 == -1) {
          goto LABEL_26;
        }
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRelease();
    id v18 = (id)MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
  id v19 = v43[0];
  uint64_t v20 = (void *)sub_2248C4318();

  swift_willThrow();
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_2248C46A8();
  __swift_project_value_buffer(v21, (uint64_t)qword_26AC07D28);
  id v22 = v20;
  id v23 = v20;
  unint64_t v24 = sub_2248C4698();
  os_log_type_t v25 = sub_2248C49A8();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)id v26 = 138412290;
    id v28 = v20;
    uint64_t v29 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v43[0] = v29;
    sub_2248C4A28();
    void *v27 = v29;

    _os_log_impl(&dword_22480C000, v24, v25, "Failed to fetch all published local status devices while updating browser device filter: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v27, -1, -1);
    MEMORY[0x22A61A430](v26, -1, -1);
  }
  else
  {
  }
}

void sub_2248A0ED8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62B70]), sel_init);
  objc_msgSend(v4, sel_setDispatchQueue_, *(void *)(v1 + 144));
  objc_msgSend(v4, sel_setControlFlags_, 6);
  if (*(unsigned char *)(v1 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) == 1) {
    objc_msgSend(v4, sel_setControlFlags_, 65542);
  }
  objc_msgSend(v4, sel_setBleScreenOffScanRate_, 10);
  objc_msgSend(v4, sel_setBleScreenOffRescanInterval_, 900);
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_2248B2458(v5);
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_2248C4898();
  swift_release();
  objc_msgSend(v4, sel_setDeviceFilter_, v6);

  unint64_t v24 = sub_2248B9F08;
  uint64_t v25 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  id v22 = sub_2248883D4;
  id v23 = &block_descriptor_84;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_setDeviceFoundHandler_, v7);
  _Block_release(v7);
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2248C46A8();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AC07D28);
  swift_bridgeObjectRetain_n();
  id v9 = sub_2248C4698();
  os_log_type_t v10 = sub_2248C49C8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t aBlock = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2248C4978();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_2248AD104(v13, v15, &aBlock);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22480C000, v9, v10, "Deliver Statuses START {idsIdentifier: %s}", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v12, -1, -1);
    MEMORY[0x22A61A430](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v16 = v2 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  *(void *)uint64_t v16 = v4;
  *(void *)(v16 + 8) = a1;
  *(unsigned char *)(v16 + 16) = 0;
  swift_bridgeObjectRetain();
  id v18 = v4;
  sub_2248B7C9C(v17);
  unint64_t v24 = sub_2248B9F10;
  uint64_t v25 = v2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  id v22 = sub_224888E8C;
  id v23 = &block_descriptor_87;
  id v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_activateWithCompletion_, v19);
  _Block_release(v19);
}

uint64_t sub_2248A12F8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2248C4938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
  id v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = v8;
  v9[4] = a2;
  v9[5] = a1;
  swift_retain_n();
  id v10 = a1;
  sub_2248A1994((uint64_t)v6, (uint64_t)&unk_268093C20, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2248A1444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = a5;
  return MEMORY[0x270FA2498](sub_2248A1464, a4, 0);
}

uint64_t sub_2248A1464()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  if (v2)
  {
    if (*(unsigned char *)(v1 + OBJC_IVAR___SKALocalStatusServer_browseTask + 16))
    {
      uint64_t v13 = *(void **)(v0 + 32);
      unint64_t v14 = *(void **)(v1 + 168);
      id v15 = v2;
      swift_bridgeObjectRetain();
      id v16 = objc_msgSend(v14, sel_newBackgroundContext);
      id v17 = objc_msgSend(v13, sel_idsDeviceIdentifier);
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = sub_2248C4808();
        uint64_t v21 = v20;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v21 = 0xE000000000000000;
      }
      char v22 = sub_224894944(v19, v21);
      swift_bridgeObjectRelease();
      if (v22)
      {
        id v23 = objc_msgSend(*(id *)(v0 + 32), sel_description);
        sub_2248C4808();

        sub_2248C4858();
        swift_bridgeObjectRelease();
        sub_2248C4858();
        sub_22488FEB4(v16, 0x5B646E756F46, 0xE600000000000000);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
      }
      else
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        unint64_t v24 = *(void **)(v0 + 32);
        uint64_t v25 = sub_2248C46A8();
        __swift_project_value_buffer(v25, (uint64_t)qword_26AC07D28);
        id v26 = v24;
        uint64_t v27 = sub_2248C4698();
        os_log_type_t v28 = sub_2248C49C8();
        BOOL v29 = os_log_type_enabled(v27, v28);
        unint64_t v30 = *(void **)(v0 + 32);
        if (v29)
        {
          os_log_t log = v27;
          id v31 = (uint8_t *)swift_slowAlloc();
          uint64_t v35 = (void *)swift_slowAlloc();
          *(_DWORD *)id v31 = 138412290;
          *(void *)(v0 + 16) = v30;
          uint64_t v37 = v15;
          id v32 = v30;
          sub_2248C4A28();
          *uint64_t v35 = v30;

          _os_log_impl(&dword_22480C000, log, v28, "Skip delivery to found device %@", v31, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
          swift_arrayDestroy();
          MEMORY[0x22A61A430](v35, -1, -1);
          MEMORY[0x22A61A430](v31, -1, -1);
          swift_bridgeObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
    }
    else
    {
      uint64_t v3 = qword_26AC07D40;
      id v4 = v2;
      swift_bridgeObjectRetain();
      if (v3 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_2248C46A8();
      __swift_project_value_buffer(v5, (uint64_t)qword_26AC07D28);
      id v6 = sub_2248C4698();
      os_log_type_t v7 = sub_2248C4998();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_22480C000, v6, v7, "Ignoring device found while companionLink is activating", v8, 2u);
        MEMORY[0x22A61A430](v8, -1, -1);
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2248C46A8();
    __swift_project_value_buffer(v9, (uint64_t)qword_26AC07D28);
    id v10 = sub_2248C4698();
    os_log_type_t v11 = sub_2248C49B8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22480C000, v10, v11, "Received publish device found without a browserTask. Ignorning", v12, 2u);
      MEMORY[0x22A61A430](v12, -1, -1);
    }
  }
  unint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_2248A1994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2248C4938();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2248C4928();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2248BA318(a1, &qword_26AC07700);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2248C48F8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_2248A1B1C(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v7 = a1;
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2248C46A8();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AC07D28);
    id v9 = a1;
    id v10 = a1;
    v24[0] = (id)sub_2248C4698();
    os_log_type_t v11 = sub_2248C49A8();
    if (os_log_type_enabled((os_log_t)v24[0], v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      id v14 = a1;
      id v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v24[1] = v15;
      sub_2248C4A28();
      *uint64_t v13 = v15;

      _os_log_impl(&dword_22480C000, (os_log_t)v24[0], v11, "Failed to activate browseCompanionLink {error: %@}", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v13, -1, -1);
      MEMORY[0x22A61A430](v12, -1, -1);
    }
    else
    {

      id v23 = v24[0];
    }
  }
  else
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2248C46A8();
    __swift_project_value_buffer(v16, (uint64_t)qword_26AC07D28);
    id v17 = sub_2248C4698();
    os_log_type_t v18 = sub_2248C49C8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_22480C000, v17, v18, "CompanionLink activate delivery START", v19, 2u);
      MEMORY[0x22A61A430](v19, -1, -1);
    }

    uint64_t v20 = sub_2248C4938();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
    uint64_t v21 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
    char v22 = (void *)swift_allocObject();
    void v22[2] = a2;
    uint64_t v22[3] = v21;
    v22[4] = a2;
    swift_retain_n();
    sub_2248A1994((uint64_t)v6, (uint64_t)&unk_268093C10, (uint64_t)v22);
    swift_release();
  }
}

uint64_t sub_2248A1EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v6 = sub_2248C4B98();
  v4[4] = v6;
  v4[5] = *(void *)(v6 - 8);
  v4[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248A1FA4, a4, 0);
}

uint64_t sub_2248A1FA4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = OBJC_IVAR___SKALocalStatusServer_browseTask;
  v0[7] = OBJC_IVAR___SKALocalStatusServer_browseTask;
  uint64_t v3 = v1 + v2;
  uint64_t v4 = *(void **)(v1 + v2);
  v0[8] = v4;
  v0[9] = *(void *)(v3 + 8);
  if (v4)
  {
    uint64_t v5 = *(void **)(v1 + 168);
    id v6 = v4;
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(v5, sel_newBackgroundContext);
    v0[10] = v7;
    uint64_t v8 = sub_22488FEB4(v7, 0xD000000000000015, 0x80000002248CEF80);
    v0[11] = v8;
    if (v8)
    {
      id v9 = (void *)swift_task_alloc();
      v0[12] = v9;
      *id v9 = v0;
      v9[1] = sub_2248A24FC;
      return MEMORY[0x270FA1FD0]();
    }
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2248C46A8();
    __swift_project_value_buffer(v21, (uint64_t)qword_26AC07D28);
    char v22 = sub_2248C4698();
    os_log_type_t v23 = sub_2248C49B8();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_22480C000, v22, v23, "No delivery task in startNewBrowserActivate. We expected pending deliveries at this point.", v24, 2u);
      MEMORY[0x22A61A430](v24, -1, -1);
    }

    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2248C46A8();
    __swift_project_value_buffer(v10, (uint64_t)qword_26AC07D28);
    os_log_type_t v11 = sub_2248C4698();
    os_log_type_t v12 = sub_2248C49C8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_22480C000, v11, v12, "CompanionLink activate delivery END", v13, 2u);
      MEMORY[0x22A61A430](v13, -1, -1);
    }
    id v14 = (void *)v0[10];
    uint64_t v15 = v0[3] + v0[7];
    *(_OWORD *)loga = *((_OWORD *)v0 + 4);

    uint64_t v16 = *(void **)v15;
    *(_OWORD *)uint64_t v15 = *(_OWORD *)loga;
    *(unsigned char *)(v15 + 16) = 1;
    sub_2248B7C9C(v16);
    uint64_t v1 = v0[3];
  }
  uint64_t v17 = *(void *)(v1 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds);
  if (v17 == 259200) {
    uint64_t v17 = 302400;
  }
  uint64_t v18 = 1000000000000000000 * v17;
  uint64_t v19 = ((v17 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v17 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_2248C4B88();
  os_log_t log = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_268093BE8 + dword_268093BE8);
  uint64_t v20 = (void *)swift_task_alloc();
  v0[13] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_2248A2814;
  return log(v18, v19, 0, 0, 1);
}

uint64_t sub_2248A24FC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2248A260C, v1, 0);
}

uint64_t sub_2248A260C()
{
  swift_release();
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2248C46A8();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AC07D28);
  uint64_t v2 = sub_2248C4698();
  os_log_type_t v3 = sub_2248C49C8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_22480C000, v2, v3, "CompanionLink activate delivery END", v4, 2u);
    MEMORY[0x22A61A430](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 24) + *(void *)(v0 + 56);
  long long v12 = *(_OWORD *)(v0 + 64);

  id v6 = *(void **)v5;
  *(_OWORD *)uint64_t v5 = v12;
  *(unsigned char *)(v5 + 16) = 1;
  sub_2248B7C9C(v6);
  uint64_t v7 = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds);
  if (v7 == 259200) {
    uint64_t v7 = 302400;
  }
  uint64_t v8 = 1000000000000000000 * v7;
  uint64_t v9 = ((v7 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v7 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_2248C4B88();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_268093BE8 + dword_268093BE8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2248A2814;
  return v13(v8, v9, 0, 0, 1);
}

uint64_t sub_2248A2814()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[6];
  uint64_t v4 = v2[5];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[3];
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v7 = sub_2248A2ADC;
  }
  else {
    uint64_t v7 = sub_2248A2990;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_2248A2990()
{
  uint64_t v1 = *(void **)(v0[3] + v0[7]);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v2, sel_setControlFlags_, 6);
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2248C46A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_26AC07D28);
    uint64_t v4 = sub_2248C4698();
    os_log_type_t v5 = sub_2248C49C8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_22480C000, v4, v5, "Removing bleScreenOff control flag from browseCompanionLink after 3.5 day timeout", v6, 2u);
      MEMORY[0x22A61A430](v6, -1, -1);
    }
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2248A2ADC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2248A2B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[41] = a7;
  v8[42] = a8;
  v8[39] = a5;
  v8[40] = a6;
  v8[38] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  v8[43] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  v8[44] = swift_task_alloc();
  uint64_t v10 = sub_2248C43C8();
  v8[45] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v8[46] = v11;
  v8[47] = *(void *)(v11 + 64);
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248A2C84, a5, 0);
}

uint64_t sub_2248A2C84()
{
  uint64_t v106 = v0;
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = sub_2248925D8(*(void *)(v0 + 304), v0 + 240, (SEL *)&selRef_idsIdentifier);
  *(void *)(v0 + 400) = 0;
  uint64_t v3 = sub_2248B55D8(v2);
  *(void *)(v0 + 408) = v3;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 288) = v3;
  uint64_t v4 = OBJC_IVAR___SKALocalStatusServer_browseTask;
  *(void *)(v0 + 416) = OBJC_IVAR___SKALocalStatusServer_browseTask;
  uint64_t v5 = v1 + v4;
  uint64_t v6 = *(void **)v5;
  *(void *)(v0 + 424) = *(void *)v5;
  if (!v6)
  {
    swift_bridgeObjectRetain();
    goto LABEL_30;
  }
  *(void *)(v0 + 432) = *(void *)(v5 + 8);
  swift_bridgeObjectRetain();
  sub_2248B9528(v6);
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2248C46A8();
  *(void *)(v0 + 440) = __swift_project_value_buffer(v7, (uint64_t)qword_26AC07D28);
  swift_bridgeObjectRetain_n();
  id v8 = v6;
  swift_bridgeObjectRetain_n();
  id v9 = v8;
  uint64_t v10 = sub_2248C4698();
  os_log_type_t v11 = sub_2248C49C8();
  BOOL v12 = os_log_type_enabled(v10, v11);
  unint64_t v13 = *(void *)(v0 + 328);
  if (v12)
  {
    os_log_type_t v96 = v11;
    uint64_t v14 = *(void *)(v0 + 320);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v104 = swift_slowAlloc();
    v105[0] = v104;
    *(_DWORD *)uint64_t v15 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 280) = sub_2248AD104(v14, v13, v105);
    sub_2248C4A28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2048;
    swift_beginAccess();
    *(void *)(v0 + 296) = *(void *)(*(void *)(v0 + 288) + 16);
    sub_2248C4A28();
    *(_WORD *)(v15 + 22) = 2048;
    id v16 = objc_msgSend(v9, (SEL)&classRef_SKAStatusEncryptionManager + 2);
    sub_2248BA1D4(0, &qword_268093B38);
    unint64_t v17 = sub_2248C48A8();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_2248C4BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    *(void *)(v0 + 272) = v18;
    sub_2248C4A28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22480C000, v10, v96, "deliverAllPendingStatuses CONTINUE. Resuming task {reason: %s, pendingIDSIdentifiers.count: %ld, activeDevices.count: %ld}", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v104, -1, -1);
    MEMORY[0x22A61A430](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  id v19 = objc_msgSend(v9, sel_activeDevices);
  sub_2248BA1D4(0, &qword_268093B38);
  unint64_t v20 = sub_2248C48A8();
  *(void *)(v0 + 448) = v20;

  if (!(v20 >> 62))
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 456) = v21;
    if (v21) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2248C4BC8();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 456) = v21;
  if (!v21)
  {
LABEL_29:
    uint64_t v42 = *(void **)(v0 + 424);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_30:
    uint64_t v43 = *(void *)(v0 + 360);
    uint64_t v44 = *(void *)(v0 + 368);
    uint64_t v45 = *(char **)(v0 + 352);
    swift_beginAccess();
    uint64_t v46 = swift_bridgeObjectRetain();
    uint64_t v47 = sub_2248928D4(v46);
    swift_bridgeObjectRelease();
    sub_2248A4A34(v47, v45);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v45, 1, v43) == 1)
    {
      uint64_t v48 = *(void *)(v0 + 312);
      sub_2248BA318(*(void *)(v0 + 352), &qword_268093940);
      unint64_t v49 = (void *)(v48 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      if (*v49)
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_2248C46A8();
        __swift_project_value_buffer(v50, (uint64_t)qword_26AC07D28);
        id v51 = sub_2248C4698();
        os_log_type_t v52 = sub_2248C49C8();
        if (os_log_type_enabled(v51, v52))
        {
          unint64_t v53 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v53 = 0;
          _os_log_impl(&dword_22480C000, v51, v52, "failedDeliveryRetryTask CANCELLED {reason: no failed deliveries}", v53, 2u);
          MEMORY[0x22A61A430](v53, -1, -1);
        }

        if (*v49)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        *unint64_t v49 = 0;
        swift_release();
      }
    }
    else
    {
      unint64_t v54 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v0 + 368) + 32);
      v54(*(void *)(v0 + 392), *(void *)(v0 + 352), *(void *)(v0 + 360));
      sub_2248C4388();
      double v56 = v55;
      if (v55 <= 0.0)
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v71 = sub_2248C46A8();
        __swift_project_value_buffer(v71, (uint64_t)qword_26AC07D28);
        uint64_t v72 = sub_2248C4698();
        os_log_type_t v73 = sub_2248C49B8();
        if (os_log_type_enabled(v72, v73))
        {
          id v74 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v74 = 134217984;
          *(double *)(v0 + 248) = v56;
          sub_2248C4A28();
          _os_log_impl(&dword_22480C000, v72, v73, "failedDeliveryRetryTask FAILED. Invalid sleepSeconds {sleepSeconds: %f}", v74, 0xCu);
          MEMORY[0x22A61A430](v74, -1, -1);
        }
        uint64_t v75 = *(void *)(v0 + 392);
        uint64_t v76 = *(void *)(v0 + 360);
        uint64_t v77 = *(void *)(v0 + 368);

        (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v75, v76);
      }
      else
      {
        uint64_t v100 = v54;
        uint64_t v57 = (uint64_t *)(*(void *)(v0 + 312) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
        swift_beginAccess();
        uint64_t v102 = v57;
        if (*v57)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        uint64_t v59 = *(void *)(v0 + 384);
        uint64_t v58 = *(void *)(v0 + 392);
        uint64_t v97 = v58;
        uint64_t v60 = *(void *)(v0 + 368);
        uint64_t v61 = *(void *)(v0 + 376);
        uint64_t v62 = *(void *)(v0 + 360);
        uint64_t v63 = *(void *)(v0 + 344);
        uint64_t v98 = v63;
        uint64_t v64 = *(void *)(v0 + 312);
        uint64_t v65 = sub_2248C4938();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v63, 1, 1, v65);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v59, v58, v62);
        uint64_t v66 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
        unint64_t v67 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
        unint64_t v68 = (v61 + v67 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v69 = swift_allocObject();
        *(void *)(v69 + 16) = v64;
        *(void *)(v69 + 24) = v66;
        v100(v69 + v67, v59, v62);
        *(double *)(v69 + v68) = v56;
        *(void *)(v69 + ((v68 + 15) & 0xFFFFFFFFFFFFFFF8)) = v64;
        swift_retain_n();
        uint64_t v70 = sub_22488309C(v98, (uint64_t)&unk_268093B30, v69);
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v97, v62);
        *uint64_t v102 = v70;
        swift_release();
      }
    }
    if (*(void *)(*(void *)(v0 + 312) + *(void *)(v0 + 416)))
    {
      swift_bridgeObjectRelease();
      swift_beginAccess();
      if (!*(void *)(*(void *)(v0 + 288) + 16))
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v78 = sub_2248C46A8();
        __swift_project_value_buffer(v78, (uint64_t)qword_26AC07D28);
        uint64_t v79 = sub_2248C4698();
        os_log_type_t v80 = sub_2248C49C8();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v81 = 0;
          _os_log_impl(&dword_22480C000, v79, v80, "failedDeliveryRetryTask CANCELLED {reason: no pending IDS Identifiers}", v81, 2u);
          MEMORY[0x22A61A430](v81, -1, -1);
        }
        uint64_t v82 = *(void *)(v0 + 312);

        uint64_t v83 = (void *)(v82 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
        swift_beginAccess();
        if (*v83)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        void *v83 = 0;
        swift_release();
        sub_22488FC20();
      }
      goto LABEL_62;
    }
    if (qword_26AC07D40 == -1)
    {
LABEL_57:
      uint64_t v84 = sub_2248C46A8();
      __swift_project_value_buffer(v84, (uint64_t)qword_26AC07D28);
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v85 = sub_2248C4698();
      os_log_type_t v86 = sub_2248C49C8();
      if (os_log_type_enabled(v85, v86))
      {
        uint64_t v101 = *(void *)(v0 + 416);
        uint64_t v99 = *(void *)(v0 + 312);
        uint64_t v87 = swift_slowAlloc();
        uint64_t v103 = swift_slowAlloc();
        v105[0] = v103;
        *(_DWORD *)uint64_t v87 = 136315650;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_2248C4978();
        unint64_t v90 = v89;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 256) = sub_2248AD104(v88, v90, v105);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        *(_WORD *)(v87 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v91 = sub_2248C4978();
        unint64_t v93 = v92;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 232) = sub_2248AD104(v91, v93, v105);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v87 + 22) = 1024;
        uint64_t v94 = *(void *)(v99 + v101);
        swift_release();
        *(_DWORD *)(v0 + 504) = v94 == 0;
        sub_2248C4A28();
        swift_release();
        _os_log_impl(&dword_22480C000, v85, v86, "Starting new browser task: {pendingIDSIdentifiers: %s, originalPendingIDSIdentifiers: %s, browserTask.isNill: %{BOOL}d}", (uint8_t *)v87, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v103, -1, -1);
        MEMORY[0x22A61A430](v87, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      sub_2248A0ED8(*(void *)(v0 + 408));
      swift_bridgeObjectRelease();
LABEL_62:
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v95 = *(uint64_t (**)(void))(v0 + 8);
      return v95();
    }
LABEL_66:
    swift_once();
    goto LABEL_57;
  }
LABEL_12:
  if (v21 < 1)
  {
    __break(1u);
    goto LABEL_66;
  }
  swift_beginAccess();
  uint64_t v22 = 0;
  while (1)
  {
    *(void *)(v0 + 464) = v22;
    uint64_t v23 = *(void *)(v0 + 448);
    if ((v23 & 0xC000000000000001) != 0) {
      unint64_t v24 = MEMORY[0x22A619600]();
    }
    else {
      unint64_t v24 = *(id *)(v23 + 8 * v22 + 32);
    }
    uint64_t v25 = v24;
    *(void *)(v0 + 472) = v24;
    id v26 = [v24 idsDeviceIdentifier];
    if (!v26) {
      goto LABEL_15;
    }
    uint64_t v27 = v26;
    uint64_t v28 = sub_2248C4808();
    uint64_t v30 = v29;

    *(void *)(v0 + 480) = v28;
    *(void *)(v0 + 488) = v30;
    uint64_t v31 = *(void *)(v0 + 288);
    swift_bridgeObjectRetain();
    char v32 = sub_2248942A8(v28, v30, v31);
    swift_bridgeObjectRelease();
    if (v32) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_15:

    uint64_t v22 = *(void *)(v0 + 464) + 1;
    if (v22 == *(void *)(v0 + 456)) {
      goto LABEL_29;
    }
  }
  if ((sub_224894944(v28, v30) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = v25;
    unint64_t v33 = sub_2248C4698();
    os_log_type_t v34 = sub_2248C49C8();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 138412290;
      *(void *)(v35 + 4) = v25;
      *uint64_t v36 = v25;
      _os_log_impl(&dword_22480C000, v33, v34, "Skip delivery to active device %@", (uint8_t *)v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v36, -1, -1);
      MEMORY[0x22A61A430](v35, -1, -1);
    }
    else
    {

      uint64_t v25 = v33;
    }
    goto LABEL_15;
  }
  uint64_t v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 496) = v37;
  *uint64_t v37 = v0;
  v37[1] = sub_2248A3C90;
  uint64_t v38 = *(void *)(v0 + 328);
  uint64_t v39 = *(void *)(v0 + 336);
  uint64_t v40 = *(void *)(v0 + 320);
  return sub_224894F94((uint64_t)v25, v40, v38, v39);
}

uint64_t sub_2248A3C90(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 312);
  *(unsigned char *)(*(void *)v1 + 508) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2248A3DA8, v2, 0);
}

uint64_t sub_2248A3DA8()
{
  uint64_t v87 = v0;
  if (*(unsigned char *)(v0 + 508))
  {
    uint64_t v1 = *(void *)(v0 + 480);
    uint64_t v2 = *(void *)(v0 + 488);
    uint64_t v3 = *(void **)(v0 + 472);
    swift_beginAccess();
    sub_2248B1FA8(v1, v2);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 464) + 1;
  if (v4 == *(void *)(v0 + 456))
  {
LABEL_5:
    uint64_t v5 = *(void **)(v0 + 424);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v7 = *(void *)(v0 + 360);
    uint64_t v6 = *(void *)(v0 + 368);
    id v8 = *(char **)(v0 + 352);
    swift_beginAccess();
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = sub_2248928D4(v9);
    swift_bridgeObjectRelease();
    sub_2248A4A34(v10, v8);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7) == 1)
    {
      uint64_t v11 = *(void *)(v0 + 312);
      sub_2248BA318(*(void *)(v0 + 352), &qword_268093940);
      BOOL v12 = (void *)(v11 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      if (*v12)
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v13 = sub_2248C46A8();
        __swift_project_value_buffer(v13, (uint64_t)qword_26AC07D28);
        uint64_t v14 = sub_2248C4698();
        os_log_type_t v15 = sub_2248C49C8();
        if (os_log_type_enabled(v14, v15))
        {
          id v16 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v16 = 0;
          _os_log_impl(&dword_22480C000, v14, v15, "failedDeliveryRetryTask CANCELLED {reason: no failed deliveries}", v16, 2u);
          MEMORY[0x22A61A430](v16, -1, -1);
        }

        if (*v12)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        *BOOL v12 = 0;
        swift_release();
      }
    }
    else
    {
      uint64_t v31 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v0 + 368) + 32);
      v31(*(void *)(v0 + 392), *(void *)(v0 + 352), *(void *)(v0 + 360));
      sub_2248C4388();
      double v33 = v32;
      if (v32 <= 0.0)
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v48 = sub_2248C46A8();
        __swift_project_value_buffer(v48, (uint64_t)qword_26AC07D28);
        unint64_t v49 = sub_2248C4698();
        os_log_type_t v50 = sub_2248C49B8();
        if (os_log_type_enabled(v49, v50))
        {
          id v51 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v51 = 134217984;
          *(double *)(v0 + 248) = v33;
          sub_2248C4A28();
          _os_log_impl(&dword_22480C000, v49, v50, "failedDeliveryRetryTask FAILED. Invalid sleepSeconds {sleepSeconds: %f}", v51, 0xCu);
          MEMORY[0x22A61A430](v51, -1, -1);
        }
        uint64_t v52 = *(void *)(v0 + 392);
        uint64_t v53 = *(void *)(v0 + 360);
        uint64_t v54 = *(void *)(v0 + 368);

        (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
      }
      else
      {
        uint64_t v83 = v31;
        os_log_type_t v34 = (uint64_t *)(*(void *)(v0 + 312) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
        swift_beginAccess();
        uint64_t v85 = v34;
        if (*v34)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        uint64_t v36 = *(void *)(v0 + 384);
        uint64_t v35 = *(void *)(v0 + 392);
        uint64_t v78 = v36;
        uint64_t v79 = v35;
        uint64_t v37 = *(void *)(v0 + 368);
        uint64_t v38 = *(void *)(v0 + 376);
        uint64_t v39 = *(void *)(v0 + 360);
        uint64_t v40 = *(void *)(v0 + 344);
        uint64_t v81 = v40;
        uint64_t v41 = *(void *)(v0 + 312);
        uint64_t v42 = sub_2248C4938();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v40, 1, 1, v42);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v35, v39);
        uint64_t v43 = sub_2248AD9A0(&qword_268093B18, (void (*)(uint64_t))type metadata accessor for SKALocalStatusServer);
        unint64_t v44 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
        unint64_t v45 = (v38 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v46 = swift_allocObject();
        *(void *)(v46 + 16) = v41;
        *(void *)(v46 + 24) = v43;
        v83(v46 + v44, v78, v39);
        *(double *)(v46 + v45) = v33;
        *(void *)(v46 + ((v45 + 15) & 0xFFFFFFFFFFFFFFF8)) = v41;
        swift_retain_n();
        uint64_t v47 = sub_22488309C(v81, (uint64_t)&unk_268093B30, v46);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v79, v39);
        uint64_t *v85 = v47;
        swift_release();
      }
    }
    if (*(void *)(*(void *)(v0 + 312) + *(void *)(v0 + 416)))
    {
      swift_bridgeObjectRelease();
      swift_beginAccess();
      if (!*(void *)(*(void *)(v0 + 288) + 16))
      {
        if (qword_26AC07D40 != -1) {
          swift_once();
        }
        uint64_t v60 = sub_2248C46A8();
        __swift_project_value_buffer(v60, (uint64_t)qword_26AC07D28);
        uint64_t v61 = sub_2248C4698();
        os_log_type_t v62 = sub_2248C49C8();
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v63 = 0;
          _os_log_impl(&dword_22480C000, v61, v62, "failedDeliveryRetryTask CANCELLED {reason: no pending IDS Identifiers}", v63, 2u);
          MEMORY[0x22A61A430](v63, -1, -1);
        }
        uint64_t v64 = *(void *)(v0 + 312);

        uint64_t v65 = (void *)(v64 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
        swift_beginAccess();
        if (*v65)
        {
          swift_retain();
          sub_2248C4948();
          swift_release();
        }
        *uint64_t v65 = 0;
        swift_release();
        sub_22488FC20();
      }
    }
    else
    {
      if (qword_26AC07D40 != -1) {
        swift_once();
      }
      uint64_t v66 = sub_2248C46A8();
      __swift_project_value_buffer(v66, (uint64_t)qword_26AC07D28);
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      unint64_t v67 = sub_2248C4698();
      os_log_type_t v68 = sub_2248C49C8();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v82 = *(void *)(v0 + 416);
        uint64_t v80 = *(void *)(v0 + 312);
        uint64_t v69 = swift_slowAlloc();
        uint64_t v84 = swift_slowAlloc();
        v86[0] = v84;
        *(_DWORD *)uint64_t v69 = 136315650;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v70 = sub_2248C4978();
        unint64_t v72 = v71;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 256) = sub_2248AD104(v70, v72, v86);
        sub_2248C4A28();
        swift_bridgeObjectRelease();
        *(_WORD *)(v69 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_2248C4978();
        unint64_t v75 = v74;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 232) = sub_2248AD104(v73, v75, v86);
        sub_2248C4A28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v69 + 22) = 1024;
        uint64_t v76 = *(void *)(v80 + v82);
        swift_release();
        *(_DWORD *)(v0 + 504) = v76 == 0;
        sub_2248C4A28();
        swift_release();
        _os_log_impl(&dword_22480C000, v67, v68, "Starting new browser task: {pendingIDSIdentifiers: %s, originalPendingIDSIdentifiers: %s, browserTask.isNill: %{BOOL}d}", (uint8_t *)v69, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x22A61A430](v84, -1, -1);
        MEMORY[0x22A61A430](v69, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      sub_2248A0ED8(*(void *)(v0 + 408));
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v77 = *(uint64_t (**)(void))(v0 + 8);
    return v77();
  }
  while (1)
  {
    *(void *)(v0 + 464) = v4;
    uint64_t v17 = *(void *)(v0 + 448);
    if ((v17 & 0xC000000000000001) != 0) {
      uint64_t v18 = MEMORY[0x22A619600]();
    }
    else {
      uint64_t v18 = *(id *)(v17 + 8 * v4 + 32);
    }
    id v19 = v18;
    *(void *)(v0 + 472) = v18;
    id v20 = [v18 idsDeviceIdentifier];
    if (!v20) {
      goto LABEL_15;
    }
    uint64_t v21 = v20;
    uint64_t v22 = sub_2248C4808();
    uint64_t v24 = v23;

    *(void *)(v0 + 480) = v22;
    *(void *)(v0 + 488) = v24;
    uint64_t v25 = *(void *)(v0 + 288);
    swift_bridgeObjectRetain();
    char v26 = sub_2248942A8(v22, v24, v25);
    swift_bridgeObjectRelease();
    if (v26) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_15:

    uint64_t v4 = *(void *)(v0 + 464) + 1;
    if (v4 == *(void *)(v0 + 456)) {
      goto LABEL_5;
    }
  }
  if ((sub_224894944(v22, v24) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    id v19 = v19;
    uint64_t v27 = sub_2248C4698();
    os_log_type_t v28 = sub_2248C49C8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 138412290;
      *(void *)(v29 + 4) = v19;
      *uint64_t v30 = v19;
      _os_log_impl(&dword_22480C000, v27, v28, "Skip delivery to active device %@", (uint8_t *)v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v30, -1, -1);
      MEMORY[0x22A61A430](v29, -1, -1);
    }
    else
    {

      id v19 = v27;
    }
    goto LABEL_15;
  }
  double v55 = (void *)swift_task_alloc();
  *(void *)(v0 + 496) = v55;
  *double v55 = v0;
  v55[1] = sub_2248A3C90;
  uint64_t v56 = *(void *)(v0 + 328);
  uint64_t v57 = *(void *)(v0 + 336);
  uint64_t v58 = *(void *)(v0 + 320);
  return sub_224894F94((uint64_t)v19, v58, v56, v57);
}

uint64_t sub_2248A4A34@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_2248C43C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v29 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (!v17)
  {
    id v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v19(v9, 1, 1, v10);
    goto LABEL_5;
  }
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v36 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
  uint64_t v37 = v11 + 16;
  v36(v9, a1 + v18, v10);
  uint64_t v31 = a1;
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v38(v9, 0, 1, v10);
  os_log_type_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v35 = v11 + 48;
  if (v34(v9, 1, v10) == 1)
  {
    id v19 = v38;
LABEL_5:
    sub_2248BA318((uint64_t)v9, &qword_268093940);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a2, 1, 1, v10);
  }
  uint64_t v30 = a2;
  double v33 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v33(v16, v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v21 = v17 - 1;
  if (v21)
  {
    uint64_t v23 = *(void *)(v11 + 72);
    uint64_t v24 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v32 = v23;
    unint64_t v25 = v31 + v23 + v18;
    char v26 = v33;
    while (1)
    {
      v36(v7, v25, v10);
      v38(v7, 0, 1, v10);
      if (v34(v7, 1, v10) == 1) {
        break;
      }
      v26(v14, v7, v10);
      sub_2248AD9A0(&qword_268093C28, MEMORY[0x263F07490]);
      char v27 = sub_2248C47D8();
      os_log_type_t v28 = *v24;
      if (v27)
      {
        v28(v16, v10);
        v26(v16, v14, v10);
      }
      else
      {
        v28(v14, v10);
      }
      v25 += v32;
      if (!--v21) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v38(v7, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_2248BA318((uint64_t)v7, &qword_268093940);
  uint64_t v22 = v30;
  v33(v30, v16, v10);
  return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v38)(v22, 0, 1, v10);
}

uint64_t sub_2248A4E58(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 200) = a6;
  *(double *)(v6 + 192) = a1;
  *(void *)(v6 + 184) = a5;
  uint64_t v8 = sub_2248C4B98();
  *(void *)(v6 + 208) = v8;
  *(void *)(v6 + 216) = *(void *)(v8 - 8);
  *(void *)(v6 + 224) = swift_task_alloc();
  uint64_t v9 = sub_2248C4518();
  *(void *)(v6 + 232) = v9;
  *(void *)(v6 + 240) = *(void *)(v9 - 8);
  *(void *)(v6 + 248) = swift_task_alloc();
  uint64_t v10 = sub_2248C4528();
  *(void *)(v6 + 256) = v10;
  *(void *)(v6 + 264) = *(void *)(v10 - 8);
  *(void *)(v6 + 272) = swift_task_alloc();
  uint64_t v11 = sub_2248C43C8();
  *(void *)(v6 + 280) = v11;
  *(void *)(v6 + 288) = *(void *)(v11 - 8);
  *(void *)(v6 + 296) = swift_task_alloc();
  *(void *)(v6 + 304) = swift_task_alloc();
  *(void *)(v6 + 312) = swift_task_alloc();
  *(void *)(v6 + 320) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248A5060, a6, 0);
}

void sub_2248A5060()
{
  uint64_t v31 = v0;
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v1 = *((void *)v0 + 23);
  uint64_t v2 = *((void *)v0 + 40);
  uint64_t v3 = *((void *)v0 + 35);
  uint64_t v4 = *((void *)v0 + 36);
  uint64_t v5 = sub_2248C46A8();
  *((void *)v0 + 41) = __swift_project_value_buffer(v5, (uint64_t)qword_26AC07D28);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *((void *)v0 + 42) = v6;
  *((void *)v0 + 43) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = sub_2248C4698();
  os_log_type_t v8 = sub_2248C49C8();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *((void *)v0 + 40);
  uint64_t v11 = *((void *)v0 + 36);
  if (v9)
  {
    uint64_t v12 = *((void *)v0 + 33);
    uint64_t v13 = *((void *)v0 + 34);
    uint64_t v14 = *((void *)v0 + 31);
    uint64_t v24 = *((void *)v0 + 32);
    loga = v7;
    uint64_t v16 = *((void *)v0 + 29);
    uint64_t v15 = *((void *)v0 + 30);
    uint64_t v17 = *((void *)v0 + 24);
    uint64_t v25 = *((void *)v0 + 35);
    os_log_type_t type = v8;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v18 = 136315394;
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v14, *MEMORY[0x263F52648], v16);
    sub_2248C4298();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    sub_2248AD9A0(&qword_268093BF0, MEMORY[0x263F52650]);
    sub_2248C43B8();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v24);
    *((void *)v0 + 21) = sub_2248AD104(*((void *)v0 + 7), *((void *)v0 + 8), &v30);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    id v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(v10, v25);
    *(_WORD *)(v18 + 12) = 2048;
    *((void *)v0 + 22) = v17;
    sub_2248C4A28();
    _os_log_impl(&dword_22480C000, loga, type, "failedDeliveryRetryTask SCHEDULED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v27, -1, -1);
    MEMORY[0x22A61A430](v18, -1, -1);
  }
  else
  {
    id v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(*((void *)v0 + 40), *((void *)v0 + 35));
  }
  *((void *)v0 + 44) = v19;
  double v20 = v0[24] + 5.0;
  if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v21 = 1000000000000000000 * (uint64_t)v20;
  uint64_t v22 = (((uint64_t)v20 >> 63) & 0xF21F494C589C0000)
      + (((unint64_t)(uint64_t)v20 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_2248C4B88();
  os_log_t log = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_268093BE8 + dword_268093BE8);
  uint64_t v23 = (void *)swift_task_alloc();
  *((void *)v0 + 45) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_2248A5474;
  log(v21, v22, 0, 0, 1);
}

uint64_t sub_2248A5474()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[28];
  uint64_t v4 = v2[27];
  uint64_t v5 = v2[26];
  uint64_t v6 = v2[25];
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v7 = sub_2248A55F0;
  }
  else {
    uint64_t v7 = sub_2248A590C;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_2248A55F0()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 368);
  (*(void (**)(void, void, void))(v0 + 336))(*(void *)(v0 + 296), *(void *)(v0 + 184), *(void *)(v0 + 280));
  uint64_t v2 = sub_2248C4698();
  os_log_type_t v3 = sub_2248C49C8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v15 = *(void *)(v0 + 296);
    uint64_t v4 = *(void *)(v0 + 272);
    uint64_t v16 = *(void *)(v0 + 280);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    uint64_t v6 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 264);
    uint64_t v7 = *(void *)(v0 + 240);
    uint64_t v8 = *(void *)(v0 + 248);
    id v19 = v1;
    uint64_t v9 = *(void *)(v0 + 232);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v11 = 136315394;
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v8, *MEMORY[0x263F52648], v9);
    sub_2248C4298();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    sub_2248AD9A0(&qword_268093BF0, MEMORY[0x263F52650]);
    sub_2248C43B8();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    *(void *)(v0 + 160) = sub_2248AD104(*(void *)(v0 + 40), *(void *)(v0 + 48), &v20);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    v17(v15, v16);
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v0 + 136) = v10;
    sub_2248C4A28();
    _os_log_impl(&dword_22480C000, v2, v3, "failedDeliveryRetryTask CANCELLED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v18, -1, -1);
    MEMORY[0x22A61A430](v11, -1, -1);
    uint64_t v12 = v19;
  }
  else
  {
    (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 296), *(void *)(v0 + 280));
    uint64_t v12 = v1;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_2248A590C()
{
  uint64_t v80 = v0;
  (*(void (**)(void, void, void))(v0 + 336))(*(void *)(v0 + 312), *(void *)(v0 + 184), *(void *)(v0 + 280));
  uint64_t v1 = sub_2248C4698();
  os_log_type_t v2 = sub_2248C49C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v62 = *(void *)(v0 + 312);
    uint64_t v3 = *(void *)(v0 + 272);
    uint64_t v65 = *(void *)(v0 + 280);
    os_log_type_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    uint64_t v5 = *(void *)(v0 + 256);
    uint64_t v4 = *(void *)(v0 + 264);
    uint64_t v6 = *(void *)(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 248);
    uint64_t v8 = *(void *)(v0 + 232);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = swift_slowAlloc();
    uint64_t typea = swift_slowAlloc();
    uint64_t v78 = typea;
    *(_DWORD *)uint64_t v10 = 136315394;
    unsigned int v75 = *MEMORY[0x263F52648];
    (*(void (**)(uint64_t))(v6 + 104))(v7);
    sub_2248C4298();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    sub_2248AD9A0(&qword_268093BF0, MEMORY[0x263F52650]);
    sub_2248C43B8();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    *(void *)(v0 + 144) = sub_2248AD104(*(void *)(v0 + 72), *(void *)(v0 + 80), &v78);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    v68(v62, v65);
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v0 + 152) = v9;
    sub_2248C4A28();
    _os_log_impl(&dword_22480C000, v1, v2, "failedDeliveryRetryTask FIRED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](typea, -1, -1);
    MEMORY[0x22A61A430](v10, -1, -1);

    uint64_t v11 = v75;
  }
  else
  {
    (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 312), *(void *)(v0 + 280));

    uint64_t v11 = *MEMORY[0x263F52648];
  }
  *(_DWORD *)(v0 + 456) = v11;
  uint64_t v13 = *(void *)(v0 + 264);
  uint64_t v12 = *(void *)(v0 + 272);
  uint64_t v15 = *(void *)(v0 + 248);
  uint64_t v14 = *(void *)(v0 + 256);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v16 = *(void *)(v0 + 240);
  os_log_type_t type = *(void **)(v0 + 368);
  id v18 = objc_msgSend(*(id *)(*(void *)(v0 + 200) + 168), sel_newBackgroundContext);
  *(void *)(v0 + 376) = v18;
  uint64_t v78 = 0;
  unint64_t v79 = 0xE000000000000000;
  sub_2248C4AE8();
  swift_bridgeObjectRelease();
  uint64_t v78 = 0xD000000000000018;
  unint64_t v79 = 0x80000002248CEF60;
  id v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104);
  *(void *)(v0 + 384) = v19;
  *(void *)(v0 + 392) = (v16 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  unsigned int v76 = v11;
  v19(v15, v11, v17);
  sub_2248C4298();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  *(void *)(v0 + 400) = v20;
  *(void *)(v0 + 408) = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v20(v15, v17);
  *(void *)(v0 + 416) = sub_2248AD9A0(&qword_268093BF0, MEMORY[0x263F52650]);
  sub_2248C43B8();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(void *)(v0 + 424) = v21;
  *(void *)(v0 + 432) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v12, v14);
  sub_2248C4858();
  swift_bridgeObjectRelease();
  sub_2248C4858();
  uint64_t v22 = type;
  uint64_t v23 = sub_22488FEB4(v18, v78, v79);
  *(void *)(v0 + 440) = v23;
  swift_bridgeObjectRelease();
  if (type)
  {

    (*(void (**)(void, void, void))(v0 + 336))(*(void *)(v0 + 296), *(void *)(v0 + 184), *(void *)(v0 + 280));
    uint64_t v24 = sub_2248C4698();
    os_log_type_t v25 = sub_2248C49C8();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = *(void *)(v0 + 296);
    if (v26)
    {
      os_log_t log = v24;
      uint64_t v29 = *(void *)(v0 + 264);
      uint64_t v28 = *(void *)(v0 + 272);
      uint64_t v60 = *(void *)(v0 + 256);
      os_log_type_t typeb = v25;
      uint64_t v31 = *(void *)(v0 + 240);
      uint64_t v30 = *(void *)(v0 + 248);
      uint64_t v32 = *(void *)(v0 + 232);
      uint64_t v33 = *(void *)(v0 + 192);
      uint64_t v63 = *(void *)(v0 + 280);
      uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
      uint64_t v34 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      uint64_t v78 = v69;
      *(_DWORD *)uint64_t v34 = 136315394;
      (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))(v30, v76, v32);
      sub_2248C4298();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
      sub_2248C43B8();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v60);
      *(void *)(v0 + 160) = sub_2248AD104(*(void *)(v0 + 40), *(void *)(v0 + 48), &v78);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      v66(v27, v63);
      *(_WORD *)(v34 + 12) = 2048;
      *(void *)(v0 + 136) = v33;
      sub_2248C4A28();
      _os_log_impl(&dword_22480C000, log, typeb, "failedDeliveryRetryTask CANCELLED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v69, -1, -1);
      MEMORY[0x22A61A430](v34, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 296), *(void *)(v0 + 280));
    }
    goto LABEL_12;
  }
  if (!v23)
  {
    uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
    uint64_t v38 = *(void *)(v0 + 304);
    uint64_t v39 = *(void *)(v0 + 280);
    uint64_t v40 = *(void *)(v0 + 184);
    uint64_t v41 = (void *)(*(void *)(v0 + 200) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
    swift_beginAccess();
    *uint64_t v41 = 0;
    swift_release();
    v37(v38, v40, v39);
    uint64_t v42 = sub_2248C4698();
    uint64_t v43 = sub_2248C49C8();
    if (os_log_type_enabled(v42, (os_log_type_t)v43))
    {
      uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
      uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      unint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
      uint64_t v77 = *(void **)(v0 + 376);
      uint64_t v45 = *(unsigned int *)(v0 + 456);
      unint64_t v67 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
      uint64_t v59 = *(void *)(v0 + 304);
      uint64_t v46 = *(void *)(v0 + 272);
      uint64_t v64 = *(void *)(v0 + 280);
      uint64_t v48 = *(void *)(v0 + 248);
      uint64_t v47 = *(void *)(v0 + 256);
      os_log_type_t typec = v43;
      uint64_t v49 = *(void *)(v0 + 232);
      uint64_t v50 = *(void *)(v0 + 192);
      uint64_t v51 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      uint64_t v78 = v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      v44(v48, v45, v49);
      sub_2248C4298();
      v58(v48, v49);
      sub_2248C43B8();
      v61(v46, v47);
      *(void *)(v0 + 120) = sub_2248AD104(*(void *)(v0 + 104), *(void *)(v0 + 112), &v78);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      v67(v59, v64);
      *(_WORD *)(v51 + 12) = 2048;
      *(void *)(v0 + 128) = v50;
      sub_2248C4A28();
      _os_log_impl(&dword_22480C000, v42, typec, "failedDeliveryRetryTask END {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v52, -1, -1);
      MEMORY[0x22A61A430](v51, -1, -1);

      swift_release();
    }
    else
    {
      uint64_t v53 = *(void **)(v0 + 376);
      uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
      uint64_t v55 = *(void *)(v0 + 304);
      uint64_t v56 = *(void *)(v0 + 280);
      swift_release();
      v54(v55, v56);
    }
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  swift_retain();
  uint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v35;
  *uint64_t v35 = v0;
  v35[1] = sub_2248A633C;
  return MEMORY[0x270FA1FD0]();
}

uint64_t sub_2248A633C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2248A6468, v1, 0);
}

uint64_t sub_2248A6468()
{
  uint64_t v30 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = (void *)(*(void *)(v0 + 200) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
  swift_beginAccess();
  void *v5 = 0;
  swift_release();
  v1(v2, v4, v3);
  uint64_t v6 = sub_2248C4698();
  os_log_type_t v7 = sub_2248C49C8();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
    uint64_t v8 = *(unsigned int *)(v0 + 456);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    uint64_t v28 = *(void **)(v0 + 376);
    uint64_t v24 = *(void *)(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 280);
    uint64_t v11 = *(void *)(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 256);
    uint64_t v12 = *(void *)(v0 + 232);
    uint64_t v13 = *(void *)(v0 + 192);
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    v22(v11, v8, v12);
    sub_2248C4298();
    v23(v11, v12);
    sub_2248C43B8();
    v25(v9, v10);
    *(void *)(v0 + 120) = sub_2248AD104(*(void *)(v0 + 104), *(void *)(v0 + 112), &v29);
    sub_2248C4A28();
    swift_bridgeObjectRelease();
    v27(v24, v26);
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v0 + 128) = v13;
    sub_2248C4A28();
    _os_log_impl(&dword_22480C000, v6, v7, "failedDeliveryRetryTask END {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v15, -1, -1);
    MEMORY[0x22A61A430](v14, -1, -1);

    swift_release();
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 376);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    uint64_t v18 = *(void *)(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 280);
    swift_release();
    v17(v18, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_2248A67BC@<X0>(uint64_t a1@<X8>)
{
  v20[1] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07468);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2248C4678();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v20 - v10;
  id v12 = objc_msgSend(v1, sel_keyDomain);
  sub_2248C4808();

  sub_2248C4658();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2248BA318((uint64_t)v4, &qword_26AC07468);
    uint64_t v13 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    uint64_t v15 = v14;
    unint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    sub_2248C4AE8();
    swift_bridgeObjectRelease();
    unint64_t v21 = 0xD00000000000001FLL;
    unint64_t v22 = 0x80000002248CEB20;
    id v16 = objc_msgSend(v1, sel_keyDomain);
    sub_2248C4808();

    sub_2248C4858();
    swift_bridgeObjectRelease();
    unint64_t v17 = v22;
    *uint64_t v15 = v21;
    v15[1] = v17;
    (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F526B8], v13);
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v19 = objc_msgSend(v1, sel_keyName);
    sub_2248C4808();

    sub_2248B040C();
    sub_2248B0460();
    sub_2248C4618();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

void sub_2248A6B44(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

id sub_2248A6B54@<X0>(id *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v115 = a5;
  uint64_t v118 = a4;
  uint64_t v119 = a3;
  uint64_t v121 = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v114 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v112 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2248C43C8();
  uint64_t v116 = *(void *)(v14 - 8);
  uint64_t v117 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v112 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v112 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07468);
  MEMORY[0x270FA5388](v20 - 8);
  unint64_t v22 = (char *)&v112 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = *a1;
  id v24 = objc_msgSend(*a1, sel_idsDeviceIdentifier);
  if (!v24)
  {
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_2248C46A8();
    __swift_project_value_buffer(v45, (uint64_t)qword_26AC07D28);
    id v46 = v23;
    uint64_t v47 = sub_2248C4698();
    os_log_type_t v48 = sub_2248C49C8();
    if (!os_log_type_enabled(v47, v48))
    {

      goto LABEL_21;
    }
    uint64_t v49 = swift_slowAlloc();
    uint64_t v50 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v49 = 138412290;
    v122[0] = (uint64_t)v46;
    id v51 = v46;
    sub_2248C4A28();
    *uint64_t v50 = v46;

    _os_log_impl(&dword_22480C000, v47, v48, "reconcileObservations skipping device with nil idsIdentifier {device: %@}", (uint8_t *)v49, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    uint64_t v52 = v50;
LABEL_18:
    MEMORY[0x22A61A430](v52, -1, -1);
    MEMORY[0x22A61A430](v49, -1, -1);

    goto LABEL_21;
  }
  os_log_type_t v25 = v24;
  unint64_t v120 = sub_2248C4808();
  uint64_t v27 = v26;

  uint64_t v28 = *a2;
  if (!*(void *)(v28 + 16))
  {
LABEL_14:
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_2248C46A8();
    __swift_project_value_buffer(v53, (uint64_t)qword_26AC07D28);
    id v54 = v23;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2248C4698();
    os_log_type_t v55 = sub_2248C49C8();
    if (!os_log_type_enabled(v47, v55))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_21;
    }
    uint64_t v49 = swift_slowAlloc();
    uint64_t v56 = (void *)swift_slowAlloc();
    uint64_t v119 = (void *)swift_slowAlloc();
    v122[0] = (uint64_t)v119;
    *(_DWORD *)uint64_t v49 = 138412546;
    uint64_t v123 = (uint64_t)v54;
    unint64_t v57 = v27;
    id v58 = v54;
    sub_2248C4A28();
    *uint64_t v56 = v54;

    *(_WORD *)(v49 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v123 = sub_2248AD104(v120, v57, v122);
    sub_2248C4A28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22480C000, v47, v55, "reconcileObservations skipping device with no statuses {device: %@, deviceID: %s}", (uint8_t *)v49, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v56, -1, -1);
    uint64_t v59 = v119;
    swift_arrayDestroy();
    uint64_t v52 = v59;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  unint64_t v29 = sub_2248AD83C(v120, v27);
  if ((v30 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  id v31 = *(id *)(*(void *)(v28 + 56) + 8 * v29);
  swift_bridgeObjectRelease();
  id v113 = v31;
  id v32 = objc_msgSend(v31, sel_keyDomain);
  sub_2248C4808();

  sub_2248C4658();
  uint64_t v33 = sub_2248C4678();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v22, 1, v33) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2248BA318((uint64_t)v22, &qword_26AC07468);
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_2248C46A8();
    __swift_project_value_buffer(v34, (uint64_t)qword_26AC07D28);
    id v35 = v113;
    uint64_t v36 = sub_2248C4698();
    os_log_type_t v37 = sub_2248C49B8();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v122[0] = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      id v40 = objc_msgSend(v35, sel_keyDomain);
      uint64_t v41 = sub_2248C4808();
      unint64_t v43 = v42;

      uint64_t v123 = sub_2248AD104(v41, v43, v122);
      sub_2248C4A28();

      swift_bridgeObjectRelease();
      unint64_t v44 = "Loaded unknown domain from database {keyDomain: %s}";
LABEL_33:
      _os_log_impl(&dword_22480C000, v36, v37, v44, v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v39, -1, -1);
      MEMORY[0x22A61A430](v38, -1, -1);

LABEL_35:
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
      uint64_t v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56);
      uint64_t v63 = v121;
      return (id)v62(v63, 1, 1, v61);
    }
    goto LABEL_34;
  }
  unint64_t v65 = v27;
  sub_2248BA318((uint64_t)v22, &qword_26AC07468);
  id v66 = objc_msgSend(v113, sel_payload);
  if (!v66)
  {
    swift_bridgeObjectRelease();
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v81 = sub_2248C46A8();
    __swift_project_value_buffer(v81, (uint64_t)qword_26AC07D28);
    id v35 = v113;
    uint64_t v36 = sub_2248C4698();
    os_log_type_t v37 = sub_2248C49C8();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v122[0] = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      id v82 = objc_msgSend(v35, sel_identifier);
      uint64_t v83 = sub_2248C4808();
      unint64_t v85 = v84;

      uint64_t v123 = sub_2248AD104(v83, v85, v122);
      sub_2248C4A28();

      swift_bridgeObjectRelease();
      unint64_t v44 = "Skipping status with nil payload {status.identifier: %s}";
      goto LABEL_33;
    }
LABEL_34:

    goto LABEL_35;
  }
  unint64_t v67 = v66;
  uint64_t v112 = sub_2248C4338();
  unint64_t v69 = v68;

  uint64_t v70 = *v119;
  if (!*(void *)(*v119 + 16)) {
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  unint64_t v71 = sub_2248AD83C(v120, v65);
  if ((v72 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v86 = sub_2248C46A8();
    __swift_project_value_buffer(v86, (uint64_t)qword_26AC07D28);
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_2248C4698();
    os_log_type_t v88 = sub_2248C49A8();
    if (os_log_type_enabled(v87, v88))
    {
      unint64_t v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      v122[0] = v90;
      *(_DWORD *)unint64_t v89 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_2248AD104(v120, v65, v122);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22480C000, v87, v88, "Skipping status with missing IDS Device {idsIdentifier: %s}", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v90, -1, -1);
      MEMORY[0x22A61A430](v89, -1, -1);

      uint64_t v91 = v112;
      unint64_t v92 = v69;
LABEL_49:
      sub_2248B7CF0(v91, v92);

      goto LABEL_21;
    }
    swift_bridgeObjectRelease_n();

    sub_2248B7CF0(v112, v69);
LABEL_21:
    uint64_t v60 = v121;
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
    uint64_t v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56);
    uint64_t v63 = v60;
    return (id)v62(v63, 1, 1, v61);
  }
  uint64_t v119 = *(id *)(*(void *)(v70 + 56) + 8 * v71);
  swift_bridgeObjectRelease();
  uint64_t v73 = v118 + OBJC_IVAR___SKALocalStatusServer_observationTimestamps;
  swift_beginAccess();
  uint64_t v74 = *(void *)v73;
  if (!*(void *)(*(void *)v73 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v13, 1, 1, v117);
LABEL_45:
    sub_2248BA318((uint64_t)v13, &qword_268093940);
    swift_endAccess();
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v93 = sub_2248C46A8();
    __swift_project_value_buffer(v93, (uint64_t)qword_26AC07D28);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v94 = sub_2248C4698();
    os_log_type_t v95 = sub_2248C49A8();
    if (!os_log_type_enabled(v94, v95))
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();

      sub_2248B7CF0(v112, v69);
      goto LABEL_21;
    }
    uint64_t v96 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    v122[0] = v97;
    *(_DWORD *)uint64_t v96 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v123 = sub_2248AD104(v120, v65, v122);
    sub_2248C4A28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v96 + 12) = 2080;
    unint64_t v120 = v69;
    swift_bridgeObjectRetain();
    uint64_t v98 = sub_2248C47A8();
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    uint64_t v123 = sub_2248AD104(v98, v100, v122);
    sub_2248C4A28();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22480C000, v94, v95, "Skipping status with missing timestamp {idsIdentifier: %s, timestamps: %s}", (uint8_t *)v96, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v97, -1, -1);
    MEMORY[0x22A61A430](v96, -1, -1);

    uint64_t v91 = v112;
    unint64_t v92 = v120;
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  unint64_t v75 = sub_2248AD83C(v120, v65);
  if (v76)
  {
    uint64_t v77 = *(void *)(v74 + 56);
    uint64_t v79 = v116;
    uint64_t v78 = v117;
    (*(void (**)(char *, unint64_t, uint64_t))(v116 + 16))(v13, v77 + *(void *)(v116 + 72) * v75, v117);
    uint64_t v80 = 0;
  }
  else
  {
    uint64_t v80 = 1;
    uint64_t v79 = v116;
    uint64_t v78 = v117;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v13, v80, 1, v78);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v13, 1, v78) == 1) {
    goto LABEL_45;
  }
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v19, v13, v78);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v10, v115, v8);
  id v101 = v119;
  id result = objc_msgSend(v119, sel_name);
  if (result)
  {
    uint64_t v102 = result;
    unint64_t v103 = v69;
    uint64_t v118 = sub_2248C4808();
    uint64_t v115 = v104;

    id result = objc_msgSend(v101, sel_modelIdentifier);
    if (result)
    {
      uint64_t v105 = result;
      sub_2248C4808();
      uint64_t v114 = v106;

      uint64_t v108 = v116;
      uint64_t v107 = v117;
      (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v17, v19, v117);
      uint64_t v109 = v112;
      v122[0] = v112;
      v122[1] = v103;
      sub_2248B9CD8(v112, v103);
      sub_2248B040C();
      sub_2248B0460();
      uint64_t v110 = v121;
      sub_2248C4488();

      sub_2248B7CF0(v109, v103);
      (*(void (**)(char *, uint64_t))(v108 + 8))(v19, v107);
      uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
      return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56))(v110, 0, 1, v111);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2248A7BD0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093D50);
    uint64_t v2 = sub_2248C4AD8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  uint64_t v23 = a1 + 56;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  uint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(63 - v3) >> 6;
  uint64_t v7 = v2 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_28;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v12 >= v6) {
      goto LABEL_39;
    }
    uint64_t v13 = *(void *)(v23 + 8 * v12);
    int64_t v14 = v9 + 1;
    if (!v13)
    {
      int64_t v14 = v9 + 2;
      if (v9 + 2 >= v6) {
        goto LABEL_39;
      }
      uint64_t v13 = *(void *)(v23 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v9 + 3;
        if (v9 + 3 >= v6) {
          goto LABEL_39;
        }
        uint64_t v13 = *(void *)(v23 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v9 + 4;
          if (v9 + 4 >= v6) {
            goto LABEL_39;
          }
          uint64_t v13 = *(void *)(v23 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v5 = (v13 - 1) & v13;
    int64_t v9 = v14;
LABEL_28:
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07498);
    swift_dynamicCast();
    sub_2248C4CD8();
    sub_2248C4CF8();
    if (v25)
    {
      swift_bridgeObjectRetain();
      sub_2248C4838();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_2248C4D08();
    uint64_t v16 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v7 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v17) & ~*(void *)(v7 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v19 = 0;
      unint64_t v20 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        BOOL v21 = v18 == v20;
        if (v18 == v20) {
          unint64_t v18 = 0;
        }
        v19 |= v21;
        uint64_t v22 = *(void *)(v7 + 8 * v18);
      }
      while (v22 == -1);
      unint64_t v10 = __clz(__rbit64(~v22)) + (v18 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = (void *)(*(void *)(v2 + 48) + 16 * v10);
    *uint64_t v11 = v24;
    v11[1] = v25;
    ++*(void *)(v2 + 16);
  }
  int64_t v15 = v9 + 5;
  if (v9 + 5 >= v6)
  {
LABEL_39:
    swift_release();
    sub_2248B9E30();
    return v2;
  }
  uint64_t v13 = *(void *)(v23 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v6) {
      goto LABEL_39;
    }
    uint64_t v13 = *(void *)(v23 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_27;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2248A7F04(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v24 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v25 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
LABEL_7:
  if (v7)
  {
    unint64_t v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v10 = v9 | (v4 << 6);
LABEL_25:
    int64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    sub_2248C4CD8();
    sub_2248C4CF8();
    if (v15)
    {
      swift_bridgeObjectRetain_n();
      sub_2248C4838();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_2248C4D08();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if ((*(void *)(v8 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18))
    {
      uint64_t v19 = ~v17;
      uint64_t v20 = *(void *)(a2 + 48);
      do
      {
        BOOL v21 = (void *)(v20 + 16 * v18);
        uint64_t v22 = v21[1];
        if (v22)
        {
          if (v15)
          {
            BOOL v23 = *v21 == v16 && v22 == v15;
            if (v23 || (uint64_t result = sub_2248C4C28(), (result & 1) != 0))
            {
              uint64_t result = swift_bridgeObjectRelease();
              goto LABEL_7;
            }
          }
        }
        else if (!v15)
        {
          goto LABEL_7;
        }
        unint64_t v18 = (v18 + 1) & v19;
      }
      while (((*(void *)(v8 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  int64_t v11 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v11 >= v25) {
    return 1;
  }
  unint64_t v12 = *(void *)(v24 + 8 * v11);
  ++v4;
  if (v12)
  {
LABEL_24:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
    goto LABEL_25;
  }
  int64_t v4 = v11 + 1;
  if (v11 + 1 >= v25) {
    return 1;
  }
  unint64_t v12 = *(void *)(v24 + 8 * v4);
  if (v12) {
    goto LABEL_24;
  }
  int64_t v4 = v11 + 2;
  if (v11 + 2 >= v25) {
    return 1;
  }
  unint64_t v12 = *(void *)(v24 + 8 * v4);
  if (v12) {
    goto LABEL_24;
  }
  int64_t v4 = v11 + 3;
  if (v11 + 3 >= v25) {
    return 1;
  }
  unint64_t v12 = *(void *)(v24 + 8 * v4);
  if (v12) {
    goto LABEL_24;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v25) {
    return 1;
  }
  unint64_t v12 = *(void *)(v24 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v25) {
      return 1;
    }
    unint64_t v12 = *(void *)(v24 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2248A81A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  return MEMORY[0x270FA2498](sub_2248A81C4, a4, 0);
}

uint64_t sub_2248A81C4()
{
  uint64_t v15 = v0;
  uint64_t v1 = sub_22488FEB4(*(void **)(v0 + 40), 0x20746E756F636341, 0xEF6465676E616863);
  *(void *)(v0 + 48) = v1;
  if (v1)
  {
    int64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v13;
    *int64_t v13 = v0;
    v13[1] = sub_2248A84B8;
    return MEMORY[0x270FA1FD0]();
  }
  else
  {
    unint64_t v2 = sub_22489104C((unsigned char *)0xD000000000000019, 0x80000002248CF310);
    if (v2 >> 62) {
      uint64_t v3 = sub_2248C4BC8();
    }
    else {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (qword_26AC07D40 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2248C46A8();
    __swift_project_value_buffer(v4, (uint64_t)qword_26AC07D28);
    uint64_t v5 = sub_2248C4698();
    os_log_type_t v6 = sub_2248C49C8();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v14 = v8;
      *(_DWORD *)unint64_t v7 = 136315138;
      *(void *)(v0 + 16) = v3;
      uint64_t v9 = sub_2248C4C18();
      *(void *)(v0 + 24) = sub_2248AD104(v9, v10, &v14);
      sub_2248C4A28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22480C000, v5, v6, "Could not deliver pending statuses for account change. idsDevices.count: %s}", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v8, -1, -1);
      MEMORY[0x22A61A430](v7, -1, -1);
    }

    int64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_2248A84B8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2248A85C8, v1, 0);
}

uint64_t sub_2248A85C8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2248A8628(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v24[0] = a4;
  uint64_t v7 = sub_2248C4758();
  uint64_t v27 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2248C4778();
  uint64_t v25 = *(void *)(v10 - 8);
  uint64_t v26 = v10;
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[1] = *(void *)(a2 + 144);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = (void *)v24[0];
  *(void *)(v18 + 16) = a3;
  *(void *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, v16, v13);
  aBlock[4] = sub_2248B97B8;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_224885AAC;
  aBlock[3] = &block_descriptor_71;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = a3;
  id v22 = v19;
  sub_2248C4768();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
  sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
  sub_2248C4A68();
  MEMORY[0x22A6194F0](0, v12, v9, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
  return swift_release();
}

void sub_2248A89C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v33 = a3;
  id v34 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = sub_224885164(MEMORY[0x263F8EE78]);
  id v8 = objc_msgSend(a1, sel_keyName);
  uint64_t v9 = sub_2248C4808();
  uint64_t v11 = v10;

  unint64_t v12 = (void *)MEMORY[0x263F8D310];
  os_log_type_t v37 = (void *)MEMORY[0x263F8D310];
  *(void *)&long long aBlock = v9;
  *((void *)&aBlock + 1) = v11;
  sub_2248B9820(&aBlock, v41);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v40 = v7;
  sub_2248B0834(v41, 0x656D614E79656BLL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  uint64_t v14 = v40;
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(a1, sel_keyDomain);
  uint64_t v16 = sub_2248C4808();
  uint64_t v18 = v17;

  os_log_type_t v37 = v12;
  *(void *)&long long aBlock = v16;
  *((void *)&aBlock + 1) = v18;
  sub_2248B9820(&aBlock, v41);
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v40 = v14;
  sub_2248B0834(v41, 0x69616D6F4479656BLL, 0xE90000000000006ELL, v19);
  uint64_t v20 = v40;
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(a1, sel_payload);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = sub_2248C4338();
    unint64_t v25 = v24;

    os_log_type_t v37 = (void *)MEMORY[0x263F06F78];
    *(void *)&long long aBlock = v23;
    *((void *)&aBlock + 1) = v25;
    sub_2248B9820(&aBlock, v41);
    sub_2248B9CD8(v23, v25);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = v20;
    sub_2248B0834(v41, 0x64616F6C796170, 0xE700000000000000, v26);
    uint64_t v20 = v40;
    swift_bridgeObjectRelease();
    sub_2248B7CF0(v23, v25);
  }
  uint64_t v27 = (void *)sub_2248C47F8();
  sub_2248A8D9C(v20);
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)sub_2248C4788();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v4);
  unint64_t v29 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v30 + v29, (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v38 = sub_2248B98C4;
  uint64_t v39 = v30;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v36 = sub_2248A9164;
  os_log_type_t v37 = &block_descriptor_77;
  id v31 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v34, sel_sendRequestID_request_options_responseHandler_, v27, v28, 0, v31);
  _Block_release(v31);
}

uint64_t sub_2248A8D9C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093B90);
    uint64_t v2 = sub_2248C4BF8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2248B9678(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2248B9820(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2248B9820(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2248B9820(v36, v37);
    sub_2248B9820(v37, &v33);
    uint64_t result = sub_2248C4A88();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_2248B9820(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2248B9E30();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2248A9164(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_2248C4798();
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a3) {
LABEL_3:
  }
    uint64_t v5 = sub_2248C4798();
LABEL_4:
  swift_retain();
  id v8 = a4;
  v6(v7, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2248A9248(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07700);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2248C4938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a1;
  *((void *)v17 + 5) = a2;
  *((void *)v17 + 6) = v21;
  *((void *)v17 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  id v18 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2248A1994((uint64_t)v14, (uint64_t)&unk_268093D20, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_2248A944C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093940);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248A9524, 0, 0);
}

uint64_t sub_2248A9524()
{
  uint64_t v17 = v0;
  v16[1] = *MEMORY[0x263EF8340];
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_2248C46A8();
  v0[15] = __swift_project_value_buffer(v2, (uint64_t)qword_26AC07D28);
  id v3 = v1;
  uint64_t v4 = sub_2248C4698();
  os_log_type_t v5 = sub_2248C49C8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[8];
  if (v6)
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v16[0] = v15;
    *(_DWORD *)id v8 = 136315138;
    id v9 = objc_msgSend(v7, sel_identifier);
    uint64_t v10 = sub_2248C4808();
    unint64_t v12 = v11;

    v0[7] = sub_2248AD104(v10, v12, v16);
    sub_2248C4A28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22480C000, v4, v5, "Receive local status CONTINUE. Write status to database. {status: %s}}", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v15, -1, -1);
    MEMORY[0x22A61A430](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v0[9];
  return MEMORY[0x270FA2498](sub_2248A9768, v13, 0);
}

uint64_t sub_2248A9768()
{
  *(void *)(v0 + 128) = *(void *)(*(void *)(v0 + 72) + 176);
  return MEMORY[0x270FA2498](sub_2248A9800, 0, 0);
}

uint64_t sub_2248A9800()
{
  *(void *)(v0 + 136) = objc_msgSend(*(id *)(v0 + 128), sel_newBackgroundContext);
  return MEMORY[0x270FA2498](sub_2248A98A0, 0, 0);
}

uint64_t sub_2248A98A0()
{
  *(void *)(v0 + 40) = 0;
  unsigned int v1 = objc_msgSend(*(id *)(v0 + 128), sel_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error_, *(void *)(v0 + 64), *(void *)(v0 + 136), v0 + 40);
  id v2 = *(id *)(v0 + 40);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v4 = *(void *)(v0 + 72);
    sub_2248C43A8();
    uint64_t v5 = sub_2248C43C8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 0, 1, v5);
    return MEMORY[0x270FA2498](sub_2248A9B8C, v4, 0);
  }
  else
  {
    BOOL v6 = v2;
    uint64_t v7 = *(void **)(v0 + 136);
    id v8 = (void *)sub_2248C4318();

    swift_willThrow();
    id v9 = v8;
    id v10 = v8;
    unint64_t v11 = sub_2248C4698();
    os_log_type_t v12 = sub_2248C49B8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      unint64_t v14 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      id v15 = v8;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 48) = v16;
      sub_2248C4A28();
      *unint64_t v14 = v16;

      _os_log_impl(&dword_22480C000, v11, v12, "Receive local status FAILED. Database error {error: %@}", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B00);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v14, -1, -1);
      MEMORY[0x22A61A430](v13, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_2248A9B8C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  sub_2248BAB80(v2, v1, &qword_268093940);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2248923FC(v1, v4, v3);
  swift_endAccess();
  sub_2248BA318(v2, &qword_268093940);
  return MEMORY[0x270FA2498](sub_2248A9CA8, 0, 0);
}

uint64_t sub_2248A9CA8()
{
  uint64_t v1 = sub_2248C4698();
  os_log_type_t v2 = sub_2248C49C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_22480C000, v1, v2, "Receive local status SUCCESS", v3, 2u);
    MEMORY[0x22A61A430](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 72);

  sub_2248C4AE8();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  sub_2248BA0BC(&qword_26AC07438, &qword_26AC075D8);
  sub_2248C4C18();
  sub_2248C4858();
  swift_bridgeObjectRelease();
  sub_2248C4858();
  *(void *)(v0 + 144) = 0x6465766965636572;
  *(void *)(v0 + 152) = 0xEF5B737574617453;
  return MEMORY[0x270FA2498](sub_2248A9E78, v4, 0);
}

uint64_t sub_2248A9E78()
{
  sub_2248866F8(v0[18], v0[19]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2248A9F3C()
{
  return sub_2248C4D08();
}

uint64_t sub_2248A9FF4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
  sub_2248C47C8();
  swift_bridgeObjectRetain();
  sub_2248C4838();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2248AA0A8()
{
  return sub_2248C4D08();
}

uint64_t sub_2248AA15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2248B040C();
  sub_2248B0460();
  if ((sub_2248C45E8() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  id v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_2248C4C28();
}

uint64_t sub_2248AA20C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2248AA214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t SKALocalStatusServer.service(_:devicesChanged:)(uint64_t a1, uint64_t a2)
{
  return sub_2248B7A20(a2);
}

void SKALocalStatusServer.__allocating_init()()
{
}

void SKALocalStatusServer.init()()
{
}

id *SKALocalStatusServer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_2248BA318((uint64_t)v0 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken, &qword_26AC07588);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2248B7C9C(*(id *)((char *)v0 + OBJC_IVAR___SKALocalStatusServer_browseTask));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SKALocalStatusServer.__deallocating_deinit()
{
  SKALocalStatusServer.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t SKALocalStatusServer.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2248AA4B8()
{
  return v0;
}

id sub_2248AA4D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_2248AA548()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PublishStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_2248C4508();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076D8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248AA76C, 0, 0);
}

uint64_t sub_2248AA76C()
{
  uint64_t v1 = sub_2248C4458();
  uint64_t v3 = v2;
  v0[19] = v1;
  v0[20] = v2;
  sub_2248C4438();
  sub_2248C4448();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[21] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2248AA854;
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[12];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[7];
  return sub_224889674(v5, v6, v1, v3, v7, v8);
}

uint64_t sub_2248AA854()
{
  unint64_t v2 = *(void *)(*(void *)v1 + 160);
  uint64_t v3 = *(void *)(*(void *)v1 + 152);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v5 = *(void *)(*(void *)v1 + 72);
  uint64_t v6 = *(void *)(*(void *)v1 + 64);
  uint64_t v7 = *(void *)(*(void *)v1 + 56);
  uint64_t v8 = *(void *)(*(void *)v1 + 48);
  uint64_t v9 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  sub_2248B7CDC(v3, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v0) {
    uint64_t v10 = sub_2248AABDC;
  }
  else {
    uint64_t v10 = sub_2248AAA64;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_2248AAA64()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  sub_2248BA210(v7, v4, (uint64_t *)&unk_26AC076D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v5);
  sub_2248BAB80(v4, v6, (uint64_t *)&unk_26AC076D8);
  sub_2248C4468();
  sub_2248BA318(v4, (uint64_t *)&unk_26AC076D8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2248AABDC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2248AACA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = v8;
  id v15 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v15;
  uint64_t v16 = sub_2248AD9A0((unint64_t *)&unk_26AC075C8, MEMORY[0x263F525D0]);
  *id v15 = v14;
  v15[1] = sub_2248AADD4;
  return MEMORY[0x270F63548](a1, a2, a3, a4, a5, a6, a7, a8, v16);
}

uint64_t sub_2248AADD4(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_2248AAEE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_224883338;
  return PublishStatusInvocation.invoke(with:context:client:)(a1, a2, v6);
}

uint64_t LocalStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC076D8);
  v3[5] = swift_task_alloc();
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075B0);
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2248AB0C8, a3, 0);
}

uint64_t sub_2248AB0C8()
{
  sub_2248917B4(v0[11], v0[6], v0[3]);
  v0[13] = 0;
  return MEMORY[0x270FA2498](sub_2248AB15C, 0, 0);
}

uint64_t sub_2248AB15C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  sub_2248BA210(v7, v4, (uint64_t *)&unk_26AC076D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v5);
  sub_2248BAB80(v4, v6, (uint64_t *)&unk_26AC076D8);
  sub_2248C44C8();
  sub_2248BA318(v4, (uint64_t *)&unk_26AC076D8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2248AB2B8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2248AB360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = v8;
  id v15 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v15;
  uint64_t v16 = sub_2248AD9A0((unint64_t *)&unk_268093AF0, MEMORY[0x263F52618]);
  *id v15 = v14;
  v15[1] = sub_2248BAC94;
  return MEMORY[0x270F63548](a1, a2, a3, a4, a5, a6, a7, a8, v16);
}

uint64_t sub_2248AB494(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2248BAC98;
  return LocalStatusInvocation.invoke(with:context:client:)(a1, a2, v6);
}

uint64_t SubscribeStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2248AB568, a3, 0);
}

uint64_t sub_2248AB568()
{
  sub_224891B50(v0[3], v0[2]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2248AB5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = v8;
  id v15 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v15;
  uint64_t v16 = sub_2248AD9A0(&qword_26AC07418, MEMORY[0x263F52608]);
  *id v15 = v14;
  v15[1] = sub_2248BAC94;
  return MEMORY[0x270F63548](a1, a2, a3, a4, a5, a6, a7, a8, v16);
}

uint64_t sub_2248AB70C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = *a3;
  v3[4] = *a3;
  return MEMORY[0x270FA2498](sub_2248AB568, v4, 0);
}

id sub_2248AB730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  uint64_t v13 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3;
  uint64_t v14 = (void *)sub_2248C4368();
  id v15 = (void *)sub_2248C4368();
  uint64_t v16 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  if (a10 >> 60 == 15)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = (void *)sub_2248C4328();
    sub_2248B7CDC(a9, a10);
  }
  id v19 = objc_msgSend(v23, sel_initWithIdentifier_creationDate_modificationDate_keyDomain_keyName_payload_targetDevicesFlags_, v13, v14, v15, v16, v17, v18, a11);

  uint64_t v20 = sub_2248C43C8();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);
  v21(a4, v20);
  v21(v24, v20);
  return v19;
}

id sub_2248AB8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v12 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3;
  uint64_t v13 = (void *)sub_2248C4368();
  uint64_t v14 = (void *)sub_2248C4368();
  id v15 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  uint64_t v16 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  if (a10 >> 60 == 15)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = (void *)sub_2248C4328();
    sub_2248B7CDC(a9, a10);
  }
  uint64_t v18 = (void *)sub_2248C47F8();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v23, sel_initWithIdentifier_creationDate_modificationDate_keyName_keyDomain_payload_idsIdentifier_, v12, v13, v14, v15, v16, v17, v18);

  uint64_t v20 = sub_2248C43C8();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);
  v21(a4, v20);
  v21(v24, v20);
  return v19;
}

uint64_t sub_2248ABA80()
{
  return sub_2248C4D08();
}

uint64_t sub_2248ABAC8()
{
  return sub_2248C4CE8();
}

uint64_t sub_2248ABAF4()
{
  return sub_2248C4D08();
}

BOOL sub_2248ABB38(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_2248ABB4C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2248ABB5C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2248ABB68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v22 = 1;
    }
    else
    {
      unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      long long v30 = v7;
      uint64_t v31 = v13;
      uint64_t v14 = *(void *)(v12 + 56);
      uint64_t v32 = v12;
      uint64_t v28 = v14;
      long long v29 = (void (**)(char *, uint64_t))(v12 - 8);
      uint64_t v15 = v10 - 1;
      uint64_t v16 = v7;
      do
      {
        uint64_t v17 = a1;
        uint64_t v18 = v9;
        id v19 = v9;
        uint64_t v20 = v31;
        v31(v18, a1 + v11, v4);
        uint64_t v21 = a2;
        v20(v16, a2 + v11, v4);
        uint64_t v9 = v19;
        sub_2248BA2A4();
        char v22 = sub_2248C47E8();
        id v23 = *v29;
        (*v29)(v16, v4);
        v23(v19, v4);
        BOOL v25 = v15-- != 0;
        if ((v22 & 1) == 0) {
          break;
        }
        v11 += v28;
        a2 = v21;
        a1 = v17;
      }
      while (v25);
    }
  }
  else
  {
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t sub_2248ABD5C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_2248B9CD8(a2, a3);
      uint64_t v10 = (char *)sub_2248C42A8();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_2248C42C8();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_2248C42B8();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x2248ABFC0);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_2248B7CF0(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_2248C42A8();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_2248C42C8();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_2248C42B8();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_2248ABFD0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2248AC0AC;
  return v6(a1);
}

uint64_t sub_2248AC0AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2248AC1A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2248BAC98;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268093918 + dword_268093918);
  return v6(a1, v4);
}

uint64_t sub_2248AC25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2248AC2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_2248C4B78();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_2248AC3C8, 0, 0);
}

uint64_t sub_2248AC3C8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_2248C4B98();
  uint64_t v5 = sub_2248AD9A0(&qword_268093BF8, MEMORY[0x263F8F710]);
  sub_2248C4C68();
  sub_2248AD9A0(&qword_268093C00, MEMORY[0x263F8F6D8]);
  sub_2248C4BA8();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_2248AC568;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_2248AC568()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2248AC724, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2248AC724()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2248AC790()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC076C8);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_26AC07778;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_26AC07760;
  }
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t type metadata accessor for SKALocalStatusServer.DatabaseDelegate()
{
  return self;
}

uint64_t sub_2248AC894@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_2248AC8B4()
{
  return sub_22488529C(v0);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2248AC8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_224885AB0(a1, a2, a3, a4, v4);
}

void sub_2248AC8DC(void *a1)
{
  sub_22488843C(a1, v1, (uint64_t)&unk_26D7A8080, (uint64_t)&unk_268093CF0, "Found device without an IDS identifier {device: %@}");
}

void sub_2248AC91C(void *a1)
{
  sub_22488843C(a1, v1, (uint64_t)&unk_26D7A8058, (uint64_t)&unk_268093C98, "Lost device without an IDS identifier {device: %@}");
}

uint64_t sub_2248AC960()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2248BAC98;
  return sub_224888EF8((uint64_t)v3, v4, v5, v2);
}

void *sub_2248AC9F4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268093BC0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      size_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      size_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2248B5714(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2248ACB04(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    size_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093CD8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2248C4BB8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2248B6FE8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2248ACD74(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    size_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093C50);
  uint64_t v10 = *(void *)(sub_2248C4558() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2248C4BB8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2248C4558() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2248B7144(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_2248ACFDC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268093BC8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
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
    sub_2248B7910(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2248AD104(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2248AD1D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2248B9678((uint64_t)v12, *a3);
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
      sub_2248B9678((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2248AD1D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2248C4A38();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2248AD394(a5, a6);
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
  uint64_t v8 = sub_2248C4B28();
  if (!v8)
  {
    sub_2248C4BB8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2248C4C08();
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

uint64_t sub_2248AD394(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2248AD42C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2248AD60C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2248AD60C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2248AD42C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2248AD5A4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2248C4AF8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2248C4BB8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2248C4868();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2248C4C08();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2248C4BB8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2248AD5A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07770);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2248AD60C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07770);
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
  size_t v13 = a4 + 32;
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
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

unint64_t sub_2248AD75C(uint64_t a1)
{
  sub_2248C4CD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
  sub_2248C47C8();
  type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  swift_bridgeObjectRetain();
  sub_2248C4838();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_2248C4D08();
  return sub_2248ADA2C(a1, v2);
}

unint64_t sub_2248AD83C(uint64_t a1, uint64_t a2)
{
  sub_2248C4CD8();
  sub_2248C4838();
  uint64_t v4 = sub_2248C4D08();
  return sub_2248ADC04(a1, a2, v4);
}

unint64_t sub_2248AD8B4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
  uint64_t v2 = sub_2248C47B8();
  return sub_2248ADCE8(a1, v2);
}

unint64_t sub_2248AD94C()
{
  unint64_t result = qword_268093950;
  if (!qword_268093950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268093950);
  }
  return result;
}

uint64_t sub_2248AD9A0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2248AD9E8(uint64_t a1)
{
  uint64_t v2 = sub_2248C4A88();
  return sub_2248ADEA0(a1, v2);
}

unint64_t sub_2248ADA2C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x270FA5388]();
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_2248B95B0(*(void *)(v2 + 48) + v10 * v12, (uint64_t)v8, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      sub_2248B040C();
      sub_2248B0460();
      if (sub_2248C45E8())
      {
        uint64_t v13 = *(int *)(v5 + 20);
        uint64_t v14 = *(void *)&v8[v13];
        uint64_t v15 = *(void *)&v8[v13 + 8];
        uint64_t v16 = (void *)(a1 + v13);
        BOOL v17 = v14 == *v16 && v15 == v16[1];
        if (v17 || (sub_2248C4C28() & 1) != 0) {
          break;
        }
      }
      sub_2248B9618((uint64_t)v8, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_2248B9618((uint64_t)v8, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  }
  return v10;
}

unint64_t sub_2248ADC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2248C4C28() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2248C4C28() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2248ADCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_2248BA0BC(&qword_26AC07430, &qword_26AC075D8);
      char v15 = sub_2248C47E8();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_2248ADEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2248B9DD4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A619590](v9, a1);
      sub_2248B9D30((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2248ADF68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2248AD83C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2248B0C4C();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_2248C43C8();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_2248AF960(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_2248C43C8();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_2248AE110(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_2248AD8B4(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2248B1358((uint64_t *)&unk_26AC07748);
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_2248AFB70(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2248AE214(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_2248C43C8();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  os_log_type_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093C68);
  int v47 = a2;
  uint64_t v8 = sub_2248C4BE8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  unint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  unint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    int v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    char v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_2248C4CD8();
    sub_2248C4838();
    uint64_t result = sub_2248C4D08();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  int v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

uint64_t sub_2248AE5FC(uint64_t a1, char a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_2248C4BE8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  char v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_2248C4CD8();
    sub_2248C4838();
    uint64_t result = sub_2248C4D08();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v4 = v36;
  int v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_2248AE908(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB8);
  int v45 = a2;
  uint64_t v10 = sub_2248C4BE8();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  char v39 = v2;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  unint64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v44 = v6;
  unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v17 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = v41;
    unint64_t v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v25 = v41[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            unint64_t v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v44 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v45)
    {
      (*v16)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
    }
    else
    {
      (*v42)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
      swift_bridgeObjectRetain();
    }
    sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
    uint64_t result = sub_2248C47B8();
    uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 48) + v27 * v20, v8, v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v20) = v29;
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v11;
  return result;
}

uint64_t sub_2248AED20(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  int v47 = a2;
  uint64_t v12 = sub_2248C4BE8();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  int64_t v43 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v41 = v3;
  int64_t v42 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v46 = v8;
  unint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v42) {
      break;
    }
    int64_t v26 = v43;
    unint64_t v27 = v43[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v27 = v43[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v43[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v42) {
              goto LABEL_34;
            }
            unint64_t v27 = v43[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v46 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v47)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(*(void *)(v11 + 56) + 8 * v24);
    }
    else
    {
      (*v44)(v10, v30, v7);
      uint64_t v31 = *(void *)(*(void *)(v11 + 56) + 8 * v24);
      swift_retain();
    }
    sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
    uint64_t result = sub_2248C47B8();
    uint64_t v32 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)(v19 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v33) & ~*(void *)(v19 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v19 + 8 * v34);
      }
      while (v38 == -1);
      unint64_t v22 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v18)(*(void *)(v13 + 48) + v29 * v22, v10, v7);
    *(void *)(*(void *)(v13 + 56) + 8 * v22) = v31;
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v5 = v41;
  int64_t v26 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v39 = 1 << *(unsigned char *)(v11 + 32);
  if (v39 >= 64) {
    bzero(v26, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v26 = -1 << v39;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v5 = v13;
  return result;
}

uint64_t sub_2248AF13C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v46 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093BB0);
  int v45 = a2;
  uint64_t v11 = sub_2248C4BE8();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v41 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v17 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = v41;
    unint64_t v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v25 = v41[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            unint64_t v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v16 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v43 + 72);
    uint64_t v28 = *(void *)(v10 + 48) + v27 * v22;
    if (v45)
    {
      sub_2248B9E38(v28, (uint64_t)v9, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      uint64_t v29 = *(void *)(v42 + 72);
      sub_2248B9E38(*(void *)(v10 + 56) + v29 * v22, v46, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    }
    else
    {
      sub_2248B95B0(v28, (uint64_t)v9, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      uint64_t v29 = *(void *)(v42 + 72);
      sub_2248B95B0(*(void *)(v10 + 56) + v29 * v22, v46, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    }
    sub_2248C4CD8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
    sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
    sub_2248C47C8();
    swift_bridgeObjectRetain();
    sub_2248C4838();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2248C4D08();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    sub_2248B9E38((uint64_t)v9, *(void *)(v12 + 48) + v20 * v27, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    uint64_t result = sub_2248B9E38(v46, *(void *)(v12 + 56) + v20 * v29, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v10 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v37;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v12;
  return result;
}

uint64_t sub_2248AF660(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B98);
  uint64_t v6 = sub_2248C4BE8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_2248B9820(v24, v35);
      }
      else
      {
        sub_2248B9678((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2248C4CD8();
      sub_2248C4838();
      uint64_t result = sub_2248C4D08();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_2248B9820(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_2248AF960(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2248C4A78();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_2248C4CD8();
        swift_bridgeObjectRetain();
        sub_2248C4838();
        uint64_t v9 = sub_2248C4D08();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        int64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_2248C43C8() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    int64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *int64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2248AFB70(int64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_2248C4A78();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      int64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
        uint64_t v17 = sub_2248C47B8();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            BOOL v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2248AFE60(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  uint64_t v3 = *(void *)(v35 - 8);
  unint64_t result = MEMORY[0x270FA5388](v35);
  uint64_t v34 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + 64;
  uint64_t v8 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v9 = (v5 + 1) & ~v8;
  if (((1 << v9) & *(void *)(a2 + 64 + 8 * (v9 >> 6))) != 0)
  {
    uint64_t v10 = ~v8;
    int64_t v11 = v5;
    unint64_t result = sub_2248C4A78();
    if ((*(void *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      unint64_t v12 = (result + 1) & v10;
      uint64_t v13 = *(void *)(v3 + 72);
      uint64_t v32 = v13;
      uint64_t v33 = a2 + 64;
      do
      {
        int64_t v14 = v9 * v13;
        uint64_t v15 = v34;
        sub_2248B95B0(*(void *)(a2 + 48) + v9 * v13, v34, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_2248C4CD8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
        sub_2248BA0BC((unint64_t *)&unk_26AC07420, &qword_26AC075D8);
        sub_2248C47C8();
        swift_bridgeObjectRetain();
        sub_2248C4838();
        swift_bridgeObjectRelease();
        uint64_t v16 = sub_2248C4D08();
        unint64_t result = sub_2248B9618(v15, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        unint64_t v17 = v16 & v10;
        unint64_t v18 = v11;
        if (v11 >= (uint64_t)v12)
        {
          if (v17 < v12)
          {
            uint64_t v7 = v33;
          }
          else
          {
            uint64_t v7 = v33;
            if (v11 >= (uint64_t)v17) {
              goto LABEL_13;
            }
          }
        }
        else
        {
          uint64_t v7 = v33;
          if (v17 >= v12 || v11 >= (uint64_t)v17)
          {
LABEL_13:
            uint64_t v13 = v32;
            if (v11 * v32 < v14
              || *(void *)(a2 + 48) + v11 * v32 >= (unint64_t)(*(void *)(a2 + 48) + v14 + v32))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v11 * v32 != v14)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = *(void *)(*(void *)(type metadata accessor for SKALocalStatusServer.FailedDelivery(0) - 8) + 72);
            int64_t v21 = v20 * v11;
            unint64_t result = v19 + v20 * v11;
            int64_t v22 = v20 * v9;
            unint64_t v23 = v19 + v20 * v9 + v20;
            if (v21 < v22 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              unint64_t v18 = v9;
            }
            else
            {
              unint64_t v18 = v9;
              if (v21 != v22)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                unint64_t v18 = v9;
              }
            }
            goto LABEL_6;
          }
        }
        uint64_t v13 = v32;
LABEL_6:
        int64_t v11 = v18;
        unint64_t v9 = (v9 + 1) & v10;
      }
      while (((*(void *)(v7 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v7 + 8 * ((unint64_t)v11 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << v11) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(v7 + 8 * (v5 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << v5) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2248B0204(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2248AD83C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2248B0C4C();
      goto LABEL_7;
    }
    sub_2248AE214(v15, a4 & 1);
    unint64_t v26 = sub_2248AD83C(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2248C4C58();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_2248C43C8();
    uint64_t v21 = *(void *)(v20 - 8);
    int64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_2248B0988(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2248B0384(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC074B0);
    sub_2248BA0BC(a2, &qword_26AC07400);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2248B040C()
{
  unint64_t result = qword_26AC07578;
  if (!qword_26AC07578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC07578);
  }
  return result;
}

unint64_t sub_2248B0460()
{
  unint64_t result = qword_26AC07570;
  if (!qword_26AC07570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC07570);
  }
  return result;
}

uint64_t sub_2248B04B4(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v6 = (void **)v4;
  uint64_t v27 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_2248AD8B4(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v6;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];
      uint64_t result = swift_release();
      *(void *)(v22 + 8 * v15) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_2248B1358(a4);
    goto LABEL_7;
  }
  sub_2248AED20(v18, a3 & 1, a4);
  unint64_t v24 = sub_2248AD8B4(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_2248C4C58();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = *v6;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  return sub_2248B0A38(v15, (uint64_t)v12, v27, v21);
}

uint64_t sub_2248B0674(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_2248AD75C(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_2248B15F4();
      goto LABEL_7;
    }
    sub_2248AF13C(v16, a3 & 1);
    unint64_t v23 = sub_2248AD75C(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      char v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      sub_2248B95B0(a2, (uint64_t)v10, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      return sub_2248B0AF4(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = sub_2248C4C58();
    __break(1u);
    return result;
  }
LABEL_7:
  char v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = v19[7];
  uint64_t v21 = v20
      + *(void *)(*(void *)(type metadata accessor for SKALocalStatusServer.FailedDelivery(0) - 8) + 72) * v13;
  return sub_2248B9EA4(a1, v21);
}

_OWORD *sub_2248B0834(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2248AD83C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2248B1924();
      goto LABEL_7;
    }
    sub_2248AF660(v15, a4 & 1);
    unint64_t v21 = sub_2248AD83C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_2248C4C58();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_2248B9820(a1, v19);
  }
LABEL_13:
  sub_2248B0BE0(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_2248B0988(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_2248C43C8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_2248B0A38(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_2248B0AF4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  sub_2248B9E38(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  uint64_t result = sub_2248B9E38(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, type metadata accessor for SKALocalStatusServer.FailedDelivery);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

_OWORD *sub_2248B0BE0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_2248B9820(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_2248B0C4C()
{
  uint64_t v35 = sub_2248C43C8();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093C68);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_2248C4BD8();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *unint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_2248B0F10(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2248C4BD8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2248B10BC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093CB8);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2248C4BD8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2248B1358(uint64_t *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  int64_t v25 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = sub_2248C4BD8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v25 = v9;
    return result;
  }
  id result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 64);
  uint64_t v26 = v7 + 64;
  int64_t v27 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v28 = v4 + 32;
  uint64_t v29 = v4 + 16;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v27) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v21);
    ++v12;
    if (!v22)
    {
      int64_t v12 = v21 + 1;
      if (v21 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v26 + 8 * v12);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v4 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v18, v3);
    uint64_t v19 = 8 * v17;
    uint64_t v20 = *(void *)(*(void *)(v7 + 56) + 8 * v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v18, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v19) = v20;
    id result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v27) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v26 + 8 * v23);
  if (v22)
  {
    int64_t v12 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v12 >= v27) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v12);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2248B15F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  uint64_t v30 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093BB0);
  uint64_t v8 = *v0;
  uint64_t v9 = sub_2248C4BD8();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 16);
  if (!v11)
  {
    id result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v10;
    return result;
  }
  uint64_t v28 = v1;
  id result = (void *)(v9 + 64);
  uint64_t v13 = v8 + 64;
  unint64_t v14 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v13 + 8 * v14)
  {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v14);
    uint64_t v11 = *(void *)(v8 + 16);
  }
  int64_t v15 = 0;
  *(void *)(v10 + 16) = v11;
  uint64_t v16 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v8 + 64);
  int64_t v19 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v20 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v21 = v20 | (v15 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v19) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v13 + 8 * v24);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v24 + 1;
      if (v24 + 1 >= v19) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v13 + 8 * v15);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v18 = (v25 - 1) & v25;
    unint64_t v21 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v29 + 72) * v21;
    sub_2248B95B0(*(void *)(v8 + 48) + v22, (uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    unint64_t v23 = *(void *)(v30 + 72) * v21;
    sub_2248B95B0(*(void *)(v8 + 56) + v23, (uint64_t)v4, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_2248B9E38((uint64_t)v7, *(void *)(v10 + 48) + v22, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    id result = (void *)sub_2248B9E38((uint64_t)v4, *(void *)(v10 + 56) + v23, type metadata accessor for SKALocalStatusServer.FailedDelivery);
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v19)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v28;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v13 + 8 * v26);
  if (v25)
  {
    int64_t v15 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v15 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v15 >= v19) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v13 + 8 * v15);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2248B1924()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2248C4BD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_2248B9678(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_2248B9820(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2248B1B0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_2248C4CD8();
  sub_2248C4CE8();
  uint64_t v6 = sub_2248C4D08();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_2248B43CC(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_2248B1C2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2248C4CD8();
  sub_2248C4CF8();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_2248C4838();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = sub_2248C4D08();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_2248B451C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v20;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  uint64_t v11 = ~v9;
  uint64_t v12 = *(void *)(v7 + 48);
  while (1)
  {
    uint64_t v13 = (void *)(v12 + 16 * v10);
    uint64_t v14 = v13[1];
    if (v14) {
      break;
    }
    if (!a3) {
      goto LABEL_15;
    }
LABEL_6:
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (!a3) {
    goto LABEL_6;
  }
  BOOL v15 = *v13 == a2 && v14 == a3;
  if (!v15 && (sub_2248C4C28() & 1) == 0) {
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v16 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
  uint64_t v17 = v16[1];
  *a1 = *v16;
  a1[1] = v17;
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_2248B1DF8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2248C4CD8();
  swift_bridgeObjectRetain();
  sub_2248C4838();
  uint64_t v8 = sub_2248C4D08();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2248C4C28() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2248C4C28() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2248B46D4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2248B1FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_2248C4CD8();
  swift_bridgeObjectRetain();
  sub_2248C4838();
  uint64_t v6 = sub_2248C4D08();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_2248C4C28() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_2248C4C28() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2248B2FB4();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_2248B4204(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2248B2138(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_2248AC9F4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B228C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x22A619610](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2248B4870(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_2248C48C8();
}

void *sub_2248B2458(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093BC0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2248B4BDC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2248B9E30();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

size_t sub_2248B2540(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07758);
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8) - 8);
      uint64_t v10 = sub_2248B4DDC(&v11, (uint64_t)v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v1, a1);
      swift_bridgeObjectRetain();
      sub_2248B9E30();
      if (v10 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2248B26D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2248B2734(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2248B26F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2248B28C0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_2248B2714(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2248B2A2C(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2248B2734(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093C80);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07498);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B28C0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268093BC0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B2A2C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093C30);
  uint64_t v10 = *(void *)(sub_2248C43C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2248C43C8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

void *sub_2248B2C6C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07530);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2248C4AB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2248B2E04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093D50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2248C4AB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2248B2FB4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2248C4AB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2248B3168()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07530);
  uint64_t result = sub_2248C4AC8();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_2248C4CD8();
    sub_2248C4CE8();
    uint64_t result = sub_2248C4D08();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2248B33E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093D50);
  uint64_t v3 = sub_2248C4AC8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_37:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_2248C4CD8();
    sub_2248C4CF8();
    if (v20)
    {
      swift_bridgeObjectRetain_n();
      sub_2248C4838();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_2248C4D08();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v21;
    v13[1] = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_35:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_37;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2248B36BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B48);
  uint64_t v3 = sub_2248C4AC8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2248C4CD8();
    swift_bridgeObjectRetain();
    sub_2248C4838();
    uint64_t result = sub_2248C4D08();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2248B396C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07530);
  uint64_t result = sub_2248C4AC8();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_2248C4CD8();
      sub_2248C4CE8();
      uint64_t result = sub_2248C4D08();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2248B3C18()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093D50);
  uint64_t v3 = sub_2248C4AC8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_35;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_35;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_35;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_35:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_41;
                  }
                  if (v11 >= v8) {
                    goto LABEL_35;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      sub_2248C4CD8();
      sub_2248C4CF8();
      if (v20)
      {
        swift_bridgeObjectRetain();
        sub_2248C4838();
        swift_bridgeObjectRelease();
      }
      uint64_t result = sub_2248C4D08();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v21;
      v13[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2248B3F24()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268093B48);
  uint64_t v3 = sub_2248C4AC8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2248C4CD8();
      sub_2248C4838();
      uint64_t result = sub_2248C4D08();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_2248B4204(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2248C4A78();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2248C4CD8();
        swift_bridgeObjectRetain();
        sub_2248C4838();
        uint64_t v10 = sub_2248C4D08();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *unint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2248B43CC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2248B396C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_2248B2C6C();
      goto LABEL_14;
    }
    sub_2248B3168();
  }
  uint64_t v8 = *v3;
  sub_2248C4CD8();
  sub_2248C4CE8();
  uint64_t result = sub_2248C4D08();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for IDSDeviceType();
      uint64_t result = sub_2248C4C48();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_2248B451C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2248B3C18();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2248B2E04();
      goto LABEL_22;
    }
    sub_2248B33E4();
  }
  uint64_t v11 = *v4;
  sub_2248C4CD8();
  sub_2248C4CF8();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2248C4838();
    swift_bridgeObjectRelease();
  }
  uint64_t result = sub_2248C4D08();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v11 + 48);
    do
    {
      BOOL v16 = (void *)(v15 + 16 * a3);
      uint64_t v17 = v16[1];
      if (v17)
      {
        if (a2)
        {
          BOOL v18 = *v16 == v8 && v17 == a2;
          if (v18 || (uint64_t result = sub_2248C4C28(), (result & 1) != 0))
          {
LABEL_21:
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07498);
            uint64_t result = sub_2248C4C48();
            __break(1u);
            break;
          }
        }
      }
      else if (!a2)
      {
        goto LABEL_21;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_22:
  uint64_t v19 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v20 = (uint64_t *)(*(void *)(v19 + 48) + 16 * a3);
  *uint64_t v20 = v8;
  v20[1] = a2;
  uint64_t v21 = *(void *)(v19 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v23;
  }
  return result;
}

uint64_t sub_2248B46D4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2248B3F24();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2248B2FB4();
      goto LABEL_22;
    }
    sub_2248B36BC();
  }
  uint64_t v11 = *v4;
  sub_2248C4CD8();
  sub_2248C4838();
  uint64_t result = sub_2248C4D08();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2248C4C28(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2248C4C48();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        BOOL v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_2248C4C28();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_2248B4870(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2248C4BC8();
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
    uint64_t v10 = sub_2248C4BC8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2248BA0BC(&qword_268093BE0, &qword_268093BD8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268093BD8);
          uint64_t v12 = sub_2248B4AA4(v16, i, a3);
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
    sub_2248BA1D4(0, (unint64_t *)&unk_26AC07718);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

void (*sub_2248B4AA4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2248B4B54(v6, a2, a3);
  return sub_2248B4B0C;
}

void sub_2248B4B0C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2248B4B54(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A619600](a2, a3);
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
    *(void *)uint64_t v3 = v4;
    return sub_2248B4BD4;
  }
  __break(1u);
  return result;
}

void sub_2248B4BD4(id *a1)
{
}

uint64_t sub_2248B4BDC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2248B4DDC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2248B5128(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_2248B51B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_2248ABD5C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_2248B5288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2248C42A8();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_2248C42C8();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_2248C42B8();
  sub_2248ABD5C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_2248B5340(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x2248B55A8);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_2248B9CD8(a3, a4);
                  sub_2248B9CD8(a1, a2);
                  char v17 = sub_2248B5288((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_2248B7CF0(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_2248B9CD8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_2248B5288(v21, v22, v20, a3, a4);
                  sub_2248B7CF0(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_2248B9CD8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_2248B9CD8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_2248B51B0(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_2248B7CF0(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2248B55D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2248C4988();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2248B1DF8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2248B5670(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC07498);
  sub_2248BAB14();
  uint64_t result = sub_2248C4988();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2248B1C2C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2248B5714(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B5808(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_2248C4848();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_2248B58A4(uint64_t a1, uint64_t a2)
{
  uint64_t v132 = sub_2248C4758();
  uint64_t v131 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132);
  id v129 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_2248C4778();
  uint64_t v128 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  unint64_t v127 = (char *)&v112 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v123 = (char *)&v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v122 = (char *)&v112 - v9;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v126 = *(void *)(v134 - 8);
  uint64_t v10 = *(void *)(v126 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v134);
  uint64_t v124 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v133 = (char *)&v112 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC07468);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_2248C4678();
  uint64_t v147 = *(void *)(v136 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v136);
  uint64_t v18 = (char *)&v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v135 = (char *)&v112 - v19;
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_2248C46A8();
  __swift_project_value_buffer(v20, (uint64_t)qword_26AC07D28);
  uint64_t v21 = sub_2248C4698();
  os_log_type_t v22 = sub_2248C49C8();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v23 = 0;
    _os_log_impl(&dword_22480C000, v21, v22, "Receive local status START", v23, 2u);
    MEMORY[0x22A61A430](v23, -1, -1);
  }

  if (!a2)
  {
    uint64_t v29 = sub_2248C4698();
    os_log_type_t v30 = sub_2248C49B8();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_22480C000, v29, v30, "Receive local status FAILED. Missing options", v31, 2u);
      MEMORY[0x22A61A430](v31, -1, -1);
    }

    uint64_t v32 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    uint64_t v34 = v33;
    unint64_t v35 = 0x736E6F6974706FLL;
    unint64_t v36 = 0xE700000000000000;
    goto LABEL_25;
  }
  *(void *)&long long v144 = sub_2248C4808();
  *((void *)&v144 + 1) = v24;
  sub_2248C4AA8();
  if (*(void *)(a2 + 16) && (unint64_t v25 = sub_2248AD9E8((uint64_t)aBlock), (v26 & 1) != 0))
  {
    sub_2248B9678(*(void *)(a2 + 56) + 32 * v25, (uint64_t)&v144);
  }
  else
  {
    long long v144 = 0u;
    long long v145 = 0u;
  }
  sub_2248B9D30((uint64_t)aBlock);
  if (!*((void *)&v145 + 1))
  {
    sub_2248BA318((uint64_t)&v144, &qword_268093B58);
    uint64_t v39 = sub_2248C4698();
    os_log_type_t v40 = sub_2248C49B8();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_22480C000, v39, v40, "Receive local status FAILED. Missing idsID", v41, 2u);
      MEMORY[0x22A61A430](v41, -1, -1);
    }

    uint64_t v32 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    uint64_t v34 = v33;
    unint64_t v35 = 0xD000000000000022;
    unint64_t v36 = 0x80000002248CF260;
LABEL_25:
    *int64_t v33 = v35;
    v33[1] = v36;
    (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F526C0], v32);
    return swift_willThrow();
  }
  sub_2248B9820(&v144, &v146);
  *(void *)&long long v142 = 0x656D614E79656BLL;
  *((void *)&v142 + 1) = 0xE700000000000000;
  sub_2248C4AA8();
  if (*(void *)(a1 + 16) && (unint64_t v27 = sub_2248AD9E8((uint64_t)aBlock), (v28 & 1) != 0))
  {
    sub_2248B9678(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v142);
  }
  else
  {
    long long v142 = 0u;
    long long v143 = 0u;
  }
  sub_2248B9D30((uint64_t)aBlock);
  if (!*((void *)&v143 + 1))
  {
    sub_2248BA318((uint64_t)&v142, &qword_268093B58);
    uint64_t v52 = sub_2248C4698();
    os_log_type_t v53 = sub_2248C49B8();
    if (os_log_type_enabled(v52, v53))
    {
      id v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v54 = 0;
      _os_log_impl(&dword_22480C000, v52, v53, "Receive local status FAILED. Missing keyName", v54, 2u);
      MEMORY[0x22A61A430](v54, -1, -1);
    }

    uint64_t v55 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    *uint64_t v56 = 0xD000000000000010;
    v56[1] = 0x80000002248CF290;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v55 - 8) + 104))(v56, *MEMORY[0x263F526C0], v55);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v146);
  }
  sub_2248B9820(&v142, &v144);
  *(void *)&long long v140 = 0x69616D6F4479656BLL;
  *((void *)&v140 + 1) = 0xE90000000000006ELL;
  sub_2248C4AA8();
  if (*(void *)(a1 + 16) && (unint64_t v37 = sub_2248AD9E8((uint64_t)aBlock), (v38 & 1) != 0))
  {
    sub_2248B9678(*(void *)(a1 + 56) + 32 * v37, (uint64_t)&v140);
  }
  else
  {
    long long v140 = 0u;
    long long v141 = 0u;
  }
  sub_2248B9D30((uint64_t)aBlock);
  if (!*((void *)&v141 + 1))
  {
    sub_2248BA318((uint64_t)&v140, &qword_268093B58);
    unint64_t v57 = sub_2248C4698();
    os_log_type_t v58 = sub_2248C49B8();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_22480C000, v57, v58, "Receive local status FAILED. Missing keyDomain", v59, 2u);
      MEMORY[0x22A61A430](v59, -1, -1);
    }

    uint64_t v60 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    *uint64_t v61 = 0xD000000000000012;
    v61[1] = 0x80000002248CF2B0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v60 - 8) + 104))(v61, *MEMORY[0x263F526C0], v60);
    swift_willThrow();
    goto LABEL_49;
  }
  sub_2248B9820(&v140, &v142);
  sub_2248B9678((uint64_t)&v146, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    uint64_t v62 = sub_2248C4698();
    os_log_type_t v63 = sub_2248C49B8();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_22480C000, v62, v63, "Receive local status FAILEd. Could not cast anyIDSIdentifier", v64, 2u);
      MEMORY[0x22A61A430](v64, -1, -1);
    }

    uint64_t v65 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    unint64_t v67 = v66;
    unint64_t v68 = 0xD000000000000015;
    unint64_t v69 = "cast anyIDSIdentifier";
    goto LABEL_43;
  }
  long long v43 = v140;
  sub_2248B9678((uint64_t)&v144, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    unint64_t v71 = sub_2248C4698();
    os_log_type_t v72 = sub_2248C49B8();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v73 = 0;
      _os_log_impl(&dword_22480C000, v71, v72, "Receive local status FAILED. Could not cast anyKeyName", v73, 2u);
      MEMORY[0x22A61A430](v73, -1, -1);
    }

    uint64_t v65 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    unint64_t v67 = v66;
    unint64_t v68 = 0x796E612074736163;
    unint64_t v70 = 0xEF656D614E79654BLL;
    goto LABEL_47;
  }
  uint64_t v44 = *((void *)&v140 + 1);
  uint64_t v121 = v140;
  sub_2248B9678((uint64_t)&v142, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v74 = sub_2248C4698();
    os_log_type_t v75 = sub_2248C49B8();
    if (os_log_type_enabled(v74, v75))
    {
      char v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v76 = 0;
      _os_log_impl(&dword_22480C000, v74, v75, "Receive local status FAILED. Could not cast anyKeyDomain", v76, 2u);
      MEMORY[0x22A61A430](v76, -1, -1);
    }

    uint64_t v65 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    unint64_t v67 = v66;
    unint64_t v68 = 0xD000000000000011;
    unint64_t v69 = "cast anyKeyDomain";
LABEL_43:
    unint64_t v70 = (unint64_t)(v69 - 32) | 0x8000000000000000;
LABEL_47:
    *id v66 = v68;
    v66[1] = v70;
    (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v65 - 8) + 104))(v67, *MEMORY[0x263F526B8], v65);
    swift_willThrow();
LABEL_48:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v142);
LABEL_49:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v144);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v146);
  }
  uint64_t v119 = v44;
  uint64_t v120 = *((void *)&v43 + 1);
  uint64_t v118 = v43;
  long long v45 = v140;
  swift_bridgeObjectRetain();
  uint64_t v117 = v45;
  sub_2248C4658();
  uint64_t v46 = v147;
  uint64_t v47 = v136;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v147 + 48))(v15, 1, v136) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2248BA318((uint64_t)v15, &qword_26AC07468);
    swift_bridgeObjectRetain();
    os_log_type_t v48 = sub_2248C4698();
    os_log_type_t v49 = sub_2248C49A8();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      aBlock[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v140 = sub_2248AD104(v117, *((unint64_t *)&v45 + 1), aBlock);
      sub_2248C4A28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22480C000, v48, v49, "Receive local status FAILED. Unknown domain %s.", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A61A430](v51, -1, -1);
      MEMORY[0x22A61A430](v50, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v65 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    swift_allocError();
    unint64_t v67 = v66;
    unint64_t v68 = 0x206E776F6E6B6E75;
    unint64_t v70 = 0xEE006E69616D6F64;
    goto LABEL_47;
  }
  uint64_t v115 = *((void *)&v45 + 1);
  uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
  uint64_t v78 = v135;
  v77(v135, v15, v47);
  *(void *)&long long v138 = 0x64616F6C796170;
  *((void *)&v138 + 1) = 0xE700000000000000;
  sub_2248C4AA8();
  if (*(void *)(a1 + 16))
  {
    unint64_t v79 = sub_2248AD9E8((uint64_t)aBlock);
    if (v80)
    {
      sub_2248B9678(*(void *)(a1 + 56) + 32 * v79, (uint64_t)&v138);
    }
    else
    {
      long long v138 = 0u;
      long long v139 = 0u;
    }
    uint64_t v47 = v136;
  }
  else
  {
    long long v138 = 0u;
    long long v139 = 0u;
  }
  uint64_t v81 = v147;
  sub_2248B9D30((uint64_t)aBlock);
  if (*((void *)&v139 + 1))
  {
    sub_2248B9820(&v138, &v140);
    sub_2248B9678((uint64_t)&v140, (uint64_t)aBlock);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v107 = sub_2248C4698();
      os_log_type_t v108 = sub_2248C49B8();
      if (os_log_type_enabled(v107, v108))
      {
        uint64_t v109 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v109 = 0;
        _os_log_impl(&dword_22480C000, v107, v108, "Receive local status FAILED. Could not cast anyPayload", v109, 2u);
        MEMORY[0x22A61A430](v109, -1, -1);
      }

      uint64_t v110 = sub_2248C4648();
      sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
      swift_allocError();
      *uint64_t v111 = 0x796E612074736163;
      v111[1] = 0xEF64616F6C796150;
      (*(void (**)(void *, void, uint64_t))(*(void *)(v110 - 8) + 104))(v111, *MEMORY[0x263F526B8], v110);
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v140);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v78, v136);
      goto LABEL_48;
    }
    unint64_t v116 = *((void *)&v138 + 1);
    uint64_t v82 = v138;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v140);
  }
  else
  {
    sub_2248BA318((uint64_t)&v138, &qword_268093B58);
    uint64_t v82 = 0;
    unint64_t v116 = 0xF000000000000000;
  }
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v18, v78, v47);
  sub_2248B040C();
  sub_2248B0460();
  uint64_t v83 = v119;
  swift_bridgeObjectRetain();
  unint64_t v84 = v133;
  sub_2248C4618();
  unint64_t v85 = v84;
  uint64_t v113 = sub_2248C45F8();
  uint64_t v87 = v86;
  uint64_t v88 = (uint64_t)v122;
  sub_2248C43A8();
  uint64_t v89 = (uint64_t)v123;
  sub_2248C43A8();
  id v90 = objc_allocWithZone((Class)SKADatabaseSubscribedLocalStatus);
  unint64_t v91 = v116;
  sub_2248BA100(v82, v116);
  uint64_t v92 = v82;
  uint64_t v114 = v82;
  uint64_t v93 = v120;
  swift_bridgeObjectRetain();
  id v94 = sub_2248AB8C4(v113, v87, v88, v89, v121, v83, v117, v115, v92, v91);
  uint64_t v95 = v125;
  uint64_t v123 = *(char **)(v125 + 144);
  uint64_t v96 = v126;
  uint64_t v97 = v124;
  uint64_t v98 = v85;
  uint64_t v99 = v134;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v124, v98, v134);
  unint64_t v100 = (*(unsigned __int8 *)(v96 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
  id v101 = (char *)swift_allocObject();
  *((void *)v101 + 2) = v94;
  *((void *)v101 + 3) = v95;
  *((void *)v101 + 4) = v118;
  *((void *)v101 + 5) = v93;
  (*(void (**)(char *, char *, uint64_t))(v96 + 32))(&v101[v100], v97, v99);
  aBlock[4] = (uint64_t)sub_2248BA6AC;
  aBlock[5] = (uint64_t)v101;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_224885AAC;
  aBlock[3] = (uint64_t)&block_descriptor_123;
  uint64_t v102 = _Block_copy(aBlock);
  id v103 = v94;
  swift_retain();
  uint64_t v104 = v127;
  sub_2248C4768();
  *(void *)&long long v140 = MEMORY[0x263F8EE78];
  sub_2248AD9A0(&qword_268093B60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B68);
  sub_2248BA0BC((unint64_t *)&unk_268093B70, &qword_268093B68);
  uint64_t v105 = v129;
  uint64_t v106 = v132;
  sub_2248C4A68();
  MEMORY[0x22A6194F0](0, v104, v105, v102);
  _Block_release(v102);

  sub_2248B7CDC(v114, v116);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v105, v106);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v104, v130);
  (*(void (**)(char *, uint64_t))(v96 + 8))(v133, v99);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v135, v136);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v142);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v144);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v146);
  return swift_release();
}

uint64_t sub_2248B6FE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC07400) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B7144(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2248C4558() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

void *sub_2248B729C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2248C4BC8();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x22A619600](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_identifier, v22);
        uint64_t v16 = sub_2248C4808();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_2248C4C28();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2248B7444(unint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x22A619600](v3, a1);
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        id v7 = objc_msgSend(v4, sel_idsIdentifier);
        uint64_t v8 = sub_2248C4808();
        uint64_t v10 = v9;

        LOBYTE(v7) = sub_224894944(v8, v10);
        swift_bridgeObjectRelease();
        if (v7)
        {
          sub_2248C4B38();
          sub_2248C4B58();
          sub_2248C4B68();
          sub_2248C4B48();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v12;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_2248C4BC8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2248B75CC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)MEMORY[0x22A619600](v6, a1);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_21;
        }
        uint64_t v10 = v5;
        id v11 = objc_msgSend(v7, sel_idsIdentifier);
        uint64_t v12 = sub_2248C4808();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          sub_2248C4B38();
          sub_2248C4B58();
          sub_2248C4B68();
          sub_2248C4B48();
          goto LABEL_5;
        }
        char v16 = sub_2248C4C28();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_17;
        }

LABEL_5:
        ++v6;
        uint64_t v5 = v10;
        if (v9 == v10) {
          return v19;
        }
      }
      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      uint64_t v5 = sub_2248C4BC8();
      if (!v5) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2248B7788(unint64_t a1, uint64_t a2)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x22A619600](v4, a1);
LABEL_9:
        unint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        id v8 = objc_msgSend(v5, sel_identifier);
        uint64_t v9 = sub_2248C4808();
        uint64_t v11 = v10;

        LOBYTE(v8) = sub_2248942A8(v9, v11, a2);
        swift_bridgeObjectRelease();
        if (v8)
        {
        }
        else
        {
          sub_2248C4B38();
          sub_2248C4B58();
          sub_2248C4B68();
          sub_2248C4B48();
        }
        ++v4;
        if (v7 == v3) {
          return v14;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_2248C4BC8();
      if (!v3) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2248B7910(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268093BD0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2248C4C08();
  __break(1u);
  return result;
}

uint64_t sub_2248B7A20(uint64_t a1)
{
  uint64_t v2 = sub_2248C46A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AC07D40 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26AC07D28);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_bridgeObjectRetain_n();
  unint64_t v7 = sub_2248C4698();
  os_log_type_t v8 = sub_2248C49C8();
  if (!os_log_type_enabled(v7, v8))
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v9 = (uint8_t *)swift_slowAlloc();
  uint64_t result = swift_slowAlloc();
  uint64_t v17 = result;
  *(_DWORD *)uint64_t v9 = 136315138;
  if (a1)
  {
    uint64_t v11 = result;
    v16[0] = v9 + 4;
    uint64_t v12 = swift_bridgeObjectRetain();
    v16[1] = MEMORY[0x263F8EE58] + 8;
    uint64_t v13 = MEMORY[0x22A6193B0](v12);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16[2] = sub_2248AD104(v13, v15, &v17);
    sub_2248C4A28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22480C000, v7, v8, "IDS devices changes: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A61A430](v11, -1, -1);
    MEMORY[0x22A61A430](v9, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  __break(1u);
  return result;
}

void *sub_2248B7C9C(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2248B7CDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2248B7CF0(a1, a2);
  }
  return a1;
}

uint64_t sub_2248B7CF0(uint64_t a1, unint64_t a2)
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

uint64_t sub_2248B7D48()
{
  return sub_2248AD9A0((unint64_t *)&unk_26AC075B8, MEMORY[0x263F525D0]);
}

uint64_t sub_2248B7D90()
{
  return sub_2248AD9A0(qword_2680939A0, MEMORY[0x263F52618]);
}

uint64_t sub_2248B7DD8()
{
  return sub_2248AD9A0((unint64_t *)&unk_26AC07408, MEMORY[0x263F52608]);
}

uint64_t sub_2248B7E20()
{
  return type metadata accessor for SKALocalStatusServer(0);
}

uint64_t type metadata accessor for SKALocalStatusServer(uint64_t a1)
{
  return sub_2248B9028(a1, qword_26AC07D10);
}

void sub_2248B7E48()
{
  sub_2248B7F78();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SKALocalStatusServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SKALocalStatusServer);
}

uint64_t dispatch thunk of SKALocalStatusServer.__allocating_init(idsDeviceProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

void sub_2248B7F78()
{
  if (!qword_26AC07590)
  {
    sub_2248C43F8();
    unint64_t v0 = sub_2248C4A18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC07590);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SKALocalStatusServer.IncomingLocalStatusRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SKALocalStatusServer.IncomingLocalStatusRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for SKALocalStatusServer.IncomingLocalStatusRequest(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SKALocalStatusServer.IncomingLocalStatusRequest()
{
  return &type metadata for SKALocalStatusServer.IncomingLocalStatusRequest;
}

uint64_t destroy for SKALocalStatusServer.BrowseTask(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18StatusKitAgentCore20SKALocalStatusServerC10BrowseTaskVwCP_0(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SKALocalStatusServer.BrowseTask(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SKALocalStatusServer.BrowseTask(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKALocalStatusServer.BrowseTask(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKALocalStatusServer.BrowseTask(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SKALocalStatusServer.BrowseTask()
{
  return &type metadata for SKALocalStatusServer.BrowseTask;
}

uint64_t *sub_2248B83EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2248C43C8();
    os_log_type_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2248B84EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2248C43C8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2248B8590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2248B8640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2248B8704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_2248B87A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2248B885C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2248B8870);
}

uint64_t sub_2248B8870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2248C43C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2248B8934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2248B8948);
}

uint64_t sub_2248B8948(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2248C43C8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SKALocalStatusServer.FailedDelivery(uint64_t a1)
{
  return sub_2248B9028(a1, qword_26AC07CF0);
}

uint64_t sub_2248B8A28()
{
  uint64_t result = sub_2248C43C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2248B8AC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2248B8B9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2248B8C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2248B8CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2248B8D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2248B8DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2248B8E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2248B8E68);
}

uint64_t sub_2248B8E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2248B8F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2248B8F44);
}

uint64_t sub_2248B8F44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(uint64_t a1)
{
  return sub_2248B9028(a1, (uint64_t *)&unk_26AC078C0);
}

uint64_t sub_2248B9028(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2248B9060()
{
  sub_2248B90F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2248B90F4()
{
  if (!qword_26AC07440)
  {
    sub_2248B040C();
    sub_2248B0460();
    unint64_t v0 = sub_2248C4638();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC07440);
    }
  }
}

unint64_t sub_2248B9160()
{
  unint64_t result = qword_268093FE0[0];
  if (!qword_268093FE0[0])
  {
    type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268093FE0);
  }
  return result;
}

void type metadata accessor for IDSDeviceType()
{
  if (!qword_26AC07520)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26AC07520);
    }
  }
}

uint64_t sub_2248B9210()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2248B9268()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_2248BAC98;
  return sub_2248A2B40((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_2248B9324()
{
  uint64_t v1 = sub_2248C43C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2248B9414()
{
  uint64_t v2 = *(void *)(sub_2248C43C8() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v0 + v3;
  double v6 = *(double *)(v0 + v4);
  uint64_t v7 = *(void *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_2248BAC98;
  return sub_2248A4E58(v6, (uint64_t)v8, v9, v10, v5, v7);
}

void *sub_2248B9528(void *result)
{
  if (result)
  {
    id v1 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2248B9568()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2248B95A0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t sub_2248B95B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2248B9618(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2248B9678(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2248B96D4(uint64_t a1)
{
  return sub_2248A8628(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2248B96E0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2248B97B8()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268093B88) - 8);
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_2248A89C0(v2, v3, v4);
}

_OWORD *sub_2248B9820(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2248B9830()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2248B98C4(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  if (a3)
  {
    id v5 = a3;
LABEL_15:
    swift_willThrow();
    goto LABEL_16;
  }
  if (!a1)
  {
    uint64_t v9 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    a3 = (void *)swift_allocError();
    uint64_t v11 = v10;
    unint64_t v12 = 0xE800000000000000;
LABEL_14:
    *uint64_t v10 = 0x65736E6F70736572;
    v10[1] = v12;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F526C0], v9);
    goto LABEL_15;
  }
  *(void *)&long long v18 = 0x73736563637573;
  *((void *)&v18 + 1) = 0xE700000000000000;
  sub_2248C4AA8();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_2248AD9E8((uint64_t)v20), (v7 & 1) != 0))
  {
    sub_2248B9678(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_2248B9D30((uint64_t)v20);
  if (!*((void *)&v19 + 1))
  {
    sub_2248BA318((uint64_t)&v18, &qword_268093B58);
    uint64_t v9 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    a3 = (void *)swift_allocError();
    uint64_t v11 = v10;
    unint64_t v12 = 0xEF73736563637553;
    goto LABEL_14;
  }
  sub_2248B9820(&v18, v21);
  sub_2248B9678((uint64_t)v21, (uint64_t)v20);
  if (swift_dynamicCast())
  {
    if (v18)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
      return sub_2248C4918();
    }
    uint64_t v13 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    a3 = (void *)swift_allocError();
    unint64_t v15 = v14;
    unint64_t v16 = 0xD000000000000022;
    unint64_t v17 = 0x80000002248CEE60;
  }
  else
  {
    uint64_t v13 = sub_2248C4648();
    sub_2248AD9A0(&qword_268093960, MEMORY[0x263F526C8]);
    a3 = (void *)swift_allocError();
    unint64_t v15 = v14;
    unint64_t v16 = 0x796E612074736143;
    unint64_t v17 = 0xEF73736563637553;
  }
  *unint64_t v14 = v16;
  v14[1] = v17;
  (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F526B8], v13);
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_16:
  v20[0] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268093B88);
  return sub_2248C4908();
}

uint64_t sub_2248B9CD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2248B9D30(uint64_t a1)
{
  return a1;
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

uint64_t sub_2248B9DD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2248B9E30()
{
  return swift_release();
}

uint64_t sub_2248B9E38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2248B9EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2248B9F08(void *a1)
{
  return sub_2248A12F8(a1, v1);
}

void sub_2248B9F10(void *a1)
{
  sub_2248A1B1C(a1, v1);
}

uint64_t sub_2248B9F1C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2248BAC98;
  return sub_2248A1EE0((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_2248B9FB4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2248BAC98;
  *(_OWORD *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_2248A1464, v3, 0);
}

unint64_t sub_2248BA060()
{
  unint64_t result = qword_26AC073E8;
  if (!qword_26AC073E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC073E8);
  }
  return result;
}

uint64_t sub_2248BA0BC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2248BA100(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2248B9CD8(a1, a2);
  }
  return a1;
}

uint64_t sub_2248BA118()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_2248BAC98;
  return sub_224888714((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_2248BA1C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2248BA1D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2248BA210(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_2248BA274@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2248A6B54(a1, *(uint64_t **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

unint64_t sub_2248BA2A4()
{
  unint64_t result = qword_268093CC8;
  if (!qword_268093CC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC07400);
    sub_2248BA060();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268093CC8);
  }
  return result;
}

uint64_t sub_2248BA318(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_104Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2248BA3C8()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_2248BAC98;
  return sub_2248860B8((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_2248BA474()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2248BA4AC(uint64_t a1, void *a2, uint64_t a3)
{
  sub_224885FD0(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_2248BA4B4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2248BA50C()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  long long v5 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_2248BAC98;
  *(_OWORD *)(v3 + 280) = v5;
  *(void *)(v3 + 272) = v2;
  *(_OWORD *)(v3 + 256) = v4;
  return MEMORY[0x270FA2498](sub_224885C1C, v4, 0);
}

uint64_t sub_2248BA5CC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2248BA6AC()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8) - 8);
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_2248A9248(v2, v3, v4, v5, v6);
}

uint64_t sub_2248BA718()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2248BA800()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC075D8) - 8);
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = (uint64_t)v0 + ((*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_224883338;
  return sub_2248A944C((uint64_t)v8, v9, v10, v3, v4, v5, v6, v7);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2248BA93C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2248BAC98;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_224885500, v2, 0);
}

uint64_t sub_2248BA9E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t objectdestroy_96Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2248BAA68()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2248BAC98;
  *(_OWORD *)(v2 + 32) = v3;
  return MEMORY[0x270FA2498](sub_2248A81C4, v3, 0);
}

unint64_t sub_2248BAB14()
{
  unint64_t result = qword_26AC074A8;
  if (!qword_26AC074A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AC07498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC074A8);
  }
  return result;
}

uint64_t sub_2248BAB80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
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

uint64_t sub_2248BAC48()
{
  return sub_2248AD9A0(&qword_26AC07518, (void (*)(uint64_t))type metadata accessor for IDSDeviceType);
}

uint64_t SKAError.errorDescription.getter()
{
  if (*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0x7463657078656E75;
  }
  else {
    uint64_t v1 = 543975790;
  }
  uint64_t v3 = v1;
  sub_2248C4858();
  return v3;
}

uint64_t sub_2248BAD7C()
{
  if (*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0x7463657078656E75;
  }
  else {
    uint64_t v1 = 543975790;
  }
  uint64_t v3 = v1;
  sub_2248C4858();
  return v3;
}

uint64_t destroy for SKAError()
{
  return sub_2248BAE08();
}

uint64_t sub_2248BAE08()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18StatusKitAgentCore8SKAErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2248AA20C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SKAError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2248AA20C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2248BAE08();
  return a1;
}

uint64_t assignWithTake for SKAError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2248BAE08();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKAError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SKAError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2248BAF88(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2248BAF90(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SKAError()
{
  return &type metadata for SKAError;
}

uint64_t sub_2248C4298()
{
  return MEMORY[0x270F47938]();
}

uint64_t sub_2248C42A8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2248C42B8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2248C42C8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2248C42D8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2248C42E8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2248C42F8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2248C4308()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2248C4318()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2248C4328()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2248C4338()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2248C4348()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2248C4358()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2248C4368()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2248C4378()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2248C4388()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_2248C4398()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2248C43A8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2248C43B8()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2248C43C8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2248C43D8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2248C43E8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2248C43F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2248C4408()
{
  return MEMORY[0x270F47940]();
}

uint64_t sub_2248C4418()
{
  return MEMORY[0x270F47948]();
}

uint64_t sub_2248C4428()
{
  return MEMORY[0x270F47950]();
}

uint64_t sub_2248C4438()
{
  return MEMORY[0x270F47958]();
}

uint64_t sub_2248C4448()
{
  return MEMORY[0x270F47960]();
}

uint64_t sub_2248C4458()
{
  return MEMORY[0x270F47968]();
}

uint64_t sub_2248C4468()
{
  return MEMORY[0x270F47970]();
}

uint64_t sub_2248C4478()
{
  return MEMORY[0x270F47978]();
}

uint64_t sub_2248C4488()
{
  return MEMORY[0x270F47980]();
}

uint64_t sub_2248C4498()
{
  return MEMORY[0x270F47990]();
}

uint64_t sub_2248C44A8()
{
  return MEMORY[0x270F479B0]();
}

uint64_t sub_2248C44B8()
{
  return MEMORY[0x270F479B8]();
}

uint64_t sub_2248C44C8()
{
  return MEMORY[0x270F479C0]();
}

uint64_t sub_2248C44D8()
{
  return MEMORY[0x270F479C8]();
}

uint64_t sub_2248C44E8()
{
  return MEMORY[0x270F479D0]();
}

uint64_t sub_2248C44F8()
{
  return MEMORY[0x270F479D8]();
}

uint64_t sub_2248C4508()
{
  return MEMORY[0x270F479F0]();
}

uint64_t sub_2248C4518()
{
  return MEMORY[0x270F479F8]();
}

uint64_t sub_2248C4528()
{
  return MEMORY[0x270F47A00]();
}

uint64_t sub_2248C4538()
{
  return MEMORY[0x270F47A08]();
}

uint64_t sub_2248C4548()
{
  return MEMORY[0x270F47A10]();
}

uint64_t sub_2248C4558()
{
  return MEMORY[0x270F47A18]();
}

uint64_t sub_2248C4568()
{
  return MEMORY[0x270F47A20]();
}

uint64_t sub_2248C4578()
{
  return MEMORY[0x270F47A28]();
}

uint64_t sub_2248C4588()
{
  return MEMORY[0x270F47A30]();
}

uint64_t sub_2248C4598()
{
  return MEMORY[0x270F47A38]();
}

uint64_t sub_2248C45A8()
{
  return MEMORY[0x270F47A40]();
}

uint64_t sub_2248C45B8()
{
  return MEMORY[0x270F47A48]();
}

uint64_t sub_2248C45C8()
{
  return MEMORY[0x270F47A50]();
}

uint64_t sub_2248C45D8()
{
  return MEMORY[0x270F47A58]();
}

uint64_t sub_2248C45E8()
{
  return MEMORY[0x270F47A68]();
}

uint64_t sub_2248C45F8()
{
  return MEMORY[0x270F47A70]();
}

uint64_t sub_2248C4608()
{
  return MEMORY[0x270F47A78]();
}

uint64_t sub_2248C4618()
{
  return MEMORY[0x270F47A80]();
}

uint64_t sub_2248C4628()
{
  return MEMORY[0x270F47A88]();
}

uint64_t sub_2248C4638()
{
  return MEMORY[0x270F47A90]();
}

uint64_t sub_2248C4648()
{
  return MEMORY[0x270F47A98]();
}

uint64_t sub_2248C4658()
{
  return MEMORY[0x270F47AA0]();
}

uint64_t sub_2248C4668()
{
  return MEMORY[0x270F47AA8]();
}

uint64_t sub_2248C4678()
{
  return MEMORY[0x270F47AB0]();
}

uint64_t sub_2248C4688()
{
  return MEMORY[0x270F47AB8]();
}

uint64_t sub_2248C4698()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2248C46A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2248C46B8()
{
  return MEMORY[0x270EE3C80]();
}

uint64_t sub_2248C46C8()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_2248C46D8()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_2248C46E8()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_2248C46F8()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_2248C4708()
{
  return MEMORY[0x270F632F8]();
}

uint64_t sub_2248C4718()
{
  return MEMORY[0x270F63300]();
}

uint64_t sub_2248C4728()
{
  return MEMORY[0x270F63308]();
}

uint64_t sub_2248C4738()
{
  return MEMORY[0x270F63310]();
}

uint64_t sub_2248C4758()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2248C4768()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2248C4778()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2248C4788()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2248C4798()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2248C47A8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2248C47B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2248C47C8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2248C47D8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2248C47E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2248C47F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2248C4808()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2248C4818()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2248C4828()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2248C4838()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2248C4848()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2248C4858()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2248C4868()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2248C4888()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2248C4898()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2248C48A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2248C48B8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2248C48C8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2248C48D8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2248C48E8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2248C48F8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2248C4908()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2248C4918()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2248C4928()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2248C4938()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2248C4948()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2248C4968()
{
  return MEMORY[0x270F636A8]();
}

uint64_t sub_2248C4978()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2248C4988()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2248C4998()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2248C49A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2248C49B8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2248C49C8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2248C49D8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2248C49E8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2248C49F8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2248C4A08()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2248C4A18()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2248C4A28()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2248C4A38()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2248C4A48()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_2248C4A58()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_2248C4A68()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2248C4A78()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2248C4A88()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2248C4A98()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2248C4AA8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2248C4AB8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2248C4AC8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2248C4AD8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2248C4AE8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2248C4AF8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2248C4B08()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2248C4B18()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2248C4B28()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2248C4B38()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2248C4B48()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2248C4B58()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2248C4B68()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2248C4B78()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2248C4B88()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2248C4B98()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2248C4BA8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2248C4BB8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2248C4BC8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2248C4BD8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2248C4BE8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2248C4BF8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2248C4C08()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2248C4C18()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2248C4C28()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2248C4C48()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2248C4C58()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2248C4C68()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2248C4C88()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2248C4C98()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2248C4CA8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2248C4CB8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2248C4CC8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2248C4CD8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2248C4CE8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2248C4CF8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2248C4D08()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

uint64_t IDSCopyIDForPseudonymID()
{
  return MEMORY[0x270F3C998]();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return MEMORY[0x270F3C9A0]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x270F3C9B0]();
}

uint64_t IDSCopyTokenAndIDForTokenWithID()
{
  return MEMORY[0x270F3C9B8]();
}

uint64_t IMStringIsPseudonymID()
{
  return MEMORY[0x270F3CE78]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
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

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IDSCopyCallerID()
{
  return MEMORY[0x270F3CA48]();
}

uint64_t _IDSCopyOrderedAliases()
{
  return MEMORY[0x270F3CA70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
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
  return MEMORY[0x270EDC190](object1, object2);
}