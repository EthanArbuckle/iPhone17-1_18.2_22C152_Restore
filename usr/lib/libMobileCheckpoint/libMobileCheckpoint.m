uint64_t MCCopyCheckpoint()
{
  int i;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  for (i = 4; ; --i)
  {
    if (_cacheValid())
    {
      v1 = [objc_alloc(NSDictionary) initWithContentsOfFile:@"/var/mobile/Library/Caches/Checkpoint.plist"];
      if (v1) {
        v2 = 0;
      }
      else {
        v2 = i == 4;
      }
      if (v2)
      {
        v4 = (void *)MEMORY[0x223C57320]();
        v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
        v6 = [v5 lastPathComponent];

        v7 = [NSString stringWithFormat:@"%@:%d: cache is invalid, asking server to rebuild it", v6, 70];
        syslog(5, "%s", (const char *)[v7 UTF8String]);
      }
      else
      {
        v3 = v1;
        if (v1) {
          return v3;
        }
      }
    }
    v8 = (void *)MEMORY[0x223C57320]();
    v9 = MOXPCTransportOpen();
    if (v9) {
      break;
    }
    if (!i) {
      goto LABEL_16;
    }
LABEL_15:
    usleep(0x3D090u);
  }
  v10 = v9;
  MOXPCTransportResume();
  v11 = getResponseForCommand(v10, 0);
  v3 = [v11 objectForKey:@"checkpoint"];

  v12 = getResponseForCommand(v10, 1);
  MOXPCTransportClose();
  if (v3) {
    return v3;
  }
  if (i) {
    goto LABEL_15;
  }
LABEL_16:
  v13 = (void *)MEMORY[0x223C57320]();
  v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
  v15 = [v14 lastPathComponent];

  v16 = [NSString stringWithFormat:@"%@:%d: talking to the server failed", v15, 86];
  syslog(5, "%s", (const char *)[v16 UTF8String]);

  return 0;
}

uint64_t _cacheValid()
{
  memset(&v6, 0, sizeof(v6));
  memset(&v5, 0, sizeof(v5));
  if (!stat("/var/mobile/Library/Caches/Checkpoint.plist", &v6)
    && !stat("/System/Library/CoreServices/Checkpoint.xml", &v5))
  {
    if (v6.st_mtimespec.tv_sec == v5.st_mtimespec.tv_sec && v6.st_mtimespec.tv_nsec == v5.st_mtimespec.tv_nsec) {
      return 1;
    }
    v1 = (void *)MEMORY[0x223C57320]();
    v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
    v3 = [v2 lastPathComponent];

    id v4 = [NSString stringWithFormat:@"%@:%d: cache %s doesn't match %s", v3, 18, "/var/mobile/Library/Caches/Checkpoint.plist", "/System/Library/CoreServices/Checkpoint.xml", *(void *)&v5.st_dev, v5.st_ino, *(void *)&v5.st_uid, *(void *)&v5.st_rdev, v5.st_atimespec.tv_sec, v5.st_atimespec.tv_nsec];
    syslog(5, "%s", (const char *)[v4 UTF8String]);
  }
  return 0;
}

uint64_t MCCopyCheckpointData()
{
  v0 = (void *)MEMORY[0x223C57320]();
  if (_cacheValid())
  {
    id v8 = 0;
    uint64_t v1 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:@"/var/mobile/Library/Caches/Checkpoint.plist" options:8 error:&v8];
    id v2 = v8;
    if (v1) {
      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x223C57320]();
    id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
    stat v5 = [v4 lastPathComponent];

    id v6 = [NSString stringWithFormat:@"%@:%d: mapping %s failed: %@", v5, 106, "/var/mobile/Library/Caches/Checkpoint.plist", v2];
    syslog(5, "%s", (const char *)[v6 UTF8String]);
  }
  id v2 = (id)MCCopyCheckpoint();
  if (v2)
  {
    uint64_t v1 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:0];
  }
  else
  {
    uint64_t v1 = 0;
  }
LABEL_7:

  return v1;
}

uint64_t MCCopyCheckpointValue(const void *a1)
{
  CFDictionaryRef theDict = 0;
  CFTypeRef cf = 0;
  id v2 = 0;
  v3 = 0;
  if (!_cacheValid()) {
    goto LABEL_9;
  }
  id v4 = (void *)MEMORY[0x223C57320]();
  id v17 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:@"/var/mobile/Library/Caches/Checkpoint.plist" options:8 error:&v17];
  id v5 = v17;
  id v6 = v5;
  if (!v3)
  {
    v9 = (void *)MEMORY[0x223C57320]();
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
    v11 = [v10 lastPathComponent];

    id v12 = [NSString stringWithFormat:@"%@:%d: mapping %s failed: %@", v11, 144, "/var/mobile/Library/Caches/Checkpoint.plist", v6];
    syslog(5, "%s", (const char *)[v12 UTF8String]);

    id v2 = 0;
    v3 = 0;
LABEL_8:

LABEL_9:
    v15 = (void *)MCCopyCheckpoint();
    uint64_t v8 = [v15 objectForKey:a1];

    goto LABEL_10;
  }

  id v2 = [objc_alloc(MEMORY[0x263EFFA08]) initWithObjects:a1, 0];
  if ((_CFPropertyListCreateFiltered() & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x223C57320]();
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m"];
    id v6 = [v13 lastPathComponent];

    id v14 = [NSString stringWithFormat:@"%@:%d: extracting %@ from %s failed: %@", v6, 154, a1, "/var/mobile/Library/Caches/Checkpoint.plist", cf];
    syslog(5, "%s", (const char *)[v14 UTF8String]);

    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(theDict, a1);
  uint64_t v8 = (uint64_t)Value;
  if (Value) {
    CFRetain(Value);
  }
LABEL_10:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (theDict) {
    CFRelease(theDict);
  }

  return v8;
}

id getResponseForCommand(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"command";
  id v2 = [NSNumber numberWithUnsignedInt:a2];
  v7[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  if (MOXPCTransportSendMessage()) {
    id v4 = (void *)MOXPCTransportReceiveMessage();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t MOXPCTransportClose()
{
  return MEMORY[0x270F4B398]();
}

uint64_t MOXPCTransportOpen()
{
  return MEMORY[0x270F4B3A0]();
}

uint64_t MOXPCTransportReceiveMessage()
{
  return MEMORY[0x270F4B3A8]();
}

uint64_t MOXPCTransportResume()
{
  return MEMORY[0x270F4B3B0]();
}

uint64_t MOXPCTransportSendMessage()
{
  return MEMORY[0x270F4B3B8]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x270EE56D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}