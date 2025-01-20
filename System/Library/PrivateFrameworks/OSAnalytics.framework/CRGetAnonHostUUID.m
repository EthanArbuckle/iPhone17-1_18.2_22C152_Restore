@interface CRGetAnonHostUUID
@end

@implementation CRGetAnonHostUUID

void ___CRGetAnonHostUUID_block_invoke()
{
  v59[2] = *MEMORY[0x1E4F143B8];
  CFStringRef v0 = _CRCopyAnonHostUUIDPath();
  if (v0)
  {
    CFStringRef v1 = v0;
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFURLRef v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v0, kCFURLPOSIXPathStyle, 0);
    if (v3)
    {
      CFURLRef v4 = v3;
      v5 = CFReadStreamCreateWithFile(v2, v3);
      if (v5)
      {
        v6 = v5;
        if (CFReadStreamOpen(v5))
        {
          CFPropertyListRef v7 = CFPropertyListCreateWithStream(v2, v6, 0, 0, 0, 0);
          if (v7)
          {
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (TypeID != CFGetTypeID(v7))
            {
              CFRelease(v7);
              CFPropertyListRef v7 = 0;
            }
          }
          CFReadStreamClose(v6);
        }
        else
        {
          CFPropertyListRef v7 = 0;
        }
        CFRelease(v6);
        CFRelease(v4);
        if (v7)
        {
          Value = CFDictionaryGetValue((CFDictionaryRef)v7, @"AnonHostUUID2");
          if (Value)
          {
            v10 = Value;
            CFTypeID v11 = CFGetTypeID(Value);
            if (v11 == CFStringGetTypeID()) {
              _CRGetAnonHostUUID___uuid = (uint64_t)CFRetain(v10);
            }
          }
          CFRelease(v7);
          goto LABEL_65;
        }
      }
      else
      {
        CFRelease(v4);
      }
    }
    if (geteuid())
    {
LABEL_65:
      CFRelease(v1);
      return;
    }
    CFStringRef v12 = _CRCopyAnonHostUUIDPath();
    if (!v12)
    {
      CFStringRef v28 = 0;
LABEL_64:
      _CRGetAnonHostUUID___uuid = (uint64_t)v28;
      goto LABEL_65;
    }
    CFStringRef v13 = v12;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v2, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!Mutable)
    {
      CFStringRef v28 = 0;
LABEL_63:
      CFRelease(v13);
      goto LABEL_64;
    }
    CFMutableDictionaryRef v15 = Mutable;
    __str[5] = 0;
    __int16 v56 = 0;
    int v57 = 0;
    uint64_t v58 = 0;
    *(void *)((char *)v59 + 5) = 0;
    v59[0] = 0;
    strcpy(__str, "FAIL");
    v54[0] = 0;
    v54[1] = 0;
    int v16 = open("/dev/urandom", 0);
    if (v16 >= 1)
    {
      int v17 = v16;
      if (read(v16, v54, 0x10uLL) == 16)
      {
        uint64_t v18 = 0;
        v19 = __str;
        do
        {
          snprintf(v19, 3uLL, "%02X", *((unsigned __int8 *)v54 + v18++));
          v19 += 2;
        }
        while (v18 != 16);
      }
      close(v17);
    }
    HIBYTE(v50[2]) = 0;
    v50[3] = 0;
    int v51 = 0;
    uint64_t v52 = 0;
    *(void *)((char *)v53 + 5) = 0;
    v53[0] = 0;
    strcpy((char *)v50, "FAIL");
    __buf[0] = 0;
    __buf[1] = 0;
    arc4random_buf(__buf, 0x10uLL);
    uint64_t v20 = 0;
    v21 = (char *)v50;
    do
    {
      snprintf(v21, 3uLL, "%02X", *((unsigned __int8 *)__buf + v20++));
      v21 += 2;
    }
    while (v20 != 16);
    char v48 = 0;
    long long v47 = 0u;
    long long v46 = 0u;
    *(_DWORD *)buffer = 1279869254;
    CFUUIDRef v22 = CFUUIDCreate(v2);
    if (v22)
    {
      CFUUIDRef v23 = v22;
      CFStringRef v24 = CFUUIDCreateString(v2, v22);
      if (v24)
      {
        CFStringRef v25 = v24;
        CFStringGetCString(v24, buffer, 37, 0x8000100u);
        CFRelease(v25);
      }
      CFRelease(v23);
    }
    memset(v44, 0, sizeof(v44));
    timespec v41 = (timespec)xmmword_1A7CB0C50;
    gethostuuid(v44, &v41);
    arc4random_addrandom(v44, 16);
    *(void *)&v40.byte0 = 0;
    *(void *)&v40.byte8 = 0;
    arc4random_buf(&v40, 0x10uLL);
    CFUUIDRef v26 = CFUUIDCreateFromUUIDBytes(v2, v40);
    if (!v26)
    {
      CFStringRef v28 = 0;
LABEL_62:
      CFRelease(v15);
      goto LABEL_63;
    }
    CFUUIDRef v27 = v26;
    CFStringRef v28 = CFUUIDCreateString(v2, v26);
    if (!v28)
    {
LABEL_61:
      CFRelease(v27);
      goto LABEL_62;
    }
    CFDictionarySetValue(v15, @"AnonHostUUID2", v28);
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v13);
    v30 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xDC284E35uLL);
    if (v30)
    {
      v31 = v30;
      if (CFStringGetFileSystemRepresentation(v13, v30, MaximumSizeOfFileSystemRepresentation))
      {
        CFDataRef Data = CFPropertyListCreateData(v2, v15, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          CFDataRef v33 = Data;
          memset(&v43, 0, sizeof(v43));
          memset(&v42, 0, sizeof(v42));
          if (lstat(v31, &v42) < 0)
          {
            if (*__error() == 2)
            {
              mode_t v36 = umask(0);
              int v35 = open(v31, 2594, 420);
              umask(v36);
              if ((v35 & 0x80000000) == 0)
              {
                fchown(v35, 0xFFFFFFFF, 0xFFFFFFFF);
                goto LABEL_52;
              }
            }
          }
          else if (v42.st_mode == 33188 && v42.st_nlink == 1)
          {
            int v34 = open(v31, 546, 0);
            if ((v34 & 0x80000000) == 0)
            {
              int v35 = v34;
              if (!fstat(v34, &v43)
                && v43.st_nlink == v42.st_nlink
                && v43.st_uid == v42.st_uid
                && v43.st_mode == v42.st_mode
                && v43.st_ino == v42.st_ino
                && v43.st_dev == v42.st_dev)
              {
                ftruncate(v35, 0);
LABEL_52:
                CFIndex Length = CFDataGetLength(v33);
                BytePtr = CFDataGetBytePtr(v33);
                ssize_t v39 = write(v35, BytePtr, Length);
                if (v39 != Length && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  ___CRGetAnonHostUUID_block_invoke_cold_1((uint64_t)v31, Length, v39);
                }
                close(v35);
                CFRelease(v33);
                free(v31);
                if (v39) {
                  goto LABEL_61;
                }
                goto LABEL_60;
              }
              close(v35);
            }
          }
          CFRelease(v33);
        }
      }
      free(v31);
    }
LABEL_60:
    CFRelease(v28);
    CFStringRef v28 = 0;
    goto LABEL_61;
  }
}

void ___CRGetAnonHostUUID_block_invoke_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uid_t v6 = getuid();
  gid_t v7 = getgid();
  uid_t v8 = geteuid();
  gid_t v9 = getegid();
  int v10 = *__error();
  CFTypeID v11 = __error();
  CFStringRef v12 = strerror(*v11);
  int v13 = 136317186;
  uint64_t v14 = a1;
  __int16 v15 = 2048;
  uint64_t v16 = a3;
  __int16 v17 = 1024;
  int v18 = a2;
  __int16 v19 = 1024;
  uid_t v20 = v6;
  __int16 v21 = 1024;
  gid_t v22 = v7;
  __int16 v23 = 1024;
  uid_t v24 = v8;
  __int16 v25 = 1024;
  gid_t v26 = v9;
  __int16 v27 = 1024;
  int v28 = v10;
  __int16 v29 = 2080;
  v30 = v12;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Write failed to file %s - %zd of %d bytes written - uid: %d gid: %d, euid: %d egid: %d - error %d: %s", (uint8_t *)&v13, 0x44u);
}

@end