id sub_100001EB4(uint64_t a1)
{
  id v1;
  int v2;
  uint64_t v3;
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  id v15;
  NSNumber *v17;
  NSNumber *v18;
  uint64_t v19;
  unsigned int v20;
  NSNumber *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  id v25;
  unsigned int v26;
  unsigned int v27[3];
  unsigned int v28;
  NSNumber *v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v38 = 0;
  v1 = [objc_alloc((Class)NSScanner) initWithString:a1];
  if ([v1 isAtEnd])
  {
    v20 = 0;
    v30 = 0;
    *(void *)v27 = 0;
    v26 = 0;
    v22 = 0;
    v23 = 0;
    v28 = 0;
    v2 = 0;
    v31 = 0;
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v31 = 0;
    v2 = 0;
    v28 = 0;
    v24 = 0;
    v22 = 0;
    v23 = 0;
    v26 = 0;
    *(void *)v27 = 0;
    v30 = 0;
    v20 = 0;
    do
    {
      v37 = 0;
      [v1 scanUpToString:@"\n" intoString:&v37];
      v4 = objc_alloc((Class)NSScanner);
      v5 = [v4 initWithString:v37];
      if ([v5 scanString:@"Date=" intoString:0])
      {
        [v5 scanUpToString:@";" intoString:&v38];
      }
      else
      {
        [v5 scanUpToString:@"]" intoString:0];
        if ([v5 scanString:@"]" intoString:0])
        {
          v36 = 0;
          [v5 scanUpToString:@":" intoString:&v36];
          if ([v36 isEqualToString:@"reset"])
          {
            v35 = 0;
            v34 = 0;
            if ([v5 scanString:@": reason=" intoString:0])
            {
              [v5 scanUpToString:@";" intoString:&v34];
              if (([v34 isEqualToString:@"baseband crash"] & 1) != 0
                || [v34 rangeOfString:@"modem reset"] != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v3 = (v3 + 1);
                v6 = 1;
              }
              else
              {
                v6 = 0;
                v24 |= [v34 rangeOfString:@"FTO"] != (id)0x7FFFFFFFFFFFFFFFLL;
              }
            }
            else
            {
              [v5 scanUpToString:@";" intoString:0];
              v6 = 0;
            }
            [v5 scanString:@";uptime=" intoString:0];
            [v5 scanInt:&v35];
            ++v31;
            v8 = v35;
            if (!v6) {
              v8 = 0;
            }
            v2 += v8;
          }
          else if ([v36 isEqualToString:@"disconnect"])
          {
            v34 = 0;
            v35 = 0;
            v33 = 34;
            v32 = 0;
            [v5 scanUpToString:@"duration" intoString:0];
            if ([v5 scanString:@"duration=" intoString:0]) {
              [v5 scanInt:&v35];
            }
            [v5 scanUpToString:@"cause" intoString:0];
            if ([v5 scanString:@"cause=" intoString:0]) {
              [v5 scanUpToString:@";" intoString:&v34];
            }
            v7 = [v5 scanLocation];
            [v5 scanUpToString:@"txPower" intoString:0];
            if ([v5 scanString:@"txPower=" intoString:0]) {
              [v5 scanInt:(char *)&v33 + 4];
            }
            else {
              [v5 setScanLocation:v7];
            }
            v9 = [v5 scanLocation];
            [v5 scanUpToString:@"maxTxPower" intoString:0];
            if ([v5 scanString:@"maxTxPower=" intoString:0]) {
              [v5 scanInt:&v33];
            }
            else {
              [v5 setScanLocation:v9];
            }
            [v5 scanUpToString:@"rat" intoString:0];
            if ([v5 scanString:@"rat=" intoString:0]) {
              [v5 scanInt:&v32];
            }
            if (([v34 isEqualToString:@"kNoError"] & 1) != 0
              || (v24 & (v35 == 0)) != 1)
            {
              ++v28;
              v30 += [v34 isEqualToString:@"kNoError"] ^ 1;
              if (([v34 isEqualToString:@"kNoError"] & 1) == 0
                && ([v34 isEqualToString:@"kTemporaryFailure"] & 1) == 0
                && ([v34 isEqualToString:@"kCongestion"] & 1) == 0
                && ([v34 isEqualToString:@"kResourcesUnavailable"] & 1) == 0
                && ([v34 isEqualToString:@"kCallEndFade"] & 1) == 0
                && ([v34 isEqualToString:@"kNoNetworkService"] & 1) == 0)
              {
                if (v32 == 1001)
                {
                  ++HIDWORD(v22);
                }
                else if (v32 == 1000)
                {
                  LODWORD(v22) = v22 + 1;
                }
                else
                {
                  ++v20;
                }
              }
            }
            else
            {
              ++v27[0];
            }
            if (HIDWORD(v33) == v33)
            {
              ++v27[1];
            }
            else if (HIDWORD(v33) == v33 - 1)
            {
              ++v26;
            }
            else if (HIDWORD(v33) == v33 - 2)
            {
              LODWORD(v23) = v23 + 1;
            }
            else
            {
              v10 = HIDWORD(v23);
              if (HIDWORD(v33) == v33 - 3) {
                v10 = HIDWORD(v23) + 1;
              }
              HIDWORD(v23) = v10;
            }
            v24 = 0;
          }
        }
      }
    }
    while (![v1 isAtEnd]);
  }
  v25 = objc_alloc((Class)NSArray);
  v19 = kCFProblemTypeBasebandStats;
  v18 = +[NSNumber numberWithInt:v3];
  if (v3) {
    v11 = (v2 / (int)v3);
  }
  else {
    v11 = 0;
  }
  v17 = +[NSNumber numberWithInt:v11];
  v29 = +[NSNumber numberWithInt:v28];
  v21 = +[NSNumber numberWithInt:v20];
  *(void *)&v27[1] = +[NSNumber numberWithInt:v27[1]];
  v12 = +[NSNumber numberWithInt:v26];
  v13 = +[NSNumber numberWithInt:v23];
  v14 = +[NSNumber numberWithInt:HIDWORD(v23)];
  v15 = [v25 initWithObjects:v19, v18, v17, v29, v21, *(void *)&v27[1], v12, v13, v14, v38, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v31), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27[0]), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v22)), 0];

  return v15;
}

uint64_t sub_10000257C(void *a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if (objc_msgSend(objc_msgSend(a2, "pathExtension"), "isEqualToString:", @"txt")) {
    id v4 = [v4 stringByDeletingPathExtension];
  }
  id v6 = [v4 rangeOfString:@"stats" options:2];
  uint64_t v7 = kCFProblemTypeBasebandStats;
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = kCFProblemTypeBaseband;
  }
  else {
    uint64_t v8 = kCFProblemTypeBasebandStats;
  }
  id v9 = [[[a1 stringByAppendingString:v4] stringByAppendingPathExtension:@"plist"];
  id v10 = [objc_alloc((Class)NSString) initWithData:a3 encoding:4];
  if (!v10)
  {
    id v10 = [objc_alloc((Class)NSString) initWithData:a3 encoding:1];
    if (!v10) {
      id v10 = [objc_alloc((Class)NSString) initWithString:@"Invalid data in log file."];
    }
  }
  if (v7 == v8)
  {
    id v11 = sub_100001EB4((uint64_t)v10);
    logEventForAppleCare();
  }
  v12 = (void *)MGCopyAnswer();
  uint64_t v13 = kCRProblemReportProblemTypeKey;
  uint64_t v14 = kCRProblemReportDescriptionKey;
  uint64_t v15 = kCRProblemReportCrashReporterKey;
  uint64_t SysIDWithDescription = GetSysIDWithDescription();
  uint64_t v17 = kCRProblemReportSystemIDKey;
  id v18 = [+[OSASystemConfiguration sharedInstance] productNameVersionBuildString];
  [+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, v13, v10, v14, v12, v15, SysIDWithDescription, v17, v18, kCRProblemReportOSVersionKey, 0) writeToFile:v9 atomically:1];

  return 1;
}

uint64_t sub_100002760(void *a1, void *a2)
{
  id v4 = [a1 rangeOfCharacterFromSet:+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet")];
  id v5 = [a2 rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  id v7 = v5;
  id v8 = [a1 substringFromIndex:v4];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  id v9 = v8;
  id v10 = [a2 substringFromIndex:v7];

  return (uint64_t)[v9 compare:v10];
}

void sub_100002830(void *a1, unsigned int a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    id v4 = +[NSFileManager defaultManager];
    id v22 = 0;
    id v5 = [(NSFileManager *)v4 contentsOfDirectoryAtPath:a1 error:&v22];
    if (v5)
    {
      id v6 = v5;
      unsigned int v7 = [(NSArray *)v5 count];
      id v8 = [(NSArray *)v6 sortedArrayUsingFunction:sub_100002760 context:0];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          if (v7 <= a2) {
            break;
          }
          id v13 = [a1 stringByAppendingPathComponent:*(void *)(*((void *)&v18 + 1) + 8 * v12)];
          if ([(NSFileManager *)v4 removeItemAtPath:v13 error:&v22])
          {
            --v7;
          }
          else
          {
            uint64_t v14 = (__asl_object_s *)qword_100008130;
            uint64_t v15 = (const char *)[v13 UTF8String];
            asl_log(v14, 0, 3, "Failed remove log '%s' (%s)", v15, (const char *)[[[objc_msgSend(objc_msgSend(v22, "description"), "UTF8String") UTF8String];
          }
          if (v10 == (id)++v12)
          {
            id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
            if (v10) {
              goto LABEL_5;
            }
            return;
          }
        }
      }
    }
    else
    {
      v16 = (__asl_object_s *)qword_100008130;
      uint64_t v17 = (const char *)[a1 UTF8String];
      asl_log(v16, 0, 3, "Failed to get dir contents at '%s' (%s)", v17, (const char *)[[objc_msgSend(objc_msgSend(v22, "description"), "UTF8String") UTF8String]);
    }
  }
}

id sub_100002A20()
{
  v0 = +[NSFileManager defaultManager];
  id v1 = [[-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1)) stringByAppendingPathComponent:@"DBCShutdownCookie"];

  return (id)[(NSFileManager *)v0 fileExistsAtPath:v1];
}

void sub_100002A84()
{
  if ((sub_100002A20() & 1) == 0)
  {
    id v0 = objc_alloc_init((Class)NSData);
    [v0 writeToFile:[-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1)) stringByAppendingPathComponent:@"DBCShutdownCookie"] atomically:0];
  }
}

BOOL sub_100002B08()
{
  id v0 = +[NSFileManager defaultManager];
  id v1 = [[-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1)) stringByAppendingPathComponent:@"DBCShutdownCookie"];

  return [(NSFileManager *)v0 removeItemAtPath:v1 error:0];
}

uint64_t start()
{
  id v0 = objc_alloc_init((Class)NSAutoreleasePool);
  id v49 = 0;
  qword_100008130 = (uint64_t)asl_open("DumpBasebandCrash", "Crash Reporter", 0);
  sleep(5u);
  asl_log((asl_object_t)qword_100008130, 0, 7, "Launched DumpBasebandCrash");
  id v1 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/var/wireless/Library/Logs/Baseband/" error:&v49];
  if (!v1)
  {
    v2 = (__asl_object_s *)qword_100008130;
    v3 = (const char *)[@"/var/wireless/Library/Logs/Baseband/" UTF8String];
    asl_log(v2, 0, 3, "Failed to get log contents at '%s' (%s)", v3, (const char *)[[[objc_msgSend(objc_msgSend(v49, "description"), "UTF8String") UTF8String];
  }
  id v4 = getpwnam("mobile");
  if (v4)
  {
    id v5 = v4;
    uid_t v6 = getuid();
    int v7 = seteuid(v5->pw_uid);
    signed int v8 = 48;
    if (v7 != -1)
    {
      LOBYTE(keyExistsAndHasValidFormat.st_dev) = 0;
      signed int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BasebandLogLimit", @"com.apple.CrashReporter", (Boolean *)&keyExistsAndHasValidFormat);
      if (LOBYTE(keyExistsAndHasValidFormat.st_dev)) {
        signed int v8 = AppIntegerValue;
      }
      else {
        signed int v8 = 48;
      }
      seteuid(v6);
    }
  }
  else
  {
    signed int v8 = 48;
  }
  endpwent();
  if (sub_100002A20())
  {
    asl_log((asl_object_t)qword_100008130, 0, 3, "DumpBasebandCrash found old shutdown cookie");
    if (v8 != -1) {
      sub_100002830(@"/var/wireless/Library/Logs/Baseband/", 0);
    }
    sub_100002B08();
  }
  else
  {
    sub_100002A84();
  }
  id v10 = getpwnam("_wireless");
  if (v10)
  {
    uint64_t v11 = v10;
    uid_t v12 = getuid();
    if (seteuid(v11->pw_uid) != -1)
    {
      memset(&keyExistsAndHasValidFormat, 0, sizeof(keyExistsAndHasValidFormat));
      if (stat("/var/wireless/Library/Logs/CrashReporter/Baseband", &keyExistsAndHasValidFormat) == -1)
      {
        mkdir("/var/wireless/Library/Logs", 0x1EDu);
        mkdir("/var/wireless/Library/Logs/CrashReporter", 0x1EDu);
        if (mkdir("/var/wireless/Library/Logs/CrashReporter/Baseband", 0x1EDu)) {
          asl_log((asl_object_t)qword_100008130, 0, 3, "Failed to create CrashReporter/Baseband directory");
        }
      }
      seteuid(v12);
    }
  }
  endpwent();
  v42 = v0;
  if (v8 == -1)
  {
    asl_log((asl_object_t)qword_100008130, 0, 5, "Saving all baseband logs");
  }
  else
  {
    if ([(NSArray *)v1 count] <= v8)
    {
      unsigned int v13 = v8 - [(NSArray *)v1 count];
    }
    else
    {
      sub_100002830(@"/var/wireless/Library/Logs/Baseband/", v8);
      unsigned int v13 = 0;
    }
    sub_100002830(@"/var/wireless/Library/Logs/CrashReporter/Baseband/", v13);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = [(NSArray *)v1 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v14)
  {
    id v15 = v14;
    unsigned int v43 = 0;
    v16 = @"/var/wireless/Library/Logs/Baseband/";
    uint64_t v17 = *(void *)v45;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v1);
        }
        long long v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v20 = [(__CFString *)v16 stringByAppendingPathComponent:v19];
        long long v21 = (const std::__fs::filesystem::path *)[v20 fileSystemRepresentation];
        if (objc_msgSend(objc_msgSend(v20, "pathExtension"), "isEqualToString:", @"txt"))
        {
          id v22 = fopen((const char *)v21, "r");
          if (v22)
          {
            v23 = v22;
            id v24 = v15;
            uint64_t v25 = v17;
            v26 = v16;
            v27 = v1;
            fseek(v22, 0, 2);
            int64_t v28 = ftell(v23);
            rewind(v23);
            v29 = malloc_type_malloc(v28, 0x100004077774924uLL);
            if (!v29)
            {
              asl_log((asl_object_t)qword_100008130, 0, 3, "Failed de-nullification of '%s'", (const char *)v21);
              asl_close((asl_object_t)qword_100008130);
              exit(1);
            }
            v30 = v29;
            fread(v29, 1uLL, v28, v23);
            if (v28 >= 1)
            {
              v31 = v30;
              int64_t v32 = v28;
              do
              {
                if (!*v31) {
                  unsigned char *v31 = 46;
                }
                ++v31;
                --v32;
              }
              while (v32);
            }
            id v33 = [objc_alloc((Class)NSMutableData) initWithBytesNoCopy:v30 length:v28 freeWhenDone:1];
            if (v33)
            {
              sub_10000257C(@"/var/wireless/Library/Logs/CrashReporter/Baseband/", v19, (uint64_t)v33);
            }
            else
            {
              asl_log((asl_object_t)qword_100008130, 0, 3, "Failed to write baseband log '%s' to disk", (const char *)v21);
              ++v43;
            }
            id v1 = v27;

            v16 = v26;
            if (unlink((const char *)v21))
            {
              v39 = (__asl_object_s *)qword_100008130;
              v40 = __error();
              asl_log(v39, 0, 3, "Failed to remove baseband log '%s' (errno=%d)", (const char *)v21, *v40);
            }
            uint64_t v17 = v25;
            id v15 = v24;
          }
          else
          {
            v36 = (__asl_object_s *)qword_100008130;
            v37 = __error();
            v38 = strerror(*v37);
            asl_log(v36, 0, 3, "fopen of '%s' failed with %s", (const char *)v21, v38);
          }
        }
        else
        {
          v34 = (const std::__fs::filesystem::path *)[@"/var/wireless/Library/Logs/CrashReporter/Baseband/" stringByAppendingString:v19];
          rename(v21, v34, v35);
        }
      }
      id v15 = [(NSArray *)v1 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v15);
  }
  else
  {
    unsigned int v43 = 0;
  }
  sub_100002B08();
  asl_close((asl_object_t)qword_100008130);

  return v43;
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t GetSysIDWithDescription()
{
  return _GetSysIDWithDescription();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

int *__error(void)
{
  return ___error();
}

void asl_close(asl_object_t obj)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return _asl_log(client, msg, level, format);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

void endpwent(void)
{
}

void exit(int a1)
{
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t logEventForAppleCare()
{
  return _logEventForAppleCare();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return [a1 productNameVersionBuildString];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return [a1 scanLocation];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}