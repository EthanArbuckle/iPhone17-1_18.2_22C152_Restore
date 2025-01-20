uint64_t __unregisterForAKSEvents_block_invoke(uint64_t a1)
{
  return MEMORY[0x1F410A508](*(void *)(a1 + 32));
}

uint64_t lockState()
{
  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4) {
    return 1;
  }
  else {
    return result;
  }
}

__CFString *_PASJoinStrings(void *a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  if (!v5)
  {
    v11 = &stru_1EF678A50;
    goto LABEL_75;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v5 - 1;
  if (v5 != 1)
  {
    uint64_t v76 = MEMORY[0x1A62450A0]();
    uint64_t v12 = [v4 length];
    unint64_t v13 = v12 * v7;
    size_t v81 = v12;
    id v77 = v4;
    if (v12)
    {
      char v14 = [v4 canBeConvertedToEncoding:1];
    }
    else
    {
      id v4 = 0;
      char v14 = 1;
    }
    id v9 = v4;
    v10 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      v16 = [v3 objectAtIndexedSubscript:i];
      v17 = [v16 description];
      if (v17 != v16)
      {
        if (!v10) {
          v10 = (void *)[v3 mutableCopy];
        }
        [v10 setObject:v17 atIndexedSubscript:i];
      }
      uint64_t v18 = [v17 length];
      if (v18)
      {
        uint64_t v19 = v18;
        if (!v9) {
          id v9 = v17;
        }
        v13 += v19;
        if (v14) {
          char v14 = [v17 canBeConvertedToEncoding:1];
        }
        else {
          char v14 = 0;
        }
      }
    }
    if (!v13)
    {
      v11 = &stru_1EF678A50;
      goto LABEL_73;
    }
    if (v13 == [v9 length])
    {
      v11 = (__CFString *)[v9 copy];
LABEL_73:
      v8 = (void *)v76;
      id v4 = v77;
      goto LABEL_74;
    }
    if (v10) {
      v20 = v10;
    }
    else {
      v20 = v3;
    }
    id v80 = v20;
    v21 = v77;
    size_t v22 = v81;
    if (v14)
    {
      memptr = 0;
      uint64_t v83 = 0;
      size_t v78 = v13 + 1;
      if (v13 + 1 <= 0x400)
      {
        MEMORY[0x1F4188790]();
        v24 = (char *)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v24, v23);
        v79 = v24;
        memptr = v24;
        LOBYTE(v83) = 1;
        goto LABEL_30;
      }
      int v70 = malloc_type_posix_memalign(&memptr, 8uLL, v13 + 1, 0x2F5DE5DAuLL);
      LOBYTE(v83) = 0;
      if (!v70)
      {
        size_t v22 = v81;
        v79 = (char *)memptr;
LABEL_30:
        uint64_t v74 = v83;
        v25 = [v80 objectAtIndexedSubscript:0];
        unint64_t v26 = [v25 length];
        unint64_t v27 = v26;
        CFStringRef v28 = v25;
        v29 = (__CFString *)v28;
        if (v26)
        {
          CStringPtr = CFStringGetCStringPtr(v28, 0x600u);
          if (v26 > v13) {
            goto LABEL_78;
          }
          v31.location = (CFIndex)CStringPtr;
          if (CStringPtr)
          {
            memcpy(v79, CStringPtr, v26);
          }
          else
          {
            v31.length = v26;
            CFStringGetBytes(v29, v31, 0x600u, 0, 0, (UInt8 *)v79, v26, 0);
          }
        }

        CFStringRef v41 = v21;
        v42 = (__CFString *)v41;
        if (!v22) {
          goto LABEL_51;
        }
        v43 = CFStringGetCStringPtr(v41, 0x600u);
        unint64_t v27 = v26 + v22;
        if (v26 + v22 <= v13)
        {
          v44.location = (CFIndex)v43;
          if (v43)
          {
            memcpy(&v79[v26], v43, v22);
          }
          else
          {
            v44.length = v22;
            CFStringGetBytes(v42, v44, 0x600u, 0, 0, (UInt8 *)&v79[v26], v22, 0);
          }
LABEL_51:
          v75 = v29;

          v49 = &v79[v26];
          uint64_t v50 = 1;
          while (1)
          {
            v51 = [v80 objectAtIndexedSubscript:v50];
            uint64_t v52 = [v51 length];
            CFStringRef v53 = v51;
            v54 = (__CFString *)v53;
            if (v52)
            {
              v55 = CFStringGetCStringPtr(v53, 0x600u);
              unint64_t v56 = v52 + v27;
              if (v52 + v27 > v13) {
                goto LABEL_78;
              }
              v57.location = (CFIndex)v55;
              if (v55)
              {
                memcpy(&v79[v27], v55, v52);
              }
              else
              {
                v57.length = v52;
                CFStringGetBytes(v54, v57, 0x600u, 0, 0, (UInt8 *)&v79[v27], v52, 0);
              }
            }
            else
            {
              unint64_t v56 = v27;
            }

            if (v56 == v13) {
              break;
            }
            ++v50;
            size_t v58 = v81;
            memcpy(&v79[v56], v49, v81);
            unint64_t v27 = v56 + v58;
          }
          v79[v13] = 0;
          v59 = NSString;
LABEL_72:
          objc_msgSend(v59, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_73;
        }
LABEL_78:
        __assert_rtn("appendASCII", "_PASStringUtil.m", 362, "*destCursor + len <= destLen");
      }
LABEL_84:
      id v72 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v72);
    }
    memptr = 0;
    uint64_t v83 = 0;
    uint64_t v74 = 2 * v13;
    if (((2 * v13) | 1) > 0x400)
    {
      int v71 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v13, 0x2D4962CFuLL);
      LOBYTE(v83) = 0;
      if (v71) {
        goto LABEL_84;
      }
      size_t v22 = v81;
      v79 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790]();
      v33 = (char *)&v73 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v33, v32);
      v79 = v33;
      memptr = v33;
      LOBYTE(v83) = 1;
    }
    v34 = objc_msgSend(v80, "objectAtIndexedSubscript:", 0, v83);
    unint64_t v35 = [v34 length];
    unint64_t v36 = v35;
    CFStringRef v37 = v34;
    v38 = (__CFString *)v37;
    if (v35)
    {
      CharactersPtr = CFStringGetCharactersPtr(v37);
      if (v35 > v13) {
        goto LABEL_79;
      }
      v40.location = (CFIndex)CharactersPtr;
      if (CharactersPtr)
      {
        memcpy(v79, CharactersPtr, 2 * v35);
      }
      else
      {
        v40.length = v35;
        CFStringGetCharacters(v38, v40, (UniChar *)v79);
      }
    }

    CFStringRef v45 = v21;
    v46 = (__CFString *)v45;
    size_t v78 = 2 * v22;
    if (!v22) {
      goto LABEL_62;
    }
    v47 = CFStringGetCharactersPtr(v45);
    unint64_t v36 = v35 + v22;
    if (v35 + v22 <= v13)
    {
      v48.location = (CFIndex)v47;
      if (v47)
      {
        memcpy(&v79[2 * v35], v47, v78);
      }
      else
      {
        v48.length = v22;
        CFStringGetCharacters(v46, v48, (UniChar *)&v79[2 * v35]);
      }
LABEL_62:
      v75 = v38;

      v60 = &v79[2 * v35];
      uint64_t v61 = 1;
      while (1)
      {
        v62 = [v80 objectAtIndexedSubscript:v61];
        CFIndex v63 = [v62 length];
        CFStringRef v64 = v62;
        v65 = (__CFString *)v64;
        if (v63)
        {
          v66 = CFStringGetCharactersPtr(v64);
          unint64_t v67 = v63 + v36;
          if (v63 + v36 > v13) {
            goto LABEL_79;
          }
          v68.location = (CFIndex)v66;
          if (v66)
          {
            memcpy(&v79[2 * v36], v66, 2 * v63);
          }
          else
          {
            v68.length = v63;
            CFStringGetCharacters(v65, v68, (UniChar *)&v79[2 * v36]);
          }
        }
        else
        {
          unint64_t v67 = v36;
        }

        if (v67 == v13) {
          break;
        }
        ++v61;
        memcpy(&v79[2 * v67], v60, v78);
        unint64_t v36 = v67 + v81;
      }
      v59 = NSString;
      goto LABEL_72;
    }
LABEL_79:
    __assert_rtn("appendUnicode", "_PASStringUtil.m", 380, "*destCursor + len <= destLen");
  }
  v8 = (void *)MEMORY[0x1A62450A0]();
  id v9 = [v3 objectAtIndexedSubscript:0];
  v10 = [v9 description];
  v11 = (__CFString *)[v10 copy];
LABEL_74:

LABEL_75:

  return v11;
}

void unregisterForAKSEvents(uint64_t a1)
{
  if (a1)
  {
    v2 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __unregisterForAKSEvents_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v2, block);
  }
}

void **_PASCompactStringArrayDestroy(void **result)
{
  if (result)
  {
    v1 = result;
    v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1A62449C0);
  }
  return result;
}

uint64_t unlockedSinceBoot()
{
  unsigned __int8 v0 = atomic_load(unlockedSinceBoot_haveSeenUnlocked);
  if (v0) {
    return 1;
  }
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result != 1) {
    return 0;
  }
  atomic_store(1u, unlockedSinceBoot_haveSeenUnlocked);
  return result;
}

BOOL formattedForContentProtection()
{
  return MKBDeviceFormattedForContentProtection() != 0;
}

void sub_1A32C8198(_Unwind_Exception *a1)
{
}

void sub_1A32C81A4(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exc_buf);
      if (!v9) {
        JUMPOUT(0x1A32C8104);
      }
      JUMPOUT(0x1A32C8140);
    }
    id v10 = objc_begin_catch(exc_buf);
    v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      unint64_t v13 = [v10 debugDescription];
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v13;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "-[_PASSqliteDatabase withDbLockExecuteBlock:] caught an exception during invocation of block.\n\nException: %@", (uint8_t *)&a9, 0xCu);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exc_buf);
}

void sub_1A32C8258(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A32C81B4);
  }
  _Unwind_Resume(a1);
}

void sub_1A32C8270(_Unwind_Exception *a1)
{
  if (v1) {
    JUMPOUT(0x1A32C8278);
  }
  _Unwind_Resume(a1);
}

void sub_1A32C8280(uint64_t a1, int a2)
{
  if (!a2) {
    sub_1A32C8284();
  }
  objc_terminate();
}

void sub_1A32C8B3C(_Unwind_Exception *a1)
{
}

void sub_1A32C93A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32C9580(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A32C96C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _PAS_sqlite3_bind_nsstring(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v26 = objc_msgSend(NSString, "stringWithUTF8String:", "int _PAS_sqlite3_bind_nsstring(sqlite3_stmt * _Nonnull, int, NSString * _Nonnull __strong)");
    [v25 handleFailureInFunction:v26, @"_PASSqliteDatabase.m", 76, @"Invalid parameter not satisfying: %@", @"str != nil" file lineNumber description];
  }
  sqlite3_uint64 v39 = 0;
  uint64_t v6 = objc_msgSend(v5, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v39);
  if (!v6)
  {
    id v14 = v5;
    uint64_t v15 = [v14 _fastCharacterContents];
    if (v15)
    {
      v16 = (const char *)v15;
      sqlite3_uint64 v9 = [v14 lengthOfBytesUsingEncoding:10];
      id v10 = a1;
      int v11 = a2;
      id v12 = v16;
      uint64_t v13 = -1;
LABEL_8:
      unsigned __int8 v17 = 4;
LABEL_18:
      uint64_t v18 = sqlite3_bind_text64(v10, v11, v12, v9, (void (__cdecl *)(void *))v13, v17);
      goto LABEL_19;
    }
    sqlite3_uint64 v39 = [v14 lengthOfBytesUsingEncoding:4];
    if (v39)
    {
      uint64_t v19 = [v14 length];
      if (!v19) {
        __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 128, "length > 0");
      }
      uint64_t v20 = v19;
      v21 = (const char *)sqlite3_malloc64(v39);
      if (v21)
      {
        size_t v22 = v21;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        objc_msgSend(v14, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v21, v39, 0, 4, 0, 0, v20, &v32);
        if (v33) {
          __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 133, "remainingRange.length == 0");
        }
        sqlite3_uint64 v9 = v39;
        uint64_t v13 = MEMORY[0x1E4FBA970];
        id v10 = a1;
        int v11 = a2;
        id v12 = v22;
        goto LABEL_17;
      }
    }
    else
    {
      sqlite3_uint64 v27 = [v14 lengthOfBytesUsingEncoding:10];
      if (!v27) {
        __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 114, "utf16Size != 0");
      }
      sqlite3_uint64 v28 = v27;
      v29 = (const char *)sqlite3_malloc64(v27);
      if (v29)
      {
        v30 = v29;
        [v14 getCharacters:v29];
        uint64_t v13 = MEMORY[0x1E4FBA970];
        id v10 = a1;
        int v11 = a2;
        id v12 = v30;
        sqlite3_uint64 v9 = v28;
        goto LABEL_8;
      }
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v31);
  }
  uint64_t v7 = (const char *)v6;
  int v8 = _NSIsNSCFConstantString();
  sqlite3_uint64 v9 = v39;
  if (v8)
  {
    id v10 = a1;
    int v11 = a2;
    id v12 = v7;
    uint64_t v13 = 0;
LABEL_17:
    unsigned __int8 v17 = 1;
    goto LABEL_18;
  }
  if (v39 - 17 > 0x7FFFFFED)
  {
    id v10 = a1;
    int v11 = a2;
    id v12 = v7;
    uint64_t v13 = -1;
    goto LABEL_17;
  }
  CFRetain(v5);
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  unint64_t v36 = ___PAS_sqlite3_bind_nsstring_block_invoke;
  CFStringRef v37 = &__block_descriptor_40_e9_v16__0_v8l;
  id v38 = v5;
  uint64_t v18 = sqlite3_bind_text_b();
LABEL_19:
  uint64_t v23 = v18;

  return v23;
}

void sub_1A32C9F74()
{
}

void sub_1A32C9FE4()
{
}

uint64_t _indexForBindParam(sqlite3_stmt *a1, char *zName)
{
  if (a1)
  {
    if (zName) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
    [v6 handleFailureInFunction:v7, @"_PASSqliteStatement.m", 252, @"Invalid parameter not satisfying: %@", @"stmt" file lineNumber description];

    if (zName) {
      goto LABEL_3;
    }
  }
  int v8 = [MEMORY[0x1E4F28B00] currentHandler];
  sqlite3_uint64 v9 = objc_msgSend(NSString, "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
  [v8 handleFailureInFunction:v9, @"_PASSqliteStatement.m", 253, @"Invalid parameter not satisfying: %@", @"name" file lineNumber description];

LABEL_3:
  uint64_t v4 = sqlite3_bind_parameter_index(a1, zName);
  if ((int)v4 <= 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = objc_msgSend(NSString, "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"_PASSqliteStatement.m", 255, @"Unknown bind parameter \"%s\"", zName);
  }
  return v4;
}

void cfDeallocateReleaseInfo_125(int a1, CFTypeRef cf)
{
}

id _PAS_sqlite3_column_nsdata(sqlite3_stmt *a1, int a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__3452;
  sqlite3_uint64 v9 = __Block_byref_object_dispose__3453;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___PAS_sqlite3_column_nsdata_block_invoke;
  v4[3] = &unk_1E5AEB660;
  v4[4] = &v5;
  _PAS_sqlite3_column_blob_bytes_block(a1, a2, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A32CA4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PAS_sqlite3_column_blob_bytes_block(sqlite3_stmt *a1, int a2, void *a3)
{
  int v8 = a3;
  int v5 = sqlite3_column_bytes(a1, a2);
  if (v5 >= 1)
  {
    BytePtr = (void *)sqlite3_column_blob(a1, a2);
LABEL_5:
    uint64_t v7 = BytePtr;
    goto LABEL_7;
  }
  if (sqlite3_column_type(a1, a2) == 4)
  {
    BytePtr = (void *)CFDataGetBytePtr((CFDataRef)&unk_1EC36FFC0);
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:
  v8[2](v8, v7, v5);
}

uint64_t registerForAKSEvents(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  sqlite3_uint64 v9 = __registerForAKSEvents_block_invoke;
  id v10 = &unk_1E5AEB4A8;
  id v3 = v2;
  id v11 = v3;
  uint64_t v4 = AKSEventsRegister();
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed register: AKSEventsRegister", v6, 2u);
  }

  return v4;
}

void sub_1A32CA9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A32CB8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32CBDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32CBEF0(_Unwind_Exception *a1)
{
}

void sub_1A32CBF10(void *a1)
{
}

void sub_1A32CC374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A32CC6F8(void *a1)
{
  objc_begin_catch(a1);
  pthread_mutex_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A32CC70C(_Unwind_Exception *a1)
{
}

void sub_1A32CD6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A32CDB94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A32CE080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32CE2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A32CF154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32CF6A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t xFilter(void *a1, int a2, unsigned char *a3, int a4, sqlite3_value **a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = *(void **)(*a1 + 24);
  id v11 = sqlite3_value_pointer(*a5, (const char *)[v10 sqliteMethodName]);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = objc_opt_new();
    id v14 = (void *)CFRetain(v12);
    [v13 setCollection:v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a2;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = objc_opt_class();
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections xFilter idxStr:%s idxNum:%d for %@", buf, 0x1Cu);
    }
    char v15 = [(id)objc_opt_class() hasKey];
    v16 = (const void *)a1[1];
    if (v16) {
      CFRelease(v16);
    }
    id v17 = v13;
    a1[1] = v17;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(_DWORD *)&buf[24] = 1;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    sqlite3_uint64 v28 = __xFilter_block_invoke;
    v29 = &unk_1E5AEB4F8;
    id v31 = buf;
    uint64_t v32 = a5;
    char v34 = v15;
    id v18 = v17;
    id v30 = v18;
    int v33 = a4;
    uint64_t v19 = v27;
    char v20 = *a3;
    if (*a3)
    {
      v21 = a3 + 4;
      do
      {
        if (v20 == 118)
        {
          uint64_t v22 = 0;
        }
        else
        {
          if (v20 != 107) {
LABEL_21:
          }
            __break(1u);
          uint64_t v22 = 1;
        }
        v28((uint64_t)v19, v22, (10 * *(v21 - 2) + 100 * *(v21 - 3) + *(v21 - 1) + 48));
        int v23 = *v21;
        v21 += 4;
        char v20 = v23;
      }
      while (v23);
    }

    uint64_t v24 = 0;
    uint64_t v25 = 1;
    switch(a2)
    {
      case 0:
        goto LABEL_20;
      case 1:
        if (v15) {
          goto LABEL_20;
        }
        uint64_t v24 = 1;
LABEL_16:
        [v18 applyRowIdSort:v24];
        goto LABEL_20;
      case 2:
        goto LABEL_16;
      case 3:
        goto LABEL_19;
      case 4:
        uint64_t v25 = 0;
LABEL_19:
        [v18 applyValueSort:v25];
LABEL_20:
        objc_msgSend(v18, "finalizeConstraints", v24);

        _Block_object_dispose(buf, 8);
        return 0;
      default:
        goto LABEL_21;
    }
  }
  *(void *)(*a1 + 16) = sqlite3_mprintf("Object of incorrect type passed to %s", (const char *)[v10 sqliteMethodName]);
  return 1;
}

void sub_1A32CFB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t xBestIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 24);
  uint64_t v4 = self;
  char v5 = [v3 isSubclassOfClass:v4];

  if ((v5 & 1) == 0)
  {
    CFRange v57 = [MEMORY[0x1E4F28B00] currentHandler];
    size_t v58 = objc_msgSend(NSString, "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
    [v57 handleFailureInFunction:v58, @"_PASSqliteCollections.m", 1391, @"Invalid parameter not satisfying: %@", @"[cursorClass isSubclassOfClass:[_PASSqliteCollectionsCursor self]]" file lineNumber description];
  }
  int v6 = [v3 hasKey];
  if (v6) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v65 = v3;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Beginning xBestIndex for %@", buf, 0xCu);
  }
  *(_DWORD *)(a2 + 40) = 0;
  int v8 = *(_DWORD *)a2;
  if (*(int *)a2 < 1) {
    goto LABEL_14;
  }
  uint64_t v9 = 0;
  int v10 = 0;
  int v11 = v6 - 1;
  id v12 = (unsigned char *)(*(void *)(a2 + 8) + 5);
  BOOL v13 = 1;
  while (*(v12 - 1) != 2 || *(_DWORD *)(v12 - 5) != v7 || !*v12)
  {
    BOOL v13 = ++v10 < v8;
    v9 += 8;
    v12 += 12;
    if (v8 == v10) {
      goto LABEL_14;
    }
  }
  uint64_t v15 = *(void *)(a2 + 32) + v9;
  *(_DWORD *)uint64_t v15 = 1;
  *(unsigned char *)(v15 + 4) = 1;
  if (!v13)
  {
LABEL_14:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v65 = v3;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Ending xBestIndex for %@: pointer constraint missing", buf, 0xCu);
    }
    return 0;
  }
  [v3 baseEstimatedRows];
  double v17 = v16;
  [v3 baseEstimatedCost];
  double v19 = v18;
  CFIndex v63 = objc_opt_new();
  int v20 = *(_DWORD *)a2;
  if (*(int *)a2 >= 1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = @"rowId";
    int v23 = *(int **)(a2 + 8);
    if (v6) {
      uint64_t v22 = @"key";
    }
    v62 = v22;
    uint64_t v24 = -1;
    do
    {
      if (*((unsigned char *)v23 + 5))
      {
        int v25 = *v23;
        BOOL v26 = *v23 == v11 || v25 == v6;
        if (v26)
        {
          BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
          if (v25 == v6)
          {
            if (v27)
            {
              int v42 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v65 = v42;
              *(_WORD *)&v65[4] = 2112;
              *(void *)&v65[6] = v3;
              _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Considering value->%hhu for %@", buf, 0x12u);
            }
            uint64_t v28 = [v3 planningInfoForValueConstraint:*((unsigned __int8 *)v23 + 4)];
          }
          else
          {
            if (v27)
            {
              int v43 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 138412802;
              *(void *)v65 = v62;
              *(_WORD *)&v65[8] = 1024;
              *(_DWORD *)&v65[10] = v43;
              *(_WORD *)&v65[14] = 2112;
              *(void *)&v65[16] = v3;
              _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Considering %@->%hhu for %@", buf, 0x1Cu);
            }
            uint64_t v31 = *((unsigned __int8 *)v23 + 4);
            if (v6) {
              [v3 planningInfoForKeyConstraint:v31];
            }
            else {
            uint64_t v28 = [v3 planningInfoForRowIdConstraint:v31];
            }
          }
          v29 = (double *)v28;
          if (v28)
          {
            int v32 = *(unsigned __int8 *)(v28 + 9);
            int v33 = *(unsigned __int8 *)(v28 + 8);
            uint64_t v34 = *(void *)(a2 + 8) + 12 * v21;
            int v35 = *(_DWORD *)v34;
            uint64_t v36 = *(unsigned __int8 *)(v34 + 4);
            BOOL v26 = v35 == v6 - 1;
            uint64_t v37 = 118;
            if (v26) {
              uint64_t v37 = 107;
            }
            objc_msgSend(v63, "appendFormat:", @"%c%03d", v37, v36);
            uint64_t v38 = *(void *)(a2 + 32);
            sqlite3_uint64 v39 = (_DWORD *)(v38 + 8 * v21);
            *sqlite3_uint64 v39 = 2;
            if (v21)
            {
              uint64_t v40 = v24;
              while (v40 + 1 >= 1)
              {
                int v41 = *(_DWORD *)(v38 + 8 * v40--);
                if (v41 >= 2)
                {
                  *sqlite3_uint64 v39 = v41 + 1;
                  break;
                }
              }
            }
            if (v32) {
              *(unsigned char *)(v38 + 8 * v21 + 4) = 1;
            }
            if (v33) {
              *(_DWORD *)(a2 + 80) |= 1u;
            }
            double v17 = v17 * v29[2];
            double v19 = v19 * v29[3];
            int v11 = v6 - 1;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              *(double *)v65 = v19;
              *(_WORD *)&v65[8] = 2048;
              *(double *)&v65[10] = v17;
              *(_WORD *)&v65[18] = 2112;
              *(void *)&v65[20] = v3;
              _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Estimated cost now %f, estimated rows now %f for %@", buf, 0x20u);
            }
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              int v44 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v65 = v44;
              *(_WORD *)&v65[4] = 2112;
              *(void *)&v65[6] = v3;
              _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections No optimization: %hhu for %@", buf, 0x12u);
            }
            v29 = 0;
            int v11 = v6 - 1;
          }
          goto LABEL_57;
        }
        if (v25 != v7)
        {
          v29 = [MEMORY[0x1E4F28B00] currentHandler];
          id v30 = objc_msgSend(NSString, "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
          [v29 handleFailureInFunction:v30, @"_PASSqliteCollections.m", 1444, @"Invalid parameter not satisfying: %@", @"constraint->iColumn == pointerColumn" file lineNumber description];

LABEL_57:
          int v20 = *(_DWORD *)a2;
        }
      }
      ++v21;
      v23 += 3;
      ++v24;
    }
    while (v21 < v20);
  }
  if (*(_DWORD *)(a2 + 16) != 1) {
    goto LABEL_81;
  }
  uint64_t v45 = *(void *)(a2 + 24);
  if (*(_DWORD *)v45 == v11)
  {
    BOOL v46 = *(unsigned char *)(v45 + 4) != 0;
    if (v6)
    {
      if (([v3 canOrderByKey:v46] & 1) == 0) {
        goto LABEL_63;
      }
    }
    else if (![v3 canOrderByRowId:v46])
    {
LABEL_63:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v65 = v3;
        v47 = MEMORY[0x1E4F14500];
        CFRange v48 = "#passqlitecollections unable to optimize rowid/key ORDER BY for %@";
LABEL_80:
        _os_log_debug_impl(&dword_1A32C4000, v47, OS_LOG_TYPE_DEBUG, v48, buf, 0xCu);
        goto LABEL_81;
      }
      goto LABEL_81;
    }
    *(_DWORD *)(a2 + 60) = 1;
    if (*(unsigned char *)(v45 + 4)) {
      int v50 = 1;
    }
    else {
      int v50 = 2;
    }
    *(_DWORD *)(a2 + 40) = v50;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v65 = v3;
    v47 = MEMORY[0x1E4F14500];
    CFRange v48 = "#passqlitecollections will optimize rowid/key ORDER BY for %@";
    goto LABEL_80;
  }
  if (*(_DWORD *)v45 == v6)
  {
    if ([v3 canOrderByValue:*(unsigned char *)(v45 + 4) != 0])
    {
      *(_DWORD *)(a2 + 60) = 1;
      if (*(unsigned char *)(v45 + 4)) {
        int v49 = 3;
      }
      else {
        int v49 = 4;
      }
      *(_DWORD *)(a2 + 40) = v49;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_81;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v65 = v3;
      v47 = MEMORY[0x1E4F14500];
      CFRange v48 = "#passqlitecollections will optimize value ORDER BY for %@";
      goto LABEL_80;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v65 = v3;
      v47 = MEMORY[0x1E4F14500];
      CFRange v48 = "#passqlitecollections unable to optimize value ORDER BY for %@";
      goto LABEL_80;
    }
  }
LABEL_81:
  *(double *)(a2 + 64) = v19;
  double v51 = 1.0;
  if (v17 >= 1.0) {
    double v51 = v17;
  }
  *(void *)(a2 + 72) = (uint64_t)v51;
  uint64_t v52 = [v63 lengthOfBytesUsingEncoding:1];
  uint64_t v53 = v52 + 1;
  v54 = sqlite3_malloc((int)v52 + 1);
  if (!v54)
  {
    id v61 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v61);
  }
  *(void *)(a2 + 48) = v54;
  if (([v63 getCString:v54 maxLength:v53 encoding:1] & 1) == 0)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    v60 = objc_msgSend(NSString, "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
    [v59 handleFailureInFunction:v60, @"_PASSqliteCollections.m", 1475, @"Invalid parameter not satisfying: %@", @"[indexString getCString:info->idxStr maxLength:indexStringLength encoding:NSASCIIStringEncoding]" file lineNumber description];
  }
  *(_DWORD *)(a2 + 56) = 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = *(void *)(a2 + 64);
    uint64_t v56 = *(void *)(a2 + 72);
    *(_DWORD *)buf = 134218498;
    *(void *)v65 = v55;
    *(_WORD *)&v65[8] = 2048;
    *(void *)&v65[10] = v56;
    *(_WORD *)&v65[18] = 2112;
    *(void *)&v65[20] = v3;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitecollections Ending xBestIndex (estimatedCost: %f, estimatedRows: %lld) for %@", buf, 0x20u);
  }

  return 0;
}

uint64_t _PAS_sqlite3_bind_nsdata(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v13 = objc_msgSend(NSString, "stringWithUTF8String:", "int _PAS_sqlite3_bind_nsdata(sqlite3_stmt * _Nonnull, int, NSData *__strong _Nonnull)");
    [v12 handleFailureInFunction:v13, @"_PASSqliteDatabase.m", 169, @"Invalid parameter not satisfying: %@", @"data != nil" file lineNumber description];
  }
  int v6 = objc_msgSend(v5, "_pas_dataWithNonnullBytes");

  sqlite3_uint64 v7 = [v6 length];
  if (v7 - 17 > 0x7FFFFFED)
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)v6);
    uint64_t v8 = sqlite3_bind_blob64(a1, a2, BytePtr, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    CFRetain(v6);
    CFDataGetBytePtr((CFDataRef)v6);
    uint64_t v8 = sqlite3_bind_blob_b();
  }
  uint64_t v10 = v8;

  return v10;
}

void sub_1A32D20D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A32D3680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t xClose(void *a1)
{
  id v2 = (const void *)a1[1];
  if (v2)
  {
    CFRelease(v2);
    a1[1] = 0;
  }
  sqlite3_free(a1);
  return 0;
}

uint64_t xOpen(uint64_t a1, void *a2)
{
  id v3 = sqlite3_malloc64(0x10uLL);
  if (!v3) {
    return 7;
  }
  uint64_t v4 = v3;
  uint64_t result = 0;
  *uint64_t v4 = 0;
  v4[1] = 0;
  *a2 = v4;
  return result;
}

__CFString *_PASFullwidthLatinToHalfwidth(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  if (!v2) {
    goto LABEL_26;
  }
  uint64_t v3 = v2;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  CFStringRef theString = v1;
  uint64_t v48 = 0;
  uint64_t v49 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  BOOL v46 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  int64_t v50 = 0;
  uint64_t v51 = 0;
  v47 = CStringPtr;
  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 64;
    while (1)
    {
      uint64_t v10 = (unint64_t)v8 >= 4 ? 4 : v8;
      uint64_t v11 = v49;
      if (v49 > v8)
      {
        if (v46)
        {
          UniChar v12 = v46[v8 + v48];
        }
        else if (v47)
        {
          UniChar v12 = v47[v48 + v8];
        }
        else
        {
          if (v51 <= v8 || v7 > v8)
          {
            uint64_t v14 = v10 + v6;
            uint64_t v15 = v9 - v10;
            uint64_t v16 = v8 - v10;
            uint64_t v17 = v16 + 64;
            if (v16 + 64 >= v49) {
              uint64_t v17 = v49;
            }
            int64_t v50 = v16;
            uint64_t v51 = v17;
            if (v49 >= v15) {
              uint64_t v11 = v15;
            }
            v53.length = v11 + v14;
            v53.location = v16 + v48;
            CFStringGetCharacters(theString, v53, (UniChar *)&v37);
            uint64_t v7 = v50;
          }
          UniChar v12 = *((_WORD *)&v37 + v8 - v7);
        }
        if ((unsigned __int16)(v12 + 255) < 0x5Eu) {
          break;
        }
      }
      ++v8;
      --v6;
      ++v9;
      if (v3 == v8) {
        goto LABEL_26;
      }
    }
    uint64_t v21 = malloc_type_malloc(2 * v3, 0x1000040BDFB0063uLL);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A0], @"malloc failed", 0, v37, v38, v39, v40, v41, v42, v43, v44);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v36);
    }
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    int64_t v24 = 0;
    uint64_t v25 = 64;
    do
    {
      if ((unint64_t)v24 >= 4) {
        uint64_t v26 = 4;
      }
      else {
        uint64_t v26 = v24;
      }
      uint64_t v27 = v49;
      if (v49 <= v24)
      {
        UniChar v28 = 0;
      }
      else if (v46)
      {
        UniChar v28 = v46[v24 + v48];
      }
      else if (v47)
      {
        UniChar v28 = v47[v48 + v24];
      }
      else
      {
        int64_t v29 = v50;
        if (v51 <= v24 || v50 > v24)
        {
          uint64_t v31 = v26 + v23;
          uint64_t v32 = v25 - v26;
          int64_t v33 = v24 - v26;
          int64_t v34 = v33 + 64;
          if (v33 + 64 >= v49) {
            int64_t v34 = v49;
          }
          int64_t v50 = v33;
          uint64_t v51 = v34;
          if (v49 >= v32) {
            uint64_t v27 = v32;
          }
          v54.length = v27 + v31;
          v54.location = v33 + v48;
          CFStringGetCharacters(theString, v54, (UniChar *)&v37);
          int64_t v29 = v50;
        }
        UniChar v28 = *((_WORD *)&v37 + v24 - v29);
      }
      if ((unsigned __int16)(v28 + 255) < 0x5Eu) {
        v28 += 288;
      }
      v22[v24++] = v28;
      --v23;
      ++v25;
    }
    while (v3 != v24);
    id v35 = [NSString alloc];
    double v18 = (__CFString *)objc_msgSend(v35, "initWithCharactersNoCopy:length:freeWhenDone:", v22, v3, 1, v37, v38, v39, v40, v41, v42, v43, v44);
  }
  else
  {
LABEL_26:
    double v18 = v1;
  }
  double v19 = v18;

  return v19;
}

__CFString *_PASTryToConvertPhoneNumberToASCII(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  if (!v2) {
    goto LABEL_47;
  }
  size_t v3 = v2;
  uint64_t FastestEncoding = CFStringGetFastestEncoding(v1);
  if (FastestEncoding == 1536) {
    goto LABEL_47;
  }
  if (v3 > 0x1FF)
  {
    id v5 = (char *)malloc_type_malloc(v3, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1F4188790](FastestEncoding);
    id v5 = (char *)buffer - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v3);
  }
  uint64_t v6 = v1;
  uint64_t v7 = self;

  uint64_t v8 = v5;
  if (!v7) {
    goto LABEL_44;
  }
  memset(buffer, 0, sizeof(buffer));
  CFIndex Length = CFStringGetLength(v6);
  uint64_t v27 = v6;
  uint64_t v30 = 0;
  CFIndex v31 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  UniChar v28 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  }
  int64_t v32 = 0;
  int64_t v33 = 0;
  uint64_t v8 = v5;
  int64_t v29 = CStringPtr;
  if (Length < 1)
  {
LABEL_44:

    uint64_t v1 = (__CFString *)[[NSString alloc] initWithBytes:v5 length:v8 - v5 encoding:1];
    goto LABEL_45;
  }
  uint64_t v12 = 0;
  int64_t v13 = 0;
  uint64_t v14 = 64;
  uint64_t v8 = v5;
  while (1)
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = v13;
    }
    CFIndex v16 = v31;
    if (v31 <= v13)
    {
      LOBYTE(v17) = 0;
      goto LABEL_18;
    }
    if (v28)
    {
      UniChar v17 = v28[v13 + v30];
    }
    else if (v29)
    {
      UniChar v17 = v29[v30 + v13];
    }
    else
    {
      int64_t v18 = v32;
      if (v33 <= v13 || v32 > v13)
      {
        uint64_t v20 = v15 + v12;
        uint64_t v21 = v14 - v15;
        int64_t v22 = v13 - v15;
        CFIndex v23 = v22 + 64;
        if (v22 + 64 >= v31) {
          CFIndex v23 = v31;
        }
        int64_t v32 = v22;
        int64_t v33 = v23;
        if (v31 >= v21) {
          CFIndex v16 = v21;
        }
        v36.length = v16 + v20;
        v36.location = v22 + v30;
        CFStringGetCharacters(v27, v36, (UniChar *)buffer);
        int64_t v18 = v32;
      }
      UniChar v17 = *((_WORD *)buffer + v13 - v18);
    }
    if (v17 > 0x2029u) {
      break;
    }
    if (v17 == 160) {
      goto LABEL_39;
    }
    if (v17 != 8211) {
      goto LABEL_40;
    }
    LOBYTE(v17) = 45;
LABEL_18:
    *v8++ = v17;
LABEL_33:
    ++v13;
    --v12;
    ++v14;
    if (Length == v13) {
      goto LABEL_44;
    }
  }
  if (v17 - 8234 < 5) {
    goto LABEL_33;
  }
  if (v17 == 12288)
  {
LABEL_39:
    LOBYTE(v17) = 32;
    goto LABEL_18;
  }
LABEL_40:
  if (v17 - 65281 < 0x5E)
  {
    LOBYTE(v17) = v17 + 32;
    goto LABEL_18;
  }
  if (v17 < 0x80u) {
    goto LABEL_18;
  }
  uint64_t v1 = v6;
LABEL_45:

  if (v3 >= 0x200) {
    free(v5);
  }
LABEL_47:
  int64_t v24 = v1;

  return v24;
}

void releaseObjcObject(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412546;
    id v4 = (id)objc_opt_class();
    __int16 v5 = 2048;
    uint64_t v6 = a1;
    id v2 = v4;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitestatement Releasing %@ %p", (uint8_t *)&v3, 0x16u);
  }
}

uint64_t xNext(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 8);
  if (v1)
  {
    if (v1[9])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_stepOutputRow, v1, @"_PASSqliteCollections.m", 367, @"Invalid parameter not satisfying: %@", @"!_eof" object file lineNumber description];
    }
    id v2 = (void *)MEMORY[0x1A62450A0]();
    [v1 stepIndexedRow];
    -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](v1);
  }
  return 0;
}

uint64_t xColumn(uint64_t a1, uint64_t a2, int a3)
{
  id v4 = *(id *)(a1 + 8);
  if (![(id)objc_opt_class() hasKey])
  {
    if (a3 != 1)
    {
      if (a3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    __int16 v11 = 0;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = (uint8_t *)&v11;
LABEL_18:
    _os_log_fault_impl(&dword_1A32C4000, v8, OS_LOG_TYPE_FAULT, "#passqlitecollections xColumn accessing pointer for some reason", v9, 2u);
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = buf;
    goto LABEL_18;
  }
  if (a3 == 1)
  {
LABEL_8:
    uint64_t v5 = -[_PASSqliteCollectionsCursor outputValue](v4);
    goto LABEL_9;
  }
  if (a3) {
    goto LABEL_11;
  }
  uint64_t v5 = [v4 outputKey];
LABEL_9:
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    _PASSqliteSetResult();

LABEL_15:
    uint64_t v7 = 0;
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v7 = 1;
LABEL_16:

  return v7;
}

void _PASSqliteSetResult()
{
  unsigned __int8 v0 = (sqlite3_context *)MEMORY[0x1F4188790]();
  valuePtr[512] = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  if (!v2)
  {
    UniChar v28 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PASSqliteSetResult(sqlite3_context * _Nonnull, __strong id _Nonnull)");
    [v28 handleFailureInFunction:v29, @"_PASSqliteDatabase.m", 348, @"Invalid parameter not satisfying: %@", @"objcObject" file lineNumber description];
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 == CFNumberGetTypeID() || v3 == CFBooleanGetTypeID())
  {
    id v4 = v2;
    if (CFNumberIsFloatType((CFNumberRef)v4))
    {
      [v4 doubleValue];
      sqlite3_result_double(v0, v5);
    }
    else
    {
      valuePtr[0] = 0;
      CFNumberGetValue((CFNumberRef)v4, kCFNumberSInt64Type, valuePtr);
      sqlite3_result_int64(v0, valuePtr[0]);
    }
    goto LABEL_24;
  }
  if (v3 == CFStringGetTypeID())
  {
    id v4 = v2;
    sqlite3_uint64 v35 = 0;
    uint64_t v6 = objc_msgSend(v4, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v35);
    if (v6)
    {
      uint64_t v7 = (const char *)v6;
      uint64_t v8 = _NSIsNSCFConstantString() - 1;
      sqlite3_uint64 v9 = v35;
      uint64_t v10 = v0;
      __int16 v11 = v7;
LABEL_11:
      unsigned __int8 v12 = 1;
LABEL_23:
      sqlite3_result_text64(v10, v11, v9, (void (__cdecl *)(void *))v8, v12);
      goto LABEL_24;
    }
    uint64_t v19 = [v4 _fastCharacterContents];
    if (v19)
    {
      uint64_t v20 = (const char *)v19;
      sqlite3_uint64 v9 = [v4 lengthOfBytesUsingEncoding:10];
      uint64_t v10 = v0;
      __int16 v11 = v20;
      uint64_t v8 = -1;
LABEL_22:
      unsigned __int8 v12 = 4;
      goto LABEL_23;
    }
    uint64_t v23 = [v4 length];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    unint64_t v24 = [v4 maximumLengthOfBytesUsingEncoding:4];
    if (v24 <= 0x1000)
    {
      objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", valuePtr, v24, &v35, 4, 0, 0, v23, &v33);
      if (!v34)
      {
        sqlite3_uint64 v9 = v35;
        __int16 v11 = (const char *)valuePtr;
        uint64_t v10 = v0;
        uint64_t v8 = -1;
        goto LABEL_11;
      }
    }
    sqlite3_uint64 v25 = [v4 lengthOfBytesUsingEncoding:4];
    sqlite3_uint64 v35 = v25;
    if (v25)
    {
      uint64_t v26 = (const char *)sqlite3_malloc64(v25);
      if (v26)
      {
        uint64_t v27 = v26;
        objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v26, v35, 0, 4, 0, 0, v23, &v33);
        if (v34) {
          __assert_rtn("_PASSqliteSetResult", "_PASSqliteDatabase.m", 408, "remainingRange.length == 0");
        }
        sqlite3_uint64 v9 = v35;
        uint64_t v8 = MEMORY[0x1E4FBA970];
        uint64_t v10 = v0;
        __int16 v11 = v27;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v30 = (const char *)sqlite3_malloc64([v4 lengthOfBytesUsingEncoding:10]);
      if (v30)
      {
        CFIndex v31 = v30;
        [v4 getCharacters:v30];
        sqlite3_uint64 v9 = [v4 lengthOfBytesUsingEncoding:10];
        uint64_t v8 = MEMORY[0x1E4FBA970];
        uint64_t v10 = v0;
        __int16 v11 = v31;
        goto LABEL_22;
      }
    }
LABEL_40:
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v32);
  }
  if (v3 == CFDateGetTypeID())
  {
    id v4 = v2;
    int64_t v13 = (void *)MEMORY[0x1A62450A0]();
    if (_PASSqliteSetResult__pasOnceToken9 != -1) {
      dispatch_once(&_PASSqliteSetResult__pasOnceToken9, &__block_literal_global_3585);
    }
    uint64_t v14 = [(id)_PASSqliteSetResult__pasExprOnceResult stringFromDate:v4];
    _PASSqliteSetResult(v0, v14);

    goto LABEL_24;
  }
  if (v3 == CFDataGetTypeID())
  {
    id v4 = v2;
    sqlite3_uint64 v15 = [v4 length];
    if (!v15)
    {
      sqlite3_result_zeroblob64(v0, 0);
      goto LABEL_24;
    }
    sqlite3_uint64 v16 = v15;
    UniChar v17 = sqlite3_malloc64(v15);
    if (v17)
    {
      int64_t v18 = v17;
      [v4 getBytes:v17 length:v16];
      sqlite3_result_blob64(v0, v18, v16, MEMORY[0x1E4FBA970]);
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_40;
  }
  if (v3 != CFNullGetTypeID())
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PASSqliteSetResult(sqlite3_context * _Nonnull, __strong id _Nonnull)");
    [v21 handleFailureInFunction:v22, @"_PASSqliteDatabase.m", 439, @"unsupported sql type %@", objc_opt_class() file lineNumber description];
  }
  sqlite3_result_null(v0);
LABEL_25:
}

uint64_t xEof(uint64_t a1)
{
  id v1 = *(void **)(a1 + 8);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](v2);
  uint64_t v3 = v2[9];

  return v3;
}

void sub_1A32D5C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A32D5EA4(void *a1)
{
}

void sub_1A32D5EB0(_Unwind_Exception *a1)
{
}

void sub_1A32D6530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getLockStateChangedQueue_block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("_PASDeviceState.lockStateChanged", v0);
  id v2 = (void *)getLockStateChangedQueue_queue;
  getLockStateChangedQueue_queue = (uint64_t)v1;
}

id _PASKeepOnlyCharacterSet(void *a1, const __CFCharacterSet *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    uint64_t v7 = (__CFString *)v3;
    uint64_t v8 = self;

    if (v8)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v30 = 0u;
      CFIndex Length = CFStringGetLength(v7);
      CFStringRef theString = v7;
      uint64_t v40 = 0;
      CFIndex v41 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      long long v38 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      }
      id v28 = v3;
      int64_t v42 = 0;
      int64_t v43 = 0;
      long long v39 = CStringPtr;
      if (Length < 1)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v12 = 0;
        int64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 64;
        do
        {
          if ((unint64_t)v13 >= 4) {
            uint64_t v16 = 4;
          }
          else {
            uint64_t v16 = v13;
          }
          CFIndex v17 = v41;
          if (v41 <= v13)
          {
            UniChar v18 = 0;
          }
          else if (v38)
          {
            UniChar v18 = v38[v13 + v40];
          }
          else if (v39)
          {
            UniChar v18 = v39[v40 + v13];
          }
          else
          {
            int64_t v19 = v42;
            if (v43 <= v13 || v42 > v13)
            {
              uint64_t v21 = v16 + v12;
              uint64_t v22 = v15 - v16;
              int64_t v23 = v13 - v16;
              CFIndex v24 = v23 + 64;
              if (v23 + 64 >= v41) {
                CFIndex v24 = v41;
              }
              int64_t v42 = v23;
              int64_t v43 = v24;
              if (v41 >= v22) {
                CFIndex v17 = v22;
              }
              v45.length = v17 + v21;
              v45.location = v23 + v40;
              CFStringGetCharacters(theString, v45, buffer);
              int64_t v19 = v42;
            }
            UniChar v18 = buffer[v13 - v19];
          }
          if (CFCharacterSetIsCharacterMember(a2, v18)) {
            v6[v14++] = v18;
          }
          ++v13;
          --v12;
          ++v15;
        }
        while (Length != v13);
      }
      id v3 = v28;
    }
    else
    {
      uint64_t v14 = 0;
    }

    if (v14 == v5)
    {
      free(v6);
      id v25 = (id)[(__CFString *)v7 copy];
    }
    else
    {
      id v25 = (id)[[NSString alloc] initWithCharactersNoCopy:v6 length:v14 freeWhenDone:1];
    }
  }
  else
  {
    id v25 = v3;
  }
  uint64_t v26 = v25;

  return v26;
}

uint64_t AsyncFIFOQueue.__allocating_init(priority:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AsyncFIFOQueue.init(priority:)(a1);
  return v2;
}

uint64_t AsyncFIFOQueue.init(priority:)(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA768);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v34 = (uint64_t)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA770);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA790);
  uint64_t v8 = *(void *)(v33 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v33);
  uint64_t v31 = v10;
  long long v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA780);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  UniChar v18 = (char *)&v31 - v17;
  uint64_t v36 = v1;
  swift_defaultActor_initialize();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA778);
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
  long long v37 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA800);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBD028], v4);
  uint64_t v21 = v12;
  sub_1A3329418();
  sub_1A32D7100((uint64_t)v18, (uint64_t)v16, &qword_1E95AA780);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v36 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation, v16, v19);
    uint64_t v25 = v34;
    uint64_t v24 = v35;
    sub_1A32D7100(v35, v34, &qword_1E95AA768);
    uint64_t v27 = v32;
    uint64_t v26 = v33;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v32, v21, v33);
    unint64_t v28 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v29 + v28, v27, v26);
    uint64_t v30 = sub_1A32D79B8(v25, (uint64_t)&unk_1E95AA810, v29);
    sub_1A32D7B64(v24, &qword_1E95AA768);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v21, v26);
    *(void *)(v23 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__task) = v30;
    sub_1A32D7B64((uint64_t)v18, &qword_1E95AA780);
    return v23;
  }
  return result;
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

uint64_t sub_1A32D7028(uint64_t a1, uint64_t a2)
{
  sub_1A32D7B64(a2, &qword_1E95AA780);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA778);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_1A32D70F8(uint64_t a1)
{
  return sub_1A32D7028(a1, *(void *)(v1 + 16));
}

uint64_t sub_1A32D7100(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A32D7164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA788);
  void v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1A32D7228, 0, 0);
}

uint64_t sub_1A32D7228()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA790);
  sub_1A33293F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A32D72F8;
  uint64_t v2 = *(void *)(v0 + 40);
  return MEMORY[0x1F4187D58](v0 + 16, 0, 0, v2);
}

uint64_t sub_1A32D72F8()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1A32D73F4, 0, 0);
}

uint64_t sub_1A32D73F4()
{
  uint64_t v1 = (int *)v0[2];
  uint64_t v2 = v0[3];
  v0[9] = v1;
  v0[10] = v2;
  if (!v1)
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    goto LABEL_5;
  }
  if (sub_1A3329438())
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    sub_1A32D8590((uint64_t)v1);
LABEL_5:
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  uint64_t v6 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1A32D7554;
  return v6();
}

uint64_t sub_1A32D7554()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  sub_1A32D8590(v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1A32D72F8;
  uint64_t v5 = *(void *)(v1 + 40);
  return MEMORY[0x1F4187D58](v1 + 16, 0, 0, v5);
}

uint64_t sub_1A32D7704()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA790);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1A32D77D4(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA790) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1A32D78C4;
  return sub_1A32D7164(a1, v5, v6, v7);
}

uint64_t sub_1A32D78C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A32D79B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A33293B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1A33293A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1A32D7B64(a1, &qword_1E95AA768);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A3329398();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1A32D7B64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AsyncFIFOQueue.__allocating_init()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA768);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1A33293B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  type metadata accessor for AsyncFIFOQueue();
  uint64_t v4 = swift_allocObject();
  AsyncFIFOQueue.init(priority:)((uint64_t)v2);
  return v4;
}

uint64_t type metadata accessor for AsyncFIFOQueue()
{
  uint64_t result = qword_1E95AA7D8;
  if (!qword_1E95AA7D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AsyncFIFOQueue.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA778);
  sub_1A33293D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t AsyncFIFOQueue.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA778);
  sub_1A33293D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x1F4188210](v1);
}

uint64_t sub_1A32D7E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1E95AA5E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  v10[0] = &unk_1E95AA820;
  v10[1] = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA778);
  sub_1A33293C8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1A32D7F3C(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1A32D85A4;
  return v5();
}

uint64_t sub_1A32D8008(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A32D85A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E95AA818 + dword_1E95AA818);
  return v6(a1, v4);
}

uint64_t sub_1A32D80C0()
{
  return MEMORY[0x1F4187D98](*(void *)(v0 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__task), MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
}

uint64_t AsyncFIFOQueue.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1A32D80F8()
{
  return v0;
}

uint64_t sub_1A32D8104()
{
  return type metadata accessor for AsyncFIFOQueue();
}

void sub_1A32D810C()
{
  sub_1A32D8228();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AsyncFIFOQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AsyncFIFOQueue);
}

uint64_t dispatch thunk of AsyncFIFOQueue.__allocating_init(priority:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AsyncFIFOQueue.async(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of AsyncFIFOQueue.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

void sub_1A32D8228()
{
  if (!qword_1E95AA7F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA800);
    unint64_t v0 = sub_1A33293E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E95AA7F8);
    }
  }
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

uint64_t sub_1A32D82CC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1A32D83A8;
  return v6(a1);
}

uint64_t sub_1A32D83A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A32D84A0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A32D84D8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A32D78C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E95AA828 + dword_1E95AA828);
  return v6(a1, v4);
}

uint64_t sub_1A32D8590(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1A32D85A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)&long long v22 = a4;
  *((void *)&v22 + 1) = a5;
  uint64_t v10 = sub_1A3329498();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v21 - v12;
  uint64_t v23 = MEMORY[0x1E4FBC860];
  uint64_t v24 = MEMORY[0x1E4FBC860] + 32;
  long long v25 = xmmword_1A332F070;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E95AA838);
  unint64_t v15 = sub_1A32DF818();
  MEMORY[0x1A6243ED0](&v23, a1, v14, a2, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a6, v10);
  int v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 48))(v13, 1, a2);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v16 != 1 && sub_1A33292C8() == 1 || (MEMORY[0x1A6243EA0](a1, v14, a2, v15) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    long long v25 = v22;
    uint64_t result = type metadata accessor for StringTrieNode(0, (uint64_t)&v23);
    *(void *)(a6 + *(int *)(result + 52)) = 0;
  }
  else
  {
    uint64_t v23 = a1;
    sub_1A33292E8();
    uint64_t v18 = sub_1A3329298();
    v21[0] = v21;
    uint64_t v31 = v18;
    MEMORY[0x1F4188790](v18);
    v21[-4] = a2;
    v21[-3] = a3;
    long long v19 = v22;
    *(_OWORD *)&v21[-2] = v22;
    v21[1] = sub_1A33292E8();
    v21[3] = MEMORY[0x1E4FBAEC0];
    swift_getWitnessTable();
    sub_1A3329368();
    v21[2] = 0;
    swift_bridgeObjectRelease();
    uint64_t v29 = v30;
    uint64_t v23 = MEMORY[0x1E4FBC098];
    uint64_t v24 = a2;
    *(void *)&long long v25 = MEMORY[0x1E4FBC0B8];
    *((void *)&v25 + 1) = MEMORY[0x1E4FBC0A0];
    uint64_t v26 = MEMORY[0x1E4FBC0A8];
    uint64_t v27 = a3;
    long long v28 = v19;
    type metadata accessor for StandardTrieNode(255, (uint64_t)&v23);
    swift_getTupleTypeMetadata2();
    sub_1A3329378();
    uint64_t v23 = sub_1A33292B8();
    MEMORY[0x1F4188790](v23);
    v21[-4] = a2;
    v21[-3] = a3;
    *(_OWORD *)&v21[-2] = v19;
    sub_1A33292E8();
    swift_getWitnessTable();
    sub_1A3329368();
    swift_bridgeObjectRelease();
    uint64_t v20 = v31;
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    long long v25 = v19;
    uint64_t result = type metadata accessor for StringTrieNode(0, (uint64_t)&v23);
    *(void *)(a6 + *(int *)(result + 52)) = v20;
  }
  return result;
}

uint64_t sub_1A32D89D8(uint64_t *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v52 = a5;
  uint64_t v53 = a6;
  size_t v58 = a4;
  uint64_t v56 = a1;
  uint64_t v8 = sub_1A3329498();
  MEMORY[0x1F4188790](v8 - 8);
  CFRange v57 = (char *)v45 - v9;
  v45[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA838);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v48 = (_OWORD *)((char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  unint64_t v15 = (void *)((char *)v45 - v14);
  uint64_t v49 = v13;
  uint64_t v16 = *(int *)(v13 + 48);
  uint64_t v17 = (char *)v45 + v16 - v14;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v20 = *a2;
  uint64_t v19 = a2[1];
  uint64_t v22 = a2[2];
  unint64_t v21 = a2[3];
  *unint64_t v15 = *a2;
  v15[1] = v19;
  uint64_t v51 = v19;
  v15[2] = v22;
  v15[3] = v21;
  uint64_t v23 = *(void *)(a3 - 8);
  BOOL v46 = *(void (**)(char *))(v23 + 16);
  v47 = v18;
  v46(v17);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v54 = v20;
  swift_unknownObjectRetain();
  v24(v17, a3);
  unint64_t v50 = v21;
  if (v22 == v21 >> 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v22 >= (uint64_t)(v21 >> 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v25 = v51;
  int v55 = *(unsigned __int8 *)(v51 + v22);
  v45[0] = v22 + 1;
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v27 = v58;
  v26[2] = a3;
  v26[3] = v27;
  uint64_t v28 = v52;
  uint64_t v29 = v53;
  v26[4] = v52;
  v26[5] = v29;
  uint64_t v30 = v48;
  uint64_t v31 = (char *)v48 + *(int *)(v49 + 48);
  long long v32 = *((_OWORD *)a2 + 1);
  *uint64_t v48 = *(_OWORD *)a2;
  v30[1] = v32;
  ((void (*)(char *, char *, uint64_t))v46)(v31, v47, a3);
  uint64_t v33 = v57;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v57, v31, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v33, 0, 1, a3);
  uint64_t v60 = v54;
  uint64_t v61 = v25;
  uint64_t v62 = v45[0];
  unint64_t v63 = v50;
  uint64_t v34 = (void *)swift_allocObject();
  uint64_t v35 = v58;
  v34[2] = a3;
  v34[3] = v35;
  v34[4] = v28;
  v34[5] = v29;
  v34[6] = sub_1A32E272C;
  v34[7] = v26;
  size_t v58 = v26;
  swift_unknownObjectRetain_n();
  uint64_t v36 = v56;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = *v36;
  uint64_t v37 = v64;
  *uint64_t v36 = 0x8000000000000000;
  sub_1A32DF54C(v55);
  if (__OFADD__(*(void *)(v37 + 16), (v38 & 1) == 0))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    uint64_t result = sub_1A33295D8();
    __break(1u);
    return result;
  }
  char v39 = v38;
  sub_1A32DF818();
  sub_1A33292E8();
  sub_1A3329518();
  char v40 = sub_1A33294F8();
  uint64_t v41 = v64;
  if (v40)
  {
    sub_1A32DF54C(v55);
    if ((v39 & 1) != (v42 & 1)) {
      goto LABEL_13;
    }
  }
  *uint64_t v56 = v41;
  swift_bridgeObjectRelease();
  if (v39)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v64 = ((uint64_t (*)(uint64_t))v34[6])(v43);
    char v59 = v55;
    sub_1A3329508();
  }
  swift_bridgeObjectRelease();
  sub_1A3329318();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease_n();
}

uint64_t sub_1A32D8E38()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA838);
  swift_getTupleTypeMetadata2();
  sub_1A3329378();
  sub_1A32DF818();

  return sub_1A33292B8();
}

uint64_t sub_1A32D8EBC(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[1] = a1;
  v20[0] = MEMORY[0x1E4FBC098];
  v20[1] = a3;
  v20[2] = MEMORY[0x1E4FBC0B8];
  v20[3] = MEMORY[0x1E4FBC0A0];
  uint64_t v11 = MEMORY[0x1E4FBC0A8];
  v20[4] = MEMORY[0x1E4FBC0A8];
  v20[5] = a4;
  v20[6] = a5;
  v20[7] = a6;
  uint64_t v12 = type metadata accessor for StandardTrieNode(255, (uint64_t)v20);
  uint64_t v13 = sub_1A3329498();
  MEMORY[0x1F4188790](v13 - 8);
  unint64_t v15 = (char *)v19 - v14;
  char v16 = *a2;
  uint64_t v17 = (void *)swift_bridgeObjectRetain();
  sub_1A32D9050(v17, MEMORY[0x1E4FBC098], a3, MEMORY[0x1E4FBC0B8], MEMORY[0x1E4FBC0A0], v11, a4, a5, (uint64_t)v15, a6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v15, 0, 1, v12);
  LOBYTE(v20[0]) = v16;
  sub_1A33292E8();
  return sub_1A3329318();
}

uint64_t sub_1A32D9050@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v37 = a8;
  uint64_t v42 = a7;
  *((void *)&v40 + 1) = a5;
  *(void *)&long long v40 = a4;
  uint64_t v36 = a1;
  uint64_t v41 = a10;
  uint64_t v14 = sub_1A3329498();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)v35 - v16;
  *(void *)&v52[0] = sub_1A33292A8();
  sub_1A3329388();
  swift_getWitnessTable();
  sub_1A3329338();
  swift_bridgeObjectRelease();
  long long v39 = v44;
  v52[0] = v44;
  v52[1] = v45;
  uint64_t v18 = sub_1A33294B8();
  uint64_t v38 = a6;
  uint64_t v51 = a6;
  uint64_t v19 = v36;
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x1A6243ED0](v52, v19, v18, a3, WitnessTable);
  swift_unknownObjectRelease();
  unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  *(void *)&long long v39 = a9;
  v21(v17, a9, v14);
  int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 48))(v17, 1, a3);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if (v22 != 1 && sub_1A33292C8() == 1 || (MEMORY[0x1A6243EA0](v19, v18, a3, WitnessTable) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    *(void *)&long long v44 = a2;
    *((void *)&v44 + 1) = a3;
    long long v45 = v40;
    uint64_t v46 = v38;
    uint64_t v47 = v42;
    uint64_t v48 = v37;
    uint64_t v49 = v41;
    uint64_t result = type metadata accessor for StandardTrieNode(0, (uint64_t)&v44);
    *(void *)(v39 + *(int *)(result + 84)) = 0;
  }
  else
  {
    *(void *)&long long v44 = v19;
    sub_1A33292E8();
    uint64_t v24 = v38;
    uint64_t v50 = sub_1A3329298();
    MEMORY[0x1F4188790](v50);
    v35[-8] = a2;
    v35[-7] = a3;
    uint64_t v25 = *((void *)&v40 + 1);
    v35[-6] = v40;
    v35[-5] = v25;
    uint64_t v26 = v42;
    v35[-4] = v24;
    v35[-3] = v26;
    uint64_t v27 = v37;
    v35[-2] = v37;
    uint64_t v28 = v27;
    v35[-1] = v41;
    v35[0] = sub_1A33292E8();
    v35[2] = MEMORY[0x1E4FBAEC0];
    swift_getWitnessTable();
    sub_1A3329368();
    v35[1] = 0;
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void *)&v52[0];
    *(void *)&long long v44 = a2;
    *((void *)&v44 + 1) = a3;
    long long v29 = v40;
    long long v45 = v40;
    uint64_t v30 = v42;
    uint64_t v46 = v24;
    uint64_t v47 = v42;
    uint64_t v48 = v28;
    uint64_t v31 = v28;
    uint64_t v32 = v41;
    uint64_t v49 = v41;
    uint64_t v33 = type metadata accessor for StandardTrieNode(255, (uint64_t)&v44);
    swift_getTupleTypeMetadata2();
    sub_1A3329378();
    uint64_t v34 = sub_1A33292B8();
    uint64_t v36 = v35;
    uint64_t v43 = v34;
    MEMORY[0x1F4188790](v34);
    v35[-8] = a2;
    v35[-7] = a3;
    *(_OWORD *)&v35[-6] = v29;
    v35[-4] = v24;
    v35[-3] = v30;
    v35[-2] = v31;
    v35[-1] = v32;
    sub_1A33292E8();
    swift_getWitnessTable();
    sub_1A3329368();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v39 + *(int *)(v33 + 84)) = v44;
  }
  return result;
}

uint64_t sub_1A32D95B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v42 = a6;
  uint64_t v11 = sub_1A3329498();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  uint64_t v35 = v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v37 = (char *)&v32 - v13;
  uint64_t v14 = *(void *)(a5 + 16);
  uint64_t v15 = sub_1A3329498();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t v20 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v39 = a2;
  long long v40 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a1;
  uint64_t v47 = a1;
  uint64_t v48 = a2;
  uint64_t v22 = a3;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v36 = a4;
  sub_1A33294B8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1A3329458();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1, v14) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    uint64_t v24 = sub_1A3329498();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v42, v41, v24);
  }
  uint64_t v32 = WitnessTable;
  uint64_t v33 = v22;
  uint64_t v27 = v38;
  uint64_t v26 = v39;
  uint64_t v28 = v37;
  long long v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v40, v19, v14);
  uint64_t v30 = *(void *)(v41 + *(int *)(a5 + 84));
  if (!v30)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v29, v14);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a5 + 24) - 8) + 56))(v42, 1, 1);
  }
  MEMORY[0x1A6243ED0](v29, v30, v14, a5, *(void *)(a5 + 48));
  uint64_t v31 = *(void *)(a5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v28, 1, a5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v40, v14);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v34);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a5 + 24) - 8) + 56))(v42, 1, 1);
  }
  uint64_t v43 = v27;
  uint64_t v44 = v26;
  uint64_t v45 = v33;
  uint64_t v46 = v36;
  swift_unknownObjectRetain();
  sub_1A3329488();
  sub_1A32D95B8(v47, v48, v49, v50, a5);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v40, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v28, a5);
}

uint64_t sub_1A32D9A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v47 = a5;
  uint64_t v48 = a6;
  uint64_t v46 = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v55 = a2;
  uint64_t v56 = v8;
  MEMORY[0x1F4188790](a1);
  uint64_t v49 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1A3329498();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v50 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v14 = (char *)&v44 - v13;
  uint64_t v15 = *(void *)(v10 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v12);
  uint64_t v54 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v44 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v44 - v21;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v45 = a1;
  v23((char *)&v44 - v21, a1, v10);
  v23(v20, v55, v10);
  uint64_t v51 = TupleTypeMetadata2;
  uint64_t v24 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
  v23(v14, (uint64_t)v22, v10);
  uint64_t v52 = v24;
  v23(v24, (uint64_t)v20, v10);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
  uint64_t v53 = a3;
  if (v25(v14, 1, a3) != 1)
  {
    long long v29 = v49;
    uint64_t v44 = v15;
    v23(v54, (uint64_t)v14, v10);
    uint64_t v30 = v52;
    uint64_t v27 = v53;
    int v31 = v25(v52, 1, v53);
    uint64_t v32 = v56;
    uint64_t v33 = (void (**)(char *, uint64_t))(v56 + 8);
    if (v31 != 1)
    {
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
      uint64_t v51 = v56 + 8;
      v36(v29, v30, v27);
      uint64_t v28 = v48;
      LODWORD(v56) = sub_1A3329348();
      uint64_t v37 = *(void (**)(char *, uint64_t))(v32 + 8);
      v37(v29, v27);
      uint64_t v38 = *(void (**)(char *, uint64_t))(v44 + 8);
      v38(v20, v10);
      v38(v22, v10);
      v37(v54, v27);
      v38(v14, v10);
      if ((v56 & 1) == 0) {
        return 0;
      }
      goto LABEL_10;
    }
    uint64_t v34 = *(void (**)(char *, uint64_t))(v44 + 8);
    v34(v20, v10);
    v34(v22, v10);
    (*v33)(v54, v27);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v50 + 8))(v14, v51);
    return 0;
  }
  uint64_t v26 = *(void (**)(char *, uint64_t))(v15 + 8);
  v26(v20, v10);
  v26(v22, v10);
  uint64_t v27 = v53;
  if (v25(v52, 1, v53) != 1) {
    goto LABEL_6;
  }
  v26(v14, v10);
  uint64_t v28 = v48;
LABEL_10:
  uint64_t v40 = v46;
  uint64_t v39 = v47;
  uint64_t v57 = v27;
  uint64_t v58 = v46;
  uint64_t v59 = v47;
  uint64_t v60 = v28;
  uint64_t v41 = *(int *)(type metadata accessor for StringTrieNode(0, (uint64_t)&v57) + 52);
  uint64_t v42 = *(void *)(v55 + v41);
  if (*(void *)(v45 + v41))
  {
    if (v42)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v57 = MEMORY[0x1E4FBC098];
      uint64_t v58 = v27;
      uint64_t v59 = MEMORY[0x1E4FBC0B8];
      uint64_t v60 = MEMORY[0x1E4FBC0A0];
      uint64_t v61 = MEMORY[0x1E4FBC0A8];
      uint64_t v62 = v40;
      uint64_t v63 = v39;
      uint64_t v64 = v28;
      type metadata accessor for StandardTrieNode(0, (uint64_t)&v57);
      swift_getWitnessTable();
      char v43 = sub_1A33292F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v43) {
        return 1;
      }
    }
  }
  else if (!v42)
  {
    return 1;
  }
  return 0;
}

BOOL sub_1A32D9F74(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A32D9F84()
{
  return sub_1A3329608();
}

uint64_t sub_1A32D9FAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_1A33295C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6156627573 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A33295C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A32DA0A4()
{
  return sub_1A3329618();
}

uint64_t sub_1A32DA0EC(char a1)
{
  if (a1) {
    return 0x65756C6156627573;
  }
  else {
    return 0x65756C6176;
  }
}

BOOL sub_1A32DA124(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A32D9F74(*a1, *a2);
}

uint64_t sub_1A32DA13C()
{
  return sub_1A32DA0A4();
}

uint64_t sub_1A32DA150()
{
  return sub_1A32D9F84();
}

uint64_t sub_1A32DA164()
{
  return sub_1A3329618();
}

uint64_t sub_1A32DA1B0()
{
  return sub_1A32DA0EC(*v0);
}

uint64_t sub_1A32DA1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A32D9FAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A32DA1F8()
{
  return 0;
}

uint64_t sub_1A32DA204@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A32E2594();
  *a1 = result;
  return result;
}

uint64_t sub_1A32DA238(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DA28C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A32DA2E0(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v22 = *(void *)(a2 + 32);
  uint64_t v23 = v5;
  uint64_t v28 = v5;
  uint64_t v29 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v4;
  uint64_t v30 = v22;
  uint64_t v31 = v6;
  type metadata accessor for StringTrieNode.CodingKeys(255, (uint64_t)&v28);
  swift_getWitnessTable();
  uint64_t v7 = sub_1A33295B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v19 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v7;
  uint64_t v12 = v22;
  sub_1A3329638();
  LOBYTE(v28) = 0;
  uint64_t v13 = v24;
  uint64_t v14 = v23;
  uint64_t v15 = v25;
  sub_1A3329598();
  if (v15) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  }
  uint64_t v25 = v8;
  uint64_t v37 = *(void *)(v13 + *(int *)(a2 + 52));
  char v36 = 1;
  uint64_t v28 = MEMORY[0x1E4FBC098];
  uint64_t v29 = v14;
  uint64_t v17 = MEMORY[0x1E4FBC0A0];
  uint64_t v30 = MEMORY[0x1E4FBC0B8];
  uint64_t v31 = MEMORY[0x1E4FBC0A0];
  uint64_t v32 = MEMORY[0x1E4FBC0A8];
  uint64_t v33 = v21;
  uint64_t v34 = v12;
  uint64_t v35 = v20;
  type metadata accessor for StandardTrieNode(255, (uint64_t)&v28);
  sub_1A33292E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v17;
  uint64_t v27 = WitnessTable;
  swift_getWitnessTable();
  sub_1A3329598();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v11);
}

uint64_t sub_1A32DA578@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v31 = a6;
  uint64_t v38 = sub_1A3329498();
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v35 = (char *)&v29 - v11;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v47 = a5;
  type metadata accessor for StringTrieNode.CodingKeys(255, (uint64_t)&v44);
  swift_getWitnessTable();
  uint64_t v40 = sub_1A3329578();
  uint64_t v37 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  uint64_t v39 = a3;
  uint64_t v34 = a4;
  uint64_t v46 = a4;
  uint64_t v47 = a5;
  uint64_t v32 = a5;
  uint64_t v14 = type metadata accessor for StringTrieNode(0, (uint64_t)&v44);
  uint64_t v30 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v29 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v36 = v13;
  uint64_t v17 = (uint64_t)v41;
  sub_1A3329628();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v18 = v34;
  uint64_t v41 = a1;
  uint64_t v29 = v16;
  uint64_t v19 = v33;
  uint64_t v20 = v38;
  LOBYTE(v44) = 0;
  uint64_t v21 = v35;
  uint64_t v22 = v36;
  sub_1A3329548();
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v29, v21, v20);
  uint64_t v44 = MEMORY[0x1E4FBC098];
  uint64_t v45 = a2;
  uint64_t v23 = MEMORY[0x1E4FBC0B8];
  uint64_t v46 = MEMORY[0x1E4FBC0B8];
  uint64_t v47 = MEMORY[0x1E4FBC0A0];
  uint64_t v48 = MEMORY[0x1E4FBC0A8];
  uint64_t v49 = v39;
  uint64_t v50 = v18;
  uint64_t v51 = v32;
  type metadata accessor for StandardTrieNode(255, (uint64_t)&v44);
  uint64_t v24 = v40;
  sub_1A33292E8();
  LOBYTE(v44) = 1;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = v23;
  uint64_t v43 = WitnessTable;
  swift_getWitnessTable();
  sub_1A3329548();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v22, v24);
  uint64_t v26 = v29;
  *(void *)&v29[*(int *)(v14 + 52)] = v52;
  uint64_t v27 = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v31, v26, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v26, v14);
}

uint64_t sub_1A32DAA04@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A32DA578(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_1A32DAA28(void *a1, uint64_t a2)
{
  return sub_1A32DA2E0(a1, a2);
}

uint64_t sub_1A32DAA40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1A32D9A0C(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t sub_1A32DAA54(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v107 = a8;
  uint64_t v97 = a7;
  uint64_t v105 = a5;
  uint64_t v106 = a6;
  v98 = a1;
  uint64_t v13 = sub_1A3329498();
  MEMORY[0x1F4188790](v13 - 8);
  v99 = (char *)v89 - v14;
  uint64_t v96 = sub_1A3329498();
  uint64_t v95 = *(void *)(v96 - 8);
  MEMORY[0x1F4188790](v96);
  *(void *)&long long v109 = (char *)v89 - v15;
  uint64_t v16 = sub_1A33294B8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  v93 = (_OWORD *)((char *)v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v94 = (void *)((char *)v89 - v21);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v111 = *(void *)(a3 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  v90 = (char *)v89 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  uint64_t v112 = (uint64_t)v89 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v110 = (char *)v89 - v28;
  uint64_t v103 = v27;
  uint64_t v29 = *(int *)(v27 + 48);
  uint64_t v30 = *a2;
  uint64_t v31 = a2[1];
  uint64_t v32 = (char *)a2[2];
  uint64_t v33 = a2[3];
  v104 = a2;
  void *v34 = v30;
  v34[1] = v31;
  v34[2] = v32;
  v34[3] = v33;
  uint64_t v35 = *(void *)(a4 - 8);
  char v36 = *(void (**)(void))(v35 + 16);
  v108 = (char *)v34 + v29;
  v102 = (char *)a2 + v29;
  uint64_t v113 = a4;
  uint64_t v101 = v35 + 16;
  v100 = v36;
  v36();
  *(void *)&long long v118 = v30;
  *((void *)&v118 + 1) = v31;
  v119 = v32;
  uint64_t v120 = v33;
  uint64_t v37 = v111;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = v109;
  sub_1A3329458();
  uint64_t v40 = v39;
  uint64_t v41 = v39;
  uint64_t v42 = a3;
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v41, 1, a3);
  uint64_t v92 = v35;
  uint64_t v44 = (uint64_t (**)(char *, uint64_t))(v35 + 8);
  if (v43 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v40, v96);
    return (*v44)(v108, v113);
  }
  v89[1] = WitnessTable;
  uint64_t v91 = v16;
  uint64_t v96 = a10;
  uint64_t v95 = a9;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v110, v40, a3);
  uint64_t v46 = *v44;
  uint64_t v47 = v113;
  (*v44)(v108, v113);
  uint64_t v48 = v94;
  uint64_t v49 = (char *)v94 + *(int *)(v103 + 48);
  uint64_t v51 = (void *)*v104;
  uint64_t v50 = v104[1];
  v108 = (char *)v104[2];
  uint64_t v52 = v108;
  *(void *)&long long v109 = v50;
  uint64_t v53 = v37;
  uint64_t v54 = v104[3];
  void *v94 = v51;
  v48[1] = v50;
  v48[2] = v52;
  v48[3] = v54;
  ((void (*)(char *, char *, uint64_t))v100)(v49, v102, v47);
  swift_unknownObjectRetain();
  v46(v49, v47);
  uint64_t v57 = *(void (**)(void, void, void))(v53 + 16);
  uint64_t v56 = (char *)(v53 + 16);
  uint64_t v55 = v57;
  v57(v112, v110, v42);
  uint64_t v58 = (void *)swift_allocObject();
  v58[2] = v42;
  v58[3] = v47;
  uint64_t v59 = v106;
  v58[4] = v105;
  v58[5] = v59;
  uint64_t v60 = v97;
  uint64_t v61 = v107;
  uint64_t v62 = v108;
  v58[6] = v97;
  v58[7] = v61;
  uint64_t v63 = v96;
  v58[8] = v95;
  v58[9] = v63;
  *(void *)&long long v115 = v51;
  *((void *)&v115 + 1) = v109;
  v116 = v62;
  uint64_t v117 = v54;
  swift_unknownObjectRetain();
  v94 = v51;
  uint64_t v64 = sub_1A33294A8();
  if (__OFADD__(v64, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v65 = v60;
  v89[0] = v55;
  v108 = v56;
  uint64_t v121 = v64 + 1;
  uint64_t v66 = v42;
  sub_1A3329468();
  unint64_t v67 = v119;
  uint64_t v68 = v120;
  v69 = v93;
  int v70 = (char *)v93 + *(int *)(v103 + 48);
  long long v71 = *((_OWORD *)v104 + 1);
  _OWORD *v93 = *(_OWORD *)v104;
  v69[1] = v71;
  long long v109 = v118;
  uint64_t v72 = v113;
  ((void (*)(char *, char *, uint64_t))v100)(v70, v102, v113);
  uint64_t v73 = v92;
  uint64_t v74 = v99;
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v99, v70, v72);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v74, 0, 1, v72);
  long long v115 = v109;
  v116 = v67;
  uint64_t v117 = v68;
  v75 = (void *)swift_allocObject();
  v75[2] = v66;
  v75[3] = v72;
  uint64_t v76 = v106;
  v75[4] = v105;
  v75[5] = v76;
  uint64_t v77 = v107;
  v75[6] = v65;
  v75[7] = v77;
  uint64_t v78 = v96;
  v75[8] = v95;
  v75[9] = v78;
  v75[10] = sub_1A32E26B8;
  v75[11] = v58;
  v79 = v98;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v121 = *v79;
  uint64_t v80 = v121;
  uint64_t *v79 = 0x8000000000000000;
  *(void *)&long long v109 = sub_1A32DF594(v112, v66, v65);
  if (__OFADD__(*(void *)(v80 + 16), (v81 & 1) == 0))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A33295D8();
    __break(1u);
    return result;
  }
  char v82 = v81;
  uint64_t v114 = v65;
  swift_getWitnessTable();
  sub_1A33292E8();
  sub_1A3329518();
  char v83 = sub_1A33294F8();
  uint64_t v84 = v121;
  if (v83)
  {
    *(void *)&long long v109 = sub_1A32DF594(v112, v66, v65);
    if ((v82 & 1) != (v85 & 1)) {
      goto LABEL_14;
    }
  }
  uint64_t *v98 = v84;
  swift_bridgeObjectRelease();
  if (v82)
  {
    swift_bridgeObjectRetain();
    uint64_t v86 = v112;
  }
  else
  {
    uint64_t v87 = swift_bridgeObjectRetain();
    uint64_t v121 = ((uint64_t (*)(uint64_t))v75[10])(v87);
    uint64_t v86 = v112;
    ((void (*)(char *, uint64_t, uint64_t))v89[0])(v90, v112, v66);
    sub_1A3329508();
  }
  swift_bridgeObjectRelease();
  sub_1A3329318();
  swift_unknownObjectRelease();
  v88 = *(void (**)(uint64_t, uint64_t))(v111 + 8);
  v88(v86, v66);
  v88((uint64_t)v110, v66);
  swift_release();
  return swift_release();
}

uint64_t sub_1A32DB344()
{
  return sub_1A33292B8();
}

uint64_t sub_1A32DB3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = a1;
  uint64_t v39 = a6;
  uint64_t v40 = a8;
  uint64_t v35 = a10;
  uint64_t v37 = a9;
  uint64_t v38 = a5;
  v42[0] = a3;
  v42[1] = a4;
  uint64_t v32 = a4;
  uint64_t v33 = a7;
  v42[2] = a5;
  v42[3] = a6;
  v42[4] = a7;
  v42[5] = a8;
  v42[6] = a9;
  v42[7] = a10;
  uint64_t v36 = type metadata accessor for StandardTrieNode(255, (uint64_t)v42);
  uint64_t v13 = sub_1A3329498();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v34 = (char *)&v31 - v14;
  sub_1A33294B8();
  v42[9] = a7;
  swift_getWitnessTable();
  sub_1A33292E8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v16 = TupleTypeMetadata2 - 8;
  uint64_t v17 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v31 - v20;
  uint64_t v22 = *(int *)(v16 + 56);
  uint64_t v23 = *(void *)(a3 - 8);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v24((char *)&v31 - v20, a2, a3);
  uint64_t v25 = a2;
  uint64_t v26 = *(void *)(a2 + v22);
  *(void *)&v21[v22] = v26;
  uint64_t v27 = *(int *)(v16 + 56);
  v24(v19, v25, a3);
  *(void *)&v19[v27] = v26;
  uint64_t v28 = swift_bridgeObjectRetain();
  uint64_t v29 = v34;
  sub_1A32D9050(v28, a3, v32, v38, v39, v33, v40, v37, v35);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v19, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v29, 0, 1, v36);
  sub_1A33292E8();
  return sub_1A3329318();
}

uint64_t sub_1A32DB6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v47 = a6;
  uint64_t v48 = a8;
  uint64_t v51 = a7;
  uint64_t v46 = a5;
  uint64_t v50 = a3;
  uint64_t v12 = *(void *)(a4 - 8);
  uint64_t v58 = a2;
  uint64_t v59 = v12;
  uint64_t v52 = a10;
  MEMORY[0x1F4188790](a1);
  uint64_t v45 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A3329498();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v53 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v18 = (char *)&v45 - v17;
  uint64_t v19 = *(void *)(v14 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v16);
  uint64_t v56 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v45 - v23;
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v45 - v25;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v49 = a1;
  v27((char *)&v45 - v25, a1, v14);
  v27(v24, v58, v14);
  uint64_t v54 = TupleTypeMetadata2;
  uint64_t v28 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
  v27(v18, (uint64_t)v26, v14);
  uint64_t v57 = v28;
  v27(v28, (uint64_t)v24, v14);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 48);
  uint64_t v55 = a4;
  if (v29(v18, 1, a4) != 1)
  {
    v27(v56, (uint64_t)v18, v14);
    uint64_t v31 = v55;
    int v33 = v29(v57, 1, v55);
    uint64_t v34 = v59;
    uint64_t v35 = (void (**)(char *, uint64_t))(v59 + 8);
    if (v33 != 1)
    {
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
      uint64_t v54 = v59 + 8;
      uint64_t v39 = v45;
      v38(v45, v57, v31);
      uint64_t v32 = v52;
      LODWORD(v59) = sub_1A3329348();
      uint64_t v40 = *(void (**)(char *, uint64_t))(v34 + 8);
      v40(v39, v31);
      uint64_t v41 = *(void (**)(char *, uint64_t))(v19 + 8);
      v41(v24, v14);
      v41(v26, v14);
      v40(v56, v31);
      v41(v18, v14);
      if ((v59 & 1) == 0) {
        return 0;
      }
      goto LABEL_10;
    }
    uint64_t v36 = *(void (**)(char *, uint64_t))(v19 + 8);
    v36(v24, v14);
    v36(v26, v14);
    (*v35)(v56, v31);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v53 + 8))(v18, v54);
    return 0;
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v19 + 8);
  v30(v24, v14);
  v30(v26, v14);
  uint64_t v31 = v55;
  if (v29(v57, 1, v55) != 1) {
    goto LABEL_6;
  }
  v30(v18, v14);
  uint64_t v32 = v52;
LABEL_10:
  v60[0] = v50;
  v60[1] = v31;
  v60[2] = v46;
  v60[3] = v47;
  v60[4] = v51;
  v60[5] = v48;
  v60[6] = a9;
  v60[7] = v32;
  uint64_t v42 = *(int *)(type metadata accessor for StandardTrieNode(0, (uint64_t)v60) + 84);
  uint64_t v43 = *(void *)(v58 + v42);
  if (*(void *)(v49 + v42))
  {
    if (v43)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      char v44 = sub_1A33292F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v44) {
        return 1;
      }
    }
  }
  else if (!v43)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_1A32DBC14(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v16 = v4;
  uint64_t v23 = v15;
  long long v18 = *(_OWORD *)(a2 + 24);
  long long v24 = v18;
  uint64_t v25 = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  long long v17 = *(_OWORD *)(a2 + 64);
  long long v14 = v5;
  long long v26 = v5;
  long long v27 = v17;
  type metadata accessor for StandardTrieNode.CodingKeys(255, (uint64_t)&v23);
  swift_getWitnessTable();
  uint64_t v6 = sub_1A33295B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = v19;
  sub_1A3329638();
  LOBYTE(v23) = 0;
  uint64_t v11 = v20;
  sub_1A3329598();
  if (!v11)
  {
    uint64_t v23 = *(void *)(v10 + *(int *)(a2 + 84));
    char v28 = 1;
    sub_1A33292E8();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v21 = v16;
    uint64_t v22 = WitnessTable;
    swift_getWitnessTable();
    sub_1A3329598();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A32DBE60@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v46 = a8;
  uint64_t v45 = a5;
  uint64_t v34 = a9;
  uint64_t v44 = a10;
  uint64_t v36 = sub_1A3329498();
  uint64_t v35 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v42 = (char *)&v33 - v18;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  uint64_t v54 = a6;
  uint64_t v55 = a7;
  uint64_t v56 = a8;
  uint64_t v57 = a10;
  type metadata accessor for StandardTrieNode.CodingKeys(255, (uint64_t)&v50);
  swift_getWitnessTable();
  uint64_t v43 = sub_1A3329578();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v20 = (char *)&v33 - v19;
  uint64_t v37 = a2;
  uint64_t v38 = a4;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v39 = a6;
  uint64_t v40 = a3;
  uint64_t v52 = a4;
  uint64_t v53 = v45;
  uint64_t v54 = a6;
  uint64_t v55 = a7;
  uint64_t v45 = a7;
  uint64_t v56 = v46;
  uint64_t v57 = v44;
  uint64_t v21 = type metadata accessor for StandardTrieNode(0, (uint64_t)&v50);
  uint64_t v44 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v33 - v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v46 = v20;
  uint64_t v24 = (uint64_t)v47;
  sub_1A3329628();
  if (v24) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v47 = a1;
  uint64_t v25 = v38;
  uint64_t v26 = v35;
  uint64_t v27 = v36;
  LOBYTE(v50) = 0;
  sub_1A3329548();
  char v28 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v45 = v23;
  v28(v23, v42, v27);
  sub_1A33292E8();
  char v58 = 1;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v48 = v25;
  uint64_t v49 = WitnessTable;
  swift_getWitnessTable();
  sub_1A3329548();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v46, v43);
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  *(void *)&v45[*(int *)(v21 + 84)] = v50;
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v34, v31, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v21);
}

uint64_t sub_1A32DC2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  uint64_t v60 = a8;
  uint64_t v61 = a9;
  uint64_t v62 = a10;
  uint64_t v16 = type metadata accessor for StringTrieNode(0, (uint64_t)&v59);
  uint64_t v52 = *(void *)(v16 - 8);
  uint64_t v53 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v44 = (char *)&v42 - v17;
  uint64_t v59 = a3;
  uint64_t v60 = a4;
  uint64_t v61 = a5;
  uint64_t v62 = a6;
  uint64_t v63 = a7;
  uint64_t v64 = a8;
  uint64_t v65 = a9;
  uint64_t v66 = a10;
  uint64_t v51 = type metadata accessor for StandardTrieNode(0, (uint64_t)&v59);
  uint64_t v18 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v43 = (char *)&v42 - v19;
  uint64_t v45 = a3;
  uint64_t v59 = a3;
  uint64_t v60 = a4;
  uint64_t v55 = a4;
  uint64_t v56 = a8;
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v61 = a5;
  uint64_t v62 = a6;
  uint64_t v48 = a7;
  uint64_t v63 = a7;
  uint64_t v64 = a8;
  uint64_t v50 = a9;
  uint64_t v65 = a9;
  uint64_t v66 = a10;
  uint64_t v54 = a10;
  uint64_t v20 = type metadata accessor for Trie.RootNode(0, (uint64_t)&v59);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v42 - v25;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v49 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v30 = (char *)&v42 - v29;
  uint64_t v31 = (char *)&v42 + *(int *)(v28 + 48) - v29;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v32((char *)&v42 - v29, v57, v20);
  v32(v31, v58, v20);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v32(v26, (uint64_t)v30, v20);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v38 = (uint64_t)v43;
      uint64_t v39 = v51;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v43, v31, v51);
      char v36 = sub_1A32DB6B0((uint64_t)v26, v38, v45, v55, v46, v47, v48, v56, v50, v54);
      uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      v40(v38, v39);
      v40((uint64_t)v26, v39);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v26, v51);
    goto LABEL_7;
  }
  v32(v24, (uint64_t)v30, v20);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v53);
LABEL_7:
    char v36 = 0;
    uint64_t v21 = v49;
    uint64_t v20 = TupleTypeMetadata2;
    goto LABEL_9;
  }
  uint64_t v34 = v52;
  uint64_t v33 = v53;
  uint64_t v35 = (uint64_t)v44;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v44, v31, v53);
  char v36 = sub_1A32D9A0C((uint64_t)v24, v35, v55, v56, v50, v54);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v37(v35, v33);
  v37((uint64_t)v24, v33);
LABEL_9:
  (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
  return v36 & 1;
}

uint64_t sub_1A32DC7AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x647261646E617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_1A33295C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A33295C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A32DC898(char a1)
{
  if (a1) {
    return 0x676E69727473;
  }
  else {
    return 0x647261646E617473;
  }
}

uint64_t sub_1A32DC8CC(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701080942 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A33295C8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A32DC944(void *a1, void *a2)
{
  uint64_t v3 = a2[2];
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  uint64_t v73 = a2[5];
  uint64_t v6 = a2[7];
  uint64_t v62 = a2[6];
  uint64_t v63 = a1;
  uint64_t v8 = a2[8];
  uint64_t v7 = a2[9];
  uint64_t v65 = v3;
  uint64_t v66 = v4;
  uint64_t v9 = v3;
  uint64_t v67 = v5;
  uint64_t v68 = v73;
  uint64_t v10 = v5;
  uint64_t v60 = v5;
  uint64_t v69 = v62;
  uint64_t v70 = v6;
  uint64_t v71 = v8;
  uint64_t v72 = v7;
  uint64_t v11 = type metadata accessor for Trie.RootNode.StringCodingKeys(255, (uint64_t)&v65);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v54 = v11;
  uint64_t v12 = sub_1A33295B8();
  uint64_t v58 = *(void *)(v12 - 8);
  uint64_t v59 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v55 = (char *)&v43 - v13;
  uint64_t v65 = v4;
  uint64_t v66 = v6;
  uint64_t v67 = v8;
  uint64_t v68 = v7;
  uint64_t v14 = type metadata accessor for StringTrieNode(0, (uint64_t)&v65);
  uint64_t v56 = *(void *)(v14 - 8);
  uint64_t v57 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v52 = (char *)&v43 - v15;
  uint64_t v65 = v9;
  uint64_t v66 = v4;
  uint64_t v16 = v9;
  uint64_t v61 = v9;
  uint64_t v67 = v10;
  uint64_t v17 = v73;
  uint64_t v18 = v62;
  uint64_t v68 = v73;
  uint64_t v69 = v62;
  uint64_t v70 = v6;
  uint64_t v71 = v8;
  uint64_t v72 = v7;
  uint64_t v19 = type metadata accessor for Trie.RootNode.StandardCodingKeys(255, (uint64_t)&v65);
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v46 = v19;
  uint64_t v45 = v20;
  uint64_t v51 = sub_1A33295B8();
  uint64_t v50 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v49 = (char *)&v43 - v21;
  uint64_t v65 = v16;
  uint64_t v66 = v4;
  uint64_t v22 = v60;
  uint64_t v67 = v60;
  uint64_t v68 = v17;
  uint64_t v69 = v18;
  uint64_t v70 = v6;
  uint64_t v23 = v18;
  uint64_t v71 = v8;
  uint64_t v72 = v7;
  uint64_t v48 = type metadata accessor for StandardTrieNode(0, (uint64_t)&v65);
  uint64_t v47 = *(void *)(v48 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v48);
  uint64_t v44 = (char *)&v43 - v25;
  uint64_t v26 = *(a2 - 1);
  MEMORY[0x1F4188790](v24);
  uint64_t v28 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = v61;
  uint64_t v66 = v4;
  uint64_t v67 = v22;
  uint64_t v68 = v73;
  uint64_t v69 = v23;
  uint64_t v70 = v6;
  uint64_t v71 = v8;
  uint64_t v72 = v7;
  type metadata accessor for Trie.RootNode.CodingKeys(255, (uint64_t)&v65);
  swift_getWitnessTable();
  uint64_t v29 = sub_1A33295B8();
  uint64_t v73 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v31 = (char *)&v43 - v30;
  __swift_project_boxed_opaque_existential_1(v63, v63[3]);
  sub_1A3329638();
  (*(void (**)(char *, uint64_t, void *))(v26 + 16))(v28, v64, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v33 = v56;
    uint64_t v32 = v57;
    uint64_t v34 = v52;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v52, v28, v57);
    LOBYTE(v65) = 1;
    uint64_t v35 = v55;
    sub_1A3329588();
    swift_getWitnessTable();
    uint64_t v36 = v59;
    sub_1A33295A8();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
  }
  else
  {
    uint64_t v37 = v47;
    uint64_t v38 = v44;
    uint64_t v39 = v48;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v44, v28, v48);
    LOBYTE(v65) = 0;
    uint64_t v40 = v49;
    sub_1A3329588();
    swift_getWitnessTable();
    uint64_t v41 = v51;
    sub_1A33295A8();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v31, v29);
}

uint64_t sub_1A32DCFE8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  v102 = a1;
  uint64_t v70 = a9;
  *(void *)&long long v96 = a2;
  *((void *)&v96 + 1) = a3;
  *(void *)&long long v97 = a4;
  *((void *)&v97 + 1) = a5;
  uint64_t v98 = a6;
  uint64_t v99 = a7;
  uint64_t v100 = a8;
  uint64_t v101 = a10;
  uint64_t v84 = type metadata accessor for Trie.RootNode.StringCodingKeys(255, (uint64_t)&v96);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v76 = sub_1A3329578();
  uint64_t v78 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  char v85 = (char *)&v66 - v17;
  *(void *)&long long v96 = a2;
  *((void *)&v96 + 1) = a3;
  *(void *)&long long v97 = a4;
  *((void *)&v97 + 1) = a5;
  uint64_t v98 = a6;
  uint64_t v99 = a7;
  uint64_t v100 = a8;
  uint64_t v101 = a10;
  uint64_t v93 = a8;
  uint64_t v18 = type metadata accessor for Trie.RootNode.StandardCodingKeys(255, (uint64_t)&v96);
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v81 = v18;
  uint64_t v80 = v19;
  uint64_t v72 = sub_1A3329578();
  uint64_t v77 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  char v82 = (char *)&v66 - v20;
  *(void *)&long long v96 = a2;
  *((void *)&v96 + 1) = a3;
  *(void *)&long long v97 = a4;
  *((void *)&v97 + 1) = a5;
  uint64_t v98 = a6;
  uint64_t v99 = a7;
  uint64_t v100 = a8;
  uint64_t v101 = a10;
  type metadata accessor for Trie.RootNode.CodingKeys(255, (uint64_t)&v96);
  uint64_t v91 = swift_getWitnessTable();
  uint64_t v21 = sub_1A3329578();
  uint64_t v87 = *(void *)(v21 - 8);
  uint64_t v88 = v21;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v66 - v22;
  uint64_t v73 = a2;
  *(void *)&long long v96 = a2;
  *((void *)&v96 + 1) = a3;
  uint64_t v89 = a3;
  *(void *)&long long v74 = a4;
  *(void *)&long long v97 = a4;
  *((void *)&v97 + 1) = a5;
  *((void *)&v74 + 1) = a5;
  uint64_t v75 = a6;
  uint64_t v98 = a6;
  uint64_t v99 = a7;
  uint64_t v90 = a7;
  uint64_t v100 = v93;
  uint64_t v101 = a10;
  uint64_t v79 = a10;
  uint64_t v86 = type metadata accessor for Trie.RootNode(0, (uint64_t)&v96);
  uint64_t v71 = *(void *)(v86 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v86);
  uint64_t v26 = (char *)&v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x1F4188790](v24);
  uint64_t v29 = (char *)&v66 - v28;
  MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)&v66 - v30;
  uint64_t v32 = v102;
  __swift_project_boxed_opaque_existential_1(v102, v102[3]);
  uint64_t v33 = v92;
  sub_1A3329628();
  if (v33) {
    goto LABEL_9;
  }
  uint64_t v68 = v29;
  uint64_t v69 = v26;
  uint64_t v67 = v31;
  uint64_t v35 = v89;
  uint64_t v34 = v90;
  uint64_t v91 = 0;
  uint64_t v92 = v23;
  uint64_t v36 = v88;
  *(void *)&long long v96 = sub_1A3329568();
  sub_1A3329388();
  swift_getWitnessTable();
  *(void *)&long long v94 = sub_1A33294C8();
  *((void *)&v94 + 1) = v37;
  *(void *)&long long v95 = v38;
  *((void *)&v95 + 1) = v39;
  sub_1A33294B8();
  swift_getWitnessTable();
  sub_1A3329448();
  char v40 = v96;
  if (v96 != 2)
  {
    long long v66 = v94;
    long long v96 = v94;
    long long v97 = v95;
    if (sub_1A3329478())
    {
      if (v40)
      {
        LOBYTE(v96) = 1;
        uint64_t v54 = v85;
        uint64_t v55 = v91;
        uint64_t v56 = v92;
        sub_1A3329528();
        if (v55)
        {
          swift_unknownObjectRelease();
          uint64_t v44 = *(void (**)(char *, uint64_t))(v87 + 8);
          uint64_t v45 = v56;
          goto LABEL_13;
        }
        *(void *)&long long v96 = v35;
        *((void *)&v96 + 1) = v34;
        *(void *)&long long v97 = v93;
        *((void *)&v97 + 1) = v79;
        type metadata accessor for StringTrieNode(0, (uint64_t)&v96);
        swift_getWitnessTable();
        uint64_t v60 = v69;
        uint64_t v61 = v76;
        sub_1A3329558();
        uint64_t v62 = v87;
        (*(void (**)(char *, uint64_t))(v78 + 8))(v54, v61);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v62 + 8))(v56, v36);
        uint64_t v63 = v86;
        swift_storeEnumTagMultiPayload();
        uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
        uint64_t v65 = v67;
        v64(v67, v60, v63);
      }
      else
      {
        LOBYTE(v96) = 0;
        uint64_t v41 = v82;
        uint64_t v42 = v91;
        uint64_t v43 = v92;
        sub_1A3329528();
        if (v42)
        {
          swift_unknownObjectRelease();
          uint64_t v44 = *(void (**)(char *, uint64_t))(v87 + 8);
          uint64_t v45 = v43;
LABEL_13:
          uint64_t v51 = v36;
          goto LABEL_8;
        }
        *(void *)&long long v96 = v73;
        *((void *)&v96 + 1) = v35;
        long long v97 = v74;
        uint64_t v98 = v75;
        uint64_t v99 = v34;
        uint64_t v100 = v93;
        uint64_t v101 = v79;
        type metadata accessor for StandardTrieNode(0, (uint64_t)&v96);
        swift_getWitnessTable();
        uint64_t v57 = v68;
        uint64_t v58 = v72;
        sub_1A3329558();
        uint64_t v59 = v87;
        (*(void (**)(char *, uint64_t))(v77 + 8))(v41, v58);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v43, v36);
        uint64_t v63 = v86;
        swift_storeEnumTagMultiPayload();
        uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
        uint64_t v65 = v67;
        v64(v67, v57, v63);
      }
      v64(v70, v65, v63);
      uint64_t v52 = v102;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    }
  }
  uint64_t v46 = sub_1A33294E8();
  swift_allocError();
  uint64_t v47 = v36;
  uint64_t v49 = v48;
  __swift_instantiateConcreteTypeFromMangledName(qword_1E95AA8C8);
  uint64_t *v49 = v86;
  uint64_t v50 = v92;
  sub_1A3329538();
  sub_1A33294D8();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v46 - 8) + 104))(v49, *MEMORY[0x1E4FBBA70], v46);
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v87 + 8);
  uint64_t v45 = v50;
  uint64_t v51 = v47;
LABEL_8:
  v44(v45, v51);
  uint64_t v32 = v102;
LABEL_9:
  uint64_t v52 = v32;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
}

uint64_t sub_1A32DD968(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_1A32DDB18(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void))sub_1A32D9F74);
}

uint64_t sub_1A32DD984(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1A32DDBB8(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_1A32D9F84);
}

uint64_t sub_1A32DD99C(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1A32DDC14(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void, void, void, void))sub_1A32D9F84);
}

uint64_t sub_1A32DD9B4(void *a1, uint64_t a2)
{
  return sub_1A32DDC94(a1, a2, (uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_1A32DA0EC);
}

uint64_t sub_1A32DD9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_1A32DDCF0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1A32D9FAC, a4);
}

uint64_t sub_1A32DD9E4@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_1A32DDD58(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_1A32E2594, a2);
}

uint64_t sub_1A32DD9FC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DDA50(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A32DDAA4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A32DF48C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_1A32DBE60);
}

uint64_t sub_1A32DDAD0(void *a1, uint64_t a2)
{
  return sub_1A32DBC14(a1, a2);
}

uint64_t sub_1A32DDAE8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return sub_1A32DF508(a1, a2, a3, a4, sub_1A32DB6B0);
}

uint64_t sub_1A32DDB00(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_1A32DDB18(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void))sub_1A32E2BC0);
}

uint64_t sub_1A32DDB18(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void, void, void, void))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]) & 1;
}

uint64_t sub_1A32DDB64()
{
  return sub_1A32DA0A4();
}

uint64_t sub_1A32DDBA0(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1A32DDBB8(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_1A32E2BB4);
}

uint64_t sub_1A32DDBB8(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void, void, void, void, void))
{
  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
}

uint64_t sub_1A32DDBFC(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1A32DDC14(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void, void, void, void))sub_1A32E2BB4);
}

uint64_t sub_1A32DDC14(uint64_t a1, void *a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void, void, void, void, void, void, void))
{
  sub_1A33295F8();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
  return sub_1A3329618();
}

uint64_t sub_1A32DDC7C(void *a1, uint64_t a2)
{
  return sub_1A32DDC94(a1, a2, (uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_1A32DC898);
}

uint64_t sub_1A32DDC94(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

uint64_t sub_1A32DDCD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_1A32DDCF0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1A32DC7AC, a4);
}

uint64_t sub_1A32DDCF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]);
  *a5 = result;
  return result;
}

uint64_t sub_1A32DDD40@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_1A32DDD58(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_1A32E2BD4, a2);
}

uint64_t sub_1A32DDD58@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  *a3 = result;
  return result;
}

uint64_t sub_1A32DDD9C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DDDF0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A32DDE44()
{
  return 1;
}

uint64_t sub_1A32DDE54()
{
  return 1701080942;
}

uint64_t sub_1A32DDE68@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_1A32DEE34(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_1A32E2BD8, a2);
}

uint64_t sub_1A32DDE80(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DDED4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A32DDF28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A32DC8CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A32DDF74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DDFC8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A32DE01C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A32DF48C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_1A32DCFE8);
}

uint64_t sub_1A32DE048(void *a1, void *a2)
{
  return sub_1A32DC944(a1, a2);
}

uint64_t sub_1A32DE060(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return sub_1A32DF508(a1, a2, a3, a4, sub_1A32DC2D0);
}

uint64_t Trie.init(dictionary:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  v19[10] = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA838);
  swift_getTupleTypeMetadata2();
  sub_1A3329378();
  sub_1A32DF818();
  v19[9] = sub_1A33292B8();
  sub_1A33292E8();
  sub_1A33292E8();
  swift_getWitnessTable();
  sub_1A3329368();
  swift_bridgeObjectRelease();
  sub_1A32D85A8(v19[0], a3, a7, a8, a10, a9);
  v19[0] = a2;
  v19[1] = a3;
  void v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a10;
  type metadata accessor for Trie.RootNode(0, (uint64_t)v19);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A32DE234(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a1;
  uint64_t v6 = sub_1A3329498();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v28 = (char *)&v27 - v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = TupleTypeMetadata2 - 8;
  uint64_t v10 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (uint64_t *)((char *)&v27 - v13);
  uint64_t v15 = *(int *)(v9 + 56);
  uint64_t v29 = (char *)&v27 + v15 - v13;
  uint64_t v16 = (char *)a2 + v15;
  uint64_t v18 = *a2;
  uint64_t v17 = a2[1];
  *uint64_t v14 = v18;
  v14[1] = v17;
  uint64_t v19 = *(void *)(a4 - 8);
  uint64_t v20 = *(void (**)(void))(v19 + 16);
  v20();
  uint64_t v21 = sub_1A3329358();
  uint64_t v22 = *(void *)(v21 + 16);
  uint64_t v27 = v21 + 32;
  uint64_t v23 = (2 * v22) | 1;
  uint64_t v24 = &v12[*(int *)(v9 + 56)];
  ((void (*)(char *, char *, uint64_t))v20)(v24, v16, a4);
  uint64_t v25 = v28;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v28, v24, a4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, a4);
  uint64_t v31 = v21;
  uint64_t v32 = v27;
  uint64_t v33 = 0;
  uint64_t v34 = v23;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA838);
  sub_1A32DF818();
  sub_1A33292E8();
  sub_1A3329318();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v29, a4);
}

uint64_t Trie.init(dictionary:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, void *a6@<X5>, void *a7@<X6>, void *a8@<X7>, uint64_t a9@<X8>, void *a10)
{
  uint64_t v19[12] = a1;
  sub_1A33294B8();
  swift_getTupleTypeMetadata2();
  sub_1A3329378();
  v19[11] = a6;
  swift_getWitnessTable();
  v19[10] = (void *)sub_1A33292B8();
  sub_1A3329388();
  v19[8] = a6;
  swift_getWitnessTable();
  sub_1A33292E8();
  sub_1A33292E8();
  swift_getWitnessTable();
  sub_1A3329368();
  swift_bridgeObjectRelease();
  sub_1A32D9050(v19[0], (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, (uint64_t)a10);
  v19[0] = a2;
  v19[1] = a3;
  void v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a10;
  type metadata accessor for Trie.RootNode(0, (uint64_t)v19);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A32DE6C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v31 = a1;
  uint64_t v29 = a3;
  uint64_t v30 = a7;
  uint64_t v9 = sub_1A3329498();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v27 = (char *)&v26 - v10;
  sub_1A3329388();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v12 = TupleTypeMetadata2 - 8;
  uint64_t v13 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  *(void *)&long long v26 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = *(int *)(v12 + 56);
  uint64_t v28 = (char *)&v26 + v16 - v15;
  uint64_t v17 = (char *)a2 + v16;
  uint64_t v18 = *a2;
  *(void *)((char *)&v26 - v15) = *a2;
  uint64_t v19 = *(void *)(a4 - 8);
  uint64_t v20 = *(void (**)(void))(v19 + 16);
  v20();
  *(void *)&long long v32 = v18;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_1A3329338();
  swift_bridgeObjectRelease();
  uint64_t v21 = v36;
  uint64_t v22 = v37;
  uint64_t v23 = v26 + *(int *)(v12 + 56);
  long long v26 = v35;
  ((void (*)(uint64_t, char *, uint64_t))v20)(v23, v17, a4);
  uint64_t v24 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v27, v23, a4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v24, 0, 1, a4);
  long long v32 = v26;
  uint64_t v33 = v21;
  uint64_t v34 = v22;
  sub_1A33294B8();
  uint64_t v38 = v30;
  swift_getWitnessTable();
  sub_1A33292E8();
  sub_1A3329318();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v28, a4);
}

uint64_t Trie.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v24 = a3;
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v8 = a2[6];
  uint64_t v7 = a2[7];
  uint64_t v10 = a2[8];
  uint64_t v9 = a2[9];
  uint64_t v26 = a2[2];
  uint64_t v3 = v26;
  uint64_t v27 = v4;
  uint64_t v28 = v5;
  uint64_t v29 = v6;
  uint64_t v30 = v8;
  uint64_t v31 = v7;
  uint64_t v32 = v10;
  uint64_t v33 = v9;
  uint64_t v11 = type metadata accessor for StandardTrieNode(0, (uint64_t)&v26);
  uint64_t v21 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  uint64_t v28 = v5;
  uint64_t v29 = v6;
  uint64_t v30 = v8;
  uint64_t v31 = v7;
  uint64_t v32 = v10;
  uint64_t v33 = v9;
  uint64_t v14 = type metadata accessor for Trie.RootNode(0, (uint64_t)&v26);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v20 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v20 - v16, v23, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v24, 1, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {
    uint64_t v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v13, v17, v11);
    uint64_t v25 = v22;
    sub_1A3329388();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    sub_1A3329338();
    swift_bridgeObjectRelease();
    sub_1A32D95B8(v26, v27, v28, v29, v11, v24);
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v13, v11);
  }
}

uint64_t static Trie.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1A32DC2D0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1A32DEC84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65646F4E746F6F72 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A33295C8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A32DED0C()
{
  return sub_1A3329618();
}

uint64_t sub_1A32DED50()
{
  return sub_1A3329608();
}

uint64_t sub_1A32DED78()
{
  return sub_1A3329618();
}

uint64_t sub_1A32DEDB8()
{
  return 0x65646F4E746F6F72;
}

uint64_t sub_1A32DEDD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A32DEC84(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A32DEE1C@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_1A32DEE34(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_1A32DDE44, a2);
}

uint64_t sub_1A32DEE34@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A32DEE7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A32DEED0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t Trie.encode(to:)(void *a1, void *a2)
{
  uint64_t v4 = a2[2];
  uint64_t v3 = a2[3];
  uint64_t v5 = a2[5];
  uint64_t v18 = a2[4];
  uint64_t v19 = v3;
  uint64_t v6 = a2[7];
  uint64_t v16 = a2[6];
  uint64_t v17 = v5;
  uint64_t v7 = a2[9];
  uint64_t v14 = a2[8];
  uint64_t v15 = v6;
  uint64_t v13 = v7;
  uint64_t v20 = v4;
  uint64_t v21 = v3;
  uint64_t v22 = v18;
  uint64_t v23 = v5;
  uint64_t v24 = v16;
  uint64_t v25 = v6;
  uint64_t v26 = v14;
  uint64_t v27 = v7;
  type metadata accessor for Trie.CodingKeys(255, (uint64_t)&v20);
  swift_getWitnessTable();
  uint64_t v8 = sub_1A33295B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A3329638();
  uint64_t v20 = v4;
  uint64_t v21 = v19;
  uint64_t v22 = v18;
  uint64_t v23 = v17;
  uint64_t v24 = v16;
  uint64_t v25 = v15;
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  type metadata accessor for Trie.RootNode(0, (uint64_t)&v20);
  swift_getWitnessTable();
  sub_1A33295A8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t Trie.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char v40 = a1;
  uint64_t v41 = a2;
  uint64_t v32 = a9;
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v47 = a8;
  uint64_t v38 = a8;
  uint64_t v48 = a10;
  uint64_t v17 = type metadata accessor for Trie.RootNode(0, (uint64_t)&v41);
  uint64_t v34 = *(void *)(v17 - 8);
  uint64_t v35 = v17;
  MEMORY[0x1F4188790](v17);
  uint64_t v36 = (char *)&v31 - v18;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v47 = a8;
  uint64_t v48 = a10;
  type metadata accessor for Trie.CodingKeys(255, (uint64_t)&v41);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v37 = sub_1A3329578();
  uint64_t v33 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790](v37);
  uint64_t v20 = (char *)&v31 - v19;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v21 = v40;
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v47 = v38;
  uint64_t v48 = a10;
  uint64_t v22 = type metadata accessor for Trie(0, (uint64_t)&v41);
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)&v31 - v24;
  __swift_project_boxed_opaque_existential_1(v21, v21[3]);
  uint64_t v38 = v20;
  uint64_t v26 = v49;
  sub_1A3329628();
  if (!v26)
  {
    uint64_t WitnessTable = v22;
    uint64_t v49 = v23;
    uint64_t v27 = v33;
    uint64_t v28 = v34;
    uint64_t v29 = v35;
    swift_getWitnessTable();
    sub_1A3329558();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v38, v37);
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v36, v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v32, v25, WitnessTable);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_1A32DF460(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A32DF48C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))Trie.init(from:));
}

uint64_t sub_1A32DF48C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, void, void, void, void, void, void, void))
{
  return a5(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
}

uint64_t sub_1A32DF4D8(void *a1, void *a2)
{
  return Trie.encode(to:)(a1, a2);
}

uint64_t sub_1A32DF4F0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return sub_1A32DF508(a1, a2, a3, a4, static Trie.== infix(_:_:));
}

uint64_t sub_1A32DF508(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))
{
  return a5(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]) & 1;
}

unint64_t sub_1A32DF54C(unsigned __int8 a1)
{
  uint64_t v3 = MEMORY[0x1A62441B0](*(void *)(v1 + 40), a1, 1);

  return sub_1A32DF5F0(a1, v3);
}

unint64_t sub_1A32DF594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A3329328();

  return sub_1A32DF690(a1, v6, a2, a3);
}

unint64_t sub_1A32DF5F0(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1A32DF690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v21[1] = a1;
  v21[2] = a4;
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v4;
  uint64_t v9 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v10 & ~v9;
  v21[0] = v4 + 64;
  if ((*(void *)(v4 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v12 = ~v9;
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v14 = v15;
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v13 - 8);
    do
    {
      uint64_t v18 = v13;
      v14(v8, *(void *)(v22 + 48) + v16 * v11, a3);
      char v19 = sub_1A3329348();
      (*v17)(v8, a3);
      if (v19) {
        break;
      }
      unint64_t v11 = (v11 + 1) & v12;
      uint64_t v13 = v18;
    }
    while (((*(void *)(v21[0] + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  return v11;
}

unint64_t sub_1A32DF818()
{
  unint64_t result = qword_1E95AA840[0];
  if (!qword_1E95AA840[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E95AA838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E95AA840);
  }
  return result;
}

uint64_t sub_1A32DF884(uint64_t a1, uint64_t a2)
{
  return sub_1A32E266C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1A32DE234);
}

uint64_t type metadata accessor for Trie.RootNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie.RootNode);
}

uint64_t sub_1A32DF8C8(uint64_t a1, uint64_t a2)
{
  return sub_1A32E266C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1A32DE6C8);
}

uint64_t type metadata accessor for StandardTrieNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for StandardTrieNode);
}

uint64_t type metadata accessor for Trie.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie.CodingKeys);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for Trie(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1A32DF9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 72);
}

uint64_t sub_1A32DF9D8(_OWORD *a1)
{
  long long v1 = a1[2];
  v5[0] = a1[1];
  v5[1] = v1;
  long long v2 = a1[4];
  v5[2] = a1[3];
  v5[3] = v2;
  uint64_t result = type metadata accessor for Trie.RootNode(319, (uint64_t)v5);
  if (v4 <= 0x3F)
  {
    *(void *)&v5[0] = *(void *)(result - 8) + 64;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A32DFA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 64);
}

uint64_t sub_1A32DFAB0()
{
  return 0;
}

uint64_t sub_1A32DFABC()
{
  uint64_t result = sub_1A3329498();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A32DFB54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  int v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A32DFCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }

  return swift_bridgeObjectRelease();
}

void *sub_1A32DFD9C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  *(void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A32DFEC4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  *(void *)(((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1A32E0078(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    size_t v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  *(void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A32E019C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  *(void *)(((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A32E0348(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  if (!v5) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A32E04D8);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_27:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFE)
  {
    unint64_t v19 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v19 >= 0xFFFFFFFF) {
      LODWORD(v19) = -1;
    }
    if ((v19 + 1) >= 2) {
      return v19;
    }
    else {
      return 0;
    }
  }
  else
  {
    unsigned int v18 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v18 >= 2) {
      return v18 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_1A32E04EC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 24) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  size_t v11 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  if (!v8) {
    ++v11;
  }
  size_t v12 = ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v13 = a3 - v10;
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v6 = v15;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v10;
    }
    else {
      int v16 = 1;
    }
    if (((v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v17 = ~v10 + a2;
      bzero(a1, v12);
      *(_DWORD *)a1 = v17;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v16;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v12] = v16;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x1A32E0780);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if (v9 < 0x7FFFFFFE)
        {
          uint64_t v21 = (void *)((unint64_t)&a1[v11 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            void *v21 = 0;
            *(_DWORD *)uint64_t v21 = a2 - 0x7FFFFFFF;
          }
          else
          {
            void *v21 = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v22 = *(void (**)(void))(v7 + 56);
          v22();
        }
        else
        {
          if (v11 <= 3) {
            int v18 = ~(-1 << (8 * v11));
          }
          else {
            int v18 = -1;
          }
          if (v11)
          {
            int v19 = v18 & (~v9 + a2);
            if (v11 <= 3) {
              int v20 = v11;
            }
            else {
              int v20 = 4;
            }
            bzero(a1, v11);
            switch(v20)
            {
              case 2:
                *(_WORD *)a1 = v19;
                break;
              case 3:
                *(_WORD *)a1 = v19;
                a1[2] = BYTE2(v19);
                break;
              case 4:
                *(_DWORD *)a1 = v19;
                break;
              default:
                *a1 = v19;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_1A32E07B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 16);
  long long v7 = *(_OWORD *)(a1 + 24);
  long long v9 = v7;
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v11 = v1;
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  uint64_t result = type metadata accessor for StandardTrieNode(319, (uint64_t)&v8);
  if (v5 <= 0x3F)
  {
    uint64_t v14 = *(void *)(result - 8) + 64;
    uint64_t v8 = v7;
    *(void *)&long long v9 = v1;
    *((void *)&v9 + 1) = v2;
    *(void *)&long long v10 = v3;
    uint64_t result = type metadata accessor for StringTrieNode(319, (uint64_t)&v8);
    if (v6 <= 0x3F)
    {
      uint64_t v15 = *(void *)(result - 8) + 64;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1A32E08C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  int v9 = *(_DWORD *)(v6 + 80);
  if ((v9 & 0x1000F8) != 0 || v8 + 9 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((unsigned __int16)((v9 & 0xF8) + 23) & (unsigned __int16)~(v9 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unint64_t v12 = v8 + 8;
    unsigned int v13 = *((unsigned __int8 *)a2 + v8 + 8);
    if (((v8 + 8) & 0xFFFFFFF8) != 0 && v13 >= 2) {
      unsigned int v13 = *(_DWORD *)a2 + 2;
    }
    int v15 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5);
    if (v13 == 1)
    {
      if (v15)
      {
        memcpy(a1, a2, v7);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      *((unsigned char *)a1 + v12) = 1;
    }
    else
    {
      if (v15)
      {
        memcpy(a1, a2, v7);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      *((unsigned char *)a1 + v12) = 0;
    }
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A32E0AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }

  return swift_bridgeObjectRelease();
}

void *sub_1A32E0BDC(void *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unsigned int v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0) {
    unsigned int v9 = *a2 + 2;
  }
  int v11 = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5);
  if (v9 == 1)
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    char v12 = 1;
  }
  else
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    char v12 = 0;
    *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  *((unsigned char *)a1 + v8) = v12;
  swift_bridgeObjectRetain();
  return a1;
}

_DWORD *sub_1A32E0DC4(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = v6;
    if (*(_DWORD *)(v6 + 84)) {
      size_t v8 = *(void *)(v6 + 64);
    }
    else {
      size_t v8 = *(void *)(v6 + 64) + 1;
    }
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    long long v10 = *(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48);
    if (!v10(a1, 1, v5)) {
      (*(void (**)(_DWORD *, uint64_t))(v7 + 8))(a1, v5);
    }
    swift_bridgeObjectRelease();
    unsigned int v11 = *((unsigned __int8 *)a2 + v9);
    if ((v9 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *a2 + 2;
    }
    unsigned int v13 = v10(a2, 1, v5);
    if (v11 == 1)
    {
      if (v13)
      {
        memcpy(a1, a2, v8);
        char v14 = 1;
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v7 + 16))(a1, a2, v5);
        char v14 = 1;
        (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v5);
      }
    }
    else
    {
      if (v13)
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v7 + 16))(a1, a2, v5);
        (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v5);
      }
      char v14 = 0;
    }
    *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    *((unsigned char *)a1 + v9) = v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *sub_1A32E1000(void *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unsigned int v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0) {
    unsigned int v9 = *a2 + 2;
  }
  int v11 = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5);
  if (v9 == 1)
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
      char v12 = 1;
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v12 = 1;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
  }
  else
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    char v12 = 0;
  }
  *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  *((unsigned char *)a1 + v8) = v12;
  return a1;
}

_DWORD *sub_1A32E11C8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = v6;
    if (*(_DWORD *)(v6 + 84)) {
      size_t v8 = *(void *)(v6 + 64);
    }
    else {
      size_t v8 = *(void *)(v6 + 64) + 1;
    }
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    long long v10 = *(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48);
    if (!v10(a1, 1, v5)) {
      (*(void (**)(_DWORD *, uint64_t))(v7 + 8))(a1, v5);
    }
    swift_bridgeObjectRelease();
    unsigned int v11 = *((unsigned __int8 *)a2 + v9);
    if ((v9 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *a2 + 2;
    }
    unsigned int v13 = v10(a2, 1, v5);
    if (v11 == 1)
    {
      if (v13)
      {
        memcpy(a1, a2, v8);
        char v14 = 1;
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v7 + 32))(a1, a2, v5);
        char v14 = 1;
        (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v5);
      }
    }
    else
    {
      if (v13)
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v7 + 32))(a1, a2, v5);
        (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v5);
      }
      char v14 = 0;
    }
    *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    *((unsigned char *)a1 + v9) = v14;
  }
  return a1;
}

uint64_t sub_1A32E1400(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 24) - 8);
  if (*(_DWORD *)(v3 + 84)) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v4 = *(void *)(v3 + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v5 = (v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (a2 < 0xFF) {
    goto LABEL_21;
  }
  unint64_t v6 = v5 + 9;
  char v7 = 8 * (v5 + 9);
  if ((v5 + 9) <= 3)
  {
    unsigned int v8 = (a2 + 1) >> v7;
    if (v8 > 0xFFFE)
    {
      int v9 = *(_DWORD *)&a1[v6];
      if (!v9) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
    if (v8 > 0xFE)
    {
      int v9 = *(unsigned __int16 *)&a1[v6];
      if (!*(_WORD *)&a1[v6]) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
    if (!v8) {
      goto LABEL_21;
    }
  }
  int v9 = a1[v6];
  if (!a1[v6])
  {
LABEL_21:
    unsigned int v13 = a1[v5 + 8];
    if (v13 >= 2) {
      return (v13 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
LABEL_14:
  int v11 = (v9 - 1) << v7;
  if (v6 >= 4) {
    int v11 = 0;
  }
  if (v6 == 1) {
    int v12 = *a1;
  }
  else {
    int v12 = *(_DWORD *)a1;
  }
  return (v12 | v11) + 255;
}

void sub_1A32E1500(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v6 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v6 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v7 = (v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  size_t v8 = v7 + 9;
  if (a3 < 0xFF)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v13 = (a3 + 1) >> (8 * v8);
    if (v13 > 0xFFFE)
    {
      int v9 = 4;
    }
    else if (v13 >= 0xFF)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v13 != 0;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 <= 0xFE)
  {
    unint64_t v10 = v7 + 8;
    switch(v9)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_22;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_21;
      case 3:
        goto LABEL_33;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_22;
      default:
LABEL_21:
        if (a2) {
LABEL_22:
        }
          a1[v10] = -(char)a2;
        break;
    }
    return;
  }
  unsigned int v11 = a2 - 255;
  if (v8 < 4)
  {
    int v12 = (v11 >> (8 * v8)) + 1;
    bzero(a1, v8);
    if (v8 == 1)
    {
      *a1 = v11;
      goto LABEL_28;
    }
    unsigned int v11 = v11;
  }
  else
  {
    bzero(a1, v7 + 9);
    int v12 = 1;
  }
  *(_DWORD *)a1 = v11;
LABEL_28:
  switch(v9)
  {
    case 1:
      a1[v8] = v12;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v12;
      break;
    case 3:
LABEL_33:
      __break(1u);
      JUMPOUT(0x1A32E16C8);
    case 4:
      *(_DWORD *)&a1[v8] = v12;
      break;
    default:
      return;
  }
}

uint64_t sub_1A32E16F0(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 24) - 8);
  if (*(_DWORD *)(v2 + 84)) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  else {
    uint64_t v3 = *(void *)(v2 + 64) + 1;
  }
  unint64_t v4 = ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v5 = *((unsigned __int8 *)a1 + v4);
  uint64_t v6 = v4 & 0xFFFFFFF8;
  if (v5 >= 2 && v6 != 0) {
    return (*a1 + 2);
  }
  return v5;
}

void sub_1A32E1770(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  if (*(_DWORD *)(v4 + 84)) {
    uint64_t v5 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v5 = *(void *)(v4 + 64) + 1;
  }
  size_t v6 = ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (a2 > 1)
  {
    if ((v6 & 0xFFFFFFF8) != 0) {
      char v7 = 2;
    }
    else {
      char v7 = a2;
    }
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v8 = a2 - 2;
    }
    else {
      unsigned int v8 = 0;
    }
    a1[v6] = v7;
    bzero(a1, v6);
    *(_DWORD *)a1 = v8;
  }
  else
  {
    a1[v6] = a2;
  }
}

uint64_t type metadata accessor for StringTrieNode(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for StringTrieNode);
}

uint64_t sub_1A32E183C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1A32E1844()
{
  uint64_t result = sub_1A3329498();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A32E18DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  int v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A32E1A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }

  return swift_bridgeObjectRelease();
}

void *sub_1A32E1B24(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    unsigned int v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  *(void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A32E1C4C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  *(void *)(((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1A32E1E00(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    size_t v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  *(void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A32E1F24(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  *(void *)(((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A32E20D0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A32E2260);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_27:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFE)
  {
    unint64_t v19 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v19 >= 0xFFFFFFFF) {
      LODWORD(v19) = -1;
    }
    if ((v19 + 1) >= 2) {
      return v19;
    }
    else {
      return 0;
    }
  }
  else
  {
    unsigned int v18 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v18 >= 2) {
      return v18 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_1A32E2274(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  size_t v11 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v11;
  }
  size_t v12 = ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v13 = a3 - v10;
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v6 = v15;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v10;
    }
    else {
      int v16 = 1;
    }
    if (((v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v17 = ~v10 + a2;
      bzero(a1, v12);
      *(_DWORD *)a1 = v17;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v16;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v12] = v16;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x1A32E2508);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if (v9 < 0x7FFFFFFE)
        {
          uint64_t v21 = (void *)((unint64_t)&a1[v11 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            void *v21 = 0;
            *(_DWORD *)uint64_t v21 = a2 - 0x7FFFFFFF;
          }
          else
          {
            void *v21 = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v22 = *(void (**)(void))(v7 + 56);
          v22();
        }
        else
        {
          if (v11 <= 3) {
            int v18 = ~(-1 << (8 * v11));
          }
          else {
            int v18 = -1;
          }
          if (v11)
          {
            int v19 = v18 & (~v9 + a2);
            if (v11 <= 3) {
              int v20 = v11;
            }
            else {
              int v20 = 4;
            }
            bzero(a1, v11);
            switch(v20)
            {
              case 2:
                *(_WORD *)a1 = v19;
                break;
              case 3:
                *(_WORD *)a1 = v19;
                a1[2] = BYTE2(v19);
                break;
              case 4:
                *(_DWORD *)a1 = v19;
                break;
              default:
                *a1 = v19;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_1A32E2540()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E255C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2578()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2594()
{
  return 2;
}

uint64_t type metadata accessor for Trie.RootNode.StringCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie.RootNode.StringCodingKeys);
}

uint64_t type metadata accessor for Trie.RootNode.StandardCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie.RootNode.StandardCodingKeys);
}

uint64_t type metadata accessor for Trie.RootNode.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for Trie.RootNode.CodingKeys);
}

uint64_t type metadata accessor for StandardTrieNode.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for StandardTrieNode.CodingKeys);
}

uint64_t type metadata accessor for StringTrieNode.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for StringTrieNode.CodingKeys);
}

uint64_t sub_1A32E2614(uint64_t a1, uint64_t a2)
{
  return sub_1A32E266C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1A32DAA54);
}

uint64_t sub_1A32E2640(uint64_t a1, uint64_t a2)
{
  return sub_1A32E266C(a1, a2, sub_1A32DB3E8);
}

uint64_t sub_1A32E266C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void, void, void, void))
{
  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9]);
}

uint64_t sub_1A32E26A8()
{
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1A32E26B8()
{
  return sub_1A32DB344();
}

uint64_t sub_1A32E26CC()
{
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1A32E26DC(uint64_t *a1, void *a2)
{
  return sub_1A32D89D8(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1A32E26FC(uint64_t a1, char *a2)
{
  return sub_1A32D8EBC(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_1A32E271C()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1A32E272C()
{
  return sub_1A32D8E38();
}

uint64_t sub_1A32E2738()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1A32E2748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_1A32E2764(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1A32E276C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_1A32E2778(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_1A32E2808(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1A32E28D4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1A32E28FC(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *sub_1A32E294C(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A32E29E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A32E2A10()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2A2C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2A48()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2A64()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2A80()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2A9C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2AB8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2AD4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2AF0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B0C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B28()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B44()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B60()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B7C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2B98()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A32E2BB4()
{
  return sub_1A32D9F84();
}

BOOL sub_1A32E2BC0(int a1, int a2)
{
  return sub_1A32D9F74(a1, a2);
}

id corruptionError(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_new();
  unsigned int v6 = v5;
  if (v3)
  {
    BOOL v7 = (void *)[[NSString alloc] initWithFormat:@"The lazy plist archive is corrupt: %@", v3];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  else
  {
    [v5 setObject:@"The lazy plist archive is corrupt." forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  unsigned int v9 = (void *)[v6 copy];
  unsigned int v10 = (void *)[v8 initWithDomain:@"_PASLazyPlistErrorDomain" code:4 userInfo:v9];

  return v10;
}

void cfDeallocateReleaseInfo(int a1, CFTypeRef cf)
{
}

uint64_t cfAllocateAlwaysFailing()
{
  return 0;
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

id notPLPlistError(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_new();
  unsigned int v6 = v5;
  if (v3)
  {
    BOOL v7 = (void *)[[NSString alloc] initWithFormat:@"The file is not a lazy plist archive: %@", v3];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  else
  {
    [v5 setObject:@"The file is not a lazy plist archive." forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  unsigned int v9 = (void *)[v6 copy];
  unsigned int v10 = (void *)[v8 initWithDomain:@"_PASLazyPlistErrorDomain" code:2 userInfo:v9];

  return v10;
}

uint64_t cfAllocateAlwaysFailing_126()
{
  return 0;
}

void _PASEnumerateSimpleLinesInString(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  unsigned int v6 = a2;
  if ([v5 length])
  {
    BOOL v7 = (__CFString *)v5;
    id v8 = self;

    if (!v8) {
      goto LABEL_35;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v35 = 0u;
    CFIndex Length = CFStringGetLength(v7);
    CFStringRef theString = v7;
    uint64_t v45 = 0;
    CFIndex v46 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    uint64_t v43 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    int64_t v47 = 0;
    int64_t v48 = 0;
    uint64_t v44 = CStringPtr;
    if (Length > 0)
    {
      uint64_t v31 = v7;
      id v32 = v5;
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      unint64_t v14 = 0;
      int64_t v15 = 0;
      uint64_t v33 = v6;
      uint64_t v16 = 64;
      do
      {
        if ((unint64_t)v15 >= 4) {
          uint64_t v17 = 4;
        }
        else {
          uint64_t v17 = v15;
        }
        CFIndex v18 = v46;
        if (v46 <= v15)
        {
          ++v14;
        }
        else
        {
          if (v43)
          {
            UniChar v19 = v43[v15 + v45];
          }
          else if (v44)
          {
            UniChar v19 = v44[v45 + v15];
          }
          else
          {
            int64_t v20 = v47;
            if (v48 <= v15 || v47 > v15)
            {
              uint64_t v22 = v17 + v12;
              uint64_t v23 = v16 - v17;
              int64_t v24 = v15 - v17;
              CFIndex v25 = v24 + 64;
              if (v24 + 64 >= v46) {
                CFIndex v25 = v46;
              }
              int64_t v47 = v24;
              int64_t v48 = v25;
              if (v46 >= v23) {
                CFIndex v18 = v23;
              }
              v49.length = v18 + v22;
              v49.location = v24 + v45;
              CFStringGetCharacters(theString, v49, buffer);
              int64_t v20 = v47;
            }
            UniChar v19 = buffer[v15 - v20];
          }
          ++v14;
          if (v19 == 10)
          {
            if ((a3 & 1) != 0 || v14 - v13 >= 2)
            {
              uint64_t v26 = a3;
              uint64_t v27 = MEMORY[0x1A62450A0]();
              int v28 = v33[2](v33, v13, v14 - v13);
              uint64_t v29 = (void *)v27;
              a3 = v26;
              unint64_t v13 = v14;
              if (!v28)
              {
                BOOL v7 = v31;
                id v5 = v32;
                unsigned int v6 = v33;
                goto LABEL_35;
              }
            }
            else
            {
              unint64_t v13 = v14;
            }
          }
        }
        ++v15;
        --v12;
        ++v16;
      }
      while (Length != v15);

      id v5 = v32;
      unsigned int v6 = v33;
      if (v14 > v13)
      {
        uint64_t v30 = (void *)MEMORY[0x1A62450A0]();
        v33[2](v33, v13, v14 - v13);
        unsigned int v6 = v33;
      }
    }
    else
    {
LABEL_35:
    }
  }
}

void _PASEnumerateSimpleLinesInUTF8Data(void *a1, void *a2, char a3)
{
  id v18 = a1;
  id v5 = a2;
  if (![v18 length]) {
    goto LABEL_14;
  }
  id v6 = v18;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (!v8) {
    goto LABEL_14;
  }
  unint64_t v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = v11 + 1;
    if (*(unsigned char *)(v7 + v11) != 10)
    {
      unint64_t v13 = v10;
LABEL_10:
      unint64_t v10 = v13;
      goto LABEL_11;
    }
    unint64_t v13 = v11 + 1;
    unint64_t v14 = v11 - v10 + 1;
    if ((a3 & 1) == 0 && v14 < 2) {
      goto LABEL_10;
    }
    int64_t v15 = (void *)MEMORY[0x1A62450A0]();
    int v16 = v5[2](v5, v10, v14);
    if (v16) {
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v11 = v12;
  }
  while (v9 != v12);
  if (v9 > v10)
  {
    uint64_t v17 = (void *)MEMORY[0x1A62450A0]();
    v5[2](v5, v10, v9 - v10);
  }
LABEL_14:
}

id _PASBytesToHex(char *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a2;
    id v3 = a1;
    size_t v4 = (2 * a2) | 1;
    memptr = 0;
    uint64_t v20 = 0;
    if (v4 > 0x400)
    {
      int v16 = malloc_type_posix_memalign(&memptr, 8uLL, v4, 0x20F40F3CuLL);
      LOBYTE(v20) = 0;
      if (v16)
      {
        id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v17);
      }
      id v5 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](a1);
      id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
      memptr = v5;
      LOBYTE(v20) = 1;
    }
    uint64_t v6 = 2 * v2;
    uint64_t v7 = v20;
    if (v2)
    {
      uint64_t v8 = v5 + 1;
      do
      {
        if (*v3 >= 0xA0u) {
          char v9 = 87;
        }
        else {
          char v9 = 48;
        }
        *(v8 - 1) = v9 + (*v3 >> 4);
        char v10 = *v3++;
        unsigned int v11 = v10 & 0xF;
        if (v11 >= 0xA) {
          char v12 = 87;
        }
        else {
          char v12 = 48;
        }
        unsigned char *v8 = v12 + v11;
        v8 += 2;
        --v2;
      }
      while (v2);
    }
    v5[v6] = 0;
    unint64_t v13 = (void *)MEMORY[0x1A62450A0]();
    unint64_t v14 = objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v5, v7, v4, 1, 1, 0);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

unsigned char *_PASHexToBytes(unsigned char *result, unint64_t a2, size_t *a3)
{
  if (result)
  {
    size_t v4 = result;
    size_t v5 = a2 >> 1;
    if (a3) {
      *a3 = v5;
    }
    uint64_t result = malloc_type_malloc(v5, 0x2212EFC4uLL);
    if (!result)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v16);
    }
    if (a2)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v4 + 1;
      do
      {
        int v8 = (char)*(v7 - 1);
        if (v8 >= 58) {
          char v9 = 9;
        }
        else {
          char v9 = 0;
        }
        char v10 = v9 + v8;
        unsigned int v12 = *v7;
        v7 += 2;
        char v11 = v12;
        int v13 = (char)v12;
        if (v12 >= 0x47) {
          char v14 = -87;
        }
        else {
          char v14 = -55;
        }
        if (v13 >= 58) {
          char v15 = v14;
        }
        else {
          char v15 = -48;
        }
        result[v6++] = v15 + v11 + 16 * v10;
      }
      while (((a2 - 1) >> 1) + 1 != v6);
    }
  }
  return result;
}

uint64_t _PASIsAllDigits(void *a1)
{
  unint64_t v1 = a1;
  uint64_t v2 = self;

  if (!v2) {
    goto LABEL_26;
  }
  memset(v20, 0, sizeof(v20));
  CFIndex Length = CFStringGetLength(v1);
  CFStringRef theString = v1;
  uint64_t v24 = 0;
  CFIndex v25 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  uint64_t v22 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v23 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 64;
    while (1)
    {
      uint64_t v10 = (unint64_t)v8 >= 4 ? 4 : v8;
      CFIndex v11 = v25;
      if (v25 <= v8) {
        break;
      }
      if (v22)
      {
        UniChar v12 = v22[v8 + v24];
      }
      else if (v23)
      {
        UniChar v12 = v23[v24 + v8];
      }
      else
      {
        if (v27 <= v8 || v7 > v8)
        {
          uint64_t v14 = v10 + v6;
          uint64_t v15 = v9 - v10;
          uint64_t v16 = v8 - v10;
          CFIndex v17 = v16 + 64;
          if (v16 + 64 >= v25) {
            CFIndex v17 = v25;
          }
          uint64_t v26 = v16;
          uint64_t v27 = v17;
          if (v25 >= v15) {
            CFIndex v11 = v15;
          }
          v28.length = v11 + v14;
          v28.location = v16 + v24;
          CFStringGetCharacters(theString, v28, (UniChar *)v20);
          uint64_t v7 = v26;
        }
        UniChar v12 = *((_WORD *)v20 + v8 - v7);
      }
      if ((unsigned __int16)(v12 - 48) >= 0xAu) {
        break;
      }
      ++v8;
      --v6;
      ++v9;
      if (Length == v8) {
        goto LABEL_26;
      }
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_26:
    uint64_t v18 = 1;
  }

  return v18;
}

uint64_t _PASIsAllUppercase(void *a1)
{
  id v1 = a1;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  id v3 = (__CFString *)v1;
  size_t v4 = self;

  if (!v4) {
    goto LABEL_28;
  }
  memset(v22, 0, sizeof(v22));
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v26 = 0;
  CFIndex v27 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  uint64_t v24 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  CFIndex v25 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 64;
    while (1)
    {
      uint64_t v11 = (unint64_t)v9 >= 4 ? 4 : v9;
      CFIndex v12 = v27;
      if (v27 <= v9)
      {
        UniChar v13 = 0;
      }
      else if (v24)
      {
        UniChar v13 = v24[v9 + v26];
      }
      else if (v25)
      {
        UniChar v13 = v25[v26 + v9];
      }
      else
      {
        uint64_t v14 = v28;
        if (v29 <= v9 || v28 > v9)
        {
          uint64_t v16 = v11 + v8;
          uint64_t v17 = v10 - v11;
          uint64_t v18 = v9 - v11;
          CFIndex v19 = v18 + 64;
          if (v18 + 64 >= v27) {
            CFIndex v19 = v27;
          }
          uint64_t v28 = v18;
          uint64_t v29 = v19;
          if (v27 >= v17) {
            CFIndex v12 = v17;
          }
          v30.length = v12 + v16;
          v30.location = v18 + v26;
          CFStringGetCharacters(theString, v30, (UniChar *)v22);
          uint64_t v14 = v28;
        }
        UniChar v13 = *((_WORD *)v22 + v9 - v14);
      }
      if (CFCharacterSetIsCharacterMember(Predefined, v13)) {
        break;
      }
      ++v9;
      --v8;
      ++v10;
      if (Length == v9) {
        goto LABEL_28;
      }
    }
    uint64_t v20 = 0;
  }
  else
  {
LABEL_28:
    uint64_t v20 = 1;
  }

  return v20;
}

uint64_t _PASLooksLikeNumber(void *a1)
{
  id v1 = a1;
  uint64_t v2 = self;

  if (v2)
  {
    memset(v20, 0, sizeof(v20));
    CFIndex Length = CFStringGetLength(v1);
    CFStringRef theString = v1;
    uint64_t v24 = 0;
    CFIndex v25 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v1);
    CStringPtr = 0;
    uint64_t v22 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
    }
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v23 = CStringPtr;
    if (Length < 1)
    {
      char v9 = 0;
LABEL_30:
      uint64_t v2 = v9 & 1;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      char v9 = 0;
      uint64_t v10 = 64;
      while (1)
      {
        uint64_t v11 = (unint64_t)v8 >= 4 ? 4 : v8;
        CFIndex v12 = v25;
        if (v25 <= v8) {
          break;
        }
        if (v22)
        {
          UniChar v13 = v22[v8 + v24];
        }
        else if (v23)
        {
          UniChar v13 = v23[v24 + v8];
        }
        else
        {
          if (v27 <= v8 || v7 > v8)
          {
            uint64_t v15 = v11 + v6;
            uint64_t v16 = v10 - v11;
            uint64_t v17 = v8 - v11;
            CFIndex v18 = v17 + 64;
            if (v17 + 64 >= v25) {
              CFIndex v18 = v25;
            }
            uint64_t v26 = v17;
            uint64_t v27 = v18;
            if (v25 >= v16) {
              CFIndex v12 = v16;
            }
            v28.length = v12 + v15;
            v28.location = v17 + v24;
            CFStringGetCharacters(theString, v28, (UniChar *)v20);
            uint64_t v7 = v26;
          }
          UniChar v13 = *((_WORD *)v20 + v8 - v7);
        }
        if (v13 - 48 >= 0xA)
        {
          if (v13 - 44 > 2) {
            break;
          }
        }
        else
        {
          char v9 = 1;
        }
        ++v8;
        --v6;
        ++v10;
        if (Length == v8) {
          goto LABEL_30;
        }
      }
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t _PASInsensitiveStringContainsString(void *a1, void *a2)
{
  if (!a1 || !a2) {
    return 0;
  }
  id v3 = a2;
  size_t v4 = _PASNormalizeUnicodeString(a1, 1);
  size_t v5 = _PASNormalizeUnicodeString(v3, 1);

  uint64_t v6 = [v4 containsString:v5];
  return v6;
}

id _PASNormalizeUnicodeString(void *a1, int a2)
{
  id v3 = a1;
  size_t v4 = fastNormalizeUnicodeString(v3);
  size_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _PASSimpleICUTransform(@"[^…] NFKD; Latin-ASCII; [[:Nonspacing Mark:]&[:Zinh:]] Remove; NFC; Lower", v3, a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

__CFString *fastNormalizeUnicodeString(void *a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (CFStringGetFastestEncoding(v1) == 1536)
  {
    uint64_t v2 = MEMORY[0x1A62450A0]();
    id v3 = [(__CFString *)v1 lowercaseString];
    size_t v4 = (void *)v2;
LABEL_3:
    goto LABEL_39;
  }
  uint64_t v5 = [(__CFString *)v1 length];
  id v6 = v1;
  uint64_t v7 = self;

  if (!v7) {
    goto LABEL_37;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  long long buffer = 0u;
  CFIndex Length = CFStringGetLength(v6);
  uint64_t v68 = v6;
  uint64_t v71 = 0;
  CFIndex v72 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  uint64_t v69 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  }
  int64_t v73 = 0;
  int64_t v74 = 0;
  uint64_t v70 = CStringPtr;
  if (Length > 0)
  {
    uint64_t v11 = 0;
    int64_t v12 = 0;
    char v13 = 0;
    int64_t v14 = 0;
    uint64_t v15 = 64;
    do
    {
      if ((unint64_t)v14 >= 4) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = v14;
      }
      CFIndex v17 = v72;
      if (v72 > v14)
      {
        if (v69)
        {
          UniChar v18 = v69[v14 + v71];
        }
        else if (v70)
        {
          UniChar v18 = v70[v71 + v14];
        }
        else
        {
          if (v74 <= v14 || v12 > v14)
          {
            uint64_t v20 = v16 + v11;
            uint64_t v21 = v15 - v16;
            int64_t v22 = v14 - v16;
            CFIndex v23 = v22 + 64;
            if (v22 + 64 >= v72) {
              CFIndex v23 = v72;
            }
            int64_t v73 = v22;
            int64_t v74 = v23;
            if (v72 >= v21) {
              CFIndex v17 = v21;
            }
            v77.length = v17 + v20;
            v77.location = v22 + v71;
            CFStringGetCharacters(v68, v77, (UniChar *)&buffer);
            int64_t v12 = v73;
          }
          UniChar v18 = *((_WORD *)&buffer + v14 - v12);
        }
        if (v18 >= 0x100u && (unsigned __int16)(v18 - 0x2000) > 0x6Fu)
        {

          id v3 = 0;
          goto LABEL_39;
        }
        switch(v18)
        {
          case 0x41u:
          case 0x42u:
          case 0x43u:
          case 0x44u:
          case 0x45u:
          case 0x46u:
          case 0x47u:
          case 0x48u:
          case 0x49u:
          case 0x4Au:
          case 0x4Bu:
          case 0x4Cu:
          case 0x4Du:
          case 0x4Eu:
          case 0x4Fu:
          case 0x50u:
          case 0x51u:
          case 0x52u:
          case 0x53u:
          case 0x54u:
          case 0x55u:
          case 0x56u:
          case 0x57u:
          case 0x58u:
          case 0x59u:
          case 0x5Au:
          case 0xA0u:
          case 0xA1u:
          case 0xA8u:
          case 0xAAu:
          case 0xADu:
          case 0xAFu:
          case 0xB2u:
          case 0xB3u:
          case 0xB4u:
          case 0xB5u:
          case 0xB8u:
          case 0xB9u:
          case 0xBAu:
          case 0xBFu:
          case 0xC0u:
          case 0xC1u:
          case 0xC2u:
          case 0xC3u:
          case 0xC4u:
          case 0xC5u:
          case 0xC7u:
          case 0xC8u:
          case 0xC9u:
          case 0xCAu:
          case 0xCBu:
          case 0xCCu:
          case 0xCDu:
          case 0xCEu:
          case 0xCFu:
          case 0xD0u:
          case 0xD1u:
          case 0xD2u:
          case 0xD3u:
          case 0xD4u:
          case 0xD5u:
          case 0xD6u:
          case 0xD7u:
          case 0xD8u:
          case 0xD9u:
          case 0xDAu:
          case 0xDBu:
          case 0xDCu:
          case 0xDDu:
          case 0xE0u:
          case 0xE1u:
          case 0xE2u:
          case 0xE3u:
          case 0xE4u:
          case 0xE5u:
          case 0xE7u:
          case 0xE8u:
          case 0xE9u:
          case 0xEAu:
          case 0xEBu:
          case 0xECu:
          case 0xEDu:
          case 0xEEu:
          case 0xEFu:
          case 0xF0u:
          case 0xF1u:
          case 0xF2u:
          case 0xF3u:
          case 0xF4u:
          case 0xF5u:
          case 0xF6u:
          case 0xF7u:
          case 0xF8u:
          case 0xF9u:
          case 0xFAu:
          case 0xFBu:
          case 0xFCu:
          case 0xFDu:
          case 0xFFu:
            goto LABEL_33;
          case 0x5Bu:
          case 0x5Cu:
          case 0x5Du:
          case 0x5Eu:
          case 0x5Fu:
          case 0x60u:
          case 0x61u:
          case 0x62u:
          case 0x63u:
          case 0x64u:
          case 0x65u:
          case 0x66u:
          case 0x67u:
          case 0x68u:
          case 0x69u:
          case 0x6Au:
          case 0x6Bu:
          case 0x6Cu:
          case 0x6Du:
          case 0x6Eu:
          case 0x6Fu:
          case 0x70u:
          case 0x71u:
          case 0x72u:
          case 0x73u:
          case 0x74u:
          case 0x75u:
          case 0x76u:
          case 0x77u:
          case 0x78u:
          case 0x79u:
          case 0x7Au:
          case 0x7Bu:
          case 0x7Cu:
          case 0x7Du:
          case 0x7Eu:
          case 0x7Fu:
          case 0x80u:
          case 0x81u:
          case 0x82u:
          case 0x83u:
          case 0x84u:
          case 0x85u:
          case 0x86u:
          case 0x87u:
          case 0x88u:
          case 0x89u:
          case 0x8Au:
          case 0x8Bu:
          case 0x8Cu:
          case 0x8Du:
          case 0x8Eu:
          case 0x8Fu:
          case 0x90u:
          case 0x91u:
          case 0x92u:
          case 0x93u:
          case 0x94u:
          case 0x95u:
          case 0x96u:
          case 0x97u:
          case 0x98u:
          case 0x99u:
          case 0x9Au:
          case 0x9Bu:
          case 0x9Cu:
          case 0x9Du:
          case 0x9Eu:
          case 0x9Fu:
          case 0xA2u:
          case 0xA3u:
          case 0xA4u:
          case 0xA5u:
          case 0xA6u:
          case 0xA7u:
          case 0xACu:
          case 0xB0u:
          case 0xB6u:
          case 0xB7u:
            break;
          case 0xA9u:
          case 0xAEu:
          case 0xB1u:
          case 0xBCu:
          case 0xBDu:
          case 0xBEu:
LABEL_32:
            v5 += 2;
            goto LABEL_33;
          case 0xABu:
          case 0xBBu:
          case 0xC6u:
          case 0xDEu:
          case 0xDFu:
          case 0xE6u:
          case 0xFEu:
LABEL_31:
            ++v5;
LABEL_33:
            char v13 = 1;
            break;
          default:
            switch(v18)
            {
              case 0x2000u:
              case 0x2001u:
              case 0x2002u:
              case 0x2003u:
              case 0x2004u:
              case 0x2005u:
              case 0x2006u:
              case 0x2007u:
              case 0x2008u:
              case 0x2009u:
              case 0x200Au:
              case 0x2010u:
              case 0x2011u:
              case 0x2012u:
              case 0x2013u:
              case 0x2014u:
              case 0x2015u:
              case 0x2017u:
              case 0x2018u:
              case 0x2019u:
              case 0x201Au:
              case 0x201Bu:
              case 0x201Cu:
              case 0x201Du:
              case 0x201Fu:
              case 0x2024u:
              case 0x202Fu:
              case 0x2032u:
              case 0x2039u:
              case 0x203Au:
              case 0x203Eu:
              case 0x2044u:
              case 0x2045u:
              case 0x2046u:
              case 0x204Eu:
              case 0x205Fu:
                goto LABEL_33;
              case 0x2016u:
              case 0x201Eu:
              case 0x2025u:
              case 0x2033u:
              case 0x2036u:
              case 0x203Cu:
              case 0x2047u:
              case 0x2048u:
              case 0x2049u:
                goto LABEL_31;
              case 0x2034u:
              case 0x2037u:
                goto LABEL_32;
              case 0x2057u:
                v5 += 3;
                goto LABEL_33;
              default:
                goto LABEL_34;
            }
        }
      }
LABEL_34:
      ++v14;
      --v11;
      ++v15;
    }
    while (Length != v14);

    if (v13)
    {
      uint64_t v26 = 2 * v5;
      long long buffer = 0uLL;
      if (((2 * v5) | 1uLL) > 0x400)
      {
        int v56 = malloc_type_posix_memalign((void **)&buffer, 8uLL, 2 * v5, 0xC77F6B9DuLL);
        BYTE8(buffer) = 0;
        if (v56)
        {
          id v57 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
          objc_exception_throw(v57);
        }
        CFRange v28 = (char *)buffer;
      }
      else
      {
        MEMORY[0x1F4188790](v25);
        CFRange v28 = (char *)&v58 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v28, v27);
        *(void *)&long long buffer = v28;
        BYTE8(buffer) = 1;
      }
      uint64_t v29 = *((void *)&buffer + 1);
      CFRange v30 = v6;
      uint64_t v31 = self;

      if (v31)
      {
        uint64_t v59 = v26;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v61 = 0u;
        long long buffer = 0u;
        CFIndex v32 = CFStringGetLength(v30);
        uint64_t v68 = v30;
        uint64_t v71 = 0;
        CFIndex v72 = v32;
        uint64_t v33 = CFStringGetCharactersPtr(v30);
        uint64_t v34 = 0;
        uint64_t v69 = v33;
        if (!v33) {
          uint64_t v34 = CFStringGetCStringPtr(v30, 0x600u);
        }
        int64_t v73 = 0;
        int64_t v74 = 0;
        uint64_t v70 = v34;
        if (v32 >= 1)
        {
          uint64_t v35 = 0;
          int64_t v36 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = 64;
          do
          {
            if ((unint64_t)v36 >= 4) {
              uint64_t v39 = 4;
            }
            else {
              uint64_t v39 = v36;
            }
            CFIndex v40 = v72;
            if (v72 <= v36)
            {
              __int16 v41 = 0;
LABEL_57:
              uint64_t v42 = 1;
              uint64_t v43 = v37;
              __int16 v44 = v41;
            }
            else
            {
              if (v69)
              {
                __int16 v41 = v69[v36 + v71];
              }
              else if (v70)
              {
                __int16 v41 = v70[v71 + v36];
              }
              else
              {
                int64_t v45 = v73;
                if (v74 <= v36 || v73 > v36)
                {
                  uint64_t v47 = v39 + v35;
                  uint64_t v48 = v38 - v39;
                  int64_t v49 = v36 - v39;
                  CFIndex v50 = v49 + 64;
                  if (v49 + 64 >= v72) {
                    CFIndex v50 = v72;
                  }
                  int64_t v73 = v49;
                  int64_t v74 = v50;
                  if (v72 >= v48) {
                    CFIndex v40 = v48;
                  }
                  v78.length = v40 + v47;
                  v78.location = v49 + v71;
                  CFStringGetCharacters(v68, v78, (UniChar *)&buffer);
                  int64_t v45 = v73;
                }
                __int16 v41 = *((_WORD *)&buffer + v36 - v45);
              }
              __int16 v44 = 97;
              uint64_t v42 = 1;
              uint64_t v43 = v37;
              switch(v41)
              {
                case 65:
                case 170:
                case 192:
                case 193:
                case 194:
                case 195:
                case 196:
                case 197:
                case 224:
                case 225:
                case 226:
                case 227:
                case 228:
                case 229:
                  break;
                case 66:
                  __int16 v44 = 98;
                  goto LABEL_122;
                case 67:
                case 199:
                case 231:
                  __int16 v44 = 99;
                  goto LABEL_122;
                case 68:
                case 208:
                case 240:
                  __int16 v44 = 100;
                  goto LABEL_122;
                case 69:
                case 200:
                case 201:
                case 202:
                case 203:
                case 232:
                case 233:
                case 234:
                case 235:
                  __int16 v44 = 101;
                  goto LABEL_122;
                case 70:
                  __int16 v44 = 102;
                  goto LABEL_122;
                case 71:
                  __int16 v44 = 103;
                  goto LABEL_122;
                case 72:
                  __int16 v44 = 104;
                  goto LABEL_122;
                case 73:
                case 204:
                case 205:
                case 206:
                case 207:
                case 236:
                case 237:
                case 238:
                case 239:
                  __int16 v44 = 105;
                  goto LABEL_122;
                case 74:
                  __int16 v44 = 106;
                  goto LABEL_122;
                case 75:
                  __int16 v44 = 107;
                  goto LABEL_122;
                case 76:
                  __int16 v44 = 108;
                  goto LABEL_122;
                case 77:
                  __int16 v44 = 109;
                  goto LABEL_122;
                case 78:
                case 209:
                case 241:
                  __int16 v44 = 110;
                  goto LABEL_122;
                case 79:
                case 186:
                case 210:
                case 211:
                case 212:
                case 213:
                case 214:
                case 216:
                case 242:
                case 243:
                case 244:
                case 245:
                case 246:
                case 248:
                  __int16 v44 = 111;
                  goto LABEL_122;
                case 80:
                  __int16 v44 = 112;
                  goto LABEL_122;
                case 81:
                  __int16 v44 = 113;
                  goto LABEL_122;
                case 82:
                  __int16 v44 = 114;
                  goto LABEL_122;
                case 83:
                  __int16 v44 = 115;
                  goto LABEL_122;
                case 84:
                  __int16 v44 = 116;
                  goto LABEL_122;
                case 85:
                case 217:
                case 218:
                case 219:
                case 220:
                case 249:
                case 250:
                case 251:
                case 252:
                  __int16 v44 = 117;
                  goto LABEL_122;
                case 86:
                  __int16 v44 = 118;
                  goto LABEL_122;
                case 87:
                  __int16 v44 = 119;
                  goto LABEL_122;
                case 88:
                  __int16 v44 = 120;
                  goto LABEL_122;
                case 89:
                case 221:
                case 253:
                case 255:
                  __int16 v44 = 121;
                  goto LABEL_122;
                case 90:
                  __int16 v44 = 122;
                  goto LABEL_122;
                case 160:
                case 168:
                case 175:
                case 180:
                case 184:
                  __int16 v44 = 32;
                  goto LABEL_122;
                case 161:
                  __int16 v44 = 33;
                  goto LABEL_122;
                case 169:
                  uint64_t v51 = 2 * v37;
                  int v52 = 6488104;
                  goto LABEL_105;
                case 171:
                  uint64_t v43 = v37 + 1;
                  __int16 v44 = 60;
                  goto LABEL_120;
                case 173:
                  __int16 v44 = 45;
                  goto LABEL_122;
                case 174:
                  uint64_t v51 = 2 * v37;
                  int v52 = 7471144;
LABEL_105:
                  *(_DWORD *)&v28[v51] = v52;
                  uint64_t v43 = v37 + 2;
                  __int16 v44 = 41;
                  goto LABEL_119;
                case 177:
                  *(_DWORD *)&v28[2 * v37] = 3080235;
                  uint64_t v43 = v37 + 2;
                  __int16 v44 = 45;
                  goto LABEL_119;
                case 178:
                  __int16 v44 = 50;
                  goto LABEL_122;
                case 179:
                  __int16 v44 = 51;
                  goto LABEL_122;
                case 181:
                  __int16 v44 = 956;
                  goto LABEL_122;
                case 185:
                  __int16 v44 = 49;
                  goto LABEL_122;
                case 187:
                  uint64_t v43 = v37 + 1;
                  __int16 v44 = 62;
                  goto LABEL_120;
                case 188:
                  uint64_t v53 = 2 * v37;
                  unsigned __int16 v54 = 49;
                  goto LABEL_117;
                case 189:
                  *(_DWORD *)&v28[2 * v37] = 3080241;
                  uint64_t v43 = v37 + 2;
                  __int16 v44 = 50;
                  goto LABEL_119;
                case 190:
                  uint64_t v53 = 2 * v37;
                  unsigned __int16 v54 = 51;
LABEL_117:
                  *(_DWORD *)&v28[v53] = v54 | 0x2F0000;
                  uint64_t v43 = v37 + 2;
                  __int16 v44 = 52;
LABEL_119:
                  uint64_t v42 = 3;
                  break;
                case 191:
                  __int16 v44 = 63;
                  goto LABEL_122;
                case 198:
                case 230:
                  uint64_t v43 = v37 + 1;
                  *(_WORD *)&v28[2 * v37] = 97;
                  __int16 v44 = 101;
                  goto LABEL_121;
                case 215:
                  __int16 v44 = 42;
                  goto LABEL_122;
                case 222:
                case 254:
                  uint64_t v43 = v37 + 1;
                  *(_WORD *)&v28[2 * v37] = 116;
                  __int16 v44 = 104;
                  goto LABEL_121;
                case 223:
                  uint64_t v43 = v37 + 1;
                  __int16 v44 = 115;
LABEL_120:
                  *(_WORD *)&v28[2 * v37] = v44;
LABEL_121:
                  uint64_t v42 = 2;
                  break;
                case 247:
                  __int16 v44 = 47;
LABEL_122:
                  uint64_t v42 = 1;
                  uint64_t v43 = v37;
                  break;
                default:
                  goto LABEL_57;
              }
            }
            v37 += v42;
            *(_WORD *)&v28[2 * v43] = v44;
            ++v36;
            --v35;
            ++v38;
          }
          while (v32 != v36);
        }
        uint64_t v26 = v59;
      }

      uint64_t v55 = MEMORY[0x1A62450A0]();
      objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v28, v29, v26, 2483028224, 0, 0);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      size_t v4 = (void *)v55;
      goto LABEL_3;
    }
  }
  else
  {
LABEL_37:
  }
  id v3 = v6;
LABEL_39:

  return v3;
}

id _PASSimpleICUTransform(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  if (!v5 || !v6)
  {
    uint64_t v7 = v6;
    uint64_t v11 = v7;
    goto LABEL_29;
  }
  if ([(__CFString *)v6 _pas_retainsConmingledBackingStore])
  {
    uint64_t v8 = [[NSString alloc] initWithString:v7];

    uint64_t v7 = (__CFString *)v8;
  }
  pthread_mutex_lock((pthread_mutex_t *)&icuLock);
  if (!a3)
  {
    char v9 = 0;
LABEL_10:
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v43 = 0;
    __int16 v44 = (int *)&v43;
    uint64_t v45 = 0x2020000000;
    int v46 = 0;
    int64_t v12 = _getIcuTransformCache();
    if ((unint64_t)[v12 count] >= 0x65) {
      _destroyIcuTransformCache();
    }
    char v13 = [v12 objectForKeyedSubscript:v5];
    int64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 pointerValue];
      v48[3] = v15;
    }
    else
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = ___PASSimpleICUTransform_block_invoke;
      v39[3] = &unk_1E5AEB458;
      UniChar v18 = (__CFString *)v5;
      CFIndex v40 = v18;
      __int16 v41 = &v47;
      uint64_t v42 = &v43;
      _PASMemoryHeavyOperation(v39);
      if (v44[6] > 0)
      {
        CFIndex v19 = v40;
        goto LABEL_23;
      }
      int64_t v22 = [MEMORY[0x1E4F29238] valueWithPointer:v48[3]];
      [v12 setObject:v22 forKeyedSubscript:v18];
    }
    CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v7);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v35 = 0u;
    CFStringRef v23 = MutableCopy;
    uint64_t Length = (int)CFStringGetLength(MutableCopy);
    CFStringRef v33 = MutableCopy;
    uint64_t v36 = Length;
    CharactersPtr = CFStringGetCharactersPtr(MutableCopy);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(MutableCopy, 0x600u);
    }
    *(void *)&long long v35 = CStringPtr;
    uint64_t v37 = 0;
    uint64_t cf = 0;
    v44[6] = 0;
    utrans_trans();
    if (v44[6] >= 1)
    {
      CFRelease(MutableCopy);
      if (!a3) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }
    CFIndex v19 = v7;
    uint64_t v7 = (__CFString *)MutableCopy;
LABEL_23:

    if (!a3)
    {
LABEL_27:
      pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
      uint64_t v7 = v7;

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v47, 8);
      uint64_t v11 = v7;
      goto LABEL_28;
    }
LABEL_24:
    uint64_t v20 = _getIcuTransformResultCache();
    if ((unint64_t)[v20 count] >= 0x19) {
      [v20 removeAllObjects];
    }
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v7, v9, v23, Length, v25, v26, v27, v28, v29, v30, v31, v32, v33, CharactersPtr, v35, v36, v37,
      cf);

    goto LABEL_27;
  }
  char v9 = [[_PASTuple2 alloc] initWithFirst:v5 second:v7];
  uint64_t v10 = _getIcuTransformResultCache();
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11) {
    goto LABEL_10;
  }
  pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
LABEL_28:

LABEL_29:

  return v11;
}

void sub_1A32E70A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _getIcuTransformResultCache()
{
  if (_getIcuTransformResultCache__pasOnceToken14 != -1) {
    dispatch_once(&_getIcuTransformResultCache__pasOnceToken14, &__block_literal_global_45);
  }
  uint64_t v0 = (void *)_getIcuTransformResultCache__pasExprOnceResult;

  return [v0 result];
}

id _getIcuTransformCache()
{
  if (_getIcuTransformCache__pasOnceToken13 != -1) {
    dispatch_once(&_getIcuTransformCache__pasOnceToken13, &__block_literal_global_52);
  }
  uint64_t v0 = (void *)_getIcuTransformCache__pasExprOnceResult;

  return v0;
}

void _destroyIcuTransformCache()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _getIcuTransformCache();
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(v0, "objectEnumerator", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5) pointerValue];
        utrans_close();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }

  [v0 removeAllObjects];
}

const char *__CFStringReplaceableCopy(uint64_t a1, int a2, int a3, int a4)
{
  v11.length = a3 - a2;
  v11.location = a2;
  CFStringRef v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], *(CFStringRef *)a1, v11);
  CFStringInsert(*(CFMutableStringRef *)a1, a4, v6);
  CFRelease(v6);
  CFIndex Length = CFStringGetLength(*(CFStringRef *)a1);
  *(void *)(a1 + 8) = Length;
  CFStringRef v8 = *(const __CFString **)a1;
  *(void *)(a1 + 144) = *(void *)a1;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  uint64_t result = 0;
  *(void *)(a1 + 152) = CharactersPtr;
  if (!CharactersPtr) {
    uint64_t result = CFStringGetCStringPtr(v8, 0x600u);
  }
  *(void *)(a1 + 160) = result;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  return result;
}

void __CFStringReplaceableExtract(void *a1, int a2, int a3, UniChar *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  CFIndex v7 = a3 - a2;
  uint64_t v8 = a1[19];
  if (v8)
  {
    long long v9 = (const void *)(v8 + 2 * a1[21] + 2 * a2);
    memmove(__dst, v9, 2 * v7);
  }
  else
  {
    uint64_t v10 = (char *)(a1 + 2);
    uint64_t v11 = a1[23];
    CFIndex v12 = v11 - v6;
    if (v11 > v6 || (uint64_t v13 = a1[24], v14 = v13 <= v6, v15 = v13 - v6, v14))
    {
      BOOL v17 = __OFSUB__(v7 + v6, v11);
      uint64_t v18 = v7 + v6 - v11;
      if (!((v18 < 0) ^ v17 | (v18 == 0)) && v7 + v6 < a1[24])
      {
        memmove(&__dst[v12], v10, 2 * v18);
        CFIndex v7 = v12;
      }
    }
    else
    {
      if (v7 >= v15) {
        CFIndex v16 = v15;
      }
      else {
        CFIndex v16 = v7;
      }
      memmove(__dst, &v10[2 * (v6 - v11)], 2 * v16);
      v4 += v16;
      v6 += v16;
      v7 -= v16;
    }
    if (v7 >= 1)
    {
      uint64_t v19 = a1[20];
      v20.location = a1[21] + v6;
      if (v19)
      {
        uint64_t v21 = (char *)(v19 + v20.location);
        do
        {
          UniChar v22 = *v21++;
          *v4++ = v22;
          --v7;
        }
        while (v7);
      }
      else
      {
        CFStringRef v23 = (const __CFString *)a1[18];
        v20.length = v7;
        CFStringGetCharacters(v23, v20, v4);
      }
    }
  }
}

const char *__CFStringReplaceableReplace(uint64_t a1, int a2, int a3, UniChar *chars, int a5)
{
  uint64_t v8 = *(__CFString **)(a1 + 200);
  if (v8)
  {
    CFStringSetExternalCharactersNoCopy(v8, chars, a5, a5);
    CFStringRef MutableWithExternalCharactersNoCopy = *(const __CFString **)(a1 + 200);
  }
  else
  {
    CFStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], chars, a5, a5, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    *(void *)(a1 + 200) = MutableWithExternalCharactersNoCopy;
  }
  v14.location = a2;
  v14.length = a3 - a2;
  CFStringReplace(*(CFMutableStringRef *)a1, v14, MutableWithExternalCharactersNoCopy);
  CFIndex Length = CFStringGetLength(*(CFStringRef *)a1);
  *(void *)(a1 + 8) = Length;
  CFStringRef v11 = *(const __CFString **)a1;
  *(void *)(a1 + 144) = *(void *)a1;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = Length;
  CharactersPtr = CFStringGetCharactersPtr(v11);
  uint64_t result = 0;
  *(void *)(a1 + 152) = CharactersPtr;
  if (!CharactersPtr) {
    uint64_t result = CFStringGetCStringPtr(v11, 0x600u);
  }
  *(void *)(a1 + 160) = result;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  return result;
}

uint64_t __CFStringReplaceableChar32At(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 8) <= a2) {
    return 0xFFFFLL;
  }
  if (a2 < 0) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 176);
  if (v4 <= a2) {
    return 0;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = *(void *)(a1 + 152);
  if (v6)
  {
    unsigned __int16 v7 = *(_WORD *)(v6 + 2 * (*(void *)(a1 + 168) + a2));
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 160);
    if (v10)
    {
      unsigned __int16 v7 = *(char *)(v10 + *(void *)(a1 + 168) + a2);
    }
    else
    {
      if (*(void *)(a1 + 192) <= a2 || (uint64_t v11 = *(void *)(a1 + 184), v11 > a2))
      {
        uint64_t v12 = a2 - 4;
        if ((unint64_t)a2 < 4) {
          uint64_t v12 = 0;
        }
        if (v12 + 64 < v4) {
          uint64_t v4 = v12 + 64;
        }
        *(void *)(a1 + 184) = v12;
        *(void *)(a1 + 192) = v4;
        v20.location = *(void *)(a1 + 168) + v12;
        v20.length = v4 - v12;
        CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v20, (UniChar *)(a1 + 16));
        uint64_t v11 = *(void *)(a1 + 184);
      }
      unsigned __int16 v7 = *(_WORD *)(v5 + 2 * (v3 - v11));
    }
  }
  if (v7 >> 10 != 54 || *(void *)(a1 + 8) - 1 <= v3) {
    return v7;
  }
  uint64_t v8 = v7;
  int64_t v13 = v3 + 1;
  int64_t v14 = *(void *)(a1 + 176);
  if (v14 > v13)
  {
    uint64_t v15 = *(void *)(a1 + 152);
    if (v15)
    {
      unsigned __int16 v16 = *(_WORD *)(v15 + 2 * (*(void *)(a1 + 168) + v13));
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 160);
      if (v17)
      {
        unsigned __int16 v16 = *(char *)(v17 + *(void *)(a1 + 168) + v13);
      }
      else
      {
        if (*(void *)(a1 + 192) <= v13 || (int64_t v18 = *(void *)(a1 + 184), v18 > v13))
        {
          int64_t v19 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            int64_t v19 = 0;
          }
          if (v19 + 64 < v14) {
            int64_t v14 = v19 + 64;
          }
          *(void *)(a1 + 184) = v19;
          *(void *)(a1 + 192) = v14;
          v21.location = *(void *)(a1 + 168) + v19;
          v21.length = v14 - v19;
          CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v21, (UniChar *)(a1 + 16));
          int64_t v18 = *(void *)(a1 + 184);
        }
        unsigned __int16 v16 = *(_WORD *)(v5 + 2 * (v13 - v18));
      }
    }
    if (v16 >> 10 == 55) {
      return (v8 << 10) + v16 - 56613888;
    }
  }
  return v8;
}

uint64_t __CFStringReplaceableCharAt(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 8) <= a2)
  {
    return (unsigned __int16)-1;
  }
  else
  {
    if (a2 < 0) {
      return 0;
    }
    uint64_t v3 = a2;
    uint64_t v4 = *(void *)(a1 + 176);
    if (v4 <= a2)
    {
      return 0;
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 152);
      if (v5)
      {
        return *(unsigned __int16 *)(v5 + 2 * (*(void *)(a1 + 168) + a2));
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 160);
        if (v8)
        {
          return (unsigned __int16)*(char *)(v8 + *(void *)(a1 + 168) + a2);
        }
        else
        {
          if (*(void *)(a1 + 192) <= a2 || (uint64_t v9 = *(void *)(a1 + 184), v9 > a2))
          {
            uint64_t v10 = a2 - 4;
            if ((unint64_t)a2 < 4) {
              uint64_t v10 = 0;
            }
            if (v10 + 64 < v4) {
              uint64_t v4 = v10 + 64;
            }
            *(void *)(a1 + 184) = v10;
            *(void *)(a1 + 192) = v4;
            v11.location = *(void *)(a1 + 168) + v10;
            v11.length = v4 - v10;
            CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v11, (UniChar *)(a1 + 16));
            uint64_t v9 = *(void *)(a1 + 184);
          }
          return *(unsigned __int16 *)(a1 + 16 + 2 * (v3 - v9));
        }
      }
    }
  }
}

uint64_t __CFStringReplaceableLength(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void ___getIcuTransformCache_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)_getIcuTransformCache__pasExprOnceResult;
  _getIcuTransformCache__pasExprOnceResult = v1;
}

void ___getIcuTransformResultCache_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v1 = [[_PASLazyPurgeableResult alloc] initWithBlock:&__block_literal_global_49];
  uint64_t v2 = (void *)_getIcuTransformResultCache__pasExprOnceResult;
  _getIcuTransformResultCache__pasExprOnceResult = (uint64_t)v1;
}

id ___getIcuTransformResultCache_block_invoke_2()
{
  uint64_t v0 = objc_opt_new();

  return v0;
}

void _PASIterateLongChars(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    *(_OWORD *)long long buffer = 0u;
    long long v28 = 0u;
    CFIndex Length = CFStringGetLength(v3);
    long long v35 = v3;
    uint64_t v38 = 0;
    CFIndex v39 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    uint64_t v36 = (UniChar *)CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    }
    uint64_t v37 = CStringPtr;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    if (Length >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        if (v8 < 0 || (CFIndex v9 = v39, v39 <= v8))
        {
          UniChar v12 = 0;
        }
        else
        {
          uint64_t v10 = v36;
          if (v36)
          {
            uint64_t v11 = v38 + v8;
          }
          else
          {
            if (v37)
            {
              UniChar v12 = v37[v38 + v8];
              goto LABEL_12;
            }
            if (v41 <= v8 || (uint64_t v21 = v40, v40 > v8))
            {
              uint64_t v22 = v8 - 4;
              if ((unint64_t)v8 < 4) {
                uint64_t v22 = 0;
              }
              if (v22 + 64 < v39) {
                CFIndex v9 = v22 + 64;
              }
              uint64_t v40 = v22;
              uint64_t v41 = v9;
              v42.location = v38 + v22;
              v42.length = v9 - v22;
              CFStringGetCharacters(v35, v42, buffer);
              uint64_t v21 = v40;
            }
            uint64_t v11 = v8 - v21;
            uint64_t v10 = buffer;
          }
          UniChar v12 = v10[v11];
        }
LABEL_12:
        UniChar v25 = v12;
        UniChar v26 = 0;
        uint64_t v13 = v12;
        if (v12 >> 10 == 54 && v8 < Length - 1 && v8 >= -1)
        {
          int64_t v14 = v8 + 1;
          CFIndex v15 = v39;
          if (v39 > v8 + 1)
          {
            unsigned __int16 v16 = v36;
            if (v36)
            {
              int64_t v17 = v38 + v14;
              goto LABEL_18;
            }
            if (v37)
            {
              UniChar v18 = v37[v38 + v14];
            }
            else
            {
              if (v41 <= v14 || (uint64_t v23 = v40, v40 > v14))
              {
                uint64_t v24 = v8 - 3;
                if ((unint64_t)v14 < 4) {
                  uint64_t v24 = 0;
                }
                if (v24 + 64 < v39) {
                  CFIndex v15 = v24 + 64;
                }
                uint64_t v40 = v24;
                uint64_t v41 = v15;
                v43.location = v38 + v24;
                v43.length = v15 - v24;
                CFStringGetCharacters(v35, v43, buffer);
                uint64_t v23 = v40;
              }
              int64_t v17 = v14 - v23;
              unsigned __int16 v16 = buffer;
LABEL_18:
              UniChar v18 = v16[v17];
            }
            UniChar v26 = v18;
            uint64_t v19 = v8;
            if (v18 >> 10 == 55)
            {
              uint64_t v13 = (v25 << 10) + v18 - 56613888;
              uint64_t v19 = v8 + 1;
            }
            goto LABEL_20;
          }
        }
        uint64_t v19 = v8;
LABEL_20:
        CFIndex v20 = v19 + 1;
        v4[2](v4, v13, &v25, v8, v19 + 1 - v8);
        uint64_t v8 = v20;
      }
      while (v20 < Length);
    }
  }
}

id _PASCharacterSetWithCharactersInString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___PASCharacterSetWithCharactersInString_block_invoke;
  v7[3] = &unk_1E5AEA8E8;
  id v8 = v3;
  id v4 = v3;
  _PASIterateLongChars(v1, v7);
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

__CFString *_PASCollapseWhitespaceAndStrip(void *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = [(__CFString *)v1 length];
  if (v2)
  {
    unint64_t v3 = v2;
    if (v2 > 0x1FF)
    {
      uint64_t v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
      if (!v5) {
        goto LABEL_66;
      }
    }
    else
    {
      MEMORY[0x1F4188790](v2);
      uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
    }
    id v1 = v1;
    uint64_t v6 = self;

    if (v6)
    {
      memset(buffer, 0, sizeof(buffer));
      CFIndex Length = CFStringGetLength(v1);
      long long v35 = v1;
      uint64_t v38 = 0;
      CFIndex v39 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v1);
      CStringPtr = 0;
      uint64_t v36 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
      }
      unint64_t v33 = v3;
      int64_t v40 = 0;
      int64_t v41 = 0;
      uint64_t v37 = CStringPtr;
      if (Length >= 1)
      {
        uint64_t v10 = 0;
        int64_t v11 = 0;
        int64_t v12 = 0;
        char v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 64;
        char v16 = 1;
        while (1)
        {
          if ((unint64_t)v12 >= 4) {
            uint64_t v17 = 4;
          }
          else {
            uint64_t v17 = v12;
          }
          CFIndex v18 = v39;
          if (v39 <= v12)
          {
            UniChar v19 = 0;
          }
          else
          {
            if (v36)
            {
              UniChar v19 = v36[v12 + v38];
            }
            else if (v37)
            {
              UniChar v19 = v37[v38 + v12];
            }
            else
            {
              if (v41 <= v12 || v11 > v12)
              {
                uint64_t v21 = v17 + v10;
                uint64_t v22 = v15 - v17;
                int64_t v23 = v12 - v17;
                CFIndex v24 = v23 + 64;
                if (v23 + 64 >= v39) {
                  CFIndex v24 = v39;
                }
                int64_t v40 = v23;
                int64_t v41 = v24;
                if (v39 >= v22) {
                  CFIndex v18 = v22;
                }
                v44.length = v18 + v21;
                v44.location = v23 + v38;
                CFStringGetCharacters(v35, v44, (UniChar *)buffer);
                int64_t v11 = v40;
              }
              UniChar v19 = *((_WORD *)buffer + v12 - v11);
            }
            if (v19 == 10 || v19 == 32)
            {
LABEL_47:
              if ((v16 & 1) == 0)
              {
                *(_WORD *)&v5[2 * v14++] = 32;
                char v13 = v13 & 1 | (v19 != 32);
              }
              char v16 = 1;
              goto LABEL_51;
            }
          }
          if ((unsigned __int16)(v19 - 48) >= 0xAu && (unsigned __int16)((v19 & 0xFFDF) - 65) >= 0x1Au)
          {
            if (v19 > 0x9Fu)
            {
              if (v19 == 160 || v19 == 5760) {
                goto LABEL_47;
              }
            }
            else if (v19 == 9 || v19 == 32)
            {
              goto LABEL_47;
            }
            if ((unsigned __int16)(v19 - 0x2000) < 0xCu) {
              goto LABEL_47;
            }
            if (v19 > 0x2027u)
            {
              if (v19 - 8232 <= 0x37 && ((1 << (v19 - 40)) & 0x80000000000083) != 0
                || v19 == 12288)
              {
                goto LABEL_47;
              }
            }
            else if (v19 - 10 < 4 || v19 == 133)
            {
              goto LABEL_47;
            }
          }
          char v16 = 0;
          *(_WORD *)&v5[2 * v14++] = v19;
LABEL_51:
          ++v12;
          --v10;
          ++v15;
          if (Length == v12) {
            goto LABEL_55;
          }
        }
      }
      uint64_t v14 = 0;
      char v13 = 0;
LABEL_55:
      char v25 = v13;
      unint64_t v3 = v33;
    }
    else
    {
      uint64_t v14 = 0;
      char v25 = 0;
    }

    uint64_t v26 = v14 - 1;
    while (v26 != -1)
    {
      int v27 = *(unsigned __int16 *)&v5[2 * v26--];
      if (v27 != 32)
      {
        unint64_t v28 = v26 + 2;
        if (v25) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
    }
    unint64_t v28 = 0;
    if (v25) {
      goto LABEL_63;
    }
LABEL_62:
    if (v28 >= [(__CFString *)v1 length]) {
      goto LABEL_64;
    }
LABEL_63:
    uint64_t v29 = [[NSString alloc] initWithCharacters:v5 length:v28];

    id v1 = (__CFString *)v29;
LABEL_64:
    if (v3 >= 0x200) {
      free(v5);
    }
  }
LABEL_66:
  long long v30 = v1;

  return v30;
}

id _PASRemoveCharacterSet(void *a1, const __CFCharacterSet *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    unsigned __int16 v7 = (__CFString *)v3;
    id v8 = self;

    if (v8)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      *(_OWORD *)long long buffer = 0u;
      long long v30 = 0u;
      CFIndex Length = CFStringGetLength(v7);
      CFStringRef theString = v7;
      uint64_t v40 = 0;
      CFIndex v41 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      uint64_t v38 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      }
      id v28 = v3;
      int64_t v42 = 0;
      int64_t v43 = 0;
      CFIndex v39 = CStringPtr;
      if (Length < 1)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v12 = 0;
        int64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 64;
        do
        {
          if ((unint64_t)v13 >= 4) {
            uint64_t v16 = 4;
          }
          else {
            uint64_t v16 = v13;
          }
          CFIndex v17 = v41;
          if (v41 <= v13)
          {
            UniChar v18 = 0;
          }
          else if (v38)
          {
            UniChar v18 = v38[v13 + v40];
          }
          else if (v39)
          {
            UniChar v18 = v39[v40 + v13];
          }
          else
          {
            int64_t v19 = v42;
            if (v43 <= v13 || v42 > v13)
            {
              uint64_t v21 = v16 + v12;
              uint64_t v22 = v15 - v16;
              int64_t v23 = v13 - v16;
              CFIndex v24 = v23 + 64;
              if (v23 + 64 >= v41) {
                CFIndex v24 = v41;
              }
              int64_t v42 = v23;
              int64_t v43 = v24;
              if (v41 >= v22) {
                CFIndex v17 = v22;
              }
              v45.length = v17 + v21;
              v45.location = v23 + v40;
              CFStringGetCharacters(theString, v45, buffer);
              int64_t v19 = v42;
            }
            UniChar v18 = buffer[v13 - v19];
          }
          if (!CFCharacterSetIsCharacterMember(a2, v18)) {
            v6[v14++] = v18;
          }
          ++v13;
          --v12;
          ++v15;
        }
        while (Length != v13);
      }
      id v3 = v28;
    }
    else
    {
      uint64_t v14 = 0;
    }

    if (v14 == v5)
    {
      free(v6);
      id v25 = (id)[(__CFString *)v7 copy];
    }
    else
    {
      id v25 = (id)[[NSString alloc] initWithCharactersNoCopy:v6 length:v14 freeWhenDone:1];
    }
  }
  else
  {
    id v25 = v3;
  }
  uint64_t v26 = v25;

  return v26;
}

uint64_t _PASGetNameCharacterSet()
{
  if (_PASGetNameCharacterSet_onceToken != -1) {
    dispatch_once(&_PASGetNameCharacterSet_onceToken, &__block_literal_global);
  }
  return _PASGetNameCharacterSet_charset;
}

id _PASRemoveWhitespace(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  if (v2)
  {
    id v3 = malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    uint64_t v4 = (__CFString *)v1;
    uint64_t v5 = self;

    if (v5)
    {
      memset(v25, 0, sizeof(v25));
      CFIndex Length = CFStringGetLength(v4);
      CFStringRef theString = v4;
      uint64_t v29 = 0;
      CFIndex v30 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v4);
      CStringPtr = 0;
      int v27 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
      }
      int64_t v31 = 0;
      int64_t v32 = 0;
      id v28 = CStringPtr;
      if (Length >= 1)
      {
        uint64_t v9 = 0;
        int64_t v10 = 0;
        int64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 64;
        while (1)
        {
          if ((unint64_t)v11 >= 4) {
            uint64_t v14 = 4;
          }
          else {
            uint64_t v14 = v11;
          }
          CFIndex v15 = v30;
          if (v30 <= v11)
          {
            UniChar v16 = 0;
          }
          else
          {
            if (v27)
            {
              UniChar v16 = v27[v11 + v29];
            }
            else if (v28)
            {
              UniChar v16 = v28[v29 + v11];
            }
            else
            {
              if (v32 <= v11 || v10 > v11)
              {
                uint64_t v18 = v14 + v9;
                uint64_t v19 = v13 - v14;
                int64_t v20 = v11 - v14;
                CFIndex v21 = v20 + 64;
                if (v20 + 64 >= v30) {
                  CFIndex v21 = v30;
                }
                int64_t v31 = v20;
                int64_t v32 = v21;
                if (v30 >= v19) {
                  CFIndex v15 = v19;
                }
                v34.length = v15 + v18;
                v34.location = v20 + v29;
                CFStringGetCharacters(theString, v34, (UniChar *)v25);
                int64_t v10 = v31;
              }
              UniChar v16 = *((_WORD *)v25 + v11 - v10);
            }
            if (v16 == 10 || v16 == 32) {
              goto LABEL_45;
            }
          }
          if ((unsigned __int16)(v16 - 48) < 0xAu || (unsigned __int16)((v16 & 0xFFDF) - 65) < 0x1Au) {
            goto LABEL_44;
          }
          if (v16 > 0x9Fu)
          {
            if (v16 == 160 || v16 == 5760) {
              goto LABEL_45;
            }
          }
          else if (v16 == 9 || v16 == 32)
          {
            goto LABEL_45;
          }
          if ((unsigned __int16)(v16 - 0x2000) >= 0xCu) {
            break;
          }
LABEL_45:
          ++v11;
          --v9;
          ++v13;
          if (Length == v11) {
            goto LABEL_48;
          }
        }
        if (v16 > 0x2027u)
        {
          if (v16 - 8232 <= 0x37 && ((1 << (v16 - 40)) & 0x80000000000083) != 0
            || v16 == 12288)
          {
            goto LABEL_45;
          }
        }
        else if (v16 - 10 < 4 || v16 == 133)
        {
          goto LABEL_45;
        }
LABEL_44:
        v3[v12++] = v16;
        goto LABEL_45;
      }
    }
    uint64_t v12 = 0;
LABEL_48:

    id v22 = (id)[[NSString alloc] initWithCharactersNoCopy:v3 length:v12 freeWhenDone:1];
  }
  else
  {
    id v22 = v1;
  }
  int64_t v23 = v22;

  return v23;
}

id _PASRemoveSomePunctuation(void *a1)
{
  uint64_t v1 = _PASRemoveSomePunctuation_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_PASRemoveSomePunctuation_onceToken, &__block_literal_global_8);
  }
  id v3 = _PASRemoveCharacterSet(v2, (const __CFCharacterSet *)_PASRemoveSomePunctuation_charset);

  return v3;
}

id _PASStripQuotationMarks(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (_PASGetQuotationMarkCharacterSet_onceToken != -1) {
      dispatch_once(&_PASGetQuotationMarkCharacterSet_onceToken, &__block_literal_global_38);
    }
    id v2 = (id)_PASGetQuotationMarkCharacterSet_quotationMarks;
    uint64_t v3 = [v1 characterAtIndex:0];
    uint64_t v4 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1);
    if ([v2 characterIsMember:v3]
      && [v2 characterIsMember:v4])
    {
      id v5 = [v1 stringByTrimmingCharactersInSet:v2];
    }
    else
    {
      id v5 = v1;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = v1;
  }

  return v6;
}

uint64_t _PASGetQuotationMarkCharacterSet()
{
  if (_PASGetQuotationMarkCharacterSet_onceToken != -1) {
    dispatch_once(&_PASGetQuotationMarkCharacterSet_onceToken, &__block_literal_global_38);
  }
  return _PASGetQuotationMarkCharacterSet_quotationMarks;
}

__CFString *_PASTrimTrailingWhitespace(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  if (!v2) {
    goto LABEL_46;
  }
  uint64_t v3 = v2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  CFStringRef theString = v1;
  uint64_t v35 = 0;
  uint64_t v36 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  long long v33 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  uint64_t v6 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  unint64_t v7 = v3 - 1;
  CFRange v34 = CStringPtr;
  uint64_t v8 = 1 - v3;
  uint64_t v9 = v3 + 63;
  uint64_t v10 = v3;
  do
  {
    uint64_t v11 = v10;
    if (v7 >= 4) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = v7;
    }
    BOOL v13 = v10-- < 1;
    if (v13 || v36 < v11)
    {
      UniChar v14 = 0;
    }
    else
    {
      if (v33)
      {
        UniChar v14 = v33[v11 - 1 + v35];
      }
      else if (v34)
      {
        UniChar v14 = v34[v35 - 1 + v11];
      }
      else
      {
        if (v38 < v11 || v6 >= v11)
        {
          uint64_t v15 = v9 - v12;
          uint64_t v16 = -v12;
          uint64_t v17 = v12 + v8;
          uint64_t v18 = v11 + v16;
          uint64_t v19 = v18 - 1;
          uint64_t v20 = v18 + 63;
          if (v20 >= v36) {
            uint64_t v20 = v36;
          }
          uint64_t v37 = v19;
          uint64_t v38 = v20;
          if (v36 < v15) {
            uint64_t v15 = v36;
          }
          v40.length = v15 + v17;
          v40.location = v19 + v35;
          CFStringGetCharacters(theString, v40, (UniChar *)&v24);
          uint64_t v6 = v37;
        }
        UniChar v14 = *((_WORD *)&v24 + v11 - v6 - 1);
      }
      if (v14 == 10 || v14 == 32) {
        goto LABEL_41;
      }
    }
    if ((unsigned __int16)(v14 - 48) < 0xAu || (unsigned __int16)((v14 & 0xFFDF) - 65) < 0x1Au) {
      goto LABEL_44;
    }
    if (v14 > 0x9Fu)
    {
      if (v14 == 160 || v14 == 5760) {
        goto LABEL_41;
      }
    }
    else if (v14 == 9 || v14 == 32)
    {
      goto LABEL_41;
    }
    if ((unsigned __int16)(v14 - 0x2000) >= 0xCu)
    {
      if (v14 > 0x2027u)
      {
        if ((v14 - 8232 > 0x37 || ((1 << (v14 - 40)) & 0x80000000000083) == 0)
          && v14 != 12288)
        {
          goto LABEL_44;
        }
      }
      else if (v14 - 10 >= 4 && v14 != 133)
      {
        goto LABEL_44;
      }
    }
LABEL_41:
    --v7;
    ++v8;
    --v9;
  }
  while (v10);
  uint64_t v11 = 0;
LABEL_44:
  if (v11 < v3)
  {
    -[__CFString substringToIndex:](v1, "substringToIndex:", v11, v24, v25, v26, v27, v28, v29, v30, v31);
    CFIndex v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
LABEL_46:
  CFIndex v21 = v1;
LABEL_47:
  id v22 = v21;

  return v22;
}

void _PASUtfNCursorInit(void *a1, void *a2)
{
  uint64_t v3 = a2;
  if (v3)
  {
    CFStringRef theString = v3;
    CFIndex Length = CFStringGetLength(v3);
    a1[23] = Length;
    a1[16] = theString;
    a1[19] = 0;
    a1[20] = Length;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    CStringPtr = 0;
    a1[17] = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    }
    a1[18] = CStringPtr;
    a1[21] = 0;
    a1[22] = 0;
    a1[24] = 0;
    a1[25] = 0;
    uint64_t v3 = (__CFString *)theString;
  }
}

BOOL _PASUtfNCursorAdvance(UniChar *buffer)
{
  unint64_t v1 = *((void *)buffer + 25);
  unint64_t v2 = *((void *)buffer + 23);
  if (v1 >= v2) {
    return v1 < v2;
  }
  *((void *)buffer + 25) = v1 + 1;
  if ((v1 & 0x8000000000000000) != 0 || (int64_t v4 = *((void *)buffer + 20), v4 <= (uint64_t)v1))
  {
    ++*((void *)buffer + 24);
    return v1 < v2;
  }
  uint64_t v5 = *((void *)buffer + 17);
  if (v5)
  {
    UniChar v6 = *(_WORD *)(v5 + 2 * (*((void *)buffer + 19) + v1));
  }
  else
  {
    uint64_t v8 = *((void *)buffer + 18);
    if (v8)
    {
      UniChar v6 = *(char *)(v8 + *((void *)buffer + 19) + v1);
    }
    else
    {
      if (*((void *)buffer + 22) <= (int64_t)v1 || (int64_t v9 = *((void *)buffer + 21), v9 > (uint64_t)v1))
      {
        unint64_t v10 = v1 - 4;
        if (v1 < 4) {
          unint64_t v10 = 0;
        }
        if ((uint64_t)(v10 + 64) < v4) {
          int64_t v4 = v10 + 64;
        }
        *((void *)buffer + 21) = v10;
        *((void *)buffer + 22) = v4;
        v24.location = *((void *)buffer + 19) + v10;
        v24.length = v4 - v10;
        CFStringGetCharacters(*((CFStringRef *)buffer + 16), v24, buffer);
        int64_t v9 = *((void *)buffer + 21);
      }
      UniChar v6 = buffer[v1 - v9];
    }
  }
  if ((v6 & 0xFC00) == 0xDC00) {
    goto LABEL_39;
  }
  if ((v6 & 0xFC00) == 0xD800)
  {
    int64_t v11 = *((void *)buffer + 25);
    if ((unint64_t)v11 < *((void *)buffer + 23))
    {
      *((void *)buffer + 25) = v11 + 1;
      if ((v11 & 0x8000000000000000) == 0)
      {
        int64_t v12 = *((void *)buffer + 20);
        if (v12 > v11)
        {
          uint64_t v13 = *((void *)buffer + 17);
          if (v13)
          {
            UniChar v14 = *(_WORD *)(v13 + 2 * (*((void *)buffer + 19) + v11));
          }
          else
          {
            uint64_t v20 = *((void *)buffer + 18);
            if (v20)
            {
              UniChar v14 = *(char *)(v20 + *((void *)buffer + 19) + v11);
            }
            else
            {
              if (*((void *)buffer + 22) <= v11 || (int64_t v21 = *((void *)buffer + 21), v21 > v11))
              {
                int64_t v22 = v11 - 4;
                if ((unint64_t)v11 < 4) {
                  int64_t v22 = 0;
                }
                if (v22 + 64 < v12) {
                  int64_t v12 = v22 + 64;
                }
                *((void *)buffer + 21) = v22;
                *((void *)buffer + 22) = v12;
                v25.location = *((void *)buffer + 19) + v22;
                v25.length = v12 - v22;
                CFStringGetCharacters(*((CFStringRef *)buffer + 16), v25, buffer);
                int64_t v21 = *((void *)buffer + 21);
              }
              UniChar v14 = buffer[v11 - v21];
            }
          }
          if (v14 >> 10 == 55)
          {
            unsigned int v15 = (v6 << 10) + v14 - 56613888;
LABEL_40:
            uint64_t v23 = *((void *)buffer + 24);
            uint64_t v17 = buffer + 96;
            uint64_t v16 = v23;
            goto LABEL_41;
          }
        }
      }
    }
LABEL_39:
    unsigned int v15 = 65533;
    goto LABEL_40;
  }
  unsigned int v15 = v6;
  uint64_t v18 = *((void *)buffer + 24);
  uint64_t v17 = buffer + 96;
  uint64_t v16 = v18;
  if (v6 >= 0x80u)
  {
LABEL_41:
    uint64_t v19 = v16 + 2;
    goto LABEL_42;
  }
  uint64_t v19 = v16 + 1;
LABEL_42:
  *(void *)uint64_t v17 = v19;
  if (v15 >= 0x800)
  {
    *(void *)uint64_t v17 = v19 + 1;
    if (v15 >= 0x10000) {
      *(void *)uint64_t v17 = v19 + 2;
    }
  }
  return v1 < v2;
}

void _PASConvertUtf8ByteOffsetsToUtf16WordOffsets(uint64_t a1, uint64_t a2, void *a3)
{
  CFStringRef v5 = a3;
  UniChar v6 = (__CFString *)v5;
  if (a2 && v5 && !CFStringGetCStringPtr(v5, 0x600u))
  {
    long long v9 = 0u;
    memset(v8, 0, sizeof(v8));
    _PASUtfNCursorInit(v8, v6);
    uint64_t v7 = 0;
    do
    {
      while ((unint64_t)v9 < *(void *)(a1 + 8 * v7) && _PASUtfNCursorAdvance((UniChar *)v8))
        ;
      *(void *)(a1 + 8 * v7++) = *((void *)&v9 + 1);
    }
    while (v7 != a2);
  }
}

uint64_t _PASSimpleICUClearCache()
{
  pthread_mutex_lock((pthread_mutex_t *)&icuLock);
  _destroyIcuTransformCache();
  uint64_t v0 = _getIcuTransformResultCache();
  [v0 removeAllObjects];

  return pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
}

id _PASNormalizeUnicodeStringMinimally(void *a1, int a2)
{
  id v3 = a1;
  int64_t v4 = fastNormalizeUnicodeStringMinimally(v3);
  CFStringRef v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _PASSimpleICUTransform(@"[^…] NFKC; Fullwidth-Halfwidth; [､｡‘’“”،] Latin-ASCII", v3, a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

id fastNormalizeUnicodeStringMinimally(void *a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = a1;
  if (CFStringGetFastestEncoding(v1) == 1536)
  {
    unint64_t v2 = v1;
LABEL_123:
    uint64_t v53 = v2;
    goto LABEL_124;
  }
  uint64_t v3 = [(__CFString *)v1 length];
  int64_t v4 = v1;
  CFStringRef v5 = self;

  if (!v5) {
    goto LABEL_121;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  long long buffer = 0u;
  CFIndex Length = CFStringGetLength(v4);
  long long v67 = v4;
  uint64_t v70 = 0;
  CFIndex v71 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  uint64_t v68 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  }
  uint64_t v72 = 0;
  int64_t v73 = 0;
  uint64_t v69 = CStringPtr;
  if (Length <= 0)
  {
LABEL_121:

    goto LABEL_122;
  }
  uint64_t v9 = 0;
  int64_t v10 = 0;
  char v11 = 0;
  int64_t v12 = 0;
  uint64_t v13 = 64;
  while (1)
  {
    if ((unint64_t)v12 >= 4) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = v12;
    }
    CFIndex v15 = v71;
    if (v71 <= v12) {
      goto LABEL_45;
    }
    if (v68)
    {
      UniChar v16 = v68[v12 + v70];
    }
    else if (v69)
    {
      UniChar v16 = v69[v70 + v12];
    }
    else
    {
      if (v73 <= v12 || v10 > v12)
      {
        uint64_t v18 = v14 + v9;
        uint64_t v19 = v13 - v14;
        int64_t v20 = v12 - v14;
        CFIndex v21 = v20 + 64;
        if (v20 + 64 >= v71) {
          CFIndex v21 = v71;
        }
        uint64_t v72 = v20;
        int64_t v73 = v21;
        if (v71 >= v19) {
          CFIndex v15 = v19;
        }
        v76.length = v15 + v18;
        v76.location = v20 + v70;
        CFStringGetCharacters(v67, v76, (UniChar *)&buffer);
        int64_t v10 = v72;
      }
      UniChar v16 = *((_WORD *)&buffer + v12 - v10);
    }
    if (v16 >= 0x100u && (unsigned __int16)(v16 - 0x2000) > 0x6Fu) {
      break;
    }
    if (v16 > 0x2046u)
    {
      if (v16 - 8263 >= 3)
      {
        if (v16 == 8279)
        {
          v3 += 3;
        }
        else if (v16 != 8287)
        {
          goto LABEL_45;
        }
      }
      else
      {
LABEL_30:
        ++v3;
      }
LABEL_44:
      char v11 = 1;
      goto LABEL_45;
    }
    if (v16 - 0x2000 <= 0x3E)
    {
      if (((1 << v16) & 0x8010330207FFLL) != 0) {
        goto LABEL_44;
      }
      if (((1 << v16) & 0x5048002000800000) != 0) {
        goto LABEL_30;
      }
      if (((1 << v16) & 0x90000000000000) != 0) {
        goto LABEL_39;
      }
    }
    if (v16 - 160 <= 0x1E)
    {
      int v22 = 1 << (v16 + 96);
      if ((v22 & 0x62C0401) != 0) {
        goto LABEL_44;
      }
      if ((v22 & 0x1108100) != 0) {
        goto LABEL_30;
      }
      if ((v22 & 0x70000000) != 0)
      {
LABEL_39:
        v3 += 2;
        goto LABEL_44;
      }
    }
LABEL_45:
    ++v12;
    --v9;
    ++v13;
    if (Length == v12)
    {

      if (v11)
      {
        uint64_t v24 = 2 * v3;
        long long buffer = 0uLL;
        if (((2 * v3) | 1uLL) > 0x400)
        {
          int v55 = malloc_type_posix_memalign((void **)&buffer, 8uLL, 2 * v3, 0x6398AB95uLL);
          BYTE8(buffer) = 0;
          if (v55)
          {
            id v56 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
            objc_exception_throw(v56);
          }
          long long v26 = (char *)buffer;
        }
        else
        {
          MEMORY[0x1F4188790](v23);
          long long v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v26, v25);
          *(void *)&long long buffer = v26;
          BYTE8(buffer) = 1;
        }
        uint64_t v27 = *((void *)&buffer + 1);
        long long v28 = v4;
        long long v29 = self;

        if (v29)
        {
          uint64_t v57 = v27;
          uint64_t v58 = v24;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v60 = 0u;
          long long buffer = 0u;
          CFIndex v30 = CFStringGetLength(v28);
          long long v67 = v28;
          uint64_t v70 = 0;
          CFIndex v71 = v30;
          long long v31 = CFStringGetCharactersPtr(v28);
          int64_t v32 = 0;
          uint64_t v68 = v31;
          if (!v31) {
            int64_t v32 = CFStringGetCStringPtr(v28, 0x600u);
          }
          uint64_t v72 = 0;
          int64_t v73 = 0;
          uint64_t v69 = v32;
          if (v30 >= 1)
          {
            uint64_t v33 = 0;
            uint64_t v34 = 0;
            uint64_t v35 = 0;
            uint64_t v36 = 64;
            while (1)
            {
              uint64_t v37 = (unint64_t)v34 >= 4 ? 4 : v34;
              CFIndex v38 = v71;
              if (v71 <= v34) {
                break;
              }
              if (v68)
              {
                unsigned __int16 v39 = v68[v34 + v70];
              }
              else if (v69)
              {
                unsigned __int16 v39 = v69[v70 + v34];
              }
              else
              {
                uint64_t v43 = v72;
                if (v73 <= v34 || v72 > v34)
                {
                  uint64_t v45 = v37 + v33;
                  uint64_t v46 = v36 - v37;
                  uint64_t v47 = v34 - v37;
                  CFIndex v48 = v47 + 64;
                  if (v47 + 64 >= v71) {
                    CFIndex v48 = v71;
                  }
                  uint64_t v72 = v47;
                  int64_t v73 = v48;
                  if (v71 >= v46) {
                    CFIndex v38 = v46;
                  }
                  v77.length = v38 + v45;
                  v77.location = v47 + v70;
                  CFStringGetCharacters(v67, v77, (UniChar *)&buffer);
                  uint64_t v43 = v72;
                }
                unsigned __int16 v39 = *((_WORD *)&buffer + v34 - v43);
              }
              __int16 v42 = 32;
              uint64_t v40 = 1;
              if (v39 <= 0x2046u)
              {
                uint64_t v41 = v35;
                switch(v39)
                {
                  case 0x2000u:
                  case 0x2001u:
                  case 0x2002u:
                  case 0x2003u:
                  case 0x2004u:
                  case 0x2005u:
                  case 0x2006u:
                  case 0x2007u:
                  case 0x2008u:
                  case 0x2009u:
                  case 0x200Au:
                  case 0x202Fu:
                    goto LABEL_118;
                  case 0x200Bu:
                  case 0x200Cu:
                  case 0x200Du:
                  case 0x200Eu:
                  case 0x200Fu:
                  case 0x2010u:
                  case 0x2012u:
                  case 0x2013u:
                  case 0x2014u:
                  case 0x2015u:
                  case 0x2016u:
                  case 0x201Au:
                  case 0x201Bu:
                  case 0x201Eu:
                  case 0x201Fu:
                  case 0x2020u:
                  case 0x2021u:
                  case 0x2022u:
                  case 0x2023u:
                  case 0x2026u:
                  case 0x2027u:
                  case 0x2028u:
                  case 0x2029u:
                  case 0x202Au:
                  case 0x202Bu:
                  case 0x202Cu:
                  case 0x202Du:
                  case 0x202Eu:
                  case 0x2030u:
                  case 0x2031u:
                  case 0x2032u:
                  case 0x2035u:
                  case 0x2038u:
                  case 0x2039u:
                  case 0x203Au:
                  case 0x203Bu:
                  case 0x203Du:
                    goto LABEL_61;
                  case 0x2011u:
                    __int16 v42 = 8208;
                    goto LABEL_113;
                  case 0x2017u:
                    uint64_t v41 = v35 + 1;
                    *(_WORD *)&v26[2 * v35] = 32;
                    __int16 v42 = 819;
                    goto LABEL_88;
                  case 0x2018u:
                  case 0x2019u:
                    __int16 v42 = 39;
                    goto LABEL_113;
                  case 0x201Cu:
                  case 0x201Du:
                    __int16 v42 = 34;
                    goto LABEL_113;
                  case 0x2024u:
                    __int16 v42 = 46;
LABEL_113:
                    uint64_t v40 = 1;
                    uint64_t v41 = v35;
                    goto LABEL_118;
                  case 0x2025u:
                    uint64_t v41 = v35 + 1;
                    __int16 v42 = 46;
                    goto LABEL_86;
                  case 0x2033u:
                    uint64_t v41 = v35 + 1;
                    __int16 v42 = 8242;
                    goto LABEL_86;
                  case 0x2034u:
                    *(_DWORD *)&v26[2 * v35] = 540155954;
                    uint64_t v41 = v35 + 2;
                    __int16 v42 = 8242;
                    goto LABEL_117;
                  case 0x2036u:
                    uint64_t v41 = v35 + 1;
                    __int16 v42 = 8245;
                    goto LABEL_86;
                  case 0x2037u:
                    *(_DWORD *)&v26[2 * v35] = 540352565;
                    uint64_t v41 = v35 + 2;
                    __int16 v42 = 8245;
                    goto LABEL_117;
                  case 0x203Cu:
                    uint64_t v41 = v35 + 1;
                    __int16 v42 = 33;
                    goto LABEL_86;
                  case 0x203Eu:
                    uint64_t v41 = v35 + 1;
                    *(_WORD *)&v26[2 * v35] = 32;
                    __int16 v42 = 773;
                    goto LABEL_88;
                  default:
                    uint64_t v41 = v35;
                    switch(v39)
                    {
                      case 0xA0u:
                        goto LABEL_118;
                      case 0xA8u:
                        uint64_t v41 = v35 + 1;
                        *(_WORD *)&v26[2 * v35] = 32;
                        __int16 v42 = 776;
                        goto LABEL_88;
                      case 0xAAu:
                        __int16 v42 = 97;
                        goto LABEL_113;
                      case 0xAFu:
                        uint64_t v41 = v35 + 1;
                        *(_WORD *)&v26[2 * v35] = 32;
                        __int16 v42 = 772;
                        goto LABEL_88;
                      case 0xB2u:
                        __int16 v42 = 50;
                        goto LABEL_113;
                      case 0xB3u:
                        __int16 v42 = 51;
                        goto LABEL_113;
                      case 0xB4u:
                        uint64_t v41 = v35 + 1;
                        *(_WORD *)&v26[2 * v35] = 32;
                        __int16 v42 = 769;
                        goto LABEL_88;
                      case 0xB5u:
                        __int16 v42 = 956;
                        goto LABEL_113;
                      case 0xB8u:
                        uint64_t v41 = v35 + 1;
                        *(_WORD *)&v26[2 * v35] = 32;
                        __int16 v42 = 807;
                        goto LABEL_88;
                      case 0xB9u:
                        __int16 v42 = 49;
                        goto LABEL_113;
                      case 0xBAu:
                        __int16 v42 = 111;
                        goto LABEL_113;
                      case 0xBCu:
                        uint64_t v50 = 2 * v35;
                        unsigned __int16 v51 = 49;
                        goto LABEL_116;
                      case 0xBDu:
                        *(_DWORD *)&v26[2 * v35] = 541327409;
                        uint64_t v41 = v35 + 2;
                        __int16 v42 = 50;
                        break;
                      case 0xBEu:
                        uint64_t v50 = 2 * v35;
                        unsigned __int16 v51 = 51;
LABEL_116:
                        *(_DWORD *)&v26[v50] = v51 | 0x20440000;
                        uint64_t v41 = v35 + 2;
                        __int16 v42 = 52;
                        break;
                      default:
                        goto LABEL_61;
                    }
LABEL_117:
                    uint64_t v40 = 3;
                    break;
                }
                goto LABEL_118;
              }
              if (v39 <= 0x2048u)
              {
                if (v39 == 8263)
                {
                  uint64_t v41 = v35 + 1;
                  __int16 v42 = 63;
LABEL_86:
                  *(_WORD *)&v26[2 * v35] = v42;
                  goto LABEL_88;
                }
                if (v39 == 8264)
                {
                  uint64_t v41 = v35 + 1;
                  *(_WORD *)&v26[2 * v35] = 63;
                  __int16 v42 = 33;
LABEL_88:
                  uint64_t v40 = 2;
                  goto LABEL_118;
                }
                goto LABEL_61;
              }
              if (v39 == 8265)
              {
                uint64_t v41 = v35 + 1;
                *(_WORD *)&v26[2 * v35] = 33;
                __int16 v42 = 63;
                goto LABEL_88;
              }
              if (v39 == 8279)
              {
                uint64_t v49 = &v26[2 * v35];
                *(_DWORD *)uint64_t v49 = 540155954;
                uint64_t v41 = v35 + 3;
                __int16 v42 = 8242;
                *((_WORD *)v49 + 2) = 8242;
                uint64_t v40 = 4;
                goto LABEL_118;
              }
              uint64_t v41 = v35;
              if (v39 != 8287) {
                goto LABEL_61;
              }
LABEL_118:
              v35 += v40;
              *(_WORD *)&v26[2 * v41] = v42;
              ++v34;
              --v33;
              ++v36;
              if (v30 == v34) {
                goto LABEL_119;
              }
            }
            unsigned __int16 v39 = 0;
LABEL_61:
            uint64_t v40 = 1;
            uint64_t v41 = v35;
            __int16 v42 = v39;
            goto LABEL_118;
          }
LABEL_119:
          uint64_t v24 = v58;
          uint64_t v27 = v57;
        }

        int v52 = (void *)MEMORY[0x1A62450A0]();
        uint64_t v53 = objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v26, v27, v24, 2483028224, 0, 0);
        goto LABEL_124;
      }
LABEL_122:
      unint64_t v2 = v4;
      goto LABEL_123;
    }
  }

  uint64_t v53 = 0;
LABEL_124:

  return v53;
}

id _PASSlowNormalizeUnicodeString(void *a1, int a2)
{
  return _PASSimpleICUTransform(@"[^…] NFKD; Latin-ASCII; [[:Nonspacing Mark:]&[:Zinh:]] Remove; NFC; Lower",
           a1,
           a2);
}

id _PASSlowNormalizeUnicodeStringMinimally(void *a1, int a2)
{
  return _PASSimpleICUTransform(@"[^…] NFKC; Fullwidth-Halfwidth; [､｡‘’“”،] Latin-ASCII", a1, a2);
}

id _PASGetNounsAndNames(void *a1)
{
  id v1 = a1;
  unint64_t v2 = objc_opt_new();
  if (_PASGetNounsAndNames__pasOnceToken26 != -1) {
    dispatch_once(&_PASGetNounsAndNames__pasOnceToken26, &__block_literal_global_19);
  }
  id v3 = (id)_PASGetNounsAndNames__pasExprOnceResult;
  uint64_t v4 = [v1 length];
  uint64_t v5 = *MEMORY[0x1E4F28530];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___PASGetNounsAndNames_block_invoke_2;
  v12[3] = &unk_1E5AEA910;
  id v13 = v3;
  id v6 = v2;
  id v14 = v6;
  id v15 = v1;
  id v7 = v1;
  id v8 = v3;
  objc_msgSend(v7, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v4, v5, 22, 0, v12);
  uint64_t v9 = v15;
  id v10 = v6;

  return v10;
}

__CFString *_PASRepairString(void *a1)
{
  id v1 = a1;
  if (![(__CFString *)v1 length]
    || (uint64_t v2 = [(__CFString *)v1 fastestEncoding], v2 == 4)
    || v2 == 1)
  {
    id v3 = v1;
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_6;
  }
  CStringPtr = CFStringGetCStringPtr(v1, 4u);
  id v7 = v1;
  id v8 = v7;
  if (CStringPtr)
  {
    uint64_t v4 = v7;
    goto LABEL_6;
  }
  uint64_t v9 = self;

  if (!v9)
  {

LABEL_43:
    id v3 = v8;
    goto LABEL_5;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  *(_OWORD *)long long buffer = 0u;
  long long v55 = 0u;
  CFIndex Length = CFStringGetLength(v8);
  long long v62 = v8;
  uint64_t v65 = 0;
  CFIndex v66 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  int64_t v12 = 0;
  long long v63 = CharactersPtr;
  if (!CharactersPtr) {
    int64_t v12 = CFStringGetCStringPtr(v8, 0x600u);
  }
  long long v64 = v12;
  uint64_t v67 = 0;
  int64_t v68 = 0;
  if (Length >= 1)
  {
    uint64_t v13 = 0;
    int64_t v14 = 0;
    UniChar v15 = 0;
    int64_t v16 = 0;
    BOOL v17 = 1;
    uint64_t v18 = 64;
    while (1)
    {
      if ((unint64_t)v16 >= 4) {
        uint64_t v19 = 4;
      }
      else {
        uint64_t v19 = v16;
      }
      CFIndex v20 = v66;
      if (v66 <= v16)
      {
        if (v15 >> 10 == 54) {
          goto LABEL_41;
        }
        UniChar v21 = 0;
      }
      else
      {
        if (v63)
        {
          UniChar v21 = v63[v16 + v65];
        }
        else if (v64)
        {
          UniChar v21 = v64[v65 + v16];
        }
        else
        {
          if (v68 <= v16 || v14 > v16)
          {
            uint64_t v23 = v19 + v13;
            uint64_t v24 = v18 - v19;
            int64_t v25 = v16 - v19;
            CFIndex v26 = v25 + 64;
            if (v25 + 64 >= v66) {
              CFIndex v26 = v66;
            }
            uint64_t v67 = v25;
            int64_t v68 = v26;
            if (v66 >= v24) {
              CFIndex v20 = v24;
            }
            v70.length = v20 + v23;
            v70.location = v25 + v65;
            CFStringGetCharacters(v62, v70, buffer);
            int64_t v14 = v67;
          }
          UniChar v21 = buffer[v16 - v14];
        }
        if ((v15 >> 10 == 54) != (v21 >> 10 == 55)) {
          goto LABEL_41;
        }
      }
      BOOL v17 = ++v16 < Length;
      --v13;
      ++v18;
      UniChar v15 = v21;
      if (Length == v16) {
        goto LABEL_41;
      }
    }
  }
  UniChar v15 = 0;
  BOOL v17 = 0;
LABEL_41:

  if (!v17 && (v15 & 0xFC00) != 0xD800) {
    goto LABEL_43;
  }
  uint64_t v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", -[__CFString length](v8, "length"));
  uint64_t v27 = v8;
  long long v28 = self;

  if (v28)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)long long buffer = 0u;
    long long v55 = 0u;
    CFIndex v29 = CFStringGetLength(v27);
    long long v62 = v27;
    uint64_t v65 = 0;
    CFIndex v66 = v29;
    CFIndex v30 = CFStringGetCharactersPtr(v27);
    long long v31 = 0;
    long long v63 = v30;
    if (!v30) {
      long long v31 = CFStringGetCStringPtr(v27, 0x600u);
    }
    unsigned __int16 v51 = v27;
    long long v64 = v31;
    uint64_t v67 = 0;
    int64_t v68 = 0;
    if (v29 >= 1)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      UniChar v34 = 0;
      BOOL v35 = 0;
      uint64_t v36 = 64;
      while (1)
      {
        BOOL v37 = 0;
        uint64_t v38 = (unint64_t)v33 >= 4 ? 4 : v33;
        UniChar v53 = 0;
        CFIndex v39 = v66;
        if (v66 <= v33) {
          break;
        }
        if (v63)
        {
          UniChar v40 = v63[v33 + v65];
        }
        else if (v64)
        {
          UniChar v40 = v64[v65 + v33];
        }
        else
        {
          uint64_t v41 = v67;
          if (v68 <= v33 || v67 > v33)
          {
            uint64_t v43 = v38 + v32;
            uint64_t v44 = v36 - v38;
            uint64_t v45 = v33 - v38;
            CFIndex v46 = v45 + 64;
            if (v45 + 64 >= v66) {
              CFIndex v46 = v66;
            }
            uint64_t v67 = v45;
            int64_t v68 = v46;
            if (v66 >= v44) {
              CFIndex v39 = v44;
            }
            v71.length = v39 + v43;
            v71.location = v45 + v65;
            CFStringGetCharacters(v62, v71, buffer);
            uint64_t v41 = v67;
          }
          UniChar v40 = buffer[v33 - v41];
        }
        UniChar v53 = v40;
        BOOL v37 = (v40 & 0xFC00) == 55296;
        if (v35 && (v40 & 0xFC00) == 56320)
        {
          v52[0] = v34;
          v52[1] = v40;
          id v47 = [NSString alloc];
          CFIndex v48 = v52;
          uint64_t v49 = 2;
LABEL_71:
          uint64_t v50 = objc_msgSend(v47, "initWithCharacters:length:", v48, v49, v51);
          [(__CFString *)v4 appendString:v50];

          goto LABEL_72;
        }
        if ((v40 & 0xF800 | 0x400) != 0xDC00) {
          break;
        }
LABEL_72:
        ++v33;
        UniChar v34 = v53;
        --v32;
        ++v36;
        BOOL v35 = v37;
        if (v29 == v33) {
          goto LABEL_73;
        }
      }
      id v47 = [NSString alloc];
      CFIndex v48 = &v53;
      uint64_t v49 = 1;
      goto LABEL_71;
    }
LABEL_73:
    uint64_t v27 = v51;
  }

LABEL_6:

  return v4;
}

uint64_t _PASMurmur3_x86_32_init(uint64_t result, int a2)
{
  *(_DWORD *)uint64_t result = a2;
  *(_DWORD *)(result + 4) = 0;
  *(unsigned char *)(result + 11) = 0;
  return result;
}

unsigned __int8 *_PASMurmur3_x86_32_update(unsigned __int8 *result, unsigned __int16 *a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v4 = result;
  uint64_t v5 = result[11];
  size_t v6 = (v5 + a3) & 3;
  if ((unint64_t)(v5 + a3) >= 4)
  {
    unint64_t v8 = (v5 + a3) & 0xFFFFFFFFFFFFFFFCLL;
    switch(result[11])
    {
      case 0u:
        unsigned int v9 = *(_DWORD *)a2;
        int v10 = *(_DWORD *)a2 >> 8;
        unsigned int v11 = HIWORD(*(_DWORD *)a2);
        int v12 = HIBYTE(*(_DWORD *)a2);
        break;
      case 1u:
        LOBYTE(v9) = result[8];
        LOBYTE(v10) = *(unsigned char *)a2;
        unsigned int v11 = *(unsigned __int16 *)((char *)a2 + 1);
        goto LABEL_10;
      case 2u:
        unsigned int v9 = *((unsigned __int16 *)result + 4);
        int v10 = v9 >> 8;
        unsigned int v11 = *a2;
LABEL_10:
        int v12 = v11 >> 8;
        break;
      case 3u:
        unsigned int v9 = *((unsigned __int16 *)result + 4);
        int v10 = v9 >> 8;
        LOBYTE(v11) = result[10];
        int v12 = *(unsigned __int8 *)a2;
        break;
      default:
        LOBYTE(v10) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v11) = 0;
        int v12 = 0;
        break;
    }
    int v13 = (v11 << 16) | (v12 << 24) | v9 | (v10 << 8);
    HIDWORD(v14) = (461845907 * ((380141568 * v13) | ((-862048943 * v13) >> 17))) ^ *(_DWORD *)result;
    LODWORD(v14) = HIDWORD(v14);
    int v15 = 5 * (v14 >> 19) - 430675100;
    *(_DWORD *)uint64_t result = v15;
    int64_t v16 = (char *)a2 - v5 + 4;
    uint64_t v17 = v8 - 4;
    uint64_t v18 = &v16[v17];
    if (v17 >= 1)
    {
      do
      {
        int v19 = *(_DWORD *)v16;
        v16 += 4;
        HIDWORD(v20) = (461845907 * ((380141568 * v19) | ((-862048943 * v19) >> 17))) ^ v15;
        LODWORD(v20) = HIDWORD(v20);
        int v15 = 5 * (v20 >> 19) - 430675100;
        *(_DWORD *)uint64_t result = v15;
      }
      while (v16 < v18);
    }
    if (v6 - 1 <= 2) {
      uint64_t result = (unsigned __int8 *)memcpy(result + 8, v18, v6);
    }
  }
  else
  {
    char v7 = v6 - v5;
    if ((v7 - 1) <= 2u)
    {
      uint64_t result = (unsigned __int8 *)memcpy(&result[v5 + 8], a2, (v7 - 1) + 1);
      LOBYTE(v5) = v4[11];
    }
    LOBYTE(v6) = v5 + v7;
  }
  v4[11] = v6;
  *((_DWORD *)v4 + 1) += v3;
  return result;
}

uint64_t _PASMurmur3_x86_32_final(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 11);
  switch(v1)
  {
    case 1:
      int v2 = *(unsigned __int8 *)(a1 + 8);
      break;
    case 2:
      int v2 = *(unsigned __int16 *)(a1 + 8);
      break;
    case 3:
      int v2 = *(unsigned __int16 *)(a1 + 8) | (*(unsigned __int8 *)(a1 + 10) << 16);
      break;
    default:
      unsigned int v3 = *(_DWORD *)a1;
      goto LABEL_9;
  }
  unsigned int v3 = (461845907 * ((380141568 * v2) | ((-862048943 * v2) >> 17))) ^ *(_DWORD *)a1;
LABEL_9:
  unsigned int v4 = -2048144789 * (v3 ^ *(_DWORD *)(a1 + 4) ^ ((v3 ^ *(_DWORD *)(a1 + 4)) >> 16));
  uint64_t v5 = (-1028477387 * (v4 ^ (v4 >> 13))) ^ ((-1028477387 * (v4 ^ (v4 >> 13))) >> 16);
  *(_DWORD *)a1 = v5;
  return v5;
}

uint64_t _PASMurmur3_x86_32(unsigned __int16 *a1, unint64_t a2, int a3)
{
  unint64_t v3 = a2 & 3;
  if (a2 >= 4)
  {
    HIDWORD(v5) = (461845907 * ((380141568 * *(_DWORD *)a1) | ((-862048943 * *(_DWORD *)a1) >> 17))) ^ a3;
    LODWORD(v5) = HIDWORD(v5);
    a3 = 5 * (v5 >> 19) - 430675100;
    size_t v6 = (unsigned __int16 *)((char *)a1 + (a2 & 0xFFFFFFFFFFFFFFFCLL));
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFFCLL) >= 5)
    {
      char v7 = a1 + 2;
      do
      {
        int v8 = *(_DWORD *)v7;
        v7 += 2;
        HIDWORD(v9) = (461845907 * ((380141568 * v8) | ((-862048943 * v8) >> 17))) ^ a3;
        LODWORD(v9) = HIDWORD(v9);
        a3 = 5 * (v9 >> 19) - 430675100;
      }
      while (v7 < v6);
    }
    if (v3 != 1)
    {
      if (v3 != 3)
      {
        if (v3 != 2) {
          goto LABEL_20;
        }
        LOWORD(v4) = *v6;
        goto LABEL_13;
      }
      int v10 = *((unsigned __int8 *)v6 + 2);
      int v11 = *v6;
LABEL_18:
      int v4 = (v11 | (v10 << 16)) & 0xFFFFFF;
      goto LABEL_19;
    }
LABEL_15:
    int v4 = *(unsigned __int8 *)v6;
    goto LABEL_19;
  }
  switch(v3)
  {
    case 1uLL:
      size_t v6 = a1;
      goto LABEL_15;
    case 3uLL:
      int v10 = *((unsigned __int8 *)a1 + 2);
      int v11 = *a1;
      goto LABEL_18;
    case 2uLL:
      LOWORD(v4) = *a1;
LABEL_13:
      int v4 = (unsigned __int16)v4;
LABEL_19:
      a3 ^= 461845907 * ((380141568 * v4) | ((-862048943 * v4) >> 17));
      break;
  }
LABEL_20:
  unsigned int v12 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  return (-1028477387 * (v12 ^ (v12 >> 13))) ^ ((-1028477387 * (v12 ^ (v12 >> 13))) >> 16);
}

int32x4_t _PASMurmur3_x86_128_init(int32x4_t *a1, unsigned int a2)
{
  int32x4_t result = vdupq_n_s32(a2);
  *a1 = result;
  a1[1].i32[0] = 0;
  a1[2].i8[3] = 0;
  return result;
}

int8x8_t *_PASMurmur3_x86_128_update(int8x8_t *result, unsigned __int8 *a2, uint64_t a3)
{
  int v8 = a3;
  unint64_t v9 = result;
  uint64_t v10 = result[4].u8[3];
  size_t v11 = (v10 + a3) & 0xF;
  if ((unint64_t)(v10 + a3) >= 0x10)
  {
    unint64_t v13 = (v10 + a3) & 0xFFFFFFFFFFFFFFF0;
    switch(result[4].i8[3])
    {
      case 0:
        unint64_t v3 = *(void *)a2;
        unint64_t v5 = *((void *)a2 + 1);
        uint64_t v4 = *(void *)a2 >> 8;
        uint64_t v6 = *(void *)a2 >> 16;
        uint64_t v7 = HIDWORD(*(void *)a2);
        break;
      case 1:
        LOBYTE(v3) = result[2].i8[4];
        LOBYTE(v4) = *a2;
        LOWORD(v6) = *(_WORD *)(a2 + 1);
        LODWORD(v7) = *(_DWORD *)(a2 + 3);
        unint64_t v5 = *(void *)(a2 + 7);
        break;
      case 2:
        LODWORD(v3) = result[2].u16[2];
        LODWORD(v4) = v3 >> 8;
        LOWORD(v6) = *(_WORD *)a2;
        LODWORD(v7) = *(_DWORD *)(a2 + 2);
        unint64_t v5 = *(void *)(a2 + 6);
        break;
      case 3:
        LODWORD(v3) = result[2].u16[2];
        LODWORD(v4) = v3 >> 8;
        LOWORD(v6) = result[2].u8[6] | (*a2 << 8);
        LODWORD(v7) = *(_DWORD *)(a2 + 1);
        unint64_t v5 = *(void *)(a2 + 5);
        break;
      case 4:
        LODWORD(v3) = result[2].i32[1];
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        LODWORD(v7) = *(_DWORD *)a2;
        unint64_t v5 = *(void *)(a2 + 4);
        break;
      case 5:
        LODWORD(v3) = result[2].i32[1];
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        LODWORD(v7) = (*(unsigned __int16 *)a2 << 8) | (a2[2] << 24) | result[3].u8[0];
        unint64_t v5 = *(void *)(a2 + 3);
        break;
      case 6:
        LODWORD(v3) = result[2].i32[1];
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        LODWORD(v7) = result[3].u16[0] | (*(unsigned __int16 *)a2 << 16);
        unint64_t v5 = *(void *)(a2 + 2);
        break;
      case 7:
        LODWORD(v3) = result[2].i32[1];
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        LODWORD(v7) = result[3].u16[0] | (result[3].u8[2] << 16) | (*a2 << 24);
        unint64_t v5 = *(void *)(a2 + 1);
        break;
      case 8:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        uint64_t v7 = HIDWORD(v3);
        unint64_t v5 = *(void *)a2;
        break;
      case 9:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        uint64_t v7 = HIDWORD(v3);
        unint64_t v14 = ((unint64_t)*(unsigned int *)a2 << 8) | ((unint64_t)(*((unsigned __int16 *)a2 + 2) | (a2[6] << 16)) << 40);
        uint64_t v15 = result[3].u8[4];
        goto LABEL_17;
      case 0xA:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        uint64_t v7 = HIDWORD(v3);
        unint64_t v14 = ((unint64_t)*(unsigned int *)a2 << 16) | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 48);
        uint64_t v15 = result[3].u16[2];
LABEL_17:
        unint64_t v5 = v14 | v15;
        break;
      case 0xB:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = ((unint64_t)*(unsigned int *)a2 << 24) | ((unint64_t)a2[4] << 56) | result[3].u16[2] | ((unint64_t)result[3].u8[6] << 16);
        uint64_t v7 = HIDWORD(v3);
        break;
      case 0xC:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = result[3].u32[1] | ((unint64_t)*(unsigned int *)a2 << 32);
        goto LABEL_23;
      case 0xD:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = result[3].u32[1] | ((unint64_t)result[4].u8[0] << 32) | ((unint64_t)(*(unsigned __int16 *)a2 | (a2[2] << 16)) << 40);
        goto LABEL_23;
      case 0xE:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = result[3].u32[1] | ((unint64_t)result[4].u16[0] << 32) | ((unint64_t)*(unsigned __int16 *)a2 << 48);
        goto LABEL_23;
      case 0xF:
        unint64_t v3 = *(unint64_t *)((char *)&result[2] + 4);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = result[3].u32[1] | ((unint64_t)(result[4].u16[0] | (result[4].u8[2] << 16)) << 32) | ((unint64_t)*a2 << 56);
LABEL_23:
        uint64_t v7 = HIDWORD(v3);
        break;
      default:
        break;
    }
    v16.i8[0] = v3;
    v16.i8[1] = v4;
    v16.i8[2] = v6;
    v16.i8[3] = BYTE1(v6);
    v16.i32[1] = v7;
    int32x2_t v17 = (int32x2_t)result[1];
    uint32x2_t v18 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v16, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v16, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789), *result);
    int32x2_t v19 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32((int32x2_t)*result, 1), v17)), (int32x2_t)0x500000005);
    uint32x2_t v20 = (uint32x2_t)veor_s8((int8x8_t)v17, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32((int32x2_t)v5, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32((int32x2_t)v5, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
    int32x2_t v21 = vdup_lane_s32(v19, 0);
    v21.i32[0] = v17.i32[1];
    int32x2_t v22 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v21, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v20, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v20, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
    *int32x4_t result = (int8x8_t)v19;
    result[1] = (int8x8_t)v22;
    uint64_t v23 = (int32x2_t *)&a2[-v10 + 16];
    uint64_t v24 = v13 - 16;
    int64_t v25 = (int32x2_t *)((char *)v23 + v24);
    if (v24 >= 1)
    {
      do
      {
        int32x2_t v26 = *v23;
        int32x2_t v27 = v23[1];
        v23 += 2;
        uint32x2_t v28 = (uint32x2_t)veor_s8((int8x8_t)v19, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v26, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v26, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789));
        int32x2_t v19 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v28, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v28, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32(v19, 1), v22)), (int32x2_t)0x500000005);
        uint32x2_t v29 = (uint32x2_t)veor_s8((int8x8_t)v22, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v27, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(v27, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
        int32x2_t v30 = vdup_lane_s32(v19, 0);
        v30.i32[0] = v22.i32[1];
        int32x2_t v22 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v30, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v29, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
        *int32x4_t result = (int8x8_t)v19;
        result[1] = (int8x8_t)v22;
      }
      while (v23 < v25);
    }
    if (v11 - 1 <= 0xE) {
      int32x4_t result = (int8x8_t *)memcpy((char *)&result[2] + 4, v25, v11);
    }
  }
  else
  {
    char v12 = v11 - v10;
    if ((v12 - 1) <= 0xEu)
    {
      int32x4_t result = (int8x8_t *)memcpy((char *)&result[2] + v10 + 4, a2, (v12 - 1) + 1);
      LOBYTE(v10) = v9[4].i8[3];
    }
    LOBYTE(v11) = v10 + v12;
  }
  v9[4].i8[3] = v11;
  v9[2].i32[0] += v8;
  return result;
}

unint64_t _PASMurmur3_x86_128_final(int8x8_t *a1)
{
  int v1 = a1[4].u8[3];
  switch(a1[4].i8[3])
  {
    case 1:
      int v6 = a1[2].u8[4];
      goto LABEL_21;
    case 2:
      int v6 = a1[2].u16[2];
      goto LABEL_21;
    case 3:
      int v6 = a1[2].u16[2] | (a1[2].u8[6] << 16);
LABEL_21:
      unsigned int v2 = (-1425107063 * ((-888307712 * v6) | ((597399067 * v6) >> 17))) ^ a1->i32[0];
      a1->i32[0] = v2;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
    case 9:
    case 0xA:
    case 0xB:
      goto LABEL_3;
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
      a1[1].i32[0] ^= -1578923117 * ((-1781923840 * a1[3].i32[1]) | ((951274213 * a1[3].i32[1]) >> 15));
LABEL_3:
      a1->i32[1] ^= 951274213 * ((-1752629248 * a1[3].i32[0]) | ((-1425107063 * a1[3].i32[0]) >> 16));
LABEL_4:
      unsigned int v2 = (-1425107063 * ((-888307712 * a1[2].i32[1]) | ((597399067 * a1[2].i32[1]) >> 17))) ^ a1->i32[0];
      switch(v1)
      {
        case 5:
          int v3 = a1[3].u8[0];
          goto LABEL_8;
        case 6:
          int v3 = a1[3].u16[0];
          goto LABEL_8;
        case 7:
          int v3 = a1[3].u16[0] | (a1[3].u8[2] << 16);
LABEL_8:
          a1->i32[1] ^= 951274213 * ((-1752629248 * v3) | ((-1425107063 * v3) >> 16));
          goto LABEL_22;
        case 9:
          int v4 = a1[3].u8[4];
          goto LABEL_12;
        case 10:
          int v4 = a1[3].u16[2];
          goto LABEL_12;
        case 11:
          int v4 = a1[3].u16[2] | (a1[3].u8[6] << 16);
LABEL_12:
          a1[1].i32[0] ^= -1578923117 * ((-1781923840 * v4) | ((951274213 * v4) >> 15));
          goto LABEL_22;
        case 13:
          int v5 = a1[4].u8[0];
          goto LABEL_16;
        case 14:
          int v5 = a1[4].u16[0];
          goto LABEL_16;
        case 15:
          int v5 = a1[4].u16[0] | (a1[4].u8[2] << 16);
LABEL_16:
          a1[1].i32[1] ^= 597399067 * ((776732672 * v5) | ((-1578923117 * v5) >> 14));
          break;
        default:
          goto LABEL_22;
      }
      break;
    default:
      unsigned int v2 = a1->i32[0];
      break;
  }
LABEL_22:
  unsigned int v7 = a1[2].u32[0];
  int v8 = a1->i32[1] ^ v7;
  int32x2_t v9 = (int32x2_t)veor_s8(a1[1], (int8x8_t)vdup_n_s32(v7));
  v10.i32[0] = v8 + (v2 ^ v7) + v9.i32[0] + v9.i32[1];
  v10.i32[1] = v10.i32[0] + v8;
  v10.u64[1] = (unint64_t)vadd_s32(vdup_n_s32(v10.u32[0]), v9);
  int8x16_t v11 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v10, 0x10uLL), (int8x16_t)v10), vdupq_n_s32(0x85EBCA6B));
  int8x16_t v12 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v11, 0xDuLL), v11), vdupq_n_s32(0xC2B2AE35));
  int32x4_t v13 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v12, 0x10uLL), v12);
  unsigned int v14 = vaddvq_s32(v13);
  uint64_t v15 = v14;
  a1->i32[0] = v14;
  int32x2_t v16 = vadd_s32(vdup_n_s32(v14), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 4uLL));
  *(int32x2_t *)((char *)a1 + 4) = v16;
  a1[1].i32[1] = v15 + v13.i32[3];
  return v15 | ((unint64_t)v16.u32[0] << 32);
}

double _PASMurmur3_x86_128(unsigned __int16 *a1, unint64_t a2, int a3)
{
  char v61 = a2 & 0xF;
  if (a2 >= 0x10)
  {
    HIDWORD(v14) = (-1425107063 * ((-888307712 * *(_DWORD *)a1) | ((597399067 * *(_DWORD *)a1) >> 17))) ^ a3;
    LODWORD(v14) = HIDWORD(v14);
    int v15 = 5 * ((v14 >> 13) + a3) + 1444728091;
    HIDWORD(v14) = (951274213
                  * ((-1752629248 * *((_DWORD *)a1 + 1)) | ((-1425107063 * *((_DWORD *)a1 + 1)) >> 16))) ^ a3;
    LODWORD(v14) = HIDWORD(v14);
    int v4 = 5 * ((v14 >> 15) + a3) + 197830471;
    HIDWORD(v14) = (-1578923117
                  * ((-1781923840 * *((_DWORD *)a1 + 2)) | ((951274213 * *((_DWORD *)a1 + 2)) >> 15))) ^ a3;
    LODWORD(v14) = HIDWORD(v14);
    int v16 = 5 * ((v14 >> 17) + a3);
    HIDWORD(v14) = (597399067
                  * ((776732672 * *((_DWORD *)a1 + 3)) | ((-1578923117 * *((_DWORD *)a1 + 3)) >> 14))) ^ a3;
    LODWORD(v14) = HIDWORD(v14);
    int v5 = v16 - 1764942795;
    int v6 = 5 * (v15 + (v14 >> 19)) + 850148119;
    unsigned int v7 = (char *)a1 + (a2 & 0xFFFFFFFFFFFFFFF0);
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFF0) < 17)
    {
      a3 = v15;
    }
    else
    {
      int32x2_t v17 = a1 + 8;
      a3 = v15;
      do
      {
        HIDWORD(v18) = a3 ^ (-1425107063 * ((-888307712 * *v17) | ((597399067 * *v17) >> 17)));
        LODWORD(v18) = HIDWORD(v18);
        a3 = 5 * ((v18 >> 13) + v4) + 1444728091;
        HIDWORD(v18) = v4 ^ (951274213 * ((-1752629248 * v17[1]) | ((-1425107063 * v17[1]) >> 16)));
        LODWORD(v18) = HIDWORD(v18);
        int v4 = 5 * (v5 + (v18 >> 15)) + 197830471;
        HIDWORD(v18) = v5 ^ (-1578923117 * ((-1781923840 * v17[2]) | ((951274213 * v17[2]) >> 15)));
        LODWORD(v18) = HIDWORD(v18);
        int v19 = 5 * (v6 + (v18 >> 17));
        HIDWORD(v18) = v6 ^ (597399067 * ((776732672 * v17[3]) | ((-1578923117 * v17[3]) >> 14)));
        LODWORD(v18) = HIDWORD(v18);
        int v5 = v19 - 1764942795;
        int v6 = 5 * ((v18 >> 19) + a3) + 850148119;
        v17 += 4;
      }
      while (v17 < (_DWORD *)v7);
    }
    LOBYTE(v3) = 0;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    switch(a2 & 0xF)
    {
      case 1uLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v3) = *v7;
        goto LABEL_34;
      case 2uLL:
        LOBYTE(v13) = 0;
        unsigned int v3 = *(unsigned __int16 *)v7;
        LODWORD(v12) = v3 >> 8;
        goto LABEL_34;
      case 3uLL:
        unsigned int v3 = *(unsigned __int16 *)v7 | (v7[2] << 16);
        LODWORD(v12) = v3 >> 8;
        LOBYTE(v13) = v7[2];
LABEL_34:
        int v30 = 0;
        unsigned __int8 v31 = 0;
        BYTE4(v60) = 0;
        unsigned __int8 v27 = 0;
        LOBYTE(v8) = 0;
        unsigned __int8 v28 = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v10) = 0;
        unsigned __int8 v29 = 0;
        break;
      case 4uLL:
        goto LABEL_38;
      case 5uLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v3) = v7[4];
        goto LABEL_38;
      case 6uLL:
        LOBYTE(v11) = 0;
        unsigned int v3 = *((unsigned __int16 *)v7 + 2);
        LODWORD(v10) = v3 >> 8;
        goto LABEL_38;
      case 7uLL:
        unsigned int v3 = *((unsigned __int16 *)v7 + 2) | (v7[6] << 16);
        LODWORD(v10) = v3 >> 8;
        LOBYTE(v11) = v7[6];
LABEL_38:
        int v30 = 0;
        unsigned __int8 v31 = 0;
        BYTE4(v60) = 0;
        unsigned __int8 v27 = 0;
        LOBYTE(v8) = 0;
        unsigned __int8 v28 = 0;
        LODWORD(v24) = *(_DWORD *)v7;
        LODWORD(v23) = *(_DWORD *)v7 & 0xFF000000;
        LODWORD(v13) = HIWORD(*(_DWORD *)v7);
        LODWORD(v12) = *(_DWORD *)v7 >> 8;
        goto LABEL_50;
      case 8uLL:
        goto LABEL_42;
      case 9uLL:
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v3) = v7[8];
        goto LABEL_42;
      case 0xAuLL:
        LOBYTE(v9) = 0;
        unsigned int v3 = *((unsigned __int16 *)v7 + 4);
        unsigned int v8 = v3 >> 8;
        goto LABEL_42;
      case 0xBuLL:
        unsigned int v3 = *((unsigned __int16 *)v7 + 4) | (v7[10] << 16);
        unsigned int v8 = v3 >> 8;
        LOBYTE(v9) = v7[10];
LABEL_42:
        int v32 = 0;
        unsigned __int8 v31 = 0;
        BYTE4(v60) = 0;
        unint64_t v24 = *(void *)v7;
        uint64_t v33 = HIBYTE(*(void *)v7);
        uint64_t v11 = HIWORD(*(void *)v7);
        uint64_t v10 = *(void *)v7 >> 40;
        uint64_t v34 = HIDWORD(*(void *)v7);
        uint64_t v23 = *(void *)v7 & 0xFF000000;
        uint64_t v13 = *(void *)v7 >> 16;
        uint64_t v12 = *(void *)v7 >> 8;
        goto LABEL_49;
      case 0xCuLL:
        LOBYTE(v60) = 0;
        uint64_t v59 = 0;
        goto LABEL_47;
      case 0xDuLL:
        uint64_t v59 = 0;
        LOBYTE(v60) = v7[12];
        goto LABEL_47;
      case 0xEuLL:
        LODWORD(v60) = *((unsigned __int16 *)v7 + 6);
        LODWORD(v59) = 0;
        HIDWORD(v59) = v60 >> 8;
        goto LABEL_47;
      case 0xFuLL:
        unsigned int v35 = *((unsigned __int16 *)v7 + 6) | (v7[14] << 16);
        HIDWORD(v59) = v35 >> 8;
        LOWORD(v60) = *((_WORD *)v7 + 6);
        LODWORD(v59) = v35 & 0xFF0000;
        goto LABEL_47;
      default:
        if (((1 << v61) & 0xF0) != 0)
        {
          int v30 = 0;
          unsigned __int8 v31 = 0;
          BYTE4(v60) = 0;
          unsigned __int8 v27 = 0;
          LOBYTE(v8) = 0;
          unsigned __int8 v28 = 0;
          LOBYTE(v11) = 0;
          LOBYTE(v10) = 0;
          LOBYTE(v3) = 0;
          LODWORD(v23) = 0;
          LOBYTE(v13) = 0;
          LOBYTE(v12) = 0;
          LOBYTE(v24) = 0;
          goto LABEL_50;
        }
        if (((1 << v61) & 0xF00) != 0)
        {
          int v32 = 0;
          unsigned __int8 v31 = 0;
          BYTE4(v60) = 0;
          LOBYTE(v9) = 0;
          LOBYTE(v8) = 0;
          LOBYTE(v3) = 0;
          LODWORD(v33) = 0;
          LOBYTE(v11) = 0;
          LOBYTE(v10) = 0;
          LOBYTE(v34) = 0;
          LODWORD(v23) = 0;
          LOBYTE(v13) = 0;
          LOBYTE(v12) = 0;
          LOBYTE(v24) = 0;
          goto LABEL_49;
        }
        uint64_t v59 = 0;
        uint64_t v60 = 0;
        unsigned int v54 = 0;
        LOBYTE(v55) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v21) = 0;
        LOBYTE(v22) = 0;
        LOBYTE(v57) = 0;
        LODWORD(v58) = 0;
        LOBYTE(v56) = 0;
        LODWORD(v23) = 0;
        LOBYTE(v24) = 0;
        LOBYTE(v25) = 0;
        LOBYTE(v26) = 0;
        unsigned __int8 v27 = 0;
        LOBYTE(v8) = 0;
        unsigned __int8 v28 = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v10) = 0;
        unsigned __int8 v29 = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v3) = 0;
        int v30 = 0;
        unsigned __int8 v31 = 0;
        if (((1 << v61) & 0xF000) != 0) {
          goto LABEL_48;
        }
        break;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
    int v4 = a3;
    int v5 = a3;
    int v6 = a3;
    unsigned int v7 = a1;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    switch(a2 & 0xF)
    {
      case 1uLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v3) = *(unsigned char *)a1;
        goto LABEL_14;
      case 2uLL:
        LOBYTE(v13) = 0;
        unsigned int v3 = *a1;
        LODWORD(v12) = v3 >> 8;
        goto LABEL_14;
      case 3uLL:
        unsigned int v3 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v12) = v3 >> 8;
        LOBYTE(v13) = *((unsigned char *)a1 + 2);
LABEL_14:
        int v4 = a3;
        int v5 = a3;
        int v6 = a3;
        goto LABEL_34;
      case 4uLL:
        goto LABEL_38;
      case 5uLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v3) = *((unsigned char *)a1 + 4);
        goto LABEL_18;
      case 6uLL:
        LOBYTE(v11) = 0;
        unsigned int v3 = a1[2];
        LODWORD(v10) = v3 >> 8;
        goto LABEL_18;
      case 7uLL:
        unsigned int v3 = a1[2] | (*((unsigned __int8 *)a1 + 6) << 16);
        LODWORD(v10) = v3 >> 8;
        LOBYTE(v11) = *((unsigned char *)a1 + 6);
LABEL_18:
        int v4 = a3;
        int v5 = a3;
        int v6 = a3;
        unsigned int v7 = a1;
        goto LABEL_38;
      case 8uLL:
        goto LABEL_42;
      case 9uLL:
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v3) = *((unsigned char *)a1 + 8);
        goto LABEL_22;
      case 0xAuLL:
        LOBYTE(v9) = 0;
        unsigned int v3 = a1[4];
        unsigned int v8 = v3 >> 8;
        goto LABEL_22;
      case 0xBuLL:
        unsigned int v3 = a1[4] | (*((unsigned __int8 *)a1 + 10) << 16);
        unsigned int v8 = v3 >> 8;
        LOBYTE(v9) = *((unsigned char *)a1 + 10);
LABEL_22:
        int v4 = a3;
        int v5 = a3;
        int v6 = a3;
        unsigned int v7 = a1;
        goto LABEL_42;
      case 0xCuLL:
        LOBYTE(v60) = 0;
        uint64_t v59 = 0;
        goto LABEL_27;
      case 0xDuLL:
        uint64_t v59 = 0;
        LOBYTE(v60) = *((unsigned char *)a1 + 12);
        goto LABEL_27;
      case 0xEuLL:
        LODWORD(v60) = a1[6];
        LODWORD(v59) = 0;
        HIDWORD(v59) = v60 >> 8;
        goto LABEL_27;
      case 0xFuLL:
        unsigned int v20 = a1[6] | (*((unsigned __int8 *)a1 + 14) << 16);
        HIDWORD(v59) = v20 >> 8;
        LOWORD(v60) = a1[6];
        LODWORD(v59) = v20 & 0xFF0000;
LABEL_27:
        int v4 = a3;
        int v5 = a3;
        int v6 = a3;
        unsigned int v7 = a1;
        break;
      default:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        goto LABEL_34;
    }
LABEL_47:
    unsigned int v22 = *((_DWORD *)v7 + 2);
    unsigned int v54 = v22 & 0xFF000000;
    unsigned int v9 = HIWORD(v22);
    unsigned int v21 = v22 >> 8;
    unint64_t v26 = *(void *)v7;
    unint64_t v57 = HIWORD(v26);
    unint64_t v58 = HIBYTE(v26);
    unint64_t v55 = HIDWORD(v26);
    unint64_t v56 = v26 >> 40;
    LODWORD(v23) = v26 & 0xFF000000;
    unint64_t v24 = v26 >> 16;
    unint64_t v25 = v26 >> 8;
LABEL_48:
    int v36 = v54 | v22 | (unsigned __int16)(v21 << 8) | (v9 << 16);
    v5 ^= -1578923117 * ((-1781923840 * v36) | ((951274213 * v36) >> 15));
    int v32 = v59;
    unsigned __int8 v31 = BYTE4(v59);
    BYTE4(v60) = v60;
    LOBYTE(v8) = v21;
    LOBYTE(v3) = v22;
    LOBYTE(v11) = v57;
    LODWORD(v33) = v58;
    LOBYTE(v34) = v55;
    LOBYTE(v10) = v56;
    LOBYTE(v13) = v24;
    LOBYTE(v12) = v25;
    LOBYTE(v24) = v26;
LABEL_49:
    int v37 = v34 | (unsigned __int16)(v10 << 8) | (v11 << 16) | (v33 << 24);
    v4 ^= 951274213 * ((-1752629248 * v37) | ((-1425107063 * v37) >> 16));
    unsigned __int8 v28 = v3;
    LOBYTE(v3) = v34;
    int v30 = v32;
    unsigned __int8 v27 = v9;
LABEL_50:
    int v38 = v23 | v24 | (unsigned __int16)(v12 << 8) | (v13 << 16);
    a3 ^= -1425107063 * ((-888307712 * v38) | ((597399067 * v38) >> 17));
    unsigned __int8 v29 = v3;
    LOBYTE(v3) = v24;
  }
  switch(a2 & 0xF)
  {
    case 1uLL:
      int v39 = v3;
      goto LABEL_55;
    case 2uLL:
      int v39 = v3 | (v12 << 8);
      goto LABEL_55;
    case 3uLL:
      int v39 = v3 | (unsigned __int16)(v12 << 8) | (v13 << 16);
LABEL_55:
      a3 ^= -1425107063 * ((-888307712 * v39) | ((597399067 * v39) >> 17));
      break;
    case 5uLL:
      int v40 = v29;
      goto LABEL_59;
    case 6uLL:
      int v40 = v29 | (v10 << 8);
      goto LABEL_59;
    case 7uLL:
      int v40 = v29 | (unsigned __int16)(v10 << 8) | (v11 << 16);
LABEL_59:
      v4 ^= 951274213 * ((-1752629248 * v40) | ((-1425107063 * v40) >> 16));
      break;
    case 9uLL:
      int v41 = v28;
      goto LABEL_63;
    case 0xAuLL:
      int v41 = v28 | (v8 << 8);
      goto LABEL_63;
    case 0xBuLL:
      int v41 = v28 | (unsigned __int16)(v8 << 8) | (v27 << 16);
LABEL_63:
      v5 ^= -1578923117 * ((-1781923840 * v41) | ((951274213 * v41) >> 15));
      break;
    case 0xDuLL:
      int v42 = BYTE4(v60);
      goto LABEL_67;
    case 0xEuLL:
      int v42 = BYTE4(v60) | (v31 << 8);
      goto LABEL_67;
    case 0xFuLL:
      int v42 = BYTE4(v60) | (v31 << 8) | v30;
LABEL_67:
      v6 ^= 597399067 * ((776732672 * v42) | ((-1578923117 * v42) >> 14));
      break;
    default:
      break;
  }
  int v43 = v4 ^ a2;
  __int32 v44 = v43 + (a3 ^ a2) + (v5 ^ a2) + (v6 ^ a2);
  v45.i32[0] = v44;
  v45.i32[1] = v44 + v43;
  v45.i32[2] = v44 + (v5 ^ a2);
  v45.i32[3] = v44 + (v6 ^ a2);
  int8x16_t v46 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v45, 0x10uLL), (int8x16_t)v45), vdupq_n_s32(0x85EBCA6B));
  int8x16_t v47 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v46, 0xDuLL), v46), vdupq_n_s32(0xC2B2AE35));
  int32x4_t v48 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v47, 0x10uLL), v47);
  unsigned int v49 = vaddvq_s32(v48);
  unsigned __int32 v50 = v49 + v48.i32[2];
  int32x2_t v51 = vdup_n_s32(v49);
  v52.i64[0] = v51.u32[0];
  v52.i64[1] = v50;
  *(void *)&double result = vorrq_s8((int8x16_t)vshll_n_s32(vadd_s32(v51, vzip2_s32(*(int32x2_t *)v48.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v48, (int8x16_t)v48, 8uLL))), 0x20uLL), v52).u64[0];
  return result;
}

uint64_t _PASMurmur3_x64_128_init(uint64_t result, unsigned int a2)
{
  *(void *)double result = a2;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 0;
  *(unsigned char *)(result + 35) = 0;
  return result;
}

uint64_t _PASMurmur3_x64_128_update(uint64_t result, unsigned __int8 *a2, uint64_t a3)
{
  int v8 = a3;
  uint64_t v9 = result;
  uint64_t v10 = *(unsigned __int8 *)(result + 35);
  size_t v11 = (v10 + a3) & 0xF;
  if ((unint64_t)(v10 + a3) >= 0x10)
  {
    unint64_t v13 = (v10 + a3) & 0xFFFFFFFFFFFFFFF0;
    switch(*(unsigned char *)(result + 35))
    {
      case 0:
        unint64_t v3 = *(void *)a2;
        unint64_t v5 = *((void *)a2 + 1);
        uint64_t v4 = *(void *)a2 >> 8;
        uint64_t v6 = *(void *)a2 >> 16;
        goto LABEL_23;
      case 1:
        LOBYTE(v3) = *(unsigned char *)(result + 20);
        LOBYTE(v4) = *a2;
        LOWORD(v6) = *(_WORD *)(a2 + 1);
        unint64_t v7 = *(unsigned int *)(a2 + 3);
        unint64_t v5 = *(void *)(a2 + 7);
        break;
      case 2:
        LODWORD(v3) = *(unsigned __int16 *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LOWORD(v6) = *(_WORD *)a2;
        unint64_t v7 = *(unsigned int *)(a2 + 2);
        unint64_t v5 = *(void *)(a2 + 6);
        break;
      case 3:
        LODWORD(v3) = *(unsigned __int16 *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LOWORD(v6) = *(unsigned __int8 *)(result + 22) | (*a2 << 8);
        unint64_t v7 = *(unsigned int *)(a2 + 1);
        unint64_t v5 = *(void *)(a2 + 5);
        break;
      case 4:
        LODWORD(v3) = *(_DWORD *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        unint64_t v7 = *(unsigned int *)a2;
        unint64_t v5 = *(void *)(a2 + 4);
        break;
      case 5:
        LODWORD(v3) = *(_DWORD *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        unint64_t v7 = (*(unsigned __int16 *)a2 << 8) | (a2[2] << 24) | *(unsigned __int8 *)(result + 24);
        unint64_t v5 = *(void *)(a2 + 3);
        break;
      case 6:
        LODWORD(v3) = *(_DWORD *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        unint64_t v7 = *(unsigned __int16 *)(result + 24) | (*(unsigned __int16 *)a2 << 16);
        unint64_t v5 = *(void *)(a2 + 2);
        break;
      case 7:
        LODWORD(v3) = *(_DWORD *)(result + 20);
        LODWORD(v4) = v3 >> 8;
        LODWORD(v6) = WORD1(v3);
        unint64_t v7 = *(unsigned __int16 *)(result + 24) | (*(unsigned __int8 *)(result + 26) << 16) | (*a2 << 24);
        unint64_t v5 = *(void *)(a2 + 1);
        break;
      case 8:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v7 = HIDWORD(v3);
        unint64_t v5 = *(void *)a2;
        break;
      case 9:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v7 = HIDWORD(v3);
        unint64_t v14 = ((unint64_t)*(unsigned int *)a2 << 8) | ((unint64_t)(*((unsigned __int16 *)a2 + 2) | (a2[6] << 16)) << 40);
        uint64_t v15 = *(unsigned __int8 *)(result + 28);
        goto LABEL_17;
      case 0xA:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v7 = HIDWORD(v3);
        unint64_t v14 = ((unint64_t)*(unsigned int *)a2 << 16) | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 48);
        uint64_t v15 = *(unsigned __int16 *)(result + 28);
LABEL_17:
        unint64_t v5 = v14 | v15;
        break;
      case 0xB:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = ((unint64_t)*(unsigned int *)a2 << 24) | ((unint64_t)a2[4] << 56) | *(unsigned __int16 *)(result + 28) | ((unint64_t)*(unsigned __int8 *)(result + 30) << 16);
        unint64_t v7 = HIDWORD(v3);
        break;
      case 0xC:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned int *)a2 << 32);
        goto LABEL_23;
      case 0xD:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned __int8 *)(result + 32) << 32) | ((unint64_t)(*(unsigned __int16 *)a2 | (a2[2] << 16)) << 40);
        goto LABEL_23;
      case 0xE:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned __int16 *)(result + 32) << 32) | ((unint64_t)*(unsigned __int16 *)a2 << 48);
        goto LABEL_23;
      case 0xF:
        unint64_t v3 = *(void *)(result + 20);
        uint64_t v4 = v3 >> 8;
        uint64_t v6 = v3 >> 16;
        unint64_t v5 = *(unsigned int *)(result + 28) | ((unint64_t)(*(unsigned __int16 *)(result + 32) | (*(unsigned __int8 *)(result + 34) << 16)) << 32) | ((unint64_t)*a2 << 56);
LABEL_23:
        unint64_t v7 = HIDWORD(v3);
        break;
      default:
        break;
    }
    double result = 0x4CF5AD432745937FLL;
    unint64_t v16 = v3 | (unint64_t)(unsigned __int16)(v4 << 8) | ((unint64_t)(unsigned __int16)v6 << 16) | (v7 << 32);
    uint64_t v17 = *(void *)(v9 + 8);
    uint64_t v18 = 5
        * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v16) | ((0x87C37B91114253D5 * v16) >> 33))) ^ *(void *)v9, 37)+ v17)+ 1390208809;
    uint64_t v19 = 5
        * (v18
         + __ROR8__((0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v5) | ((0x4CF5AD432745937FLL * v5) >> 31))) ^ v17, 33))+ 944331445;
    *(void *)uint64_t v9 = v18;
    *(void *)(v9 + 8) = v19;
    unsigned int v20 = &a2[-v10 + 16];
    uint64_t v21 = v13 - 16;
    unsigned int v22 = &v20[v21];
    if (v21 >= 1)
    {
      do
      {
        uint64_t v23 = *(void *)v20;
        uint64_t v24 = *((void *)v20 + 1);
        v20 += 16;
        uint64_t v18 = 5
            * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v23) | ((0x87C37B91114253D5 * v23) >> 33))) ^ v18, 37)+ v19)+ 1390208809;
        uint64_t v19 = 5
            * (v18
             + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v24) | ((unint64_t)(0x4CF5AD432745937FLL * v24) >> 31))) ^ v19, 33))+ 944331445;
        *(void *)uint64_t v9 = v18;
        *(void *)(v9 + 8) = v19;
      }
      while (v20 < v22);
    }
    if (v11 - 1 <= 0xE) {
      double result = (uint64_t)memcpy((void *)(v9 + 20), v22, v11);
    }
  }
  else
  {
    char v12 = v11 - v10;
    if ((v12 - 1) <= 0xEu)
    {
      double result = (uint64_t)memcpy((void *)(result + v10 + 20), a2, (v12 - 1) + 1);
      LOBYTE(v10) = *(unsigned char *)(v9 + 35);
    }
    LOBYTE(v11) = v10 + v12;
  }
  *(unsigned char *)(v9 + 35) = v11;
  *(_DWORD *)(v9 + 16) += v8;
  return result;
}

unint64_t _PASMurmur3_x64_128_final(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 35);
  if ((v1 & 0xF8) == 8) {
    *(void *)a1 ^= 0x4CF5AD432745937FLL
  }
                   * ((0x88A129EA80000000 * *(void *)(a1 + 20)) | ((0x87C37B91114253D5 * *(void *)(a1 + 20)) >> 33));
  switch(v1)
  {
    case 1:
      unint64_t v2 = *(unsigned __int8 *)(a1 + 20);
      goto LABEL_12;
    case 2:
      unint64_t v2 = *(unsigned __int16 *)(a1 + 20);
      goto LABEL_12;
    case 3:
      unint64_t v2 = *(unsigned __int16 *)(a1 + 20) | ((unint64_t)*(unsigned __int8 *)(a1 + 22) << 16);
      goto LABEL_12;
    case 4:
      unint64_t v2 = *(unsigned int *)(a1 + 20);
      goto LABEL_12;
    case 5:
      uint64_t v3 = *(unsigned __int8 *)(a1 + 24);
      goto LABEL_11;
    case 6:
      uint64_t v3 = *(unsigned __int16 *)(a1 + 24);
      goto LABEL_11;
    case 7:
      uint64_t v3 = *(unsigned __int16 *)(a1 + 24) | (*(unsigned __int8 *)(a1 + 26) << 16);
LABEL_11:
      unint64_t v2 = *(unsigned int *)(a1 + 20) | (unint64_t)(v3 << 32);
LABEL_12:
      unint64_t v4 = 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v2) | ((0x87C37B91114253D5 * v2) >> 33));
      unint64_t v5 = (void *)a1;
      goto LABEL_22;
    case 9:
      unint64_t v6 = *(unsigned __int8 *)(a1 + 28);
      goto LABEL_21;
    case 10:
      unint64_t v6 = *(unsigned __int16 *)(a1 + 28);
      goto LABEL_21;
    case 11:
      unint64_t v6 = *(unsigned __int16 *)(a1 + 28) | ((unint64_t)*(unsigned __int8 *)(a1 + 30) << 16);
      goto LABEL_21;
    case 12:
      unint64_t v6 = *(unsigned int *)(a1 + 28);
      goto LABEL_21;
    case 13:
      uint64_t v7 = *(unsigned __int8 *)(a1 + 32);
      goto LABEL_20;
    case 14:
      uint64_t v7 = *(unsigned __int16 *)(a1 + 32);
      goto LABEL_20;
    case 15:
      uint64_t v7 = *(unsigned __int16 *)(a1 + 32) | (*(unsigned __int8 *)(a1 + 34) << 16);
LABEL_20:
      unint64_t v6 = *(unsigned int *)(a1 + 28) | (unint64_t)(v7 << 32);
LABEL_21:
      unint64_t v4 = 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v6) | ((0x4CF5AD432745937FLL * v6) >> 31));
      unint64_t v5 = (void *)(a1 + 8);
LABEL_22:
      *v5 ^= v4;
      break;
    default:
      break;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 16);
  uint64_t v9 = *(void *)a1 ^ v8;
  uint64_t v10 = *(void *)(a1 + 8) ^ v8;
  unint64_t v11 = v10 + v9;
  unint64_t v12 = v11 + v10;
  unint64_t v13 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v11 ^ (v11 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v11 ^ (v11 >> 33))) >> 33));
  unint64_t v14 = v13 ^ (v13 >> 33);
  unint64_t v15 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v12 ^ (v12 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v12 ^ (v12 >> 33))) >> 33));
  unint64_t v16 = v15 ^ (v15 >> 33);
  *(void *)a1 = v16 + v14;
  *(void *)(a1 + 8) = v16 + v14 + v16;
  return v16 + v14;
}

unint64_t _PASMurmur3_x64_128(unsigned __int16 *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2 & 0xF;
  unsigned int v70 = a2;
  unsigned int v71 = a2 & 0xF;
  if (a2 >= 0x10)
  {
    *((void *)&v16 + 1) = (0x4CF5AD432745937FLL
                           * ((0x88A129EA80000000 * *(void *)a1) | ((0x87C37B91114253D5 * *(void *)a1) >> 33))) ^ a3;
    *(void *)&long long v16 = 0x4CF5AD432745937FLL
                    * ((0x88A129EA80000000 * *(void *)a1) | ((0x87C37B91114253D5 * *(void *)a1) >> 33));
    uint64_t v17 = 5 * ((v16 >> 37) + a3);
    *((void *)&v16 + 1) = (0x87C37B91114253D5
                           * ((0x4E8B26FE00000000 * *((void *)a1 + 1)) | ((unint64_t)(0x4CF5AD432745937FLL
                                                                                               * *((void *)a1 + 1)) >> 31))) ^ a3;
    *(void *)&long long v16 = 0x87C37B91114253D5
                    * ((0x4E8B26FE00000000 * *((void *)a1 + 1)) | ((unint64_t)(0x4CF5AD432745937FLL
                                                                                        * *((void *)a1 + 1)) >> 31));
    uint64_t v3 = v17 + 1390208809;
    uint64_t v7 = 5 * (v17 + 1390208809 + (v16 >> 33)) + 944331445;
    uint64_t v8 = (uint64_t *)((char *)a1 + (a2 & 0xFFFFFFFFFFFFFFF0));
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFF0) >= 17)
    {
      uint64_t v18 = (uint64_t *)(a1 + 8);
      do
      {
        uint64_t v20 = *v18;
        uint64_t v19 = v18[1];
        v18 += 2;
        uint64_t v3 = 5
           * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v20) | ((0x87C37B91114253D5 * v20) >> 33))) ^ v3, 37)+ v7)+ 1390208809;
        uint64_t v7 = 5
           * (v3
            + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v19) | ((unint64_t)(0x4CF5AD432745937FLL * v19) >> 31))) ^ v7, 33))+ 944331445;
      }
      while (v18 < v8);
    }
    LOBYTE(v5) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    uint64_t v6 = 0;
    switch(v4)
    {
      case 1uLL:
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v5) = *(unsigned char *)v8;
        goto LABEL_37;
      case 2uLL:
        LOBYTE(v15) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LODWORD(v5) = *(unsigned __int16 *)v8;
        LODWORD(v14) = v5 >> 8;
        goto LABEL_37;
      case 3uLL:
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LODWORD(v5) = *(unsigned __int16 *)v8 | (*((unsigned __int8 *)v8 + 2) << 16);
        LODWORD(v14) = v5 >> 8;
        LOBYTE(v15) = *((unsigned char *)v8 + 2);
        goto LABEL_37;
      case 4uLL:
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        unsigned __int8 v66 = 0;
        LODWORD(v5) = *(_DWORD *)v8;
        LODWORD(v14) = *(_DWORD *)v8 >> 8;
        LODWORD(v15) = HIWORD(*(_DWORD *)v8);
        LODWORD(v49) = HIBYTE(*(_DWORD *)v8);
        goto LABEL_32;
      case 5uLL:
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        uint64_t v5 = *(unsigned int *)v8;
        uint64_t v68 = *((unsigned __int8 *)v8 + 4);
        unint64_t v50 = v5 | (v68 << 32);
        unint64_t v14 = v50 >> 8;
        unint64_t v15 = v50 >> 16;
        unint64_t v49 = v50 >> 24;
LABEL_32:
        LOBYTE(v69) = v49;
        goto LABEL_37;
      case 6uLL:
        LODWORD(v21) = *((unsigned __int16 *)v8 + 2);
        uint64_t v5 = *(unsigned int *)v8;
        unint64_t v51 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 2) << 32);
        unint64_t v14 = v51 >> 8;
        unint64_t v15 = v51 >> 16;
        unint64_t v23 = v51 >> 24;
        unsigned __int8 v66 = 0;
        unsigned int v67 = v21 >> 8;
LABEL_34:
        LOBYTE(v68) = v21;
        LOBYTE(v69) = v23;
        goto LABEL_37;
      case 7uLL:
        unsigned int v24 = *((unsigned __int16 *)v8 + 2) | (*((unsigned __int8 *)v8 + 6) << 16);
        uint64_t v5 = *(unsigned int *)v8;
        unint64_t v52 = v5 & 0xFF000000FFFFFFFFLL | ((*(void *)&v24 & 0xFFFFFFLL) << 32);
        unint64_t v14 = v52 >> 8;
        unint64_t v15 = v52 >> 16;
        unint64_t v26 = v52 >> 24;
        unsigned int v27 = v24 >> 8;
        unsigned __int8 v66 = *((unsigned char *)v8 + 6);
LABEL_36:
        LOBYTE(v68) = v24;
        LOBYTE(v69) = v26;
        LOBYTE(v67) = v27;
LABEL_37:
        uint64_t v42 = 0;
        unsigned __int8 v43 = 0;
        unsigned __int8 v44 = 0;
        unsigned __int8 v45 = 0;
        unsigned __int8 v46 = 0;
        unsigned __int8 v47 = 0;
        unsigned __int8 v48 = 0;
        break;
      case 8uLL:
        goto LABEL_46;
      case 9uLL:
        LOBYTE(v9) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LOBYTE(v5) = *((unsigned char *)v8 + 8);
        goto LABEL_46;
      case 0xAuLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = *((unsigned __int16 *)v8 + 4);
        LODWORD(v9) = v5 >> 8;
        goto LABEL_46;
      case 0xBuLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = *((unsigned __int16 *)v8 + 4) | (*((unsigned __int8 *)v8 + 10) << 16);
        LODWORD(v9) = v5 >> 8;
        LOBYTE(v10) = *((unsigned char *)v8 + 10);
        goto LABEL_46;
      case 0xCuLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = *((_DWORD *)v8 + 2);
        LODWORD(v9) = v5 >> 8;
        LODWORD(v10) = WORD1(v5);
        LODWORD(v11) = BYTE3(v5);
        goto LABEL_46;
      case 0xDuLL:
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        uint64_t v12 = *((unsigned __int8 *)v8 + 12);
        uint64_t v5 = *((unsigned int *)v8 + 2);
        unint64_t v53 = v5 | (v12 << 32);
        unint64_t v9 = v53 >> 8;
        unint64_t v10 = v53 >> 16;
        unint64_t v11 = v53 >> 24;
        goto LABEL_46;
      case 0xEuLL:
        uint64_t v6 = 0;
        LODWORD(v12) = *((unsigned __int16 *)v8 + 6);
        uint64_t v5 = *((unsigned int *)v8 + 2);
        unint64_t v54 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 6) << 32);
        unint64_t v9 = v54 >> 8;
        unint64_t v10 = v54 >> 16;
        unint64_t v11 = v54 >> 24;
        unsigned int v13 = v12 >> 8;
        goto LABEL_46;
      case 0xFuLL:
        LODWORD(v12) = *((unsigned __int16 *)v8 + 6) | (*((unsigned __int8 *)v8 + 14) << 16);
        uint64_t v5 = *((unsigned int *)v8 + 2);
        unint64_t v55 = v5 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
        unint64_t v9 = v55 >> 8;
        unint64_t v10 = v55 >> 16;
        unint64_t v11 = v55 >> 24;
        unsigned int v13 = v12 >> 8;
        uint64_t v6 = ((v12 & 0xFFFFFF) << 32) & 0xFF000000000000;
        goto LABEL_46;
      default:
        uint64_t v6 = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v5) = 0;
        unint64_t v34 = 0;
        LOBYTE(v35) = 0;
        LOBYTE(v36) = 0;
        LOBYTE(v37) = 0;
        LOBYTE(v38) = 0;
        LOBYTE(v39) = 0;
        LOBYTE(v40) = 0;
        LOBYTE(v41) = 0;
        uint64_t v42 = 0;
        unsigned __int8 v43 = 0;
        unsigned __int8 v44 = 0;
        unsigned __int8 v45 = 0;
        unsigned __int8 v46 = 0;
        unsigned __int8 v47 = 0;
        unsigned __int8 v48 = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v14) = 0;
        if (v71 >= 8) {
          goto LABEL_47;
        }
        break;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    uint64_t v6 = 0;
    uint64_t v7 = v3;
    uint64_t v8 = (uint64_t *)a1;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    switch(v4)
    {
      case 1uLL:
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v5) = *(unsigned char *)a1;
        goto LABEL_13;
      case 2uLL:
        LOBYTE(v15) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LODWORD(v5) = *a1;
        LODWORD(v14) = v5 >> 8;
        goto LABEL_13;
      case 3uLL:
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v14) = v5 >> 8;
        LOBYTE(v15) = *((unsigned char *)a1 + 2);
        goto LABEL_13;
      case 4uLL:
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        unsigned __int8 v66 = 0;
        LODWORD(v5) = *(_DWORD *)a1;
        LODWORD(v14) = *(_DWORD *)a1 >> 8;
        LODWORD(v15) = HIWORD(*(_DWORD *)a1);
        int v69 = HIBYTE(*(_DWORD *)a1);
LABEL_13:
        uint64_t v7 = v3;
        goto LABEL_37;
      case 5uLL:
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        uint64_t v21 = *((unsigned __int8 *)a1 + 4);
        uint64_t v5 = *(unsigned int *)a1;
        unint64_t v22 = v5 | (v21 << 32);
        unint64_t v14 = v22 >> 8;
        unint64_t v15 = v22 >> 16;
        unint64_t v23 = v22 >> 24;
        uint64_t v7 = v3;
        goto LABEL_34;
      case 6uLL:
        unsigned __int8 v66 = 0;
        unsigned int v24 = a1[2];
        uint64_t v5 = *(unsigned int *)a1;
        unint64_t v25 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)a1[2] << 32);
        unint64_t v14 = v25 >> 8;
        unint64_t v15 = v25 >> 16;
        unint64_t v26 = v25 >> 24;
        unsigned int v27 = v24 >> 8;
        uint64_t v7 = v3;
        goto LABEL_36;
      case 7uLL:
        unsigned int v28 = a1[2] | (*((unsigned __int8 *)a1 + 6) << 16);
        uint64_t v5 = *(unsigned int *)a1;
        unint64_t v29 = v5 & 0xFF000000FFFFFFFFLL | ((*(void *)&v28 & 0xFFFFFFLL) << 32);
        unint64_t v14 = v29 >> 8;
        unint64_t v15 = v29 >> 16;
        unint64_t v30 = v29 >> 24;
        uint64_t v7 = v3;
        LOWORD(v68) = a1[2];
        LOBYTE(v69) = v30;
        unsigned __int8 v66 = *((unsigned char *)a1 + 6);
        unsigned int v67 = v28 >> 8;
        goto LABEL_37;
      case 8uLL:
        break;
      case 9uLL:
        LOBYTE(v9) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LOBYTE(v5) = *((unsigned char *)a1 + 8);
        goto LABEL_21;
      case 0xAuLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = a1[4];
        LODWORD(v9) = v5 >> 8;
        goto LABEL_21;
      case 0xBuLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = a1[4] | (*((unsigned __int8 *)a1 + 10) << 16);
        LODWORD(v9) = v5 >> 8;
        LOBYTE(v10) = *((unsigned char *)a1 + 10);
        goto LABEL_21;
      case 0xCuLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        LODWORD(v5) = *((_DWORD *)a1 + 2);
        LODWORD(v9) = v5 >> 8;
        LODWORD(v10) = WORD1(v5);
        LODWORD(v11) = BYTE3(v5);
LABEL_21:
        uint64_t v7 = v3;
        uint64_t v8 = (uint64_t *)a1;
        break;
      case 0xDuLL:
        LOBYTE(v13) = 0;
        uint64_t v6 = 0;
        uint64_t v12 = *((unsigned __int8 *)a1 + 12);
        uint64_t v5 = *((unsigned int *)a1 + 2);
        unint64_t v31 = v5 | (v12 << 32);
        unint64_t v9 = v31 >> 8;
        unint64_t v10 = v31 >> 16;
        unint64_t v11 = v31 >> 24;
        uint64_t v7 = v3;
        uint64_t v8 = (uint64_t *)a1;
        break;
      case 0xEuLL:
        uint64_t v6 = 0;
        uint64_t v5 = *((unsigned int *)a1 + 2);
        LODWORD(v12) = a1[6];
        unint64_t v32 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)a1[6] << 32);
        unint64_t v9 = v32 >> 8;
        unint64_t v10 = v32 >> 16;
        unint64_t v11 = v32 >> 24;
        unsigned int v13 = v12 >> 8;
        goto LABEL_25;
      case 0xFuLL:
        LODWORD(v12) = a1[6] | (*((unsigned __int8 *)a1 + 14) << 16);
        uint64_t v5 = *((unsigned int *)a1 + 2);
        unint64_t v33 = v5 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
        unint64_t v9 = v33 >> 8;
        unint64_t v10 = v33 >> 16;
        unint64_t v11 = v33 >> 24;
        unsigned int v13 = v12 >> 8;
        uint64_t v6 = ((v12 & 0xFFFFFF) << 32) & 0xFF000000000000;
LABEL_25:
        uint64_t v7 = v3;
        uint64_t v8 = (uint64_t *)a1;
        break;
      default:
        uint64_t v7 = v3;
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v69) = 0;
        unsigned __int8 v66 = 0;
        LOBYTE(v67) = 0;
        goto LABEL_37;
    }
LABEL_46:
    unint64_t v41 = *v8;
    unint64_t v35 = HIWORD(*v8);
    unint64_t v34 = *v8 & 0xFF00000000000000;
    unint64_t v36 = (unint64_t)*v8 >> 40;
    unint64_t v37 = HIDWORD(*v8);
    unint64_t v38 = v41 >> 24;
    unint64_t v39 = v41 >> 16;
    unint64_t v40 = v41 >> 8;
LABEL_47:
    unint64_t v56 = v34 | v41 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v39 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v38 << 24) | ((unint64_t)v37 << 32) | ((unint64_t)v36 << 40) | ((unint64_t)v35 << 48);
    v3 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v56) | ((0x87C37B91114253D5 * v56) >> 33));
    uint64_t v42 = v6;
    unsigned __int8 v43 = v13;
    unsigned __int8 v44 = v12;
    unsigned __int8 v45 = v11;
    unsigned __int8 v46 = v10;
    unsigned __int8 v47 = v9;
    unsigned __int8 v48 = v5;
    unsigned __int8 v66 = v35;
    LOBYTE(v67) = v36;
    LOBYTE(v68) = v37;
    LOBYTE(v69) = v38;
    LOBYTE(v15) = v39;
    LOBYTE(v14) = v40;
    LOBYTE(v5) = v41;
  }
  unsigned int v57 = v70;
  switch(v71)
  {
    case 1u:
      unint64_t v58 = v5;
      goto LABEL_56;
    case 2u:
      unint64_t v58 = v5 | ((unint64_t)v14 << 8);
      goto LABEL_56;
    case 3u:
      unint64_t v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16);
      goto LABEL_56;
    case 4u:
      unint64_t v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v69 << 24);
      goto LABEL_56;
    case 5u:
      unint64_t v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v69 << 24) | ((unint64_t)v68 << 32);
      goto LABEL_56;
    case 6u:
      unint64_t v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v69 << 24) | ((unint64_t)v68 << 32) | ((unint64_t)v67 << 40);
      goto LABEL_56;
    case 7u:
      unint64_t v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v69 << 24) | ((unint64_t)v68 << 32) | ((unint64_t)v67 << 40) | ((unint64_t)v66 << 48);
LABEL_56:
      v3 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v58) | ((0x87C37B91114253D5 * v58) >> 33));
      break;
    case 8u:
      break;
    case 9u:
      unint64_t v59 = v48;
      goto LABEL_64;
    case 0xAu:
      unint64_t v59 = v48 | ((unint64_t)v47 << 8);
      goto LABEL_64;
    case 0xBu:
      unint64_t v59 = v48 | (unint64_t)(unsigned __int16)(v47 << 8) | ((unint64_t)v46 << 16);
      goto LABEL_64;
    case 0xCu:
      unint64_t v59 = v48 | (unint64_t)(unsigned __int16)(v47 << 8) | ((unint64_t)v46 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v45 << 24);
      goto LABEL_64;
    case 0xDu:
      unint64_t v59 = v48 | (unint64_t)(unsigned __int16)(v47 << 8) | ((unint64_t)v46 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v45 << 24) | ((unint64_t)v44 << 32);
      goto LABEL_64;
    case 0xEu:
      unint64_t v59 = v48 | (unint64_t)(unsigned __int16)(v47 << 8) | ((unint64_t)v46 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v45 << 24) | ((unint64_t)v44 << 32) | ((unint64_t)v43 << 40);
      goto LABEL_64;
    case 0xFu:
      unint64_t v59 = v48 | (unint64_t)(unsigned __int16)(v47 << 8) | ((unint64_t)v46 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v45 << 24) | ((unint64_t)v44 << 32) | ((unint64_t)v43 << 40) | v42;
LABEL_64:
      v7 ^= 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v59) | ((0x4CF5AD432745937FLL * v59) >> 31));
      break;
    default:
      unsigned int v57 = v70;
      break;
  }
  uint64_t v60 = v7 ^ v57;
  unint64_t v61 = v60 + (v3 ^ v57);
  unint64_t v62 = v61 + v60;
  unint64_t v63 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v61 ^ (v61 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v61 ^ (v61 >> 33))) >> 33));
  unint64_t v64 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v62 ^ (v62 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v62 ^ (v62 >> 33))) >> 33));
  return (v64 ^ (v64 >> 33)) + (v63 ^ (v63 >> 33));
}

unsigned __int16 *_PAS_MurmurHash3_x86_32(unsigned __int16 *result, signed int a2, int a3, unsigned int *a4)
{
  uint64_t v4 = a2 & 3;
  if (a2 < 4)
  {
    if (v4 != 1)
    {
      if (v4 != 2)
      {
        if (v4 != 3) {
          goto LABEL_19;
        }
        goto LABEL_13;
      }
      uint64_t v6 = result;
LABEL_17:
      int v10 = *v6;
      goto LABEL_18;
    }
    uint64_t v6 = result;
LABEL_15:
    int v10 = *(unsigned __int8 *)v6;
    goto LABEL_18;
  }
  HIDWORD(v5) = (461845907 * ((380141568 * *(_DWORD *)result) | ((-862048943 * *(_DWORD *)result) >> 17))) ^ a3;
  LODWORD(v5) = HIDWORD(v5);
  a3 = 5 * (v5 >> 19) - 430675100;
  uint64_t v6 = (unsigned __int16 *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFCLL));
  if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFFCLL) >= 5)
  {
    uint64_t v7 = result + 2;
    do
    {
      int v8 = *(_DWORD *)v7;
      v7 += 2;
      HIDWORD(v9) = (461845907 * ((380141568 * v8) | ((-862048943 * v8) >> 17))) ^ a3;
      LODWORD(v9) = HIDWORD(v9);
      a3 = 5 * (v9 >> 19) - 430675100;
    }
    while (v7 < v6);
  }
  if (v4 == 1) {
    goto LABEL_15;
  }
  if (v4 == 2) {
    goto LABEL_17;
  }
  if (v4 != 3) {
    goto LABEL_19;
  }
  double result = (unsigned __int16 *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFCLL));
LABEL_13:
  int v10 = *result | (*((unsigned __int8 *)result + 2) << 16);
LABEL_18:
  a3 ^= 461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17));
LABEL_19:
  unsigned int v11 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  *a4 = (-1028477387 * (v11 ^ (v11 >> 13))) ^ ((-1028477387 * (v11 ^ (v11 >> 13))) >> 16);
  return result;
}

int8x16_t _PAS_MurmurHash3_x86_128(int32x2_t *a1, unsigned int a2, unsigned int a3, int8x16_t *a4)
{
  uint64_t v4 = a2 & 0xFLL;
  if (a2 < 0x10)
  {
    LOBYTE(v5) = 0;
    unint64_t v6 = (unint64_t)vdup_n_s32(a3);
    uint64_t v7 = a1;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    int8x8_t v10 = (int8x8_t)v6;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    switch(v4)
    {
      case 1:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LOBYTE(v5) = a1->i8[0];
        goto LABEL_12;
      case 2:
        LOBYTE(v14) = 0;
        unsigned int v5 = a1->u16[0];
        LODWORD(v13) = v5 >> 8;
        goto LABEL_12;
      case 3:
        unsigned int v5 = a1->u16[0] | (a1->u8[2] << 16);
        LODWORD(v13) = v5 >> 8;
        LOBYTE(v14) = a1->i8[2];
        goto LABEL_12;
      case 4:
        goto LABEL_37;
      case 5:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v5) = a1->i8[4];
        goto LABEL_16;
      case 6:
        LOBYTE(v12) = 0;
        unsigned int v5 = a1->u16[2];
        LODWORD(v11) = v5 >> 8;
        goto LABEL_16;
      case 7:
        unsigned int v5 = a1->u16[2] | (a1->u8[6] << 16);
        LODWORD(v11) = v5 >> 8;
        LOBYTE(v12) = a1->i8[6];
LABEL_16:
        uint64_t v7 = a1;
        int8x8_t v10 = (int8x8_t)v6;
        goto LABEL_37;
      case 8:
        goto LABEL_41;
      case 9:
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v5) = a1[1].i8[0];
        goto LABEL_20;
      case 10:
        LOBYTE(v9) = 0;
        unsigned int v5 = a1[1].u16[0];
        unsigned int v8 = v5 >> 8;
        goto LABEL_20;
      case 11:
        unsigned int v5 = a1[1].u16[0] | (a1[1].u8[2] << 16);
        unsigned int v8 = v5 >> 8;
        LOBYTE(v9) = a1[1].i8[2];
LABEL_20:
        uint64_t v7 = a1;
        int8x8_t v10 = (int8x8_t)v6;
        goto LABEL_41;
      case 12:
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        int v30 = 0;
        int32x2_t v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        unint64_t v33 = a1 + 1;
        goto LABEL_25;
      case 13:
        LOBYTE(v29) = 0;
        int v30 = 0;
        int32x2_t v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        unint64_t v33 = a1 + 1;
        LOBYTE(v28) = a1[1].i8[4];
        goto LABEL_25;
      case 14:
        int v30 = 0;
        int32x2_t v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        unint64_t v33 = a1 + 1;
        unsigned int v28 = a1[1].u16[2];
        unsigned int v29 = v28 >> 8;
        goto LABEL_25;
      case 15:
        int32x2_t v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        unint64_t v33 = a1 + 1;
        unsigned int v28 = a1[1].u16[2] | (a1[1].u8[6] << 16);
        unsigned int v29 = v28 >> 8;
        int v30 = a1[1].u8[6];
LABEL_25:
        int32x2_t v21 = (int32x2_t)v6;
        goto LABEL_47;
      default:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
LABEL_12:
        int32x2_t v18 = (int32x2_t)v6;
        int32x2_t v21 = (int32x2_t)v6;
        goto LABEL_33;
    }
  }
  int64_t v15 = (int)a2 & 0xFFFFFFFFFFFFFFF0;
  int32x2_t v16 = vdup_n_s32(a3);
  uint32x2_t v17 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(*a1, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(*a1, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789), (int8x8_t)v16);
  int32x2_t v18 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), v16), (int32x2_t)0x500000005);
  uint32x2_t v19 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(a1[1], (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(a1[1], (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93), (int8x8_t)v16);
  int32x2_t v20 = vdup_lane_s32(v18, 0);
  v20.i32[0] = a3;
  int32x2_t v21 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v20, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v19, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
  uint64_t v7 = (int32x2_t *)((char *)a1 + v15);
  if (v15 >= 17)
  {
    unint64_t v22 = a1 + 2;
    do
    {
      int32x2_t v23 = *v22;
      int32x2_t v24 = v22[1];
      v22 += 2;
      uint32x2_t v25 = (uint32x2_t)veor_s8((int8x8_t)v18, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v23, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v23, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789));
      int32x2_t v18 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v25, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v25, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32(v18, 1), v21)), (int32x2_t)0x500000005);
      uint32x2_t v26 = (uint32x2_t)veor_s8((int8x8_t)v21, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v24, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(v24, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
      int32x2_t v27 = vdup_lane_s32(v18, 0);
      v27.i32[0] = v21.i32[1];
      int32x2_t v21 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v26, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v26, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL)), v27), (int32x2_t)0x500000005);
    }
    while (v22 < v7);
  }
  unint64_t v6 = __PAIR64__(v21.u32[1], v18.u32[0]);
  LOBYTE(v5) = 0;
  LOBYTE(v8) = 0;
  LOBYTE(v9) = 0;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  int8x8_t v10 = vext_s8((int8x8_t)v18, (int8x8_t)v21, 4uLL);
  switch(v4)
  {
    case 1:
      LOBYTE(v13) = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v5) = v7->i8[0];
      goto LABEL_33;
    case 2:
      LOBYTE(v14) = 0;
      unsigned int v5 = v7->u16[0];
      LODWORD(v13) = v5 >> 8;
      goto LABEL_33;
    case 3:
      unsigned int v5 = v7->u16[0] | (v7->u8[2] << 16);
      LODWORD(v13) = v5 >> 8;
      LOBYTE(v14) = v7->i8[2];
LABEL_33:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      unsigned __int8 v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      int v30 = 0;
      __int32 v36 = v18.i32[1];
      __int32 v37 = v18.i32[0];
      unsigned __int32 v35 = v21.i32[0];
      __int32 v34 = v21.i32[1];
      v31.i8[0] = v5;
      LOBYTE(v5) = 0;
      goto LABEL_51;
    case 4:
      goto LABEL_37;
    case 5:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v5) = v7->i8[4];
      goto LABEL_37;
    case 6:
      LOBYTE(v12) = 0;
      unsigned int v5 = v7->u16[2];
      LODWORD(v11) = v5 >> 8;
      goto LABEL_37;
    case 7:
      unsigned int v5 = v7->u16[2] | (v7->u8[6] << 16);
      LODWORD(v11) = v5 >> 8;
      LOBYTE(v12) = v7->i8[6];
LABEL_37:
      unsigned __int8 v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      int v30 = 0;
      v31.i32[0] = v7->i32[0];
      LODWORD(v14) = HIWORD(v7->i32[0]);
      LODWORD(v13) = (unsigned __int32)v7->i32[0] >> 8;
      LODWORD(v32) = HIBYTE(v7->i32[0]);
      __int32 v36 = v10.i32[0];
      unsigned __int32 v35 = v10.u32[1];
      goto LABEL_50;
    case 8:
      goto LABEL_41;
    case 9:
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v5) = v7[1].i8[0];
      goto LABEL_41;
    case 10:
      LOBYTE(v9) = 0;
      unsigned int v5 = v7[1].u16[0];
      unsigned int v8 = v5 >> 8;
      goto LABEL_41;
    case 11:
      unsigned int v5 = v7[1].u16[0] | (v7[1].u8[2] << 16);
      unsigned int v8 = v5 >> 8;
      LOBYTE(v9) = v7[1].i8[2];
LABEL_41:
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      int v30 = 0;
      int32x2_t v31 = *v7;
      unint64_t v12 = HIWORD(*(unint64_t *)v7);
      unint64_t v38 = HIDWORD(*(unint64_t *)v7);
      unint64_t v11 = *(unint64_t *)v7 >> 40;
      unint64_t v14 = *(unint64_t *)v7 >> 16;
      unint64_t v13 = *(unint64_t *)v7 >> 8;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      unint64_t v39 = HIBYTE(*(unint64_t *)v7);
      __int32 v36 = v10.i32[0];
      unsigned __int32 v35 = v10.u32[1];
      goto LABEL_49;
    case 12:
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      int v30 = 0;
      int32x2_t v42 = *v7;
      unint64_t v33 = v7 + 1;
      int32x2_t v31 = v42;
      LODWORD(v32) = v42.u8[3];
      goto LABEL_46;
    case 13:
      LOBYTE(v29) = 0;
      int v30 = 0;
      int32x2_t v31 = *v7;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      LOBYTE(v28) = v7[1].i8[4];
      unint64_t v33 = v7 + 1;
      goto LABEL_46;
    case 14:
      int v30 = 0;
      int32x2_t v31 = *v7;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      unsigned int v28 = v7[1].u16[2];
      unint64_t v33 = v7 + 1;
      unsigned int v29 = v28 >> 8;
      goto LABEL_46;
    case 15:
      int32x2_t v31 = *v7;
      unint64_t v32 = *(unint64_t *)v7 >> 24;
      unsigned __int16 v43 = v7[1].u8[6];
      int v44 = v7[1].u16[2];
      unint64_t v33 = v7 + 1;
      unsigned int v28 = v44 & 0xFF00FFFF | (v43 << 16);
      unsigned int v29 = v28 >> 8;
      int v30 = v43;
LABEL_46:
      v21.i32[1] = v18.i32[1];
LABEL_47:
      unsigned int v5 = v33->i32[0];
      unsigned __int32 v9 = HIWORD(v33->i32[0]);
      unsigned int v8 = (unsigned __int32)v33->i32[0] >> 8;
      unint64_t v39 = HIBYTE(*(void *)&v31);
      unint64_t v38 = HIDWORD(*(void *)&v31);
      unint64_t v12 = HIWORD(*(void *)&v31);
      unint64_t v11 = *(void *)&v31 >> 40;
      unint64_t v14 = *(void *)&v31 >> 16;
      unint64_t v13 = *(void *)&v31 >> 8;
      unsigned int v40 = v33->i32[0] & 0xFF000000;
      goto LABEL_48;
    default:
      v31.i8[0] = 0;
      __int32 v34 = v21.i32[1];
      unsigned __int32 v35 = v21.i32[0];
      __int32 v36 = v18.i32[1];
      __int32 v37 = v18.i32[0];
      if (((1 << v4) & 0xF0) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        unsigned __int8 v41 = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        int v30 = 0;
        goto LABEL_50;
      }
      if (((1 << v4) & 0xF00) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v38) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LODWORD(v39) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        int v30 = 0;
LABEL_49:
        unsigned __int8 v41 = v5;
        unsigned int v5 = v38 | (unsigned __int16)(v11 << 8) | (v12 << 16) | (v39 << 24);
        v36 ^= 951274213 * ((-1752629248 * v5) | ((-1425107063 * v5) >> 16));
        LOBYTE(v5) = v38;
LABEL_50:
        int v46 = v31.u8[0] | (unsigned __int16)(v13 << 8) | (v14 << 16) | (v32 << 24);
        __int32 v37 = (-1425107063 * ((-888307712 * v46) | ((597399067 * v46) >> 17))) ^ v6;
        __int32 v34 = HIDWORD(v6);
        goto LABEL_51;
      }
      if (((1 << v4) & 0xF000) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v38) = 0;
        v21.i32[1] = v18.i32[1];
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LODWORD(v39) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        unsigned int v40 = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        int v30 = 0;
LABEL_48:
        int v45 = v40 | v5 | (unsigned __int16)(v8 << 8) | (v9 << 16);
        unsigned __int32 v35 = (-1578923117 * ((-1781923840 * v45) | ((951274213 * v45) >> 15))) ^ v21.i32[0];
        __int32 v36 = v21.i32[1];
        goto LABEL_49;
      }
      LOBYTE(v13) = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v5) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      unsigned __int8 v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      int v30 = 0;
LABEL_51:
      switch((int)v4)
      {
        case 1:
          int v47 = v31.u8[0];
          goto LABEL_55;
        case 2:
          int v47 = v31.u8[0] | (v13 << 8);
          goto LABEL_55;
        case 3:
          int v47 = v31.u8[0] | (unsigned __int16)(v13 << 8) | (v14 << 16);
LABEL_55:
          v37 ^= -1425107063 * ((-888307712 * v47) | ((597399067 * v47) >> 17));
          break;
        case 5:
          int v48 = v5;
          goto LABEL_59;
        case 6:
          int v48 = v5 | (v11 << 8);
          goto LABEL_59;
        case 7:
          int v48 = v5 | (unsigned __int16)(v11 << 8) | (v12 << 16);
LABEL_59:
          v36 ^= 951274213 * ((-1752629248 * v48) | ((-1425107063 * v48) >> 16));
          break;
        case 9:
          int v49 = v41;
          goto LABEL_63;
        case 10:
          int v49 = v41 | (v8 << 8);
          goto LABEL_63;
        case 11:
          int v49 = v41 | (unsigned __int16)(v8 << 8) | (v9 << 16);
LABEL_63:
          v35 ^= -1578923117 * ((-1781923840 * v49) | ((951274213 * v49) >> 15));
          break;
        case 13:
          int v50 = v28;
          goto LABEL_67;
        case 14:
          int v50 = v28 | (v29 << 8);
          goto LABEL_67;
        case 15:
          int v50 = v28 | (v29 << 8) | (v30 << 16);
LABEL_67:
          v34 ^= 597399067 * ((776732672 * v50) | ((-1578923117 * v50) >> 14));
          break;
        default:
          break;
      }
      int v51 = (v36 ^ a2) + (v37 ^ a2) + (v35 ^ a2) + (v34 ^ a2);
      v52.i32[0] = v51;
      v52.i32[1] = v51 + (v36 ^ a2);
      v52.i32[2] = v51 + (v35 ^ a2);
      v52.i32[3] = v51 + (v34 ^ a2);
      int8x16_t v53 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v52, 0x10uLL), (int8x16_t)v52), vdupq_n_s32(0x85EBCA6B));
      int8x16_t v54 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v53, 0xDuLL), v53), vdupq_n_s32(0xC2B2AE35));
      int8x16_t v55 = (int8x16_t)vshrq_n_u32((uint32x4_t)v54, 0x10uLL);
      int8x16_t result = veorq_s8(v55, v54);
      v55.i32[0] = vaddvq_s32((int32x4_t)result);
      int8x16_t v57 = vextq_s8(v55, v55, 4uLL);
      __int32 v58 = v55.i32[0];
      *(int32x2_t *)v55.i8 = vadd_s32(vdup_n_s32(v55.u32[0]), (int32x2_t)*(_OWORD *)&vextq_s8(result, result, 4uLL));
      int8x16_t v59 = vextq_s8(v57, v55, 0xCuLL);
      v59.i32[3] = v58 + result.i32[3];
      *a4 = v59;
      return result;
  }
}

unint64_t _PAS_MurmurHash3_x64_128(uint64_t *a1, unsigned int a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2 & 0xFLL;
  unsigned int v71 = a2 & 0xF;
  if (a2 < 0x10)
  {
    unint64_t v6 = 0;
    uint64_t v7 = v5 - 1;
    uint64_t v8 = 0;
    unsigned __int32 v9 = a1;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    LOBYTE(v5) = 0;
    uint64_t v14 = v4;
    switch(v7)
    {
      case 0:
        LOBYTE(v15) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v65) = 0;
        LOBYTE(v66) = 0;
        unsigned __int8 v16 = 0;
        LOBYTE(v6) = *(unsigned char *)a1;
        goto LABEL_16;
      case 1:
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v65) = 0;
        LOBYTE(v66) = 0;
        unsigned __int8 v16 = 0;
        LODWORD(v6) = *(unsigned __int16 *)a1;
        LODWORD(v15) = v6 >> 8;
        goto LABEL_16;
      case 2:
        LOBYTE(v66) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v65) = 0;
        unsigned __int8 v16 = 0;
        LODWORD(v6) = *(unsigned __int16 *)a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v15) = v6 >> 8;
        LOBYTE(v68) = *((unsigned char *)a1 + 2);
        goto LABEL_16;
      case 3:
        LOBYTE(v65) = 0;
        LOBYTE(v66) = 0;
        unsigned __int8 v16 = 0;
        LODWORD(v6) = *(_DWORD *)a1;
        LODWORD(v15) = *(_DWORD *)a1 >> 8;
        LODWORD(v68) = HIWORD(*(_DWORD *)a1);
        LODWORD(v67) = HIBYTE(*(_DWORD *)a1);
        goto LABEL_16;
      case 4:
        unint64_t v6 = *(unsigned int *)a1;
        unint64_t v24 = v6 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32);
        unint64_t v15 = v24 >> 8;
        unint64_t v68 = v24 >> 16;
        unsigned __int8 v16 = 0;
        unint64_t v67 = v24 >> 24;
        LOBYTE(v65) = 0;
        LOBYTE(v66) = *((unsigned char *)a1 + 4);
        goto LABEL_16;
      case 5:
        unint64_t v6 = *(unsigned int *)a1;
        unint64_t v25 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)a1 + 2) << 32);
        unint64_t v15 = v25 >> 8;
        unint64_t v68 = v25 >> 16;
        unsigned __int8 v16 = 0;
        LOWORD(v66) = *((_WORD *)a1 + 2);
        unint64_t v67 = v25 >> 24;
        int v65 = BYTE1(v66);
        goto LABEL_16;
      case 6:
        unsigned int v26 = *((unsigned __int16 *)a1 + 2) | (*((unsigned __int8 *)a1 + 6) << 16);
        unint64_t v6 = *(unsigned int *)a1;
        unint64_t v27 = v6 & 0xFF000000FFFFFFFFLL | ((*(void *)&v26 & 0xFFFFFFLL) << 32);
        unint64_t v15 = v27 >> 8;
        unint64_t v67 = v27 >> 24;
        unint64_t v68 = v27 >> 16;
        int v65 = v26 >> 8;
        LOWORD(v66) = *((_WORD *)a1 + 2);
        unsigned __int8 v16 = *((unsigned char *)a1 + 6);
        goto LABEL_16;
      case 7:
        goto LABEL_28;
      case 8:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v5) = 0;
        uint64_t v8 = 0;
        unint64_t v6 = *((unsigned __int8 *)a1 + 8);
        goto LABEL_22;
      case 9:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v5) = 0;
        uint64_t v8 = 0;
        unint64_t v6 = *((unsigned __int16 *)a1 + 4);
        LODWORD(v10) = v6 >> 8;
        goto LABEL_22;
      case 10:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v5) = 0;
        uint64_t v8 = 0;
        unint64_t v6 = *((unsigned __int16 *)a1 + 4) | (*((unsigned __int8 *)a1 + 10) << 16);
        LODWORD(v10) = v6 >> 8;
        LOBYTE(v11) = *((unsigned char *)a1 + 10);
        goto LABEL_22;
      case 11:
        LOBYTE(v13) = 0;
        LOBYTE(v5) = 0;
        uint64_t v8 = 0;
        unint64_t v6 = *((unsigned int *)a1 + 2);
        LODWORD(v10) = v6 >> 8;
        LODWORD(v11) = WORD1(v6);
        LODWORD(v12) = BYTE3(v6);
LABEL_22:
        unsigned __int32 v9 = a1;
        goto LABEL_27;
      case 12:
        LOBYTE(v5) = 0;
        uint64_t v8 = 0;
        uint64_t v13 = *((unsigned __int8 *)a1 + 12);
        unint64_t v6 = *((unsigned int *)a1 + 2);
        unint64_t v35 = v6 | (v13 << 32);
        unint64_t v10 = v35 >> 8;
        unint64_t v12 = v35 >> 24;
        unsigned __int32 v9 = a1;
        unint64_t v11 = v35 >> 16;
        goto LABEL_27;
      case 13:
        uint64_t v8 = 0;
        unint64_t v6 = *((unsigned int *)a1 + 2);
        LODWORD(v13) = *((unsigned __int16 *)a1 + 6);
        unint64_t v36 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)a1 + 6) << 32);
        unint64_t v10 = v36 >> 8;
        unint64_t v37 = v36 >> 16;
        unint64_t v12 = v36 >> 24;
        LODWORD(v5) = v13 >> 8;
        goto LABEL_26;
      case 14:
        LODWORD(v13) = *((unsigned __int16 *)a1 + 6) | (*((unsigned __int8 *)a1 + 14) << 16);
        unint64_t v6 = *((unsigned int *)a1 + 2);
        unint64_t v38 = v6 & 0xFF000000FFFFFFFFLL | ((v13 & 0xFFFFFF) << 32);
        unint64_t v10 = v38 >> 8;
        unint64_t v37 = v38 >> 16;
        unint64_t v12 = v38 >> 24;
        LODWORD(v5) = v13 >> 8;
        uint64_t v8 = *((unsigned __int8 *)a1 + 14);
LABEL_26:
        unsigned __int32 v9 = a1;
        LOBYTE(v11) = v37;
LABEL_27:
        uint64_t v14 = v4;
        goto LABEL_28;
      default:
        LOBYTE(v15) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        LOBYTE(v65) = 0;
        LOBYTE(v66) = 0;
        unsigned __int8 v16 = 0;
LABEL_16:
        uint64_t v14 = v4;
        goto LABEL_17;
    }
  }
  int64_t v17 = (int)a2 & 0xFFFFFFFFFFFFFFF0;
  *((void *)&v18 + 1) = (0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *a1) | ((0x87C37B91114253D5 * *a1) >> 33))) ^ v4;
  *(void *)&long long v18 = 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *a1) | ((0x87C37B91114253D5 * *a1) >> 33));
  uint64_t v19 = 5 * ((v18 >> 37) + v4);
  *((void *)&v18 + 1) = (0x87C37B91114253D5
                         * ((0x4E8B26FE00000000 * a1[1]) | ((unint64_t)(0x4CF5AD432745937FLL * a1[1]) >> 31))) ^ v4;
  *(void *)&long long v18 = 0x87C37B91114253D5
                  * ((0x4E8B26FE00000000 * a1[1]) | ((unint64_t)(0x4CF5AD432745937FLL * a1[1]) >> 31));
  uint64_t v14 = v19 + 1390208809;
  uint64_t v4 = 5 * (v14 + (v18 >> 33)) + 944331445;
  unsigned __int32 v9 = (uint64_t *)((char *)a1 + v17);
  if (v17 >= 17)
  {
    int32x2_t v20 = a1 + 2;
    do
    {
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      v20 += 2;
      uint64_t v14 = 5
          * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v22) | ((0x87C37B91114253D5 * v22) >> 33))) ^ v14, 37)+ v4)+ 1390208809;
      uint64_t v4 = 5
         * (v14
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v21) | ((unint64_t)(0x4CF5AD432745937FLL * v21) >> 31))) ^ v4, 33))+ 944331445;
    }
    while (v20 < v9);
  }
  uint64_t v23 = v5 - 1;
  unint64_t v6 = 0;
  LOBYTE(v10) = 0;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  LOBYTE(v13) = 0;
  LOBYTE(v5) = 0;
  uint64_t v8 = 0;
  switch(v23)
  {
    case 0:
      LOBYTE(v15) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      LOBYTE(v65) = 0;
      LOBYTE(v66) = 0;
      unsigned __int8 v16 = 0;
      LOBYTE(v6) = *(unsigned char *)v9;
      goto LABEL_17;
    case 1:
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      LOBYTE(v65) = 0;
      LOBYTE(v66) = 0;
      unsigned __int8 v16 = 0;
      LODWORD(v6) = *(unsigned __int16 *)v9;
      LODWORD(v15) = v6 >> 8;
      goto LABEL_17;
    case 2:
      LOBYTE(v66) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v65) = 0;
      unsigned __int8 v16 = 0;
      LODWORD(v6) = *(unsigned __int16 *)v9 | (*((unsigned __int8 *)v9 + 2) << 16);
      LODWORD(v15) = v6 >> 8;
      LOBYTE(v68) = *((unsigned char *)v9 + 2);
      goto LABEL_17;
    case 3:
      LOBYTE(v65) = 0;
      LOBYTE(v66) = 0;
      unsigned __int8 v16 = 0;
      LODWORD(v6) = *(_DWORD *)v9;
      LODWORD(v15) = *(_DWORD *)v9 >> 8;
      LODWORD(v68) = HIWORD(*(_DWORD *)v9);
      LODWORD(v67) = HIBYTE(*(_DWORD *)v9);
      goto LABEL_17;
    case 4:
      unsigned __int8 v16 = 0;
      unint64_t v6 = *(unsigned int *)v9;
      LOBYTE(v65) = 0;
      uint64_t v66 = *((unsigned __int8 *)v9 + 4);
      unint64_t v58 = v6 | (v66 << 32);
      unint64_t v15 = v58 >> 8;
      unint64_t v67 = v58 >> 24;
      unint64_t v68 = v58 >> 16;
      goto LABEL_17;
    case 5:
      unint64_t v6 = *(unsigned int *)v9;
      unint64_t v59 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v9 + 2) << 32);
      unint64_t v15 = v59 >> 8;
      unint64_t v68 = v59 >> 16;
      unsigned __int8 v16 = 0;
      unint64_t v67 = v59 >> 24;
      int v65 = HIBYTE(*((unsigned __int16 *)v9 + 2));
      LOWORD(v66) = *((_WORD *)v9 + 2);
      goto LABEL_17;
    case 6:
      unsigned int v60 = *((unsigned __int16 *)v9 + 2) | (*((unsigned __int8 *)v9 + 6) << 16);
      unint64_t v6 = *(unsigned int *)v9;
      unint64_t v61 = v6 & 0xFF000000FFFFFFFFLL | ((*(void *)&v60 & 0xFFFFFFLL) << 32);
      unint64_t v15 = v61 >> 8;
      unint64_t v68 = v61 >> 16;
      unsigned __int8 v16 = *((unsigned char *)v9 + 6);
      LOWORD(v66) = *((_WORD *)v9 + 2);
      unint64_t v67 = v61 >> 24;
      int v65 = v60 >> 8;
LABEL_17:
      unint64_t result = 0;
      unsigned __int8 v29 = 0;
      unsigned __int8 v30 = 0;
      unsigned __int8 v31 = 0;
      unsigned __int8 v32 = 0;
      unsigned __int8 v33 = 0;
      uint64_t v34 = 0;
      goto LABEL_30;
    case 7:
      goto LABEL_28;
    case 8:
      LOBYTE(v10) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      unint64_t v6 = *((unsigned __int8 *)v9 + 8);
      goto LABEL_28;
    case 9:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      unint64_t v6 = *((unsigned __int16 *)v9 + 4);
      LODWORD(v10) = v6 >> 8;
      goto LABEL_28;
    case 10:
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      unint64_t v6 = *((unsigned __int16 *)v9 + 4) | (*((unsigned __int8 *)v9 + 10) << 16);
      LODWORD(v10) = v6 >> 8;
      LOBYTE(v11) = *((unsigned char *)v9 + 10);
      goto LABEL_28;
    case 11:
      LOBYTE(v13) = 0;
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      unint64_t v6 = *((unsigned int *)v9 + 2);
      LODWORD(v10) = v6 >> 8;
      LODWORD(v11) = WORD1(v6);
      LODWORD(v12) = BYTE3(v6);
      goto LABEL_28;
    case 12:
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      uint64_t v13 = *((unsigned __int8 *)v9 + 12);
      unint64_t v6 = *((unsigned int *)v9 + 2);
      unint64_t v62 = v6 | (v13 << 32);
      unint64_t v10 = v62 >> 8;
      unint64_t v11 = v62 >> 16;
      unint64_t v12 = v62 >> 24;
      goto LABEL_28;
    case 13:
      uint64_t v8 = 0;
      LODWORD(v13) = *((unsigned __int16 *)v9 + 6);
      unint64_t v6 = *((unsigned int *)v9 + 2);
      unint64_t v63 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v9 + 6) << 32);
      unint64_t v10 = v63 >> 8;
      unint64_t v12 = v63 >> 24;
      LODWORD(v5) = v13 >> 8;
      unint64_t v11 = v63 >> 16;
      goto LABEL_28;
    case 14:
      LODWORD(v13) = *((unsigned __int16 *)v9 + 6) | (*((unsigned __int8 *)v9 + 14) << 16);
      unint64_t v6 = *((unsigned int *)v9 + 2);
      unint64_t v64 = v6 & 0xFF000000FFFFFFFFLL | ((v13 & 0xFFFFFF) << 32);
      unint64_t v10 = v64 >> 8;
      unint64_t v12 = v64 >> 24;
      LODWORD(v5) = v13 >> 8;
      uint64_t v8 = *((unsigned __int8 *)v9 + 14);
      unint64_t v11 = v64 >> 16;
LABEL_28:
      unint64_t v39 = *v9;
      unint64_t v40 = HIWORD(*v9);
      unint64_t v41 = (unint64_t)*v9 >> 40;
      unint64_t v42 = HIDWORD(v39);
      unint64_t v43 = v39 >> 24;
      unint64_t v44 = v39 >> 16;
      unint64_t v45 = v39 >> 8;
      unint64_t v46 = v39 & 0xFF00000000000000;
      goto LABEL_29;
    default:
      LOBYTE(v39) = 0;
      LOBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      LOBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      LOBYTE(v40) = 0;
      unint64_t v46 = 0;
      unint64_t v6 = 0;
      LOBYTE(v10) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      LOBYTE(v5) = 0;
      uint64_t v8 = 0;
      LOBYTE(v15) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      LOBYTE(v65) = 0;
      LOBYTE(v66) = 0;
      unint64_t result = 0;
      unsigned __int8 v29 = 0;
      unsigned __int8 v30 = 0;
      unsigned __int8 v31 = 0;
      unsigned __int8 v32 = 0;
      unsigned __int8 v33 = 0;
      uint64_t v34 = 0;
      unsigned __int8 v16 = 0;
      if (v71 < 8) {
        goto LABEL_30;
      }
LABEL_29:
      unint64_t result = v6;
      unint64_t v6 = v46 | v39 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v43 << 24) | ((unint64_t)v42 << 32) | ((unint64_t)v41 << 40) | ((unint64_t)v40 << 48);
      v14 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v6) | ((0x87C37B91114253D5 * v6) >> 33));
      LOBYTE(v6) = v39;
      LOBYTE(v15) = v45;
      LOBYTE(v67) = v43;
      LOBYTE(v68) = v44;
      LOBYTE(v65) = v41;
      LOBYTE(v66) = v42;
      unsigned __int8 v16 = v40;
      unsigned __int8 v29 = v10;
      unsigned __int8 v30 = v11;
      unsigned __int8 v31 = v12;
      unsigned __int8 v32 = v13;
      unsigned __int8 v33 = v5;
      uint64_t v34 = v8;
LABEL_30:
      unsigned int v48 = a2;
      int v47 = a4;
      switch(v71)
      {
        case 1u:
          unint64_t v49 = v6;
          goto LABEL_38;
        case 2u:
          unint64_t v49 = v6 | ((unint64_t)v15 << 8);
          goto LABEL_38;
        case 3u:
          unint64_t v49 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v68 << 16);
          goto LABEL_38;
        case 4u:
          unint64_t v49 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v68 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v67 << 24);
          goto LABEL_38;
        case 5u:
          unint64_t v49 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v68 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v67 << 24) | ((unint64_t)v66 << 32);
          goto LABEL_38;
        case 6u:
          unint64_t v49 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v68 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v67 << 24) | ((unint64_t)v66 << 32) | ((unint64_t)v65 << 40);
          goto LABEL_38;
        case 7u:
          unint64_t v49 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v68 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v67 << 24) | ((unint64_t)v66 << 32) | ((unint64_t)v65 << 40) | ((unint64_t)v16 << 48);
LABEL_38:
          v14 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v49) | ((0x87C37B91114253D5 * v49) >> 33));
          break;
        case 8u:
          break;
        case 9u:
          unint64_t v50 = result;
          goto LABEL_46;
        case 0xAu:
          unint64_t v50 = result | ((unint64_t)v29 << 8);
          goto LABEL_46;
        case 0xBu:
          unint64_t v50 = result | (unint64_t)(unsigned __int16)(v29 << 8) | ((unint64_t)v30 << 16);
          goto LABEL_46;
        case 0xCu:
          unint64_t v50 = result | (unint64_t)(unsigned __int16)(v29 << 8) | ((unint64_t)v30 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v31 << 24);
          goto LABEL_46;
        case 0xDu:
          unint64_t v50 = result | (unint64_t)(unsigned __int16)(v29 << 8) | ((unint64_t)v30 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v31 << 24) | ((unint64_t)v32 << 32);
          goto LABEL_46;
        case 0xEu:
          unint64_t v50 = result | (unint64_t)(unsigned __int16)(v29 << 8) | ((unint64_t)v30 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v31 << 24) | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40);
          goto LABEL_46;
        case 0xFu:
          unint64_t v50 = result | (unint64_t)(unsigned __int16)(v29 << 8) | ((unint64_t)v30 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v31 << 24) | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | (v34 << 48);
LABEL_46:
          v4 ^= 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v50) | ((0x4CF5AD432745937FLL * v50) >> 31));
          break;
        default:
          unsigned int v48 = a2;
          int v47 = a4;
          break;
      }
      uint64_t v51 = v4 ^ v48;
      unint64_t v52 = v51 + (v14 ^ v48);
      unint64_t v53 = v52 + v51;
      unint64_t v54 = 0xC4CEB9FE1A85EC53
          * ((0xFF51AFD7ED558CCDLL * (v52 ^ (v52 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v52 ^ (v52 >> 33))) >> 33));
      unint64_t v55 = 0xC4CEB9FE1A85EC53
          * ((0xFF51AFD7ED558CCDLL * (v53 ^ (v53 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v53 ^ (v53 >> 33))) >> 33));
      unint64_t v56 = v55 ^ (v55 >> 33);
      unint64_t v57 = v56 + (v54 ^ (v54 >> 33));
      unint64_t *v47 = v57;
      v47[1] = v57 + v56;
      return result;
  }
}

void sub_1A32F29A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id procNameForPid(int a1, int *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *__error() = 0;
  getpid();
  int v4 = sandbox_check();
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v5 = 0;
      *a2 = 0;
    }
    else
    {
      uint64_t v7 = __error();
      uint64_t v5 = 0;
      *a2 = *v7;
    }
  }
  else
  {
    *__error() = 0;
    unsigned int v6 = proc_name(a1, buffer, 0x400u);
    if (a2) {
      *a2 = *__error();
    }
    if ((v6 & 0x80000000) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v6 encoding:4];
    }
  }

  return v5;
}

void sub_1A32F3D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32F48CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32F6148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_1A32F6660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32F6760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A32F6860(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A32F81D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__824(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__825(uint64_t a1)
{
}

void _PASCompactStringArrayCreate()
{
}

void _PASCompactStringArrayAppendString(uint64_t a1, char *__s)
{
  if (a1)
  {
    if (__s) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
    [v7 handleFailureInFunction:v8, @"_PASCompactStringArray.mm", 41, @"Invalid parameter not satisfying: %@", @"array" file lineNumber description];

    if (__s) {
      goto LABEL_3;
    }
  }
  unsigned __int32 v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
  [v9 handleFailureInFunction:v10, @"_PASCompactStringArray.mm", 42, @"Invalid parameter not satisfying: %@", @"string" file lineNumber description];

LABEL_3:
  size_t v4 = strlen(__s);
  unsigned int v5 = v4;
  unsigned int v6 = *(char **)(a1 + 8);
  if ((unint64_t)&v6[v4 - *(void *)a1 - 4294967292u] <= 0xFFFFFFFEFFFFFFFFLL)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
    [v11 handleFailureInFunction:v12, @"_PASCompactStringArray.mm", 45, @"Invalid parameter not satisfying: %@", @"array->buffer.size() + szStringSize + sizeof(uint32_t) <= UINT32_MAX" file lineNumber description];

    unsigned int v6 = *(char **)(a1 + 8);
  }
  unsigned int __src = v5;
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, v6, (char *)&__src, (char *)&v14, 4);
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, *(char **)(a1 + 8), __s, &__s[__src], __src);
}

void sub_1A32F8774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v10 = *(unsigned char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15) {
      unsigned __int8 v16 = (char *)operator new(v15);
    }
    else {
      unsigned __int8 v16 = 0;
    }
    unsigned int v26 = &v13[(void)v16];
    memcpy(&v13[(void)v16], __src, a5);
    if (v11 == __dst)
    {
      unint64_t v27 = &v13[(void)v16];
    }
    else
    {
      do
      {
        v13[(void)v16 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = *(unsigned char **)(a1 + 8);
      unint64_t v27 = v16;
    }
    unsigned int v28 = &v26[a5];
    unsigned __int8 v29 = &v16[v15];
    if (v10 != __dst) {
      memmove(v28, __dst, v10 - __dst);
    }
    unsigned __int8 v30 = *(char **)a1;
    *(void *)a1 = v27;
    *(void *)(a1 + 8) = &v28[v10 - __dst];
    *(void *)(a1 + 16) = v29;
    if (v30)
    {
      operator delete(v30);
    }
    return;
  }
  uint64_t v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    long long v18 = &__src[a5];
    int32x2_t v20 = *(unsigned char **)(a1 + 8);
LABEL_17:
    uint64_t v21 = &__dst[a5];
    uint64_t v22 = &v20[-a5];
    uint64_t v23 = v20;
    if (&v20[-a5] < v10)
    {
      unint64_t v24 = (char *)(&v10[a5] - v20);
      uint64_t v23 = v20;
      do
      {
        char v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(void *)(a1 + 8) = v23;
    if (v20 != v21) {
      memmove(&__dst[a5], __dst, v20 - v21);
    }
    if (v18 != __src)
    {
      memmove(__dst, __src, v18 - __src);
    }
    return;
  }
  long long v18 = &__src[v17];
  int64_t v19 = a4 - &__src[v17];
  if (a4 != &__src[v17]) {
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  }
  int32x2_t v20 = &v10[v19];
  *(void *)(a1 + 8) = &v10[v19];
  if (v17 >= 1) {
    goto LABEL_17;
  }
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5AEA3C8, MEMORY[0x1E4FBA1C8]);
}

void sub_1A32F8A30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void _PASCompactStringArrayMinimizeSpace(unint64_t *a1)
{
  if (!a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v2 = [NSString stringWithUTF8String:"void _PASCompactStringArrayMinimizeSpace(struct _PASCompactStringArray * _Nonnull)"];
    [v1 handleFailureInFunction:v2, @"_PASCompactStringArray.mm", 56, @"Invalid parameter not satisfying: %@", @"array" file lineNumber description];

    a1 = 0;
  }

  std::vector<unsigned char>::shrink_to_fit(a1);
}

void sub_1A32F8B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::shrink_to_fit(unint64_t *a1)
{
  uint64_t v1 = (char *)a1[1];
  unint64_t v2 = *a1;
  uint64_t v3 = &v1[-*a1];
  if (a1[2] - *a1 > (unint64_t)v3)
  {
    if (v1 == (char *)v2)
    {
      unint64_t v5 = (unint64_t)&v1[-*a1];
    }
    else
    {
      unint64_t v5 = (unint64_t)operator new((size_t)&v1[-*a1]);
      v3 += v5;
      unsigned int v6 = &v1[~v2];
      do
      {
        char v7 = *--v1;
        (v6--)[v5] = v7;
      }
      while (v1 != (char *)v2);
    }
    *a1 = v5;
    a1[1] = (unint64_t)v3;
    a1[2] = (unint64_t)v3;
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t _PASCompactStringArrayFindStringWithSize(uint64_t *a1, void *__s1, size_t __n)
{
  if (a1)
  {
    if (__s1) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "size_t _PASCompactStringArrayFindStringWithSize(const struct _PASCompactStringArray * _Nonnull, const char * _Nonnull, size_t)");
    [v18 handleFailureInFunction:v19, @"_PASCompactStringArray.mm", 62, @"Invalid parameter not satisfying: %@", @"array" file lineNumber description];

    if (__s1) {
      goto LABEL_3;
    }
  }
  int32x2_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "size_t _PASCompactStringArrayFindStringWithSize(const struct _PASCompactStringArray * _Nonnull, const char * _Nonnull, size_t)");
  [v20 handleFailureInFunction:v21, @"_PASCompactStringArray.mm", 63, @"Invalid parameter not satisfying: %@", @"string" file lineNumber description];

LABEL_3:
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = v6 - *a1;
  if (v6 == *a1) {
    return -1;
  }
  unsigned int v10 = *((_DWORD *)a1 + 6);
  unsigned int v9 = *((_DWORD *)a1 + 7);
  unsigned int v11 = v10;
  while (1)
  {
    uint64_t v12 = (unsigned int *)(v7 + v11);
    uint64_t v13 = *v12;
    if (v13 == __n && !memcmp(__s1, v12 + 1, __n)) {
      break;
    }
    uint64_t v14 = v11 + v13 + 4;
    if (v8 == v14) {
      unsigned int v9 = 0;
    }
    else {
      ++v9;
    }
    if (v8 == v14) {
      unsigned int v11 = 0;
    }
    else {
      v11 += v13 + 4;
    }
    if (v11 == v10) {
      return -1;
    }
  }
  if (*((_DWORD *)a1 + 8) == -1)
  {
    *((_DWORD *)a1 + 8) = v11;
    *((_DWORD *)a1 + 9) = v9;
  }
  uint64_t v16 = v11 + v13 + 4;
  if (v8 == v16) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v9 + 1;
  }
  if (v8 == v16) {
    LODWORD(v16) = 0;
  }
  *((_DWORD *)a1 + 6) = v16;
  *((_DWORD *)a1 + 7) = v17;
  return v9;
}

void sub_1A32F8DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _PASCompactStringArrayFindString(uint64_t *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return _PASCompactStringArrayFindStringWithSize(a1, __s, v4);
}

double _PASCompactStringArrayResetSearchHint(_DWORD *a1)
{
  if (!a1)
  {
    size_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"void _PASCompactStringArrayResetSearchHint(const struct _PASCompactStringArray * _Nonnull)"];
    [v4 handleFailureInFunction:v5, @"_PASCompactStringArray.mm", 116, @"Invalid parameter not satisfying: %@", @"array" file lineNumber description];
  }
  int v2 = a1[8];
  if (v2 != -1)
  {
    int v3 = a1[9];
    a1[6] = v2;
    a1[7] = v3;
    double result = NAN;
    *((void *)a1 + 4) = -1;
  }
  return result;
}

void sub_1A32F8EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<proactive::pas::SynchronizedObject<anonymous namespace'::HDGuardedData,proactive::pas::detail::RecursiveMutex>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *double result = a2;
  if (v2)
  {
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
    JUMPOUT(0x1A62449C0);
  }
  return result;
}

void sub_1A32F90E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  pthread_mutex_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1A32F93D8(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v3);
  _Unwind_Resume(a1);
}

void _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = (a2 + 7) >> 3;
  uint64_t v6 = *(char **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v8 = (v7 - *(void *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8) {
      goto LABEL_21;
    }
    uint64_t v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  unint64_t v9 = v5 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    uint64_t v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(void *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  if ((a2 + 7) >> 62) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v11 = v10 - (void)v6;
  if (v11 >> 4 > v5) {
    unint64_t v5 = v11 >> 4;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v5;
  }
  _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v12, v8, a1 + 16);
  uint64_t v13 = (char *)v34[0];
  bzero(v34[0], 32 * v9);
  uint64_t v14 = &v13[32 * v9];
  v34[0] = v14;
  uint64_t v16 = *(char **)a1;
  size_t v15 = *(char **)(a1 + 8);
  unsigned int v17 = v33;
  if (v15 == *(char **)a1)
  {
    int32x2_t v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      long long v18 = *((_OWORD *)v15 - 2);
      long long v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *((_OWORD *)v17 - 2) = v18;
      *((_OWORD *)v17 - 1) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    int32x2_t v20 = *(char **)a1;
    size_t v15 = *(char **)(a1 + 8);
    uint64_t v14 = (char *)v34[0];
  }
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v14;
  uint64_t v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v34[1];
  v34[0] = v15;
  v34[1] = v22;
  unsigned __int8 v32 = v20;
  unsigned __int8 v33 = v20;
  if (v15 != v20) {
    v34[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  }
  if (v20) {
    free(v20);
  }
LABEL_21:
  *(void *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    unint64_t v23 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
    if (v23 < (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 5)
    {
      _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v23, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5, a1 + 16);
      char v25 = *(char **)a1;
      unint64_t v24 = *(char **)(a1 + 8);
      unsigned int v26 = v33;
      if (v24 == *(char **)a1)
      {
        unsigned __int8 v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          long long v27 = *((_OWORD *)v24 - 2);
          long long v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *((_OWORD *)v26 - 2) = v27;
          *((_OWORD *)v26 - 1) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        unsigned __int8 v29 = *(char **)a1;
        unint64_t v24 = *(char **)(a1 + 8);
      }
      *(void *)a1 = v26;
      unsigned __int8 v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v34;
      v34[0] = v24;
      v34[1] = v30;
      unsigned __int8 v32 = v29;
      unsigned __int8 v33 = v29;
      if (v24 != v29) {
        v34[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      }
      if (v29) {
        free(v29);
      }
    }
    uint64_t v31 = *(void *)(a1 + 24);
    if (v31) {
      bzero((void *)(*(void *)a1 + 4 * v31), *(void *)(a1 + 8) - (*(void *)a1 + 4 * v31));
    }
  }
}

void sub_1A32F964C(void *a1)
{
}

void _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = (a2 + 7) >> 3;
  uint64_t v6 = *(char **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v8 = (v7 - *(void *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8) {
      goto LABEL_21;
    }
    uint64_t v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  unint64_t v9 = v5 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    uint64_t v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(void *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  if ((a2 + 7) >> 62) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v11 = v10 - (void)v6;
  if (v11 >> 4 > v5) {
    unint64_t v5 = v11 >> 4;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v5;
  }
  _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v12, v8, a1 + 16);
  uint64_t v13 = (char *)v34[0];
  bzero(v34[0], 32 * v9);
  uint64_t v14 = &v13[32 * v9];
  v34[0] = v14;
  uint64_t v16 = *(char **)a1;
  size_t v15 = *(char **)(a1 + 8);
  unsigned int v17 = v33;
  if (v15 == *(char **)a1)
  {
    int32x2_t v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      long long v18 = *((_OWORD *)v15 - 2);
      long long v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *((_OWORD *)v17 - 2) = v18;
      *((_OWORD *)v17 - 1) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    int32x2_t v20 = *(char **)a1;
    size_t v15 = *(char **)(a1 + 8);
    uint64_t v14 = (char *)v34[0];
  }
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v14;
  uint64_t v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v34[1];
  v34[0] = v15;
  v34[1] = v22;
  unsigned __int8 v32 = v20;
  unsigned __int8 v33 = v20;
  if (v15 != v20) {
    v34[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  }
  if (v20) {
    free(v20);
  }
LABEL_21:
  *(void *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    unint64_t v23 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
    if (v23 < (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 5)
    {
      _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v23, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5, a1 + 16);
      char v25 = *(char **)a1;
      unint64_t v24 = *(char **)(a1 + 8);
      unsigned int v26 = v33;
      if (v24 == *(char **)a1)
      {
        unsigned __int8 v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          long long v27 = *((_OWORD *)v24 - 2);
          long long v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *((_OWORD *)v26 - 2) = v27;
          *((_OWORD *)v26 - 1) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        unsigned __int8 v29 = *(char **)a1;
        unint64_t v24 = *(char **)(a1 + 8);
      }
      *(void *)a1 = v26;
      unsigned __int8 v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v34;
      v34[0] = v24;
      v34[1] = v30;
      unsigned __int8 v32 = v29;
      unsigned __int8 v33 = v29;
      if (v24 != v29) {
        v34[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      }
      if (v29) {
        free(v29);
      }
    }
    uint64_t v31 = *(void *)(a1 + 24);
    if (v31) {
      bzero((void *)(*(void *)a1 + 4 * v31), *(void *)(a1 + 8) - (*(void *)a1 + 4 * v31));
    }
  }
}

void sub_1A32F9868(void *a1)
{
}

void *_ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    memptr = 0;
    if (malloc_type_posix_memalign(&memptr, 0x40uLL, 32 * a2, 0x1000040E0EAB150uLL))
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v11 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v11, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
    }
    uint64_t v7 = (char *)memptr;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = &v7[32 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[32 * a2];
  return a1;
}

void sub_1A32F99DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A32F9AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A32F9CC0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A32F9E44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A32F9F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A32FA028(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

float entropy(uint64_t ***a1, int a2, int a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  if (a2 != 0xFFFF && a3 != 0xFFFF) {
    return v3;
  }
  size_t v8 = (**a1)[1] - ***a1;
  unint64_t v9 = v8 | 0xF;
  memptr = 0;
  uint64_t v43 = 0;
  if ((v8 | 0xF) > 0x800)
  {
    uint64_t v10 = malloc_type_posix_memalign(&memptr, 0x10uLL, v8, 0xE01A67FCuLL);
    LOBYTE(v43) = 0;
    if (v10)
    {
      id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v39);
    }
    uint64_t v11 = (float *)memptr;
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    bzero((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v8 | 0xF);
    uint64_t v11 = (float *)(((unint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  size_t v12 = v8 | 3;
  memptr = 0;
  uint64_t v43 = 0;
  if ((v8 | 3) > 0x800)
  {
    int v38 = malloc_type_posix_memalign(&memptr, 8uLL, v8, 0x26506326uLL);
    LOBYTE(v43) = 0;
    if (v38)
    {
      id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v40);
    }
    uint64_t v13 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1F4188790](v10);
    uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v12);
  }
  if ((a3 & a2) == 0xFFFF)
  {
    uint64_t v14 = **a1;
    uint64_t v15 = *v14;
    if (v14[1] == *v14)
    {
      float32x4_t v17 = 0uLL;
      float32x4_t v18 = 0uLL;
    }
    else
    {
      unint64_t v16 = 0;
      float32x4_t v17 = 0uLL;
      float32x4_t v18 = 0uLL;
      do
      {
        long long v19 = (float32x4_t *)(v15 + 32 * v16);
        float32x4_t v20 = *v19;
        float32x4_t v21 = v19[1];
        float32x4_t v18 = vaddq_f32(v18, v21);
        float32x4_t v17 = vaddq_f32(v17, *v19);
        uint64_t v22 = (float32x4_t *)&v11[8 * v16];
        *uint64_t v22 = v20;
        v22[1] = v21;
        ++v16;
        uint64_t v14 = **a1;
        uint64_t v15 = *v14;
      }
      while (v16 < (v14[1] - *v14) >> 5);
    }
    int v26 = *((_DWORD *)v14 + 6);
    int8x16_t v35 = (int8x16_t)vaddq_f32(v17, v18);
    double v28 = vaddv_f32(vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL)));
LABEL_30:
    if (v26 < 1)
    {
      float v3 = 0.0;
    }
    else
    {
      float v36 = v28;
      cblas_sscal(v26, 1.0 / v36, v11, 1);
      LODWORD(memptr) = (v26 + 7) & 0xFFFFFFF8;
      vvlog2f((float *)v13, v11, (const int *)&memptr);
      float v3 = -cblas_sdot(v26, v11, 1, (const float *)v13, 1);
    }
    goto LABEL_33;
  }
  if (a2 == 0xFFFF)
  {
    unint64_t v23 = **a1;
    unint64_t v24 = v23[3];
    if (v24)
    {
      uint64_t v25 = 0;
      int v26 = 0;
      uint64_t v27 = v23[4];
      double v28 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v27 + 4 * v25) == a3)
        {
          float v29 = *(float *)(*v23 + 4 * v25);
          double v28 = v28 + v29;
          v11[v26++] = v29;
        }
        ++v25;
      }
      while (v24 > v25);
      goto LABEL_30;
    }
  }
  else
  {
    unsigned __int8 v30 = **a1;
    unint64_t v31 = v30[3];
    if (v31)
    {
      uint64_t v32 = 0;
      int v26 = 0;
      uint64_t v33 = v30[4];
      double v28 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v33 + 4 * v32 + 2) == a2)
        {
          float v34 = *(float *)(*v30 + 4 * v32);
          double v28 = v28 + v34;
          v11[v26++] = v34;
        }
        ++v32;
      }
      while (v31 > v32);
      goto LABEL_30;
    }
  }
LABEL_33:
  if (v12 >= 0x801) {
    free(v13);
  }
  if (v9 >= 0x801) {
    free(v11);
  }
  if (fabsf(v3) == INFINITY) {
    return 0.0;
  }
  return v3;
}

void sub_1A32FA63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A32FA880(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A32FA900(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A32FAA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t *_PASRngSeed64(unint64_t *result, unint64_t a2)
{
  unint64_t v2 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((a2 | 1) ^ (a2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * ((a2 | 1) ^ (a2 >> 30))) >> 27));
  unint64_t v3 = 0x63660277528772BBLL
     * ((0x3CD0EB9D47532DFBLL * ((a2 | 1) ^ (a2 >> 29))) ^ ((0x3CD0EB9D47532DFBLL * ((a2 | 1) ^ (a2 >> 29))) >> 26));
  *double result = v2 ^ (v2 >> 31);
  result[1] = v3 ^ (v3 >> 33);
  return result;
}

void _PASBuddyAllocatorCreateWithAlignedBuffer(char a1, unint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((a1 & 0xF) != 0)
  {
    size_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "struct _PASBuddyAllocator *_PASBuddyAllocatorCreateWithAlignedBuffer(void * _Nonnull, size_t)");
    [v8 handleFailureInFunction:v9 file:@"_PASBuddyAllocator.mm" lineNumber:691 description:@"_PASBuddyAllocator buffer must be 16-byte aligned."];
  }
  LODWORD(v3) = -1;
  do
  {
    unint64_t v4 = (_anonymous_namespace_ *)proactive::pas::buddyalloc::heapSizeForLevels((proactive::pas::buddyalloc *)(v3 + 2));
    unint64_t v3 = (proactive::pas::buddyalloc *)(v3 + 1);
  }
  while ((unint64_t)v4 <= a2);
  if (v3) {
    unint64_t v5 = {;
  }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v11 = proactive::pas::buddyalloc::heapSizeForLevels(v3);
      __int16 v12 = 2048;
      unint64_t v13 = a2;
      _os_log_debug_impl(&dword_1A32C4000, v5, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator selecting heap size %zu to fit in buffer of size %zu.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "struct _PASBuddyAllocator *_PASBuddyAllocatorCreateWithAlignedBuffer(void * _Nonnull, size_t)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_PASBuddyAllocator.mm", 694, @"_PASBuddyAllocator can't create heap of size %zu bytes.", a2);
  }
  operator new();
}

void sub_1A32FD9FC(_Unwind_Exception *a1)
{
  MEMORY[0x1A62449C0](v1, 0x10F0C407B7769EDLL);
  _Unwind_Resume(a1);
}

unint64_t proactive::pas::buddyalloc::heapSizeForLevels(proactive::pas::buddyalloc *this)
{
  if (this)
  {
    char v1 = (_BYTE)this - 1;
  }
  else
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v4 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
    [v3 handleFailureInFunction:v4, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];

    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::bitmapSizeForLevels"];
    [v5 handleFailureInFunction:v6, @"_PASBuddyAllocatorPOD.h", 77, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];

    char v1 = -1;
  }
  return (16 << v1) + 2 * ((unint64_t)((1 << v1) + 7) >> 3);
}

void sub_1A32FDBBC(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id anonymous namespace'::logHandle(_anonymous_namespace_ *this)
{
  return v1;
}

void ___ZN12_GLOBAL__N_19logHandleEv_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1A62450A0]();
  os_log_t v1 = os_log_create("com.apple.proactive", "buddyalloc");
}

uint64_t _PASBuddyAllocatorDestroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 56);
    if (v1) {
      MEMORY[0x1A62449A0](v1, 0x20C8093837F09);
    }
    JUMPOUT(0x1A62449C0);
  }
  return result;
}

uint64_t *anonymous namespace'::BuddyAllocator::alloc(os_unfair_lock_s *this, unint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  int v4 = 0;
  uint32_t os_unfair_lock_opaque = this[2]._os_unfair_lock_opaque;
  uint32_t v6 = os_unfair_lock_opaque - 1;
  while (v6 != v4)
  {
    unint64_t v7 = 16 << v4++;
    if (v7 >= a2)
    {
      unsigned int v8 = os_unfair_lock_opaque - v4;
      char v9 = os_unfair_lock_opaque - v4 + 1;
      goto LABEL_7;
    }
  }
  unsigned int v8 = 0;
  unint64_t v7 = 16 << v6;
  char v9 = 1;
LABEL_7:
  if (v7 < a2) {
    uint64_t v10 = {;
  }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)&this->_os_unfair_lock_opaque;
      uint64_t v21 = proactive::pas::buddyalloc::blockStorageSizeForLevels((proactive::pas::buddyalloc *)this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v20;
      __int16 v30 = 2048;
      unint64_t v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_error_impl(&dword_1A32C4000, v10, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx failed request to allocate %zu bytes on heap of size %zu", buf, 0x20u);
    }
LABEL_22:

    return 0;
  }
  *(void *)buf = this + 16;
  unint64_t v11 = this + 18;
  os_unfair_lock_lock(this + 18);
  if (!v12)
  {
    uint64_t v10 = os_unfair_lock_unlock(this + 18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)&this->_os_unfair_lock_opaque;
      uint64_t v23 = proactive::pas::buddyalloc::blockStorageSizeForLevels((proactive::pas::buddyalloc *)this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v30 = 2048;
      unint64_t v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = v23;
      _os_log_debug_impl(&dword_1A32C4000, v10, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx out of memory while requesting %zu bytes on heap of size %zu", buf, 0x20u);
    }
    goto LABEL_22;
  }
  uint32_t v13 = this[2]._os_unfair_lock_opaque;
  uint64_t v14 = *(void **)&this[16]._os_unfair_lock_opaque;
  uint64_t v15 = v14[2];
  unint64_t v16 = (16 << (v13 - v9)) + v15;
  if (v16 <= v14[3]) {
    uint64_t v17 = v14[3];
  }
  else {
    uint64_t v17 = (16 << (v13 - v9)) + v15;
  }
  v14[2] = v16;
  v14[3] = v17;
  ++v14[4];
  if (!v13)
  {
    unint64_t v28 = v16;
    unint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
    [v24 handleFailureInFunction:v25, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];

    LOBYTE(v13) = 0;
    unint64_t v16 = v28;
  }
  if (v16 > 16 << (v13 - 1))
  {
    int v26 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"void *(anonymous namespace)::BuddyAllocator::allocBlock"];
    [v26 handleFailureInFunction:v27 file:@"_PASBuddyAllocator.mm" lineNumber:231 description:@"bytes allocated exceeded heap size"];
  }
  os_unfair_lock_unlock(v11);
  return v12;
}

void sub_1A32FE00C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t proactive::pas::buddyalloc::blockStorageSizeForLevels(proactive::pas::buddyalloc *this)
{
  char v1 = (char)this;
  if (!this)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
    [v3 handleFailureInFunction:v4, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];
  }
  return 16 << (v1 - 1);
}

void sub_1A32FE104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *anonymous namespace'::BuddyAllocator::allocBlock_locked(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  uint64_t v6 = a3;
  unint64_t v7 = *(uint64_t **)(*(void *)(*(void *)*a2 + 40) + 8 * a3);
  if (v7)
  {
LABEL_2:
    return v7;
  }
  if (!a3) {
    return 0;
  }
  char v9 = a3 - 1;
  unint64_t v7 = (uint64_t *)v10;
  if (v10)
  {
    unint64_t v11 = *(void **)*a2;
    int v12 = *(_DWORD *)(a1 + 8);
    int v13 = ~(-1 << v9);
    unint64_t v14 = (unint64_t)(((unint64_t)(v10 - *(void *)a1) >> (v12
                                                                                      - a3
                                                                                      + 4))
                           + v13) >> 3;
    int v15 = 1 << ((((unint64_t)(v10 - *(void *)a1) >> (v12 - a3 + 4))
               + ~(-1 << v9)) & 7);
    if ((v15 & *(unsigned char *)(*v11 + v14)) != 0)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::splitBlock(SyncPtr &, void *, unsigned int)");
      [v20 handleFailureInFunction:v23 file:@"_PASBuddyAllocator.mm" lineNumber:177 description:@"splitBlock called on an already-split block"];

      unint64_t v11 = *(void **)*a2;
      int v12 = *(_DWORD *)(a1 + 8);
      unsigned int v21 = (((unint64_t)v7 - *(void *)a1) >> (v12 - a3 + 4)) + v13;
      unint64_t v14 = v21 >> 3;
      int v15 = 1 << (v21 & 7);
    }
    if ((v15 & *(unsigned char *)(v11[1] + v14)) != 0)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::splitBlock(SyncPtr &, void *, unsigned int)");
      [v22 handleFailureInFunction:v24 file:@"_PASBuddyAllocator.mm" lineNumber:178 description:@"splitBlock called on a block with an allocated child"];

      int v12 = *(_DWORD *)(a1 + 8);
    }
    unint64_t v16 = (uint64_t *)((char *)v7 + (16 << (v12 + ~(_BYTE)a3)));
    void *v16 = 0;
    v16[1] = 0;
    *(void *)(*(void *)(*(void *)*a2 + 40) + 8 * v6) = v16;
    *unint64_t v7 = 0;
    v7[1] = 0;
    *(void *)(*(void *)(*(void *)*a2 + 40) + 8 * v6) = v7;
    unint64_t v17 = (unint64_t)((((unint64_t)v7 - *(void *)a1) >> (*(_DWORD *)(a1 + 8)
                                                                                     - a3
                                                                                     + 4))
                           + v13) >> 3;
    *(unsigned char *)(**(void **)*a2 + v17) |= 1 << (((((unint64_t)v7 - *(void *)a1) >> (*(_DWORD *)(a1 + 8)
                                                                                           - a3
                                                                                           + 4))
                                               + v13) & 7);
    unint64_t v7 = *(uint64_t **)(*(void *)(*(void *)*a2 + 40) + 8 * v6);
    if (!v7)
    {
      float32x4_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void *(anonymous namespace)::BuddyAllocator::allocBlock_locked(SyncPtr &, unsigned int)");
      [v18 handleFailureInFunction:v19 file:@"_PASBuddyAllocator.mm" lineNumber:212 description:@"allocBlock expected non-empty freeList"];

      unint64_t v7 = *(uint64_t **)(*(void *)(*(void *)*a2 + 40) + 8 * v6);
    }
    goto LABEL_2;
  }
  return v7;
}

void sub_1A32FE46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *anonymous namespace'::insertAtHead(void *a1, void *a2)
{
  if (a2)
  {
    if (!a1) {
      return a2;
    }
  }
  else
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    unsigned int v8 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    [v7 handleFailureInFunction:v8, @"_PASBuddyAllocator.mm", 56, @"Invalid parameter not satisfying: %@", @"node" file lineNumber description];

    if (!a1) {
      return a2;
    }
  }
  if (*a1)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    [v9 handleFailureInFunction:v10 file:@"_PASBuddyAllocator.mm" lineNumber:58 description:@"insertAtHead: oldHead is not list head"];
  }
  if (*a2 || a2[1])
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    [v5 handleFailureInFunction:v6 file:@"_PASBuddyAllocator.mm" lineNumber:59 description:@"removeNode: unexpectedly inserting linked node"];
  }
  a2[1] = a1;
  *a1 = a2;
  return a2;
}

void sub_1A32FE628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *anonymous namespace'::removeNode(uint64_t *a1, uint64_t *a2)
{
  unint64_t v3 = a1;
  if (a1)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
    [v9 handleFailureInFunction:v10, @"_PASBuddyAllocator.mm", 68, @"Invalid parameter not satisfying: %@", @"oldHead" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  int v12 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
  [v11 handleFailureInFunction:v12, @"_PASBuddyAllocator.mm", 69, @"Invalid parameter not satisfying: %@", @"node" file lineNumber description];

LABEL_3:
  if (*v3)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
    [v13 handleFailureInFunction:v14 file:@"_PASBuddyAllocator.mm" lineNumber:70 description:@"removeNode: oldHead is not list head"];
  }
  if (v3 == a2)
  {
    unint64_t v3 = (uint64_t *)v3[1];
    goto LABEL_10;
  }
  uint64_t v4 = *a2;
  if (!*a2)
  {
    if (!a2[1])
    {
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
      [v5 handleFailureInFunction:v6 file:@"_PASBuddyAllocator.mm" lineNumber:71 description:@"removeNode: unexpectedly removing unlinked node from nontrivial list"];
    }
LABEL_10:
    uint64_t v4 = *a2;
    if (!*a2) {
      goto LABEL_12;
    }
  }
  *(void *)(v4 + 8) = a2[1];
LABEL_12:
  unint64_t v7 = (void *)a2[1];
  if (v7) {
    *unint64_t v7 = v4;
  }
  *a2 = 0;
  a2[1] = 0;
  return v3;
}

void sub_1A32FE860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::BuddyAllocator::toggleBuddyAllocationState(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    unint64_t v4 = (unint64_t)(((unint64_t)(a3 - *(void *)result) >> (*(_DWORD *)(result + 8)
                                                                                        - a4
                                                                                        + 4))
                          + ~(-1 << (a4 - 1))) >> 3;
    *(unsigned char *)(*(void *)(*(void *)a2 + 8) + v4) ^= 1 << ((((unint64_t)(a3 - *(void *)result) >> (*(_DWORD *)(result + 8) - a4 + 4))
                                                              + ~(-1 << (a4 - 1))) & 7);
  }
  return result;
}

uint64_t *_PASBuddyAllocatorAllocZeros(os_unfair_lock_s *a1, unint64_t a2)
{
  unint64_t v4 = v3;
  if (v3) {
    bzero(v3, a2);
  }
  return v4;
}

uint64_t *_PASBuddyAllocatorRealloc(os_unfair_lock_s *this, void *a2, unint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      if (v6)
      {
        if (v7 >= a3) {
          size_t v8 = a3;
        }
        else {
          size_t v8 = v7;
        }
        memcpy(v6, a2, v8);
      }
    }
    else
    {
      return 0;
    }
    return v6;
  }
  else
  {
  }
}

void anonymous namespace'::BuddyAllocator::free(os_unfair_lock_s *this, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = (uint64_t *)a2;
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"void (anonymous namespace)::BuddyAllocator::free(const void *)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"_PASBuddyAllocator.mm", 600, @"Attempt to free block %p which does not lie in the _PASBuddyAllocator heap at %p", v2, *(void *)&this->_os_unfair_lock_opaque);
    }
    unint64_t v4 = this + 16;
    lock = this + 18;
    os_unfair_lock_lock(this + 18);
    int v30 = v5;
    while (1)
    {
      if (!v5) {
        break;
      }
      uint64_t v6 = *(void *)&this[16]._os_unfair_lock_opaque;
      unint64_t v7 = (unint64_t)v2 - *(void *)&this->_os_unfair_lock_opaque;
      uint32_t os_unfair_lock_opaque = this[2]._os_unfair_lock_opaque;
      int v9 = ~(-1 << (v5 - 1));
      unint64_t v10 = (v7 >> (os_unfair_lock_opaque - v5 + 4)) + v9;
      if ((*(unsigned __int8 *)(*(void *)(v6 + 8) + (v10 >> 3)) >> (v10 & 7))) {
        break;
      }
      char v11 = os_unfair_lock_opaque + ~(_BYTE)v5;
      if (((v7 >> v11) & 0x10) != 0) {
        uint64_t v12 = -16;
      }
      else {
        uint64_t v12 = 16;
      }
      int v13 = (uint64_t *)((char *)v2 + (v12 << v11));
      if (v13 < v2) {
        unint64_t v2 = v13;
      }
      uint64_t v14 = **(void **)&this[16]._os_unfair_lock_opaque;
      unint64_t v15 = (unint64_t)((((unint64_t)v2 - *(void *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque - v5 + 4))
                             + v9) >> 3;
      int v16 = 1 << (((((unint64_t)v2 - *(void *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque
                                                                                        - v5
                                                                                        + 4))
                 + v9) & 7);
      int v17 = *(unsigned __int8 *)(v14 + v15);
      if ((v16 & v17) == 0)
      {
        float v29 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::freeBlock_locked(SyncPtr &, void *, unsigned int)");
        [v29 handleFailureInFunction:v28 file:@"_PASBuddyAllocator.mm" lineNumber:266 description:@"Merging a block which was not split."];

        uint64_t v14 = **(void **)&this[16]._os_unfair_lock_opaque;
        unint64_t v15 = (unint64_t)((((unint64_t)v2 - *(void *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque - v5 + 4))
                               + v9) >> 3;
        int v16 = 1 << (((((unint64_t)v2 - *(void *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque
                                                                                          - v5
                                                                                          + 4))
                   + v9) & 7);
        LOBYTE(v17) = *(unsigned char *)(v14 + v15);
      }
      *(unsigned char *)(v14 + v15) = v17 & ~(_BYTE)v16;
      --v5;
    }
    uint64_t *v2 = 0;
    v2[1] = 0;
    *(void *)(*(void *)(*(void *)&this[16]._os_unfair_lock_opaque + 40) + 8 * v5) = v2;
    uint64_t v18 = *(void *)&this[16]._os_unfair_lock_opaque;
    unint64_t v19 = *(void *)(v18 + 16);
    int v20 = this[2]._os_unfair_lock_opaque + ~v30;
    if (v19 < 16 << (LOBYTE(this[2]._os_unfair_lock_opaque) + ~(_BYTE)v30))
    {
      unint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v25 = [NSString stringWithUTF8String:"void (anonymous namespace)::BuddyAllocator::freeBlock(const void *)"];
      [v24 handleFailureInFunction:v25 file:@"_PASBuddyAllocator.mm" lineNumber:284 description:@"freeing more bytes than were allocated"];

      uint64_t v18 = *(void *)&this[16]._os_unfair_lock_opaque;
      unint64_t v19 = *(void *)(v18 + 16);
      int v20 = this[2]._os_unfair_lock_opaque + ~v30;
    }
    *(void *)(v18 + 16) = (-16 << v20) + v19;
    uint64_t v21 = *(void *)(v18 + 32);
    if (!v21)
    {
      int v26 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v27 = [NSString stringWithUTF8String:"void (anonymous namespace)::BuddyAllocator::freeBlock(const void *)"];
      [v26 handleFailureInFunction:v27 file:@"_PASBuddyAllocator.mm" lineNumber:287 description:@"freeing more blocks than were allocated"];

      uint64_t v18 = *(void *)&v4->_os_unfair_lock_opaque;
      uint64_t v21 = *(void *)(*(void *)&v4->_os_unfair_lock_opaque + 32);
    }
    *(void *)(v18 + 32) = v21 - 1;
    os_unfair_lock_unlock(lock);
  }
}

void sub_1A32FEDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::BuddyAllocator::sizeOfAllocatedRegion(os_unfair_lock_s *this, const void *a2)
{
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v7 = [NSString stringWithUTF8String:"size_t (anonymous namespace)::BuddyAllocator::sizeOfAllocatedRegion(const void *)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_PASBuddyAllocator.mm", 613, @"Attempt to find size of block %p which does not lie in the _PASBuddyAllocator heap at %p", a2, *(void *)&this->_os_unfair_lock_opaque);
  }
  os_unfair_lock_lock(this + 18);
  os_unfair_lock_unlock(this + 18);
  return 16 << (LOBYTE(this[2]._os_unfair_lock_opaque) + ~v4);
}

void sub_1A32FEF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL anonymous namespace'::BuddyAllocator::heapContains(_anonymous_namespace_::BuddyAllocator *this, unint64_t a2)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this > a2) {
    return 0;
  }
  int v5 = *((_DWORD *)this + 2);
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v7 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
    [v6 handleFailureInFunction:v7, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];
  }
  return (16 << (v5 - 1)) + v2 > a2;
}

void sub_1A32FF018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::BuddyAllocator::levelForBlock(uint64_t a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = 1;
  do
  {
    uint64_t v5 = (v3 - 1);
    if (v3 == 1) {
      break;
    }
    unint64_t v6 = ((unint64_t)(a3 - *(void *)a1) >> (v4++ + 4)) + ~(-1 << (v3 - 2));
    int v7 = *(unsigned __int8 *)(**a2 + (v6 >> 3)) >> (v6 & 7);
    int v3 = v5;
  }
  while ((v7 & 1) == 0);
  return v5;
}

uint64_t _PASBuddyAllocatorSizeOfBuffer(_anonymous_namespace_::BuddyAllocator *a1, const void *a2)
{
    return 0;
}

void _PASBuddyAllocatorUsage(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    int v4 = *(_DWORD *)(a1 + 8);
    if (!v4)
    {
      unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int v7 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
      [v6 handleFailureInFunction:v7, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];
    }
    *(void *)a2 = 16 << (v4 - 1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    uint64_t v5 = *(void *)(a1 + 64);
    *(_OWORD *)(a2 + 8) = *(_OWORD *)(v5 + 16);
    *(void *)(a2 + 24) = *(void *)(v5 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void sub_1A32FF204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _PASBuddyAllocatorIntegrityCheck(os_unfair_lock_s *a1)
{
  char v1 = a1;
  *(void *)&v185[11] = *MEMORY[0x1E4F143B8];
  v178 = 0;
  uint64_t v179 = 0;
  uint64_t v2 = a1 + 18;
  int v4 = os_unfair_lock_lock(a1 + 18);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v53 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v53;
    _os_log_debug_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist linkage", buf, 0xCu);
  }

  unint64_t os_unfair_lock_opaque = v1[2]._os_unfair_lock_opaque;
  if (!os_unfair_lock_opaque) {
    goto LABEL_19;
  }
  unint64_t v7 = 0;
  BOOL v8 = 0;
  char v9 = 0;
  while (1)
  {
    unint64_t v10 = *(unint64_t **)(*(void *)(*(void *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * v7);
    if (v10) {
      break;
    }
LABEL_14:
    ++v7;
    ++v9;
    BOOL v8 = v7 >= os_unfair_lock_opaque;
    if (v7 == os_unfair_lock_opaque) {
      goto LABEL_19;
    }
  }
  unint64_t v11 = *v10;
  if (*v10) {
    uint64_t v14 = {;
  }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v54 = *(void *)&v1->_os_unfair_lock_opaque;
      *(_DWORD *)buf = 134218240;
      uint64_t v181 = v54;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v7;
      _os_log_error_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: list node at level %u is not a list head", buf, 0x12u);

      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unint64_t v12 = (unint64_t)(16 << (os_unfair_lock_opaque - 1)) >> (os_unfair_lock_opaque
                                                                                   + ~v9
                                                                                   + 4);
  while (1)
  {
    int v13 = (unint64_t **)v10[1];
    if (!v13)
    {
      unint64_t v11 = (v11 + 1);
LABEL_13:
      if (v12 < v11) {
        uint64_t v14 = {;
      }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = *(void *)&v1->_os_unfair_lock_opaque;
          *(_DWORD *)buf = 134218240;
          uint64_t v181 = v56;
          __int16 v182 = 1024;
          *(_DWORD *)v183 = v7;
          _os_log_error_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: freelist at level %u does not terminate before maximum size", buf, 0x12u);

          goto LABEL_18;
        }
LABEL_17:

        goto LABEL_18;
      }
      goto LABEL_14;
    }
    if (*v13 != v10) {
      break;
    }
    unint64_t v11 = (v11 + 1);
    unint64_t v10 = (unint64_t *)v10[1];
    if (v12 < v11) {
      goto LABEL_13;
    }
  uint64_t v14 = };
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
  uint64_t v57 = *(void *)&v1->_os_unfair_lock_opaque;
  *(_DWORD *)buf = 134218240;
  uint64_t v181 = v57;
  __int16 v182 = 1024;
  *(_DWORD *)v183 = v7;
  _os_log_error_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: list node at level %u has corrupt back link", buf, 0x12u);

LABEL_18:
  if (!v8) {
    goto LABEL_241;
  }
  unint64_t v15 = LABEL_19:;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v55;
    _os_log_debug_impl(&dword_1A32C4000, v15, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist nodes are valid blocks", buf, 0xCu);
  }

  unint64_t v17 = v1[2]._os_unfair_lock_opaque;
  if (v17)
  {
    for (unint64_t i = 0; i < v17; ++i)
    {
      unint64_t v19 = *(void *)(*(void *)(*(void *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * i);
      if (v19)
      {
        unint64_t v20 = *(void *)&v1->_os_unfair_lock_opaque;
        uint64_t v21 = 16 << (v17 + ~(_BYTE)i);
        do
        {
          if (v20 > v19) {
            goto LABEL_80;
          }
          int v16 = (_anonymous_namespace_ *)(v21 + v19);
          uint64_t v22 = v1[2]._os_unfair_lock_opaque;
          if (v21 + v19 > (16 << (v17 - 1)) + *(void *)&v1->_os_unfair_lock_opaque) {
            goto LABEL_80;
          }
          while (1)
          {
            int v16 = (_anonymous_namespace_ *)(16 << (v22 - 1));
            if ((_anonymous_namespace_ *)v21 == v16) {
              break;
            }
            if (!--v22) {
              goto LABEL_80;
            }
          }
          if (((v19 - v20) & (v21 - 1)) != 0)
          {
            unint64_t v50 = LABEL_80:;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              uint64_t v58 = *(void *)&v1->_os_unfair_lock_opaque;
              *(_DWORD *)buf = 134218240;
              uint64_t v181 = v58;
              __int16 v182 = 1024;
              *(_DWORD *)v183 = i;
              unint64_t v59 = "_PASBuddyAllocator 0x%lx integrityCheck: freelist node at level %u identifies an invalid block";
              goto LABEL_92;
            }
            goto LABEL_81;
          }
          unint64_t v19 = *(void *)(v19 + 8);
        }
        while (v19);
      }
    }
  uint64_t v23 = };
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v62 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v62;
    _os_log_debug_impl(&dword_1A32C4000, v23, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist blocks are pairwise disjoint", buf, 0xCu);
  }

  v178 = 0;
  uint64_t v179 = 0;
  v176 = v2;
  v177 = &v178;
  unint64_t v25 = v1[2]._os_unfair_lock_opaque;
  if (!v25) {
    goto LABEL_116;
  }
  uint64_t v26 = 0;
  for (unint64_t j = 0; j < v25; ++j)
  {
    unint64_t v28 = v1;
    unint64_t v29 = *(void *)(*(void *)(*(void *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * j);
    if (!v29) {
      goto LABEL_75;
    }
    do
    {
      int v30 = v178;
      unint64_t v31 = &v178;
      __int16 v32 = &v178;
      if (!v178) {
        goto LABEL_45;
      }
      do
      {
        while (1)
        {
          __int16 v32 = (_anonymous_namespace_ **)v30;
          unint64_t v33 = *((void *)v30 + 4);
          if (v33 <= v29) {
            break;
          }
          int v30 = *v32;
          unint64_t v31 = v32;
          if (!*v32) {
            goto LABEL_45;
          }
        }
        if (v33 >= v29) {
          unint64_t v50 = {;
        }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v63 = *(void *)&v28->_os_unfair_lock_opaque;
            *(_DWORD *)buf = 134218240;
            uint64_t v181 = v63;
            __int16 v182 = 1024;
            *(_DWORD *)v183 = j;
            _os_log_error_impl(&dword_1A32C4000, v50, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: freelist node at level %u has same starting address as another node", buf, 0x12u);
          }
          BOOL v51 = 0;
          uint64_t v2 = v176;
          goto LABEL_85;
        }
        int v30 = v32[1];
      }
      while (v30);
      unint64_t v31 = v32 + 1;
LABEL_45:
      unint64_t v24 = (_anonymous_namespace_ *)operator new(0x30uLL);
      *((void *)v24 + 4) = v29;
      *((void *)v24 + 5) = 16 << (v25 + ~(_BYTE)j);
      *(void *)unint64_t v24 = 0;
      *((void *)v24 + 1) = 0;
      *((void *)v24 + 2) = v32;
      *unint64_t v31 = v24;
      if (*v177)
      {
        v177 = (_anonymous_namespace_ **)*v177;
        unint64_t v24 = *v31;
      }
      uint64_t v34 = v178;
      BOOL v35 = v24 == v178;
      *((unsigned char *)v24 + 24) = v24 == v178;
      uint64_t v2 = v176;
      if (!v35)
      {
        do
        {
          uint64_t v36 = *((void *)v24 + 2);
          if (*(unsigned char *)(v36 + 24)) {
            break;
          }
          unint64_t v37 = *(_anonymous_namespace_ **)(v36 + 16);
          uint64_t v38 = *(void *)v37;
          if (*(void *)v37 == v36)
          {
            uint64_t v41 = *((void *)v37 + 1);
            if (!v41 || (v42 = *(unsigned __int8 *)(v41 + 24), id v39 = (unsigned char *)(v41 + 24), v42))
            {
              if (*(_anonymous_namespace_ **)v36 == v24)
              {
                uint64_t v43 = (uint64_t *)*((void *)v24 + 2);
              }
              else
              {
                uint64_t v43 = *(uint64_t **)(v36 + 8);
                uint64_t v44 = *v43;
                *(void *)(v36 + 8) = *v43;
                if (v44)
                {
                  *(void *)(v44 + 16) = v36;
                  unint64_t v37 = *(_anonymous_namespace_ **)(v36 + 16);
                }
                v43[2] = (uint64_t)v37;
                *(void *)(*(void *)(v36 + 16) + 8 * (**(void **)(v36 + 16) != v36)) = v43;
                uint64_t *v43 = v36;
                *(void *)(v36 + 16) = v43;
                unint64_t v37 = (_anonymous_namespace_ *)v43[2];
                uint64_t v36 = *(void *)v37;
              }
              *((unsigned char *)v43 + 24) = 1;
              *((unsigned char *)v37 + 24) = 0;
              uint64_t v47 = *(void *)(v36 + 8);
              *(void *)unint64_t v37 = v47;
              if (v47) {
                *(void *)(v47 + 16) = v37;
              }
              *(void *)(v36 + 16) = *((void *)v37 + 2);
              *(void *)(*((void *)v37 + 2) + 8 * (**((void **)v37 + 2) != (void)v37)) = v36;
              *(void *)(v36 + 8) = v37;
              goto LABEL_73;
            }
          }
          else if (!v38 || (int v40 = *(unsigned __int8 *)(v38 + 24), v39 = (unsigned char *)(v38 + 24), v40))
          {
            if (*(_anonymous_namespace_ **)v36 == v24)
            {
              uint64_t v45 = *((void *)v24 + 1);
              *(void *)uint64_t v36 = v45;
              if (v45)
              {
                *(void *)(v45 + 16) = v36;
                unint64_t v37 = *(_anonymous_namespace_ **)(v36 + 16);
              }
              *((void *)v24 + 2) = v37;
              *(void *)(*(void *)(v36 + 16) + 8 * (**(void **)(v36 + 16) != v36)) = v24;
              *((void *)v24 + 1) = v36;
              *(void *)(v36 + 16) = v24;
              unint64_t v37 = (_anonymous_namespace_ *)*((void *)v24 + 2);
            }
            else
            {
              unint64_t v24 = (_anonymous_namespace_ *)*((void *)v24 + 2);
            }
            *((unsigned char *)v24 + 24) = 1;
            *((unsigned char *)v37 + 24) = 0;
            uint64_t v36 = *((void *)v37 + 1);
            unint64_t v46 = *(_anonymous_namespace_ **)v36;
            *((void *)v37 + 1) = *(void *)v36;
            if (v46) {
              *((void *)v46 + 2) = v37;
            }
            *(void *)(v36 + 16) = *((void *)v37 + 2);
            *(void *)(*((void *)v37 + 2) + 8 * (**((void **)v37 + 2) != (void)v37)) = v36;
            *(void *)uint64_t v36 = v37;
LABEL_73:
            *((void *)v37 + 2) = v36;
            break;
          }
          *(unsigned char *)(v36 + 24) = 1;
          unint64_t v24 = v37;
          *((unsigned char *)v37 + 24) = v37 == v34;
          *id v39 = 1;
        }
        while (v37 != v34);
      }
      uint64_t v179 = ++v26;
      unint64_t v29 = *(void *)(v29 + 8);
    }
    while (v29);
LABEL_75:
    char v1 = v28;
  }
  if (v177 != &v178)
  {
    unsigned int v48 = v177[1];
    if (v48)
    {
      do
      {
        unint64_t v49 = (_anonymous_namespace_ **)v48;
        unsigned int v48 = *(_anonymous_namespace_ **)v48;
      }
      while (v48);
    }
    else
    {
      unint64_t v64 = v177;
      do
      {
        unint64_t v49 = (_anonymous_namespace_ **)v64[2];
        BOOL v35 = *v49 == (_anonymous_namespace_ *)v64;
        unint64_t v64 = v49;
      }
      while (!v35);
    }
    if (v49 != &v178)
    {
      LOBYTE(v65) = 0;
      unint64_t v67 = v177[4];
      uint64_t v66 = v177[5];
      do
      {
        unint64_t v68 = v49[4];
        int v69 = v49[5];
        if (v67 <= v68) {
          unsigned int v70 = v49[4];
        }
        else {
          unsigned int v70 = v67;
        }
        unsigned int v71 = (_anonymous_namespace_ *)((char *)v67 + (void)v66);
        if ((char *)v68 + (unint64_t)v69 < (char *)v71) {
          unsigned int v71 = (_anonymous_namespace_ *)((char *)v68 + (void)v69);
        }
        BOOL v72 = v70 < v71;
        if ((_BYTE)v65) {
          int v65 = 1;
        }
        else {
          int v65 = v72;
        }
        int64_t v73 = v49[1];
        if (v73)
        {
          do
          {
            uint64_t v74 = (_anonymous_namespace_ **)v73;
            int64_t v73 = *(_anonymous_namespace_ **)v73;
          }
          while (v73);
        }
        else
        {
          do
          {
            uint64_t v74 = (_anonymous_namespace_ **)v49[2];
            BOOL v35 = *v74 == (_anonymous_namespace_ *)v49;
            unint64_t v49 = v74;
          }
          while (!v35);
        }
        unint64_t v67 = v68;
        uint64_t v66 = v69;
        unint64_t v49 = v74;
      }
      while (v74 != &v178);
      if (v65) {
        unint64_t v50 = {;
      }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = *(void *)&v28->_os_unfair_lock_opaque;
          *(_DWORD *)buf = 134217984;
          uint64_t v181 = v75;
          unint64_t v59 = "_PASBuddyAllocator 0x%lx integrityCheck: freelist blocks are not pairwise disjoint";
          unsigned int v60 = v50;
          uint32_t v61 = 12;
          goto LABEL_93;
        }
        goto LABEL_81;
      }
    }
  }
  CFRange v76 = LABEL_116:;
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v165 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v165;
    _os_log_debug_impl(&dword_1A32C4000, v76, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist blocks are consistent with count of bytes allocated", buf, 0xCu);
  }

  CFRange v78 = v177;
  if (v177 == &v178)
  {
    uint64_t v79 = 0;
  }
  else
  {
    uint64_t v79 = 0;
    do
    {
      uint64_t v80 = v78[1];
      uint64_t v81 = v78;
      if (v80)
      {
        do
        {
          char v82 = (_anonymous_namespace_ **)v80;
          uint64_t v80 = *(_anonymous_namespace_ **)v80;
        }
        while (v80);
      }
      else
      {
        do
        {
          char v82 = (_anonymous_namespace_ **)v81[2];
          BOOL v35 = *v82 == (_anonymous_namespace_ *)v81;
          uint64_t v81 = v82;
        }
        while (!v35);
      }
      v79 += (uint64_t)v78[5];
      CFRange v78 = v82;
    }
    while (v82 != &v178);
  }
  uint64_t v83 = *(void *)(*(void *)&v1[16]._os_unfair_lock_opaque + 16);
  uint32_t v84 = v1[2]._os_unfair_lock_opaque;
  if (!v84)
  {
    v172 = [MEMORY[0x1E4F28B00] currentHandler];
    v173 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
    [v172 handleFailureInFunction:v173, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];

  char v85 = };
  unint64_t v50 = v85;
  if (v83 + v79 != 16 << (v84 - 1))
  {
    uint64_t v2 = v176;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      v102 = v1;
      uint64_t v103 = *(void *)&v1->_os_unfair_lock_opaque;
      uint64_t v104 = *(void *)(*(void *)&v102[16]._os_unfair_lock_opaque + 16);
      uint32_t v105 = v102[2]._os_unfair_lock_opaque;
      if (!v105)
      {
        v174 = [MEMORY[0x1E4F28B00] currentHandler];
        v175 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
        [v174 handleFailureInFunction:v175, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];

        uint64_t v2 = v176;
      }
      *(_DWORD *)buf = 134218752;
      uint64_t v181 = v103;
      __int16 v182 = 2048;
      *(void *)v183 = v104;
      *(_WORD *)&v183[8] = 2048;
      *(void *)v184 = v79;
      *(_WORD *)&v184[8] = 2048;
      *(void *)v185 = 16 << (v105 - 1);
      unint64_t v59 = "_PASBuddyAllocator 0x%lx integrityCheck: inconsistent heap usage (%zu allocated, %zu free, %zu total size)";
      unsigned int v60 = v50;
      uint32_t v61 = 42;
      goto LABEL_93;
    }
LABEL_81:
    BOOL v51 = 0;
    goto LABEL_85;
  }
  uint64_t v2 = v176;
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v168 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v168;
    _os_log_debug_impl(&dword_1A32C4000, v50, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying split blocks do not appear in the freelist", buf, 0xCu);
  }

  uint32_t v87 = v1[2]._os_unfair_lock_opaque;
  unint64_t v88 = v87 - 1;
  if (v87 != 1)
  {
    unint64_t v89 = 0;
    BOOL v90 = 0;
    char v91 = 0;
    unsigned int v92 = 0;
LABEL_135:
    unsigned int v93 = 0;
    uint64_t v94 = 16 << (v87 + ~v91);
    while (1)
    {
      if (((*(unsigned __int8 *)(**(void **)&v1[16]._os_unfair_lock_opaque + ((unint64_t)v92 >> 3)) >> (v92 & 7)) & 1) != 0
        && v178)
      {
        unint64_t v95 = *(void *)&v1->_os_unfair_lock_opaque + v94 * v93;
        long long v96 = (_anonymous_namespace_ *)&v178;
        long long v97 = v178;
        do
        {
          uint64_t v98 = v97;
          uint64_t v86 = v96;
          unint64_t v99 = *((void *)v97 + 4);
          if (v99 >= v95) {
            long long v96 = v97;
          }
          else {
            long long v97 = (_anonymous_namespace_ *)((char *)v97 + 8);
          }
          long long v97 = *(_anonymous_namespace_ **)v97;
        }
        while (v97);
        if (v96 != (_anonymous_namespace_ *)&v178)
        {
          uint64_t v100 = v99 >= v95 ? v98 : v86;
          if (*((void *)v100 + 4) == v95)
          {
            uint64_t v101 = v99 >= v95 ? v98 : v86;
            if (*((void *)v101 + 5) == v94) {
              break;
            }
          }
        }
      }
      ++v92;
      if (++v93 >> v89)
      {
        ++v89;
        ++v91;
        BOOL v90 = v89 >= v88;
        if (v89 == v88) {
          goto LABEL_162;
        }
        goto LABEL_135;
      }
    uint64_t v106 = };
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      uint64_t v171 = *(void *)&v1->_os_unfair_lock_opaque;
      *(_DWORD *)buf = 134218496;
      uint64_t v181 = v171;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v93;
      *(_WORD *)&v183[4] = 1024;
      *(_DWORD *)&v183[6] = v89;
      _os_log_error_impl(&dword_1A32C4000, v106, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: split block %u at level %u was found in the freelist", buf, 0x18u);
    }

    if (!v90)
    {
LABEL_241:
      char v52 = 0;
      goto LABEL_242;
    }
  }
  uint64_t v107 = LABEL_162:;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v169 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v169;
    _os_log_debug_impl(&dword_1A32C4000, v107, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying buddy pairs are not simultaneously in freelists", buf, 0xCu);
  }

  long long v109 = v177;
  if (v177 != &v178)
  {
    uint32_t v110 = v1[2]._os_unfair_lock_opaque;
    uint32_t v111 = v110;
    do
    {
      uint64_t v113 = v109[4];
      uint64_t v112 = v109[5];
      if (v111)
      {
        uint64_t v114 = 0;
        char v115 = -1;
        while ((_anonymous_namespace_ *)(16 << (v111 + v115)) != v112)
        {
          ++v114;
          --v115;
          if ((char *)v111 == v114) {
            goto LABEL_170;
          }
        }
        if (!v114) {
          goto LABEL_191;
        }
      }
      else
      {
LABEL_170:
        uint64_t v114 = [MEMORY[0x1E4F28B00] currentHandler];
        v116 = [NSString stringWithUTF8String:"BOOL (anonymous namespace)::BuddyAllocator::integrityCheck_verifyFreeListsHaveNoBuddyPairs(const std::set<BlockRange> &) const"];
        [v114 handleFailureInFunction:v116 file:@"_PASBuddyAllocator.mm" lineNumber:479 description:@"Failed to find level for block size"];

        uint32_t v110 = v1[2]._os_unfair_lock_opaque;
        LODWORD(v114) = -1;
      }
      if (((((unint64_t)v113 - *(void *)&v1->_os_unfair_lock_opaque) >> (v110 + ~(_BYTE)v114)) & 0x10) != 0) {
        uint64_t v117 = -16;
      }
      else {
        uint64_t v117 = 16;
      }
      long long v118 = v178;
      if (!v178) {
        goto LABEL_190;
      }
      unint64_t v119 = (unint64_t)v113 + (v117 << (v110 + ~(_BYTE)v114));
      uint64_t v120 = &v178;
      do
      {
        uint64_t v121 = (_anonymous_namespace_ **)v118;
        v122 = v120;
        unint64_t v123 = *((void *)v118 + 4);
        v124 = (_anonymous_namespace_ **)((char *)v118 + 8);
        if (v123 >= v119)
        {
          v124 = v121;
          uint64_t v120 = v121;
        }
        long long v118 = *v124;
      }
      while (v118);
      if (v120 != &v178 && (v123 >= v119 ? (v125 = v121) : (v125 = v122), v125[4] == (_anonymous_namespace_ *)v119))
      {
        if (v123 >= v119) {
          v126 = v121;
        }
        else {
          v126 = v122;
        }
        v127 = v126[5];
        uint32_t v111 = v110;
        if (v127 == v112) {
          unint64_t v50 = {;
        }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v167 = *(void *)&v1->_os_unfair_lock_opaque;
            *(_DWORD *)buf = 134218240;
            uint64_t v181 = v167;
            __int16 v182 = 1024;
            *(_DWORD *)v183 = v114;
            unint64_t v59 = "_PASBuddyAllocator 0x%lx integrityCheck: found buddy pair in freelist at level %u";
LABEL_92:
            unsigned int v60 = v50;
            uint32_t v61 = 18;
LABEL_93:
            _os_log_error_impl(&dword_1A32C4000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
          }
          goto LABEL_81;
        }
      }
      else
      {
LABEL_190:
        uint32_t v111 = v110;
      }
LABEL_191:
      v128 = v109[1];
      if (v128)
      {
        do
        {
          v129 = (_anonymous_namespace_ **)v128;
          v128 = *(_anonymous_namespace_ **)v128;
        }
        while (v128);
      }
      else
      {
        do
        {
          v129 = (_anonymous_namespace_ **)v109[2];
          BOOL v35 = *v129 == (_anonymous_namespace_ *)v109;
          long long v109 = v129;
        }
        while (!v35);
      }
      long long v109 = v129;
    }
    while (v129 != &v178);
  v130 = };
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v170 = *(void *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    uint64_t v181 = v170;
    _os_log_debug_impl(&dword_1A32C4000, v130, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying half-allocation bitmap against freelists", buf, 0xCu);
  }

  uint32_t v131 = v1[2]._os_unfair_lock_opaque;
  unint64_t v132 = v131 - 1;
  if (v131 == 1)
  {
    char v52 = 1;
    goto LABEL_242;
  }
  unint64_t v133 = 0;
  BOOL v51 = 0;
  char v134 = 0;
  unsigned int v135 = 0;
  char v52 = 1;
  while (2)
  {
    unsigned int v136 = 0;
    v137 = (_anonymous_namespace_ *)(16 << (v131 - 2 - v133));
    do
    {
      if (!v178)
      {
        int v147 = 0;
LABEL_233:
        int v155 = 0;
        goto LABEL_234;
      }
      unint64_t v138 = *(void *)&v1->_os_unfair_lock_opaque + (16 << (v131 + ~v134)) * v136;
      v139 = (char *)v137 + v138;
      v140 = &v178;
      v141 = v178;
      do
      {
        v142 = v141;
        v143 = v140;
        unint64_t v144 = *((void *)v141 + 4);
        if (v144 >= v138) {
          v140 = (_anonymous_namespace_ **)v141;
        }
        else {
          v141 = (_anonymous_namespace_ *)((char *)v141 + 8);
        }
        v141 = *(_anonymous_namespace_ **)v141;
      }
      while (v141);
      if (v140 == &v178
        || (v144 >= v138 ? (v145 = (_anonymous_namespace_ **)v142) : (v145 = v143),
            v145[4] != (_anonymous_namespace_ *)v138))
      {
        int v147 = 0;
      }
      else
      {
        if (v144 >= v138) {
          v146 = (_anonymous_namespace_ **)v142;
        }
        else {
          v146 = v143;
        }
        int v147 = v146[5] == v137;
      }
      v148 = &v178;
      v149 = v178;
      do
      {
        v150 = (_anonymous_namespace_ **)v149;
        v151 = v148;
        unint64_t v152 = *((void *)v149 + 4);
        if (v152 >= (unint64_t)v139) {
          v148 = (_anonymous_namespace_ **)v149;
        }
        else {
          v149 = (_anonymous_namespace_ *)((char *)v149 + 8);
        }
        v149 = *(_anonymous_namespace_ **)v149;
      }
      while (v149);
      if (v148 == &v178) {
        goto LABEL_233;
      }
      v153 = v152 >= (unint64_t)v139 ? v150 : v151;
      if (v153[4] != (_anonymous_namespace_ *)v139) {
        goto LABEL_233;
      }
      if (v152 >= (unint64_t)v139) {
        v154 = v150;
      }
      else {
        v154 = v151;
      }
      int v155 = v154[5] == v137;
LABEL_234:
      if (((*(unsigned __int8 *)(*(void *)(*(void *)&v1[16]._os_unfair_lock_opaque + 8)
                                + ((unint64_t)v135 >> 3)) >> (v135 & 7)) & 1) != 0)
      {
        if (v147 == v155) {
          unint64_t v50 = {;
        }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v158 = *(void *)&v1->_os_unfair_lock_opaque;
            v159 = "allocated";
            *(_DWORD *)buf = 134219010;
            if (v147) {
              v160 = "free";
            }
            else {
              v160 = "allocated";
            }
            uint64_t v181 = v158;
            __int16 v182 = 1024;
            if (v155) {
              v159 = "free";
            }
            *(_DWORD *)v183 = v136;
            *(_WORD *)&v183[4] = 1024;
            *(_DWORD *)&v183[6] = v133;
            *(_WORD *)v184 = 2080;
            *(void *)&v184[2] = v160;
            v185[0] = 2080;
            *(void *)&v185[1] = v159;
            v161 = "_PASBuddyAllocator 0x%lx integrityCheck: block %u in level %u has half-alloc set with left-child %s a"
                   "nd right-child %s";
LABEL_258:
            _os_log_error_impl(&dword_1A32C4000, v50, OS_LOG_TYPE_ERROR, v161, buf, 0x2Cu);
          }
LABEL_85:

          char v52 = v51;
          goto LABEL_242;
        }
      }
      else if ((v147 | v155) == 1) {
        unint64_t v50 = {;
      }
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_85;
        }
        uint64_t v162 = *(void *)&v1->_os_unfair_lock_opaque;
        v163 = "allocated";
        *(_DWORD *)buf = 134219010;
        if (v147) {
          v164 = "free";
        }
        else {
          v164 = "allocated";
        }
        uint64_t v181 = v162;
        __int16 v182 = 1024;
        if (v155) {
          v163 = "free";
        }
        *(_DWORD *)v183 = v136;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v133;
        *(_WORD *)v184 = 2080;
        *(void *)&v184[2] = v164;
        v185[0] = 2080;
        *(void *)&v185[1] = v163;
        v161 = "_PASBuddyAllocator 0x%lx integrityCheck: block %u in level %u has half-alloc bit clear with left-child %s"
               " and right-child %s";
        goto LABEL_258;
      }
      ++v135;
      ++v136;
    }
    while (!(v136 >> v133));
    ++v133;
    ++v134;
    BOOL v51 = v133 >= v132;
    if (v133 != v132) {
      continue;
    }
    break;
  }
LABEL_242:
  os_unfair_lock_unlock(v2);
  return v52 & 1;
}

void sub_1A3300390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, uint64_t a12, void *a13)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void std::__tree<anonymous namespace'::BuddyAllocator::BlockRange>::destroy(void *a1)
{
  if (a1)
  {
    operator delete(a1);
  }
}

unint64_t _PASBuddyAllocatorBufferSizeForHeapOfSize(unint64_t a1)
{
  uint64_t v2 = 1;
  while (16 << (v2 - 1) < a1)
  {
    uint64_t v2 = (v2 + 1);
    if (!v2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v3 = [NSString stringWithUTF8String:"size_t proactive::pas::buddyalloc::blockStorageSizeForLevels"];
      [v5 handleFailureInFunction:v3, @"_PASBuddyAllocatorPOD.h", 71, @"Invalid parameter not satisfying: %@", @"numLevels > 0" file lineNumber description];
    }
  }

  return proactive::pas::buddyalloc::heapSizeForLevels((proactive::pas::buddyalloc *)v2);
}

void sub_1A3300550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id makeOptionLongHelp(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  if ([v1 count]) {
    [v2 appendString:@"\nOption Details:\n"];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obunint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [NSString alloc];
        char v9 = [v7 name];
        unint64_t v10 = (void *)[v8 initWithFormat:@"--%@", v9];

        uint64_t v11 = [v7 shortName];
        if (v11)
        {
          unint64_t v12 = (void *)v11;
          int v13 = [v7 shortName];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            id v15 = [NSString alloc];
            int v16 = [v7 shortName];
            unint64_t v17 = [v7 name];
            uint64_t v18 = [v15 initWithFormat:@"-%@, --%@", v16, v17];

            unint64_t v10 = (void *)v18;
          }
        }
        unint64_t v19 = [v7 argMetavar];

        if (v19)
        {
          unint64_t v20 = [v7 argMetavar];
          uint64_t v21 = [v7 helpDescription];
          [v2 appendFormat:@"  %@ %@ -- %@\n", v10, v20, v21];
        }
        else
        {
          unint64_t v20 = [v7 helpDescription];
          [v2 appendFormat:@"  %@ -- %@\n", v10, v20];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  return v2;
}

id makeOptionShortHelp(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obunint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      char v9 = v5;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        uint64_t v11 = [v10 argMetavar];

        id v12 = [NSString alloc];
        uint64_t v13 = [v10 name];
        uint64_t v14 = (void *)v13;
        if (v11)
        {
          id v15 = [v10 argMetavar];
          uint64_t v16 = [v12 initWithFormat:@" --%@ %@ ", v14, v15];

          unint64_t v6 = (void *)v16;
        }
        else
        {
          id v15 = v6;
          unint64_t v6 = (void *)[v12 initWithFormat:@" --%@ ", v13];
        }

        if ([v10 required]) {
          id v17 = v6;
        }
        else {
          id v17 = (id)[[NSString alloc] initWithFormat:@" [%@] ", v6];
        }
        uint64_t v5 = v17;

        [v2 appendString:v5];
        ++v8;
        char v9 = v5;
      }
      while (v4 != v8);
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  return v2;
}

BOOL _PASEvaluateLogFaultAndProbCrashCriteria()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load(_PASLogFaultAndProbCrashArmed);
  if (v1)
  {
    os_unfair_lock_lock(&_PASEvaluateLogFaultAndProbCrashCriteria__PASProbCrashLock);
    uint64_t v4 = (void *)_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses;
    if (!_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses)
    {
      unsigned __int8 v5 = arc4random_uniform(_PASLogFaultAndProbCrashWindowSize);
      unsigned int v6 = v5;
      _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount = v5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v6;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASEvaluateLogFaultAndProbCrashCriteria: Will skip %hhu unique callsite(s) before crashing", (uint8_t *)v10, 8u);
        unsigned int v6 = _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount;
      }
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v4 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
      if (!v4)
      {
        id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v9);
      }
      _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses = (uint64_t)v4;
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = v4[v7];
        BOOL v2 = v8 != v0;
        if (v8 == v0) {
          goto LABEL_17;
        }
        if (!v8)
        {
          BOOL v2 = 0;
          v4[v7] = v0;
          goto LABEL_17;
        }
      }
      while (_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount != ++v7);
    }
LABEL_15:
    BOOL v2 = 1;
LABEL_17:
    os_unfair_lock_unlock(&_PASEvaluateLogFaultAndProbCrashCriteria__PASProbCrashLock);
    return v2;
  }
  return 0;
}

void sub_1A3303A80(_Unwind_Exception *exception_object)
{
}

uint64_t _pas_calculateDefaultGeoHash(double a1, double a2)
{
  return _pas_calculateGeoHash(0xEu, a1, a2);
}

uint64_t _pas_calculateGeoHash(unsigned int a1, double a2, double a3)
{
  if (a1 >= 0x20) {
    uint64_t v3 = 32;
  }
  else {
    uint64_t v3 = a1;
  }
  if (!v3) {
    return 0;
  }
  uint64_t result = 0;
  double v5 = 180.0;
  double v6 = -90.0;
  double v7 = -180.0;
  double v8 = 90.0;
  do
  {
    double v9 = (v8 + v6) * 0.5;
    double v10 = (v7 + v5) * 0.5;
    if (v9 < a2) {
      double v6 = (v8 + v6) * 0.5;
    }
    else {
      double v8 = (v8 + v6) * 0.5;
    }
    if (v10 >= a3) {
      double v5 = (v7 + v5) * 0.5;
    }
    else {
      double v7 = (v7 + v5) * 0.5;
    }
    uint64_t result = (v10 < a3) | (2 * (v9 >= a2)) | (4 * result);
    --v3;
  }
  while (v3);
  return result;
}

void cfDeallocateReleaseBackingObject(int a1, CFTypeRef cf)
{
}

uint64_t advanceCursor(uint64_t a1, char *a2, _DWORD *a3)
{
  unint64_t v4 = *a3;
  double v5 = (char *)(a1 + (v4 >> 8));
  int v10 = 0;
  unsigned int RuneUtf8 = getRuneUtf8(v5, a2, &v10);
  int v7 = v10;
  unsigned int v8 = v10 - 1114112;
  if ((v4 & 0x80) != 0 || v8 < 0xFFF00000)
  {
    *a3 = (v4 + ((RuneUtf8 - v5) << 8)) & 0xFFFFFF7F;
    if (v8 >> 20 != 4095) {
      return (unsigned __int16)v7;
    }
    if ((v4 & 0x80) != 0)
    {
      LOWORD(v7) = v7 & 0x3FF | 0xDC00;
      return (unsigned __int16)v7;
    }
  }
  else
  {
    *a3 = v4 | 0x80;
  }
  return (unsigned __int16)(((v7 + 67043328) >> 10) - 10240);
}

char *getRuneUtf8(char *a1, char *a2, int *a3)
{
  if (a1 == a2) {
    goto LABEL_19;
  }
  int v4 = *a1;
  uint64_t v3 = a1 + 1;
  int v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    double v6 = v3;
    goto LABEL_20;
  }
  if ((v5 & 0xE0) == 0xC0)
  {
    int v7 = v5 & 0x1F;
    LODWORD(v8) = 1;
    goto LABEL_10;
  }
  if ((v5 & 0xF0) == 0xE0)
  {
    int v7 = v5 & 0xF;
    LODWORD(v8) = 2;
    goto LABEL_10;
  }
  if ((v5 & 0xF8) == 0xF0)
  {
    int v7 = v5 & 7;
    LODWORD(v8) = 3;
LABEL_10:
    int v9 = v8 + 1;
    double v6 = v3;
    while (v6 != a2)
    {
      char v10 = *v6++;
      int v5 = v10 & 0x3F | (v7 << 6);
      --v9;
      int v7 = v5;
      if (v9 <= 1) {
        goto LABEL_20;
      }
    }
    goto LABEL_19;
  }
  if (v3 == a2)
  {
LABEL_19:
    int v5 = 0;
    double v6 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  while (1)
  {
    double v6 = &v3[v8];
    if ((v3[v8] & 0x80000000) == 0) {
      break;
    }
    int v5 = 0;
    double v6 = 0;
    if (&v3[++v8] == a2) {
      goto LABEL_20;
    }
  }
  int v7 = 65533;
  v3 += v8;
  int v5 = 65533;
  if (v8) {
    goto LABEL_10;
  }
LABEL_20:
  *a3 = v5;
  return v6;
}

void sub_1A33078D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3307EFC(_Unwind_Exception *a1)
{
}

void sub_1A3307F14(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1A3308058);
}

void sub_1A3307F1C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, int buf, uint64_t a17, uint64_t a18, __CFString *a19, __CFString *a20,uint64_t a21,id a22)
{
  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(a1);
      JUMPOUT(0x1A3307D1CLL);
    }
    id v22 = objc_begin_catch(a1);
    if (!+[_PASDeviceInfo isInternalBuild] && a15)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        buf = 138412290;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "A bogus or corrupt journal file was found and has been cleaned up. Relaunching: %@", (uint8_t *)&buf, 0xCu);
      }
      long long v24 = (void *)MEMORY[0x1E4F1CA00];
      a19 = @"fullPath";
      a20 = @"originalException";
      a22 = v22;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a21 forKeys:&a19 count:2];
      id v23 = [v24 exceptionWithName:@"_PASDatabaseJournalWillRecoverOnNextLaunch" reason:@"A bogus or corrupt journal file was found and has been cleaned up. Relaunching." userInfo:v25];
    }
    else
    {
      id v23 = v22;
    }
    objc_exception_throw(v23);
  }
  _Unwind_Resume(a1);
}

void sub_1A3308044(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A3307F2CLL);
  }
  _Unwind_Resume(a1);
}

BOOL _sqliteErrorIndicatesDeviceBecameLocked(void *a1)
{
  unsigned __int8 v1 = [a1 userInfo];
  BOOL v2 = [v1 objectForKeyedSubscript:@"sqliteCode"];

  if (v2) {
    BOOL v3 = [v2 integerValue] == 778;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

void sub_1A3308904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id wrongVersionError(void *a1)
{
  id v1 = a1;
  BOOL v2 = objc_opt_new();
  BOOL v3 = v2;
  if (v1)
  {
    int v4 = (void *)[[NSString alloc] initWithFormat:@"Unsupported format version: %@", v1];
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  else
  {
    [v2 setObject:@"Unsupported format version." forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  [v3 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  double v6 = (void *)[v3 copy];
  int v7 = (void *)[v5 initWithDomain:@"_PASLazyPlistErrorDomain" code:3 userInfo:v6];

  return v7;
}

id fileAccessError(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_opt_new();
  double v6 = v5;
  if (v3)
  {
    int v7 = (void *)[[NSString alloc] initWithFormat:@"The file cannot be opened: %@", v3];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  else
  {
    [v5 setObject:@"The file cannot be opened." forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v9 = (void *)[v6 copy];
  char v10 = (void *)[v8 initWithDomain:@"_PASLazyPlistErrorDomain" code:1 userInfo:v9];

  return v10;
}

void sub_1A330B5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A330B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2139(uint64_t a1)
{
}

void sub_1A330BBA8(_Unwind_Exception *a1)
{
}

void sub_1A330BBC8(void *a1)
{
}

void sub_1A330C12C(_Unwind_Exception *a1)
{
}

unsigned __int16 *computeHashes_MURMUR3_X86_32(int *a1, int a2, int a3, unsigned __int16 *a4, signed int a5)
{
  int v16 = 0;
  uint64_t result = _PAS_MurmurHash3_x86_32(a4, a5, a3, (unsigned int *)&v16);
  int v10 = v16;
  *a1 = v16;
  if (a2 != 1)
  {
    unsigned int v15 = 0;
    uint64_t result = _PAS_MurmurHash3_x86_32(a4, a5, v10, &v15);
    unsigned int v11 = v15;
    a1[1] = v15;
    if (a2 >= 3)
    {
      unsigned int v12 = v11 + 1;
      unsigned int v13 = v10 + v11;
      uint64_t v14 = 2;
      do
      {
        v13 += v12;
        v12 += v14;
        a1[v14++] = v13;
      }
      while (a2 != v14);
    }
  }
  return result;
}

unint64_t computeHashes_MURMUR3_X64_128(void *a1, int a2, unsigned int a3, uint64_t *a4, unsigned int a5)
{
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  unint64_t result = _PAS_MurmurHash3_x64_128(a4, a5, a3, &v31);
  unint64_t v9 = v31;
  uint64_t v8 = v32;
  *a1 = v31;
  a1[1] = v8;
  if (a2 >= 5)
  {
    unint64_t v10 = 0;
    unint64_t v11 = HIDWORD(v9);
    uint64_t v12 = a2;
    int v13 = 6;
    if (a2 <= 6uLL) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = a2;
    }
    unint64_t v15 = (unint64_t)(v14 - 5) >> 1;
    uint64x2_t v16 = (uint64x2_t)vdupq_n_s64(v15);
    uint64_t v17 = (v15 & 0x7FFFFFFFFFFFFFFELL) + 2;
    uint64_t v18 = a1 + 3;
    unint64_t result = (4 * HIDWORD(v9));
    do
    {
      int32x2_t v19 = vmovn_s64((int64x2_t)vcgeq_u64(v16, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v10), (int8x16_t)xmmword_1A332F070)));
      if (v19.i8[0])
      {
        unint64_t v20 = 715827883 * ((v13 - 2) * (v13 - 2) - 1) * (v13 - 2);
        *(v18 - 2) = result + v9 + HIDWORD(v20) + (v20 >> 63);
      }
      if (v19.i8[4])
      {
        unint64_t v21 = 715827883 * (v13 * v13 - 1) * v13;
        *uint64_t v18 = 6 * v11 + v9 + HIDWORD(v21) + (v21 >> 63);
      }
      v10 += 2;
      v18 += 4;
      LODWORD(v9) = v9 + result;
      v13 += 4;
    }
    while (v17 != v10);
    if (a2 >= 6)
    {
      unint64_t v22 = 0;
      if (a2 <= 7uLL) {
        uint64_t v12 = 7;
      }
      unint64_t v23 = (unint64_t)(v12 - 6) >> 1;
      uint64x2_t v24 = (uint64x2_t)vdupq_n_s64(v23);
      uint64_t v25 = (v23 & 0x7FFFFFFFFFFFFFFELL) + 2;
      long long v26 = (_DWORD *)a1 + 7;
      int v27 = 5;
      do
      {
        int32x2_t v28 = vmovn_s64((int64x2_t)vcgeq_u64(v24, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v22), (int8x16_t)xmmword_1A332F070)));
        if (v28.i8[0])
        {
          unint64_t v29 = 715827883 * (v27 * v27 - 1) * v27;
          *(v26 - 2) = 5 * HIDWORD(v8) + v8 + HIDWORD(v29) + (v29 >> 63);
        }
        unint64_t result = v28.u32[1];
        if (v28.i8[4])
        {
          unint64_t v30 = 715827883 * ((v27 + 2) * (v27 + 2) - 1) * (v27 + 2);
          unint64_t result = 7 * HIDWORD(v8) + v8 + HIDWORD(v30) + (v30 >> 63);
          *long long v26 = result;
        }
        v22 += 2;
        v27 += 4;
        v26 += 4;
        LODWORD(v8) = v8 + 4 * HIDWORD(v8);
      }
      while (v25 != v22);
    }
  }
  return result;
}

void sub_1A330DAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t levenshtein<char>(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5 = a3;
  int v8 = 0;
  uint64_t v9 = 0;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a3 >= a4) {
    unsigned int v10 = a4;
  }
  else {
    unsigned int v10 = a3;
  }
  if (a4 <= a3) {
    unsigned int v11 = a3;
  }
  else {
    unsigned int v11 = a4;
  }
  while (*(unsigned __int8 *)(a1 + v9) == *(unsigned __int8 *)(a2 + v9))
  {
    ++v9;
    --v8;
    if (!(v10 + v8))
    {
      int v12 = 0;
      return v11 - v10 + v12;
    }
  }
  int v13 = 0;
  unsigned int v14 = a3 + v8;
  int v15 = v10 + v8;
  int v12 = -v15;
  unsigned int v16 = a4 - 1;
  for (unsigned int i = a3 - 1; *(unsigned __int8 *)(a1 + i) == *(unsigned __int8 *)(a2 + v16); --i)
  {
    --v14;
    ++v13;
    --v16;
    if (v15 == v13)
    {
      unsigned int v10 = v9;
      return v11 - v10 + v12;
    }
  }
  int v19 = v9 + v13;
  LODWORD(v40) = v11;
  size_t v20 = 4 * (v11 - (v9 + v13)) + 4;
  memptr = 0;
  uint64_t v43 = 0;
  uint64_t v41 = v20 | 3;
  size_t v39 = v20;
  if ((v20 | 3) > 0x7D0)
  {
    int v37 = malloc_type_posix_memalign(&memptr, 8uLL, v20, 0x3DC39743uLL);
    LOBYTE(v43) = 0;
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A0], @"malloc failed", 0, v39);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v38);
    }
    unint64_t v22 = memptr;
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    unint64_t v22 = (_DWORD *)((char *)&v39 - ((v21 + 15) & 0x1FFFFFFF0));
    bzero(v22, v21);
  }
  int v23 = v40;
  unint64_t v40 = a4 + v8 - v13;
  uint64_t v24 = (v23 + v8 - v13);
  bzero(v22, v39);
  uint64_t v25 = 0;
  do
  {
    v22[v25] = v25;
    ++v25;
  }
  while (v24 + 1 != v25);
  unint64_t v26 = v41;
  if (v19 != v5)
  {
    uint64_t v27 = 0;
    if (v14 <= 1) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = v14;
    }
    uint64_t v29 = v40;
    if (v40 <= 1) {
      uint64_t v29 = 1;
    }
    unint64_t v30 = v22 + 1;
    do
    {
      int v31 = *(unsigned __int8 *)(a1 + (v9 + v27));
      uint64_t v32 = v27 + 1;
      *unint64_t v22 = v27 + 1;
      if (v19 != a4)
      {
        uint64_t v33 = 0;
        unsigned int v34 = v27 + 1;
        do
        {
          if (*(unsigned __int8 *)(a2 + (v9 + v33)) != v31) {
            LODWORD(v27) = v27 + 1;
          }
          int v35 = v30[v33];
          if (v35 + 1 >= v34 + 1) {
            ++v34;
          }
          else {
            unsigned int v34 = v35 + 1;
          }
          if (v34 >= v27) {
            unsigned int v34 = v27;
          }
          v30[v33++] = v34;
          LODWORD(v27) = v35;
        }
        while (v29 != v33);
      }
      uint64_t v27 = v32;
    }
    while (v32 != v28);
    unsigned int v5 = v9 + v13;
  }
  uint64_t v18 = v22[a4 - v5];
  if (v26 > 0x7D0) {
    free(v22);
  }
  return v18;
}

uint64_t levenshtein<unsigned int>(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3 >= a4) {
    unsigned int v6 = a4;
  }
  else {
    unsigned int v6 = a3;
  }
  if (v6)
  {
    int v9 = 0;
    uint64_t v10 = 0;
    if (a4 <= a3) {
      unsigned int v11 = a3;
    }
    else {
      unsigned int v11 = a4;
    }
    while (*(_DWORD *)(a1 + 4 * v10) == *(_DWORD *)(a2 + 4 * v10))
    {
      ++v10;
      --v9;
      if (!(v6 + v9)) {
        goto LABEL_10;
      }
    }
    int v16 = 0;
    unsigned int v17 = a3 + v9;
    int v18 = v6 + v9;
    int v12 = -v18;
    unsigned int v19 = a4 - 1;
    unsigned int v20 = a3 - 1;
    while (*(_DWORD *)(a1 + 4 * v20) == *(_DWORD *)(a2 + 4 * v19))
    {
      --v17;
      ++v16;
      --v19;
      --v20;
      if (v18 == v16)
      {
        unsigned int v6 = v10;
        goto LABEL_11;
      }
    }
    int v21 = v10 + v16;
    unsigned int v42 = v11;
    size_t v22 = 4 * (v11 - (v10 + v16)) + 4;
    memptr = 0;
    uint64_t v45 = 0;
    uint64_t v43 = v22 | 3;
    size_t v41 = v22;
    if ((v22 | 3) > 0x7D0)
    {
      int v37 = malloc_type_posix_memalign(&memptr, 8uLL, v22, 0x3DC39743uLL);
      LOBYTE(v45) = 0;
      if (v37)
      {
        id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v38);
      }
      uint64_t v24 = memptr;
    }
    else
    {
      MEMORY[0x1F4188790](a1);
      uint64_t v24 = (_DWORD *)((char *)&v39 - ((v23 + 15) & 0x1FFFFFFF0));
      bzero(v24, v23);
    }
    unint64_t v40 = a4 + v9 - v16;
    uint64_t v25 = v42 + v9 - v16;
    bzero(v24, v41);
    uint64_t v26 = 0;
    do
    {
      v24[v26] = v26;
      ++v26;
    }
    while (v25 + 1 != v26);
    unint64_t v27 = v43;
    if (v21 != v5)
    {
      uint64_t v28 = 0;
      if (v17 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v17;
      }
      uint64_t v30 = v40;
      if (v40 <= 1) {
        uint64_t v30 = 1;
      }
      int v31 = v24 + 1;
      do
      {
        int v32 = *(_DWORD *)(a1 + 4 * (v10 + v28));
        uint64_t v33 = v28 + 1;
        _DWORD *v24 = v28 + 1;
        if (v21 != a4)
        {
          uint64_t v34 = 0;
          unsigned int v35 = v28 + 1;
          do
          {
            if (*(_DWORD *)(a2 + 4 * (v10 + v34)) != v32) {
              LODWORD(v28) = v28 + 1;
            }
            int v36 = v31[v34];
            if (v36 + 1 >= v35 + 1) {
              ++v35;
            }
            else {
              unsigned int v35 = v36 + 1;
            }
            if (v35 >= v28) {
              unsigned int v35 = v28;
            }
            v31[v34++] = v35;
            LODWORD(v28) = v36;
          }
          while (v30 != v34);
        }
        uint64_t v28 = v33;
      }
      while (v33 != v29);
      unsigned int v5 = v10 + v16;
    }
    uint64_t v14 = v24[a4 - v5];
    if (v27 > 0x7D0) {
      free(v24);
    }
  }
  else
  {
LABEL_10:
    int v12 = 0;
LABEL_11:
    if (a3 <= a4) {
      unsigned int v13 = a4;
    }
    else {
      unsigned int v13 = a3;
    }
    return v13 - v6 + v12;
  }
  return v14;
}

uint64_t __Block_byref_object_copy__2386(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2387(uint64_t a1)
{
}

void sub_1A330E520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A330E68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void _PASMemoryHeavyOperation(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    int v7 = [NSString stringWithUTF8String:"void _PASMemoryHeavyOperation(void (^__strong)(void))"];
    [v6 handleFailureInFunction:v7, @"_PASMemoryHeavyOperationLock.m", 16, @"Invalid parameter not satisfying: %@", @"block" file lineNumber description];
  }
  if (_PASMemoryHeavyOperation_onceToken != -1) {
    dispatch_once(&_PASMemoryHeavyOperation_onceToken, &__block_literal_global_2470);
  }
  if (pthread_getspecific(_PASMemoryHeavyOperation_tlKey))
  {
    BOOL v2 = (void *)MEMORY[0x1A62450A0]();
    v1[2](v1);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___PASMemoryHeavyOperation_block_invoke_2;
    v8[3] = &unk_1E5AEB4D0;
    uint64_t v9 = v1;
    id v3 = (void *)MEMORY[0x1A6245320](v8);
    qos_class_t v4 = qos_class_self();
    unsigned int v5 = _PASMemoryHeavyOperation_uiQueue;
    if (v4 <= 0x18)
    {
      dispatch_sync((dispatch_queue_t)_PASMemoryHeavyOperation_uiQueue, &__block_literal_global_12);
      unsigned int v5 = _PASMemoryHeavyOperation_lowQueue;
    }
    dispatch_sync(v5, v3);
  }
}

void sub_1A330F4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t __Block_byref_object_copy__2514(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2515(uint64_t a1)
{
}

void sub_1A3310114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3311A4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id posixError(int a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F28588];
  BOOL v2 = (void *)[[NSString alloc] initWithUTF8String:strerror(a1)];
  v8[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  unsigned int v5 = (void *)[v4 initWithDomain:*MEMORY[0x1E4F28798] code:a1 userInfo:v3];

  return v5;
}

uint64_t __Block_byref_object_copy__2716(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2717(uint64_t a1)
{
}

void sub_1A3313254(_Unwind_Exception *a1)
{
}

void sub_1A3313870(_Unwind_Exception *a1)
{
}

void sub_1A3313968(_Unwind_Exception *a1)
{
}

void sub_1A3314210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3030(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6245320](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3031(uint64_t a1)
{
}

void registerOnceForFirstUnlock(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __registerOnceForFirstUnlock_block_invoke;
  block[3] = &unk_1E5AEB4D0;
  id v5 = v1;
  uint64_t v2 = registerOnceForFirstUnlock_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&registerOnceForFirstUnlock_onceToken, block);
  }
}

void __registerOnceForFirstUnlock_block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  id v3 = *(id *)(a1 + 32);
  registerOnceForFirstUnlock_registrationToken = MKBEventsRegister();
}

void __registerOnceForFirstUnlock_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (void *)MEMORY[0x1A6245320](*(void *)(a1 + 32));
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Running MobileKeyBag class C unlock block: %@", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)MEMORY[0x1A6245320](*(void *)(a1 + 32));
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ran MobileKeyBag class C unlock block: %@", (uint8_t *)&v8, 0xCu);
    }
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    uint64_t v7 = dispatch_queue_create("_PASDeviceState.firstUnlockUnregistration", v6);

    dispatch_async(v7, &__block_literal_global_46);
  }
}

uint64_t __registerOnceForFirstUnlock_block_invoke_44()
{
  uint64_t result = MKBEventsUnregister();
  registerOnceForFirstUnlock_registrationToken = 0;
  return result;
}

uint64_t __registerForAKSEvents_block_invoke(uint64_t result, int a2, CFDictionaryRef theDict)
{
  if (a2 == 1)
  {
    value[5] = v3;
    value[6] = v4;
    uint64_t v6 = result;
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E4F4D968], (const void **)value))
    {
      CFTypeID v7 = CFGetTypeID(value[0]);
      if (v7 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Cx expiring", buf, 2u);
          }
          int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
          return v8();
        }
      }
    }
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E4F4D960], (const void **)value))
    {
      CFTypeID v9 = CFGetTypeID(value[0]);
      if (v9 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Cx expired", buf, 2u);
          }
          int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
          return v8();
        }
      }
    }
    *(void *)buf = 0;
    uint64_t result = CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E4F4D970], (const void **)value);
    if (result)
    {
      CFTypeID v10 = CFGetTypeID(value[0]);
      uint64_t result = CFNumberGetTypeID();
      if (v10 == result)
      {
        uint64_t result = CFNumberGetValue((CFNumberRef)value[0], kCFNumberLongLongType, buf);
        if (result)
        {
          switch(*(_DWORD *)buf)
          {
            case 0:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v11 = 0;
                _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Unlocked", v11, 2u);
              }
              int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
              return v8();
            case 1:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v11 = 0;
                _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Locked", v11, 2u);
              }
              int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
              return v8();
            case 2:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v11 = 0;
                _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Locking", v11, 2u);
              }
              int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
              return v8();
            case 3:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v11 = 0;
                _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AKS: Disabled", v11, 2u);
              }
              int v8 = *(uint64_t (**)(void))(*(void *)(v6 + 32) + 16);
              return v8();
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

void unregisterForLockStateChanges(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    int v3 = [v1 intValue];
    uint32_t v4 = notify_cancel(v3);
    if (v4)
    {
      uint32_t v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109376;
        v6[1] = v3;
        __int16 v7 = 1024;
        uint32_t v8 = v5;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unregister notify token %d with error %u", (uint8_t *)v6, 0xEu);
      }
    }
  }
}

id registerForLockStateChanges(NSObject *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int out_token = -1;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __registerForLockStateChanges_block_invoke;
  uint64_t v12 = &unk_1E5AEB480;
  id v13 = v3;
  id v4 = v3;
  uint32_t v5 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, a1, &v9);
  if (v5)
  {
    uint32_t v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v16 = v6;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to register for kMobileKeyBagLockStatusNotificationID with error %u", buf, 8u);
    }
  }
  __int16 v7 = objc_msgSend(NSNumber, "numberWithInt:", out_token, v9, v10, v11, v12);

  return v7;
}

uint64_t __registerForLockStateChanges_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = MKBGetDeviceLockState();
  if (v2 >= 4) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v4(v1, v3);
}

id currentOsBuild()
{
  if (getCurrentOsBuild_once != -1) {
    dispatch_once(&getCurrentOsBuild_once, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)getCurrentOsBuild_build;

  return v0;
}

void __getCurrentOsBuild_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)_CFCopyServerVersionDictionary();
  if (v0 || (CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary()) != 0)
  {
    uint64_t v1 = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x1E4F1CD10]);
    unsigned int v2 = (void *)getCurrentOsBuild_build;
    getCurrentOsBuild_build = v1;

    CFRelease(v0);
  }
}

void __getAKSEventsNotificationsQueue_block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CFDictionaryRef v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("_PASDeviceState.AKSEventsNotifications", v0);
  unsigned int v2 = (void *)getAKSEventsNotificationsQueue_queue;
  getAKSEventsNotificationsQueue_queue = (uint64_t)v1;
}

uint64_t __runUnlockBlocks_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

void _pas_registerSqliteCollections(sqlite3 *a1)
{
  v21[5] = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v3 = self;
  v21[0] = v3;
  id v4 = self;
  v21[1] = v4;
  uint32_t v5 = self;
  v21[2] = v5;
  uint32_t v6 = self;
  void v21[3] = v6;
  __int16 v7 = self;
  void v21[4] = v7;
  uint32_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        uint64_t v15 = (void *)MEMORY[0x1A62450A0](v10);
        sqlite3_create_module(a1, (const char *)objc_msgSend(v14, "sqliteMethodName", (void)v16), &_pas_collection_sqlite_module, v14);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v11 = v10;
    }
    while (v10);
  }
}

uint64_t xRowId(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 8);
  if (([(id)objc_opt_class() hasRowId] & 1) == 0)
  {
    uint32_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "int xRowId(sqlite3_vtab_cursor *, sqlite_int64 *)");
    [v5 handleFailureInFunction:v6, @"_PASSqliteCollections.m", 1595, @"Invalid parameter not satisfying: %@", @"[cursor.class hasRowId]" file lineNumber description];
  }
  *a2 = [v3 outputRowId];

  return 0;
}

BOOL __xFilter_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _PASSqliteGetValue(*(sqlite3_value **)(*(void *)(a1 + 48)
  uint32_t v6 = + 8 * *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)));
  if (a2)
  {
    __int16 v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 60))
    {
      [v7 applyKeyConstraint:a3 withArgument:v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v14 = 67109634;
        int v15 = a3;
        __int16 v16 = 2112;
        long long v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = objc_opt_class();
        uint32_t v8 = MEMORY[0x1E4F14500];
        id v9 = "#passqlitecollections Using key->%d(%@) for %@";
LABEL_9:
        _os_log_debug_impl(&dword_1A32C4000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v14, 0x1Cu);
      }
    }
    else
    {
      [v7 applyRowIdConstraint:a3 withArgument:v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v14 = 67109634;
        int v15 = a3;
        __int16 v16 = 2112;
        long long v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = objc_opt_class();
        uint32_t v8 = MEMORY[0x1E4F14500];
        id v9 = "#passqlitecollections Using rowId->%d(%@) for %@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) applyConstraint:a3 withArgument:v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67109634;
      int v15 = a3;
      __int16 v16 = 2112;
      long long v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = objc_opt_class();
      uint32_t v8 = MEMORY[0x1E4F14500];
      id v9 = "#passqlitecollections Using value->%d(%@) for %@";
      goto LABEL_9;
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int v11 = *(_DWORD *)(v10 + 24) + 1;
  *(_DWORD *)(v10 + 24) = v11;
  BOOL v12 = v11 < *(_DWORD *)(a1 + 56);

  return v12;
}

uint64_t xDestroy(void *a1)
{
  return 0;
}

uint64_t xDisconnect(void *a1)
{
  return 0;
}

uint64_t xConnect(sqlite3 *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint32_t v8 = sqlite3_malloc64(0x20uLL);
  id v9 = v8;
  if (v8)
  {
    void *v8 = 0;
    v8[1] = 0;
    void v8[2] = 0;
    v8[3] = a2;
    uint64_t v10 = self;
    char v11 = [a2 isSubclassOfClass:v10];

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      int v14 = objc_msgSend(NSString, "stringWithUTF8String:", "int xConnect(sqlite3 *, void *, int, const char *const *, sqlite3_vtab **, char **)");
      [v13 handleFailureInFunction:v14, @"_PASSqliteCollections.m", 1345, @"Invalid parameter not satisfying: %@", @"[pVtab->pasCursorClass isSubclassOfClass:[_PASSqliteCollectionsCursor self]]" file lineNumber description];
    }
    uint64_t result = sqlite3_declare_vtab(a1, (const char *)[(id)v9[3] sqliteCreateTableStatement]);
  }
  else
  {
    uint64_t result = 7;
  }
  *a5 = v9;
  return result;
}

uint64_t __Block_byref_object_copy__3287(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3288(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6245320](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A3316ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3316F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3317210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  __destructor_8_sb0_sb16_sb24((uint64_t)va);
  __destructor_8_sb0_sb16_sb24((uint64_t)va1);
  _Unwind_Resume(a1);
}

void __destructor_8_sb0_sb16_sb24(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 24);
}

void sub_1A33175AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  __destructor_8_sb0_sb16_sb24((uint64_t)va);
  __destructor_8_sb0_sb16_sb24((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_1A3317870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  __destructor_8_sb0_sb16_sb24((uint64_t)va);
  __destructor_8_sb0_sb16_sb24((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t _PASIsInternalDevice()
{
  return os_variant_has_internal_diagnostics();
}

void sub_1A3317E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33188D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3318D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3452(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3453(uint64_t a1)
{
}

id _PAS_sqlite3_column_nsstring(sqlite3_stmt *a1, int a2)
{
  uint64_t v4 = sqlite3_column_text(a1, a2);
  if (v4)
  {
    uint32_t v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v4, sqlite3_column_bytes(a1, a2), 4);
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
LABEL_6:
      id v9 = v7;

      goto LABEL_8;
    }
    uint64_t v8 = sqlite3_column_text16(a1, a2);
    if (v8)
    {
      id v7 = (id)objc_msgSend([NSString alloc], "initWithCharacters:length:", v8, (unint64_t)sqlite3_column_bytes16(a1, a2) >> 1);
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

void sub_1A3319230(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A331946C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33195C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33197D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3319AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3319C90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_1A3319EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A331A344(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A331A5E8(_Unwind_Exception *exception_object)
{
}

void sub_1A331A614(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1A331A4E0);
  }
  JUMPOUT(0x1A331A608);
}

__CFString *_PASQMarksSeparatedByCommas(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    size_t v2 = 2 * a1;
    size_t v3 = (2 * a1) | 1;
    memptr = 0;
    uint64_t v12 = 0;
    if (v3 > 0x100)
    {
      int v8 = malloc_type_posix_memalign(&memptr, 8uLL, v2, 0xBA780C1DuLL);
      LOBYTE(v12) = 0;
      if (v8)
      {
        id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v9);
      }
      uint64_t v4 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](a1);
      uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v4, v3);
    }
    uint32_t v5 = v4 + 1;
    do
    {
      *(_WORD *)(v5 - 1) = 11327;
      v5 += 2;
      --v1;
    }
    while (v1);
    uint64_t v6 = (__CFString *)[[NSString alloc] initWithBytes:v4 length:v2 - 1 encoding:1];
    if (v3 > 0x100) {
      free(v4);
    }
  }
  else
  {
    uint64_t v6 = &stru_1EF678A50;
  }

  return v6;
}

uint64_t _PAS_sqlite3_bind_nssecurecoding(sqlite3_stmt *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "int _PAS_sqlite3_bind_nssecurecoding(sqlite3_stmt * _Nonnull, int, __strong id<NSSecureCoding> _Nonnull)");
    [v12 handleFailureInFunction:v13, @"_PASSqliteDatabase.m", 185, @"Invalid parameter not satisfying: %@", @"obj != nil" file lineNumber description];
  }
  uint64_t v6 = (void *)MEMORY[0x1A62450A0]();
  id v14 = 0;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
  id v8 = v14;
  id v9 = v8;
  if (v7)
  {

    uint64_t v10 = _PAS_sqlite3_bind_nsdata(a1, a2, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = v9;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can not archive data: %@", buf, 0xCu);
    }
    uint64_t v10 = sqlite3_bind_null(a1, a2);
  }

  return v10;
}

__CFString *getQueryPlan(sqlite3 *a1, void *a2)
{
  id v3 = a2;
  ppStmt = 0;
  if (([v3 hasPrefix:@"CREATE "] & 1) != 0
    || ([v3 hasPrefix:@"DROP "] & 1) != 0)
  {
    uint64_t v4 = @"(no query plan for create and drop queries)";
  }
  else
  {
    id v6 = (id) [[NSString alloc] initWithFormat:@"EXPLAIN QUERY PLAN %@", v3];
    sqlite3_prepare_v2(a1, (const char *)[v6 UTF8String], -1, &ppStmt, 0);

    if (ppStmt)
    {
      id v7 = objc_opt_new();
      id v8 = objc_opt_new();
      while (sqlite3_step(ppStmt) == 100)
      {
        int v9 = sqlite3_column_int(ppStmt, 0);
        int v10 = sqlite3_column_int(ppStmt, 1);
        char v11 = sqlite3_column_text(ppStmt, 3);
        int v12 = sqlite3_column_bytes(ppStmt, 3);
        if (v10
          && ([NSNumber numberWithInteger:v10],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              [v8 objectForKeyedSubscript:v13],
              id v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              v14))
        {
          int v15 = [NSNumber numberWithInteger:v10];
          __int16 v16 = [v8 objectForKeyedSubscript:v15];
          uint64_t v17 = [v16 integerValue] + 4;
        }
        else
        {
          uint64_t v17 = 0;
        }
        __int16 v18 = [NSNumber numberWithInteger:v17];
        uint64_t v19 = [NSNumber numberWithInteger:v9];
        [v8 setObject:v18 forKeyedSubscript:v19];

        uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%4td %*s", v9, (v12 + v17), v11);
        [v7 addObject:v20];
      }
      sqlite3_finalize(ppStmt);
      if ([v7 count])
      {
        objc_msgSend(v7, "_pas_componentsJoinedByString:", @"\n");
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v4 = @"(empty query plan)";
      }
    }
    else
    {
      uint64_t v4 = @"(query plan could not be generated)";
    }
  }

  return v4;
}

void sub_1A331C250(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A331C5C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A331C790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sqliteBlockFunction(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  id v6 = (void *)MEMORY[0x1A62450A0]();
  if (a2 >= 1 && sqlite3_value_pointer(*a3, "_pas_block"))
  {
    id v7 = (void (**)(void, void))MEMORY[0x1A6245320]();
    Mutable = CFArrayCreateMutable(0, (a2 - 1), MEMORY[0x1E4F1D510]);
    int v9 = (void *)MEMORY[0x1A62450A0]();
    if (a2 >= 2)
    {
      uint64_t v10 = a2 - 1;
      char v11 = a3 + 1;
      do
      {
        int v12 = *v11++;
        id Value = _PASSqliteGetValue(v12);
        CFArrayAppendValue(Mutable, Value);
        --v10;
      }
      while (v10);
    }
    id v14 = ((void (**)(void, __CFArray *))v7)[2](v7, Mutable);
    CFRelease(Mutable);
    if (v14)
    {
      _PASSqliteSetResult();
    }
    else
    {
      int v15 = [MEMORY[0x1E4F1CA98] null];
      _PASSqliteSetResult();
    }
  }
  else
  {
    sqlite3_result_error_code(a1, 20);
  }
}

void sub_1A331C944(_Unwind_Exception *a1)
{
}

void sub_1A331C964(void *a1)
{
}

id _PASSqliteGetValue(sqlite3_value *a1)
{
  switch(sqlite3_value_type(a1))
  {
    case 1:
      uint64_t v2 = [NSNumber numberWithLongLong:sqlite3_value_int64(a1)];
      goto LABEL_8;
    case 2:
      uint64_t v2 = [NSNumber numberWithDouble:sqlite3_value_double(a1)];
      goto LABEL_8;
    case 3:
      id v3 = [NSString alloc];
      uint64_t v4 = sqlite3_value_text(a1);
      id v5 = (void *)[v3 initWithBytes:v4 length:sqlite3_value_bytes(a1) encoding:4];
      if (v5) {
        goto LABEL_9;
      }
      id v6 = [NSString alloc];
      id v7 = sqlite3_value_text16(a1);
      uint64_t v2 = [v6 initWithCharacters:v7 length:(unint64_t)sqlite3_value_bytes16(a1) >> 1];
LABEL_8:
      id v5 = (void *)v2;
LABEL_9:
      return v5;
    case 4:
      id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      int v9 = sqlite3_value_blob(a1);
      uint64_t v10 = (void *)[v8 initWithBytes:v9 length:sqlite3_value_bytes(a1)];
      id v5 = objc_msgSend(v10, "_pas_dataWithNonnullBytes");

      goto LABEL_9;
    case 5:
      uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_8;
    default:
      __break(1u);
      JUMPOUT(0x1A331CB00);
  }
}

uint64_t runDebugCommandCallback(unsigned char *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!*a1)
  {
    unint64_t v7 = (a2 - 1);
    if (a2 >= 1)
    {
      for (unint64_t i = 0; i != a2; ++i)
      {
        printf("%s ", *(const char **)(a4 + 8 * i));
        if (i < v7) {
          putchar(9);
        }
      }
    }
    putchar(10);
    int v10 = 80;
    do
    {
      putchar(45);
      --v10;
    }
    while (v10);
    putchar(10);
    *a1 = 1;
  }
  if (a2 >= 1)
  {
    unint64_t v11 = 0;
    do
    {
      printf("%s ", *(const char **)(a3 + 8 * v11));
      if (v11 < (a2 - 1)) {
        putchar(9);
      }
      ++v11;
    }
    while (a2 != v11);
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  return 0;
}

void moveOrRemoveDbFile(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  int v6 = [v5 moveItemAtPath:v3 toPath:v4 error:&v9];
  id v7 = v9;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Corrupt database file moved to \"%@\".", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to move corrupt database file to \"%@\": %@", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtPath:v3 error:0];
  }
}

void sub_1A331E4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PAS_sqlite3_column_nssecurecoding(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__3452;
  __int16 v16 = __Block_byref_object_dispose__3453;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___PAS_sqlite3_column_nssecurecoding_block_invoke;
  v9[3] = &unk_1E5AEB688;
  id v11 = &v12;
  id v6 = v5;
  id v10 = v6;
  _PAS_sqlite3_column_blob_bytes_block(a1, a2, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_1A331E704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3321BB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17) {
    (*(void (**)(void))(a17 + 16))();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A3321EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t bumpChecked(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 24);
  if (*(void *)(a1 + 8) - result < a2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void *bumpChecked(_PASLPAllocContext * _Nonnull, size_t)");
    [v5 handleFailureInFunction:v6, @"_PASLPWriterV1.m", 142, @"Invalid parameter not satisfying: %@", @"offset(allocContext->bumpp, allocContext->endp) >= (ptrdiff_t)byteCount" file lineNumber description];

    uint64_t result = *(void *)(a1 + 24);
  }
  *(void *)(a1 + 24) = result + a2;
  return result;
}

void alignChecked(void *a1, unint64_t a2)
{
  id v3 = (char *)a1[3];
  id v4 = &v3[-*a1];
  unint64_t v5 = (unint64_t)&v4[a2 - 1] / a2 * a2;
  unint64_t v6 = *a1 + v5;
  if (v6 >= a1[1])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void *alignChecked(_PASLPAllocContext * _Nonnull, size_t)");
    [v7 handleFailureInFunction:v8, @"_PASLPWriterV1.m", 154, @"Invalid parameter not satisfying: %@", @"alignedPtr < allocContext->endp" file lineNumber description];

    id v3 = (char *)a1[3];
  }
  bzero(v3, v5 - (void)v4);
  a1[3] = v6;
}

uint64_t _block_invoke(uint64_t *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a3 & 0xFFFFFF0000000000 | ((unint64_t)BYTE4(a3) << 32) | a3;
  v12[0] = a2;
  v12[1] = v7;
  id Value = (void **)CFSetGetValue(*(CFSetRef *)(v6 + 16), v12);
  if (Value)
  {
    id v9 = *Value;
  }
  else
  {
    size_t v10 = a3;
    alignChecked((void *)*a1, BYTE4(a3));
    id v9 = (void *)bumpChecked(*a1, a3);
    memcpy(v9, a2, v10);
    cacheBuffer(*(__CFSet **)(*a1 + 16), *(void *)(*a1 + 32), (uint64_t)v9, v7);
  }
  return (v9 - *(_DWORD *)*a1);
}

void cacheBuffer(__CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = a3;
  v5[1] = a4;
  ++*(void *)(a2 + 120);
  if (CFSetGetCount(a1) < 0x2000) {
    CFSetAddValue(a1, v5);
  }
}

uint64_t hashBufferDescr(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (v1 >= 0x20) {
    unint64_t v2 = 32;
  }
  else {
    unint64_t v2 = v1;
  }
  id v3 = *(unsigned __int16 **)a1;
  unsigned int v4 = _PASMurmur3_x86_32(*(unsigned __int16 **)a1, v2, v1 + *(unsigned __int8 *)(a1 + 12));
  if (v1 >= 0x21)
  {
    if ((unint64_t)(v1 - 32) >= 0x20) {
      unint64_t v5 = 32;
    }
    else {
      unint64_t v5 = v1 - 32;
    }
    v4 ^= _PASMurmur3_x86_32((unsigned __int16 *)((char *)v3 + v1 - v5), v5, 0);
  }
  return v4;
}

BOOL isEqualBufferDescr(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(unsigned int *)(a1 + 8);
  return __PAIR64__(*(unsigned __int8 *)(a1 + 12), v2) == __PAIR64__(*(unsigned __int8 *)(a2 + 12), *(_DWORD *)(a2 + 8))
      && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

__n128 retainBufferDescr(const __CFAllocator *a1, __n128 *a2)
{
  id v3 = CFAllocatorAllocate(a1, 16, 0);
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v5);
  }
  __n128 result = *a2;
  *id v3 = *a2;
  return result;
}

void sub_1A33236A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3323820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3323EC4(_Unwind_Exception *a1)
{
}

void sub_1A3323EE4(void *a1)
{
}

void sub_1A3324450(_Unwind_Exception *a1)
{
}

void sub_1A3324470(void *a1)
{
}

void sub_1A3324570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4120(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4121(uint64_t a1)
{
}

void sub_1A33246C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3324904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A332510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3325430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3326250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3327334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33275EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3327EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void _PASSharedKeySetSupportLoadOnce()
{
  if (_PASSharedKeySetSupportLoadOnce__pasOnceToken2 != -1) {
    dispatch_once(&_PASSharedKeySetSupportLoadOnce__pasOnceToken2, &__block_literal_global_4195);
  }
}

uint64_t _PASSharedKeySetCount(uint64_t a1)
{
  return _sharedKeySetCount(a1, _sharedKeySetCountSelector);
}

uint64_t _PASSharedKeySetIndexForKey(uint64_t a1, uint64_t a2)
{
  return _sharedKeySetIndexForKey(a1, _sharedKeySetIndexForKeySelector, a2);
}

uint64_t _PASSharedKeySetKeyAtIndex(uint64_t a1, uint64_t a2)
{
  return _sharedKeySetKeyAtIndex(a1, _sharedKeySetKeyAtIndexSelector, a2);
}

void sub_1A3328E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1A3329154(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1A3329298()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1A33292A8()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A33292B8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A33292C8()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1A33292D8()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1A33292E8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1A33292F8()
{
  return MEMORY[0x1F41834E0]();
}

uint64_t sub_1A3329308()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1A3329318()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1A3329328()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A3329338()
{
  return MEMORY[0x1F41837B0]();
}

uint64_t sub_1A3329348()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A3329358()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A3329368()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1A3329378()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A3329388()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A3329398()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A33293A8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A33293B8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A33293C8()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1A33293D8()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1A33293E8()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1A33293F8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A3329418()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1A3329438()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1A3329448()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1A3329458()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A3329468()
{
  return MEMORY[0x1F41843C8]();
}

uint64_t sub_1A3329478()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A3329488()
{
  return MEMORY[0x1F41843E8]();
}

uint64_t sub_1A3329498()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A33294A8()
{
  return MEMORY[0x1F41849B8]();
}

uint64_t sub_1A33294B8()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1A33294C8()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1A33294D8()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A33294E8()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A33294F8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A3329508()
{
  return MEMORY[0x1F41851C8]();
}

uint64_t sub_1A3329518()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1A3329528()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A3329538()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A3329548()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A3329558()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A3329568()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A3329578()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A3329588()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A3329598()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A33295A8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A33295B8()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A33295C8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A33295D8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A33295E8()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1A33295F8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A3329608()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A3329618()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A3329628()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A3329638()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x1F410A500]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x1F40D7620]();
}

uint64_t CFBurstTrieContainsUTF8String()
{
  return MEMORY[0x1F40D7628]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x1F40D7638]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x1F40D7658]();
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7708](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7720](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1F40D83C0](encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8418](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D8550](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t ITSCollationContextFreeContextForDatabaseHandle()
{
  return MEMORY[0x1F4127698]();
}

uint64_t ITSRegisterSQLiteICUTokenizer()
{
  return MEMORY[0x1F41276B0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1F412F960]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1F412F968]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1F40E7088]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1F40E72F8](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1F40E7308](ptr);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _NSIsNSCFConstantString()
{
  return MEMORY[0x1F40D94A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

void _exit(int a1)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BA0](adler, buf, *(void *)&len);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  MEMORY[0x1F40D15F8](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

uLong crc32_z(uLong crc, const Bytef *buf, z_size_t len)
{
  return MEMORY[0x1F4182BC8](crc, buf, len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAD8](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_high_water(dispatch_io_t channel, size_t high_water)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1F40CC470](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE58](a1, a2, *(void *)&a3);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE78](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1F4181690](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1F41816D8](obj);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40CD790](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1F40CD798](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1F40CD7A0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7C0](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int scandir(const char *a1, dirent ***a2, int (__cdecl *a3)(const dirent *), int (__cdecl *a4)(const dirent **, const dirent **))
{
  return MEMORY[0x1F40CDEA8](a1, a2, a3, a4);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1F40CDF88](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x1F40CDFC8](*(void *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1F4181F68](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1F4181F70](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1F4181F88](p, *(void *)&nPage);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

uint64_t sqlite3_bind_blob_b()
{
  return MEMORY[0x1F4181FA0]();
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE0](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x1F4181FF8](a1, *(void *)&a2, a3, a4, a5, encoding);
}

uint64_t sqlite3_bind_text_b()
{
  return MEMORY[0x1F4182000]();
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_bytes16(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182080](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1F41820B8](a1, *(void *)&a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1F41820C0](a1, *(void *)&a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

const void *__cdecl sqlite3_column_text16(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F41820D0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1F4182128](db, zName, p, pClientData);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1F4182148](a1, *(void *)&op);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1F4182180](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1F4182248](*(void *)&a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1F4182250](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
}

int sqlite3_result_zeroblob64(sqlite3_context *a1, sqlite3_uint64 n)
{
  return MEMORY[0x1F4182340](a1, n);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x1F41823C8](a1, *(void *)&op, *(void *)&resetFlg);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

int sqlite3_value_bytes16(sqlite3_value *a1)
{
  return MEMORY[0x1F4182420](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x1F4182428](a1);
  return result;
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1F4182450](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

const void *__cdecl sqlite3_value_text16(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182460](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1F4182468](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

uint64_t utrans_close()
{
  return MEMORY[0x1F41807F0]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x1F41807F8]();
}

uint64_t utrans_trans()
{
  return MEMORY[0x1F4180800]();
}

void vvlog2f(float *a1, const float *a2, const int *a3)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}