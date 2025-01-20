void sub_224D4BB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t SGSM2ContactOpportunityInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2ContactResultInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
        *(unsigned char *)(a1 + 20) |= 1u;
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
        *(unsigned char *)(a1 + 16) = v21 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2ContactResultSelectedInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2EventOpportunityInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2EventResultInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
        *(unsigned char *)(a1 + 20) |= 1u;
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
        *(unsigned char *)(a1 + 16) = v21 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2EventResultSelectedInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2NoResultSelectedInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t SGSM2OtherResultSelectedInSpotlightReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

void sub_224D4EFAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}