void sub_100002E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 fetchInteger];
  }

  return 0;
}

id sub_100002F70(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindInteger:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

id sub_100003098(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = a2;
  [v4 bindInteger:v3];
  [v4 bindInteger:a1[6]];
  [v4 bindString:a1[4]];
  id v5 = [v4 step];

  return v5;
}

void sub_1000031E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000031FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    [v3 fetchDouble];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }

  return 0;
}

id sub_100003314(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindDouble:*(double *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

void sub_1000034B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000034CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000034DC(uint64_t a1)
{
}

uint64_t sub_1000034E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    uint64_t v4 = [v3 fetchString];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 0;
}

id sub_10000361C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindString:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

void sub_1000037BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000037D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindString:*(void *)(a1 + 32)];
  if ([v3 step] == 100)
  {
    uint64_t v4 = [v3 fetchBlob];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 0;
}

id sub_10000390C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3];
  [v4 bindBlob:*(void *)(a1 + 40)];
  id v5 = [v4 step];

  return v5;
}

id sub_100003A14(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 bindString:v2];
  id v4 = [v3 step];

  return v4;
}

uint64_t ABSPBFavoritesEntryReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 80) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_49;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_51:
        uint64_t v29 = 32;
        goto LABEL_60;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 80) |= 1u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v14 |= (unint64_t)(v21 & 0x7F) << v18;
            if (v21 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_55:
        uint64_t v29 = 8;
        goto LABEL_60;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 80) |= 4u;
        break;
      case 4u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 72;
        goto LABEL_47;
      case 5u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 56;
        goto LABEL_47;
      case 6u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 48;
        goto LABEL_47;
      case 7u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 40;
        goto LABEL_47;
      case 8u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 16;
        goto LABEL_47;
      case 9u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 24;
LABEL_47:
        v28 = *(void **)(a1 + v27);
        *(void *)(a1 + v27) = v26;

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
      unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
      v14 |= (unint64_t)(v25 & 0x7F) << v22;
      if ((v25 & 0x80) == 0) {
        goto LABEL_57;
      }
      v22 += 7;
      BOOL v9 = v23++ >= 9;
      if (v9)
      {
        LODWORD(v14) = 0;
        goto LABEL_59;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_57:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v14) = 0;
    }
LABEL_59:
    uint64_t v29 = 64;
LABEL_60:
    *(_DWORD *)(a1 + v29) = v14;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL ABSPBContainerPermissionsReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 12) |= 2u;
        while (1)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
          v15 |= (unint64_t)(v23 & 0x7F) << v20;
          if ((v23 & 0x80) == 0)
          {
            unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateGrouops;
            goto LABEL_47;
          }
          v20 += 7;
          BOOL v18 = v21++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateGrouops;
            goto LABEL_49;
          }
        }
        unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateGrouops;
LABEL_46:
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        goto LABEL_47;
      }
      if (v12 == 2) {
        break;
      }
      if (v12 == 1)
      {
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateContacts;
            goto LABEL_46;
          }
          char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            break;
          }
          v13 += 7;
          BOOL v18 = v14++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateContacts;
            goto LABEL_49;
          }
        }
        unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canCreateContacts;
        goto LABEL_47;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_50:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v15 = 0;
    *(unsigned char *)(a1 + 12) |= 4u;
    while (1)
    {
      unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canDeleteContacts;
        goto LABEL_46;
      }
      char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v15 |= (unint64_t)(v27 & 0x7F) << v24;
      if ((v27 & 0x80) == 0) {
        break;
      }
      v24 += 7;
      BOOL v18 = v25++ > 8;
      if (v18)
      {
        uint64_t v15 = 0;
        unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canDeleteContacts;
        goto LABEL_49;
      }
    }
    unsigned int v19 = &OBJC_IVAR___ABSPBContainerPermissions__canDeleteContacts;
LABEL_47:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v15 = 0;
    }
LABEL_49:
    *(unsigned char *)(a1 + *v19) = v15 != 0;
    goto LABEL_50;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100005874(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(a1 + 16))();
  id v3 = [v2 domain];
  if (v3 == CNErrorDomain)
  {
    unint64_t v4 = 0;
    while ([v2 code] == (id)1 && v4 <= 3)
    {
      usleep(0xF4240u);

      unsigned int v5 = (*(void (**)(uint64_t))(a1 + 16))(a1);

      unint64_t v6 = [v5 domain];
      ++v4;
      uint64_t v2 = v5;
      if (v6 != CNErrorDomain)
      {

        int v7 = v4 + 1;
        goto LABEL_10;
      }
    }

    if (!v4) {
      goto LABEL_13;
    }
    int v7 = v4 + 1;
    unsigned int v5 = v2;
LABEL_10:
    char v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WARNING: Likely contactsd communication breakdown, retries: %d", (uint8_t *)v10, 8u);
    }
    uint64_t v2 = v5;
  }
  else
  {
  }
LABEL_13:

  return v2;
}

uint64_t sub_100006D68(void *a1)
{
  id v1 = a1;
  unsigned __int16 v5 = 0;
  if ([v1 read:&v5 maxLength:2] != (id)2)
  {
    id v4 = +[NSException exceptionWithName:NSInvalidUnarchiveOperationException reason:@"Unable to read tag" userInfo:0];
    objc_exception_throw(v4);
  }
  uint64_t v2 = v5;

  return v2;
}

id sub_100006DE8(void *a1)
{
  id v1 = a1;
  LODWORD(size) = 0;
  if ([v1 read:&size maxLength:4] != (id)4)
  {
    NSExceptionName v8 = NSInvalidUnarchiveOperationException;
    CFStringRef v9 = @"Unable to read string length";
    goto LABEL_15;
  }
  if (size != -1)
  {
    if (size >= 0xF4241)
    {
      NSExceptionName v8 = NSInvalidUnarchiveOperationException;
      CFStringRef v9 = @"String exceeds maximum string length.";
    }
    else
    {
      uint64_t v2 = malloc_type_malloc(size, 0x3DD0D786uLL);
      if (v2)
      {
        id v3 = v2;
        id v4 = [v1 read:v2 maxLength:size];
        if (v4 == (id)size)
        {
          id v5 = objc_alloc((Class)NSString);
          id v6 = [v5 initWithBytesNoCopy:v3 length:size encoding:4 freeWhenDone:1];
          goto LABEL_8;
        }
        NSExceptionName v8 = NSInvalidUnarchiveOperationException;
        CFStringRef v9 = @"Unable to read string contents";
      }
      else
      {
        NSExceptionName v8 = NSInvalidUnarchiveOperationException;
        CFStringRef v9 = @"Cannot allocate space for string.";
      }
    }
LABEL_15:
    id v10 = +[NSException exceptionWithName:v8 reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

id sub_100006F4C(void *a1)
{
  id v1 = a1;
  LODWORD(size) = 0;
  if ([v1 read:&size maxLength:4] != (id)4)
  {
    NSExceptionName v8 = NSInvalidUnarchiveOperationException;
    CFStringRef v9 = @"Unable to read blob length";
    goto LABEL_15;
  }
  if (size != -1)
  {
    if (size >= 0xF4241)
    {
      NSExceptionName v8 = NSInvalidUnarchiveOperationException;
      CFStringRef v9 = @"Blob exceeds maximum length.";
    }
    else
    {
      uint64_t v2 = malloc_type_malloc(size, 0x20F72D86uLL);
      if (v2)
      {
        id v3 = v2;
        id v4 = [v1 read:v2 maxLength:size];
        if (v4 == (id)size)
        {
          id v5 = objc_alloc((Class)NSData);
          id v6 = [v5 initWithBytesNoCopy:v3 length:size freeWhenDone:1];
          goto LABEL_8;
        }
        NSExceptionName v8 = NSInvalidUnarchiveOperationException;
        CFStringRef v9 = @"Unable to read blob contents";
      }
      else
      {
        NSExceptionName v8 = NSInvalidUnarchiveOperationException;
        CFStringRef v9 = @"Cannot allocate space for blob.";
      }
    }
LABEL_15:
    id v10 = +[NSException exceptionWithName:v8 reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

id sub_1000070AC(void *a1)
{
  id v1 = a1;
  unsigned __int8 v10 = 0;
  int v8 = 0;
  int v9 = 0;
  __int16 v7 = 0;
  if ([v1 read:&v10 maxLength:1] != (id)1)
  {
    NSExceptionName v4 = NSInvalidUnarchiveOperationException;
    CFStringRef v5 = @"Unable to read isLeapMonth";
    goto LABEL_22;
  }
  if ([v1 read:&v9 maxLength:4] != (id)4)
  {
    NSExceptionName v4 = NSInvalidUnarchiveOperationException;
    CFStringRef v5 = @"Unable to read era";
    goto LABEL_22;
  }
  if ([v1 read:&v8 maxLength:4] != (id)4)
  {
    NSExceptionName v4 = NSInvalidUnarchiveOperationException;
    CFStringRef v5 = @"Unable to read year";
    goto LABEL_22;
  }
  if ([v1 read:(char *)&v7 + 1 maxLength:1] != (id)1)
  {
    NSExceptionName v4 = NSInvalidUnarchiveOperationException;
    CFStringRef v5 = @"Unable to read month";
    goto LABEL_22;
  }
  if ([v1 read:&v7 maxLength:1] != (id)1)
  {
    NSExceptionName v4 = NSInvalidUnarchiveOperationException;
    CFStringRef v5 = @"Unable to read day";
LABEL_22:
    id v6 = +[NSException exceptionWithName:v4 reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  id v2 = objc_alloc_init((Class)NSDateComponents);
  [v2 setLeapMonth:v10];
  if (v9 != 0x80000000) {
    [v2 setEra:];
  }
  if (v8 != 0x80000000) {
    [v2 setYear:];
  }
  if (SHIBYTE(v7) != -128) {
    [v2 setMonth:];
  }
  if ((char)v7 != -128) {
    [v2 setDay:];
  }

  return v2;
}

uint64_t sub_100007294(void *a1)
{
  id v1 = a1;
  char v5 = 0;
  if ([v1 read:&v5 maxLength:1] != (id)1)
  {
    id v4 = +[NSException exceptionWithName:NSInvalidUnarchiveOperationException reason:@"Unable to read byte" userInfo:0];
    objc_exception_throw(v4);
  }
  uint64_t v2 = v5;

  return v2;
}

__CFString *sub_100007314(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  unsigned __int8 v9 = 104;
  if (qword_100069C30 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_100069C30, &stru_100054D48);
    if (v2)
    {
LABEL_3:
      if ([v2 read:&v9 maxLength:1] == (id)1)
      {
        if (v9 == 254)
        {
          id v4 = @"<<EOB>>";
          goto LABEL_13;
        }
        if (v9 == 255)
        {
          uint64_t v3 = sub_100006DE8(v2);
LABEL_10:
          id v4 = (__CFString *)v3;
          goto LABEL_13;
        }
        if (v9 - 104 > 0xFFFFFF98)
        {
          uint64_t v3 = [(id)qword_100069C18 objectAtIndexedSubscript:v9 - 1];
          goto LABEL_10;
        }
        NSExceptionName v6 = NSInvalidUnarchiveOperationException;
        CFStringRef v7 = @"Invalid byte in canned string.";
      }
      else
      {
        NSExceptionName v6 = NSInvalidUnarchiveOperationException;
        CFStringRef v7 = @"Unable to read canned string tag";
      }
      id v8 = +[NSException exceptionWithName:v6 reason:v7 userInfo:0];
      objc_exception_throw(v8);
    }
  }
  id v4 = 0;
LABEL_13:

  return v4;
}

id sub_100007450()
{
  id v0 = sub_100007314(0);
  id v1 = (void *)qword_100069C18;

  return v1;
}

id sub_10000748C(int a1)
{
  if (qword_100069C20 != -1) {
    dispatch_once(&qword_100069C20, &stru_100054D28);
  }
  uint64_t v2 = (void *)qword_100069C28;

  return [v2 objectAtIndexedSubscript:a1];
}

void sub_1000074F0(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = v1;
  v4[1] = NSCalendarIdentifierGregorian;
  v4[2] = NSCalendarIdentifierBuddhist;
  v4[3] = NSCalendarIdentifierChinese;
  v4[4] = NSCalendarIdentifierCoptic;
  v4[5] = NSCalendarIdentifierEthiopicAmeteMihret;
  v4[6] = NSCalendarIdentifierEthiopicAmeteAlem;
  v4[7] = NSCalendarIdentifierHebrew;
  v4[8] = NSCalendarIdentifierISO8601;
  v4[9] = NSCalendarIdentifierIndian;
  v4[10] = NSCalendarIdentifierIslamic;
  v4[11] = NSCalendarIdentifierIslamicCivil;
  v4[12] = NSCalendarIdentifierJapanese;
  v4[13] = NSCalendarIdentifierPersian;
  v4[14] = NSCalendarIdentifierRepublicOfChina;
  v4[15] = NSCalendarIdentifierIslamicTabular;
  v4[16] = NSCalendarIdentifierIslamicUmmAlQura;
  uint64_t v2 = +[NSArray arrayWithObjects:v4 count:17];
  uint64_t v3 = (void *)qword_100069C28;
  qword_100069C28 = v2;
}

void sub_100007664(id a1)
{
  v3[0] = @"_$!<Anniversary>!$_";
  v3[1] = @"_$!<Assistant>!$_";
  v3[2] = @"_$!<AssistantPhone>!$_";
  v3[3] = @"_$!<Brother>!$_";
  v3[4] = @"_$!<Callback>!$_";
  v3[5] = @"_$!<Car>!$_";
  v3[6] = @"_$!<Child>!$_";
  v3[7] = @"_$!<CompanyMain>!$_";
  v3[8] = @"_$!<EX-Anniversary>!$_";
  v3[9] = @"_$!<EX-AssistantName>!$_";
  v3[10] = @"_$!<EX-AssistantPhone>!$_";
  v3[11] = @"_$!<EX-Birthday>!$_";
  v3[12] = @"_$!<EX-Business>!$_";
  v3[13] = @"_$!<EX-BusinessFax>!$_";
  v3[14] = @"_$!<EX-BusinessHomePage>!$_";
  v3[15] = @"_$!<EX-BusinessPhone2>!$_";
  v3[16] = @"_$!<EX-BusinessPhone>!$_";
  v3[17] = @"_$!<EX-Callback>!$_";
  v3[18] = @"_$!<EX-CarPhone>!$_";
  v3[19] = @"_$!<EX-CompanyMainPhone>!$_";
  v3[20] = @"_$!<EX-EmailAddress1>!$_";
  v3[21] = @"_$!<EX-EmailAddress2>!$_";
  v3[22] = @"_$!<EX-EmailAddress3>!$_";
  v3[23] = @"_$!<EX-Home>!$_";
  v3[24] = @"_$!<EX-HomeFax>!$_";
  v3[25] = @"_$!<EX-HomePhone2>!$_";
  v3[26] = @"_$!<EX-HomePhone>!$_";
  v3[27] = @"_$!<EX-ImAddress1>!$_";
  v3[28] = @"_$!<EX-ImAddress2>!$_";
  v3[29] = @"_$!<EX-ImAddress3>!$_";
  v3[30] = @"_$!<EX-Isdn>!$_";
  v3[31] = @"_$!<EX-Manager>!$_";
  v3[32] = @"_$!<EX-MobilePhone>!$_";
  v3[33] = @"_$!<EX-Other>!$_";
  v3[34] = @"_$!<EX-OtherFax>!$_";
  v3[35] = @"_$!<EX-OtherTelephone>!$_";
  v3[36] = @"_$!<EX-Pager>!$_";
  v3[37] = @"_$!<EX-PrimaryPhone>!$_";
  v3[38] = @"_$!<EX-RadioPhone>!$_";
  v3[39] = @"_$!<EX-SpouseName>!$_";
  v3[40] = @"_$!<EX-Telex>!$_";
  v3[41] = @"_$!<EX-TtyTddPhone>!$_";
  v3[42] = @"_$!<Email>!$_";
  v3[43] = @"_$!<Father>!$_";
  v3[44] = @"_$!<Friend>!$_";
  v3[45] = @"_$!<Home>!$_";
  v3[46] = @"_$!<HomeFAX>!$_";
  v3[47] = @"_$!<HomePage>!$_";
  v3[48] = @"_$!<ISDN>!$_";
  v3[49] = @"_$!<Main>!$_";
  v3[50] = @"_$!<Manager>!$_";
  v3[51] = @"_$!<Mobile>!$_";
  v3[52] = @"_$!<MobileMe>!$_";
  v3[53] = @"_$!<Mother>!$_";
  v3[54] = @"_$!<Note>!$_";
  v3[55] = @"_$!<Other>!$_";
  v3[56] = @"_$!<OtherFAX>!$_";
  v3[57] = @"_$!<Pager>!$_";
  v3[58] = @"_$!<Parent>!$_";
  v3[59] = @"_$!<Partner>!$_";
  v3[60] = @"_$!<Radio>!$_";
  v3[61] = @"_$!<Sister>!$_";
  v3[62] = @"_$!<SocialProfile>!$_";
  v3[63] = @"_$!<Spouse>!$_";
  v3[64] = @"_$!<TTY>!$_";
  v3[65] = @"_$!<Telex>!$_";
  v3[66] = @"_$!<Work>!$_";
  v3[67] = @"_$!<WorkFAX>!$_";
  v3[68] = @"_$!<iCloud>!$_";
  v3[69] = @"_$!<iPhone>!$_";
  v3[70] = @"birthday";
  v3[71] = @"iCloud";
  v3[72] = @"iPhone";
  v3[73] = CNPostalAddressStreetKey;
  v3[74] = CNPostalAddressCityKey;
  v3[75] = CNPostalAddressStateKey;
  v3[76] = CNPostalAddressPostalCodeKey;
  v3[77] = CNPostalAddressCountryKey;
  v3[78] = CNPostalAddressISOCountryCodeKey;
  v3[79] = CNSocialProfileURLStringKey;
  v3[80] = CNSocialProfileUsernameKey;
  v3[81] = CNSocialProfileUserIdentifierKey;
  v3[82] = CNSocialProfileServiceKey;
  v3[83] = CNSocialProfileServiceFacebook;
  v3[84] = CNSocialProfileServiceFlickr;
  v3[85] = CNSocialProfileServiceLinkedIn;
  v3[86] = CNSocialProfileServiceMySpace;
  v3[87] = CNSocialProfileServiceSinaWeibo;
  v3[88] = CNSocialProfileServiceTencentWeibo;
  v3[89] = CNSocialProfileServiceTwitter;
  v3[90] = CNSocialProfileServiceYelp;
  v3[91] = CNSocialProfileServiceGameCenter;
  v3[92] = CNInstantMessageServiceAIM;
  v3[93] = CNInstantMessageServiceGaduGadu;
  v3[94] = CNInstantMessageServiceGoogleTalk;
  v3[95] = CNInstantMessageServiceICQ;
  v3[96] = CNInstantMessageServiceJabber;
  v3[97] = CNInstantMessageServiceMSN;
  v3[98] = CNInstantMessageServiceQQ;
  v3[99] = CNInstantMessageServiceSkype;
  v3[100] = CNInstantMessageServiceYahoo;
  v3[101] = CNPostalAddressSubLocalityKey;
  v3[102] = CNPostalAddressSubAdministrativeAreaKey;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:103];
  uint64_t v2 = (void *)qword_100069C18;
  qword_100069C18 = v1;
}

double sub_100007D40(id a1, double a2)
{
  return 1.0;
}

id sub_100007EFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) source];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 setPending:1];
  }
  else
  {
    [v3 leadingEdgeDelay];
    [*(id *)(a1 + 32) setCurrentDelay:];
    if ([*(id *)(a1 + 32) holdTransaction])
    {
      id v5 = +[NSString stringWithFormat:@"NDTSignalCoaleser<%p>.transaction", *(void *)(a1 + 32)];
      [v5 UTF8String];
      NSExceptionName v6 = (void *)os_transaction_create();
      [*(id *)(a1 + 32) setTransaction:v6];
    }
    CFStringRef v7 = *(void **)(a1 + 32);
    [v7 leadingEdgeDelay];
    return [v7 _setupTimerDelay:1 pending:0];
  }
}

void sub_1000080BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000080D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _cancel];
    [v3 _setupTimerDelay:[v3 pending] delay:*(double *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

id sub_1000081CC(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancel];
  [*(id *)(a1 + 32) setPending:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setTransaction:0];
}

void sub_100008458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008474(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained pending])
  {
    [WeakRetained fireAction];
    uint64_t v1 = [WeakRetained nextDelayCalculator];
    [WeakRetained currentDelay];
    v1[2](v1);
    [WeakRetained setCurrentDelay:];

    [WeakRetained currentDelay];
    [WeakRetained _setupTimerDelay:0 pending:0];
  }
  else
  {
    [WeakRetained setSource:0];
    [WeakRetained setTransaction:0];
  }
}

void sub_100009340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100009398(void *a1, void *a2, unsigned __int8 *a3)
{
  id v5 = a2;
  NSExceptionName v6 = [v5 linkedContacts];
  id v7 = [v6 count];

  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v5 linkedContacts];
    unsigned __int8 v9 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      unsigned __int8 v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = (*(uint64_t (**)(void))(a1[5] + 16))();
          unsigned __int8 v14 = *a3;
          *a3 |= v13 ^ 1;
          if (v14 | v13 ^ 1)
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;

            goto LABEL_19;
          }
        }
        unsigned __int8 v10 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if (v5)
    {
      unsigned __int8 v15 = *a3 | (*(uint64_t (**)(void))(a1[5] + 16))() ^ 1;
      *a3 = v15;
    }
    else
    {
      unint64_t v16 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003723C(v16);
      }
      unsigned __int8 v15 = *a3;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v15;
  }
  char v17 = (void *)a1[4];
  [v17 countSoFar];
  [v17 setCountSoFar:v18 + 1.0];
LABEL_19:
}

void sub_100009590(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  NSExceptionName v6 = [v16 recipients];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = 0;
    do
    {
      unsigned __int8 v9 = [v16 recipients];
      unsigned __int8 v10 = [v9 objectAtIndexedSubscript:v8];

      uint64_t v11 = a1[4];
      unint64_t v12 = [v10 contact];
      (*(void (**)(uint64_t, void *, unsigned char *))(v11 + 16))(v11, v12, a4);

      ++*(void *)(*(void *)(a1[5] + 8) + 24);
      if (++*(void *)(*(void *)(a1[6] + 8) + 24) >= a1[7])
      {
        *a4 = 1;
      }
      else if (!*a4)
      {
        goto LABEL_8;
      }
      unsigned __int8 v13 = [v16 recipients];
      id v8 = (char *)[v13 count];

LABEL_8:
      ++v8;
      unsigned __int8 v14 = [v16 recipients];
      unsigned __int8 v15 = (char *)[v14 count];
    }
    while (v8 < v15);
  }
}

uint64_t sub_1000096FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL ABSPBContactReadFrom(char *a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 64;
        goto LABEL_59;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 88;
        goto LABEL_59;
      case 3u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 56;
        goto LABEL_59;
      case 4u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 80;
        goto LABEL_59;
      case 5u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 48;
        goto LABEL_59;
      case 6u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 192;
        goto LABEL_59;
      case 7u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 96;
        goto LABEL_59;
      case 8u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 104;
        goto LABEL_59;
      case 9u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 128;
        goto LABEL_59;
      case 0xAu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
        goto LABEL_59;
      case 0xBu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 72;
        goto LABEL_59;
      case 0xCu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 120;
        goto LABEL_59;
      case 0xDu:
        unsigned __int8 v14 = objc_alloc_init(ABSPBDate);
        uint64_t v15 = 16;
        goto LABEL_34;
      case 0xEu:
        unsigned __int8 v14 = objc_alloc_init(ABSPBDate);
        uint64_t v15 = 112;
LABEL_34:
        objc_storeStrong((id *)&a1[v15], v14);
        if (!PBReaderPlaceMark() || (ABSPBDateReadFrom((uint64_t)v14, a2) & 1) == 0) {
          goto LABEL_63;
        }
        goto LABEL_57;
      case 0xFu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 176;
        goto LABEL_59;
      case 0x10u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 152;
        goto LABEL_59;
      case 0x11u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 160;
        goto LABEL_59;
      case 0x12u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 168;
        goto LABEL_59;
      case 0x13u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 208;
        goto LABEL_59;
      case 0x14u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 200;
        goto LABEL_59;
      case 0x15u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 144;
        goto LABEL_59;
      case 0x16u:
        unsigned __int8 v14 = objc_alloc_init(ABSPBAlert);
        uint64_t v16 = 24;
        goto LABEL_46;
      case 0x17u:
        unsigned __int8 v14 = objc_alloc_init(ABSPBAlert);
        uint64_t v16 = 216;
LABEL_46:
        objc_storeStrong((id *)&a1[v16], v14);
        if (!PBReaderPlaceMark() || (ABSPBAlertReadFrom((uint64_t)v14, a2) & 1) == 0) {
          goto LABEL_63;
        }
        goto LABEL_57;
      case 0x18u:
        unsigned __int8 v14 = objc_alloc_init(ABSPBLabeledString);
        [a1 addPhoneNumbers:v14];
        goto LABEL_52;
      case 0x19u:
        unsigned __int8 v14 = objc_alloc_init(ABSPBLabeledString);
        [a1 addUrls:v14];
        goto LABEL_52;
      case 0x1Au:
        unsigned __int8 v14 = objc_alloc_init(ABSPBLabeledString);
        [a1 addEmails:v14];
LABEL_52:
        if (!PBReaderPlaceMark() || !ABSPBLabeledStringReadFrom((uint64_t)v14, a2)) {
          goto LABEL_63;
        }
        goto LABEL_57;
      case 0x1Bu:
        unsigned __int8 v14 = objc_alloc_init(ABSPBPostalAddress);
        [a1 addAddresses:v14];
        if (PBReaderPlaceMark() && ABSPBPostalAddressReadFrom((uint64_t)v14, a2))
        {
LABEL_57:
          PBReaderRecallMark();
LABEL_60:

LABEL_61:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_63:

        return 0;
      case 0x1Cu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 184;
LABEL_59:
        unsigned __int8 v14 = *(ABSPBDate **)&a1[v13];
        *(void *)&a1[v13] = v12;
        goto LABEL_60;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_61;
    }
  }
}

void sub_10000CEF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000CF1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t state = xpc_activity_get_state(v3);
  unint64_t v6 = [WeakRetained log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (state <= 5) {
      unint64_t v7 = (&off_100054EE0)[state];
    }
    else {
      unint64_t v7 = "OUT_OF_BOUNDS";
    }
    int v18 = 136315138;
    long long v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checkin activity state: %s", (uint8_t *)&v18, 0xCu);
  }

  if (state == 2)
  {
    uint64_t v11 = +[NSDate date];
    uint64_t v12 = [WeakRetained estimatedFireDate];

    if (v12)
    {
      uint64_t v13 = [WeakRetained estimatedFireDate];
      [v11 timeIntervalSinceDate:v13];
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = [WeakRetained log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      long long v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Running (late by: %.02f)", (uint8_t *)&v18, 0xCu);
    }

    [WeakRetained setEstimatedFireDate:0];
    [WeakRetained _setState:4];
    char v17 = +[NSDate date];
    [WeakRetained setLastFired:v17];

    [WeakRetained _startDeferralPolling];
    [*(id *)(a1 + 32) activityRun:WeakRetained];
  }
  else if (state)
  {
    uint64_t v11 = [WeakRetained log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100037280(state, v11);
    }
  }
  else
  {
    char v8 = [WeakRetained activityCondition];
    [v8 lock];

    [WeakRetained _setActivity:v3];
    unsigned __int8 v9 = [WeakRetained activityCondition];
    [v9 broadcast];

    int v10 = [WeakRetained activityCondition];
    [v10 unlock];

    uint64_t v11 = [WeakRetained _currentCriteria];
    if (v11) {
      xpc_activity_set_criteria(v3, v11);
    }
    [WeakRetained setWaitingForCheckin:0];
  }
}

void sub_10000D9E4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(WeakRetained + 2);
  if (v1) {
    char v2 = objc_opt_respondsToSelector();
  }
  else {
    char v2 = 0;
  }
  id v3 = [WeakRetained activity];
  BOOL should_defer = xpc_activity_should_defer(v3);

  if (should_defer && (v2 & 1) != 0) {
    [v1 activityDefer:WeakRetained];
  }
}

uint64_t ABSPBContactWrapperReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 204) |= 4u;
        while (1)
        {
          uint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v17 = v16 + 1;
          if (v16 == -1 || v17 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17;
          v15 |= (unint64_t)(v18 & 0x7F) << v13;
          if ((v18 & 0x80) == 0) {
            goto LABEL_77;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_79;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_77:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_79:
        *(_DWORD *)(a1 + 160) = v15;
        goto LABEL_74;
      case 2u:
        PBReaderReadString();
        long long v20 = (ABSPBLinkTo *)objc_claimAutoreleasedReturnValue();
        if (v20) {
          [(id)a1 addGroupName:v20];
        }
        goto LABEL_61;
      case 3u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 176;
        goto LABEL_73;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 80;
        goto LABEL_73;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 204) |= 8u;
        while (2)
        {
          uint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v10 = v24++ >= 9;
              if (v10)
              {
                uint64_t v25 = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0;
        }
LABEL_83:
        *(unsigned char *)(a1 + 200) = v25 != 0;
        goto LABEL_74;
      case 6u:
        *(unsigned char *)(a1 + 204) |= 1u;
        unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v30 = 0;
        }
        *(void *)(a1 + 8) = v30;
        goto LABEL_74;
      case 7u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 56;
        goto LABEL_73;
      case 8u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 168;
        goto LABEL_73;
      case 9u:
        long long v20 = objc_alloc_init(ABSPBLinkTo);
        [(id)a1 addLinkTo:v20];
        if (!PBReaderPlaceMark() || (ABSPBLinkToReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_91;
        }
        goto LABEL_60;
      case 0xAu:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 64;
        goto LABEL_73;
      case 0xBu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 104;
        goto LABEL_73;
      case 0xCu:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 32;
        goto LABEL_73;
      case 0xDu:
        long long v20 = objc_alloc_init(ABSPBContact);
        objc_storeStrong((id *)(a1 + 120), v20);
        if (!PBReaderPlaceMark() || !ABSPBContactReadFrom((char *)v20, a2)) {
          goto LABEL_91;
        }
        goto LABEL_60;
      case 0xEu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_73;
      case 0xFu:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 88;
        goto LABEL_73;
      case 0x10u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 96;
        goto LABEL_73;
      case 0x11u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 128;
        goto LABEL_73;
      case 0x12u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 136;
        goto LABEL_73;
      case 0x13u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 144;
        goto LABEL_73;
      case 0x14u:
        long long v20 = objc_alloc_init(ABSPBContainerAttributes);
        objc_storeStrong((id *)(a1 + 40), v20);
        if PBReaderPlaceMark() && (ABSPBContainerAttributesReadFrom((uint64_t)v20, a2))
        {
LABEL_60:
          PBReaderRecallMark();
LABEL_61:

LABEL_74:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_91:

        return 0;
      case 0x15u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 192;
        goto LABEL_73;
      case 0x16u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 204) |= 2u;
        while (2)
        {
          uint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v34);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v35;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v10 = v32++ >= 9;
              if (v10)
              {
                uint64_t v33 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v33 = 0;
        }
LABEL_87:
        *(void *)(a1 + 16) = v33;
        goto LABEL_74;
      case 0x17u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 48;
        goto LABEL_73;
      case 0x18u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 184;
        goto LABEL_73;
      case 0x19u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 152;
LABEL_73:
        v37 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_74;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_74;
    }
  }
}

void sub_10001100C(id a1)
{
  qword_100069C40 = objc_alloc_init(ABSContactsInterface);

  _objc_release_x1();
}

id sub_1000111A4(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementInUseForMutation:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = *(void **)(a1 + 32);

  return [v3 _decrementInUse];
}

id sub_1000112D0(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementInUseForMutation:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = *(void **)(a1 + 32);

  return [v3 _decrementInUse];
}

id sub_100011454(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementInUseForMutation:1];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 29) = 1;
  }
  unsigned int v5 = *(void **)(a1 + 32);

  return [v5 _decrementInUse];
}

id sub_1000115A8(uint64_t a1)
{
  [*(id *)(a1 + 32) _incrementInUseForMutation:1];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 29) = 1;
  }
  unsigned int v5 = *(void **)(a1 + 32);

  return [v5 _decrementInUse];
}

id sub_100011778(uint64_t a1)
{
  return [*(id *)(a1 + 32) _incrementInUseForMutation:0];
}

id sub_10001181C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementInUse];
}

void sub_100012400(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100012414(uint64_t a1)
{
  char v2 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000124C4;
  block[3] = &unk_100054E20;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void sub_1000124C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _databaseChangedExternally];
}

uint64_t sub_100012504(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

id sub_100012684(uint64_t a1)
{
  return [*(id *)(a1 + 32) databaseChangedExternally];
}

id sub_1000128D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeSql:*(void *)(a1 + 40)];
}

id sub_100012A74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parseSql:*(void *)(a1 + 40) andRun:*(void *)(a1 + 48)];
}

uint64_t sub_100012DAC(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "BEGIN", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"begin(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_100012EA0(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "COMMIT", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"commit(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_100012F94(uint64_t a1)
{
  uint64_t result = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) db], "ROLLBACK", 0, 0, 0);
  if (result)
  {
    [*(id *)(a1 + 32) _makeSqlErrorReasonString:@"rollback(1)"];
    id v3 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
  return result;
}

uint64_t sub_1000130C0(uint64_t a1)
{
  uint64_t result = sqlite3_changes((sqlite3 *)[*(id *)(a1 + 32) db]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

void start()
{
  id v0 = dispatch_get_global_queue(33, 0);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  char v2 = (void *)qword_100069C48;
  qword_100069C48 = (uint64_t)v1;

  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0, v0);
  id v4 = (void *)qword_100069C50;
  qword_100069C50 = (uint64_t)v3;

  unsigned int v5 = dispatch_get_global_queue(17, 0);
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v5);
  uint64_t v7 = (void *)qword_100069C58;
  qword_100069C58 = (uint64_t)v6;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100069C48, &stru_100055018);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100069C50, &stru_100055038);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100069C58, &stru_100055058);
  dispatch_activate((dispatch_object_t)qword_100069C48);
  dispatch_activate((dispatch_object_t)qword_100069C50);
  dispatch_activate((dispatch_object_t)qword_100069C58);
  signal(30, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  sub_100028A88(21);
  sub_100028A64(17);
  +[ABSyncInterface sharedInstance];
  objc_claimAutoreleasedReturnValue();
  dispatch_main();
}

void sub_100013350(id a1)
{
  dispatch_source_t v1 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM, Bye bye.", v2, 2u);
  }
  exit(0);
}

void sub_1000133C0(id a1)
{
  dispatch_source_t v1 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGQUIT, Bye bye.", v2, 2u);
  }
  exit(0);
}

void sub_100013430(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, (os_log_type_t)0x90u)) {
    sub_1000373E8();
  }
}

void sub_1000137B8(id a1)
{
  dispatch_source_t v1 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_100069C70 = (uint64_t)v1;
  if (v1)
  {
    char v2 = (uint64_t (*)())dlsym(v1, "WriteStackshotReport");
    if (v2) {
      dispatch_source_t v3 = v2;
    }
    else {
      dispatch_source_t v3 = sub_100013854;
    }
    off_100069C60 = v3;
    id v4 = (uint64_t (*)())dlsym((void *)qword_100069C70, "SimulateCrash");
    if (v4) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = sub_100013854;
    }
  }
  else
  {
    unsigned int v5 = sub_100013854;
    off_100069C60 = sub_100013854;
  }
  off_100069C68 = v5;
}

uint64_t sub_100013854()
{
  return 1;
}

id sub_100013FA0()
{
  if (qword_100069C80 != -1) {
    dispatch_once(&qword_100069C80, &stru_100055098);
  }
  id v0 = (void *)qword_100069C88;

  return v0;
}

void sub_100013FF4(id a1)
{
  qword_100069C88 = (uint64_t)os_log_create("com.apple.addressbooksync", "fastSerializer");

  _objc_release_x1();
}

void sub_10001408C(id a1)
{
  qword_100069C90 = objc_alloc_init(ABSContactsReclusterizer);

  _objc_release_x1();
}

id sub_100014218(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

id sub_1000142B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processClusters];
}

void sub_1000146BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_1000146F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014704(uint64_t a1)
{
}

uint64_t sub_10001470C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  *(void *)(*(void *)(a1 + 32) + 16) = objc_alloc_init((Class)NSMutableDictionary);

  return _objc_release_x1();
}

void sub_100014814(uint64_t a1, void *a2)
{
  BOOL v10 = CNContactIdentifierKey;
  id v3 = a2;
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];
  id v5 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v4];
  dispatch_source_t v6 = +[CNContact predicateForContactsWithIdentifiers:*(void *)(a1 + 32)];
  [v5 setPredicate:v6];

  [v5 setUnifyResults:1];
  [v5 setMutableObjects:0];
  id v9 = 0;
  [v3 enumerateContactsWithFetchRequest:v5 error:&v9 usingBlock:&stru_100055120];

  id v7 = v9;
  if (v7)
  {
    unint64_t v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100037430((uint64_t)v7, v8);
    }
  }
}

void sub_100014978(id a1, CNContact *a2, BOOL *a3)
{
  id v3 = a2;
  uint64_t v4 = [(CNContact *)v3 linkedContacts];
  if (v4)
  {
    id v5 = (void *)v4;
    dispatch_source_t v6 = [(CNContact *)v3 linkedContacts];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [(CNContact *)v3 mutableCopy];
      id v9 = +[ABSContactsInterface sharedInstance];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100014A70;
      v11[3] = &unk_100055148;
      id v12 = v8;
      id v10 = v8;
      [v9 mutateAssert:v11];
    }
  }
}

uint64_t sub_100014A70(uint64_t a1, uint64_t a2, void *a3)
{
  return 0;
}

void sub_100014D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100014D68(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[ABSContactsLinkCluster alloc] initWithIdentifier_LOCKED:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

uint64_t sub_100014DBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014E60;
  v8[3] = &unk_1000551C0;
  id v9 = v4;
  id v6 = v4;
  [v5 enumerateContacts_LOCKED:v8];

  return 0;
}

id sub_100014E60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unlinkContact:a2];
}

uint64_t sub_100014E6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  unint64_t v29 = sub_1000146F4;
  uint64_t v30 = sub_100014704;
  id v31 = 0;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = *(void **)(a1 + 32);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10001503C;
  char v13 = &unk_100055210;
  uint64_t v15 = &v26;
  uint64_t v16 = &v22;
  unint64_t v17 = &v18;
  id v8 = v6;
  id v14 = v8;
  [v7 enumerateContacts_LOCKED:&v10];
  if (*((unsigned char *)v23 + 24)) {
    [v8 preferLinkedContactForImage:v27[5] inUnifiedContact:v27[5] preferences:v10, v11, v12, v13];
  }
  if (*((unsigned char *)v19 + 24)) {
    [v8 preferLinkedContactForName:v27[5] inUnifiedContact:v27[5]];
  }
  [v8 setLinkIdentifier:*(void *)(a1 + 40) forContact:v27[5] linkIdentifier:v10 linkIdentifier:v11 linkIdentifier:v12 linkIdentifier:v13];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return 0;
}

void sub_10001500C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001503C(uint64_t a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void *)(v9 + 40);
  id v10 = (id *)(v9 + 40);
  id v12 = v8;
  if (v11)
  {
    [*(id *)(a1 + 32) linkContact:v8];
    if (a3) {
      [*(id *)(a1 + 32) preferLinkedContactForImage:v12 inUnifiedContact:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    if (a4) {
      [*(id *)(a1 + 32) preferLinkedContactForName:v12 inUnifiedContact:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }
  else
  {
    objc_storeStrong(v10, a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  }
}

void sub_100016680(__int16 a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 length])
  {
    __int16 v7 = a1;
    [v6 appendBytes:&v7 length:2];
    sub_1000166FC(v5, v6);
  }
}

void sub_1000166FC(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 dataUsingEncoding:4];
    unsigned int v7 = [v4 length];
    [v3 appendBytes:&v7 length:4];
    id v5 = v4;
    [v3 appendBytes:[v5 bytes] length:[v5 length]];
  }
  else
  {
    int v6 = -1;
    id v5 = a2;
    [v5 appendBytes:&v6 length:4];
  }
}

void sub_1000167B8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned __int8 v5 = sub_10001699C(v3);
  [v4 appendBytes:&v5 length:1];
  if (v5 == 255) {
    sub_1000166FC(v3, v4);
  }
}

void sub_10001682C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned __int8 v9 = [v3 isLeapMonth];
  unsigned int v8 = [v3 era];
  unsigned int v7 = [v3 year];
  unsigned __int8 v6 = [v3 month];
  unsigned __int8 v5 = [v3 day];
  [v4 appendBytes:&v9 length:1];
  if ([v3 era] == (id)0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v8 = 0x80000000;
  }
  [v4 appendBytes:&v8 length:4];
  if ([v3 year] == (id)0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v7 = 0x80000000;
  }
  [v4 appendBytes:&v7 length:4];
  if ([v3 month] == (id)0x7FFFFFFFFFFFFFFFLL) {
    unsigned __int8 v6 = 0x80;
  }
  [v4 appendBytes:&v6 length:1];
  if ([v3 day] == (id)0x7FFFFFFFFFFFFFFFLL) {
    unsigned __int8 v5 = 0x80;
  }
  [v4 appendBytes:&v5 length:1];
}

id sub_100016964()
{
  sub_10001699C(@"doesn't matter");
  id v0 = (void *)qword_100069CA0;

  return v0;
}

uint64_t sub_10001699C(void *a1)
{
  id v1 = a1;
  if (qword_100069CB8 != -1) {
    dispatch_once(&qword_100069CB8, &stru_100055278);
  }
  char v2 = [(id)qword_100069CA0 objectForKey:v1];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 intValue];
  }
  else {
    unsigned __int8 v4 = -1;
  }

  return v4;
}

uint64_t sub_100016A2C(void *a1)
{
  uint64_t v1 = qword_100069CA8;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_100069CA8, &stru_100055258);
  }
  id v3 = [(id)qword_100069CB0 objectForKeyedSubscript:v2];

  signed __int16 v4 = (unsigned __int16)[v3 intValue];
  return v4;
}

void sub_100016AA8(id a1)
{
  v3[0] = NSCalendarIdentifierGregorian;
  v3[1] = NSCalendarIdentifierBuddhist;
  v4[0] = &off_100059098;
  v4[1] = &off_1000590B0;
  v3[2] = NSCalendarIdentifierChinese;
  v3[3] = NSCalendarIdentifierCoptic;
  v4[2] = &off_1000590C8;
  v4[3] = &off_1000590E0;
  v3[4] = NSCalendarIdentifierEthiopicAmeteMihret;
  v3[5] = NSCalendarIdentifierEthiopicAmeteAlem;
  v4[4] = &off_1000590F8;
  v4[5] = &off_100059110;
  v3[6] = NSCalendarIdentifierHebrew;
  v3[7] = NSCalendarIdentifierISO8601;
  v4[6] = &off_100059128;
  v4[7] = &off_100059140;
  v3[8] = NSCalendarIdentifierIndian;
  v3[9] = NSCalendarIdentifierIslamic;
  v4[8] = &off_100059158;
  v4[9] = &off_100059170;
  v3[10] = NSCalendarIdentifierIslamicCivil;
  v3[11] = NSCalendarIdentifierJapanese;
  v4[10] = &off_100059188;
  v4[11] = &off_1000591A0;
  v3[12] = NSCalendarIdentifierPersian;
  v3[13] = NSCalendarIdentifierRepublicOfChina;
  v4[12] = &off_1000591B8;
  v4[13] = &off_1000591D0;
  v3[14] = NSCalendarIdentifierIslamicTabular;
  v3[15] = NSCalendarIdentifierIslamicUmmAlQura;
  v4[14] = &off_1000591E8;
  v4[15] = &off_100059200;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
  id v2 = (void *)qword_100069CB0;
  qword_100069CB0 = v1;
}

void sub_100016CA4(id a1)
{
  v3[0] = @"_$!<Anniversary>!$_";
  v3[1] = @"_$!<Assistant>!$_";
  v4[0] = &off_100059218;
  v4[1] = &off_100059230;
  v3[2] = @"_$!<AssistantPhone>!$_";
  v3[3] = @"_$!<Brother>!$_";
  v4[2] = &off_100059248;
  v4[3] = &off_100059260;
  v3[4] = @"_$!<Callback>!$_";
  v3[5] = @"_$!<Car>!$_";
  v4[4] = &off_100059278;
  v4[5] = &off_100059290;
  v3[6] = @"_$!<Child>!$_";
  v3[7] = @"_$!<CompanyMain>!$_";
  v4[6] = &off_1000592A8;
  v4[7] = &off_1000592C0;
  v3[8] = @"_$!<EX-Anniversary>!$_";
  v3[9] = @"_$!<EX-AssistantName>!$_";
  v4[8] = &off_1000592D8;
  v4[9] = &off_1000592F0;
  v3[10] = @"_$!<EX-AssistantPhone>!$_";
  v3[11] = @"_$!<EX-Birthday>!$_";
  v4[10] = &off_100059308;
  v4[11] = &off_100059320;
  v3[12] = @"_$!<EX-Business>!$_";
  v3[13] = @"_$!<EX-BusinessFax>!$_";
  v4[12] = &off_100059338;
  v4[13] = &off_100059350;
  v3[14] = @"_$!<EX-BusinessHomePage>!$_";
  v3[15] = @"_$!<EX-BusinessPhone2>!$_";
  v4[14] = &off_100059368;
  v4[15] = &off_100059380;
  void v3[16] = @"_$!<EX-BusinessPhone>!$_";
  v3[17] = @"_$!<EX-Callback>!$_";
  void v4[16] = &off_100059398;
  void v4[17] = &off_1000593B0;
  v3[18] = @"_$!<EX-CarPhone>!$_";
  v3[19] = @"_$!<EX-CompanyMainPhone>!$_";
  v4[18] = &off_1000593C8;
  v4[19] = &off_1000593E0;
  v3[20] = @"_$!<EX-EmailAddress1>!$_";
  v3[21] = @"_$!<EX-EmailAddress2>!$_";
  v4[20] = &off_1000593F8;
  v4[21] = &off_100059410;
  v3[22] = @"_$!<EX-EmailAddress3>!$_";
  v3[23] = @"_$!<EX-Home>!$_";
  v4[22] = &off_100059428;
  v4[23] = &off_100059440;
  v3[24] = @"_$!<EX-HomeFax>!$_";
  v3[25] = @"_$!<EX-HomePhone2>!$_";
  v4[24] = &off_100059458;
  v4[25] = &off_100059470;
  v3[26] = @"_$!<EX-HomePhone>!$_";
  v3[27] = @"_$!<EX-ImAddress1>!$_";
  v4[26] = &off_100059488;
  v4[27] = &off_1000594A0;
  v3[28] = @"_$!<EX-ImAddress2>!$_";
  v3[29] = @"_$!<EX-ImAddress3>!$_";
  v4[28] = &off_1000594B8;
  v4[29] = &off_1000594D0;
  v3[30] = @"_$!<EX-Isdn>!$_";
  v3[31] = @"_$!<EX-Manager>!$_";
  v4[30] = &off_1000594E8;
  v4[31] = &off_100059500;
  v3[32] = @"_$!<EX-MobilePhone>!$_";
  v3[33] = @"_$!<EX-Other>!$_";
  v4[32] = &off_100059518;
  v4[33] = &off_100059530;
  v3[34] = @"_$!<EX-OtherFax>!$_";
  v3[35] = @"_$!<EX-OtherTelephone>!$_";
  v4[34] = &off_100059548;
  v4[35] = &off_100059560;
  v3[36] = @"_$!<EX-Pager>!$_";
  v3[37] = @"_$!<EX-PrimaryPhone>!$_";
  v4[36] = &off_100059578;
  v4[37] = &off_100059590;
  v3[38] = @"_$!<EX-RadioPhone>!$_";
  v3[39] = @"_$!<EX-SpouseName>!$_";
  v4[38] = &off_1000595A8;
  v4[39] = &off_1000595C0;
  v3[40] = @"_$!<EX-Telex>!$_";
  v3[41] = @"_$!<EX-TtyTddPhone>!$_";
  v4[40] = &off_1000595D8;
  v4[41] = &off_1000595F0;
  v3[42] = @"_$!<Email>!$_";
  v3[43] = @"_$!<Father>!$_";
  v4[42] = &off_100059608;
  v4[43] = &off_100059620;
  v3[44] = @"_$!<Friend>!$_";
  v3[45] = @"_$!<Home>!$_";
  v4[44] = &off_100059638;
  v4[45] = &off_100059650;
  v3[46] = @"_$!<HomeFAX>!$_";
  v3[47] = @"_$!<HomePage>!$_";
  v4[46] = &off_100059668;
  v4[47] = &off_100059680;
  v3[48] = @"_$!<ISDN>!$_";
  v3[49] = @"_$!<Main>!$_";
  v4[48] = &off_100059698;
  v4[49] = &off_1000596B0;
  v3[50] = @"_$!<Manager>!$_";
  v3[51] = @"_$!<Mobile>!$_";
  v4[50] = &off_1000596C8;
  v4[51] = &off_1000596E0;
  v3[52] = @"_$!<MobileMe>!$_";
  v3[53] = @"_$!<Mother>!$_";
  v4[52] = &off_1000596F8;
  v4[53] = &off_100059710;
  v3[54] = @"_$!<Note>!$_";
  v3[55] = @"_$!<Other>!$_";
  v4[54] = &off_100059728;
  v4[55] = &off_100059740;
  v3[56] = @"_$!<OtherFAX>!$_";
  v3[57] = @"_$!<Pager>!$_";
  v4[56] = &off_100059758;
  v4[57] = &off_100059770;
  v3[58] = @"_$!<Parent>!$_";
  v3[59] = @"_$!<Partner>!$_";
  v4[58] = &off_100059788;
  v4[59] = &off_1000597A0;
  v3[60] = @"_$!<Radio>!$_";
  v3[61] = @"_$!<Sister>!$_";
  v4[60] = &off_1000597B8;
  v4[61] = &off_1000597D0;
  v3[62] = @"_$!<SocialProfile>!$_";
  v3[63] = @"_$!<Spouse>!$_";
  v4[62] = &off_1000597E8;
  v4[63] = &off_100059800;
  v3[64] = @"_$!<TTY>!$_";
  v4[64] = &off_100059818;
  v3[65] = @"_$!<Telex>!$_";
  v4[65] = &off_100059830;
  v3[66] = @"_$!<Work>!$_";
  v4[66] = &off_100059848;
  v3[67] = @"_$!<WorkFAX>!$_";
  v4[67] = &off_100059860;
  v3[68] = @"_$!<iCloud>!$_";
  v4[68] = &off_100059878;
  v3[69] = @"_$!<iPhone>!$_";
  v4[69] = &off_100059890;
  v3[70] = @"birthday";
  v4[70] = &off_1000598A8;
  v3[71] = @"iCloud";
  v4[71] = &off_1000598C0;
  v3[72] = @"iPhone";
  v4[72] = &off_1000598D8;
  v3[73] = CNPostalAddressStreetKey;
  v4[73] = &off_1000598F0;
  v3[74] = CNPostalAddressCityKey;
  v4[74] = &off_100059908;
  v3[75] = CNPostalAddressStateKey;
  v4[75] = &off_100059920;
  v3[76] = CNPostalAddressPostalCodeKey;
  v4[76] = &off_100059938;
  v3[77] = CNPostalAddressCountryKey;
  v4[77] = &off_100059950;
  v3[78] = CNPostalAddressISOCountryCodeKey;
  v4[78] = &off_100059968;
  v3[79] = CNSocialProfileURLStringKey;
  v4[79] = &off_100059980;
  v3[80] = CNSocialProfileUsernameKey;
  v4[80] = &off_100059998;
  v3[81] = CNSocialProfileUserIdentifierKey;
  v4[81] = &off_1000599B0;
  v3[82] = CNSocialProfileServiceKey;
  v4[82] = &off_1000599C8;
  v3[83] = CNSocialProfileServiceFacebook;
  v4[83] = &off_1000599E0;
  v3[84] = CNSocialProfileServiceFlickr;
  v4[84] = &off_1000599F8;
  v3[85] = CNSocialProfileServiceLinkedIn;
  v4[85] = &off_100059A10;
  v3[86] = CNSocialProfileServiceMySpace;
  v4[86] = &off_100059A28;
  v3[87] = CNSocialProfileServiceSinaWeibo;
  v4[87] = &off_100059A40;
  v3[88] = CNSocialProfileServiceTencentWeibo;
  v4[88] = &off_100059A58;
  v3[89] = CNSocialProfileServiceTwitter;
  v4[89] = &off_100059A70;
  v3[90] = CNSocialProfileServiceYelp;
  v4[90] = &off_100059A88;
  v3[91] = CNSocialProfileServiceGameCenter;
  v4[91] = &off_100059AA0;
  v3[92] = CNInstantMessageServiceAIM;
  v4[92] = &off_100059AB8;
  v3[93] = CNInstantMessageServiceGaduGadu;
  v4[93] = &off_100059AD0;
  v3[94] = CNInstantMessageServiceGoogleTalk;
  v4[94] = &off_100059AE8;
  v3[95] = CNInstantMessageServiceICQ;
  v4[95] = &off_100059B00;
  v3[96] = CNInstantMessageServiceJabber;
  v4[96] = &off_100059B18;
  v3[97] = CNInstantMessageServiceMSN;
  v4[97] = &off_100059B30;
  v3[98] = CNInstantMessageServiceQQ;
  v4[98] = &off_100059B48;
  v3[99] = CNInstantMessageServiceSkype;
  v4[99] = &off_100059B60;
  v3[100] = CNInstantMessageServiceYahoo;
  v4[100] = &off_100059B78;
  v3[101] = CNPostalAddressSubLocalityKey;
  v4[101] = &off_100059B90;
  v3[102] = CNPostalAddressSubAdministrativeAreaKey;
  v4[102] = &off_100059BA8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:103];
  id v2 = (void *)qword_100069CA0;
  qword_100069CA0 = v1;
}

void sub_100018028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001804C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001805C(uint64_t a1)
{
}

id sub_100018064(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) store];
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v5 = [v3 executeFetchRequest:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  return v6;
}

void sub_100018320(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018338(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t sub_100018350(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void sub_100018588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_1000185AC(uint64_t a1)
{
  id v2 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:*(void *)(a1 + 32)];
  [v2 setUnifyResults:0];
  [v2 setMutableObjects:0];
  uint64_t v12 = *(void *)(a1 + 40);
  id v3 = +[NSArray arrayWithObjects:&v12 count:1];
  uint64_t v4 = +[CNContact predicateForContactsWithIdentifiers:v3];
  [v2 setPredicate:v4];

  uint64_t v5 = [*(id *)(a1 + 48) store];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_10001872C;
  v10[3] = &unk_100055318;
  v10[4] = *(void *)(a1 + 64);
  id obj = v7;
  [v5 enumerateContactsWithFetchRequest:v2 error:&obj usingBlock:v10];
  objc_storeStrong((id *)(v6 + 40), obj);

  id v8 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return v8;
}

void sub_10001872C(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

id sub_100018E2C()
{
  if (qword_100069CC0 != -1) {
    dispatch_once(&qword_100069CC0, &stru_100055360);
  }
  id v0 = (void *)qword_100069CC8;

  return v0;
}

void sub_100018E80(id a1)
{
  v3[0] = CNContactGivenNameKey;
  v3[1] = CNContactFamilyNameKey;
  v3[2] = CNContactMiddleNameKey;
  v3[3] = CNContactNamePrefixKey;
  v3[4] = CNContactNameSuffixKey;
  v3[5] = CNContactNicknameKey;
  v3[6] = CNContactPreviousFamilyNameKey;
  v3[7] = CNContactPhoneticGivenNameKey;
  v3[8] = CNContactPhoneticMiddleNameKey;
  v3[9] = CNContactPhoneticFamilyNameKey;
  v3[10] = CNContactPronunciationGivenNameKey;
  v3[11] = CNContactPronunciationFamilyNameKey;
  v3[12] = CNContactOrganizationNameKey;
  v3[13] = CNContactPhoneticOrganizationNameKey;
  v3[14] = CNContactDepartmentNameKey;
  v3[15] = CNContactJobTitleKey;
  void v3[16] = CNContactTypeKey;
  v3[17] = CNContactEmailAddressesKey;
  v3[18] = CNContactPhoneNumbersKey;
  v3[19] = CNContactPostalAddressesKey;
  v3[20] = CNContactSocialProfilesKey;
  v3[21] = CNContactInstantMessageAddressesKey;
  v3[22] = CNContactUrlAddressesKey;
  v3[23] = CNContactCalendarURIsKey;
  v3[24] = CNContactCallAlertKey;
  v3[25] = CNContactTextAlertKey;
  v3[26] = CNContactModificationDateKey;
  v3[27] = CNContactThumbnailImageDataKey;
  v3[28] = CNContactBirthdayKey;
  v3[29] = CNContactNonGregorianBirthdayKey;
  v3[30] = CNContactDatesKey;
  v3[31] = CNContactRelationsKey;
  v3[32] = CNContactNoteKey;
  v3[33] = CNContactPreferredLikenessSourceKey;
  v3[34] = CNContactPreferredApplePersonaIdentifierKey;
  v3[35] = CNContactDowntimeWhitelistKey;
  v3[36] = CNContactMemojiMetadataKey;
  v3[37] = CNContactLinkIdentifierKey;
  v3[38] = CNContactPhonemeDataKey;
  v3[39] = CNContactPreferredForImageKey;
  v3[40] = CNContactPreferredChannelKey;
  v3[41] = CNContactSharedPhotoDisplayPreferenceKey;
  v3[42] = CNContactAddressingGrammarEncryptedKey;
  v3[43] = CNContactWallpaperKey;
  v3[44] = CNContactWatchWallpaperImageDataKey;
  v3[45] = CNContactSensitiveContentConfigurationKey;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:46];
  id v2 = (void *)qword_100069CC8;
  qword_100069CC8 = v1;
}

void sub_1000193C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000193D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000193E8(uint64_t a1)
{
}

id sub_1000193F0(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  uint64_t v4 = [v2 containersMatchingPredicate:v3 error:&v10];
  id v5 = v10;
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return v5;
}

void sub_100019804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100019834(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  uint64_t v4 = [v2 accountsMatchingPredicate:v3 error:&v10];
  id v5 = v10;
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return v5;
}

uint64_t ABSPBContainerAttributesReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_55;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_57;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_55:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_57:
        BOOL v37 = v14 != 0;
        uint64_t v38 = 36;
        goto LABEL_66;
      case 2u:
        uint64_t v18 = objc_alloc_init(ABSPBContainerPermissions);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark() && ABSPBContainerPermissionsReadFrom((uint64_t)v18, a2))
        {
          PBReaderRecallMark();

LABEL_71:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 40) |= 4u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if (v23 < 0)
            {
              v19 += 7;
              BOOL v9 = v20++ >= 9;
              if (v9)
              {
                uint64_t v21 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v21 = 0;
        }
LABEL_61:
        BOOL v37 = v21 != 0;
        uint64_t v38 = 37;
        goto LABEL_66;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 40) |= 8u;
        while (2)
        {
          unint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v27 == -1 || v27 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v9 = v25++ >= 9;
              if (v9)
              {
                uint64_t v26 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v26 = 0;
        }
LABEL_65:
        BOOL v37 = v26 != 0;
        uint64_t v38 = 38;
LABEL_66:
        *(unsigned char *)(a1 + v38) = v37;
        goto LABEL_71;
      case 5u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 16;
        goto LABEL_53;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          unint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v34 == -1 || v34 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v34);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v34 + 1;
            v33 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v9 = v32++ >= 9;
              if (v9)
              {
                LODWORD(v33) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v33) = 0;
        }
LABEL_70:
        *(_DWORD *)(a1 + 32) = v33;
        goto LABEL_71;
      case 7u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 8;
LABEL_53:
        char v36 = *(void **)(a1 + v30);
        *(void *)(a1 + v30) = v29;

        goto LABEL_71;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_71;
    }
  }
}

void sub_10001AD94(id a1)
{
  qword_100069CD8 = objc_alloc_init(ABSContactsShadow);

  _objc_release_x1();
}

BOOL sub_10001B238(uint64_t a1, int a2, char *zSql)
{
  int v4 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 8), zSql, -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 8 * a2 + 32), 0);
  if (v4)
  {
    unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100037868((uint64_t)zSql, v5);
    }
  }
  return v4 == 0;
}

void sub_10001B7D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10001D7AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DD50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) guid];
  if ([*(id *)(a1 + 32) hasVcardData])
  {
    char v8 = [*(id *)(a1 + 32) vcardData];
    id v33 = 0;
    uint64_t v9 = +[CNContactVCardSerialization contactsWithData:v8 error:&v33];
    id v10 = v33;

    if (v10)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100037B00();
      }
LABEL_29:
      uint64_t v23 = 0;
      goto LABEL_30;
    }
    if (!v9 || [v9 count] != (id)1)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100037A64();
      }
      goto LABEL_29;
    }
    id v27 = [objc_alloc((Class)CNMutableContact) initWithIdentifier:v7];
    char v28 = sub_100018E28();
    uint64_t v29 = [v9 objectAtIndexedSubscript:0];
    sub_10001E238(v28, v29, v27);

    uint64_t v9 = v27;
  }
  else
  {
    unsigned int v11 = [*(id *)(a1 + 32) hasFastEncodingData];
    char v12 = *(void **)(a1 + 32);
    if (v11)
    {
      unsigned int v13 = [v12 fastEncodingData];
      uint64_t v14 = [v13 CNFSDeserialize];
    }
    else
    {
      if (![v12 hasPb])
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
          sub_100037B68();
        }
        id v31 = +[NSError errorWithDomain:@"InvalidProtobuf" code:-1 userInfo:0];
        objc_exception_throw(v31);
      }
      unsigned int v13 = [*(id *)(a1 + 32) pb];
      uint64_t v14 = [v13 toContact];
    }
    uint64_t v9 = (void *)v14;
  }
  unint64_t v15 = [*(id *)(a1 + 32) thumbnail];
  [v9 setImageData:v15];

  [v9 setSharedPhotoDisplayPreference:[*(id *)(a1 + 32) sharedPhotoDisplayPreference]];
  [*(id *)(a1 + 40) _processSpecialRulesFieldsForContact:v9 wrapper:*(void *)(a1 + 32)];
  char v16 = [*(id *)(a1 + 32) accountExternalIdentifier];
  [v6 addContact:v9 toContainerWithIdentifier:*(void *)(a1 + 48)];
  unint64_t v17 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = v18;
    __int16 v36 = 2048;
    BOOL v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_addContactFromContactWrapper_LOCKED: toContainerWithIdentifier:%p accountExternalIdentifier:%p", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) hasIsMe] && objc_msgSend(*(id *)(a1 + 32), "isMe"))
  {
    char v19 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Forcing save for meCard or linkage.", buf, 2u);
    }
    unsigned int v20 = +[ABSContactsInterface sharedInstance];
    [v20 sendMultisaveBegin];

    id v32 = 0;
    unsigned __int8 v21 = [v5 ABSexecuteSaveRequest:v6 error:&v32];
    id v10 = v32;
    if ((v21 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100037A98();
    }

    unint64_t v22 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Possibly ME card on add.", buf, 2u);
    }
    [v5 ABSsetMeCardConditionally:v9];
    id v6 = 0;
    uint64_t v23 = 1;
  }
  else
  {
    uint64_t v23 = 0;
    id v10 = 0;
  }
  char v24 = *(void **)(a1 + 40);
  unsigned int v25 = [*(id *)(a1 + 32) linkTos];
  uint64_t v26 = [*(id *)(a1 + 32) linkGuid];
  [v24 _bindLinks:v25 contact:v9 guid:v26 store:v5];

LABEL_30:
  return v23;
}

void sub_10001E238(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v20 = a2;
  id v19 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = CNContactWallpaperKey;
    uint64_t v10 = CNContactWatchWallpaperImageDataKey;
    uint64_t v11 = CNContactSensitiveContentConfigurationKey;
    uint64_t v18 = CNContactWatchWallpaperImageDataKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v13 isEqual:CNContactThumbnailImageDataKey] & 1) == 0
          && ([v13 isEqual:v9] & 1) == 0
          && ([v13 isEqual:v10] & 1) == 0
          && ([v13 isEqual:v11] & 1) == 0)
        {
          uint64_t v14 = v11;
          id v15 = v19;
          id v16 = v13;
          unint64_t v17 = [v20 valueForKey:v16];
          if (v17) {
            [v15 setValue:v17 forKey:v16];
          }
          else {
            [v15 setNilValueForKey:v16];
          }

          uint64_t v11 = v14;
          uint64_t v10 = v18;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

uint64_t sub_10001E854(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] hasVcardData])
  {
    id v7 = [a1[4] vcardData];
    id v29 = 0;
    uint64_t v8 = +[CNContactVCardSerialization contactsWithData:v7 error:&v29];
    id v9 = v29;

    if (v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100037B00();
      }
LABEL_27:
      uint64_t v19 = 0;
      goto LABEL_28;
    }
    if (!v8 || [v8 count] != (id)1)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100037A64();
      }
      goto LABEL_27;
    }
    uint64_t v24 = [v8 objectAtIndexedSubscript:0];

    uint64_t v8 = (void *)v24;
  }
  else
  {
    unsigned int v10 = [a1[4] hasFastEncodingData];
    id v11 = a1[4];
    if (v10)
    {
      char v12 = [v11 fastEncodingData];
      uint64_t v13 = [v12 CNFSDeserialize];
    }
    else
    {
      if (![v11 hasPb])
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
          sub_100037C04();
        }
        id v26 = +[NSError errorWithDomain:@"InvalidProtobuf" code:-1 userInfo:0];
        objc_exception_throw(v26);
      }
      char v12 = [a1[4] pb];
      uint64_t v13 = [v12 toContact];
    }
    uint64_t v8 = (void *)v13;
  }
  uint64_t v14 = sub_100018E28();
  sub_10001E238(v14, v8, a1[5]);
  [a1[6] _processSpecialRulesFieldsForContact:a1[5] wrapper:a1[4]];
  [a1[5] setSharedPhotoDisplayPreference:[a1[4] sharedPhotoDisplayPreference]];
  [v6 updateContact:a1[5]];
  if ([a1[4] hasIsMe] && objc_msgSend(a1[4], "isMe"))
  {
    id v15 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Forcing save for meCard.", buf, 2u);
    }
    id v16 = +[ABSContactsInterface sharedInstance];
    [v16 sendMultisaveBegin];

    id v27 = 0;
    unsigned __int8 v17 = [v5 ABSexecuteSaveRequest:v6 error:&v27];
    id v9 = v27;
    if ((v17 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100037A98();
    }
    uint64_t v18 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Possibly setting ME card on modify.", buf, 2u);
    }
    [v5 ABSsetMeCardConditionally:a1[5]];

    id v6 = 0;
    uint64_t v19 = 1;
  }
  else
  {
    id v9 = 0;
    uint64_t v19 = 0;
  }
  id v20 = a1[6];
  long long v21 = [a1[4] linkTos];
  id v22 = a1[5];
  long long v23 = [a1[4] linkGuid];
  [v20 _bindLinks:v21 contact:v22 guid:v23 store:v5];

LABEL_28:
  return v19;
}

void sub_10001F014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F02C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001F03C(uint64_t a1)
{
}

void sub_10001F044(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) accountExternalIdentifier];
  id v5 = [*(id *)(a1 + 32) containerAttributes];
  [v5 setAccountExternalIdentifier:v4];

  id v6 = [v3 defaultContainerIdentifier];
  id v7 = sub_100018E28();
  id v8 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v7];
  [v8 setUnifyResults:0];
  [v8 setMutableObjects:1];
  uint64_t v24 = *(void *)(a1 + 40);
  id v9 = +[NSArray arrayWithObjects:&v24 count:1];
  unsigned int v10 = +[CNContact predicateForContactsWithIdentifiers:v9];
  [v8 setPredicate:v10];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F338;
  v20[3] = &unk_100055318;
  v20[4] = *(void *)(a1 + 64);
  id v21 = 0;
  [v3 enumerateContactsWithFetchRequest:v8 error:&v21 usingBlock:v20];
  id v11 = v21;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    char v12 = [*(id *)(a1 + 48) reality];
    uint64_t v13 = [v12 accountExternalIdentifierForContact:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inStore:v3];

    uint64_t v14 = [*(id *)(a1 + 32) accountExternalIdentifier];
    [*(id *)(a1 + 48) _modifyContactFromContactWrapper_LOCKED:toContact:*(void *)(a1 + 32) toContact:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  else
  {
    id v15 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Adding new contact GUID: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 48) _addContactFromContactWrapper_LOCKED:*(void *)(a1 + 32) toContainerWithIdentifier:v6];
  }
  unsigned __int8 v17 = [*(id *)(a1 + 32) accountExternalIdentifier];

  if (v17)
  {
    uint64_t v18 = [*(id *)(a1 + 56) accountIdentifiers];
    uint64_t v19 = [*(id *)(a1 + 32) accountExternalIdentifier];
    [v18 addObject:v19];
  }
}

void sub_10001F338(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

uint64_t sub_10001F43C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v24 = CNContactIdentifierKey;
  id v6 = a2;
  id v7 = +[NSArray arrayWithObjects:&v24 count:1];
  id v8 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v7];
  [v8 setMutableObjects:1];
  [v8 setUnifyResults:0];
  uint64_t v10 = *(void *)(a1 + 32);
  id v9 = (uint64_t *)(a1 + 32);
  uint64_t v23 = v10;
  id v11 = +[NSArray arrayWithObjects:&v23 count:1];
  char v12 = +[CNContact predicateForContactsWithIdentifiers:v11];
  [v8 setPredicate:v12];

  id v20 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001F688;
  v18[3] = &unk_100055448;
  id v13 = v5;
  id v19 = v13;
  [v6 enumerateContactsWithFetchRequest:v8 error:&v20 usingBlock:v18];

  id v14 = v20;
  id v15 = *(NSObject **)(qword_100069D78 + 8);
  if (v14)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100037C6C(v9, (uint64_t)v14, v15);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *v9;
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Deleted contact; GUID: %{public}@", buf, 0xCu);
  }

  return 0;
}

id sub_10001F688(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id result = [*(id *)(a1 + 32) deleteContact:a2];
  *a3 = 1;
  return result;
}

void sub_10001F78C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) guid];
  [v1 _deleteContactForGUID_LOCKED:v2];
}

BOOL sub_10001F8C0(id a1, CNContactStore *a2, CNSaveRequest *a3)
{
  int v4 = a2;
  id v5 = a3;
  id v6 = [[ABSContactsResetSource alloc] initWithKeys:&__NSArray0__struct store:v4];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:50];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001FA6C;
  v20[3] = &unk_1000554D8;
  id v21 = v4;
  uint64_t v22 = v5;
  id v8 = v5;
  id v9 = v4;
  uint64_t v10 = objc_retainBlock(v20);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10001FCE4;
  unsigned __int8 v17 = &unk_100055500;
  id v11 = v7;
  id v18 = v11;
  char v12 = v10;
  id v19 = v12;
  [(ABSContactsResetSource *)v6 enumerateContactsAdd:&v14 remove:&stru_100055540];
  if (objc_msgSend(v11, "count", v14, v15, v16, v17)) {
    ((void (*)(void *, id))v12[2])(v12, v11);
  }

  return 0;
}

void sub_10001FA6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = CNContactIdentifierKey;
  int v4 = +[NSArray arrayWithObjects:&v24 count:1];
  id v5 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v4];
  [v5 setMutableObjects:1];
  [v5 setUnifyResults:0];
  id v6 = +[CNContact predicateForContactsWithIdentifiers:v3];
  [v5 setPredicate:v6];

  id v22 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001FCD8;
  v20[3] = &unk_100055448;
  id v7 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  [v7 enumerateContactsWithFetchRequest:v5 error:&v22 usingBlock:v20];
  id v8 = v22;
  if (v8 && os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
    sub_100037CF8();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
        uint64_t v15 = +[ABSContactsShadow instance];
        [v15 remove:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v11);
  }
}

id sub_10001FCD8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteContact:a2];
}

uint64_t sub_10001FCE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[ABSContactsShadow instance];
  id v5 = [v3 identifier];
  unsigned __int8 v6 = [v4 contains:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 identifier];
    [v7 addObject:v8];

    if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x32)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [*(id *)(a1 + 32) removeAllObjects];
    }
  }

  return 1;
}

BOOL sub_10001FDB0(id a1, NSString *a2)
{
  return 1;
}

void sub_10001FDCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001FDF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ABSPBAccountsSyncObjectReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadString();
      long long v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_32:
      *(unsigned char *)(a1 + 16) = v14 != 0;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ABSPBLinkToReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)(a1 + 20) |= 2u;
      while (1)
      {
        unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_38;
        }
        v15 += 7;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v17 = 0;
          goto LABEL_40;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_38:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_40:
      BOOL v26 = v17 != 0;
      uint64_t v27 = 17;
    }
    else
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          uint64_t v13 = PBReaderReadString();
          uint64_t v14 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v13;
        }
        else
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        continue;
      }
      char v20 = 0;
      unsigned int v21 = 0;
      uint64_t v22 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
        v22 |= (unint64_t)(v24 & 0x7F) << v20;
        if ((v24 & 0x80) == 0) {
          goto LABEL_42;
        }
        v20 += 7;
        BOOL v9 = v21++ >= 9;
        if (v9)
        {
          uint64_t v22 = 0;
          goto LABEL_44;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v22 = 0;
      }
LABEL_44:
      BOOL v26 = v22 != 0;
      uint64_t v27 = 16;
    }
    *(unsigned char *)(a1 + v27) = v26;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100021324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021354(uint64_t a1)
{
}

uint64_t sub_10002135C(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accountExternalIdentifierForContact:*(void *)(a1 + 40) inStore:a2];

  return _objc_release_x1();
}

void sub_100022320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id sub_100022374(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  id v6 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002240C;
  v5[3] = &unk_100055318;
  v5[4] = a1[6];
  [v2 enumerateContactsWithFetchRequest:v1 error:&v6 usingBlock:v5];
  id v3 = v6;

  return v3;
}

void sub_10002240C(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void sub_1000225A0(id a1)
{
  qword_100069CF0 = objc_alloc_init(ABSDatabaseFileManager);

  _objc_release_x1();
}

void sub_10002282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022844(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022854(uint64_t a1)
{
}

uint64_t sub_10002285C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a3 UUIDString];

  return _objc_release_x1();
}

void sub_1000229A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000229C0(uint64_t a1, void *a2)
{
}

void sub_100022F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022FA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022FB4(uint64_t a1)
{
}

uint64_t sub_100022FBC(uint64_t a1)
{
  [*(id *)(a1 + 32) initWithContact_LOCKED:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100023198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000231B0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) initWithIdentifier_LOCKED:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_1000234B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000234E4(uint64_t a1, void *a2)
{
  v13[0] = CNContactIdentifierKey;
  v13[1] = CNContactPreferredForNameKey;
  v13[2] = CNContactPreferredForImageKey;
  id v3 = a2;
  char v4 = +[NSArray arrayWithObjects:v13 count:3];
  id v5 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v4];
  uint64_t v12 = *(void *)(a1 + 32);
  id v6 = +[NSArray arrayWithObjects:&v12 count:1];
  unint64_t v7 = +[CNContact predicateForContactsWithIdentifiers:v6];
  [v5 setPredicate:v7];

  [v5 setUnifyResults:1];
  [v5 setMutableObjects:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_1000236D8;
  v10[3] = &unk_100055318;
  v10[4] = *(void *)(a1 + 40);
  id v11 = 0;
  [v3 enumerateContactsWithFetchRequest:v5 error:&v11 usingBlock:v10];

  id v8 = v11;
  if (v8)
  {
    BOOL v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100037F30((uint64_t)v8, v9);
    }
  }
}

uint64_t sub_1000236D8(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 linkedContacts];

  return _objc_release_x1();
}

void sub_1000237FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023814(uint64_t a1, void *a2)
{
  int v10 = CNContactIdentifierKey;
  id v3 = a2;
  char v4 = +[NSArray arrayWithObjects:&v10 count:1];
  id v5 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v4];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  unint64_t v7 = +[CNContact predicateForContactsWithIdentifiers:v6];
  [v5 setPredicate:v7];

  [v5 setUnifyResults:0];
  [v5 setMutableObjects:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023990;
  v8[3] = &unk_100055318;
  void v8[4] = *(void *)(a1 + 40);
  uint64_t v9 = 0;
  [v3 enumerateContactsWithFetchRequest:v5 error:&v9 usingBlock:v8];
}

uint64_t sub_100023990(uint64_t result)
{
  return result;
}

void sub_100023AB4(uint64_t a1, void *a2)
{
  v16[0] = CNContactIdentifierKey;
  v16[1] = CNContactPreferredForNameKey;
  v16[2] = CNContactPreferredForImageKey;
  v16[3] = CNContactLinkIdentifierKey;
  id v3 = a2;
  char v4 = +[NSArray arrayWithObjects:v16 count:4];
  id v5 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v4];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  unint64_t v7 = +[CNContact predicateForContactsWithIdentifiers:v6];
  [v5 setPredicate:v7];

  [v5 setUnifyResults:0];
  [v5 setMutableObjects:1];
  id v15 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023D24;
  void v13[3] = &unk_100055448;
  id v14 = *(id *)(a1 + 40);
  [v3 enumerateContactsWithFetchRequest:v5 error:&v15 usingBlock:v13];

  id v8 = v15;
  if (v8)
  {
    uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100037FA8((uint64_t)v8, v9);
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100023D30;
    v11[3] = &unk_100055600;
    int v10 = *(void **)(a1 + 40);
    void v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

id sub_100023D24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100023D30(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  char v4 = [v6 identifier];
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v5 integerValue];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100023EC0(id a1)
{
  qword_100069D00 = objc_alloc_init(ABSContactsLinkCluster);

  _objc_release_x1();
}

BOOL ABSPBLabeledStringReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
LABEL_21:
        id v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadString();
    uint64_t v13 = 16;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ABSPBCountValidationObjectReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_49;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_51:
        uint64_t v31 = 16;
        goto LABEL_60;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v14 |= (unint64_t)(v21 & 0x7F) << v18;
            if (v21 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_55:
        uint64_t v31 = 24;
        goto LABEL_60;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v14 |= (unint64_t)(v25 & 0x7F) << v22;
            if (v25 < 0)
            {
              v22 += 7;
              BOOL v9 = v23++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_59:
        uint64_t v31 = 8;
LABEL_60:
        *(void *)(a1 + v31) = v14;
        continue;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 36) |= 8u;
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
      unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v29 == -1 || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v30 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
      v28 |= (unint64_t)(v30 & 0x7F) << v26;
      if ((v30 & 0x80) == 0) {
        goto LABEL_62;
      }
      v26 += 7;
      BOOL v9 = v27++ >= 9;
      if (v9)
      {
        uint64_t v28 = 0;
        goto LABEL_64;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_62:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v28 = 0;
    }
LABEL_64:
    *(unsigned char *)(a1 + 32) = v28 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ABSPBSyncObjectReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        unsigned int v13 = objc_alloc_init(ABSPBContactWrapper);
        objc_storeStrong((id *)(a1 + 24), v13);
        if PBReaderPlaceMark() && (ABSPBContactWrapperReadFrom((uint64_t)v13, a2)) {
          goto LABEL_47;
        }
        goto LABEL_57;
      case 2u:
        unsigned int v13 = objc_alloc_init(ABSPBDeleteWrapper);
        objc_storeStrong((id *)(a1 + 48), v13);
        if (!PBReaderPlaceMark() || (ABSPBDeleteWrapperReadFrom((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 3u:
        unsigned int v13 = objc_alloc_init(ABSPBFavoritesSyncObject);
        objc_storeStrong((id *)(a1 + 56), v13);
        if (!PBReaderPlaceMark() || (ABSPBFavoritesSyncObjectReadFrom(v13, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 4u:
        unsigned int v13 = objc_alloc_init(ABSPBCountValidationObject);
        objc_storeStrong((id *)(a1 + 40), v13);
        if (!PBReaderPlaceMark() || (ABSPBCountValidationObjectReadFrom((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 5u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 68) |= 2u;
        while (2)
        {
          uint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v19 = v18 + 1;
          if (v18 == -1 || v19 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19;
            v17 |= (unint64_t)(v20 & 0x7F) << v15;
            if (v20 < 0)
            {
              v15 += 7;
              BOOL v10 = v16++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_53:
        *(_DWORD *)(a1 + 64) = v17;
        goto LABEL_48;
      case 6u:
        *(unsigned char *)(a1 + 68) |= 1u;
        unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
        goto LABEL_48;
      case 7u:
        unsigned int v13 = objc_alloc_init(ABSPBAccountsSyncObject);
        objc_storeStrong((id *)(a1 + 16), v13);
        if (!PBReaderPlaceMark() || (ABSPBAccountsSyncObjectReadFrom((uint64_t)v13, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 8u:
        unsigned int v13 = objc_alloc_init(ABSPBContainerAttributes);
        objc_storeStrong((id *)(a1 + 32), v13);
        if PBReaderPlaceMark() && (ABSPBContainerAttributesReadFrom((uint64_t)v13, a2))
        {
LABEL_47:
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_57:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

uint64_t ABSPBAlertReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)(a1 + 28) |= 1u;
      while (1)
      {
        unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_33;
        }
        v15 += 7;
        BOOL v9 = v16++ >= 9;
        if (v9)
        {
          uint64_t v17 = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_35:
      *(unsigned char *)(a1 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v17 != 0;
    }
    else
    {
      if (v12 == 2)
      {
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
      }
      else
      {
        if (v12 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 8;
      }
      char v20 = *(void **)(a1 + v14);
      *(void *)(a1 + v14) = v13;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000273B8(id a1)
{
  id v3 = [(id)objc_opt_class() pairingID];
  uint64_t v1 = +[NSString stringWithFormat:@"com.apple.watch.contactsync.%@", v3];
  id v2 = (void *)qword_100069D10;
  qword_100069D10 = v1;
}

id sub_10002780C(uint64_t a1)
{
  if (atomic_fetch_add(&dword_100069D18, 1u))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100038020();
    }
    +[NDTCrashSynthesizer writeCrashReport:@"Thread lockup detected."];
    exit(-1);
  }
  if (+[ABSValidationSyncObject validationEnabled])
  {
    id v2 = objc_alloc_init(ABSValidationSyncObject);
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 152);
    *(void *)(v3 + 152) = v2;
  }
  id result = [*(id *)(a1 + 32) _batchSupplier];
  atomic_fetch_add(&dword_100069D18, 0xFFFFFFFF);
  return result;
}

void sub_100028194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_1000281C8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  usleep((useconds_t)[v3 delayUs]);
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v5;
}

uint64_t sub_100028228(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v4)
    {
      --*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      [*(id *)(a1 + 32) setCount:((char *)[*(id *)(a1 + 32) count]) + 1];
    }
    else
    {
      uint64_t v5 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enqueueChange returned no for contacts.", v7, 2u);
      }
      +[ABSSyncObject oops];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    uint64_t v4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }

  return v4;
}

id sub_100028578(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadMeIdentifiersForStore:a2];
}

uint64_t sub_100028584(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 128) finished];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [ABSContactsSyncObject alloc];
    unint64_t v6 = *(void **)(a1 + 40);
    unint64_t v7 = [v3 identifier];
    char v8 = -[ABSContactsSyncObject initWithReality:person:isMe:](v5, "initWithReality:person:isMe:", v6, v3, [v6 isMeContact:v7]);

    if (*(unsigned char *)(*(void *)(a1 + 32) + 192)) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    [(ABSSyncObject *)v8 setChangeType:v9];
    [*(id *)(*(void *)(a1 + 32) + 128) push:v8];
    int v10 = [*(id *)(a1 + 32) progressReporter];
    int v11 = [*(id *)(a1 + 32) contactsSource];
    [v11 progress];
    [v10 bearWitness:];
  }
  return v4 ^ 1;
}

uint64_t sub_1000286A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [[ABSDeleteObject alloc] initWithGuid:v3];

  [*(id *)(*(void *)(a1 + 32) + 128) push:v4];
  return 1;
}

uint64_t sub_100028A64(uint64_t result)
{
  if (!result) {
    sub_100038248();
  }
  dword_100069970 = result;
  return result;
}

uint64_t sub_100028A88(uint64_t result)
{
  if (!result) {
    sub_100038274();
  }
  dword_100069974 = result;
  return result;
}

uint64_t sub_100028AAC()
{
  return dword_100069970;
}

uint64_t sub_100028AB8()
{
  return dword_100069974;
}

NSObject *sub_100028AC4(const char *a1)
{
  return sub_100028AD0(a1, (dispatch_qos_class_t)dword_100069970);
}

NSObject *sub_100028AD0(const char *a1, dispatch_qos_class_t a2)
{
  unsigned int v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, a2, 0);

  unint64_t v6 = dispatch_queue_attr_make_initially_inactive(v5);

  unint64_t v7 = dispatch_queue_create(a1, v6);
  dispatch_set_qos_class_fallback();
  dispatch_activate(v7);

  return v7;
}

NSObject *sub_100028B74(const char *a1)
{
  return sub_100028AD0(a1, (dispatch_qos_class_t)dword_100069974);
}

dispatch_queue_global_t sub_100028B80()
{
  return dispatch_get_global_queue(dword_100069970, 0);
}

dispatch_queue_global_t sub_100028B90()
{
  return dispatch_get_global_queue(dword_100069974, 0);
}

void sub_10002948C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_1000294C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000294D0(uint64_t a1)
{
}

void sub_1000294D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)CNContactFetchRequest);
  char v15 = CNContactIdentifierKey;
  uint64_t v5 = +[NSArray arrayWithObjects:&v15 count:1];
  id v6 = [v4 initWithKeysToFetch:v5];

  unint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ABUid"];
  char v8 = +[CNContact predicateForLegacyIdentifier:](CNContact, "predicateForLegacyIdentifier:", [v7 integerValue]);
  [v6 setPredicate:v8];

  [v6 setUnifyResults:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000296D4;
  v11[3] = &unk_100055318;
  void v11[4] = *(void *)(a1 + 48);
  id v12 = 0;
  [v3 enumerateContactsWithFetchRequest:v6 error:&v12 usingBlock:v11];

  id v9 = v12;
  if (v9)
  {
    int v10 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error fetching favorite guid: %{public}@", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000296D4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 identifier];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

uint64_t ABSPBDateReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_63;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_65;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_63:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_65:
        uint64_t v39 = 8;
        goto LABEL_86;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 32) |= 0x20u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0;
        }
LABEL_69:
        *(unsigned char *)(a1 + 28) = v20 != 0;
        continue;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v14 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_73:
        uint64_t v39 = 16;
        goto LABEL_86;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 0x10u;
        while (2)
        {
          unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1 || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v14 |= (unint64_t)(v30 & 0x7F) << v27;
            if (v30 < 0)
            {
              v27 += 7;
              BOOL v9 = v28++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_77:
        uint64_t v39 = 24;
        goto LABEL_86;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 8u;
        while (2)
        {
          unint64_t v33 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v14 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              BOOL v9 = v32++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_81:
        uint64_t v39 = 20;
        goto LABEL_86;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
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
      unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v37 == -1 || v37 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
      v14 |= (unint64_t)(v38 & 0x7F) << v35;
      if ((v38 & 0x80) == 0) {
        goto LABEL_83;
      }
      v35 += 7;
      BOOL v9 = v36++ >= 9;
      if (v9)
      {
        LODWORD(v14) = 0;
        goto LABEL_85;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_83:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v14) = 0;
    }
LABEL_85:
    uint64_t v39 = 12;
LABEL_86:
    *(_DWORD *)(a1 + v39) = v14;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002B248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B260(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002B270(uint64_t a1)
{
}

uint64_t sub_10002B278(uint64_t a1, void *a2)
{
  return 1;
}

BOOL ABSPBPostalAddressReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 32;
          goto LABEL_29;
        case 2u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 56;
          goto LABEL_29;
        case 3u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 8;
          goto LABEL_29;
        case 4u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 48;
          goto LABEL_29;
        case 5u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 40;
          goto LABEL_29;
        case 6u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 16;
          goto LABEL_29;
        case 7u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 24;
          goto LABEL_29;
        case 8u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 72;
          goto LABEL_29;
        case 9u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 64;
LABEL_29:
          uint64_t v14 = *(void **)(a1 + v13);
          *(void *)(a1 + v13) = v12;

          goto LABEL_30;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_30:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002CDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002CE20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002CE30(uint64_t a1)
{
}

id sub_10002CE38(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 containersMatchingPredicate:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  char v8 = *(void **)(*(void *)(a1[7] + 8) + 40);

  return v8;
}

void sub_10002DAA4()
{
  id v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, "identifier");
  id v2 = class_getInstanceMethod(v0, "abs_identifier");

  method_exchangeImplementations(InstanceMethod, v2);
}

uint64_t ABSPBDeleteWrapperReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002E188(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 unifiedContactCountWithError:0];
  id v9 = v4;
  if (v4) {
    uint64_t v5 = (uint64_t)[v4 integerValue];
  }
  else {
    uint64_t v5 = -1;
  }
  *(void *)(*(void *)(a1 + 32) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  *(void *)(*(void *)(a1 + 32) + 32) = +[ABSFavoritesSyncObject favoritesCount];
  id v6 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
  [v6 setUnifyResults:0];
  unint64_t v7 = [v3 contactCountForFetchRequest:v6 error:0];

  if (v7) {
    uint64_t v8 = (uint64_t)[v7 integerValue];
  }
  else {
    uint64_t v8 = -1;
  }
  *(void *)(*(void *)(a1 + 32) + 16) = v8;
}

void sub_10002E9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002EA0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002EA1C(uint64_t a1)
{
}

void sub_10002EA24(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = +[CNAccount predicateForAccountWithExternalIdentifier:*(void *)(a1 + 32)];
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x3032000000;
  unint64_t v37 = sub_10002EA0C;
  char v38 = sub_10002EA1C;
  id v39 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002ED38;
  v30[3] = &unk_1000552A0;
  unint64_t v33 = &v34;
  id v5 = v3;
  id v31 = v5;
  id v6 = v4;
  id v32 = v6;
  unint64_t v7 = sub_100005874((uint64_t)v30);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000387CC(v8);
    }
  }
  else
  {
    id v9 = [(id)v35[5] firstObject];
    int v10 = [v9 identifier];
    int v11 = +[CNContainer predicateForContainersInAccountWithIdentifier:v10];

    uint64_t v24 = 0;
    unint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    char v27 = sub_10002EA0C;
    unsigned int v28 = sub_10002EA1C;
    id v29 = 0;
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    unsigned int v19 = sub_10002EDB8;
    uint64_t v20 = &unk_1000552A0;
    char v23 = &v24;
    id v21 = v5;
    id v12 = v11;
    id v22 = v12;
    unint64_t v7 = sub_100005874((uint64_t)&v17);
    if (v7)
    {
      uint64_t v13 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100038754((uint64_t)v7, v13);
      }
    }
    else
    {
      uint64_t v14 = [v25[5] firstObject:v17, v18, v19, v20, v21];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      char v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    _Block_object_dispose(&v24, 8);
  }
  _Block_object_dispose(&v34, 8);
}

void sub_10002ED04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_10002ED38(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 accountsMatchingPredicate:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  return v5;
}

id sub_10002EDB8(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 containersMatchingPredicate:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  return v5;
}

uint64_t sub_10002F05C(uint64_t a1, uint64_t a2)
{
  id v2 = +[ABSAccountsManager setupContainerConfiguredWithAttributes:*(void *)(a1 + 32) store:a2];
  return 1;
}

void sub_10002F334(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  qword_100069D30 = (info.numer << 8) / info.denom;
}

void sub_10002F580(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&qword_1000699F8 = (double)v1 / (double)v2;
  }
}

uint64_t sub_10002F6FC(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

__CFString *sub_1000300BC(void *a1)
{
  if (byte_100069D48)
  {
    if (a1)
    {
      id v1 = a1;
      CFTypeID v2 = CFGetTypeID(v1);
      if (v2 == CFNumberGetTypeID())
      {
        if (qword_100069D58 != -1) {
          dispatch_once(&qword_100069D58, &stru_100055880);
        }
        StringWithNumber = (void *)CFNumberFormatterCreateStringWithNumber(0, (CFNumberFormatterRef)qword_100069D50, (CFNumberRef)v1);
      }
      else
      {
        StringWithNumber = [v1 description];
      }
      id v5 = StringWithNumber;
      if (StringWithNumber)
      {
        sub_1000301F0(StringWithNumber);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v4 = @"[VOID]";
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = a1;
  }

  return v4;
}

void sub_1000301C0(id a1)
{
  CFLocaleRef System = CFLocaleGetSystem();
  qword_100069D50 = (uint64_t)CFNumberFormatterCreate(0, System, kCFNumberFormatterNoStyle);
}

__CFString *sub_1000301F0(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (+[NDTLog obfuscate])
    {
      CFTypeID v2 = (const char *)[v1 UTF8String];
      uInt v3 = strlen(v2);
      uint64_t v4 = +[NSString stringWithFormat:@">%08x<", crc32(0, (const Bytef *)v2, v3)];
    }
    else
    {
      uint64_t v4 = (__CFString *)v1;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = @"(nil)";
  }

  return v5;
}

uint64_t ABSPBFavoritesSyncObjectReadFrom(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      id v12 = objc_alloc_init(ABSPBFavoritesEntry);
      [a1 addEntry:v12];
      if (!PBReaderPlaceMark() || (ABSPBFavoritesEntryReadFrom((uint64_t)v12, a2) & 1) == 0)
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
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10003120C(uint64_t a1)
{
  CFTypeID v2 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unmarking shadows...", buf, 2u);
  }
  uInt v3 = [*(id *)(a1 + 32) syncController];
  [v3 clearShadowMarks];

  char v4 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "...shadow marks cleared.", v6, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100031A88(id a1)
{
  if (!qword_100069D60)
  {
    qword_100069D60 = objc_alloc_init(ABSyncInterface);
    _objc_release_x1();
  }
}

double sub_100031FE0(id a1, double a2)
{
  double v2 = a2 * 1.4;
  uInt v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100038A14(v3, v2);
  }
  if (v2 > 60.0)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_1000389E0();
    }
    return 60.0;
  }
  return v2;
}

void sub_100032094(uint64_t a1)
{
  double v2 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ABSyncInterface, syncTimer fired", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0;

  if ([*(id *)(a1 + 32) automaticSync])
  {
    unsigned int v5 = [*(id *)(a1 + 32) syncService];
    [v5 setHasChangesAvailable];
  }
  else
  {
    unint64_t v6 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Automatic sync suppressed.", v7, 2u);
    }
  }
}

void sub_100032190(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)os_transaction_create();
  unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received kABSyncClientBeginningMultiSave", buf, 2u);
  }
  id v6 = a2;
  unint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 unlockQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100036EC4;
    v9[3] = &unk_100054FA8;
    id v10 = v7;
    id v11 = v3;
    dispatch_async(v8, v9);
  }
}

void sub_1000322C8(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)os_transaction_create();
  unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received kABSyncClientFinishedMultiSave", buf, 2u);
  }
  id v6 = a2;
  unint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 unlockQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100036F7C;
    v9[3] = &unk_100054FA8;
    id v10 = v7;
    id v11 = v3;
    dispatch_async(v8, v9);
  }
}

void -[ABSyncInterface _blockUntilUnlock](ABSyncInterface *self, SEL a2)
{
  double v2 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Entered.", buf, 2u);
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  *(_DWORD *)buf = 0;
  char v4 = dispatch_get_global_queue(0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100032664;
  handler[3] = &unk_100055908;
  unsigned int v5 = v3;
  id v10 = v5;
  uint32_t v6 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)buf, v4, handler);

  if (v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100038A90();
    }
  }
  else
  {
    if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1) {
      dispatch_semaphore_signal(v5);
    }
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    notify_cancel(*(int *)buf);
  }
  unint64_t v7 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Protected data available.", v8, 2u);
  }
}

intptr_t sub_100032664(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100032F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    sleep(5u);
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
      sub_100038B3C();
    }
    exit(-1);
  }
  unsigned int v5 = string;
  uint32_t v6 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received XPC notification: %s", (uint8_t *)&v11, 0xCu);
  }
  if (!strcmp(v5, "__ABDataBaseChangedByOtherProcessNotification")
    || !strcmp(v5, "ABFavoritesListChangedExternallyNotification")
    || !strcmp(v5, "CNFavoritesChangedExternallyNotification"))
  {
    char v8 = +[ABSyncInterface sharedInstance];
    id v10 = [v8 signalCoalescer];
    [v10 signal];

LABEL_16:
    goto LABEL_17;
  }
  if (strcmp(v5, "com.apple.addressbooksync.idslaunchnotification"))
  {
    if (!strcmp(v5, "com.apple.addressbooksync.setupcomplete"))
    {
      unint64_t v7 = +[ABSyncInterface sharedInstance];
      char v8 = v7;
      CFStringRef v9 = @"Received XPC message: com.apple.addressbooksync.setupcomplete";
      goto LABEL_20;
    }
    if (!strcmp(v5, "ForceFullSync"))
    {
      unint64_t v7 = +[ABSyncInterface sharedInstance];
      char v8 = v7;
      CFStringRef v9 = @"received XPC message: com.apple.addressbooksync.fullsync";
      goto LABEL_20;
    }
    if (!strcmp(v5, "com.apple.datamigrator.migrationDidFinish"))
    {
      [*(id *)(a1 + 32) _migrationCheck];
      goto LABEL_17;
    }
    if (!strcmp(v5, "com.apple.pairedsync.syncDidComplete"))
    {
      [*(id *)(a1 + 32) setMustBeReset:[*(id *)(*(void *)(a1 + 32) + 48) getBoolValueForKey:@"RetryMustBeReset" default:0]];
      if ([*(id *)(a1 + 32) partialSyncEligible])
      {
        if (([*(id *)(a1 + 32) shouldNextResetSyncBePartial] & 1) == 0)
        {
          unint64_t v7 = +[ABSyncInterface sharedInstance];
          char v8 = v7;
          CFStringRef v9 = @"Received darwin notification: com.apple.pairedsync.syncDidComplete";
LABEL_20:
          [v7 requestFullSync:v9];
          goto LABEL_16;
        }
      }
    }
  }
LABEL_17:
}

void sub_100033350(uint64_t a1)
{
  if ((uint64_t)[*(id *)(*(void *)(a1 + 32) + 48) getIntegerValueForKey:@"failureCount" default:0] < 1)
  {
    id v3 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Time for scheduled recovery sync but there are no failures now. Ignoring.", v7, 2u);
    }
    [*(id *)(a1 + 40) completeAndFireNever];
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 48) getBoolValueForKey:@"RetryMustBeReset" default:0])
  {
    double v2 = *(void **)(a1 + 32);
    [v2 requestFullSync:@"Reset retry after failed reset."];
  }
  else
  {
    char v4 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delta retry after failed sync", buf, 2u);
    }
    if ([*(id *)(a1 + 32) automaticSync])
    {
      unsigned int v5 = [*(id *)(a1 + 32) syncService];
      [v5 setHasChangesAvailable];
    }
    else
    {
      uint32_t v6 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Automatic delta sync retry suppressed", v8, 2u);
      }
    }
  }
}

uint64_t sub_10003386C(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(*(void *)(a1 + 32) + 48) getIntegerValueForKey:@"failureCount" default:0];
  if (result >= 1)
  {
    id v3 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduled retry after failed sync and process restart", v4, 2u);
    }
    return (uint64_t)[*(id *)(*(void *)(a1 + 32) + 40) setHasChangesAvailable];
  }
  return result;
}

void sub_1000339A8(uint64_t a1)
{
  double v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[10])
  {
    dispatch_source_cancel(v2[10]);
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;

    double v2 = *(dispatch_source_t **)(a1 + 32);
  }
  unsigned int v5 = [(dispatch_source_t *)v2 unlockQueue];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = v6;

  CFStringRef v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(NSObject **)(v11 + 80);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100033ACC;
  handler[3] = &unk_100054DD0;
  void handler[4] = v11;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
}

void sub_100033ACC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 33))
  {
    *(unsigned char *)(v4 + 33) = 0;
    unsigned int v5 = [*(id *)(a1 + 32) queue];
    dispatch_resume(v5);

    dispatch_source_t v6 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CHANGES RESUMED", v7, 2u);
    }
  }
}

void sub_100033C34(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100033C48(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((uint64_t)[WeakRetained[6] getIntegerValueForKey:@"sessionEdition" default:0] <= 6)
  {
    [WeakRetained[6] setIntegerValue:[WeakRetained[6] getIntegerValueForKey:@"failureCount" default:0] + 1 forKey:@"failureCount"];
    [WeakRetained requestFullSync:@"Scheduled full sync because edition < CURRENT_EDITION"];
  }
}

void sub_1000345FC(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Locking session idle queue.", v3, 2u);
  }
  dispatch_suspend(*(dispatch_object_t *)(a1 + 32));
}

void sub_100036450(uint64_t a1)
{
  [*(id *)(a1 + 32) setMustBeReset:[*(id *)(*(void *)(a1 + 32) + 48) getBoolValueForKey:@"RetryMustBeReset" default:0]];
  uint64_t v2 = [*(id *)(a1 + 32) serverState];
  [v2 setBoolValue:1 forKey:@"RetryMustBeReset"];

  uint64_t v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting full sync because: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  unsigned int v5 = [*(id *)(a1 + 32) syncService];
  [v5 setNeedsResetSync];
}

void sub_1000365D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036960(uint64_t a1)
{
  uint64_t v2 = +[SYDevice targetableDevice];
  uint64_t v3 = [v2 systemBuildVersion];
  uint64_t v4 = [*(id *)(a1 + 32) watchBuildVersion];
  unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    *(void *)uint64_t v17 = v4;
    *(_WORD *)&v17[8] = 2114;
    uint64_t v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "watchUpdated: %{public}@ => %{public}@", (uint8_t *)&v16, 0x16u);
  }
  int v6 = [v4 substringToIndex:2];
  uint64_t v7 = [v3 substringToIndex:2];
  id v8 = [v6 compare:@"16"];
  id v9 = [v7 compare:@"16"];
  dispatch_time_t v10 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109376;
    *(_DWORD *)uint64_t v17 = v9 == (id)-1;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v8 == (id)-1;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "watchUpdated: newPre16: %d, oldPre16: %d", (uint8_t *)&v16, 0xEu);
  }
  id v11 = [v3 copy];
  [*(id *)(a1 + 32) setWatchBuildVersion:v11];

  uint64_t v12 = (uint64_t)[*(id *)(*(void *)(a1 + 32) + 48) getIntegerValueForKey:@"failureCount" default:0];
  if (v8 == (id)-1 && v9 != (id)-1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setIntegerValue:v12 + 1 forKey:@"failureCount"];
    uint64_t v13 = *(void **)(a1 + 32);
    CFStringRef v14 = @"watchUpdated: We need a full sync as watch crossed the 15-16 boundary.";
LABEL_10:
    [v13 requestFullSync:v14];
    goto LABEL_11;
  }
  if (v12 >= 1)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    CFStringRef v14 = @"watchUpdated: Triggering a full sync due to watch upgrade and positive failure count";
    goto LABEL_10;
  }
  uint64_t v15 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "watchUpdated: Benign watch update, no action taken.", (uint8_t *)&v16, 2u);
  }
LABEL_11:
}

id sub_100036EC4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) externalChangesGoingOn] & 1) == 0)
  {
    [*(id *)(a1 + 32) setExternalChangesGoingOn:1];
    uint64_t v2 = [*(id *)(a1 + 32) queue];
    dispatch_suspend(v2);

    uint64_t v3 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CHANGES SUSPENDED", v5, 2u);
    }
  }
  return [*(id *)(a1 + 32) startUnlockTimer:300.0];
}

id sub_100036F7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) startUnlockTimer:2.0];
}

void sub_1000370C4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8) && *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setElapsed:CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(a1 + 32) + 16)];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    uint64_t v2 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Declaring sync done to PSYServiceSyncSession.", v4, 2u);
    }
    uint64_t v3 = [*(id *)(a1 + 32) session];
    [v3 syncDidComplete];
  }
}

void sub_1000371C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failure to fetch contact count: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003723C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ResetSource fetched a nil contact.", v1, 2u);
}

void sub_100037280(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received an odd state in checkin: %d.", (uint8_t *)v2, 8u);
}

void sub_1000372F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error setting me card: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100037370(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed save request: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000373E8()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, (os_log_type_t)0x90u, "Manually triggered state dump", v0, 2u);
}

void sub_100037430(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching contacts for link validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000374A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching estimated change log size: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100037520(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Critical error fetching change log: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100037598(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fleshing out contact %{public}@ failed, error: %{public}@.", (uint8_t *)&v4, 0x16u);
}

void sub_100037628(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't fetch container for contact %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000376B0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't fetch container for contact %{public}@", buf, 0xCu);
}

void sub_100037708(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't fetch account for container %{public}@: %{public}@", buf, 0x16u);
}

void sub_100037770(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000377DC(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2082;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SQL Exec error: %d %{public}s", (uint8_t *)v4, 0x12u);
}

void sub_100037868(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sqlite statement prepare failed for \"%{public}s\"", (uint8_t *)&v2, 0xCu);
}

void sub_1000378E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003794C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000379B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Sqlite statement prepare failed for user schema fetch", v1, 2u);
}

void sub_1000379FC()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "bindLinks passed a nil guid.", v2, v3, v4, v5, v6);
}

void sub_100037A30()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Failed to unarchive CNSensitiveContentConfiguration data blob", v2, v3, v4, v5, v6);
}

void sub_100037A64()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "vCard parsing did not return exactly 1 contact.", v2, v3, v4, v5, v6);
}

void sub_100037A98()
{
  sub_10001FE10();
  sub_10001FDF4((void *)&_mh_execute_header, v0, v1, "Failure to save before setting me card: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100037B00()
{
  sub_10001FE10();
  sub_10001FDF4((void *)&_mh_execute_header, v0, v1, "Error parsing vCard data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100037B68()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Trying to add a contact but the protobuf has no decodable data.", v2, v3, v4, v5, v6);
}

void sub_100037B9C()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Failed to unarchive grammars data blob", v2, v3, v4, v5, v6);
}

void sub_100037BD0()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Trying to modify a contact but no toContact.", v2, v3, v4, v5, v6);
}

void sub_100037C04()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Trying to modify a contact but the protobuf has no decodable data.", v2, v3, v4, v5, v6);
}

void sub_100037C38()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Attempt to modify contact with nil guid.", v2, v3, v4, v5, v6);
}

void sub_100037C6C(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error finding contact to delete. GUID: %{public}@ Error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100037CF8()
{
  sub_10001FE10();
  sub_10001FDF4((void *)&_mh_execute_header, v0, v1, "Error building batch delete request. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100037D60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to archive sensitiveContentOverride", v1, 2u);
}

void sub_100037DA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to archive pronouns: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_100037E1C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find contact record for id: %{public}@", buf, 0xCu);
}

void sub_100037E74(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempt to serialize out contact with nil or empty identifier.", v1, 2u);
}

void sub_100037EB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching contact for protobuf serialization: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100037F30(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching unified contact for link analysis: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100037FA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error enumerating link cluster members: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100038020()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Thread lockup. Autodefenestrating.", v2, v3, v4, v5, v6);
}

void sub_100038054()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "enqueueChange returned no for validation.", v2, v3, v4, v5, v6);
}

void sub_100038088()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "enqueueChange returned no for favorites.", v2, v3, v4, v5, v6);
}

void sub_1000380BC()
{
  id v0 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "== Aborting as requested.", v1, 2u);
  }
}

void sub_100038134()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "enqueueChange returned no for container.", v2, v3, v4, v5, v6);
}

void sub_100038168()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "enqueueChange returned no for accounts.", v2, v3, v4, v5, v6);
}

void sub_10003819C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error sending session: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100038248()
{
  __assert_rtn("NDTSetDefaultPriority", "NDTQueueFactory.m", 17, "qos != QOS_CLASS_UNSPECIFIED");
}

void sub_100038274()
{
  __assert_rtn("NDTSetElevatedPriority", "NDTQueueFactory.m", 22, "qos != QOS_CLASS_UNSPECIFIED");
}

void sub_1000382A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Beeg data, can't send :(", v1, 2u);
}

void sub_1000382E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "ABSSyContainer:initWithData: failed.", v1, 2u);
}

void sub_100038328(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error saving DB while creating account: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000383A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching account for account external ID [%{public}@]: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100038428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038460(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000384D0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failure to fetch local container: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100038550(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** TRANSPORT - PACKET NUMBER OUT OF SEQUENCE. THIS IS BAD. ***", v1, 2u);
}

void sub_100038594()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Was passed an empty batch. This makes me angry.", v2, v3, v4, v5, v6);
}

void sub_1000385C8()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Wrong object type passed to addSyChange", v2, v3, v4, v5, v6);
}

void sub_1000385FC()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Wrong object type passed to updateSyChange", v2, v3, v4, v5, v6);
}

void sub_100038630()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Wrong object type passed to deleteSyChange", v2, v3, v4, v5, v6);
}

void sub_100038664()
{
  sub_10002E854();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Census mismatch, already faulted. Local: %@, remote: %@", v1, 0x16u);
}

void sub_1000386DC()
{
  sub_10002E854();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Census mismatch. Local: %@, remote: %@", v1, 0x16u);
}

void sub_100038754(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot find container in account for guardian restriction: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000387CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find any accounts for guardianRestriction bit", v1, 2u);
}

void sub_100038810(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to figure out what encoder to use. Flailing back to vCard.", v1, 2u);
}

void sub_100038854(void *a1)
{
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Unexpected class of metadata: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000388FC()
{
  os_log_t v0 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "== Aborting as requested.", v1, 2u);
  }
  abort();
}

void sub_100038968(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sync complete with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000389E0()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Signal coalescing delay has hit the maximum. Something may be wrong if a long sync is not expected.", v2, v3, v4, v5, v6);
}

void sub_100038A14(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "New coalescing delay: %0.2f", (uint8_t *)&v2, 0xCu);
}

void sub_100038A90()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Could not register notification. Continuing anyway.", v2, v3, v4, v5, v6);
}

void sub_100038AC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error resuming sync service, will exit: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100038B3C()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "CS did not startup correctly. Exiting.", v2, v3, v4, v5, v6);
}

void sub_100038B70()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Creating contact source in _startSendSession failed.", v2, v3, v4, v5, v6);
}

void sub_100038BA4()
{
  sub_10001FDE8();
  sub_10001FDCC((void *)&_mh_execute_header, v0, v1, "Creating contacts source failed.", v2, v3, v4, v5, v6);
}

void sub_100038BD8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sync error: %{public}@", (uint8_t *)&v2, 0xCu);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return _CFLocaleGetSystem();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return _CFNumberFormatterCreate(allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number)
{
  return _CFNumberFormatterCreateStringWithNumber(allocator, formatter, number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void abort(void)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

int close(int a1)
{
  return _close(a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

uint64_t ct_green_tea_logger_create()
{
  return _ct_green_tea_logger_create();
}

uint64_t ct_green_tea_logger_destroy()
{
  return _ct_green_tea_logger_destroy();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

long double scalbn(long double __x, int __y)
{
  return _scalbn(__x, __y);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return _sqlite3_bind_parameter_count(a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_CNFSDeserialize(void *a1, const char *a2, ...)
{
  return [a1 CNFSDeserialize];
}

id objc_msgSend_CNFSSerialize(void *a1, const char *a2, ...)
{
  return [a1 CNFSSerialize];
}

id objc_msgSend_ISOCountryCode(void *a1, const char *a2, ...)
{
  return [a1 ISOCountryCode];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__activityComplete(void *a1, const char *a2, ...)
{
  return [a1 _activityComplete];
}

id objc_msgSend__batchSupplier(void *a1, const char *a2, ...)
{
  return [a1 _batchSupplier];
}

id objc_msgSend__blockUntilUnlock(void *a1, const char *a2, ...)
{
  return [a1 _blockUntilUnlock];
}

id objc_msgSend__bootstrap(void *a1, const char *a2, ...)
{
  return [a1 _bootstrap];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__checkIn(void *a1, const char *a2, ...)
{
  return [a1 _checkIn];
}

id objc_msgSend__checkServerStateOnStartup(void *a1, const char *a2, ...)
{
  return [a1 _checkServerStateOnStartup];
}

id objc_msgSend__closeDb(void *a1, const char *a2, ...)
{
  return [a1 _closeDb];
}

id objc_msgSend__computeProgressMultiplier(void *a1, const char *a2, ...)
{
  return [a1 _computeProgressMultiplier];
}

id objc_msgSend__createDb(void *a1, const char *a2, ...)
{
  return [a1 _createDb];
}

id objc_msgSend__createParentDirectory(void *a1, const char *a2, ...)
{
  return [a1 _createParentDirectory];
}

id objc_msgSend__currentCriteria(void *a1, const char *a2, ...)
{
  return [a1 _currentCriteria];
}

id objc_msgSend__databaseChangedExternally(void *a1, const char *a2, ...)
{
  return [a1 _databaseChangedExternally];
}

id objc_msgSend__decrementInUse(void *a1, const char *a2, ...)
{
  return [a1 _decrementInUse];
}

id objc_msgSend__fetchAnchor(void *a1, const char *a2, ...)
{
  return [a1 _fetchAnchor];
}

id objc_msgSend__getContainer(void *a1, const char *a2, ...)
{
  return [a1 _getContainer];
}

id objc_msgSend__initSyncStore(void *a1, const char *a2, ...)
{
  return [a1 _initSyncStore];
}

id objc_msgSend__localContainer(void *a1, const char *a2, ...)
{
  return [a1 _localContainer];
}

id objc_msgSend__migrationCheck(void *a1, const char *a2, ...)
{
  return [a1 _migrationCheck];
}

id objc_msgSend__newPath(void *a1, const char *a2, ...)
{
  return [a1 _newPath];
}

id objc_msgSend__openDatabase(void *a1, const char *a2, ...)
{
  return [a1 _openDatabase];
}

id objc_msgSend__openDb(void *a1, const char *a2, ...)
{
  return [a1 _openDb];
}

id objc_msgSend__prepDatabase(void *a1, const char *a2, ...)
{
  return [a1 _prepDatabase];
}

id objc_msgSend__recreatePath(void *a1, const char *a2, ...)
{
  return [a1 _recreatePath];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForNotifications];
}

id objc_msgSend__saveGuardianRestrictionBit(void *a1, const char *a2, ...)
{
  return [a1 _saveGuardianRestrictionBit];
}

id objc_msgSend__scheduleRetrySync(void *a1, const char *a2, ...)
{
  return [a1 _scheduleRetrySync];
}

id objc_msgSend__sendMultisaveBegin(void *a1, const char *a2, ...)
{
  return [a1 _sendMultisaveBegin];
}

id objc_msgSend__setupLogging(void *a1, const char *a2, ...)
{
  return [a1 _setupLogging];
}

id objc_msgSend__shouldFakeFailure(void *a1, const char *a2, ...)
{
  return [a1 _shouldFakeFailure];
}

id objc_msgSend__startDeferralPolling(void *a1, const char *a2, ...)
{
  return [a1 _startDeferralPolling];
}

id objc_msgSend__stopDeferralPolling(void *a1, const char *a2, ...)
{
  return [a1 _stopDeferralPolling];
}

id objc_msgSend__userSchema(void *a1, const char *a2, ...)
{
  return [a1 _userSchema];
}

id objc_msgSend_abortAfter(void *a1, const char *a2, ...)
{
  return [a1 abortAfter];
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return [a1 accessQueue];
}

id objc_msgSend_accountExternalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountExternalIdentifier];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifiers];
}

id objc_msgSend_accountsMessage(void *a1, const char *a2, ...)
{
  return [a1 accountsMessage];
}

id objc_msgSend_accountsSyncObject(void *a1, const char *a2, ...)
{
  return [a1 accountsSyncObject];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityCondition(void *a1, const char *a2, ...)
{
  return [a1 activityCondition];
}

id objc_msgSend_addMods(void *a1, const char *a2, ...)
{
  return [a1 addMods];
}

id objc_msgSend_addReplaceBlock(void *a1, const char *a2, ...)
{
  return [a1 addReplaceBlock];
}

id objc_msgSend_addresses(void *a1, const char *a2, ...)
{
  return [a1 addresses];
}

id objc_msgSend_addressesCount(void *a1, const char *a2, ...)
{
  return [a1 addressesCount];
}

id objc_msgSend_addressingGrammarsEncrypted(void *a1, const char *a2, ...)
{
  return [a1 addressingGrammarsEncrypted];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_automaticSync(void *a1, const char *a2, ...)
{
  return [a1 automaticSync];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction];
}

id objc_msgSend_birthday(void *a1, const char *a2, ...)
{
  return [a1 birthday];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifiers];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarIdentifier];
}

id objc_msgSend_callAlert(void *a1, const char *a2, ...)
{
  return [a1 callAlert];
}

id objc_msgSend_capturedError(void *a1, const char *a2, ...)
{
  return [a1 capturedError];
}

id objc_msgSend_changeLogEnumerator(void *a1, const char *a2, ...)
{
  return [a1 changeLogEnumerator];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_childCardDAVAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 childCardDAVAccountIdentifier];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_clearAddresses(void *a1, const char *a2, ...)
{
  return [a1 clearAddresses];
}

id objc_msgSend_clearEmails(void *a1, const char *a2, ...)
{
  return [a1 clearEmails];
}

id objc_msgSend_clearEntrys(void *a1, const char *a2, ...)
{
  return [a1 clearEntrys];
}

id objc_msgSend_clearGroupNames(void *a1, const char *a2, ...)
{
  return [a1 clearGroupNames];
}

id objc_msgSend_clearLinkTos(void *a1, const char *a2, ...)
{
  return [a1 clearLinkTos];
}

id objc_msgSend_clearMeCardSet(void *a1, const char *a2, ...)
{
  return [a1 clearMeCardSet];
}

id objc_msgSend_clearPhoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 clearPhoneNumbers];
}

id objc_msgSend_clearShadowMarks(void *a1, const char *a2, ...)
{
  return [a1 clearShadowMarks];
}

id objc_msgSend_clearUrls(void *a1, const char *a2, ...)
{
  return [a1 clearUrls];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitTransaction(void *a1, const char *a2, ...)
{
  return [a1 commitTransaction];
}

id objc_msgSend_completeAndFireNever(void *a1, const char *a2, ...)
{
  return [a1 completeAndFireNever];
}

id objc_msgSend_completeAndFireOnConnection(void *a1, const char *a2, ...)
{
  return [a1 completeAndFireOnConnection];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return [a1 contactRelations];
}

id objc_msgSend_contactType(void *a1, const char *a2, ...)
{
  return [a1 contactType];
}

id objc_msgSend_contactWrapper(void *a1, const char *a2, ...)
{
  return [a1 contactWrapper];
}

id objc_msgSend_contactsSource(void *a1, const char *a2, ...)
{
  return [a1 contactsSource];
}

id objc_msgSend_containerAttributes(void *a1, const char *a2, ...)
{
  return [a1 containerAttributes];
}

id objc_msgSend_containerSyncObject(void *a1, const char *a2, ...)
{
  return [a1 containerSyncObject];
}

id objc_msgSend_containsCustomPoster(void *a1, const char *a2, ...)
{
  return [a1 containsCustomPoster];
}

id objc_msgSend_containsInterestingChanges(void *a1, const char *a2, ...)
{
  return [a1 containsInterestingChanges];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countRecip(void *a1, const char *a2, ...)
{
  return [a1 countRecip];
}

id objc_msgSend_countSoFar(void *a1, const char *a2, ...)
{
  return [a1 countSoFar];
}

id objc_msgSend_countValidationObject(void *a1, const char *a2, ...)
{
  return [a1 countValidationObject];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_cpuTime(void *a1, const char *a2, ...)
{
  return [a1 cpuTime];
}

id objc_msgSend_createTables(void *a1, const char *a2, ...)
{
  return [a1 createTables];
}

id objc_msgSend_criteriaDelay(void *a1, const char *a2, ...)
{
  return [a1 criteriaDelay];
}

id objc_msgSend_criteriaOnConnection(void *a1, const char *a2, ...)
{
  return [a1 criteriaOnConnection];
}

id objc_msgSend_currentDelay(void *a1, const char *a2, ...)
{
  return [a1 currentDelay];
}

id objc_msgSend_currentGuardianRestriction(void *a1, const char *a2, ...)
{
  return [a1 currentGuardianRestriction];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentHistoryToken(void *a1, const char *a2, ...)
{
  return [a1 currentHistoryToken];
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return [a1 currentIndex];
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return [a1 currentVersion];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dataRepresentation];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dates(void *a1, const char *a2, ...)
{
  return [a1 dates];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_decrementInUse(void *a1, const char *a2, ...)
{
  return [a1 decrementInUse];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContainerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultContainerIdentifier];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_degenerateChange(void *a1, const char *a2, ...)
{
  return [a1 degenerateChange];
}

id objc_msgSend_delayUs(void *a1, const char *a2, ...)
{
  return [a1 delayUs];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteBlock(void *a1, const char *a2, ...)
{
  return [a1 deleteBlock];
}

id objc_msgSend_deleteShadow(void *a1, const char *a2, ...)
{
  return [a1 deleteShadow];
}

id objc_msgSend_deleteUnmarked(void *a1, const char *a2, ...)
{
  return [a1 deleteUnmarked];
}

id objc_msgSend_deleteWrapper(void *a1, const char *a2, ...)
{
  return [a1 deleteWrapper];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return [a1 deletes];
}

id objc_msgSend_departmentName(void *a1, const char *a2, ...)
{
  return [a1 departmentName];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dirtyMemory(void *a1, const char *a2, ...)
{
  return [a1 dirtyMemory];
}

id objc_msgSend_displayname(void *a1, const char *a2, ...)
{
  return [a1 displayname];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downtimeWhitelist(void *a1, const char *a2, ...)
{
  return [a1 downtimeWhitelist];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_emailsCount(void *a1, const char *a2, ...)
{
  return [a1 emailsCount];
}

id objc_msgSend_encryptedPronounData(void *a1, const char *a2, ...)
{
  return [a1 encryptedPronounData];
}

id objc_msgSend_entrys(void *a1, const char *a2, ...)
{
  return [a1 entrys];
}

id objc_msgSend_entrysCount(void *a1, const char *a2, ...)
{
  return [a1 entrysCount];
}

id objc_msgSend_era(void *a1, const char *a2, ...)
{
  return [a1 era];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_estimatedFireDate(void *a1, const char *a2, ...)
{
  return [a1 estimatedFireDate];
}

id objc_msgSend_externalChangesGoingOn(void *a1, const char *a2, ...)
{
  return [a1 externalChangesGoingOn];
}

id objc_msgSend_externalIdentifierString(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifierString];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fastEncodingData(void *a1, const char *a2, ...)
{
  return [a1 fastEncodingData];
}

id objc_msgSend_favoritesCount(void *a1, const char *a2, ...)
{
  return [a1 favoritesCount];
}

id objc_msgSend_favoritesSyncObject(void *a1, const char *a2, ...)
{
  return [a1 favoritesSyncObject];
}

id objc_msgSend_fetchBlob(void *a1, const char *a2, ...)
{
  return [a1 fetchBlob];
}

id objc_msgSend_fetchDouble(void *a1, const char *a2, ...)
{
  return [a1 fetchDouble];
}

id objc_msgSend_fetchInteger(void *a1, const char *a2, ...)
{
  return [a1 fetchInteger];
}

id objc_msgSend_fetchString(void *a1, const char *a2, ...)
{
  return [a1 fetchString];
}

id objc_msgSend_fifo(void *a1, const char *a2, ...)
{
  return [a1 fifo];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_fireAction(void *a1, const char *a2, ...)
{
  return [a1 fireAction];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromContact(void *a1, const char *a2, ...)
{
  return [a1 fromContact];
}

id objc_msgSend_fullSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 fullSessionTimeout];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_groupNamesCount(void *a1, const char *a2, ...)
{
  return [a1 groupNamesCount];
}

id objc_msgSend_gtLogger(void *a1, const char *a2, ...)
{
  return [a1 gtLogger];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_hasAccountsSyncObject(void *a1, const char *a2, ...)
{
  return [a1 hasAccountsSyncObject];
}

id objc_msgSend_hasBirthday(void *a1, const char *a2, ...)
{
  return [a1 hasBirthday];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_hasCallAlert(void *a1, const char *a2, ...)
{
  return [a1 hasCallAlert];
}

id objc_msgSend_hasContactWrapper(void *a1, const char *a2, ...)
{
  return [a1 hasContactWrapper];
}

id objc_msgSend_hasContainerSyncObject(void *a1, const char *a2, ...)
{
  return [a1 hasContainerSyncObject];
}

id objc_msgSend_hasCountValidationObject(void *a1, const char *a2, ...)
{
  return [a1 hasCountValidationObject];
}

id objc_msgSend_hasDay(void *a1, const char *a2, ...)
{
  return [a1 hasDay];
}

id objc_msgSend_hasDeleteWrapper(void *a1, const char *a2, ...)
{
  return [a1 hasDeleteWrapper];
}

id objc_msgSend_hasEra(void *a1, const char *a2, ...)
{
  return [a1 hasEra];
}

id objc_msgSend_hasFastEncodingData(void *a1, const char *a2, ...)
{
  return [a1 hasFastEncodingData];
}

id objc_msgSend_hasFavoritesCount(void *a1, const char *a2, ...)
{
  return [a1 hasFavoritesCount];
}

id objc_msgSend_hasFavoritesSyncObject(void *a1, const char *a2, ...)
{
  return [a1 hasFavoritesSyncObject];
}

id objc_msgSend_hasGuid(void *a1, const char *a2, ...)
{
  return [a1 hasGuid];
}

id objc_msgSend_hasIsMe(void *a1, const char *a2, ...)
{
  return [a1 hasIsMe];
}

id objc_msgSend_hasLocalContainerEnabled(void *a1, const char *a2, ...)
{
  return [a1 hasLocalContainerEnabled];
}

id objc_msgSend_hasMonth(void *a1, const char *a2, ...)
{
  return [a1 hasMonth];
}

id objc_msgSend_hasNonGregorianBirthday(void *a1, const char *a2, ...)
{
  return [a1 hasNonGregorianBirthday];
}

id objc_msgSend_hasPb(void *a1, const char *a2, ...)
{
  return [a1 hasPb];
}

id objc_msgSend_hasRawCount(void *a1, const char *a2, ...)
{
  return [a1 hasRawCount];
}

id objc_msgSend_hasSendTimestamp(void *a1, const char *a2, ...)
{
  return [a1 hasSendTimestamp];
}

id objc_msgSend_hasSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 hasSequenceNumber];
}

id objc_msgSend_hasTextAlert(void *a1, const char *a2, ...)
{
  return [a1 hasTextAlert];
}

id objc_msgSend_hasUnifiedCount(void *a1, const char *a2, ...)
{
  return [a1 hasUnifiedCount];
}

id objc_msgSend_hasVcardData(void *a1, const char *a2, ...)
{
  return [a1 hasVcardData];
}

id objc_msgSend_hasWallpaperDataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 hasWallpaperDataRepresentation];
}

id objc_msgSend_hasYear(void *a1, const char *a2, ...)
{
  return [a1 hasYear];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_historyAnchor(void *a1, const char *a2, ...)
{
  return [a1 historyAnchor];
}

id objc_msgSend_holdTransaction(void *a1, const char *a2, ...)
{
  return [a1 holdTransaction];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_iSOCountryCode(void *a1, const char *a2, ...)
{
  return [a1 iSOCountryCode];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreContactAccountIDs(void *a1, const char *a2, ...)
{
  return [a1 ignoreContactAccountIDs];
}

id objc_msgSend_ignoreMute(void *a1, const char *a2, ...)
{
  return [a1 ignoreMute];
}

id objc_msgSend_incrementInUse(void *a1, const char *a2, ...)
{
  return [a1 incrementInUse];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return [a1 instance];
}

id objc_msgSend_instanceName(void *a1, const char *a2, ...)
{
  return [a1 instanceName];
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return [a1 instantMessageAddresses];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isGuardianRestricted(void *a1, const char *a2, ...)
{
  return [a1 isGuardianRestricted];
}

id objc_msgSend_isImage(void *a1, const char *a2, ...)
{
  return [a1 isImage];
}

id objc_msgSend_isInternalDevice(void *a1, const char *a2, ...)
{
  return [a1 isInternalDevice];
}

id objc_msgSend_isLeapMonth(void *a1, const char *a2, ...)
{
  return [a1 isLeapMonth];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return [a1 isMe];
}

id objc_msgSend_isName(void *a1, const char *a2, ...)
{
  return [a1 isName];
}

id objc_msgSend_isNull(void *a1, const char *a2, ...)
{
  return [a1 isNull];
}

id objc_msgSend_isPreferredForImage(void *a1, const char *a2, ...)
{
  return [a1 isPreferredForImage];
}

id objc_msgSend_isPreferredForName(void *a1, const char *a2, ...)
{
  return [a1 isPreferredForName];
}

id objc_msgSend_isReset(void *a1, const char *a2, ...)
{
  return [a1 isReset];
}

id objc_msgSend_isResetSync(void *a1, const char *a2, ...)
{
  return [a1 isResetSync];
}

id objc_msgSend_isSending(void *a1, const char *a2, ...)
{
  return [a1 isSending];
}

id objc_msgSend_isUnified(void *a1, const char *a2, ...)
{
  return [a1 isUnified];
}

id objc_msgSend_jobTitle(void *a1, const char *a2, ...)
{
  return [a1 jobTitle];
}

id objc_msgSend_keepGoing(void *a1, const char *a2, ...)
{
  return [a1 keepGoing];
}

id objc_msgSend_keysToFetch(void *a1, const char *a2, ...)
{
  return [a1 keysToFetch];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leadingEdgeDelay(void *a1, const char *a2, ...)
{
  return [a1 leadingEdgeDelay];
}

id objc_msgSend_leeway(void *a1, const char *a2, ...)
{
  return [a1 leeway];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkGuid(void *a1, const char *a2, ...)
{
  return [a1 linkGuid];
}

id objc_msgSend_linkTos(void *a1, const char *a2, ...)
{
  return [a1 linkTos];
}

id objc_msgSend_linkTosCount(void *a1, const char *a2, ...)
{
  return [a1 linkTosCount];
}

id objc_msgSend_linkedContacts(void *a1, const char *a2, ...)
{
  return [a1 linkedContacts];
}

id objc_msgSend_localContainerEnabled(void *a1, const char *a2, ...)
{
  return [a1 localContainerEnabled];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_messageTimeout(void *a1, const char *a2, ...)
{
  return [a1 messageTimeout];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mustBeReset(void *a1, const char *a2, ...)
{
  return [a1 mustBeReset];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return [a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return [a1 nameSuffix];
}

id objc_msgSend_nextDelayCalculator(void *a1, const char *a2, ...)
{
  return [a1 nextDelayCalculator];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return [a1 nickname];
}

id objc_msgSend_nonGregorianBirthday(void *a1, const char *a2, ...)
{
  return [a1 nonGregorianBirthday];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_obfuscate(void *a1, const char *a2, ...)
{
  return [a1 obfuscate];
}

id objc_msgSend_objectDelay(void *a1, const char *a2, ...)
{
  return [a1 objectDelay];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_oldDatabaseExists(void *a1, const char *a2, ...)
{
  return [a1 oldDatabaseExists];
}

id objc_msgSend_oops(void *a1, const char *a2, ...)
{
  return [a1 oops];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_pairingStorePath(void *a1, const char *a2, ...)
{
  return [a1 pairingStorePath];
}

id objc_msgSend_parsed(void *a1, const char *a2, ...)
{
  return [a1 parsed];
}

id objc_msgSend_partialResetSyncOnPairingFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 partialResetSyncOnPairingFeatureEnabled];
}

id objc_msgSend_partialSyncEligible(void *a1, const char *a2, ...)
{
  return [a1 partialSyncEligible];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pb(void *a1, const char *a2, ...)
{
  return [a1 pb];
}

id objc_msgSend_pbObject(void *a1, const char *a2, ...)
{
  return [a1 pbObject];
}

id objc_msgSend_pending(void *a1, const char *a2, ...)
{
  return [a1 pending];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_phoneNumbersCount(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbersCount];
}

id objc_msgSend_phonemeData(void *a1, const char *a2, ...)
{
  return [a1 phonemeData];
}

id objc_msgSend_phoneticFamilyName(void *a1, const char *a2, ...)
{
  return [a1 phoneticFamilyName];
}

id objc_msgSend_phoneticGivenName(void *a1, const char *a2, ...)
{
  return [a1 phoneticGivenName];
}

id objc_msgSend_phoneticMiddleName(void *a1, const char *a2, ...)
{
  return [a1 phoneticMiddleName];
}

id objc_msgSend_phoneticOrganizationName(void *a1, const char *a2, ...)
{
  return [a1 phoneticOrganizationName];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return [a1 postalAddresses];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return [a1 postalCode];
}

id objc_msgSend_preemptedSessionProgressReporter(void *a1, const char *a2, ...)
{
  return [a1 preemptedSessionProgressReporter];
}

id objc_msgSend_preferredApplePersonaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 preferredApplePersonaIdentifier];
}

id objc_msgSend_preferredChannel(void *a1, const char *a2, ...)
{
  return [a1 preferredChannel];
}

id objc_msgSend_preferredContact(void *a1, const char *a2, ...)
{
  return [a1 preferredContact];
}

id objc_msgSend_preferredLikenessSource(void *a1, const char *a2, ...)
{
  return [a1 preferredLikenessSource];
}

id objc_msgSend_previousFamilyName(void *a1, const char *a2, ...)
{
  return [a1 previousFamilyName];
}

id objc_msgSend_primaryiCloudCardDAVAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 primaryiCloudCardDAVAccountIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressMultiplier(void *a1, const char *a2, ...)
{
  return [a1 progressMultiplier];
}

id objc_msgSend_progressReporter(void *a1, const char *a2, ...)
{
  return [a1 progressReporter];
}

id objc_msgSend_pronunciationFamilyName(void *a1, const char *a2, ...)
{
  return [a1 pronunciationFamilyName];
}

id objc_msgSend_pronunciationGivenName(void *a1, const char *a2, ...)
{
  return [a1 pronunciationGivenName];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_psySyncSession(void *a1, const char *a2, ...)
{
  return [a1 psySyncSession];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return [a1 purge];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawCount(void *a1, const char *a2, ...)
{
  return [a1 rawCount];
}

id objc_msgSend_reality(void *a1, const char *a2, ...)
{
  return [a1 reality];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_registerForAddressBookDarwinNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForAddressBookDarwinNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetBindCursor(void *a1, const char *a2, ...)
{
  return [a1 resetBindCursor];
}

id objc_msgSend_resetFetchCursor(void *a1, const char *a2, ...)
{
  return [a1 resetFetchCursor];
}

id objc_msgSend_resetSyncState(void *a1, const char *a2, ...)
{
  return [a1 resetSyncState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return [a1 rollback];
}

id objc_msgSend_rollbackTransaction(void *a1, const char *a2, ...)
{
  return [a1 rollbackTransaction];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sendMultisaveBegin(void *a1, const char *a2, ...)
{
  return [a1 sendMultisaveBegin];
}

id objc_msgSend_sendMultisaveFinished(void *a1, const char *a2, ...)
{
  return [a1 sendMultisaveFinished];
}

id objc_msgSend_sendTimestamp(void *a1, const char *a2, ...)
{
  return [a1 sendTimestamp];
}

id objc_msgSend_sensitiveContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sensitiveContentConfiguration];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 sequenceNumber];
}

id objc_msgSend_serverState(void *a1, const char *a2, ...)
{
  return [a1 serverState];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionIdleQueue(void *a1, const char *a2, ...)
{
  return [a1 sessionIdleQueue];
}

id objc_msgSend_sessionMetadata(void *a1, const char *a2, ...)
{
  return [a1 sessionMetadata];
}

id objc_msgSend_sessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 sessionTimeout];
}

id objc_msgSend_setHasChangesAvailable(void *a1, const char *a2, ...)
{
  return [a1 setHasChangesAvailable];
}

id objc_msgSend_setNeedsResetSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSync];
}

id objc_msgSend_sha(void *a1, const char *a2, ...)
{
  return [a1 sha];
}

id objc_msgSend_shaFile(void *a1, const char *a2, ...)
{
  return [a1 shaFile];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPhotoDisplayPreference(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoDisplayPreference];
}

id objc_msgSend_shouldNextResetSyncBePartial(void *a1, const char *a2, ...)
{
  return [a1 shouldNextResetSyncBePartial];
}

id objc_msgSend_shouldResetSyncBePartial(void *a1, const char *a2, ...)
{
  return [a1 shouldResetSyncBePartial];
}

id objc_msgSend_shouldRunPartialResetSync(void *a1, const char *a2, ...)
{
  return [a1 shouldRunPartialResetSync];
}

id objc_msgSend_shouldUseBackgroundPriority(void *a1, const char *a2, ...)
{
  return [a1 shouldUseBackgroundPriority];
}

id objc_msgSend_showAlert(void *a1, const char *a2, ...)
{
  return [a1 showAlert];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_signalCoalescer(void *a1, const char *a2, ...)
{
  return [a1 signalCoalescer];
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return [a1 socialProfiles];
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return [a1 sound];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subAdministrativeArea(void *a1, const char *a2, ...)
{
  return [a1 subAdministrativeArea];
}

id objc_msgSend_subLocality(void *a1, const char *a2, ...)
{
  return [a1 subLocality];
}

id objc_msgSend_sySession(void *a1, const char *a2, ...)
{
  return [a1 sySession];
}

id objc_msgSend_syncController(void *a1, const char *a2, ...)
{
  return [a1 syncController];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncInterface(void *a1, const char *a2, ...)
{
  return [a1 syncInterface];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_syncService(void *a1, const char *a2, ...)
{
  return [a1 syncService];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_systemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 systemBuildVersion];
}

id objc_msgSend_targetIsConnected(void *a1, const char *a2, ...)
{
  return [a1 targetIsConnected];
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return [a1 targetQueue];
}

id objc_msgSend_targetableDevice(void *a1, const char *a2, ...)
{
  return [a1 targetableDevice];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminated(void *a1, const char *a2, ...)
{
  return [a1 terminated];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textAlert(void *a1, const char *a2, ...)
{
  return [a1 textAlert];
}

id objc_msgSend_thumbnail(void *a1, const char *a2, ...)
{
  return [a1 thumbnail];
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return [a1 thumbnailImageData];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toContact(void *a1, const char *a2, ...)
{
  return [a1 toContact];
}

id objc_msgSend_toGuid(void *a1, const char *a2, ...)
{
  return [a1 toGuid];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unifiedCount(void *a1, const char *a2, ...)
{
  return [a1 unifiedCount];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlockQueue(void *a1, const char *a2, ...)
{
  return [a1 unlockQueue];
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return [a1 urlAddresses];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_urls(void *a1, const char *a2, ...)
{
  return [a1 urls];
}

id objc_msgSend_urlsCount(void *a1, const char *a2, ...)
{
  return [a1 urlsCount];
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userIdentifier];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_validationEnabled(void *a1, const char *a2, ...)
{
  return [a1 validationEnabled];
}

id objc_msgSend_validationMessage(void *a1, const char *a2, ...)
{
  return [a1 validationMessage];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vcardData(void *a1, const char *a2, ...)
{
  return [a1 vcardData];
}

id objc_msgSend_vibration(void *a1, const char *a2, ...)
{
  return [a1 vibration];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_wallTime(void *a1, const char *a2, ...)
{
  return [a1 wallTime];
}

id objc_msgSend_wallpaper(void *a1, const char *a2, ...)
{
  return [a1 wallpaper];
}

id objc_msgSend_wallpaperDataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 wallpaperDataRepresentation];
}

id objc_msgSend_wallpaperImageData(void *a1, const char *a2, ...)
{
  return [a1 wallpaperImageData];
}

id objc_msgSend_watchBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 watchBuildVersion];
}

id objc_msgSend_watchSupportsPartialSyncs(void *a1, const char *a2, ...)
{
  return [a1 watchSupportsPartialSyncs];
}

id objc_msgSend_watchWallpaperImageData(void *a1, const char *a2, ...)
{
  return [a1 watchWallpaperImageData];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}