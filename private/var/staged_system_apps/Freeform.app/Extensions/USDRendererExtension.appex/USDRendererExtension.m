void sub_10000464C(id a1)
{
  void *v1;
  id v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0xACBDD60AuLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  v3 = (void *)qword_100095A20;
  qword_100095A20 = (uint64_t)v2;

  free(v1);
}

void sub_100004740(id a1)
{
  size_t size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0x3B240CF6uLL);
  sysctlbyname("hw.model", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  v3 = (void *)qword_100095A30;
  qword_100095A30 = (uint64_t)v2;

  free(v1);
}

void sub_100004BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004C0C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v9 = (void *)a1[4];
  v10 = [a2 substringToIndex:1];
  [v9 appendString:v10];

  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  unint64_t v11 = a1[6];
  if (v11) {
    LOBYTE(v11) = *(void *)(*(void *)(a1[5] + 8) + 24) >= v11;
  }
  *a7 = v11;
}

void sub_100004D8C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v14 = a2;
  if ((unint64_t)[v14 length] >= 2)
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"%@.%@" value:0 table:0];

    unint64_t v11 = *(void **)(a1 + 32);
    v12 = [v14 substringToIndex:1];
    v13 = [*(id *)(a1 + 40) substringFromIndex:[v14 length]];
    [v11 appendFormat:v10, v12, v13];
  }
  *a7 = 1;
}

void sub_1000059F8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100005A3C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100005F7C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100005FC0(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000648C(id a1)
{
  v1 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"*?+[(){}^$|\\./");
  objc_storeStrong((id *)&qword_100095A40, v1);
  if (!qword_100095A40)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100081B98);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005D5AC();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100081BB8);
    }
    id v2 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005D3DC(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_escapeForIcuRegex]_block_invoke");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 440, 0, "invalid nil value for '%{public}s'", "icuRegexCharSet");
  }
}

void sub_100006618(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000665C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

CFStringTokenizerTokenType sub_100007E7C(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFStringTokenizerTokenType v5 = Token;
      if (Token) {
        break;
      }
      if (CFStringTokenizerGetCurrentTokenRange(tokenizer).location == -1) {
        return v5;
      }
    }
    if (*(unsigned char *)(a1 + 32)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = (Token & 0x10) == 0;
    }
  }
  while (!v6);
  return v5;
}

void sub_100007F50(id a1)
{
  __int16 v3 = -4;
  id v1 = [objc_alloc((Class)NSString) initWithCharacters:&v3 length:1];
  id v2 = (void *)qword_100095A50;
  qword_100095A50 = (uint64_t)v1;
}

void sub_100008104(id a1)
{
  qword_100095A68 = +[NSCharacterSet characterSetWithCharactersInString:@"ـ‑-‐–—"];

  _objc_release_x1();
}

void sub_1000081B8(id a1)
{
  qword_100095A78 = +[NSCharacterSet characterSetWithCharactersInString:@"'\"’‘‚“”„«»‹›」「』『"];

  _objc_release_x1();
}

void sub_100008924(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100008968(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100008DEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(a1 + 32) rangeOfString:a2];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(void **)(a1 + 40);
    v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v6);
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

int64_t sub_100008E80(id a1, NSValue *a2, NSValue *a3)
{
  v4 = a3;
  id v5 = [(NSValue *)a2 rangeValue];
  id v6 = [(NSValue *)v4 rangeValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

void sub_1000091D0(id a1)
{
  uint64_t v1 = +[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 0, 32);
  id v2 = (void *)qword_100095A80;
  qword_100095A80 = v1;

  [(id)qword_100095A80 addCharactersInString:@"\"\\""];
  int v4 = 539566120;
  id v3 = [objc_alloc((Class)NSString) initWithCharacters:&v4 length:2];
  [(id)qword_100095A80 addCharactersInString:v3];
}

void sub_100009400(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100009444(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100009A74(id a1)
{
  CRLLogCreateCategory("CRLDefaultCat");
  CRLDefaultCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100009F74(id a1)
{
  id v4 = 0;
  id v1 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"<REDACT .*? REDACT>" options:8 error:&v4];
  id v2 = v4;
  id v3 = (void *)qword_100095A90;
  qword_100095A90 = (uint64_t)v1;
}

void sub_10000A19C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000A1E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

uint64_t sub_10000A1FC()
{
  return v0;
}

void sub_10000A3D8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A41C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A6A4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A6E8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A86C(id a1)
{
  qword_100095AA0 = objc_alloc_init(CRLLogHelper);

  _objc_release_x1();
}

void sub_10000AA74(id a1)
{
  CRLLogCreateCategory("CRLPerformanceCat");
  CRLPerformanceCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000AAB4(id a1)
{
  CRLLogCreateCategory("CRLPerformanceCat");
  CRLPerformanceCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

uint64_t CRLCapabilitiesDeviceTypeFromHWModelString(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet decimalDigitCharacterSet];
  id v3 = [v1 componentsSeparatedByCharactersInSet:v2];

  id v4 = [v3 firstObject];

  if ([v4 length])
  {
    if ([v4 isEqualToString:@"iPad"])
    {
      uint64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"iPhone"])
    {
      uint64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"iPod"])
    {
      uint64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"iMac"])
    {
      uint64_t v5 = 4;
    }
    else if ([v4 isEqualToString:@"MacBook"])
    {
      uint64_t v5 = 5;
    }
    else if ([v4 isEqualToString:@"MacBookAir"])
    {
      uint64_t v5 = 6;
    }
    else if ([v4 isEqualToString:@"MacBookPro"])
    {
      uint64_t v5 = 7;
    }
    else if ([v4 isEqualToString:@"Macmini"])
    {
      uint64_t v5 = 8;
    }
    else if ([v4 isEqualToString:@"MacPro"])
    {
      uint64_t v5 = 9;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_10000B4DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) p_isMetalCapable];
  byte_100095AB8 = (char)result;
  return result;
}

void sub_10000B554(id a1)
{
  qword_100095AC8 = objc_alloc_init(CRLCapabilities);

  _objc_release_x1();
}

void sub_10000B794(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000B7D8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000B9C8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BA0C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BBB0(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BBF4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BE18(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BE5C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BEA0(id a1)
{
  qword_100095AD0 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

uint64_t sub_10000BFE8(uint64_t result)
{
  byte_100095AE0 = (*(void *)(*(void *)(result + 32) + 24) > 0x1AuLL) | (0xFFF9FFu >> *(void *)(*(void *)(result + 32) + 24)) & 1;
  return result;
}

void sub_10000C04C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

os_log_t CRLLogCreateCategory(char *category)
{
  os_log_t v1 = os_log_create("com.apple.freeform", category);

  return v1;
}

id sub_10000C26C(void *a1)
{
  id result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000C350(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_10000C478(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C488(uint64_t a1)
{
}

uint64_t sub_10000C490(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];

  return _objc_release_x1();
}

uint64_t sub_10000C5D0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSSet setWithSet:*(void *)(*(void *)(a1 + 32) + 8)];

  return _objc_release_x1();
}

id sub_10000C6C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

id sub_10000C764(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

uint64_t sub_10000C860(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) description];

  return _objc_release_x1();
}

id CRLLogGetNameDictionary()
{
  if (qword_100095AF8 != -1) {
    dispatch_once(&qword_100095AF8, &stru_100082060);
  }
  uint64_t v0 = (void *)qword_100095AF0;

  return v0;
}

void sub_10000C948(id a1)
{
  qword_100095AF0 = +[NSMapTable strongToStrongObjectsMapTable];

  _objc_release_x1();
}

id CRLLogEnsureCreated(void *a1, id *a2, dispatch_once_t *a3)
{
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000CA58;
  v13 = &unk_100082088;
  id v14 = a1;
  v15 = a2;
  dispatch_once_t v5 = *a3;
  id v6 = a1;
  if (v5 != -1) {
    dispatch_once(a3, &v10);
  }
  v7 = CRLLogGetNameDictionary();
  [v7 setObject:v6 forKey:*a2];

  id v8 = *a2;
  return v8;
}

void sub_10000CA58(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.freeform", (const char *)[*(id *)(a1 + 32) UTF8String]);

  **(void **)(a1 + 40) = v2;
}

intptr_t CRLDynamicBaseAddress()
{
  uint64_t v0 = getsectbyname("__TEXT", "__text");
  uint64_t addr = v0->addr;
  uint64_t offset = v0->offset;
  bufsize_t size = 1024;
  if (_NSGetExecutablePath(buf, &bufsize))
  {
    intptr_t image_vmaddr_slide = -1;
  }
  else if (_dyld_image_count())
  {
    uint32_t v4 = 0;
    while (1)
    {
      image_name = _dyld_get_image_name(v4);
      if (!strcmp(image_name, buf)) {
        break;
      }
      if (++v4 >= _dyld_image_count()) {
        goto LABEL_7;
      }
    }
    intptr_t image_vmaddr_slide = _dyld_get_image_vmaddr_slide(v4);
  }
  else
  {
LABEL_7:
    intptr_t image_vmaddr_slide = 0;
  }
  return addr - offset + image_vmaddr_slide;
}

void sub_10000CE8C(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &stru_1000820A8);
  }
  id v6 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    sub_10005DB7C(v6);
    if (a3) {
      goto LABEL_5;
    }
  }
  else if (a3)
  {
LABEL_5:
    v7 = *(void **)(a1 + 32);
    id v8 = +[NSString stringWithFormat:@"Terminating application due to %@", v5];
LABEL_9:
    uint64_t v9 = v8;
    [v7 addObject:v8];

    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [v5 copy];
    goto LABEL_9;
  }
LABEL_10:
}

void sub_10000CF70(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D038(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D118(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D85C(id a1)
{
  uint64_t v1 = +[NSDictionary sharedKeySetForKeys:&off_100086668];
  os_log_t v2 = (void *)qword_100095B10;
  qword_100095B10 = v1;

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint32_t v4 = (void *)qword_100095B18;
  qword_100095B18 = (uint64_t)v3;

  dword_100095B20 = 0;
}

void sub_10000D948(id a1)
{
  uint64_t v1 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  if (v1) {
    uint64_t v1 = dlsym(v1, "SimulateCrash");
  }
  off_100095B28 = v1;
}

void CRLSetCrashReporterInfov(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  uint64_t v8 = a2;
  os_log_t v2 = +[NSString stringWithUTF8String:a1];
  id v3 = [objc_alloc((Class)NSString) crl_initRedactedWithFormat:v2 arguments:v7];
  uint32_t v4 = (const char *)[v3 UTF8String];
  id v6 = 0;
  if (v4)
  {
    asprintf(&v6, "%s", v4);
    id v5 = v6;
  }
  else
  {
    id v5 = 0;
  }
  if (!v5) {
    id v5 = "CRLSetCrashReporterInfo: unknown reason";
  }
  __crashreporter_info__ = (uint64_t)v5;
}

uint64_t sub_10000DD00(uint64_t a1)
{
  return sub_10000DD68(a1, (void (*)(void))&type metadata accessor for JSONEncoder, (uint64_t (*)(void))&JSONEncoder.init(), &qword_10009D468);
}

uint64_t sub_10000DD34(uint64_t a1)
{
  return sub_10000DD68(a1, (void (*)(void))&type metadata accessor for JSONDecoder, (uint64_t (*)(void))&JSONDecoder.init(), &qword_10009D470);
}

uint64_t sub_10000DD68(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

id sub_10000DDBC(uint64_t a1)
{
  return sub_10000DDE4(a1, &protocolRef__CRLUSDAsyncRenderingDelegateXPC, &qword_10009D478);
}

id sub_10000DDD0(uint64_t a1)
{
  return sub_10000DDE4(a1, &protocolRef__CRLUSDAsyncRenderingXPC, &qword_10009D480);
}

id sub_10000DDE4(uint64_t a1, void *a2, void *a3)
{
  id result = [self interfaceWithProtocol:*a2];
  *a3 = result;
  return result;
}

id sub_10000DE30()
{
  id v0 = [self interfaceWithProtocol:&OBJC_PROTOCOL___CRLUSDRenderingExtensionAPIEndpointProtocol];
  if (qword_100092EE0 != -1) {
    swift_once();
  }
  [v0 setInterface:qword_10009D478 forSelector:"makeCoreRERendererProxyForUUID:delegateProxy:flags:response:" argumentIndex:1 ofReply:0];
  if (qword_100092EE8 != -1) {
    swift_once();
  }
  id result = [v0 setInterface:qword_10009D480 forSelector:"makeCoreRERendererProxyForUUID:delegateProxy:flags:response:" argumentIndex:0 ofReply:1];
  qword_10009D488 = (uint64_t)v0;
  return result;
}

BOOL sub_10000DF38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000DF4C()
{
  Swift::UInt v1 = *v0;
  sub_10005ED40();
  sub_10005ED50(v1);
  return sub_10005EDA0();
}

void sub_10000DF94()
{
  sub_10005ED50(*v0);
}

Swift::Int sub_10000DFC0()
{
  Swift::UInt v1 = *v0;
  sub_10005ED40();
  sub_10005ED50(v1);
  return sub_10005EDA0();
}

unint64_t sub_10000E004()
{
  unint64_t v1 = 0x656E6E6F63736964;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_10000E06C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016430(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E094()
{
  return 0;
}

void sub_10000E0A0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10000E0AC(uint64_t a1)
{
  unint64_t v2 = sub_1000196A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E0E8(uint64_t a1)
{
  unint64_t v2 = sub_1000196A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E124(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a3;
  uint64_t v25 = a2;
  uint64_t v4 = sub_100015F58(&qword_100093740);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin();
  v24 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093748);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093750);
  uint64_t v21 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100015F58(&qword_100093758);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_1000196A8();
  uint64_t v16 = v28;
  sub_10005EE00();
  if (!v16)
  {
    char v29 = 0;
    sub_1000197F4();
    sub_10005EBB0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  if (v16 == 1)
  {
    char v30 = 1;
    sub_1000197A0();
    sub_10005EBB0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  char v31 = 2;
  sub_10001974C();
  v18 = v24;
  sub_10005EBB0();
  uint64_t v19 = v27;
  sub_10005EBD0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_10000E4DC()
{
  return 0;
}

uint64_t sub_10000E4E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_10000E518(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000E524(uint64_t a1)
{
  unint64_t v2 = sub_1000197A0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E560(uint64_t a1)
{
  unint64_t v2 = sub_1000197A0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t variable initialization expression of CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed()
{
  return 1;
}

Swift::Int sub_10000E5A4()
{
  return sub_10005EDA0();
}

void sub_10000E5E8()
{
}

Swift::Int sub_10000E610()
{
  return sub_10005EDA0();
}

uint64_t sub_10000E650()
{
  return 12383;
}

uint64_t sub_10000E65C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10005EC40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000E6DC(uint64_t a1)
{
  unint64_t v2 = sub_10001974C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E718(uint64_t a1)
{
  unint64_t v2 = sub_10001974C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E754(uint64_t a1)
{
  unint64_t v2 = sub_1000197F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E790(uint64_t a1)
{
  unint64_t v2 = sub_1000197F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E7DC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100016598(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10000E808(void *a1)
{
  return sub_10000E124(a1, *v1, v1[1]);
}

Swift::Int sub_10000E824()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_10005ED40();
  if (v1)
  {
    if (v1 != 1)
    {
      sub_10005ED50(2uLL);
      sub_10005E770();
      return sub_10005EDA0();
    }
    Swift::UInt v2 = 1;
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  sub_10005ED50(v2);
  return sub_10005EDA0();
}

void sub_10000E8A4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1)
  {
    Swift::UInt v2 = 0;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    Swift::UInt v2 = 1;
LABEL_5:
    sub_10005ED50(v2);
    return;
  }
  sub_10005ED50(2uLL);

  sub_10005E770();
}

Swift::Int sub_10000E92C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_10005ED40();
  if (v1)
  {
    if (v1 != 1)
    {
      sub_10005ED50(2uLL);
      sub_10005E770();
      return sub_10005EDA0();
    }
    Swift::UInt v2 = 1;
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  sub_10005ED50(v2);
  return sub_10005EDA0();
}

uint64_t sub_10000E9A8(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a2[1];
  if (!v3) {
    return !v4;
  }
  if (v3 == 1) {
    return v4 == 1;
  }
  if (v4 < 2) {
    return 0;
  }
  if (*a1 != *a2 || v3 != v4) {
    return sub_10005EC40();
  }
  return 1;
}

uint64_t sub_10000EA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a3;
  v5[7] = a4;
  v5[4] = a1;
  v5[5] = a2;
  v5[3] = v4;
  v5[8] = sub_10005E860();
  v5[9] = sub_10005E850();
  uint64_t v7 = sub_10005E800();
  v5[10] = v7;
  v5[11] = v6;
  return _swift_task_switch(sub_10000EAAC, v7, v6);
}

uint64_t sub_10000EAAC()
{
  long long v8 = *(_OWORD *)(v0 + 48);
  uint64_t v1 = sub_10005E850();
  *(void *)(v0 + 96) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *(void *)(v2 + 16) = v0 + 24;
  *(_OWORD *)(v2 + 24) = v8;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v3;
  uint64_t v4 = sub_100015F58(&qword_100093558);
  void *v3 = v0;
  v3[1] = sub_10000EBC8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, v1, &protocol witness table for MainActor, v5, v6, sub_100015F08, v2, v4);
}

uint64_t sub_10000EBC8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000ED54;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000ECEC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000ECEC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10000ED54()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000EDCC(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = a4;
  uint64_t v23 = a3;
  uint64_t v12 = sub_100015F58(a5);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  v15 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v17 + v16, (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = a7;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F088;
  aBlock[3] = a8;
  v18 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  id v19 = [v15 remoteObjectProxyWithErrorHandler:v18, v22];
  swift_unknownObjectRelease();
  _Block_release(v18);
  sub_10005E9A0();
  swift_unknownObjectRelease();
  sub_100015FCC((uint64_t)aBlock, (uint64_t)v25);
  sub_100016028();
  swift_dynamicCast();
  v25[0] = v24;
  id v20 = v24;
  v23(v25, a1);

  return sub_1000196FC((uint64_t)aBlock);
}

uint64_t sub_10000F040(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10005E810();
}

void sub_10000F088(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000F0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a3;
  v5[6] = a4;
  v5[3] = a1;
  v5[4] = a2;
  v5[7] = sub_10005E860();
  v5[8] = sub_10005E850();
  v5[2] = v4;
  v5[9] = sub_10005E850();
  uint64_t v7 = sub_10005E800();
  v5[10] = v7;
  v5[11] = v6;
  return _swift_task_switch(sub_10000F1AC, v7, v6);
}

uint64_t sub_10000F1AC()
{
  long long v7 = *(_OWORD *)(v0 + 40);
  uint64_t v1 = sub_10005E850();
  *(void *)(v0 + 96) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *(void *)(v2 + 16) = v0 + 16;
  *(_OWORD *)(v2 + 24) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v3;
  void *v3 = v0;
  v3[1] = sub_10000F2B0;
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v3, v1, &protocol witness table for MainActor, v4, v5, sub_100016234, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_10000F2B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000F458;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000F3D4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000F3D4()
{
  swift_release();
  uint64_t v1 = sub_10005E800();
  return _swift_task_switch(sub_100019F74, v1, v0);
}

uint64_t sub_10000F458()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = sub_10005E800();
  return _swift_task_switch(sub_100019FB8, v1, v0);
}

uint64_t sub_10000F4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a3;
  v5[6] = a4;
  v5[3] = a1;
  v5[4] = a2;
  v5[7] = sub_10005E860();
  v5[8] = sub_10005E850();
  v5[2] = v4;
  v5[9] = sub_10005E850();
  uint64_t v7 = sub_10005E800();
  v5[10] = v7;
  v5[11] = v6;
  return _swift_task_switch(sub_10000F5B4, v7, v6);
}

uint64_t sub_10000F5B4()
{
  long long v7 = *(_OWORD *)(v0 + 40);
  uint64_t v1 = sub_10005E850();
  *(void *)(v0 + 96) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *(void *)(v2 + 16) = v0 + 16;
  *(_OWORD *)(v2 + 24) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v3;
  void *v3 = v0;
  v3[1] = sub_10000F6B8;
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v3, v1, &protocol witness table for MainActor, v4, v5, sub_100016CB8, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_10000F6B8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000F8C4;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_10000F7DC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000F7DC()
{
  swift_release();
  uint64_t v1 = sub_10005E800();
  return _swift_task_switch(sub_10000F860, v1, v0);
}

uint64_t sub_10000F860()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F8C4()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = sub_10005E800();
  return _swift_task_switch(sub_10000F964, v1, v0);
}

uint64_t sub_10000F964()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10000F9C8(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    uint64_t v1 = (void *)sub_10005DDB0();
    uint64_t v2 = sub_10002C86C(v1);
    if (v4 == -1)
    {
      sub_100015F58(&qword_100093580);
      sub_10005E810();
    }
    else
    {
      uint64_t v5 = v2;
      uint64_t v6 = v3;
      char v7 = v4;
      sub_1000161C4();
      swift_allocError();
      *(void *)uint64_t v8 = v5;
      *(void *)(v8 + 8) = v6;
      *(unsigned char *)(v8 + 16) = v7;
      sub_100015F58(&qword_100093580);
      sub_10005E810();
      swift_errorRelease();
    }
  }
  else
  {
    sub_100015F58(&qword_100093580);
    sub_10005E820();
  }
}

uint64_t sub_10000FAB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  sub_100015F58(&qword_100093678);
  v7[6] = swift_task_alloc();
  sub_10005E860();
  v7[7] = sub_10005E850();
  uint64_t v9 = sub_10005E800();
  return _swift_task_switch(sub_10000FB84, v9, v8);
}

uint64_t sub_10000FB84()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[5];
  uint64_t v3 = (void (*)(uint64_t, void))v0[2];
  swift_release();
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
  uint64_t v5 = sub_10005DED0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 0, 1, v5);
  v3(v1, 0);
  sub_100018EAC(v1);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_10000FCF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015F58(&qword_100093678);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018E44(a1, (uint64_t)v8);
  uint64_t v9 = sub_10005DED0();
  uint64_t v10 = *(void *)(v9 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    Class isa = sub_10005DE90().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  if (a2) {
    uint64_t v12 = (void *)sub_10005DDB0();
  }
  else {
    uint64_t v12 = 0;
  }
  (*(void (**)(uint64_t, Class, void *))(a3 + 16))(a3, isa, v12);
}

uint64_t sub_10000FE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = v13;
  v8[7] = v14;
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a4;
  v8[3] = a5;
  v8[8] = type metadata accessor for CRLUSDRendering.SceneRequest(0);
  v8[9] = swift_task_alloc();
  sub_10005E860();
  v8[10] = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  v8[11] = v10;
  v8[12] = v9;
  return _swift_task_switch(sub_10000FF14, v10, v9);
}

uint64_t sub_10000FF14()
{
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_100018D98(&qword_100093670, (void (*)(uint64_t))type metadata accessor for CRLUSDRendering.SceneRequest);
  sub_10005DD10();
  uint64_t v7 = v0[3];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 16) + **(int **)(v7 + 16));
  uint64_t v2 = (void *)swift_task_alloc();
  v0[13] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001012C;
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[3];
  return v6(v3, ObjectType, v4);
}

uint64_t sub_10001012C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  sub_100018DE0(v3);
  uint64_t v4 = *(void *)(v2 + 96);
  uint64_t v5 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v6 = sub_1000102FC;
  }
  else {
    uint64_t v6 = sub_100010284;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_100010284()
{
  uint64_t v1 = *(void (**)(void))(v0 + 48);
  swift_release();
  v1(0);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000102FC()
{
  swift_release();
  uint64_t v1 = v0[14];
  uint64_t v2 = (void (*)(uint64_t))v0[6];
  swift_errorRetain();
  v2(v1);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_1000103B0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10005DDB0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100010414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[24] = v13;
  v8[25] = v14;
  v8[22] = a7;
  v8[23] = a8;
  v8[21] = a5;
  v8[11] = a4;
  sub_10005E860();
  v8[26] = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  v8[27] = v10;
  v8[28] = v9;
  return _swift_task_switch(sub_1000104C0, v10, v9);
}

uint64_t sub_1000104C0()
{
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_100018BF4();
  sub_10005DD10();
  uint64_t v8 = *(void *)(v0 + 168);
  uint64_t ObjectType = swift_getObjectType();
  long long v2 = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 64) = v2;
  *(void *)(v0 + 80) = *(void *)(v0 + 160);
  long long v3 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = v3;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 24) + **(int **)(v8 + 24));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v4;
  void *v4 = v0;
  v4[1] = sub_1000106C0;
  uint64_t v5 = *(void *)(v0 + 168);
  return v7(v0 + 16, ObjectType, v5);
}

uint64_t sub_1000106C0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 216);
  uint64_t v4 = *(void *)(v2 + 224);
  if (v0) {
    uint64_t v5 = sub_100010844;
  }
  else {
    uint64_t v5 = sub_1000107D4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000107D4()
{
  uint64_t v1 = *(void (**)(void))(v0 + 192);
  swift_release();
  v1(0);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100010844()
{
  swift_release();
  uint64_t v1 = v0[30];
  uint64_t v2 = (void (*)(uint64_t))v0[24];
  swift_errorRetain();
  v2(v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1000108F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v13;
  v8[8] = v14;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a4;
  v8[4] = a5;
  sub_10005E860();
  v8[9] = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  v8[10] = v10;
  v8[11] = v9;
  return _swift_task_switch(sub_100010998, v10, v9);
}

uint64_t sub_100010998()
{
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_100015F58(&qword_100093588);
  sub_100018944(&qword_100093638, (void (*)(void))sub_1000189B4);
  sub_10005DD10();
  uint64_t v7 = v0[4];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = v0[2];
  v0[12] = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 40) + **(int **)(v7 + 40));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[13] = v3;
  void *v3 = v0;
  v3[1] = sub_100010BBC;
  uint64_t v4 = v0[4];
  return v6(v2, ObjectType, v4);
}

uint64_t sub_100010BBC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_100010D48;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_100010CD8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100010CD8()
{
  uint64_t v1 = *(void (**)(void))(v0 + 56);
  swift_release();
  v1(0);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100010D48()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[14];
  uint64_t v2 = (void (*)(uint64_t))v0[7];
  swift_errorRetain();
  v2(v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_100010E00(void *a1, int a2, void *a3, void *aBlock, void (*a5)(uint64_t, unint64_t, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = a3;
  id v13 = a1;
  uint64_t v10 = sub_10005DE30();
  unint64_t v12 = v11;

  _Block_copy(v8);
  a5(v10, v12, v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_100016114(v10, v12);
}

uint64_t sub_100010EC0(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a7;
  v8[3] = a8;
  uint64_t v11 = sub_10005E5C0();
  v8[4] = v11;
  v8[5] = *(void *)(v11 - 8);
  v8[6] = swift_task_alloc();
  v8[7] = sub_10005E860();
  v8[8] = sub_10005E850();
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, __n128))(*(void *)(a6 + 48) + **(int **)(a6 + 48));
  id v13 = (void *)swift_task_alloc();
  v8[9] = v13;
  void *v13 = v8;
  v13[1] = sub_100011054;
  v14.n128_f32[0] = a1;
  return v16(ObjectType, a6, v14);
}

uint64_t sub_100011054(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  uint64_t v5 = sub_10005E800();
  if (v1) {
    uint64_t v6 = sub_1000113EC;
  }
  else {
    uint64_t v6 = sub_1000111B4;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_1000111B4()
{
  uint64_t v1 = v0[10];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (CGImage *)v0[10];
    CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
    if (Mutable)
    {
      uint64_t v4 = Mutable;
      uint64_t v6 = v0[5];
      uint64_t v5 = v0[6];
      uint64_t v7 = v0[4];
      sub_10005E5B0();
      sub_10005E5A0();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      uint64_t v8 = (__CFString *)sub_10005E6F0();
      swift_bridgeObjectRelease();
      id v9 = CGImageDestinationCreateWithData(v4, v8, 1uLL, 0);

      if (v9)
      {
        CGImageDestinationAddImage(v9, v2, 0);
        if (CGImageDestinationFinalize(v9))
        {
          uint64_t v10 = (void (*)(uint64_t, unint64_t, void))v0[2];
          uint64_t v11 = v4;
          uint64_t v12 = sub_10005DE30();
          unint64_t v14 = v13;

          sub_10001616C(v12, v14);
          v10(v12, v14, 0);
          sub_100016114(v12, v14);
          sub_100016114(v12, v14);

          goto LABEL_11;
        }
      }
      else
      {
        id v9 = v4;
      }
    }
    sub_1000161C4();
    uint64_t v15 = swift_allocError();
    *(void *)uint64_t v16 = 0xD000000000000019;
    *(void *)(v16 + 8) = 0x800000010006E060;
    *(unsigned char *)(v16 + 16) = 0;
    swift_willThrow();

    uint64_t v17 = (void (*)(void, unint64_t, uint64_t))v0[2];
    swift_errorRetain();
    v17(0, 0xF000000000000000, v15);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    ((void (*)(void, unint64_t, void))v0[2])(0, 0xF000000000000000, 0);
  }
LABEL_11:
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_1000113EC()
{
  swift_release();
  uint64_t v1 = v0[11];
  uint64_t v2 = (void (*)(void, unint64_t, uint64_t))v0[2];
  swift_errorRetain();
  v2(0, 0xF000000000000000, v1);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_10001150C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_10005DDB0();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = sub_10005DE20().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_1000115E8(void **a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v4 = sub_100015F58(&qword_100093580);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = *a1;
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  type metadata accessor for CRLUSDRendering.SceneRequest(0);
  sub_100018D98(&qword_1000935A8, (void (*)(uint64_t))type metadata accessor for CRLUSDRendering.SceneRequest);
  uint64_t v8 = sub_10005DD20();
  if (!v2)
  {
    uint64_t v10 = v8;
    unint64_t v11 = v9;
    Class isa = sub_10005DE20().super.isa;
    sub_100016114(v10, v11);
    uint64_t v13 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v4);
    unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v15 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    aBlock[4] = sub_1000163B8;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100011864;
    aBlock[3] = &unk_1000826D8;
    uint64_t v16 = _Block_copy(aBlock);
    swift_release();
    [v7 loadScene:isa response:v16];
    _Block_release(v16);
  }
}

void sub_100011864(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000118D0(void **a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v27 = a2;
  uint64_t v7 = sub_100015F58(&qword_100093580);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = *a1;
  long long v11 = a4[3];
  long long v24 = a4[2];
  long long v25 = v11;
  uint64_t v26 = *((void *)a4 + 8);
  long long v12 = a4[1];
  long long aBlock = *a4;
  long long v23 = v12;
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  sub_100016B60();
  uint64_t v13 = sub_10005DD20();
  if (!v4)
  {
    uint64_t v15 = v13;
    unint64_t v16 = v14;
    Class isa = sub_10005DE20().super.isa;
    sub_100016114(v15, v16);
    uint64_t v18 = v7;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v7);
    unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v20 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v20 + v19, (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    *(void *)&long long v24 = sub_1000163B8;
    *((void *)&v24 + 1) = v20;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v23 = sub_100011864;
    *((void *)&v23 + 1) = &unk_100082688;
    uint64_t v21 = _Block_copy(&aBlock);
    swift_release();
    [v10 updateScene:isa response:v21];
    _Block_release(v21);
  }
}

void sub_100011B2C(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a2;
  uint64_t v7 = sub_100015F58(&qword_100093580);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  id v22 = *a1;
  aBlock[0] = a4;
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  sub_100015F58(&qword_100093588);
  sub_100018944(&qword_100093590, (void (*)(void))sub_100016358);
  uint64_t v10 = sub_10005DD20();
  if (!v4)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    Class isa = sub_10005DE20().super.isa;
    sub_100016114(v12, v13);
    uint64_t v15 = v7;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v7);
    unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v17 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v16, (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
    aBlock[4] = sub_1000163B8;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100011864;
    aBlock[3] = &unk_100082638;
    uint64_t v18 = _Block_copy(aBlock);
    swift_release();
    [v22 performActions:isa response:v18];
    _Block_release(v18);
  }
}

void sub_100011DB4(void **a1, uint64_t a2, float a3)
{
  uint64_t v6 = sub_100015F58(&qword_100093560);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_100016074;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000120F0;
  aBlock[3] = &unk_100082598;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  *(float *)&double v13 = a3;
  [v9 takeSnapshotAt:v12 response:v13];
  _Block_release(v12);
}

void sub_100011F78(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      swift_errorRetain();
      sub_100015F58(&qword_100093560);
      sub_10005E810();
    }
    else
    {
      sub_100015F58(&qword_100093560);
      sub_10005E820();
    }
  }
  else
  {
    sub_10001616C(a1, a2);
    CFDataRef isa = sub_10005DE20().super.isa;
    uint64_t v6 = CGImageSourceCreateWithData(isa, 0);

    if (v6)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
      if (ImageAtIndex)
      {
        uint64_t v8 = ImageAtIndex;
        sub_100015F58(&qword_100093560);
        sub_10005E820();
        sub_100016100(a1, a2);

        return;
      }
    }
    sub_1000161C4();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD000000000000019;
    *(void *)(v9 + 8) = 0x800000010006DEB0;
    *(unsigned char *)(v9 + 16) = 0;
    sub_100015F58(&qword_100093560);
    sub_10005E810();
    sub_100016100(a1, a2);
  }
}

uint64_t sub_1000120F0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_10005DE30();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_100016100((uint64_t)v4, v8);

  return swift_release();
}

uint64_t sub_10001219C()
{
  return sub_100015644(&OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared24AsyncRendererSenderProxy_uuid);
}

uint64_t sub_1000121A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared24AsyncRendererSenderProxy_uuid;
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10001221C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_10005E860();
  v2[4] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_1000122B4, v4, v3);
}

uint64_t sub_1000122B4()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[3].i64[1] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v4 = (uint64_t (*)(uint64_t, unint64_t, void (*)(void **, uint64_t), int8x16_t *))((char *)&dword_100093578 + dword_100093578);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[4].i64[0] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000123B0;
  return v4(0x6E65635364616F6CLL, 0xED0000293A5F2865, sub_100016BC0, v1);
}

uint64_t sub_1000123B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_100019FBC;
  }
  else {
    uint64_t v5 = sub_100019FC4;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100012508(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_10005E860();
  v2[4] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_1000125A0, v4, v3);
}

uint64_t sub_1000125A0()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[3].i64[1] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v4 = (uint64_t (*)(uint64_t, unint64_t, void (*)(void **, uint64_t), int8x16_t *))((char *)&dword_100093578 + dword_100093578);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[4].i64[0] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001269C;
  return v4(0x6353657461647075, 0xEF293A5F28656E65, sub_100016B44, v1);
}

uint64_t sub_10001269C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_100012858;
  }
  else {
    uint64_t v5 = sub_1000127F4;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000127F4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012858()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000128BC(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_10005E860();
  v2[4] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_100012954, v4, v3);
}

uint64_t sub_100012954()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[3].i64[1] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v4 = (uint64_t (*)(unint64_t, unint64_t, void (*)(id *, uint64_t), int8x16_t *))((char *)&dword_100093578 + dword_100093578);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[4].i64[0] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000123B0;
  return v4(0xD000000000000012, 0x800000010006DED0, sub_100016218, v1);
}

uint64_t sub_100012A48(float a1)
{
  *(void *)(v2 + 16) = v1;
  *(float *)(v2 + 80) = a1;
  sub_10005E860();
  *(void *)(v2 + 24) = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v3;
  return _swift_task_switch(sub_100012AE4, v4, v3);
}

uint64_t sub_100012AE4()
{
  int v1 = *(_DWORD *)(v0 + 80);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(_DWORD *)(v2 + 16) = v1;
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, void (*)(void **, uint64_t), uint64_t))((char *)&dword_100093550 + dword_100093550);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  void *v3 = v0;
  v3[1] = sub_100012BD4;
  return v5(0xD000000000000011, 0x800000010006DE50, sub_1000158B0, v2);
}

uint64_t sub_100012BD4(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v5 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v7 = sub_100012D84;
  }
  else
  {
    v4[9] = a1;
    swift_task_dealloc();
    uint64_t v5 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v7 = sub_100012D1C;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100012D1C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_100012D84()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012DE8(char *a1, uint64_t a2, unint64_t a3)
{
  char v29 = a1;
  uint64_t v6 = sub_10005DED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v13 = &v3[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy_delegate];
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v27 = *((void *)v13 + 1);
    uint64_t v16 = sub_10005E880();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v28 = v12;
    v17(v12, 1, 1, v16);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v6);
    sub_10005E860();
    swift_unknownObjectRetain();
    char v29 = v3;
    sub_10001616C(a2, a3);
    uint64_t v18 = sub_10005E850();
    unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v26 = a3;
    unint64_t v20 = (v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v21 = (char *)swift_allocObject();
    *((void *)v21 + 2) = v18;
    *((void *)v21 + 3) = &protocol witness table for MainActor;
    uint64_t v22 = v27;
    *((void *)v21 + 4) = v15;
    *((void *)v21 + 5) = v22;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v21[v19], v9, v6);
    uint64_t v23 = (uint64_t)v28;
    *(void *)&v21[v20] = v29;
    long long v24 = (uint64_t *)&v21[(v20 + 15) & 0xFFFFFFFFFFFFFFF8];
    unint64_t v25 = v26;
    uint64_t *v24 = a2;
    v24[1] = v25;
    sub_1000364B4(v23, (uint64_t)&unk_100093600, (uint64_t)v21);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100013060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[22] = a8;
  v8[23] = v15;
  v8[20] = a4;
  v8[21] = a6;
  uint64_t v9 = sub_10005DED0();
  v8[24] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[25] = v10;
  v8[26] = *(void *)(v10 + 64);
  v8[27] = swift_task_alloc();
  sub_100015F58(&qword_100094C30);
  v8[28] = swift_task_alloc();
  v8[29] = sub_10005E860();
  v8[30] = sub_10005E850();
  uint64_t v12 = sub_10005E800();
  return _swift_task_switch(sub_10001319C, v12, v11);
}

uint64_t sub_10001319C()
{
  swift_release();
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_100017FF4();
  sub_10005DD10();
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[27];
  uint64_t v13 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[21];
  sub_100016C08((uint64_t)(v0 + 12), (uint64_t)(v0 + 2));
  uint64_t v7 = sub_10005E880();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
  swift_unknownObjectRetain();
  sub_100018394(v0 + 2, (void (*)(void, void, void, void, void, void, void))sub_1000183D4);
  uint64_t v8 = sub_10005E850();
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = (char *)swift_allocObject();
  *((void *)v10 + 2) = v8;
  *((void *)v10 + 3) = &protocol witness table for MainActor;
  *((void *)v10 + 4) = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(&v10[v9], v2, v3);
  sub_100016C08((uint64_t)(v0 + 2), (uint64_t)&v10[(v13 + v9 + 15) & 0xFFFFFFFFFFFFFFF0]);
  sub_1000364B4(v1, (uint64_t)&unk_100093608, (uint64_t)v10);
  swift_release();
  sub_100018394(v0 + 2, (void (*)(void, void, void, void, void, void, void))sub_100018068);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100013594(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v41 = a3;
  uint64_t v42 = a4;
  uint64_t v40 = a2;
  uint64_t v8 = sub_10005DED0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v5[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy_delegate];
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v38 = *((void *)v14 + 1);
    uint64_t v17 = sub_10005E880();
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    v39 = v13;
    v18(v13, 1, 1, v17);
    unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v36 = v8;
    v37 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19(v37, a1, v8);
    sub_10005E860();
    swift_unknownObjectRetain();
    v35 = v5;
    uint64_t v21 = v40;
    unint64_t v20 = v41;
    sub_10001616C(v40, v41);
    swift_retain();
    uint64_t v22 = sub_10005E850();
    uint64_t v23 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v34 = a5;
    uint64_t v24 = (v23 + 48) & ~v23;
    unint64_t v25 = (v10 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = (char *)swift_allocObject();
    *((void *)v27 + 2) = v22;
    *((void *)v27 + 3) = &protocol witness table for MainActor;
    uint64_t v28 = v37;
    uint64_t v29 = v38;
    *((void *)v27 + 4) = v16;
    *((void *)v27 + 5) = v29;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v27[v24], v28, v36);
    *(void *)&v27[v25] = v35;
    char v30 = (uint64_t *)&v27[v26];
    *char v30 = v21;
    v30[1] = v20;
    char v31 = &v27[(v26 + 23) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v32 = v34;
    *(void *)char v31 = v42;
    *((void *)v31 + 1) = v32;
    sub_1000364B4((uint64_t)v39, (uint64_t)&unk_1000935E8, (uint64_t)v27);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100013838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 168) = v14;
  *(_OWORD *)(v8 + 152) = v13;
  *(void *)(v8 + 136) = a6;
  *(void *)(v8 + 144) = a8;
  *(void *)(v8 + 72) = a4;
  *(void *)(v8 + 176) = sub_10005E860();
  *(void *)(v8 + 184) = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  *(void *)(v8 + 192) = v10;
  *(void *)(v8 + 200) = v9;
  return _swift_task_switch(sub_1000138EC, v10, v9);
}

uint64_t sub_1000138EC()
{
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_100017FF4();
  sub_10005DD10();
  sub_100016C08((uint64_t)(v0 + 10), (uint64_t)(v0 + 2));
  v0[26] = sub_10005E850();
  uint64_t v2 = sub_10005E800();
  v0[27] = v2;
  v0[28] = v1;
  return _swift_task_switch(sub_100013A68, v2, v1);
}

uint64_t sub_100013A68()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[9];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[29] = v3;
  v3[2] = v1;
  v3[3] = v2;
  v3[4] = v0 + 2;
  uint64_t v6 = (char *)&dword_1000935B8 + dword_1000935B8;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[30] = v4;
  void *v4 = v0;
  v4[1] = sub_100013B6C;
  return ((uint64_t (*)(unint64_t, unint64_t, void (*)(id *, uint64_t), void *))v6)(0xD00000000000002DLL, 0x800000010006DFB0, sub_100018048, v3);
}

uint64_t sub_100013B6C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 248) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 224);
  uint64_t v4 = *(void *)(v2 + 216);
  if (v0) {
    uint64_t v5 = sub_100013DB4;
  }
  else {
    uint64_t v5 = sub_100013CC0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100013CC0()
{
  swift_release();
  sub_100018394(v0 + 2, (void (*)(void, void, void, void, void, void, void))sub_100018068);
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[25];
  return _swift_task_switch(sub_100013D44, v1, v2);
}

uint64_t sub_100013D44()
{
  uint64_t v1 = *(void (**)(void))(v0 + 160);
  swift_release();
  v1(0);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100013DB4()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 200);
  return _swift_task_switch(sub_100013E18, v1, v2);
}

uint64_t sub_100013E18()
{
  swift_release();
  sub_100018394(v0 + 2, (void (*)(void, void, void, void, void, void, void))sub_100018068);
  uint64_t v1 = v0[31];
  uint64_t v2 = (void (*)(uint64_t))v0[20];
  swift_errorRetain();
  v2(v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100014040(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v37 = a2;
  uint64_t v38 = a6;
  id v35 = a4;
  id v36 = a5;
  id v34 = a3;
  uint64_t v10 = sub_10005DED0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v7
      + OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v18 = result;
    uint64_t v33 = *(void *)(v16 + 8);
    uint64_t v19 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 1, 1, v19);
    unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v32 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20(v32, a1, v10);
    sub_10005E860();
    id v34 = v34;
    id v35 = v35;
    id v21 = v36;
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v22 = sub_10005E850();
    unint64_t v23 = (*(unsigned __int8 *)(v11 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v24 = a7;
    unint64_t v25 = (v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (char *)swift_allocObject();
    *((void *)v26 + 2) = v22;
    *((void *)v26 + 3) = &protocol witness table for MainActor;
    id v27 = v34;
    *((void *)v26 + 4) = v37;
    *((void *)v26 + 5) = v27;
    *((void *)v26 + 6) = v35;
    *((void *)v26 + 7) = v21;
    uint64_t v28 = v32;
    uint64_t v29 = v33;
    *((void *)v26 + 8) = v18;
    *((void *)v26 + 9) = v29;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v23], v28, v10);
    char v30 = &v26[v25];
    *(void *)char v30 = v38;
    *((void *)v30 + 1) = v24;
    sub_1000364B4((uint64_t)v15, (uint64_t)&unk_1000935D8, (uint64_t)v26);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000142D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = v14;
  *(_OWORD *)(v8 + 56) = v13;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 80) = sub_10005E860();
  *(void *)(v8 + 88) = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  *(void *)(v8 + 96) = v10;
  *(void *)(v8 + 104) = v9;
  return _swift_task_switch(sub_100014390, v10, v9);
}

uint64_t sub_100014390()
{
  id v1 = MTLCreateSystemDefaultDevice();
  *(void *)(v0 + 112) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = *(id *)(v0 + 16);
    if ([v1 registryID] == v3)
    {
      uint64_t v4 = *(void **)(v0 + 32);
      uint64_t v5 = *(void **)(v0 + 40);
      uint64_t v6 = *(void **)(v0 + 24);
      swift_unknownObjectRetain();
      *(void *)(v0 + 120) = sub_10005CC58(v2, (char *)v6, (uint64_t)v4, (uint64_t)v5);
      *(void *)(v0 + 128) = v7;
      *(void *)(v0 + 136) = v8;
      *(void *)(v0 + 144) = v9;
      uint64_t v10 = *(void **)(v0 + 32);

      swift_unknownObjectRelease();
      *(void *)(v0 + 152) = sub_10005E850();
      uint64_t v16 = sub_10005E800();
      *(void *)(v0 + 160) = v16;
      *(void *)(v0 + 168) = v17;
      return _swift_task_switch(sub_100014594, v16, v17);
    }
    swift_unknownObjectRelease();
  }
  swift_release();
  sub_1000161C4();
  uint64_t v11 = swift_allocError();
  *(void *)uint64_t v12 = 0xD00000000000002FLL;
  *(void *)(v12 + 8) = 0x800000010006DF50;
  *(unsigned char *)(v12 + 16) = 5;
  swift_willThrow();
  long long v13 = *(void (**)(uint64_t))(v0 + 64);
  swift_errorRetain();
  v13(v11);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_100014594()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  long long v2 = *(_OWORD *)(v0 + 136);
  int8x16_t v3 = *(int8x16_t *)(v0 + 48);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 120);
  *(_OWORD *)(v1 + 32) = v2;
  *(int8x16_t *)(v1 + 48) = vextq_s8(v3, v3, 8uLL);
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, void (*)(id *, uint64_t), uint64_t))((char *)&dword_1000935B8 + dword_1000935B8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v4;
  void *v4 = v0;
  v4[1] = sub_100014694;
  return v6(0xD00000000000002CLL, 0x800000010006DF80, sub_100017D38, v1);
}

uint64_t sub_100014694()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 168);
  uint64_t v4 = *(void *)(v2 + 160);
  if (v0) {
    uint64_t v5 = sub_100014908;
  }
  else {
    uint64_t v5 = sub_1000147EC;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000147EC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  return _swift_task_switch(sub_100014850, v1, v2);
}

uint64_t sub_100014850()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void (*)(void))v0[8];
  swift_release();
  v2(0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100014908()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  return _swift_task_switch(sub_10001496C, v1, v2);
}

uint64_t sub_10001496C()
{
  uint64_t v1 = (void *)v0[18];
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v2 = v0[24];
  uint64_t v3 = (void (*)(uint64_t))v0[8];
  swift_errorRetain();
  v3(v2);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_100014BF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100014C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_10005E860();
  v6[5] = sub_10005E850();
  uint64_t v8 = sub_10005E800();
  v6[6] = v8;
  v6[7] = v7;
  return _swift_task_switch(sub_100014CD8, v8, v7);
}

uint64_t sub_100014CD8()
{
  uint64_t v1 = v0[2].i64[0];
  objc_super v2 = (int8x16_t *)swift_task_alloc();
  v0[4].i64[0] = (uint64_t)v2;
  v2[1] = vextq_s8(v0[1], v0[1], 8uLL);
  v2[2].i64[0] = v1;
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t (*)(void **, uint64_t), int8x16_t *))((char *)&dword_1000935B8 + dword_1000935B8);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4].i64[1] = (uint64_t)v3;
  void *v3 = v0;
  v3[1] = sub_100014DD4;
  return v5(0xD00000000000001ELL, 0x800000010006DEF0, sub_100016BE8, v2);
}

uint64_t sub_100014DD4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v5 = sub_100014F8C;
  }
  else {
    uint64_t v5 = sub_100014F2C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100014F2C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100014F8C()
{
  swift_release();
  swift_errorRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100014FF8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a1;
  v8.super.Class isa = sub_10005DE90().super.isa;
  sub_100016C08(a5, (uint64_t)v15);
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  sub_100016C64();
  uint64_t v9 = sub_10005DD20();
  if (v5)
  {

    v15[0] = v5;
    sub_100015F58(&qword_100093580);
    return sub_10005E810();
  }
  else
  {
    uint64_t v12 = v9;
    unint64_t v13 = v10;
    Class isa = sub_10005DE20().super.isa;
    sub_100016114(v12, v13);
    [v7 rendererStateChanged:v8.super.isa state:isa];

    sub_100015F58(&qword_100093580);
    return sub_10005E820();
  }
}

void sub_10001513C(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a2;
  uint64_t v8 = sub_100015F58(&qword_100093580);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  id v23 = *a1;
  v11.super.Class isa = sub_10005DE90().super.isa;
  sub_100016C08(a5, (uint64_t)aBlock);
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  sub_100016C64();
  uint64_t v12 = sub_10005DD20();
  if (v5)
  {
  }
  else
  {
    uint64_t v14 = v12;
    unint64_t v15 = v13;
    Class isa = sub_10005DE20().super.isa;
    sub_100016114(v14, v15);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v8);
    unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v18 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    aBlock[4] = sub_1000163B8;
    aBlock[5] = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100011864;
    aBlock[3] = &unk_100082778;
    uint64_t v19 = _Block_copy(aBlock);
    swift_release();
    [v23 rendererStateChangedWithAcknowledge:v11.super.isa state:isa response:v19];
    _Block_release(v19);
  }
}

void sub_1000153A8(id *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v23 = a6;
  id v18 = a5;
  uint64_t v19 = a2;
  uint64_t v8 = sub_100015F58(&qword_100093580);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  NSUUID v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = *a1;
  id v21 = [(id)swift_unknownObjectRetain() device];
  id v20 = [v21 registryID];
  Class isa = sub_10005DE90().super.isa;
  id v13 = [a4 newSharedEventHandle];
  id v14 = [v18 newSharedEventHandle];
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, v11, v8);
  aBlock[4] = sub_1000163B8;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011864;
  aBlock[3] = &unk_1000827C8;
  unint64_t v17 = _Block_copy(aBlock);
  swift_release();
  [v22 rendererSharedTextureChangedXPC:isa deviceID:v20 textureHandle:v23 rendererFrameCountHandle:v13 displayerFrameCountHandle:v14 response:v17];
  _Block_release(v17);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t sub_100015600()
{
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100015638()
{
  return sub_100015644(&OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared31AsyncRealitySnapshotSenderProxy_uuid);
}

uint64_t sub_100015644(void *a1)
{
  swift_unknownObjectRelease();
  uint64_t v3 = v1 + *a1;
  uint64_t v4 = sub_10005DED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v1 + 52);

  return _swift_deallocClassInstance(v1, v5, v6);
}

uint64_t variable initialization expression of CRLWeakWrapper.value()
{
  return 0;
}

uint64_t type metadata accessor for CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy()
{
  return self;
}

uint64_t sub_100015718()
{
  return type metadata accessor for CRLUSDRendererExtensionShared.AsyncRendererSenderProxy(0);
}

uint64_t type metadata accessor for CRLUSDRendererExtensionShared.AsyncRendererSenderProxy(uint64_t a1)
{
  return sub_1000157B4(a1, qword_1000931A0);
}

uint64_t type metadata accessor for CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy()
{
  return self;
}

uint64_t type metadata accessor for CRLUSDRendererExtensionShared.RendererDelegateSenderProxy()
{
  return self;
}

uint64_t sub_10001578C()
{
  return type metadata accessor for CRLUSDRendererExtensionShared.AsyncRealitySnapshotSenderProxy(0);
}

uint64_t type metadata accessor for CRLUSDRendererExtensionShared.AsyncRealitySnapshotSenderProxy(uint64_t a1)
{
  return sub_1000157B4(a1, qword_100093388);
}

uint64_t sub_1000157B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000157EC()
{
  uint64_t result = sub_10005DED0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

void sub_1000158B0(void **a1, uint64_t a2)
{
  sub_100011DB4(a1, a2, *(float *)(v2 + 16));
}

_DWORD *sub_1000158CC@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000158D8(uint64_t a1, uint64_t a2)
{
  return sub_100015A44(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000158F0(uint64_t a1, id *a2)
{
  uint64_t result = sub_10005E700();
  *a2 = 0;
  return result;
}

uint64_t sub_100015968(uint64_t a1, id *a2)
{
  char v3 = sub_10005E710();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000159E8@<X0>(void *a1@<X8>)
{
  sub_10005E720();
  NSString v2 = sub_10005E6F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100015A2C(uint64_t a1, uint64_t a2)
{
  return sub_100015A44(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100015A44(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10005E720();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100015A88()
{
  sub_10005E720();
  sub_10005E770();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100015ADC()
{
  sub_10005E720();
  sub_10005ED40();
  sub_10005E770();
  Swift::Int v0 = sub_10005EDA0();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_100015B50(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

_DWORD *sub_100015B64@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100015B74(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100015B80(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_100015B88@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_100015B9C@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_100015BB0@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100015BC4(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_100015BF4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_100015C20@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_100015C44(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *sub_100015C58(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *sub_100015C6C(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *sub_100015C80@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100015C94(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100015CA8(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100015CBC()
{
  return *v0 == 0;
}

uint64_t sub_100015CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_DWORD *sub_100015CE4(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_100015CF8()
{
  uint64_t v0 = sub_10005E720();
  uint64_t v2 = v1;
  if (v0 == sub_10005E720() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10005EC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_100015D84(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100015D98@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3 = sub_100019848(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_100015DD8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10005E6F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100015E20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10005E720();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100015E4C(uint64_t a1)
{
  uint64_t v2 = sub_100018D98(&qword_100093760, type metadata accessor for CIContextOption);
  uint64_t v3 = sub_100018D98(&qword_100093768, type metadata accessor for CIContextOption);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100015F08(uint64_t a1)
{
  return sub_10000EDCC(a1, **(void **)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_100093560, (uint64_t)&unk_100082530, (uint64_t)sub_100015FA8, (uint64_t)&unk_100082548);
}

uint64_t sub_100015F58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100015F9C()
{
  return sub_100016D2C(&qword_100093560);
}

uint64_t sub_100015FA8(uint64_t a1)
{
  return sub_10001629C(a1, &qword_100093560);
}

uint64_t sub_100015FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015FC4()
{
  return swift_release();
}

uint64_t sub_100015FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100016028()
{
  unint64_t result = qword_100093568;
  if (!qword_100093568)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100093568);
  }
  return result;
}

uint64_t sub_100016068()
{
  return sub_100016D2C(&qword_100093560);
}

void sub_100016074(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100015F58(&qword_100093560);

  sub_100011F78(a1, a2, a3);
}

uint64_t sub_100016100(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100016114(a1, a2);
  }
  return a1;
}

uint64_t sub_100016114(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001616C(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000161C4()
{
  unint64_t result = qword_100093570;
  if (!qword_100093570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093570);
  }
  return result;
}

void sub_100016218(id *a1, uint64_t a2)
{
  sub_100011B2C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100016234(uint64_t a1)
{
  return sub_10000EDCC(a1, **(void **)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_100093580, (uint64_t)&unk_1000825D0, (uint64_t)sub_100016290, (uint64_t)&unk_1000825E8);
}

uint64_t sub_100016284()
{
  return sub_100016D2C(&qword_100093580);
}

uint64_t sub_100016290(uint64_t a1)
{
  return sub_10001629C(a1, &qword_100093580);
}

uint64_t sub_10001629C(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(sub_100015F58(a2) - 8);
  return sub_10000F040(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_100016310(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100016358()
{
  unint64_t result = qword_100093598;
  if (!qword_100093598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093598);
  }
  return result;
}

uint64_t sub_1000163AC()
{
  return sub_100016D2C(&qword_100093580);
}

void sub_1000163BC(uint64_t a1)
{
  sub_100015F58(&qword_100093580);

  sub_10000F9C8(a1);
}

uint64_t sub_100016430(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000010006E0B0 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656E6E6F63736964 && a2 == 0xEC00000064657463 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000010006E0D0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100016598(void *a1)
{
  uint64_t v25 = sub_100015F58(&qword_1000936F8);
  uint64_t v27 = *(void *)(v25 - 8);
  __chkstk_darwin();
  uint64_t v28 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100015F58(&qword_100093700);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin();
  int v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100015F58(&qword_100093708);
  uint64_t v23 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100015F58(&qword_100093710);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  NSUUID v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v29 = a1;
  uint64_t v13 = (uint64_t)sub_100019664(a1, v12);
  sub_1000196A8();
  uint64_t v14 = v30;
  sub_10005EDE0();
  if (!v14)
  {
    unint64_t v15 = v28;
    uint64_t v30 = v9;
    uint64_t v16 = sub_10005EBA0();
    if (*(void *)(v16 + 16) == 1)
    {
      if (*(unsigned char *)(v16 + 32))
      {
        if (*(unsigned char *)(v16 + 32) == 1)
        {
          char v32 = 1;
          sub_1000197A0();
          sub_10005EB20();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
          uint64_t v13 = 0;
        }
        else
        {
          char v33 = 2;
          sub_10001974C();
          sub_10005EB20();
          uint64_t v21 = v25;
          uint64_t v13 = sub_10005EB50();
          uint64_t v22 = v30;
          (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v21);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
        }
      }
      else
      {
        char v31 = 0;
        sub_1000197F4();
        sub_10005EB20();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v5);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v17 = sub_10005EA20();
      swift_allocError();
      uint64_t v19 = v18;
      sub_100015F58(&qword_100093720);
      *uint64_t v19 = &type metadata for CRLUSDRendererExtensionShared.ExtensionError;
      uint64_t v13 = (uint64_t)v11;
      sub_10005EB30();
      sub_10005EA10();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, enum case for DecodingError.typeMismatch(_:), v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    }
  }
  sub_1000196FC((uint64_t)v29);
  return v13;
}

void sub_100016B44(void **a1, uint64_t a2)
{
  sub_1000118D0(a1, a2, *(void *)(v2 + 16), *(long long **)(v2 + 24));
}

unint64_t sub_100016B60()
{
  unint64_t result = qword_1000935A0;
  if (!qword_1000935A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000935A0);
  }
  return result;
}

uint64_t sub_100016BB4()
{
  return sub_100016D2C(&qword_100093580);
}

void sub_100016BC0(void **a1, uint64_t a2)
{
}

uint64_t sub_100016BDC()
{
  return sub_100016D2C(&qword_100093580);
}

uint64_t sub_100016BE8(void **a1, uint64_t a2)
{
  return sub_100014FF8(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_100016C08(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100016C64()
{
  unint64_t result = qword_1000935C0;
  if (!qword_1000935C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000935C0);
  }
  return result;
}

uint64_t sub_100016CB8(uint64_t a1)
{
  return sub_10000EDCC(a1, **(void **)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_100093580, (uint64_t)&unk_100082710, (uint64_t)sub_100016290, (uint64_t)&unk_100082728);
}

uint64_t sub_100016D08()
{
  return sub_100016D2C(&qword_100093580);
}

uint64_t sub_100016D14()
{
  return sub_100016D2C(&qword_100093580);
}

uint64_t sub_100016D20()
{
  return sub_100016D2C(&qword_100093580);
}

uint64_t sub_100016D2C(uint64_t *a1)
{
  uint64_t v2 = sub_100015F58(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100016DB8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100016DF0(uint64_t a1)
{
  sub_1000103B0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100016DF8()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100016F04(uint64_t a1)
{
  sub_10005DED0();
  uint64_t v3 = v1[4];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[2];
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[8];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100019FC8;
  return sub_1000142D8(a1, v11, v10, v3, v4, v5, v6, v7);
}

uint64_t sub_100017064(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_100015F58(&qword_100093678);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  uint64_t v14 = a1 + OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = Strong;
    uint64_t v17 = *(void *)(v14 + 8);
    uint64_t v18 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
    sub_10005E860();
    _Block_copy(a2);
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v19 = sub_10005E850();
    id v20 = (void *)swift_allocObject();
    v20[2] = v19;
    v20[3] = &protocol witness table for MainActor;
    v20[4] = sub_100018E3C;
    v20[5] = v13;
    v20[6] = v16;
    v20[7] = v17;
    sub_1000364B4((uint64_t)v12, (uint64_t)&unk_100093688, (uint64_t)v20);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v22 = sub_10005DED0();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v9, 1, 1, v22);
    sub_1000186D4();
    swift_allocError();
    _OWORD *v24 = xmmword_1000709E0;
    sub_100018E44((uint64_t)v9, (uint64_t)v7);
    int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v7, 1, v22);
    _Block_copy(a2);
    Class isa = 0;
    if (v25 != 1)
    {
      Class isa = sub_10005DE90().super.isa;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v22);
    }
    uint64_t v27 = (void *)sub_10005DDB0();
    ((void (**)(void, Class, void *))a2)[2](a2, isa, v27);

    swift_errorRelease();
    sub_100018EAC((uint64_t)v9);
    return swift_release();
  }
}

uint64_t sub_1000173BC(uint64_t a1, unint64_t a2, char *a3, void (**a4)(void, void))
{
  uint64_t v8 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  uint64_t v12 = &a3[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    uint64_t v15 = *((void *)v12 + 1);
    uint64_t v16 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
    sub_10005E860();
    _Block_copy(a4);
    swift_unknownObjectRetain();
    uint64_t v17 = a3;
    sub_10001616C(a1, a2);
    swift_retain();
    uint64_t v18 = sub_10005E850();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = &protocol witness table for MainActor;
    v19[4] = v14;
    v19[5] = v15;
    v19[6] = v17;
    v19[7] = a1;
    v19[8] = a2;
    v19[9] = sub_100019F58;
    v19[10] = v11;
    sub_1000364B4((uint64_t)v10, (uint64_t)&unk_100093668, (uint64_t)v19);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1000186D4();
    swift_allocError();
    *uint64_t v21 = xmmword_1000709E0;
    _Block_copy(a4);
    uint64_t v22 = (void *)sub_10005DDB0();
    ((void (**)(void, void *))a4)[2](a4, v22);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_100017624(uint64_t a1, unint64_t a2, char *a3, void (**a4)(void, void))
{
  uint64_t v8 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  uint64_t v12 = &a3[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    uint64_t v15 = *((void *)v12 + 1);
    uint64_t v16 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
    sub_10005E860();
    _Block_copy(a4);
    swift_unknownObjectRetain();
    uint64_t v17 = a3;
    sub_10001616C(a1, a2);
    swift_retain();
    uint64_t v18 = sub_10005E850();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = &protocol witness table for MainActor;
    v19[4] = v14;
    v19[5] = v15;
    v19[6] = v17;
    v19[7] = a1;
    v19[8] = a2;
    v19[9] = sub_100019F58;
    v19[10] = v11;
    sub_1000364B4((uint64_t)v10, (uint64_t)&unk_100093650, (uint64_t)v19);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1000186D4();
    swift_allocError();
    *uint64_t v21 = xmmword_1000709E0;
    _Block_copy(a4);
    uint64_t v22 = (void *)sub_10005DDB0();
    ((void (**)(void, void *))a4)[2](a4, v22);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_10001788C(uint64_t a1, unint64_t a2, char *a3, void (**a4)(void, void))
{
  uint64_t v8 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  uint64_t v12 = &a3[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    uint64_t v15 = *((void *)v12 + 1);
    uint64_t v16 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
    sub_10005E860();
    _Block_copy(a4);
    swift_unknownObjectRetain();
    uint64_t v17 = a3;
    sub_10001616C(a1, a2);
    swift_retain();
    uint64_t v18 = sub_10005E850();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = &protocol witness table for MainActor;
    v19[4] = v14;
    v19[5] = v15;
    v19[6] = v17;
    v19[7] = a1;
    v19[8] = a2;
    v19[9] = sub_100019F58;
    v19[10] = v11;
    sub_1000364B4((uint64_t)v10, (uint64_t)&unk_100093630, (uint64_t)v19);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1000186D4();
    swift_allocError();
    *uint64_t v21 = xmmword_1000709E0;
    _Block_copy(a4);
    uint64_t v22 = (void *)sub_10005DDB0();
    ((void (**)(void, void *))a4)[2](a4, v22);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_100017AF4(uint64_t a1, void (**a2)(void, void, void), float a3)
{
  uint64_t v6 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  uint64_t v10 = a1 + OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    uint64_t v13 = *(void *)(v10 + 8);
    uint64_t v14 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
    sub_10005E860();
    _Block_copy(a2);
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v15 = sub_10005E850();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    *(void *)(v16 + 24) = &protocol witness table for MainActor;
    *(void *)(v16 + 32) = v12;
    *(void *)(v16 + 40) = v13;
    *(float *)(v16 + 48) = a3;
    *(void *)(v16 + 56) = sub_1000186CC;
    *(void *)(v16 + 64) = v9;
    sub_1000364B4((uint64_t)v8, (uint64_t)&unk_100093620, v16);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1000186D4();
    swift_allocError();
    _OWORD *v18 = xmmword_1000709E0;
    _Block_copy(a2);
    uint64_t v19 = (void *)sub_10005DDB0();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v19);

    swift_errorRelease();
    return swift_release();
  }
}

void sub_100017D38(id *a1, uint64_t a2)
{
  sub_1000153A8(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100017D5C()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  sub_100016114(*(void *)(v0 + v7), *(void *)(v0 + v7 + 8));
  swift_release();

  return _swift_deallocObject(v0, ((v7 + 23) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_100017E7C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10005DED0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v1[3];
  uint64_t v14 = v1[2];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = *(void *)((char *)v1 + v5);
  uint64_t v11 = *(void *)((char *)v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_100019FC8;
  return sub_100013838(a1, v14, v6, v7, v8, v9, v10, v11);
}

unint64_t sub_100017FF4()
{
  unint64_t result = qword_1000935F0;
  if (!qword_1000935F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000935F0);
  }
  return result;
}

void sub_100018048(id *a1, uint64_t a2)
{
  sub_10001513C(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_100018068(uint64_t result, unint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a6 >> 62 == 1)
  {
    return sub_1000180C8(result, a2, a3);
  }
  else if (!(a6 >> 62))
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000180C8(uint64_t result, unint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
      unint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      unint64_t result = sub_100018120(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100018120(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100018134()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  sub_100016114(*(void *)(v0 + v7), *(void *)(v0 + v7 + 8));

  return _swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_100018238(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10005DED0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = v1[5];
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = (uint64_t)v1 + v5;
  uint64_t v13 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_100019FC8;
  return sub_100013060(a1, v7, v8, v9, v10, v12, v11, v13);
}

void *sub_100018394(void *a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1000183D4(uint64_t result, unint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a6 >> 62 == 1)
  {
    return sub_100018434(result, a2, a3);
  }
  else if (!(a6 >> 62))
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100018434(uint64_t result, unint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 4:
      uint64_t result = sub_10001848C(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001848C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000184A0()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 0xF;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_100018068(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8), *(void *)(v0 + v6 + 16), *(void *)(v0 + v6 + 24), *(void *)(v0 + v6 + 32), *(void *)(v0 + v6 + 40));

  return _swift_deallocObject(v0, v6 + 56, v5);
}

uint64_t sub_1000185A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10005DED0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (uint64_t)v1 + ((*(void *)(v4 + 64) + v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100019FC8;
  return sub_100014C3C(a1, v6, v7, v8, v9, v10);
}

void sub_1000186CC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_10001150C(a1, a2, a3, *(void *)(v3 + 16));
}

unint64_t sub_1000186D4()
{
  unint64_t result = qword_100093610;
  if (!qword_100093610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100093610);
  }
  return result;
}

uint64_t sub_100018728()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100018770(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  float v8 = *(float *)(v1 + 48);
  uint64_t v10 = *(void *)(v1 + 56);
  uint64_t v9 = *(void *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100019FC8;
  return sub_100010EC0(v8, a1, v4, v5, v6, v7, v10, v9);
}

uint64_t sub_100018850(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100019FC8;
  return sub_1000108F0(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_100018944(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016310(&qword_100093588);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000189B4()
{
  unint64_t result = qword_100093640;
  if (!qword_100093640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100093640);
  }
  return result;
}

uint64_t sub_100018A0C(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100018B00;
  return sub_100010414(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_100018B00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100018BF4()
{
  unint64_t result = qword_100093658;
  if (!qword_100093658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100093658);
  }
  return result;
}

uint64_t sub_100018C4C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_100016114(*(void *)(v0 + 56), *(void *)(v0 + 64));
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_100018CA4(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100019FC8;
  return sub_10000FE3C(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_100018D98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018DE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CRLUSDRendering.SceneRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100018E3C(uint64_t a1, uint64_t a2)
{
  sub_10000FCF0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100018E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015F58(&qword_100093678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018EAC(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_100093678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018F0C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100018F54(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100019FC8;
  return sub_10000FAB8(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_100019028(uint64_t a1)
{
  return a1;
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
}

void type metadata accessor for CIContextOption(uint64_t a1)
{
}

void type metadata accessor for REEngineServiceMask(uint64_t a1)
{
}

unint64_t destroy for CRLUSDRendererExtensionShared.ExtensionError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s20USDRendererExtension29CRLUSDRendererExtensionSharedO14ExtensionErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for CRLUSDRendererExtensionShared.ExtensionError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CRLUSDRendererExtensionShared.ExtensionError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for CRLUSDRendererExtensionShared.ExtensionError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1000192B8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000192D4(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared.ExtensionError()
{
  return &type metadata for CRLUSDRendererExtensionShared.ExtensionError;
}

uint64_t initializeBufferWithCopyOfBuffer for CRLUSDRendering.RendererState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 _s11TextureDataVwtk(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100019348(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100019368(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared()
{
  return &type metadata for CRLUSDRendererExtensionShared;
}

uint64_t sub_1000193B8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000193D8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

unint64_t sub_100019418()
{
  unint64_t result = qword_1000936B8;
  if (!qword_1000936B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000936B8);
  }
  return result;
}

uint64_t sub_10001946C()
{
  return sub_100018D98(&qword_1000936C0, type metadata accessor for REEngineServiceMask);
}

uint64_t sub_1000194B4()
{
  return sub_100018D98(&qword_1000936C8, type metadata accessor for REEngineServiceMask);
}

uint64_t sub_1000194FC()
{
  return sub_100018D98(&qword_1000936D0, type metadata accessor for REEngineServiceMask);
}

uint64_t sub_100019544()
{
  return sub_100018D98(&qword_1000936D8, type metadata accessor for REEngineServiceMask);
}

uint64_t sub_10001958C()
{
  return sub_100018D98(&qword_1000936E0, type metadata accessor for CIContextOption);
}

uint64_t sub_1000195D4()
{
  return sub_100018D98(&qword_1000936E8, type metadata accessor for CIContextOption);
}

uint64_t sub_10001961C()
{
  return sub_100018D98(&qword_1000936F0, type metadata accessor for CIContextOption);
}

void *sub_100019664(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000196A8()
{
  unint64_t result = qword_100093718;
  if (!qword_100093718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093718);
  }
  return result;
}

uint64_t sub_1000196FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001974C()
{
  unint64_t result = qword_100093728;
  if (!qword_100093728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093728);
  }
  return result;
}

unint64_t sub_1000197A0()
{
  unint64_t result = qword_100093730;
  if (!qword_100093730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093730);
  }
  return result;
}

unint64_t sub_1000197F4()
{
  unint64_t result = qword_100093738;
  if (!qword_100093738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093738);
  }
  return result;
}

uint64_t sub_100019848(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  char v3 = (int *)(v2 + 32);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
    if ((v5 & ~result) == 0) {
      int v4 = 0;
    }
    unint64_t result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CRLUSDRendererExtensionShared.ExtensionError.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1000199E8);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100019A10(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100019A18(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared.ExtensionError.CodingKeys()
{
  return &type metadata for CRLUSDRendererExtensionShared.ExtensionError.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared.ExtensionError.InterfaceMismatchCodingKeys()
{
  return &type metadata for CRLUSDRendererExtensionShared.ExtensionError.InterfaceMismatchCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared.ExtensionError.DisconnectedCodingKeys()
{
  return &type metadata for CRLUSDRendererExtensionShared.ExtensionError.DisconnectedCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError.ForegroundAssertionCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CRLUSDRendererExtensionShared.ExtensionError.ForegroundAssertionCodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100019B40);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100019B68()
{
  return 0;
}

ValueMetadata *type metadata accessor for CRLUSDRendererExtensionShared.ExtensionError.ForegroundAssertionCodingKeys()
{
  return &type metadata for CRLUSDRendererExtensionShared.ExtensionError.ForegroundAssertionCodingKeys;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100019B94(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_100019BE0()
{
  unint64_t result = qword_100093778;
  if (!qword_100093778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093778);
  }
  return result;
}

unint64_t sub_100019C38()
{
  unint64_t result = qword_100093780;
  if (!qword_100093780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093780);
  }
  return result;
}

unint64_t sub_100019C90()
{
  unint64_t result = qword_100093788;
  if (!qword_100093788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093788);
  }
  return result;
}

unint64_t sub_100019CE8()
{
  unint64_t result = qword_100093790;
  if (!qword_100093790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093790);
  }
  return result;
}

unint64_t sub_100019D40()
{
  unint64_t result = qword_100093798;
  if (!qword_100093798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093798);
  }
  return result;
}

unint64_t sub_100019D98()
{
  unint64_t result = qword_1000937A0;
  if (!qword_1000937A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000937A0);
  }
  return result;
}

unint64_t sub_100019DF0()
{
  unint64_t result = qword_1000937A8;
  if (!qword_1000937A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000937A8);
  }
  return result;
}

unint64_t sub_100019E48()
{
  unint64_t result = qword_1000937B0;
  if (!qword_1000937B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000937B0);
  }
  return result;
}

unint64_t sub_100019EA0()
{
  unint64_t result = qword_1000937B8;
  if (!qword_1000937B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000937B8);
  }
  return result;
}

unint64_t sub_100019EF8()
{
  unint64_t result = qword_1000937C0;
  if (!qword_1000937C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000937C0);
  }
  return result;
}

void *sub_100019FCC()
{
  unint64_t result = (void *)sub_10002D54C((uint64_t)_swiftEmptyArrayStorage);
  off_100093950 = result;
  return result;
}

char *sub_100019FF4(void *a1, void *a2, id a3)
{
  id v6 = [a3 computeCommandEncoder];
  if (!v6)
  {
    sub_10001A568();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_1000714A0;
    *(unsigned char *)(v8 + 16) = 2;
    return (char *)swift_willThrow();
  }
  BOOL v7 = v6;
  if (*(unsigned char *)(v3 + 32) == 1)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
  }
  else
  {
    id v10 = [a1 newTextureViewWithPixelFormat:80];
    if (!v10)
    {
      id v23 = [a1 description];
      uint64_t v24 = sub_10005E720();
      uint64_t v26 = v25;

      sub_10001A568();
      swift_allocError();
      *(void *)uint64_t v27 = v24;
      *(void *)(v27 + 8) = v26;
      *(unsigned char *)(v27 + 16) = 1;
      swift_willThrow();
      return (char *)swift_unknownObjectRelease();
    }
    id v11 = v10;
    id v12 = [a2 newTextureViewWithPixelFormat:80];
    if (!v12)
    {
      id v28 = [a2 description];
      uint64_t v29 = sub_10005E720();
      uint64_t v31 = v30;

      sub_10001A568();
      swift_allocError();
      *(void *)uint64_t v32 = v29;
      *(void *)(v32 + 8) = v31;
      *(unsigned char *)(v32 + 16) = 1;
      swift_willThrow();
      swift_unknownObjectRelease();
      return (char *)swift_unknownObjectRelease();
    }
    a2 = v12;
    a1 = v11;
  }
  uint64_t v13 = *(void **)(v3 + 24);
  [v7 setComputePipelineState:v13];
  [v7 setTexture:a1 atIndex:0];
  [v7 setTexture:a2 atIndex:1];
  uint64_t v14 = (uint64_t)[v13 threadExecutionWidth];
  unint64_t result = (char *)[v13 maxTotalThreadsPerThreadgroup];
  if (!v14)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v15 = (uint64_t)result;
  if (result == (char *)0x8000000000000000 && v14 == -1) {
    goto LABEL_30;
  }
  uint64_t v16 = (char *)[a2 width];
  unint64_t result = (char *)[a2 height];
  uint64_t v17 = &v16[v14];
  if (__OFADD__(v16, v14)) {
    goto LABEL_25;
  }
  BOOL v18 = __OFSUB__(v17, 1);
  uint64_t v19 = v17 - 1;
  if (v18)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v19 == (char *)0x8000000000000000 && v14 == -1) {
    goto LABEL_31;
  }
  uint64_t v20 = v15 / v14;
  uint64_t v21 = &result[v15 / v14];
  if (__OFADD__(result, v15 / v14)) {
    goto LABEL_27;
  }
  BOOL v18 = __OFSUB__(v21, 1);
  uint64_t v22 = v21 - 1;
  if (v18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (!v20)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v22 != (char *)0x8000000000000000 || v20 != -1)
  {
    v34[0] = (uint64_t)v19 / v14;
    v34[1] = (uint64_t)v22 / v20;
    v34[2] = 1;
    v33[0] = v14;
    v33[1] = v15 / v14;
    v33[2] = 1;
    [v7 dispatchThreadgroups:v34 threadsPerThreadgroup:v33];
    [v7 endEncoding];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (char *)swift_unknownObjectRelease();
  }
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_10001A348(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    swift_errorRetain();
    sub_10005E9D0(43);
    swift_bridgeObjectRelease();
    unint64_t v7 = 0xD000000000000028;
    swift_getErrorValue();
    v10._countAndFlagsBits = sub_10005ECE0();
    sub_10005E790(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 46;
    v11._object = (void *)0xE100000000000000;
    sub_10005E790(v11);
    sub_10001A970(a1, a2, 0);
    return v7;
  }
  if (a3 == 1)
  {
    sub_10005E9D0(46);
    swift_bridgeObjectRelease();
    unint64_t v7 = 0xD00000000000002BLL;
    v8._countAndFlagsBits = a1;
    v8._object = (void *)a2;
    sub_10005E790(v8);
    v9._countAndFlagsBits = 46;
    v9._object = (void *)0xE100000000000000;
    sub_10005E790(v9);
    return v7;
  }
  if (a1 ^ 1 | a2) {
    unint64_t v6 = 0xD00000000000002CLL;
  }
  else {
    unint64_t v6 = 0xD000000000000029;
  }
  if (a1 | a2) {
    return v6;
  }
  else {
    return 0xD00000000000001DLL;
  }
}

unint64_t sub_10001A4EC()
{
  return sub_10001A348(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_10001A504()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t _s16TextureResamplerCMa()
{
  return self;
}

unint64_t sub_10001A568()
{
  unint64_t result = qword_100093A08;
  if (!qword_100093A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093A08);
  }
  return result;
}

uint64_t sub_10001A5BC(void *a1)
{
  id v2 = [a1 newDefaultLibrary];
  if (v2)
  {
    uint64_t v3 = v2;
    MTLPixelFormatGetInfoForDevice();
    char v4 = v21;
    NSString v5 = sub_10005E6F0();
    id v6 = [v3 newFunctionWithName:v5];

    if (v6)
    {
      id v20 = 0;
      id v7 = [a1 newComputePipelineStateWithFunction:v6 error:&v20];
      if (v7)
      {
        id v8 = v7;
        id v9 = v20;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        _s16TextureResamplerCMa();
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = a1;
        *(void *)(v10 + 24) = v8;
        *(unsigned char *)(v10 + 32) = (v4 & 2) != 0;
        swift_unknownObjectRetain();
      }
      else
      {
        id v15 = v20;
        uint64_t v16 = sub_10005DDC0();

        swift_willThrow();
        sub_10001A568();
        uint64_t v17 = swift_allocError();
        *(void *)uint64_t v18 = v16;
        *(void *)(v18 + 8) = 0;
        *(unsigned char *)(v18 + 16) = 0;
        swift_errorRetain();
        uint64_t v10 = v17;
        swift_willThrow();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_errorRelease();
      }
    }
    else
    {
      sub_10001A568();
      uint64_t v13 = swift_allocError();
      *(_OWORD *)uint64_t v14 = xmmword_1000714B0;
      *(unsigned char *)(v14 + 16) = 2;
      uint64_t v10 = v13;
      swift_willThrow();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_10001A568();
    uint64_t v11 = swift_allocError();
    *(void *)uint64_t v12 = 0;
    *(void *)(v12 + 8) = 0;
    *(unsigned char *)(v12 + 16) = 2;
    uint64_t v10 = v11;
    swift_willThrow();
  }
  return v10;
}

uint64_t sub_10001A7F4(void *a1)
{
  if (qword_100092EF8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v4 = off_100093950;
  if (*((void *)off_100093950 + 2) && (unint64_t v5 = sub_10002B784((uint64_t)a1), (v6 & 1) != 0))
  {
    uint64_t v2 = *(void *)(v4[7] + 8 * v5);
    swift_endAccess();
    swift_retain();
  }
  else
  {
    swift_endAccess();
    uint64_t v7 = sub_10001A5BC(a1);
    if (!v1)
    {
      uint64_t v2 = v7;
      swift_beginAccess();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = off_100093950;
      off_100093950 = (_UNKNOWN *)0x8000000000000000;
      sub_100052C48(v2, (uint64_t)a1, isUniquelyReferenced_nonNull_native);
      off_100093950 = v10;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
  return v2;
}

uint64_t sub_10001A940(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain();
  }
  if (!a3) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwxx(uint64_t a1)
{
  return sub_10001A970(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10001A970(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease();
  }
  if (!a3) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10001A940(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10001A940(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10001A970(v6, v7, v8);
  return a1;
}

__n128 _s16TextureResamplerC14ResamplerErrorOwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10001A970(v4, v5, v6);
  return a1;
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s16TextureResamplerC14ResamplerErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10001AB1C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_10001AB34(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s16TextureResamplerC14ResamplerErrorOMa()
{
  return &_s16TextureResamplerC14ResamplerErrorON;
}

uint64_t *OS_os_log.crlThreeDimensionalObjects.unsafeMutableAddressor()
{
  if (qword_100093018 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlThreeDimensionalObjects;
}

void sub_10001ABAC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDefaultCat_log_t, &CRLDefaultCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlDefault = (uint64_t)v1;
}

uint64_t *OS_os_log.crlDefault.unsafeMutableAddressor()
{
  if (qword_100092F00 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlDefault;
}

id static OS_os_log.crlDefault.getter()
{
  return sub_1000223F8(&qword_100092F00, (void **)&static OS_os_log.crlDefault);
}

void static OS_os_log.crlDefault.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlDefault.modify())()
{
  if (qword_100092F00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001AD88()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssertCat_log_t, &CRLAssertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssert.unsafeMutableAddressor()
{
  if (qword_100092F08 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssert;
}

id static OS_os_log.crlAssert.getter()
{
  return sub_1000223F8(&qword_100092F08, (void **)&static OS_os_log.crlAssert);
}

void static OS_os_log.crlAssert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssert.modify())()
{
  if (qword_100092F08 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001AF60()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLErrorCat_log_t, &CRLErrorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlError = (uint64_t)v1;
}

uint64_t *OS_os_log.crlError.unsafeMutableAddressor()
{
  if (qword_100092F10 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlError;
}

id static OS_os_log.crlError.getter()
{
  return sub_1000223F8(&qword_100092F10, (void **)&static OS_os_log.crlError);
}

void static OS_os_log.crlError.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlError.modify())()
{
  if (qword_100092F10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001B138()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLWarningCat_log_t, &CRLWarningCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlWarning = (uint64_t)v1;
}

uint64_t *OS_os_log.crlWarning.unsafeMutableAddressor()
{
  if (qword_100092F18 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlWarning;
}

id static OS_os_log.crlWarning.getter()
{
  return sub_1000223F8(&qword_100092F18, (void **)&static OS_os_log.crlWarning);
}

void static OS_os_log.crlWarning.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlWarning.modify())()
{
  if (qword_100092F18 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001B314()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAlertCat_log_t, &CRLAlertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAlert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAlert.unsafeMutableAddressor()
{
  if (qword_100092F20 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAlert;
}

id static OS_os_log.crlAlert.getter()
{
  return sub_1000223F8(&qword_100092F20, (void **)&static OS_os_log.crlAlert);
}

void static OS_os_log.crlAlert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAlert.modify())()
{
  if (qword_100092F20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001B4EC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPerformanceCat_log_t, &CRLPerformanceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPerformance = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPerformance.unsafeMutableAddressor()
{
  if (qword_100092F28 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPerformance;
}

id static OS_os_log.crlPerformance.getter()
{
  return sub_1000223F8(&qword_100092F28, (void **)&static OS_os_log.crlPerformance);
}

void static OS_os_log.crlPerformance.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPerformance.modify())()
{
  if (qword_100092F28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001B6C0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStatusHUDCat_log_t, &CRLStatusHUDCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStatusHUD = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStatusHUD.unsafeMutableAddressor()
{
  if (qword_100092F30 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStatusHUD;
}

id static OS_os_log.crlStatusHUD.getter()
{
  return sub_1000223F8(&qword_100092F30, (void **)&static OS_os_log.crlStatusHUD);
}

void static OS_os_log.crlStatusHUD.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStatusHUD.modify())()
{
  if (qword_100092F30 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001B89C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTextInputCat_log_t, &CRLTextInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTextInput = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTextInput.unsafeMutableAddressor()
{
  if (qword_100092F38 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTextInput;
}

id static OS_os_log.crlTextInput.getter()
{
  return sub_1000223F8(&qword_100092F38, (void **)&static OS_os_log.crlTextInput);
}

void static OS_os_log.crlTextInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTextInput.modify())()
{
  if (qword_100092F38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001BA78()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTraceableResourceCat_log_t, &CRLTraceableResourceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTraceableResource = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTraceableResource.unsafeMutableAddressor()
{
  if (qword_100092F40 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTraceableResource;
}

id static OS_os_log.crlTraceableResource.getter()
{
  return sub_1000223F8(&qword_100092F40, (void **)&static OS_os_log.crlTraceableResource);
}

void static OS_os_log.crlTraceableResource.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTraceableResource.modify())()
{
  if (qword_100092F40 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001BC4C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStorageHierachyCat_log_t, &CRLStorageHierachyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStorageHierachy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStorageHierachy.unsafeMutableAddressor()
{
  if (qword_100092F48 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStorageHierachy;
}

id static OS_os_log.crlStorageHierachy.getter()
{
  return sub_1000223F8(&qword_100092F48, (void **)&static OS_os_log.crlStorageHierachy);
}

void static OS_os_log.crlStorageHierachy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStorageHierachy.modify())()
{
  if (qword_100092F48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001BE20()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSerializableObjectCat_log_t, &CRLSerializableObjectCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSerializableObject = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSerializableObject.unsafeMutableAddressor()
{
  if (qword_100092F50 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSerializableObject;
}

id static OS_os_log.crlSerializableObject.getter()
{
  return sub_1000223F8(&qword_100092F50, (void **)&static OS_os_log.crlSerializableObject);
}

void static OS_os_log.crlSerializableObject.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSerializableObject.modify())()
{
  if (qword_100092F50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001BFF4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaborationParticipantCat_log_t, &CRLCollaborationParticipantCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaborationParticipant = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaborationParticipant.unsafeMutableAddressor()
{
  if (qword_100092F58 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaborationParticipant;
}

id static OS_os_log.crlCollaborationParticipant.getter()
{
  return sub_1000223F8(&qword_100092F58, (void **)&static OS_os_log.crlCollaborationParticipant);
}

void static OS_os_log.crlCollaborationParticipant.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaborationParticipant.modify())()
{
  if (qword_100092F58 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001C1C8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSpotlightCat_log_t, &CRLSpotlightCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSpotlight = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSpotlight.unsafeMutableAddressor()
{
  if (qword_100092F60 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSpotlight;
}

id static OS_os_log.crlSpotlight.getter()
{
  return sub_1000223F8(&qword_100092F60, (void **)&static OS_os_log.crlSpotlight);
}

void static OS_os_log.crlSpotlight.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSpotlight.modify())()
{
  if (qword_100092F60 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001C3A4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLNetworkReachabilityCat_log_t, &CRLNetworkReachabilityCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlNetworkReachability = (uint64_t)v1;
}

uint64_t *OS_os_log.crlNetworkReachability.unsafeMutableAddressor()
{
  if (qword_100092F68 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlNetworkReachability;
}

id static OS_os_log.crlNetworkReachability.getter()
{
  return sub_1000223F8(&qword_100092F68, (void **)&static OS_os_log.crlNetworkReachability);
}

void static OS_os_log.crlNetworkReachability.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlNetworkReachability.modify())()
{
  if (qword_100092F68 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001C578()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetDownloadManagerCat_log_t, &CRLAssetDownloadManagerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssetDownloadManager = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssetDownloadManager.unsafeMutableAddressor()
{
  if (qword_100092F70 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssetDownloadManager;
}

id static OS_os_log.crlAssetDownloadManager.getter()
{
  return sub_1000223F8(&qword_100092F70, (void **)&static OS_os_log.crlAssetDownloadManager);
}

void static OS_os_log.crlAssetDownloadManager.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssetDownloadManager.modify())()
{
  if (qword_100092F70 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001C74C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppAnalyticsCat_log_t, &CRLAppAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAppAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAppAnalytics.unsafeMutableAddressor()
{
  if (qword_100092F78 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAppAnalytics;
}

id static OS_os_log.crlAppAnalytics.getter()
{
  return sub_1000223F8(&qword_100092F78, (void **)&static OS_os_log.crlAppAnalytics);
}

void static OS_os_log.crlAppAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAppAnalytics.modify())()
{
  if (qword_100092F78 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001C920()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnalyticsCat_log_t, &CRLAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnalytics.unsafeMutableAddressor()
{
  if (qword_100092F80 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnalytics;
}

id static OS_os_log.crlAnalytics.getter()
{
  return sub_1000223F8(&qword_100092F80, (void **)&static OS_os_log.crlAnalytics);
}

void static OS_os_log.crlAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnalytics.modify())()
{
  if (qword_100092F80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001CAFC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardCat_log_t, &CRLKeyboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlKeyboard = (uint64_t)v1;
}

uint64_t *OS_os_log.crlKeyboard.unsafeMutableAddressor()
{
  if (qword_100092F88 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlKeyboard;
}

id static OS_os_log.crlKeyboard.getter()
{
  return sub_1000223F8(&qword_100092F88, (void **)&static OS_os_log.crlKeyboard);
}

void static OS_os_log.crlKeyboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlKeyboard.modify())()
{
  if (qword_100092F88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001CCD8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFolderUICat_log_t, &CRLFolderUICat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFolderUI = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFolderUI.unsafeMutableAddressor()
{
  if (qword_100092F90 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFolderUI;
}

id static OS_os_log.crlFolderUI.getter()
{
  return sub_1000223F8(&qword_100092F90, (void **)&static OS_os_log.crlFolderUI);
}

void static OS_os_log.crlFolderUI.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFolderUI.modify())()
{
  if (qword_100092F90 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001CEB4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardLibraryCat_log_t, &CRLBoardLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardLibrary.unsafeMutableAddressor()
{
  if (qword_100092F98 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardLibrary;
}

id static OS_os_log.crlBoardLibrary.getter()
{
  return sub_1000223F8(&qword_100092F98, (void **)&static OS_os_log.crlBoardLibrary);
}

void static OS_os_log.crlBoardLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardLibrary.modify())()
{
  if (qword_100092F98 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001D088()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardPreviewImageCacheCat_log_t, &CRLBoardPreviewImageCacheCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardPreviewImageCache = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardPreviewImageCache.unsafeMutableAddressor()
{
  if (qword_100092FA0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardPreviewImageCache;
}

id static OS_os_log.crlBoardPreviewImageCache.getter()
{
  return sub_1000223F8(&qword_100092FA0, (void **)&static OS_os_log.crlBoardPreviewImageCache);
}

void static OS_os_log.crlBoardPreviewImageCache.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardPreviewImageCache.modify())()
{
  if (qword_100092FA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001D25C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSharingExtensionCat_log_t, &CRLSharingExtensionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSharingExtension = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSharingExtension.unsafeMutableAddressor()
{
  if (qword_100092FA8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSharingExtension;
}

id static OS_os_log.crlSharingExtension.getter()
{
  return sub_1000223F8(&qword_100092FA8, (void **)&static OS_os_log.crlSharingExtension);
}

void static OS_os_log.crlSharingExtension.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSharingExtension.modify())()
{
  if (qword_100092FA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_10001D434()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStencilLibraryCat_log_t, &CRLStencilLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStencilLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStencilLibrary.unsafeMutableAddressor()
{
  if (qword_100092FB0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStencilLibrary;
}

id static OS_os_log.crlStencilLibrary.getter()
{
  return sub_1000223F8(&qword_100092FB0, (void **)&static OS_os_log.crlStencilLibrary);
}

void static OS_os_log.crlStencilLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStencilLibrary.modify())()
{
  if (qword_100092FB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001D608()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeMessageTransferCat_log_t, &CRLCarmelRealTimeMessageTransferCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlRealTimeMessageTransfer = (uint64_t)v1;
}

uint64_t *OS_os_log.crlRealTimeMessageTransfer.unsafeMutableAddressor()
{
  if (qword_100092FB8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlRealTimeMessageTransfer;
}

id static OS_os_log.crlRealTimeMessageTransfer.getter()
{
  return sub_1000223F8(&qword_100092FB8, (void **)&static OS_os_log.crlRealTimeMessageTransfer);
}

void static OS_os_log.crlRealTimeMessageTransfer.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlRealTimeMessageTransfer.modify())()
{
  if (qword_100092FB8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001D7DC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLZoneRefetchCat_log_t, &CRLZoneRefetchCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlZoneRefetch = (uint64_t)v1;
}

uint64_t *OS_os_log.crlZoneRefetch.unsafeMutableAddressor()
{
  if (qword_100092FC0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlZoneRefetch;
}

id static OS_os_log.crlZoneRefetch.getter()
{
  return sub_1000223F8(&qword_100092FC0, (void **)&static OS_os_log.crlZoneRefetch);
}

void static OS_os_log.crlZoneRefetch.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlZoneRefetch.modify())()
{
  if (qword_100092FC0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001D9B0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSendACopyCat_log_t, &CRLSendACopyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSendACopy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSendACopy.unsafeMutableAddressor()
{
  if (qword_100092FC8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSendACopy;
}

id static OS_os_log.crlSendACopy.getter()
{
  return sub_1000223F8(&qword_100092FC8, (void **)&static OS_os_log.crlSendACopy);
}

void static OS_os_log.crlSendACopy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSendACopy.modify())()
{
  if (qword_100092FC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001DB8C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudKitEnvironmentCat_log_t, &CRLCloudKitEnvironmentCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudKitEnvironment = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudKitEnvironment.unsafeMutableAddressor()
{
  if (qword_100092FD0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudKitEnvironment;
}

id static OS_os_log.crlCloudKitEnvironment.getter()
{
  return sub_1000223F8(&qword_100092FD0, (void **)&static OS_os_log.crlCloudKitEnvironment);
}

void static OS_os_log.crlCloudKitEnvironment.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudKitEnvironment.modify())()
{
  if (qword_100092FD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001DD60()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSidebarCat_log_t, &CRLSidebarCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSidebar = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSidebar.unsafeMutableAddressor()
{
  if (qword_100092FD8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSidebar;
}

id static OS_os_log.crlSidebar.getter()
{
  return sub_1000223F8(&qword_100092FD8, (void **)&static OS_os_log.crlSidebar);
}

void static OS_os_log.crlSidebar.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSidebar.modify())()
{
  if (qword_100092FD8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001DF3C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInsertMediaCat_log_t, &CRLInsertMediaCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlInsertMedia = (uint64_t)v1;
}

uint64_t *OS_os_log.crlInsertMedia.unsafeMutableAddressor()
{
  if (qword_100092FE0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlInsertMedia;
}

id static OS_os_log.crlInsertMedia.getter()
{
  return sub_1000223F8(&qword_100092FE0, (void **)&static OS_os_log.crlInsertMedia);
}

void static OS_os_log.crlInsertMedia.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlInsertMedia.modify())()
{
  if (qword_100092FE0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001E110()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaboratorCursorCat_log_t, &CRLCollaboratorCursorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaboratorCursor = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaboratorCursor.unsafeMutableAddressor()
{
  if (qword_100092FE8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaboratorCursor;
}

id static OS_os_log.crlCollaboratorCursor.getter()
{
  return sub_1000223F8(&qword_100092FE8, (void **)&static OS_os_log.crlCollaboratorCursor);
}

void static OS_os_log.crlCollaboratorCursor.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaboratorCursor.modify())()
{
  if (qword_100092FE8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001E2E4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStateRestorationCat_log_t, &CRLStateRestorationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStateRestoration = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStateRestoration.unsafeMutableAddressor()
{
  if (qword_100092FF0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStateRestoration;
}

id static OS_os_log.crlStateRestoration.getter()
{
  return sub_1000223F8(&qword_100092FF0, (void **)&static OS_os_log.crlStateRestoration);
}

void static OS_os_log.crlStateRestoration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStateRestoration.modify())()
{
  if (qword_100092FF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001E4B8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFollowCat_log_t, &CRLFollowCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFollow = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFollow.unsafeMutableAddressor()
{
  if (qword_100092FF8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFollow;
}

id static OS_os_log.crlFollow.getter()
{
  return sub_1000223F8(&qword_100092FF8, (void **)&static OS_os_log.crlFollow);
}

void static OS_os_log.crlFollow.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFollow.modify())()
{
  if (qword_100092FF8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001E690()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLJoinLeaveCat_log_t, &CRLJoinLeaveCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlJoinLeave = (uint64_t)v1;
}

uint64_t *OS_os_log.crlJoinLeave.unsafeMutableAddressor()
{
  if (qword_100093000 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlJoinLeave;
}

id static OS_os_log.crlJoinLeave.getter()
{
  return sub_1000223F8(&qword_100093000, (void **)&static OS_os_log.crlJoinLeave);
}

void static OS_os_log.crlJoinLeave.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlJoinLeave.modify())()
{
  if (qword_100093000 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001E86C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPencilHoverCat_log_t, &CRLPencilHoverCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPencilHover = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPencilHover.unsafeMutableAddressor()
{
  if (qword_100093008 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPencilHover;
}

id static OS_os_log.crlPencilHover.getter()
{
  return sub_1000223F8(&qword_100093008, (void **)&static OS_os_log.crlPencilHover);
}

void static OS_os_log.crlPencilHover.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPencilHover.modify())()
{
  if (qword_100093008 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001EA40()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLScenesCat_log_t, &CRLScenesCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlScenes = (uint64_t)v1;
}

uint64_t *OS_os_log.crlScenes.unsafeMutableAddressor()
{
  if (qword_100093010 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlScenes;
}

id static OS_os_log.crlScenes.getter()
{
  return sub_1000223F8(&qword_100093010, (void **)&static OS_os_log.crlScenes);
}

void static OS_os_log.crlScenes.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlScenes.modify())()
{
  if (qword_100093010 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001EC1C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLThreeDimensionalObjectsCat_log_t, &CRLThreeDimensionalObjectsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlThreeDimensionalObjects = (uint64_t)v1;
}

id static OS_os_log.crlThreeDimensionalObjects.getter()
{
  return sub_1000223F8(&qword_100093018, (void **)&static OS_os_log.crlThreeDimensionalObjects);
}

void static OS_os_log.crlThreeDimensionalObjects.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlThreeDimensionalObjects.modify())()
{
  if (qword_100093018 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001EDA4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLChangeShapeCat_log_t, &CRLChangeShapeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlChangeShape = (uint64_t)v1;
}

uint64_t *OS_os_log.crlChangeShape.unsafeMutableAddressor()
{
  if (qword_100093020 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlChangeShape;
}

id static OS_os_log.crlChangeShape.getter()
{
  return sub_1000223F8(&qword_100093020, (void **)&static OS_os_log.crlChangeShape);
}

void static OS_os_log.crlChangeShape.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlChangeShape.modify())()
{
  if (qword_100093020 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001EF78()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudQuotaMessagingCat_log_t, &CRLCloudQuotaMessagingCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudQuotaMessaging = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudQuotaMessaging.unsafeMutableAddressor()
{
  if (qword_100093028 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudQuotaMessaging;
}

id static OS_os_log.crlCloudQuotaMessaging.getter()
{
  return sub_1000223F8(&qword_100093028, (void **)&static OS_os_log.crlCloudQuotaMessaging);
}

void static OS_os_log.crlCloudQuotaMessaging.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudQuotaMessaging.modify())()
{
  if (qword_100093028 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001F14C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRL3DBreakthroughCat_log_t, &CRL3DBreakthroughCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crl3DBreakthrough = (uint64_t)v1;
}

uint64_t *OS_os_log.crl3DBreakthrough.unsafeMutableAddressor()
{
  if (qword_100093030 != -1) {
    swift_once();
  }
  return &static OS_os_log.crl3DBreakthrough;
}

id static OS_os_log.crl3DBreakthrough.getter()
{
  return sub_1000223F8(&qword_100093030, (void **)&static OS_os_log.crl3DBreakthrough);
}

void static OS_os_log.crl3DBreakthrough.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crl3DBreakthrough.modify())()
{
  if (qword_100093030 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001F320()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLLayerAnimationCat_log_t, &CRLLayerAnimationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlLayerAnimation = (uint64_t)v1;
}

uint64_t *OS_os_log.crlLayerAnimation.unsafeMutableAddressor()
{
  if (qword_100093038 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlLayerAnimation;
}

id static OS_os_log.crlLayerAnimation.getter()
{
  return sub_1000223F8(&qword_100093038, (void **)&static OS_os_log.crlLayerAnimation);
}

void static OS_os_log.crlLayerAnimation.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlLayerAnimation.modify())()
{
  if (qword_100093038 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001F4F4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnimationImplCat_log_t, &CRLAnimationImplCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnimationImpl = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnimationImpl.unsafeMutableAddressor()
{
  if (qword_100093040 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnimationImpl;
}

id static OS_os_log.crlAnimationImpl.getter()
{
  return sub_1000223F8(&qword_100093040, (void **)&static OS_os_log.crlAnimationImpl);
}

void static OS_os_log.crlAnimationImpl.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnimationImpl.modify())()
{
  if (qword_100093040 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001F6C8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLMiniFormatterCat_log_t, &CRLMiniFormatterCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlMiniFormatter = (uint64_t)v1;
}

uint64_t *OS_os_log.crlMiniFormatter.unsafeMutableAddressor()
{
  if (qword_100093048 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlMiniFormatter;
}

id static OS_os_log.crlMiniFormatter.getter()
{
  return sub_1000223F8(&qword_100093048, (void **)&static OS_os_log.crlMiniFormatter);
}

void static OS_os_log.crlMiniFormatter.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlMiniFormatter.modify())()
{
  if (qword_100093048 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001F89C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSceneManagementCat_log_t, &CRLSceneManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sceneManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.sceneManagement.unsafeMutableAddressor()
{
  if (qword_100093050 != -1) {
    swift_once();
  }
  return &static OS_os_log.sceneManagement;
}

id static OS_os_log.sceneManagement.getter()
{
  return sub_1000223F8(&qword_100093050, (void **)&static OS_os_log.sceneManagement);
}

void static OS_os_log.sceneManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.sceneManagement.modify())()
{
  if (qword_100093050 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001FA78()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCompositionCat_log_t, &CRLCompositionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.composition = (uint64_t)v1;
}

uint64_t *OS_os_log.composition.unsafeMutableAddressor()
{
  if (qword_100093058 != -1) {
    swift_once();
  }
  return &static OS_os_log.composition;
}

id static OS_os_log.composition.getter()
{
  return sub_1000223F8(&qword_100093058, (void **)&static OS_os_log.composition);
}

void static OS_os_log.composition.setter(void *a1)
{
}

uint64_t (*static OS_os_log.composition.modify())()
{
  if (qword_100093058 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001FC50()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLViewControllerCat_log_t, &CRLViewControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.CRLViewController = (uint64_t)v1;
}

uint64_t *OS_os_log.CRLViewController.unsafeMutableAddressor()
{
  if (qword_100093060 != -1) {
    swift_once();
  }
  return &static OS_os_log.CRLViewController;
}

id static OS_os_log.CRLViewController.getter()
{
  return sub_1000223F8(&qword_100093060, (void **)&static OS_os_log.CRLViewController);
}

void static OS_os_log.CRLViewController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.CRLViewController.modify())()
{
  if (qword_100093060 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001FE24()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppIntentsCat_log_t, &CRLAppIntentsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appIntents = (uint64_t)v1;
}

uint64_t *OS_os_log.appIntents.unsafeMutableAddressor()
{
  if (qword_100093068 != -1) {
    swift_once();
  }
  return &static OS_os_log.appIntents;
}

id static OS_os_log.appIntents.getter()
{
  return sub_1000223F8(&qword_100093068, (void **)&static OS_os_log.appIntents);
}

void static OS_os_log.appIntents.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appIntents.modify())()
{
  if (qword_100093068 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10001FFF8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppStateCat_log_t, &CRLAppStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appState = (uint64_t)v1;
}

uint64_t *OS_os_log.appState.unsafeMutableAddressor()
{
  if (qword_100093070 != -1) {
    swift_once();
  }
  return &static OS_os_log.appState;
}

id static OS_os_log.appState.getter()
{
  return sub_1000223F8(&qword_100093070, (void **)&static OS_os_log.appState);
}

void static OS_os_log.appState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appState.modify())()
{
  if (qword_100093070 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000201C8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInteractionCat_log_t, &CRLInteractionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.interaction = (uint64_t)v1;
}

uint64_t *OS_os_log.interaction.unsafeMutableAddressor()
{
  if (qword_100093078 != -1) {
    swift_once();
  }
  return &static OS_os_log.interaction;
}

id static OS_os_log.interaction.getter()
{
  return sub_1000223F8(&qword_100093078, (void **)&static OS_os_log.interaction);
}

void static OS_os_log.interaction.setter(void *a1)
{
}

uint64_t (*static OS_os_log.interaction.modify())()
{
  if (qword_100093078 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000203A0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLContentStateCat_log_t, &CRLContentStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.contentState = (uint64_t)v1;
}

uint64_t *OS_os_log.contentState.unsafeMutableAddressor()
{
  if (qword_100093080 != -1) {
    swift_once();
  }
  return &static OS_os_log.contentState;
}

id static OS_os_log.contentState.getter()
{
  return sub_1000223F8(&qword_100093080, (void **)&static OS_os_log.contentState);
}

void static OS_os_log.contentState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.contentState.modify())()
{
  if (qword_100093080 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100020578()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardDataStoreCat_log_t, &CRLBoardDataStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardStore = (uint64_t)v1;
}

uint64_t *OS_os_log.boardStore.unsafeMutableAddressor()
{
  if (qword_100093088 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardStore;
}

id static OS_os_log.boardStore.getter()
{
  return sub_1000223F8(&qword_100093088, (void **)&static OS_os_log.boardStore);
}

void static OS_os_log.boardStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardStore.modify())()
{
  if (qword_100093088 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10002074C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFileProviderStoreCat_log_t, &CRLFileProviderStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.fileProviderStore = (uint64_t)v1;
}

uint64_t *OS_os_log.fileProviderStore.unsafeMutableAddressor()
{
  if (qword_100093090 != -1) {
    swift_once();
  }
  return &static OS_os_log.fileProviderStore;
}

id static OS_os_log.fileProviderStore.getter()
{
  return sub_1000223F8(&qword_100093090, (void **)&static OS_os_log.fileProviderStore);
}

void static OS_os_log.fileProviderStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.fileProviderStore.modify())()
{
  if (qword_100093090 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100020920()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPersistenceCat_log_t, &CRLPersistenceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.persistence = (uint64_t)v1;
}

uint64_t *OS_os_log.persistence.unsafeMutableAddressor()
{
  if (qword_100093098 != -1) {
    swift_once();
  }
  return &static OS_os_log.persistence;
}

id static OS_os_log.persistence.getter()
{
  return sub_1000223F8(&qword_100093098, (void **)&static OS_os_log.persistence);
}

void static OS_os_log.persistence.setter(void *a1)
{
}

uint64_t (*static OS_os_log.persistence.modify())()
{
  if (qword_100093098 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100020AF8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataSyncCat_log_t, &CRLDataSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.dataSync = (uint64_t)v1;
}

uint64_t *OS_os_log.dataSync.unsafeMutableAddressor()
{
  if (qword_1000930A0 != -1) {
    swift_once();
  }
  return &static OS_os_log.dataSync;
}

id static OS_os_log.dataSync.getter()
{
  return sub_1000223F8(&qword_1000930A0, (void **)&static OS_os_log.dataSync);
}

void static OS_os_log.dataSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.dataSync.modify())()
{
  if (qword_1000930A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100020CC8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCommandControllerCat_log_t, &CRLCommandControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.commandController = (uint64_t)v1;
}

uint64_t *OS_os_log.commandController.unsafeMutableAddressor()
{
  if (qword_1000930A8 != -1) {
    swift_once();
  }
  return &static OS_os_log.commandController;
}

id static OS_os_log.commandController.getter()
{
  return sub_1000223F8(&qword_1000930A8, (void **)&static OS_os_log.commandController);
}

void static OS_os_log.commandController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.commandController.modify())()
{
  if (qword_1000930A8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100020E9C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSuspendResumeCollaborationCat_log_t, &CRLSuspendResumeCollaborationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.suspendResumeCollaboration = (uint64_t)v1;
}

uint64_t *OS_os_log.suspendResumeCollaboration.unsafeMutableAddressor()
{
  if (qword_1000930B0 != -1) {
    swift_once();
  }
  return &static OS_os_log.suspendResumeCollaboration;
}

id static OS_os_log.suspendResumeCollaboration.getter()
{
  return sub_1000223F8(&qword_1000930B0, (void **)&static OS_os_log.suspendResumeCollaboration);
}

void static OS_os_log.suspendResumeCollaboration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.suspendResumeCollaboration.modify())()
{
  if (qword_1000930B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021070()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeSyncCat_log_t, &CRLCarmelRealTimeSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.realTimeSync = (uint64_t)v1;
}

uint64_t *OS_os_log.realTimeSync.unsafeMutableAddressor()
{
  if (qword_1000930B8 != -1) {
    swift_once();
  }
  return &static OS_os_log.realTimeSync;
}

id static OS_os_log.realTimeSync.getter()
{
  return sub_1000223F8(&qword_1000930B8, (void **)&static OS_os_log.realTimeSync);
}

void static OS_os_log.realTimeSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.realTimeSync.modify())()
{
  if (qword_1000930B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021244()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardInputCat_log_t, &CRLKeyboardInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.keyboardInput = (uint64_t)v1;
}

uint64_t *OS_os_log.keyboardInput.unsafeMutableAddressor()
{
  if (qword_1000930C0 != -1) {
    swift_once();
  }
  return &static OS_os_log.keyboardInput;
}

id static OS_os_log.keyboardInput.getter()
{
  return sub_1000223F8(&qword_1000930C0, (void **)&static OS_os_log.keyboardInput);
}

void static OS_os_log.keyboardInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.keyboardInput.modify())()
{
  if (qword_1000930C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021420()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTargetGestureCat_log_t, &CRLTargetGestureCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.target_gesture = (uint64_t)v1;
}

uint64_t *OS_os_log.target_gesture.unsafeMutableAddressor()
{
  if (qword_1000930C8 != -1) {
    swift_once();
  }
  return &static OS_os_log.target_gesture;
}

id static OS_os_log.target_gesture.getter()
{
  return sub_1000223F8(&qword_1000930C8, (void **)&static OS_os_log.target_gesture);
}

void static OS_os_log.target_gesture.setter(void *a1)
{
}

uint64_t (*static OS_os_log.target_gesture.modify())()
{
  if (qword_1000930C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000215FC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataStoreUpgradeCat_log_t, &CRLDataStoreUpgradeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.upgrade = (uint64_t)v1;
}

uint64_t *OS_os_log.upgrade.unsafeMutableAddressor()
{
  if (qword_1000930D0 != -1) {
    swift_once();
  }
  return &static OS_os_log.upgrade;
}

id static OS_os_log.upgrade.getter()
{
  return sub_1000223F8(&qword_1000930D0, (void **)&static OS_os_log.upgrade);
}

void static OS_os_log.upgrade.setter(void *a1)
{
}

uint64_t (*static OS_os_log.upgrade.modify())()
{
  if (qword_1000930D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000217D0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPasteboardCat_log_t, &CRLPasteboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.pasteboard = (uint64_t)v1;
}

uint64_t *OS_os_log.pasteboard.unsafeMutableAddressor()
{
  if (qword_1000930D8 != -1) {
    swift_once();
  }
  return &static OS_os_log.pasteboard;
}

id static OS_os_log.pasteboard.getter()
{
  return sub_1000223F8(&qword_1000930D8, (void **)&static OS_os_log.pasteboard);
}

void static OS_os_log.pasteboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.pasteboard.modify())()
{
  if (qword_1000930D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000219A4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemDataSizeCat_log_t, &CRLBoardItemDataSizeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemDataSize = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemDataSize.unsafeMutableAddressor()
{
  if (qword_1000930E0 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemDataSize;
}

id static OS_os_log.boardItemDataSize.getter()
{
  return sub_1000223F8(&qword_1000930E0, (void **)&static OS_os_log.boardItemDataSize);
}

void static OS_os_log.boardItemDataSize.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemDataSize.modify())()
{
  if (qword_1000930E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021B78()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemLifecycleCat_log_t, &CRLBoardItemLifecycleCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemLifecycle = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemLifecycle.unsafeMutableAddressor()
{
  if (qword_1000930E8 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemLifecycle;
}

id static OS_os_log.boardItemLifecycle.getter()
{
  return sub_1000223F8(&qword_1000930E8, (void **)&static OS_os_log.boardItemLifecycle);
}

void static OS_os_log.boardItemLifecycle.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemLifecycle.modify())()
{
  if (qword_1000930E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021D4C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetManagementCat_log_t, &CRLAssetManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.assetManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.assetManagement.unsafeMutableAddressor()
{
  if (qword_1000930F0 != -1) {
    swift_once();
  }
  return &static OS_os_log.assetManagement;
}

id static OS_os_log.assetManagement.getter()
{
  return sub_1000223F8(&qword_1000930F0, (void **)&static OS_os_log.assetManagement);
}

void static OS_os_log.assetManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.assetManagement.modify())()
{
  if (qword_1000930F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100021F28()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLShareStateCat_log_t, &CRLShareStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.shareState = (uint64_t)v1;
}

uint64_t *OS_os_log.shareState.unsafeMutableAddressor()
{
  if (qword_1000930F8 != -1) {
    swift_once();
  }
  return &static OS_os_log.shareState;
}

id static OS_os_log.shareState.getter()
{
  return sub_1000223F8(&qword_1000930F8, (void **)&static OS_os_log.shareState);
}

void static OS_os_log.shareState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.shareState.modify())()
{
  if (qword_1000930F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000220FC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDrawingDataDetectors_log_t, &CRLDrawingDataDetectors_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.DrawingDataDetectors = (uint64_t)v1;
}

uint64_t *OS_os_log.DrawingDataDetectors.unsafeMutableAddressor()
{
  if (qword_100093100 != -1) {
    swift_once();
  }
  return &static OS_os_log.DrawingDataDetectors;
}

id static OS_os_log.DrawingDataDetectors.getter()
{
  return sub_1000223F8(&qword_100093100, (void **)&static OS_os_log.DrawingDataDetectors);
}

void static OS_os_log.DrawingDataDetectors.setter(void *a1)
{
}

uint64_t (*static OS_os_log.DrawingDataDetectors.modify())()
{
  if (qword_100093100 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000222D0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005E6F0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSideStore_log_t, &CRLSideStore_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sideStore = (uint64_t)v1;
}

uint64_t *OS_os_log.sideStore.unsafeMutableAddressor()
{
  if (qword_100093108 != -1) {
    swift_once();
  }
  return &static OS_os_log.sideStore;
}

id static OS_os_log.sideStore.getter()
{
  return sub_1000223F8(&qword_100093108, (void **)&static OS_os_log.sideStore);
}

id sub_1000223F8(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unsigned int v3 = *a2;

  return v3;
}

void static OS_os_log.sideStore.setter(void *a1)
{
}

void sub_100022484(void *a1, void *a2, void **a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a3;
  *a3 = a1;
}

uint64_t (*static OS_os_log.sideStore.modify())()
{
  if (qword_100093108 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_100022574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  switch(*(void *)(a7 + 16))
  {
    case 1:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1000716E0;
      uint64_t v10 = v9 + 32;
      uint64_t v11 = a7 + 32;
      goto LABEL_25;
    case 2:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_1000716D0;
      sub_1000233DC(a7 + 32, v12 + 32);
      uint64_t v10 = v12 + 72;
      uint64_t v11 = a7 + 72;
      goto LABEL_25;
    case 3:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1000716C0;
      sub_1000233DC(a7 + 32, v13 + 32);
      sub_1000233DC(a7 + 72, v13 + 72);
      uint64_t v10 = v13 + 112;
      uint64_t v11 = a7 + 112;
      goto LABEL_25;
    case 4:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1000716B0;
      sub_1000233DC(a7 + 32, v14 + 32);
      sub_1000233DC(a7 + 72, v14 + 72);
      sub_1000233DC(a7 + 112, v14 + 112);
      uint64_t v10 = v14 + 152;
      uint64_t v11 = a7 + 152;
      goto LABEL_25;
    case 5:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_1000716A0;
      sub_1000233DC(a7 + 32, v15 + 32);
      sub_1000233DC(a7 + 72, v15 + 72);
      sub_1000233DC(a7 + 112, v15 + 112);
      sub_1000233DC(a7 + 152, v15 + 152);
      uint64_t v10 = v15 + 192;
      uint64_t v11 = a7 + 192;
      goto LABEL_25;
    case 6:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_100071690;
      sub_1000233DC(a7 + 32, v16 + 32);
      sub_1000233DC(a7 + 72, v16 + 72);
      sub_1000233DC(a7 + 112, v16 + 112);
      sub_1000233DC(a7 + 152, v16 + 152);
      sub_1000233DC(a7 + 192, v16 + 192);
      uint64_t v10 = v16 + 232;
      uint64_t v11 = a7 + 232;
      goto LABEL_25;
    case 7:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_100071680;
      sub_1000233DC(a7 + 32, v17 + 32);
      sub_1000233DC(a7 + 72, v17 + 72);
      sub_1000233DC(a7 + 112, v17 + 112);
      sub_1000233DC(a7 + 152, v17 + 152);
      sub_1000233DC(a7 + 192, v17 + 192);
      sub_1000233DC(a7 + 232, v17 + 232);
      uint64_t v10 = v17 + 272;
      uint64_t v11 = a7 + 272;
      goto LABEL_25;
    case 8:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_100071670;
      sub_1000233DC(a7 + 32, v18 + 32);
      sub_1000233DC(a7 + 72, v18 + 72);
      sub_1000233DC(a7 + 112, v18 + 112);
      sub_1000233DC(a7 + 152, v18 + 152);
      sub_1000233DC(a7 + 192, v18 + 192);
      sub_1000233DC(a7 + 232, v18 + 232);
      sub_1000233DC(a7 + 272, v18 + 272);
      uint64_t v10 = v18 + 312;
      uint64_t v11 = a7 + 312;
      goto LABEL_25;
    case 9:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_100071660;
      sub_1000233DC(a7 + 32, v19 + 32);
      sub_1000233DC(a7 + 72, v19 + 72);
      sub_1000233DC(a7 + 112, v19 + 112);
      sub_1000233DC(a7 + 152, v19 + 152);
      sub_1000233DC(a7 + 192, v19 + 192);
      sub_1000233DC(a7 + 232, v19 + 232);
      sub_1000233DC(a7 + 272, v19 + 272);
      sub_1000233DC(a7 + 312, v19 + 312);
      uint64_t v10 = v19 + 352;
      uint64_t v11 = a7 + 352;
      goto LABEL_25;
    case 0xALL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_100071650;
      sub_1000233DC(a7 + 32, v20 + 32);
      sub_1000233DC(a7 + 72, v20 + 72);
      sub_1000233DC(a7 + 112, v20 + 112);
      sub_1000233DC(a7 + 152, v20 + 152);
      sub_1000233DC(a7 + 192, v20 + 192);
      sub_1000233DC(a7 + 232, v20 + 232);
      sub_1000233DC(a7 + 272, v20 + 272);
      sub_1000233DC(a7 + 312, v20 + 312);
      sub_1000233DC(a7 + 352, v20 + 352);
      uint64_t v10 = v20 + 392;
      uint64_t v11 = a7 + 392;
      goto LABEL_25;
    case 0xBLL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_100071640;
      sub_1000233DC(a7 + 32, v21 + 32);
      sub_1000233DC(a7 + 72, v21 + 72);
      sub_1000233DC(a7 + 112, v21 + 112);
      sub_1000233DC(a7 + 152, v21 + 152);
      sub_1000233DC(a7 + 192, v21 + 192);
      sub_1000233DC(a7 + 232, v21 + 232);
      sub_1000233DC(a7 + 272, v21 + 272);
      sub_1000233DC(a7 + 312, v21 + 312);
      sub_1000233DC(a7 + 352, v21 + 352);
      sub_1000233DC(a7 + 392, v21 + 392);
      uint64_t v10 = v21 + 432;
      uint64_t v11 = a7 + 432;
      goto LABEL_25;
    case 0xCLL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_100071630;
      sub_1000233DC(a7 + 32, v22 + 32);
      sub_1000233DC(a7 + 72, v22 + 72);
      sub_1000233DC(a7 + 112, v22 + 112);
      sub_1000233DC(a7 + 152, v22 + 152);
      sub_1000233DC(a7 + 192, v22 + 192);
      sub_1000233DC(a7 + 232, v22 + 232);
      sub_1000233DC(a7 + 272, v22 + 272);
      sub_1000233DC(a7 + 312, v22 + 312);
      sub_1000233DC(a7 + 352, v22 + 352);
      sub_1000233DC(a7 + 392, v22 + 392);
      sub_1000233DC(a7 + 432, v22 + 432);
      uint64_t v10 = v22 + 472;
      uint64_t v11 = a7 + 472;
      goto LABEL_25;
    case 0xDLL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_100071620;
      sub_1000233DC(a7 + 32, v23 + 32);
      sub_1000233DC(a7 + 72, v23 + 72);
      sub_1000233DC(a7 + 112, v23 + 112);
      sub_1000233DC(a7 + 152, v23 + 152);
      sub_1000233DC(a7 + 192, v23 + 192);
      sub_1000233DC(a7 + 232, v23 + 232);
      sub_1000233DC(a7 + 272, v23 + 272);
      sub_1000233DC(a7 + 312, v23 + 312);
      sub_1000233DC(a7 + 352, v23 + 352);
      sub_1000233DC(a7 + 392, v23 + 392);
      sub_1000233DC(a7 + 432, v23 + 432);
      sub_1000233DC(a7 + 472, v23 + 472);
      uint64_t v10 = v23 + 512;
      uint64_t v11 = a7 + 512;
      goto LABEL_25;
    case 0xELL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_100071610;
      sub_1000233DC(a7 + 32, v24 + 32);
      sub_1000233DC(a7 + 72, v24 + 72);
      sub_1000233DC(a7 + 112, v24 + 112);
      sub_1000233DC(a7 + 152, v24 + 152);
      sub_1000233DC(a7 + 192, v24 + 192);
      sub_1000233DC(a7 + 232, v24 + 232);
      sub_1000233DC(a7 + 272, v24 + 272);
      sub_1000233DC(a7 + 312, v24 + 312);
      sub_1000233DC(a7 + 352, v24 + 352);
      sub_1000233DC(a7 + 392, v24 + 392);
      sub_1000233DC(a7 + 432, v24 + 432);
      sub_1000233DC(a7 + 472, v24 + 472);
      sub_1000233DC(a7 + 512, v24 + 512);
      uint64_t v10 = v24 + 552;
      uint64_t v11 = a7 + 552;
      goto LABEL_25;
    case 0xFLL:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_100071600;
      sub_1000233DC(a7 + 32, v25 + 32);
      sub_1000233DC(a7 + 72, v25 + 72);
      sub_1000233DC(a7 + 112, v25 + 112);
      sub_1000233DC(a7 + 152, v25 + 152);
      sub_1000233DC(a7 + 192, v25 + 192);
      sub_1000233DC(a7 + 232, v25 + 232);
      sub_1000233DC(a7 + 272, v25 + 272);
      sub_1000233DC(a7 + 312, v25 + 312);
      sub_1000233DC(a7 + 352, v25 + 352);
      sub_1000233DC(a7 + 392, v25 + 392);
      sub_1000233DC(a7 + 432, v25 + 432);
      sub_1000233DC(a7 + 472, v25 + 472);
      sub_1000233DC(a7 + 512, v25 + 512);
      sub_1000233DC(a7 + 552, v25 + 552);
      uint64_t v10 = v25 + 592;
      uint64_t v11 = a7 + 592;
      goto LABEL_25;
    case 0x10:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_1000715F0;
      sub_1000233DC(a7 + 32, v26 + 32);
      sub_1000233DC(a7 + 72, v26 + 72);
      sub_1000233DC(a7 + 112, v26 + 112);
      sub_1000233DC(a7 + 152, v26 + 152);
      sub_1000233DC(a7 + 192, v26 + 192);
      sub_1000233DC(a7 + 232, v26 + 232);
      sub_1000233DC(a7 + 272, v26 + 272);
      sub_1000233DC(a7 + 312, v26 + 312);
      sub_1000233DC(a7 + 352, v26 + 352);
      sub_1000233DC(a7 + 392, v26 + 392);
      sub_1000233DC(a7 + 432, v26 + 432);
      sub_1000233DC(a7 + 472, v26 + 472);
      sub_1000233DC(a7 + 512, v26 + 512);
      sub_1000233DC(a7 + 552, v26 + 552);
      sub_1000233DC(a7 + 592, v26 + 592);
      uint64_t v10 = v26 + 632;
      uint64_t v11 = a7 + 632;
      goto LABEL_25;
    case 0x11:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1000715E0;
      sub_1000233DC(a7 + 32, v27 + 32);
      sub_1000233DC(a7 + 72, v27 + 72);
      sub_1000233DC(a7 + 112, v27 + 112);
      sub_1000233DC(a7 + 152, v27 + 152);
      sub_1000233DC(a7 + 192, v27 + 192);
      sub_1000233DC(a7 + 232, v27 + 232);
      sub_1000233DC(a7 + 272, v27 + 272);
      sub_1000233DC(a7 + 312, v27 + 312);
      sub_1000233DC(a7 + 352, v27 + 352);
      sub_1000233DC(a7 + 392, v27 + 392);
      sub_1000233DC(a7 + 432, v27 + 432);
      sub_1000233DC(a7 + 472, v27 + 472);
      sub_1000233DC(a7 + 512, v27 + 512);
      sub_1000233DC(a7 + 552, v27 + 552);
      sub_1000233DC(a7 + 592, v27 + 592);
      sub_1000233DC(a7 + 632, v27 + 632);
      uint64_t v10 = v27 + 672;
      uint64_t v11 = a7 + 672;
      goto LABEL_25;
    case 0x12:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_1000715D0;
      sub_1000233DC(a7 + 32, v28 + 32);
      sub_1000233DC(a7 + 72, v28 + 72);
      sub_1000233DC(a7 + 112, v28 + 112);
      sub_1000233DC(a7 + 152, v28 + 152);
      sub_1000233DC(a7 + 192, v28 + 192);
      sub_1000233DC(a7 + 232, v28 + 232);
      sub_1000233DC(a7 + 272, v28 + 272);
      sub_1000233DC(a7 + 312, v28 + 312);
      sub_1000233DC(a7 + 352, v28 + 352);
      sub_1000233DC(a7 + 392, v28 + 392);
      sub_1000233DC(a7 + 432, v28 + 432);
      sub_1000233DC(a7 + 472, v28 + 472);
      sub_1000233DC(a7 + 512, v28 + 512);
      sub_1000233DC(a7 + 552, v28 + 552);
      sub_1000233DC(a7 + 592, v28 + 592);
      sub_1000233DC(a7 + 632, v28 + 632);
      sub_1000233DC(a7 + 672, v28 + 672);
      uint64_t v10 = v28 + 712;
      uint64_t v11 = a7 + 712;
      goto LABEL_25;
    case 0x13:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_1000715C0;
      sub_1000233DC(a7 + 32, v29 + 32);
      sub_1000233DC(a7 + 72, v29 + 72);
      sub_1000233DC(a7 + 112, v29 + 112);
      sub_1000233DC(a7 + 152, v29 + 152);
      sub_1000233DC(a7 + 192, v29 + 192);
      sub_1000233DC(a7 + 232, v29 + 232);
      sub_1000233DC(a7 + 272, v29 + 272);
      sub_1000233DC(a7 + 312, v29 + 312);
      sub_1000233DC(a7 + 352, v29 + 352);
      sub_1000233DC(a7 + 392, v29 + 392);
      sub_1000233DC(a7 + 432, v29 + 432);
      sub_1000233DC(a7 + 472, v29 + 472);
      sub_1000233DC(a7 + 512, v29 + 512);
      sub_1000233DC(a7 + 552, v29 + 552);
      sub_1000233DC(a7 + 592, v29 + 592);
      sub_1000233DC(a7 + 632, v29 + 632);
      sub_1000233DC(a7 + 672, v29 + 672);
      sub_1000233DC(a7 + 712, v29 + 712);
      uint64_t v10 = v29 + 752;
      uint64_t v11 = a7 + 752;
      goto LABEL_25;
    case 0x14:
      sub_100015F58((uint64_t *)&unk_100095230);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_1000715B0;
      sub_1000233DC(a7 + 32, v30 + 32);
      sub_1000233DC(a7 + 72, v30 + 72);
      sub_1000233DC(a7 + 112, v30 + 112);
      sub_1000233DC(a7 + 152, v30 + 152);
      sub_1000233DC(a7 + 192, v30 + 192);
      sub_1000233DC(a7 + 232, v30 + 232);
      sub_1000233DC(a7 + 272, v30 + 272);
      sub_1000233DC(a7 + 312, v30 + 312);
      sub_1000233DC(a7 + 352, v30 + 352);
      sub_1000233DC(a7 + 392, v30 + 392);
      sub_1000233DC(a7 + 432, v30 + 432);
      sub_1000233DC(a7 + 472, v30 + 472);
      sub_1000233DC(a7 + 512, v30 + 512);
      sub_1000233DC(a7 + 552, v30 + 552);
      sub_1000233DC(a7 + 592, v30 + 592);
      sub_1000233DC(a7 + 632, v30 + 632);
      sub_1000233DC(a7 + 672, v30 + 672);
      sub_1000233DC(a7 + 712, v30 + 712);
      sub_1000233DC(a7 + 752, v30 + 752);
      uint64_t v10 = v30 + 792;
      uint64_t v11 = a7 + 792;
LABEL_25:
      sub_1000233DC(v11, v10);
      sub_10005E5D0();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      uint64_t result = sub_10005E5D0();
      break;
  }
  return result;
}

uint64_t sub_1000233DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100023444(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58((uint64_t *)&unk_1000952E0);
  uint64_t v2 = (void *)sub_10005EAF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002B70C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_100023568(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58((uint64_t *)&unk_100094C70);
  uint64_t v2 = (void *)sub_10005EAF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002B70C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_10002367C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58(&qword_100094040);
  uint64_t v2 = sub_10005EAF0();
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
    sub_100036430(v6, (uint64_t)&v15, &qword_100094048);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10002B70C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100033468(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000237B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58((uint64_t *)&unk_1000952A0);
  uint64_t v2 = (void *)sub_10005EAF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v6 = *(v4 - 1);
    uint64_t v5 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002DA54();
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (void *)(v2[7] + 16 * result);
    void *v9 = v6;
    v9[1] = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
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

unint64_t sub_1000238AC(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_100094060);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58(&qword_100094068);
  uint64_t v6 = sub_10005EAF0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
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
    sub_100036430(v12, (uint64_t)v5, &qword_100094060);
    unint64_t result = sub_10002B7C8((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_10005DED0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
    unint64_t result = sub_10003347C(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
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

unint64_t sub_100023AC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58(&qword_100094080);
  uint64_t v2 = sub_10005EAF0();
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
    sub_100036430(v6, (uint64_t)&v13, &qword_100094088);
    uint64_t v7 = v13;
    unint64_t result = sub_10002B864(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100033468(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_100023BF8(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_1000943A0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015F58((uint64_t *)&unk_1000952B0);
  uint64_t v6 = sub_10005EAF0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100036430(v12, (uint64_t)v5, &qword_1000943A0);
    unint64_t result = sub_10002B7C8((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_10005DED0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = (_OWORD *)(v7[7] + 32 * v16);
    long long v20 = *((_OWORD *)v9 + 1);
    *uint64_t v19 = *(_OWORD *)v9;
    v19[1] = v20;
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
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

uint64_t sub_100023DFC()
{
  uint64_t result = 7107189;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D6B6F6F426C7275;
      break;
    case 2:
      uint64_t result = 0x72756769666E6F63;
      break;
    case 3:
      uint64_t result = 0x46746C7561666564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100023EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002DAC0(a1, a2);
  *a3 = result;
  return result;
}

void sub_100023ECC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100023ED8(uint64_t a1)
{
  unint64_t v2 = sub_10003245C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023F14(uint64_t a1)
{
  unint64_t v2 = sub_10003245C();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100023F50()
{
  unint64_t result = 0x4F466172656D6163;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7461746E6569726FLL;
      break;
    case 2:
      unint64_t result = 0x724664656C616373;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x73746E65746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100024024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002DCCC(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002404C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100024058(uint64_t a1)
{
  unint64_t v2 = sub_100033094();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024094(uint64_t a1)
{
  unint64_t v2 = sub_100033094();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000240D0()
{
  uint64_t result = 0x6D696E4179616C70;
  switch(*v0)
  {
    case 1:
      uint64_t v2 = 0x416573756170;
      goto LABEL_5;
    case 2:
      uint64_t result = 0xD000000000000010;
      break;
    case 3:
      uint64_t v2 = 0x417465736572;
LABEL_5:
      uint64_t result = v2 & 0xFFFFFFFFFFFFLL | 0x696E000000000000;
      break;
    case 4:
      uint64_t result = 0x6D696E41706F7473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002418C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002DF50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000241B4(uint64_t a1)
{
  unint64_t v2 = sub_1000325BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000241F0(uint64_t a1)
{
  unint64_t v2 = sub_1000325BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002422C(uint64_t a1)
{
  unint64_t v2 = sub_10003270C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024268(uint64_t a1)
{
  unint64_t v2 = sub_10003270C();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_1000242A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1000242BC()
{
  if (*v0) {
    return 0x6150737472617473;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_100024304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002E1E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002432C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100024338(uint64_t a1)
{
  unint64_t v2 = sub_100032760();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024374(uint64_t a1)
{
  unint64_t v2 = sub_100032760();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000243B0(uint64_t a1)
{
  unint64_t v2 = sub_100032664();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000243EC(uint64_t a1)
{
  unint64_t v2 = sub_100032664();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024428(uint64_t a1)
{
  unint64_t v2 = sub_1000326B8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024464(uint64_t a1)
{
  unint64_t v2 = sub_1000326B8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000244A0(uint64_t a1)
{
  unint64_t v2 = sub_100032610();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000244DC(uint64_t a1)
{
  unint64_t v2 = sub_100032610();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024518()
{
  uint64_t result = 0x6465737561507369;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656C706D6F437369;
      break;
    case 2:
      uint64_t result = 0x6E6979616C507369;
      break;
    case 3:
      uint64_t result = 0x6570706F74537369;
      break;
    case 4:
      uint64_t result = 0x6465657073;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000245D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002E2E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000245F8(uint64_t a1)
{
  unint64_t v2 = sub_100032958();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024634(uint64_t a1)
{
  unint64_t v2 = sub_100032958();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002467C(uint64_t a1)
{
  unint64_t v2 = sub_100032808();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000246B8(uint64_t a1)
{
  unint64_t v2 = sub_100032808();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000246F4()
{
  if (*v0) {
    return 0x657669746361;
  }
  else {
    return 0x6576697463616E69;
  }
}

uint64_t sub_10002472C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002E520(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100024754(uint64_t a1)
{
  unint64_t v2 = sub_1000327B4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024790(uint64_t a1)
{
  unint64_t v2 = sub_1000327B4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000247CC(uint64_t a1)
{
  unint64_t v2 = sub_1000328B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024808(uint64_t a1)
{
  unint64_t v2 = sub_1000328B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024844()
{
  uint64_t result = 0x756F426C65646F6DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6F6974616D696E61;
      break;
    case 2:
      uint64_t result = 0x6956734977656976;
      break;
    case 3:
      uint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000248EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002E60C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100024914(uint64_t a1)
{
  unint64_t v2 = sub_100033190();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024950(uint64_t a1)
{
  unint64_t v2 = sub_100033190();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002498C()
{
  uint64_t result = 0x64656C6261736964;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6574736575716572;
      break;
    case 2:
      uint64_t result = 0x676E6964616F6CLL;
      break;
    case 3:
      uint64_t result = 0x6E697265646E6572;
      break;
    case 4:
      uint64_t result = 0x726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100024A40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002E810(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100024A68(uint64_t a1)
{
  unint64_t v2 = sub_100032A58();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024AA4(uint64_t a1)
{
  unint64_t v2 = sub_100032A58();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024AE0(uint64_t a1)
{
  unint64_t v2 = sub_100032C50();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024B1C(uint64_t a1)
{
  unint64_t v2 = sub_100032C50();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024B58(uint64_t a1)
{
  unint64_t v2 = sub_100032AAC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024B94(uint64_t a1)
{
  unint64_t v2 = sub_100032AAC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024BD0(uint64_t a1)
{
  unint64_t v2 = sub_100032BA8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024C0C(uint64_t a1)
{
  unint64_t v2 = sub_100032BA8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024C48(uint64_t a1)
{
  unint64_t v2 = sub_100032B00();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024C84(uint64_t a1)
{
  unint64_t v2 = sub_100032B00();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024CC0(uint64_t a1)
{
  unint64_t v2 = sub_100032BFC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024CFC(uint64_t a1)
{
  unint64_t v2 = sub_100032BFC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024D38(uint64_t a1, uint64_t a2)
{
  sub_100016C08(a1, (uint64_t)v4);
  sub_100016C08(a2, (uint64_t)v5);
  return sub_10002D230((uint64_t)v4, (uint64_t)v5) & 1;
}

uint64_t sub_100024D84(uint64_t a1)
{
  unint64_t v2 = sub_100032FEC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024DC0(uint64_t a1)
{
  unint64_t v2 = sub_100032FEC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024DFC()
{
  uint64_t result = 0x7245676E69646F63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x726F7272456C7275;
      break;
    case 2:
      uint64_t result = 0x45676E6964616F6CLL;
      break;
    case 3:
      uint64_t result = 0x7272456574617473;
      break;
    case 4:
      uint64_t result = 0x4574756F656D6974;
      break;
    case 5:
      uint64_t result = 0x6F69736E65747865;
      break;
    case 6:
      uint64_t result = 0x45636972656E6567;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100024EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002EA38(a1, a2);
  *a3 = result;
  return result;
}

void sub_100024F20(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100024F2C(uint64_t a1)
{
  unint64_t v2 = sub_100032D4C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024F68(uint64_t a1)
{
  unint64_t v2 = sub_100032D4C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100024FA4(uint64_t a1)
{
  unint64_t v2 = sub_100032DF4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100024FE0(uint64_t a1)
{
  unint64_t v2 = sub_100032DF4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002501C(uint64_t a1)
{
  unint64_t v2 = sub_100032DA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100025058(uint64_t a1)
{
  unint64_t v2 = sub_100032DA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100025094(uint64_t a1)
{
  unint64_t v2 = sub_100032F44();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000250D0(uint64_t a1)
{
  unint64_t v2 = sub_100032F44();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002510C(uint64_t a1)
{
  unint64_t v2 = sub_100032EF0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100025148(uint64_t a1)
{
  unint64_t v2 = sub_100032EF0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100025184(uint64_t a1)
{
  unint64_t v2 = sub_100032E9C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000251C0(uint64_t a1)
{
  unint64_t v2 = sub_100032E9C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000251FC(uint64_t a1)
{
  unint64_t v2 = sub_100032F98();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100025238(uint64_t a1)
{
  unint64_t v2 = sub_100032F98();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100025274(uint64_t a1)
{
  unint64_t v2 = sub_100033414();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000252B0(uint64_t a1)
{
  unint64_t v2 = sub_100033414();

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000252EC(uint64_t a1, uint64_t a2)
{
  return sub_10002D0D8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_100025308(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100015F58(&qword_100093CD8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_10003245C();
  sub_10005EE00();
  LOBYTE(v16) = 0;
  sub_10005DE10();
  sub_1000334E0(&qword_100093CE0, 255, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_10005EC10();
  if (!v2)
  {
    char v9 = (int *)type metadata accessor for CRLUSDRendering.SceneRequest(0);
    long long v16 = *(_OWORD *)(v3 + v9[5]);
    char v21 = 1;
    sub_100032568();
    sub_10005EC10();
    uint64_t v10 = v3 + v9[6];
    uint64_t v11 = *(void *)(v10 + 64);
    LODWORD(v16) = *(_DWORD *)v10;
    long long v12 = *(_OWORD *)(v10 + 32);
    long long v17 = *(_OWORD *)(v10 + 16);
    long long v18 = v12;
    long long v19 = *(_OWORD *)(v10 + 48);
    uint64_t v20 = v11;
    char v21 = 2;
    sub_100016B60();
    sub_10005EC10();
    uint64_t v13 = (long long *)(v3 + v9[7]);
    long long v14 = v13[1];
    long long v16 = *v13;
    long long v17 = v14;
    char v21 = 3;
    type metadata accessor for CGRect(0);
    sub_1000334E0(&qword_100093CF0, 255, type metadata accessor for CGRect);
    sub_10005EC10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000255C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_10005DE10();
  uint64_t v25 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v26 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100015F58(&qword_100093CB0);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for CRLUSDRendering.SceneRequest(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_10003245C();
  uint64_t v28 = v7;
  sub_10005EDE0();
  if (v2) {
    return sub_1000196FC((uint64_t)a1);
  }
  BOOL v22 = a1;
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v25;
  LOBYTE(v29) = 0;
  sub_1000334E0(&qword_100093CC0, 255, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v13 = v26;
  uint64_t v14 = v27;
  sub_10005EB90();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v13, v4);
  char v34 = 1;
  sub_1000324B0();
  sub_10005EB90();
  *(_OWORD *)(v11 + v8[5]) = v29;
  char v34 = 2;
  sub_100018BF4();
  sub_10005EB90();
  uint64_t v15 = v33;
  uint64_t v16 = v11 + v8[6];
  *(_DWORD *)uint64_t v16 = v29;
  long long v17 = v31;
  *(_OWORD *)(v16 + 16) = v30;
  *(_OWORD *)(v16 + 32) = v17;
  *(_OWORD *)(v16 + 48) = v32;
  *(void *)(v16 + 64) = v15;
  type metadata accessor for CGRect(0);
  char v34 = 3;
  sub_1000334E0(&qword_100093CD0, 255, type metadata accessor for CGRect);
  sub_10005EB90();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v14);
  long long v18 = (_OWORD *)(v11 + v8[7]);
  long long v19 = v30;
  _OWORD *v18 = v29;
  v18[1] = v19;
  sub_100032504(v11, v23);
  sub_1000196FC((uint64_t)v22);
  return sub_100018DE0(v11);
}

void sub_100025A44(uint64_t a1, Swift::UInt64 a2, char a3)
{
  switch(a3)
  {
    case 2:
      Swift::UInt v3 = 1;
      goto LABEL_10;
    case 3:
      Swift::UInt v3 = 2;
      goto LABEL_10;
    case 4:
      Swift::UInt v3 = 3;
      goto LABEL_10;
    case 5:
      Swift::UInt v3 = 4;
LABEL_10:
      sub_10005ED50(v3);
      break;
    default:
      Swift::UInt8 v5 = a3 & 1;
      sub_10005ED50(0);
      if ((a2 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v6 = a2;
      }
      else {
        Swift::UInt64 v6 = 0;
      }
      sub_10005ED80(v6);
      sub_10005ED60(v5);
      break;
  }
}

uint64_t sub_100025AF4(void *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v37 = a2;
  int v44 = a3;
  uint64_t v4 = sub_100015F58(&qword_100093D58);
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  __chkstk_darwin(v4);
  uint64_t v38 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093D60);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  __chkstk_darwin(v6);
  char v34 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100015F58(&qword_100093D68);
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100015F58(&qword_100093D70);
  uint64_t v31 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100015F58(&qword_100093D78);
  uint64_t v30 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100015F58(&qword_100093D80);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  uint64_t v42 = v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_1000325BC();
  int v21 = v44;
  sub_10005EE00();
  switch(v21)
  {
    case 2:
      char v48 = 1;
      sub_10003270C();
      uint64_t v22 = v41;
      sub_10005EBB0();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v11);
      goto LABEL_10;
    case 3:
      char v49 = 2;
      sub_1000326B8();
      uint64_t v22 = v41;
      sub_10005EBB0();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
      goto LABEL_10;
    case 4:
      char v50 = 3;
      sub_100032664();
      uint64_t v27 = v34;
      uint64_t v22 = v41;
      sub_10005EBB0();
      uint64_t v29 = v35;
      uint64_t v28 = v36;
      goto LABEL_9;
    case 5:
      char v51 = 4;
      sub_100032610();
      uint64_t v27 = v38;
      uint64_t v22 = v41;
      sub_10005EBB0();
      uint64_t v29 = v39;
      uint64_t v28 = v40;
LABEL_9:
      (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
LABEL_10:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v20, v22);
      break;
    default:
      uint64_t v23 = v30;
      char v47 = 0;
      sub_100032760();
      uint64_t v24 = v41;
      sub_10005EBB0();
      char v46 = 0;
      uint64_t v25 = v43;
      sub_10005EBF0();
      if (!v25)
      {
        char v45 = 1;
        sub_10005EBE0();
      }
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v14);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v20, v24);
      break;
  }
  return result;
}

uint64_t sub_1000260A4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100015F58(&qword_100093DC0);
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100015F58(&qword_100093DC8);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015F58(&qword_100093DD0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_1000327B4();
  sub_10005EE00();
  if (a2 == 2)
  {
    char v24 = 0;
    sub_1000328B0();
    sub_10005EBB0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
  }
  else
  {
    char v25 = 1;
    sub_100032808();
    sub_10005EBB0();
    __int16 v20 = a2 & 0x101;
    char v21 = BYTE2(a2) & 1;
    char v22 = BYTE3(a2) & 1;
    int v23 = HIDWORD(a2);
    sub_100032904();
    uint64_t v15 = v19;
    sub_10005EC10();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

Swift::Int sub_1000263C0(uint64_t a1)
{
  sub_10005ED40();
  if (a1 == 2)
  {
    sub_10005ED50(0);
  }
  else
  {
    sub_10005ED50(1uLL);
    sub_10005ED60(a1 & 1);
    sub_10005ED60(BYTE1(a1) & 1);
    sub_10005ED60(BYTE2(a1) & 1);
    sub_10005ED60(BYTE3(a1) & 1);
    if ((a1 & 0x7FFFFF00000000) == 0 && (a1 & 0x7F80000000000000) == 0) {
      Swift::UInt32 v3 = 0;
    }
    else {
      Swift::UInt32 v3 = HIDWORD(a1);
    }
    sub_10005ED70(v3);
  }
  return sub_10005EDA0();
}

void sub_100026478(float a1, uint64_t a2, int a3)
{
  sub_10005ED60(a3 & 1);
  sub_10005ED60(BYTE1(a3) & 1);
  sub_10005ED60(BYTE2(a3) & 1);
  sub_10005ED60(HIBYTE(a3) & 1);
  if ((LODWORD(a1) & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v5 = LODWORD(a1);
  }
  else {
    Swift::UInt32 v5 = 0;
  }
  sub_10005ED70(v5);
}

uint64_t sub_1000264D8(void *a1)
{
  uint64_t v3 = sub_100015F58(&qword_100093DF0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100019664(a1, a1[3]);
  sub_100032958();
  sub_10005EE00();
  v8[15] = 0;
  sub_10005EBE0();
  if (!v1)
  {
    v8[14] = 1;
    sub_10005EBE0();
    v8[13] = 2;
    sub_10005EBE0();
    v8[12] = 3;
    sub_10005EBE0();
    v8[11] = 4;
    sub_10005EC00();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_1000266C8(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100016C08((uint64_t)v2, (uint64_t)&v12);
  char v5 = v15;
  uint64_t v4 = v16;
  if (v15 >> 62)
  {
    if (v15 >> 62 == 1)
    {
      v15 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_1000329AC((long long *)&v12, (uint64_t)&v17);
      sub_10005ED50(4uLL);
      sub_1000329AC(&v17, (uint64_t)&v18);
      switch(v19)
      {
        case 1:
          Swift::UInt v6 = 1;
          goto LABEL_22;
        case 2:
          Swift::UInt v6 = 2;
          goto LABEL_22;
        case 3:
          Swift::UInt v6 = 3;
          goto LABEL_22;
        case 4:
          sub_1000329FC(&v18, &v20);
          sub_10005ED50(5uLL);
          sub_1000329FC(&v20, &v21);
          if (!v21.n128_u64[1]) {
            goto LABEL_20;
          }
          if (v21.n128_u64[1] == 1) {
            goto LABEL_13;
          }
          sub_10005ED50(2uLL);
          goto LABEL_23;
        case 5:
          unint64_t v9 = v18.n128_u64[1];
          sub_10005ED50(6uLL);
          if (v9)
          {
            sub_10005ED60(1u);
            swift_bridgeObjectRetain();
            sub_10005E770();
            sub_1000329C4(v2);
          }
          else
          {
            sub_10005ED60(0);
          }
          return;
        case 6:
          sub_10005ED50(4uLL);
          return;
        default:
          Swift::UInt v6 = 0;
LABEL_22:
          sub_10005ED50(v6);
LABEL_23:
          sub_10005E770();
          break;
      }
    }
    else if (v15 == 0x8000000000000000 {
           && (v16 | v12.n128_u64[0] | v14 | v13.n128_u64[1] | v13.n128_u64[0] | v12.n128_u64[1]) == 0)
    }
    {
LABEL_20:
      sub_10005ED50(0);
    }
    else if (v15 == 0x8000000000000000 {
           && v12.n128_u64[0] == 1
    }
           && !(v13.n128_u64[1] | v14 | v13.n128_u64[0] | v12.n128_u64[1] | v16))
    {
LABEL_13:
      sub_10005ED50(1uLL);
    }
    else
    {
      sub_10005ED50(2uLL);
    }
  }
  else
  {
    v15 &= 0x3FFFFFFFFFFFFFFFuLL;
    __n128 v10 = v12;
    __n128 v11 = v13;
    uint64_t v7 = v14;
    sub_10005ED50(3uLL);
    sub_10002C808(v10);
    sub_10002C808(v11);
    swift_bridgeObjectRetain();
    sub_10002C5FC(a1, v7);
    swift_bridgeObjectRelease();
    sub_10005ED60(v5 & 1);
    swift_bridgeObjectRetain();
    sub_10002C434(a1, v4);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100026954(void *a1)
{
  uint64_t v32 = sub_100015F58(&qword_100093E60);
  uint64_t v31 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100015F58(&qword_100093E68);
  uint64_t v29 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  char v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100015F58(&qword_100093E70);
  uint64_t v26 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  char v25 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100015F58(&qword_100093E78);
  uint64_t v23 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093E80);
  uint64_t v28 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  __n128 v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100015F58(&qword_100093E88);
  uint64_t v34 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  __n128 v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100032A58();
  sub_10005EE00();
  sub_100016C08(v33, (uint64_t)&v38);
  if (!(*((void *)&v40 + 1) >> 62))
  {
    *((void *)&v40 + 1) &= 0x3FFFFFFFFFFFFFFFuLL;
    long long v42 = v38;
    long long v43 = v39;
    uint64_t v45 = v41;
    long long v44 = v40;
    LOBYTE(v36[0]) = 3;
    sub_100032B00();
    uint64_t v14 = v35;
    sub_10005EBB0();
    v36[0] = v42;
    v36[1] = v43;
    v36[2] = v44;
    uint64_t v37 = v45;
    sub_100032CF8();
    uint64_t v16 = v30;
    sub_10005EC10();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v14);
  }
  if (*((void *)&v40 + 1) >> 62 == 1)
  {
    *((void *)&v40 + 1) &= 0x3FFFFFFFFFFFFFFFuLL;
    sub_1000329AC(&v38, (uint64_t)&v46);
    LOBYTE(v36[0]) = 4;
    sub_100032AAC();
    uint64_t v14 = v35;
    sub_10005EBB0();
    sub_1000329AC(&v46, (uint64_t)v36);
    sub_100032CA4();
    uint64_t v15 = v32;
    sub_10005EC10();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v3, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v14);
  }
  uint64_t v18 = v39 | *((void *)&v38 + 1);
  if (*((void *)&v40 + 1) != 0x8000000000000000
    || v41 | (unint64_t)v38 | (unint64_t)v40 | *((void *)&v39 + 1) | v18)
  {
    if (*((void *)&v40 + 1) == 0x8000000000000000
      && (void)v38 == 1
      && !(*((void *)&v39 + 1) | (unint64_t)v40 | v18 | v41))
    {
      LOBYTE(v36[0]) = 1;
      sub_100032BFC();
      uint64_t v20 = v35;
      sub_10005EBB0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
    }
    else
    {
      LOBYTE(v36[0]) = 2;
      sub_100032BA8();
      __n128 v21 = v25;
      uint64_t v20 = v35;
      sub_10005EBB0();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v27);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v20);
  }
  else
  {
    LOBYTE(v36[0]) = 0;
    sub_100032C50();
    uint64_t v19 = v35;
    sub_10005EBB0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v19);
  }
}

void sub_100027060(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      Swift::UInt v6 = 1;
      goto LABEL_9;
    case 2:
      goto LABEL_8;
    case 3:
      Swift::UInt v6 = 3;
      goto LABEL_9;
    case 4:
      sub_10005ED50(5uLL);
      if (!a3)
      {
        Swift::UInt v7 = 0;
        goto LABEL_18;
      }
      if (a3 == 1)
      {
        Swift::UInt v7 = 1;
LABEL_18:
        sub_10005ED50(v7);
        return;
      }
LABEL_8:
      Swift::UInt v6 = 2;
LABEL_9:
      sub_10005ED50(v6);
      sub_10005E770();
      return;
    case 5:
      sub_10005ED50(6uLL);
      if (a3)
      {
        sub_10005ED60(1u);
        swift_bridgeObjectRetain();
        sub_10005E770();
        sub_1000180C8(a2, a3, 5);
      }
      else
      {
        sub_10005ED60(0);
      }
      return;
    case 6:
      Swift::UInt v7 = 4;
      goto LABEL_18;
    default:
      Swift::UInt v6 = 0;
      goto LABEL_9;
  }
}

uint64_t sub_1000271AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a4;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v5 = sub_100015F58(&qword_100093F28);
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  __chkstk_darwin(v5);
  char v47 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100015F58(&qword_100093F30);
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  __chkstk_darwin(v7);
  long long v44 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093F38);
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  __chkstk_darwin(v9);
  long long v40 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100015F58(&qword_100093F40);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  long long v38 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100015F58(&qword_100093F48);
  uint64_t v36 = *(void *)(v12 - 8);
  uint64_t v37 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100015F58(&qword_100093F50);
  uint64_t v35 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  long long v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100015F58(&qword_100093F58);
  uint64_t v34 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100015F58(&qword_100093F60);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v52 = v21;
  uint64_t v53 = v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100032D4C();
  sub_10005EE00();
  switch((char)v56)
  {
    case 1:
      LOBYTE(v54) = 1;
      sub_100032F98();
      uint64_t v25 = v52;
      sub_10005EBB0();
      sub_10005EBD0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v15);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v25);
    case 2:
      LOBYTE(v54) = 2;
      sub_100032F44();
      uint64_t v26 = v52;
      sub_10005EBB0();
      uint64_t v27 = v37;
      sub_10005EBD0();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v26);
    case 3:
      LOBYTE(v54) = 3;
      sub_100032EF0();
      uint64_t v29 = v38;
      uint64_t v25 = v52;
      sub_10005EBB0();
      uint64_t v30 = v41;
      sub_10005EBD0();
      uint64_t v31 = v39;
      goto LABEL_8;
    case 4:
      LOBYTE(v54) = 5;
      sub_100032DF4();
      uint64_t v29 = v44;
      uint64_t v25 = v52;
      sub_10005EBB0();
      uint64_t v54 = v50;
      uint64_t v55 = v51;
      sub_100033040();
      uint64_t v30 = v46;
      sub_10005EC10();
      uint64_t v31 = v45;
      goto LABEL_8;
    case 5:
      LOBYTE(v54) = 6;
      sub_100032DA0();
      uint64_t v29 = v47;
      uint64_t v25 = v52;
      sub_10005EBB0();
      uint64_t v30 = v49;
      sub_10005EBC0();
      uint64_t v31 = v48;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v25);
    case 6:
      LOBYTE(v54) = 4;
      sub_100032E9C();
      uint64_t v32 = v40;
      uint64_t v33 = v52;
      sub_10005EBB0();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v33);
    default:
      LOBYTE(v54) = 0;
      sub_100032FEC();
      uint64_t v25 = v52;
      sub_10005EBB0();
      sub_10005EBD0();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v18);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v25);
  }
}

Swift::Int sub_10002797C(uint64_t a1, unint64_t a2, char a3)
{
  sub_10005ED40();
  switch(a3)
  {
    case 1:
      Swift::UInt v6 = 1;
      goto LABEL_9;
    case 2:
      goto LABEL_8;
    case 3:
      Swift::UInt v6 = 3;
      goto LABEL_9;
    case 4:
      sub_10005ED50(5uLL);
      if (!a2)
      {
        Swift::UInt v7 = 0;
        goto LABEL_14;
      }
      if (a2 == 1)
      {
        Swift::UInt v7 = 1;
LABEL_14:
        sub_10005ED50(v7);
        return sub_10005EDA0();
      }
LABEL_8:
      Swift::UInt v6 = 2;
LABEL_9:
      sub_10005ED50(v6);
      sub_10005E770();
      return sub_10005EDA0();
    case 5:
      sub_10005ED50(6uLL);
      if (a2)
      {
        sub_10005ED60(1u);
        swift_bridgeObjectRetain();
        sub_10005E770();
        sub_1000180C8(a1, a2, 5);
      }
      else
      {
        sub_10005ED60(0);
      }
      return sub_10005EDA0();
    case 6:
      Swift::UInt v7 = 4;
      goto LABEL_14;
    default:
      Swift::UInt v6 = 0;
      goto LABEL_9;
  }
}

uint64_t sub_100027AE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000255C0(a1, a2);
}

uint64_t sub_100027AF8(void *a1)
{
  return sub_100025308(a1);
}

Swift::Int sub_100027B10()
{
  Swift::UInt64 v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_10005ED40();
  sub_100025A44((uint64_t)v4, v1, v2);
  return sub_10005EDA0();
}

void sub_100027B60(uint64_t a1)
{
  sub_100025A44(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

Swift::Int sub_100027B6C()
{
  Swift::UInt64 v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_10005ED40();
  sub_100025A44((uint64_t)v4, v1, v2);
  return sub_10005EDA0();
}

uint64_t sub_100027BB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10002EDA0(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_100027BE8(void *a1)
{
  return sub_100025AF4(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

uint64_t sub_100027C08(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 2:
      BOOL v3 = v2 == 2;
      goto LABEL_9;
    case 3:
      BOOL v3 = v2 == 3;
      goto LABEL_9;
    case 4:
      BOOL v3 = v2 == 4;
      goto LABEL_9;
    case 5:
      BOOL v3 = v2 == 5;
LABEL_9:
      char v5 = v3;
      uint64_t result = v5 & 1;
      break;
    default:
      if ((v2 - 2) >= 4 && *(double *)a1 == *(double *)a2) {
        uint64_t result = (((*(unsigned char *)(a1 + 8) & 1) == 0) ^ v2) & 1;
      }
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

Swift::Int sub_100027CAC()
{
  return sub_1000263C0(*v0);
}

void sub_100027CB4()
{
  uint64_t v1 = *v0;
  if (*v0 == 2)
  {
    sub_10005ED50(0);
  }
  else
  {
    sub_10005ED50(1uLL);
    sub_10005ED60(v1 & 1);
    sub_10005ED60(BYTE1(v1) & 1);
    sub_10005ED60(BYTE2(v1) & 1);
    sub_10005ED60(BYTE3(v1) & 1);
    if ((v1 & 0x7FFFFF00000000) == 0 && (v1 & 0x7F80000000000000) == 0) {
      Swift::UInt32 v3 = 0;
    }
    else {
      Swift::UInt32 v3 = HIDWORD(v1);
    }
    sub_10005ED70(v3);
  }
}

Swift::Int sub_100027D3C()
{
  uint64_t v1 = *v0;
  sub_10005ED40();
  if (v1 == 2)
  {
    sub_10005ED50(0);
  }
  else
  {
    sub_10005ED50(1uLL);
    sub_10005ED60(v1 & 1);
    sub_10005ED60(BYTE1(v1) & 1);
    sub_10005ED60(BYTE2(v1) & 1);
    sub_10005ED60(BYTE3(v1) & 1);
    if ((v1 & 0x7FFFFF00000000) == 0 && (v1 & 0x7F80000000000000) == 0) {
      Swift::UInt32 v3 = 0;
    }
    else {
      Swift::UInt32 v3 = HIDWORD(v1);
    }
    sub_10005ED70(v3);
  }
  return sub_10005EDA0();
}

unint64_t sub_100027DF0@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_10002F5D0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100027E1C(void *a1)
{
  return sub_1000260A4(a1, *v1);
}

uint64_t sub_100027E38(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a1;
  uint64_t result = *a2 == 2 && v3 == 2;
  if (v3 != 2 && *a2 != 2)
  {
    if (*((float *)&v2 + 1) == COERCE_FLOAT(HIDWORD(*a2))) {
      return (((v2 & 1) == 0) ^ *a2) & (((v2 & 0x100) == 0) ^ ((*(_DWORD *)a2 & 0x100u) >> 8)) & (((v2 & 0x10000) == 0) ^ WORD1(*a2)) & (((v2 & 0x1000000) == 0) ^ BYTE3(*a2));
    }
    else {
      return 0;
    }
  }
  return result;
}

Swift::Int sub_100027EC0()
{
  int v1 = *(unsigned __int8 *)v0;
  int v2 = *((unsigned __int8 *)v0 + 1);
  int v3 = *((unsigned __int8 *)v0 + 2);
  int v4 = *((unsigned __int8 *)v0 + 3);
  float v5 = v0[1];
  sub_10005ED40();
  if (v2) {
    int v6 = 256;
  }
  else {
    int v6 = 0;
  }
  int v7 = v6 | v1;
  if (v3) {
    int v8 = 0x10000;
  }
  else {
    int v8 = 0;
  }
  if (v4) {
    int v9 = 0x1000000;
  }
  else {
    int v9 = 0;
  }
  sub_100026478(v5, (uint64_t)v11, v7 | v8 | v9);
  return sub_10005EDA0();
}

void sub_100027F60(uint64_t a1)
{
  if (*((unsigned char *)v1 + 1)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  int v3 = v2 | *(unsigned __int8 *)v1;
  if (*((unsigned char *)v1 + 2)) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  if (*((unsigned char *)v1 + 3)) {
    int v5 = 0x1000000;
  }
  else {
    int v5 = 0;
  }
  sub_100026478(v1[1], a1, v3 | v4 | v5);
}

Swift::Int sub_100027FA8()
{
  int v1 = *(unsigned __int8 *)v0;
  int v2 = *((unsigned __int8 *)v0 + 1);
  int v3 = *((unsigned __int8 *)v0 + 2);
  int v4 = *((unsigned __int8 *)v0 + 3);
  float v5 = v0[1];
  sub_10005ED40();
  if (v2) {
    int v6 = 256;
  }
  else {
    int v6 = 0;
  }
  int v7 = v6 | v1;
  if (v3) {
    int v8 = 0x10000;
  }
  else {
    int v8 = 0;
  }
  if (v4) {
    int v9 = 0x1000000;
  }
  else {
    int v9 = 0;
  }
  sub_100026478(v5, (uint64_t)v11, v7 | v8 | v9);
  return sub_10005EDA0();
}

void sub_100028044(void *a1@<X0>, uint64_t a2@<X8>)
{
  float v5 = sub_10002FA70(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(unsigned char *)(a2 + 1) = BYTE1(v4) & 1;
    *(unsigned char *)(a2 + 2) = BYTE2(v4) & 1;
    *(unsigned char *)(a2 + 3) = HIBYTE(v4) & 1;
    *(float *)(a2 + 4) = v5;
  }
}

uint64_t sub_100028090(void *a1)
{
  return sub_1000264D8(a1);
}

BOOL sub_1000280EC(float *a1, float *a2)
{
  BOOL result = 0;
  if (*(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
    && ((*((unsigned __int8 *)a1 + 1) ^ *((unsigned __int8 *)a2 + 1)) & 1) == 0
    && ((*((unsigned __int8 *)a1 + 2) ^ *((unsigned __int8 *)a2 + 2)) & 1) == 0
    && ((*((unsigned __int8 *)a1 + 3) ^ *((unsigned __int8 *)a2 + 3)) & 1) == 0)
  {
    return a1[1] == a2[1];
  }
  return result;
}

Swift::Int sub_100028148()
{
  sub_100016C08(v0, (uint64_t)v3);
  sub_10005ED40();
  sub_1000266C8((uint64_t)v2);
  return sub_10005EDA0();
}

void sub_100028198(uint64_t a1)
{
  sub_100016C08(v1, (uint64_t)&v3);
  sub_1000266C8(a1);
}

Swift::Int sub_1000281D8()
{
  sub_100016C08(v0, (uint64_t)v3);
  sub_10005ED40();
  sub_1000266C8((uint64_t)v2);
  return sub_10005EDA0();
}

uint64_t sub_10002822C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10002FCC8(a1, v5);
  if (!v2) {
    return sub_100016C08((uint64_t)v5, a2);
  }
  return result;
}

uint64_t sub_100028274(void *a1)
{
  sub_100016C08(v1, (uint64_t)&v4);
  return sub_100026954(a1);
}

Swift::Int sub_1000282C4()
{
  return sub_10002797C(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_1000282D0(uint64_t a1)
{
  sub_100027060(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

Swift::Int sub_1000282DC()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v1 = *(void *)(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 16);
  sub_10005ED40();
  switch(v3)
  {
    case 1:
      Swift::UInt v4 = 1;
      goto LABEL_9;
    case 2:
      goto LABEL_8;
    case 3:
      Swift::UInt v4 = 3;
      goto LABEL_9;
    case 4:
      sub_10005ED50(5uLL);
      if (!v1)
      {
        Swift::UInt v5 = 0;
        goto LABEL_14;
      }
      if (v1 == 1)
      {
        Swift::UInt v5 = 1;
LABEL_14:
        sub_10005ED50(v5);
        return sub_10005EDA0();
      }
LABEL_8:
      Swift::UInt v4 = 2;
LABEL_9:
      sub_10005ED50(v4);
      sub_10005E770();
      return sub_10005EDA0();
    case 5:
      sub_10005ED50(6uLL);
      if (v1)
      {
        sub_10005ED60(1u);
        swift_bridgeObjectRetain();
        sub_10005E770();
        sub_1000180C8(v2, v1, 5);
      }
      else
      {
        sub_10005ED60(0);
      }
      return sub_10005EDA0();
    case 6:
      Swift::UInt v5 = 4;
      goto LABEL_14;
    default:
      Swift::UInt v4 = 0;
      goto LABEL_9;
  }
}

uint64_t sub_100028434@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100030630(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_100028464(void *a1)
{
  return sub_1000271AC(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

void sub_100028484()
{
  if ((*(_DWORD *)v0 & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = *(_DWORD *)v0;
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  sub_10005ED70(v1);
  sub_10005E930();
  Swift::UInt64 v2 = *(void *)(v0 + 40);
  if ((*(void *)(v0 + 32) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = *(void *)(v0 + 32);
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  sub_10005ED80(v3);
  if ((v2 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = v2;
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_10005ED80(v4);
  Swift::UInt64 v5 = *(void *)(v0 + 56);
  if ((*(void *)(v0 + 48) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v6 = *(void *)(v0 + 48);
  }
  else {
    Swift::UInt64 v6 = 0;
  }
  sub_10005ED80(v6);
  if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v7 = v5;
  }
  else {
    Swift::UInt64 v7 = 0;
  }
  sub_10005ED80(v7);
  if ((*(void *)(v0 + 64) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v8 = *(void *)(v0 + 64);
  }
  else {
    Swift::UInt64 v8 = 0;
  }
  sub_10005ED80(v8);
}

uint64_t sub_100028514(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100015F58(&qword_100093F98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::UInt64 v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100033094();
  sub_10005EE00();
  LOBYTE(v12) = 0;
  sub_10005EC00();
  if (!v2)
  {
    long long v12 = *(_OWORD *)(v3 + 16);
    char v11 = 1;
    type metadata accessor for simd_quatf(0);
    sub_1000334E0(&qword_100093FA0, 255, type metadata accessor for simd_quatf);
    sub_10005EC10();
    long long v12 = *(_OWORD *)(v3 + 32);
    char v11 = 2;
    type metadata accessor for CGSize(0);
    sub_1000334E0(&qword_100093FA8, 255, type metadata accessor for CGSize);
    sub_10005EC10();
    long long v12 = *(_OWORD *)(v3 + 48);
    char v11 = 3;
    sub_10005EC10();
    *(void *)&long long v12 = *(void *)(v3 + 64);
    char v11 = 4;
    sub_10003313C();
    sub_10005EC10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_1000287C0()
{
  return sub_10005EDA0();
}

Swift::Int sub_100028804()
{
  return sub_10005EDA0();
}

__n128 sub_100028840@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000311D4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10002888C(void *a1)
{
  return sub_100028514(a1);
}

BOOL sub_1000288A4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  uint64_t v10 = *(void *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_10002D868((uint64_t)v7, (uint64_t)v9);
}

uint64_t sub_100028900(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_23:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    unint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_10002B70C(v16, v17);
    char v21 = v20;
    __n128 result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      return 0;
    }
    uint64_t v22 = *(void *)(*(void *)(a2 + 56) + 8 * v19);
    if (v22 == 2)
    {
      if (v18 != 2) {
        return 0;
      }
    }
    else
    {
      if (v18 == 2) {
        return 0;
      }
      BOOL v23 = (v18 & 1) == ((v22 & 1) == 0) || ((v18 >> 8) & 1) == ((v22 & 0x100) == 0);
      BOOL v24 = v23 || ((v18 >> 16) & 1) == ((v22 & 0x10000) == 0);
      BOOL v25 = v24 || ((v18 >> 24) & 1) == ((v22 & 0x1000000) == 0);
      if (v25 || *((float *)&v22 + 1) != *((float *)&v18 + 1)) {
        return 0;
      }
    }
  }
  int64_t v12 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v12 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v12);
  ++v4;
  if (v13) {
    goto LABEL_22;
  }
  int64_t v4 = v12 + 1;
  if (v12 + 1 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13) {
    goto LABEL_22;
  }
  int64_t v4 = v12 + 2;
  if (v12 + 2 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_22:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_23;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_100028B18(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_23;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_23:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    unint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_10002B70C(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    BOOL v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      __n128 result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_10005EC40();
      __n128 result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_100028D20(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_25:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10002DA54();
    if ((v19 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v20 = (void *)(*(void *)(a2 + 56) + 16 * v18);
    if (*v20 == v17 && v20[1] == v16)
    {
      __n128 result = swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_10005EC40();
      __n128 result = swift_bridgeObjectRelease();
      if ((v22 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100028EE8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100015F58(&qword_100093FF8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100033190();
  sub_10005EE00();
  long long v9 = v3[1];
  long long v13 = *v3;
  long long v14 = v9;
  char v12 = 0;
  sub_10003328C();
  sub_10005EC10();
  if (!v2)
  {
    *(void *)&long long v13 = *((void *)v3 + 4);
    char v12 = 1;
    sub_100015F58(&qword_100093FD0);
    sub_1000332E0(&qword_100094008, (void (*)(void))sub_10003335C);
    sub_10005EC10();
    LOBYTE(v13) = 2;
    sub_10005EBE0();
    *(void *)&long long v13 = *((void *)v3 + 6);
    char v12 = 3;
    sub_100015F58(&qword_100093FE8);
    sub_1000333B0(&qword_100094018);
    sub_10005EC10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_100029154()
{
  __n128 v5 = *v0;
  __n128 v6 = v0[1];
  uint64_t v1 = v0[2].n128_i64[0];
  Swift::UInt8 v2 = v0[2].n128_u8[8];
  uint64_t v3 = v0[3].n128_i64[0];
  sub_10005ED40();
  sub_10002C808(v5);
  sub_10002C808(v6);
  swift_bridgeObjectRetain();
  sub_10002C5FC((uint64_t)v7, v1);
  swift_bridgeObjectRelease();
  sub_10005ED60(v2);
  swift_bridgeObjectRetain();
  sub_10002C434((uint64_t)v7, v3);
  swift_bridgeObjectRelease();
  return sub_10005EDA0();
}

uint64_t sub_100029208(uint64_t a1)
{
  __n128 v7 = v1[1];
  uint64_t v3 = v1[2].n128_i64[0];
  Swift::UInt8 v4 = v1[2].n128_u8[8];
  uint64_t v5 = v1[3].n128_i64[0];
  sub_10002C808(*v1);
  sub_10002C808(v7);
  swift_bridgeObjectRetain();
  sub_10002C5FC(a1, v3);
  swift_bridgeObjectRelease();
  sub_10005ED60(v4);
  swift_bridgeObjectRetain();
  sub_10002C434(a1, v5);

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000292B4()
{
  __n128 v5 = *v0;
  __n128 v6 = v0[1];
  uint64_t v1 = v0[2].n128_i64[0];
  Swift::UInt8 v2 = v0[2].n128_u8[8];
  uint64_t v3 = v0[3].n128_i64[0];
  sub_10005ED40();
  sub_10002C808(v5);
  sub_10002C808(v6);
  swift_bridgeObjectRetain();
  sub_10002C5FC((uint64_t)v7, v1);
  swift_bridgeObjectRelease();
  sub_10005ED60(v2);
  swift_bridgeObjectRetain();
  sub_10002C434((uint64_t)v7, v3);
  swift_bridgeObjectRelease();
  return sub_10005EDA0();
}

double sub_100029364@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000314F8(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1000293B0(void *a1)
{
  return sub_100028EE8(a1);
}

uint64_t sub_1000293C8(__n128 *a1, __n128 *a2)
{
  uint64_t v2 = a1[2].n128_i64[0];
  int v3 = a1[2].n128_u8[8];
  uint64_t v4 = a1[3].n128_i64[0];
  uint64_t v5 = a2[2].n128_i64[0];
  int v6 = a2[2].n128_u8[8];
  uint64_t v7 = a2[3].n128_i64[0];
  if (!sub_10002D004(*a1, a1[1], *a2, a2[1]) || (sub_100028900(v2, v5) & 1) == 0 || ((v3 ^ v6) & 1) != 0) {
    return 0;
  }

  return sub_100028B18(v4, v7);
}

unint64_t sub_100029464()
{
  sub_10005E9D0(35);
  swift_bridgeObjectRelease();
  sub_10005DE10();
  sub_1000334E0(&qword_100094020, 255, (void (*)(uint64_t))&type metadata accessor for URL);
  v1._countAndFlagsBits = sub_10005EC20();
  sub_10005E790(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x69666E6F63202C3ELL;
  v2._object = (void *)0xEB00000000203A67;
  sub_10005E790(v2);
  type metadata accessor for CRLUSDRendering.SceneRequest(0);
  v3._countAndFlagsBits = sub_1000295B4();
  sub_10005E790(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  sub_10005E790(v4);
  return 0xD000000000000013;
}

uint64_t sub_1000295B4()
{
  sub_10005E9D0(66);
  v1._object = (void *)0x800000010006EB90;
  v1._countAndFlagsBits = 0xD000000000000011;
  sub_10005E790(v1);
  sub_10005E920();
  v2._countAndFlagsBits = 0x746E6569726F202CLL;
  v2._object = (void *)0xEF203A6E6F697461;
  sub_10005E790(v2);
  sub_100015F58(&qword_100093A48);
  sub_1000336E0(&qword_100094028, &qword_100093A48);
  v3._countAndFlagsBits = sub_10005EC80();
  sub_10005E790(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x203A657A6973202CLL;
  v4._object = (void *)0xE800000000000000;
  sub_10005E790(v4);
  type metadata accessor for CGSize(0);
  sub_10005EAA0();
  v5._object = (void *)0x800000010006EBB0;
  v5._countAndFlagsBits = 0xD000000000000011;
  sub_10005E790(v5);
  v6._countAndFlagsBits = sub_10005E910();
  sub_10005E790(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_10005E790(v7);
  return 0;
}

void sub_100029770()
{
  sub_10002C9FC(*(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_100029780(char *a1, char *a2)
{
  return sub_10002978C(*a1, *a2);
}

uint64_t sub_10002978C(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 7889261;
  }
  else {
    uint64_t v2 = 7235949;
  }
  if (a2) {
    uint64_t v3 = 7889261;
  }
  else {
    uint64_t v3 = 7235949;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_10005EC40();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

Swift::Int sub_1000297FC()
{
  return sub_10005EDA0();
}

uint64_t sub_100029864()
{
  sub_10005E770();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000298B0()
{
  return sub_10005EDA0();
}

uint64_t sub_100029914@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100082330;
  v8._object = v3;
  Swift::Int v5 = sub_10005EB10(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100029974(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7235949;
  if (*v1) {
    uint64_t v2 = 7889261;
  }
  *a1 = v2;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_10002999C()
{
  if (*v0) {
    return 7889261;
  }
  else {
    return 7235949;
  }
}

uint64_t sub_1000299C0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_100082330;
  v9._object = a2;
  Swift::Int v6 = sub_10005EB10(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t sub_100029A24(uint64_t a1)
{
  unint64_t v2 = sub_100029CA4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100029A60(uint64_t a1)
{
  unint64_t v2 = sub_100029CA4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t BoundingBox.init(from:)(void *a1)
{
  uint64_t v3 = sub_100015F58(&qword_100093A18);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100029CA4();
  sub_10005EDE0();
  if (!v1)
  {
    sub_100015F58(&qword_100093A28);
    LOBYTE(v13) = 0;
    sub_1000336E0(&qword_100093A30, &qword_100093A28);
    sub_10005EB90();
    long long v11 = v14;
    char v12 = 1;
    sub_10005EB90();
    sub_10005DEF0();
    long long v10 = v8;
    long long v11 = v7;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return sub_1000196FC((uint64_t)a1);
}

unint64_t sub_100029CA4()
{
  unint64_t result = qword_100093A20;
  if (!qword_100093A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093A20);
  }
  return result;
}

uint64_t BoundingBox.encode(to:)(void *a1, __n128 a2, __n128 a3)
{
  __n128 v10 = a3;
  __n128 v11 = a2;
  uint64_t v5 = sub_100015F58(&qword_100093A38);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100029CA4();
  sub_10005EE00();
  __n128 v12 = v11;
  char v13 = 0;
  sub_100015F58(&qword_100093A28);
  sub_1000336E0(&qword_100093A40, &qword_100093A28);
  sub_10005EC10();
  if (!v3)
  {
    __n128 v12 = v10;
    char v13 = 1;
    sub_10005EC10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100029EB4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = BoundingBox.init(from:)(a1);
  if (!v2)
  {
    *a2 = v5;
    a2[1] = v6;
  }
  return result;
}

uint64_t sub_100029EE0(void *a1)
{
  return BoundingBox.encode(to:)(a1, *v1, v1[1]);
}

uint64_t simd_quatf.init(from:)(void *a1)
{
  return sub_100031848(a1);
}

uint64_t simd_quatf.encode(to:)(void *a1)
{
  sub_100019664(a1, a1[3]);
  sub_10005EDF0();
  sub_100031960((uint64_t)v2, v3);
  sub_100015F58(&qword_100093A48);
  sub_1000336E0(&qword_100093A50, &qword_100093A48);
  sub_10005EC60();
  return sub_1000196FC((uint64_t)v2);
}

uint64_t sub_100029FF0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = sub_100031848(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_10002A01C(void *a1)
{
  sub_100019664(a1, a1[3]);
  sub_10005EDF0();
  sub_100031960((uint64_t)v2, v3);
  sub_100015F58(&qword_100093A48);
  sub_1000336E0(&qword_100093A50, &qword_100093A48);
  sub_10005EC60();
  return sub_1000196FC((uint64_t)v2);
}

double sub_10002A0FC()
{
  type metadata accessor for CRLUSDRendering.TaskQueue();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 128) = _swiftEmptyArrayStorage;
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 112) = xmmword_1000714B0;
  qword_100093A10 = v0;
  return result;
}

uint64_t sub_10002A150()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_10002A170, 0, 0);
}

uint64_t sub_10002A170()
{
  if (qword_100093110 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100093A10;
  *(void *)(v0 + 32) = qword_100093A10;
  swift_retain();
  return _swift_task_switch(sub_10002A218, v1, 0);
}

uint64_t sub_10002A218()
{
  sub_10005E900();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = sub_1000334E0(&qword_100094098, v2, (void (*)(uint64_t))type metadata accessor for CRLUSDRendering.TaskQueue);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  void *v4 = v0;
  v4[1] = sub_10002A37C;
  uint64_t v5 = *(void *)(v0 + 32);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v4, v1, v3, 0xD000000000000013, 0x800000010006EC10, sub_100033528, v5, (char *)&type metadata for () + 8);
}

uint64_t sub_10002A37C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v4 = sub_10002A5B4;
  }
  else {
    uint64_t v4 = sub_10002A4A8;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_10002A4A8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = sub_10005E900();
  if (v1)
  {
    uint64_t v5 = v0[4];
    uint64_t v6 = *(void *)(v5 + 120);
    BOOL v7 = __OFSUB__(v6, 1);
    uint64_t v8 = v6 - 1;
    if (v7)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v5 + 120) = v8;
      sub_10002B4B0();
      v0[9] = v1;
      uint64_t v2 = (uint64_t)sub_10002A810;
      uint64_t v3 = 0;
      uint64_t v4 = 0;
    }
    return _swift_task_switch(v2, v3, v4);
  }
  else
  {
    Swift::String v9 = (void *)swift_task_alloc();
    v0[7] = v9;
    void *v9 = v0;
    v9[1] = sub_10002A5D8;
    uint64_t v10 = v0[3];
    return sub_10002A874((uint64_t)(v0 + 2), v10);
  }
}

uint64_t sub_10002A5B4()
{
  *(void *)(v0 + 72) = *(void *)(v0 + 48);
  return _swift_task_switch(sub_10002A810, 0, 0);
}

uint64_t sub_10002A5D8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v4 = sub_10002A78C;
  }
  else {
    uint64_t v4 = sub_10002A704;
  }
  return _swift_task_switch(v4, v3, 0);
}

void sub_10002A704()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 120);
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + 120) = v4;
    sub_10002B4B0();
    swift_release();
    uint64_t v5 = v0[2];
    uint64_t v6 = (void (*)(uint64_t))v0[1];
    v6(v5);
  }
}

uint64_t sub_10002A78C(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[4];
  uint64_t v5 = *(void *)(v4 + 120);
  BOOL v6 = __OFSUB__(v5, 1);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v4 + 120) = v7;
    sub_10002B4B0();
    v3[9] = v3[8];
    a1 = sub_10002A810;
    a2 = 0;
    a3 = 0;
  }
  return _swift_task_switch(a1, a2, a3);
}

uint64_t sub_10002A810()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002A874(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_10005E860();
  v2[5] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[6] = v4;
  v2[7] = v3;
  return _swift_task_switch(sub_10002A910, v4, v3);
}

uint64_t sub_10002A910()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_10005E470();
  uint64_t v3 = sub_10005E450();
  v0[8] = v3;
  *(void *)(v1 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_entityLoadRequest) = v3;
  swift_retain();
  swift_release();
  uint64_t v4 = swift_allocObject();
  v0[9] = v4;
  *(unsigned char *)(v4 + 16) = 0;
  uint64_t v5 = sub_10005E850();
  v0[10] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  _OWORD v6[2] = v1;
  v6[3] = v3;
  _OWORD v6[4] = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  void *v7 = v0;
  v7[1] = sub_10002AA98;
  uint64_t v8 = v0[2];
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v8, v5, &protocol witness table for MainActor, 0x746E45636E797361, 0xED00002928797469, sub_100033540, v6, v2);
}

uint64_t sub_10002AA98()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_10002AC34;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_10002ABBC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10002ABBC()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002AC34()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002ACC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a4;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v7 = sub_100015F58(&qword_1000940A8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a3;
  __n128 v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(v10, a1, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a4;
  long long v14 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v14(v13 + v12, v10, v7);
  v11(v10, v19, v7);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v18;
  v14(v15 + v12, v10, v7);
  swift_retain_n();
  sub_100015F58(&qword_1000940B0);
  sub_1000336E0(&qword_1000940B8, &qword_1000940B0);
  uint64_t v16 = sub_10005E670();
  swift_release();
  swift_release();
  *(void *)(v20 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_cancellable) = v16;
  return swift_release();
}

uint64_t sub_10002AF0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (unsigned char *)(a2 + 16);
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    unsigned char *v4 = 1;
    if (v3)
    {
      swift_errorRetain();
    }
    else
    {
      sub_1000161C4();
      swift_allocError();
      *(void *)uint64_t v6 = 0xD00000000000001CLL;
      *(void *)(v6 + 8) = 0x800000010006EC30;
      *(unsigned char *)(v6 + 16) = 2;
    }
    sub_100015F58(&qword_1000940A8);
    return sub_10005E810();
  }
  return result;
}

uint64_t sub_10002B00C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (unsigned char *)(a2 + 16);
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    unsigned char *v3 = 1;
    swift_retain();
    sub_100015F58(&qword_1000940A8);
    return sub_10005E820();
  }
  return result;
}

uint64_t sub_10002B0A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_url;
  uint64_t v2 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10002B164()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100015F58(&qword_100093580);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1 + 128);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    v15[1] = *(void *)(v1 + 128);
    v15[2] = v1;
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = v6 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v12 = *(void *)(v8 + 56);
    swift_bridgeObjectRetain();
    do
    {
      v9(v5, v11, v2);
      sub_10005E840();
      sub_1000334E0(&qword_100094090, 255, (void (*)(uint64_t))&type metadata accessor for CancellationError);
      uint64_t v13 = swift_allocError();
      sub_10005E690();
      v15[3] = v13;
      sub_10005E810();
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      v11 += v12;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_10002B330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015F58(&qword_100093580);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *(void **)(a2 + 128);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 128) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = (void *)sub_10002C258(0, v8[2] + 1, 1, v8);
    *(void *)(a2 + 128) = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = (void *)sub_10002C258(v10 > 1, v11 + 1, 1, v8);
    *(void *)(a2 + 128) = v8;
  }
  v8[2] = v11 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v11, v7, v4);
  return sub_10002B4B0();
}

uint64_t sub_10002B4B0()
{
  uint64_t v1 = sub_100015F58(&qword_100093580);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + 128);
  if (*(void *)(v6 + 16))
  {
    uint64_t v7 = *(void *)(v0 + 120);
    if (v7 <= 0)
    {
      *(void *)(v0 + 120) = v7 + 1;
      if (*(void *)(v6 + 16))
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, v6 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)), v1);
        sub_10002CE6C(0, 1);
        sub_10005E820();
        return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_10002B5E8()
{
  return v0;
}

unint64_t sub_10002B5F4()
{
  if (qword_100092ED0 != -1) {
    swift_once();
  }
  sub_100032CA4();
  uint64_t v0 = sub_10005DD20();
  uint64_t v2 = v1;
  sub_100015F58(&qword_100094038);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716E0;
  *(void *)(inited + 32) = 0xD000000000000026;
  *(void *)(inited + 40) = 0x800000010006EB40;
  *(void *)(inited + 72) = &type metadata for Data;
  *(void *)(inited + 48) = v0;
  *(void *)(inited + 56) = v2;
  return sub_10002367C(inited);
}

unint64_t sub_10002B700()
{
  return sub_10002B5F4();
}

unint64_t sub_10002B70C(uint64_t a1, uint64_t a2)
{
  sub_10005ED40();
  sub_10005E770();
  Swift::Int v4 = sub_10005EDA0();

  return sub_10002B8F8(a1, a2, v4);
}

unint64_t sub_10002B784(uint64_t a1)
{
  uint64_t v2 = sub_10005ED30();

  return sub_10002B9DC(a1, v2);
}

unint64_t sub_10002B7C8(uint64_t a1)
{
  sub_10005DED0();
  sub_1000334E0(&qword_100094070, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_10005E6C0();

  return sub_10002BA78(a1, v2);
}

unint64_t sub_10002B864(uint64_t a1)
{
  sub_10005E720();
  sub_10005ED40();
  sub_10005E770();
  Swift::Int v2 = sub_10005EDA0();
  swift_bridgeObjectRelease();

  return sub_10002BC3C(a1, v2);
}

unint64_t sub_10002B8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10005EC40() & 1) == 0)
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
      while (!v14 && (sub_10005EC40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002B9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10002BA78(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
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
      sub_1000334E0(&qword_100094078, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_10005E6E0();
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

unint64_t sub_10002BC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_10005E720();
    uint64_t v8 = v7;
    if (v6 == sub_10005E720() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_10005EC40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_10005E720();
          uint64_t v15 = v14;
          if (v13 == sub_10005E720() && v15 == v16) {
            break;
          }
          char v18 = sub_10005EC40();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_10002BDB4@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
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
      sub_10001616C(a2, a3);
      uint64_t v10 = (char *)sub_10005DD50();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_10005DD70();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_10005DD60();
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
        JUMPOUT(0x10002C018);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_100016114(a2, a3);
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
      uint64_t v17 = (char *)sub_10005DD50();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_10005DD70();
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
      uint64_t v21 = sub_10005DD60();
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

uint64_t sub_10002C028(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_10001616C(a1, a2);
      char v5 = sub_10002D654((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_100016114(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_10002D654(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_100016114(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_10002BDB4((uint64_t)__s1, a3, a4, &v14);
      sub_100016114(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

size_t sub_10002C258(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
    size_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100015F58(&qword_100094050);
  uint64_t v10 = *(void *)(sub_100015F58(&qword_100093580) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100015F58(&qword_100093580) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void sub_10002C434(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  Swift::UInt v6 = 0;
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v5) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v11 + 8 * v8);
    ++v7;
    if (!v9)
    {
      int64_t v7 = v8 + 1;
      if (v8 + 1 >= v5) {
        goto LABEL_19;
      }
      uint64_t v9 = *(void *)(v11 + 8 * v7);
      if (!v9) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v9 - 1) & v9;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10005E770();
    swift_bridgeObjectRelease();
    sub_10005E770();
    swift_bridgeObjectRelease();
    v6 ^= sub_10005EDA0();
  }
  int64_t v10 = v8 + 2;
  if (v10 >= v5)
  {
LABEL_19:
    swift_release();
    sub_10005ED50(v6);
    return;
  }
  uint64_t v9 = *(void *)(v11 + 8 * v10);
  if (v9)
  {
    int64_t v7 = v10;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(v11 + 8 * v7);
    ++v10;
    if (v9) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
}

void sub_10002C5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  Swift::UInt v8 = 0;
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_20;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v12 >= v7) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13) {
        break;
      }
    }
LABEL_19:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_20:
    uint64_t v15 = *(void *)(*(void *)(a2 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    sub_10005E770();
    swift_bridgeObjectRelease();
    if (v15 == 2)
    {
      sub_10005ED50(0);
    }
    else
    {
      sub_10005ED50(1uLL);
      sub_10005ED60(v15 & 1);
      sub_10005ED60(BYTE1(v15) & 1);
      sub_10005ED60(BYTE2(v15) & 1);
      sub_10005ED60(BYTE3(v15) & 1);
      if ((v15 & 0x7FFFFF00000000) == 0 && (v15 & 0x7F80000000000000) == 0) {
        Swift::UInt32 v17 = 0;
      }
      else {
        Swift::UInt32 v17 = HIDWORD(v15);
      }
      sub_10005ED70(v17);
    }
    v8 ^= sub_10005EDA0();
  }
  int64_t v14 = v12 + 2;
  if (v14 >= v7)
  {
LABEL_28:
    swift_release();
    sub_10005ED50(v8);
    return;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_19;
    }
  }
LABEL_30:
  __break(1u);
}

void sub_10002C808(__n128 a1)
{
  if ((a1.n128_u32[0] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = a1.n128_u32[0];
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  sub_10005ED70(v1);
  if ((a1.n128_u32[1] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v2 = a1.n128_u32[1];
  }
  else {
    Swift::UInt32 v2 = 0;
  }
  sub_10005ED70(v2);
  if ((a1.n128_u32[2] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v3 = a1.n128_u32[2];
  }
  else {
    Swift::UInt32 v3 = 0;
  }
  sub_10005ED70(v3);
}

uint64_t sub_10002C86C(void *a1)
{
  id v1 = [a1 userInfo];
  uint64_t v2 = sub_10005E6B0();

  if (!*(void *)(v2 + 16) || (unint64_t v3 = sub_10002B70C(0xD000000000000026, 0x800000010006EB40), (v4 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_100015FCC(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_9:
    sub_100032388((uint64_t)&v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (qword_100092ED8 != -1) {
    swift_once();
  }
  sub_1000323E8();
  sub_10005DD10();
  sub_100016114(v6, v7);
  return v8;
}

void sub_10002C9FC(uint64_t a1, char a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  do
  {
    while (1)
    {
      if (v9)
      {
        unint64_t v12 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v13 = v12 | (v5 << 6);
      }
      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return;
        }
        if (v14 >= v10) {
          goto LABEL_25;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v14);
        ++v5;
        if (!v15)
        {
          int64_t v5 = v14 + 1;
          if (v14 + 1 >= v10) {
            goto LABEL_25;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v5);
          if (!v15)
          {
            int64_t v5 = v14 + 2;
            if (v14 + 2 >= v10) {
              goto LABEL_25;
            }
            unint64_t v15 = *(void *)(v6 + 8 * v5);
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v10) {
                goto LABEL_25;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v5 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_34;
                  }
                  if (v5 >= v10) {
                    goto LABEL_25;
                  }
                  unint64_t v15 = *(void *)(v6 + 8 * v5);
                  ++v16;
                  if (v15) {
                    goto LABEL_20;
                  }
                }
              }
              int64_t v5 = v16;
            }
          }
        }
LABEL_20:
        unint64_t v9 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
      }
      if (*(unsigned char *)(*(void *)(a1 + 56) + 8 * v13) != 2) {
        break;
      }
      BOOL v11 = __OFADD__(v3++, 1);
      if (v11) {
        goto LABEL_35;
      }
    }
    BOOL v11 = __OFADD__(v4++, 1);
  }
  while (!v11);
  __break(1u);
LABEL_25:
  sub_10005DF10();
  long long v23 = v17;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000716E0;
  *(void *)(v18 + 56) = &type metadata for Float;
  *(void *)(v18 + 64) = &protocol witness table for Float;
  *(_DWORD *)(v18 + 32) = v23;
  v24._countAndFlagsBits = sub_10005E730();
  sub_10005E790(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 2127904;
  v25._object = (void *)0xE300000000000000;
  sub_10005E790(v25);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1000716E0;
  *(void *)(v19 + 56) = &type metadata for Float;
  *(void *)(v19 + 64) = &protocol witness table for Float;
  *(_DWORD *)(v19 + 32) = DWORD1(v23);
  v26._countAndFlagsBits = sub_10005E730();
  sub_10005E790(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 2127904;
  v27._object = (void *)0xE300000000000000;
  sub_10005E790(v27);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1000716E0;
  *(void *)(v20 + 56) = &type metadata for Float;
  *(void *)(v20 + 64) = &protocol witness table for Float;
  *(_DWORD *)(v20 + 32) = DWORD2(v23);
  v28._countAndFlagsBits = sub_10005E730();
  sub_10005E790(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = 41;
  v29._object = (void *)0xE100000000000000;
  sub_10005E790(v29);
  sub_10005E9D0(69);
  v30._object = (void *)0x800000010006EBD0;
  v30._countAndFlagsBits = 0xD000000000000012;
  sub_10005E790(v30);
  v31._countAndFlagsBits = 40;
  v31._object = (void *)0xE100000000000000;
  sub_10005E790(v31);
  swift_bridgeObjectRelease();
  v32._countAndFlagsBits = 8236;
  v32._object = (void *)0xE200000000000000;
  sub_10005E790(v32);
  if (__OFADD__(v4, v3)) {
    goto LABEL_36;
  }
  v33._countAndFlagsBits = sub_10005EC20();
  sub_10005E790(v33);
  swift_bridgeObjectRelease();
  v34._countAndFlagsBits = 0x2820736D696E6120;
  v34._object = (void *)0xE800000000000000;
  sub_10005E790(v34);
  v35._countAndFlagsBits = sub_10005EC20();
  sub_10005E790(v35);
  swift_bridgeObjectRelease();
  v36._countAndFlagsBits = 0x2C65766974636120;
  v36._object = (void *)0xE900000000000020;
  sub_10005E790(v36);
  v37._countAndFlagsBits = sub_10005EC20();
  sub_10005E790(v37);
  swift_bridgeObjectRelease();
  v38._countAndFlagsBits = 0xD000000000000015;
  v38._object = (void *)0x800000010006EBF0;
  sub_10005E790(v38);
  if (a2) {
    v21._countAndFlagsBits = 1702195828;
  }
  else {
    v21._countAndFlagsBits = 0x65736C6166;
  }
  if (a2) {
    size_t v22 = (void *)0xE400000000000000;
  }
  else {
    size_t v22 = (void *)0xE500000000000000;
  }
  v21._object = v22;
  sub_10005E790(v21);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = 41;
  v39._object = (void *)0xE100000000000000;
  sub_10005E790(v39);
}

uint64_t sub_10002CE6C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = (void *)sub_10002C258(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(sub_100015F58(&qword_100093580) - 8);
  unint64_t v13 = (char *)v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * v6;
  int64_t v16 = &v13[v14 * v6];
  unint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v17 = v4[2];
  if (__OFSUB__(v17, a2)) {
    goto LABEL_30;
  }
  if (v15 < v14 * a2 || v16 >= &v13[v14 * a2 + (v17 - a2) * v14])
  {
    unint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v15 != v14 * a2)
  {
    unint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v19 = v4[2];
  BOOL v20 = __OFADD__(v19, v8);
  uint64_t v21 = v19 - v7;
  if (!v20)
  {
    v4[2] = v21;
LABEL_24:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_31:
  __break(1u);
  return result;
}

BOOL sub_10002D004(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v4 = 0;
  BOOL v5 = 1;
  while (!v5)
  {
    BOOL v5 = 0;
    BOOL result = 0;
    if (v4 == 2) {
      return result;
    }
LABEL_3:
    ++v4;
  }
  __n128 v14 = a1;
  float v7 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3)));
  __n128 v15 = a3;
  float v8 = *(float *)((unint64_t)&v15 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3)));
  BOOL v5 = v7 == v8;
  if (v4 != 2) {
    goto LABEL_3;
  }
  if (v7 != v8) {
    return 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    __n128 v12 = a2;
    float v10 = *(float *)((unint64_t)&v12 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3)));
    __n128 v13 = a4;
    BOOL v11 = v10 == *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v9 & 3)));
    BOOL result = v11;
    if (v9 == 2) {
      break;
    }
    while (1)
    {
      ++v9;
      if (v11) {
        break;
      }
      BOOL v11 = 0;
      BOOL result = 0;
      if (v9 == 2) {
        return result;
      }
    }
  }
  return result;
}

uint64_t sub_10002D0D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 == 1) {
        goto LABEL_14;
      }
      return 0;
    case 2:
      if (a6 != 2) {
        return 0;
      }
      goto LABEL_14;
    case 3:
      if (a6 == 3) {
        goto LABEL_14;
      }
      return 0;
    case 4:
      if (a6 != 4) {
        return 0;
      }
      if (!a2) {
        return !a5;
      }
      if (a2 == 1) {
        return a5 == 1;
      }
      if (a5 < 2) {
        return 0;
      }
      return a1 == a4 && a2 == a5 || (sub_10005EC40() & 1) != 0;
    case 5:
      if (a6 != 5) {
        return 0;
      }
      if (a2)
      {
        if (!a5) {
          return 0;
        }
        return a1 == a4 && a2 == a5 || (sub_10005EC40() & 1) != 0;
      }
      return !a5;
    case 6:
      return a6 == 6 && !(a5 | a4);
    default:
      if (a6) {
        return 0;
      }
LABEL_14:
      if (a1 == a4 && a2 == a5) {
        return 1;
      }
      return sub_10005EC40();
  }
}

uint64_t sub_10002D230(uint64_t a1, uint64_t a2)
{
  sub_100016C08(a1, (uint64_t)&v33);
  int v4 = v36;
  uint64_t v3 = v37;
  if (!(v36 >> 62))
  {
    v36 &= 0x3FFFFFFFFFFFFFFFuLL;
    long long v24 = v33;
    long long v25 = v34;
    uint64_t v9 = v35;
    sub_100016C08(a2, (uint64_t)v30);
    int v10 = v31;
    unint64_t v11 = v31 >> 62;
    if (v31 >> 62) {
      goto LABEL_45;
    }
    BOOL v12 = 1;
    uint64_t v13 = v32;
    while (1)
    {
      while (!v12)
      {
        if (v11 == 2) {
          goto LABEL_45;
        }
        BOOL v12 = 0;
        ++v11;
      }
      long long v28 = v24;
      float v14 = *(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
      long long v29 = *(_OWORD *)v30;
      float v15 = *(float *)((unint64_t)&v29 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
      BOOL v12 = v14 == v15;
      if (v11 == 2) {
        break;
      }
      ++v11;
    }
    if (v14 != v15) {
      goto LABEL_45;
    }
    uint64_t v18 = 0;
    BOOL v19 = 1;
    while (1)
    {
      while (!v19)
      {
        if (v18 == 2) {
          goto LABEL_45;
        }
        BOOL v19 = 0;
        ++v18;
      }
      long long v26 = v25;
      float v20 = *(float *)((unint64_t)&v26 & 0xFFFFFFFFFFFFFFF3 | (4 * (v18 & 3)));
      long long v27 = *(_OWORD *)&v30[16];
      float v21 = *(float *)((unint64_t)&v27 & 0xFFFFFFFFFFFFFFF3 | (4 * (v18 & 3)));
      BOOL v19 = v20 == v21;
      if (v18 == 2) {
        break;
      }
      ++v18;
    }
    if (v20 != v21
      || (sub_100028900(v9, *(uint64_t *)&v30[32]) & 1) == 0
      || ((v4 ^ v10) & 1) != 0
      || (sub_100028B18(v3, v13) & 1) == 0)
    {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  uint64_t v5 = v33;
  if (v36 >> 62 != 1)
  {
    if (v36 == 0x8000000000000000
      && (v37 | (unint64_t)v33 | v35 | *((void *)&v34 + 1) | (unint64_t)v34 | *((void *)&v33 + 1)) == 0)
    {
      sub_100016C08(a2, (uint64_t)v30);
      if (v31 >> 62 != 2) {
        goto LABEL_45;
      }
      if (v31 != 0x8000000000000000) {
        goto LABEL_45;
      }
      int8x16_t v17 = vorrq_s8(*(int8x16_t *)&v30[8], *(int8x16_t *)&v30[24]);
      if (*(void *)&vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) | v32 | *(void *)v30) {
        goto LABEL_45;
      }
    }
    else
    {
      if (v36 == 0x8000000000000000
        && (void)v33 == 1
        && !(*((void *)&v34 + 1) | v35 | (unint64_t)v34 | *((void *)&v33 + 1) | v37))
      {
        sub_100016C08(a2, (uint64_t)v30);
        if (v31 >> 62 != 2 || v32 || v31 != 0x8000000000000000 || *(void *)v30 != 1) {
          goto LABEL_45;
        }
      }
      else
      {
        sub_100016C08(a2, (uint64_t)v30);
        if (v31 >> 62 != 2 || v32 || v31 != 0x8000000000000000 || *(void *)v30 != 2) {
          goto LABEL_45;
        }
      }
      int8x16_t v22 = vorrq_s8(*(int8x16_t *)&v30[8], *(int8x16_t *)&v30[24]);
      if (vorr_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))
      {
LABEL_45:
        char v8 = 0;
        return v8 & 1;
      }
    }
LABEL_40:
    char v8 = 1;
    return v8 & 1;
  }
  v36 &= 0x3FFFFFFFFFFFFFFFuLL;
  uint64_t v6 = *((void *)&v33 + 1);
  char v7 = v34;
  sub_100016C08(a2, (uint64_t)v30);
  if (v31 >> 62 != 1) {
    goto LABEL_45;
  }
  v31 &= 0x3FFFFFFFFFFFFFFFuLL;
  char v8 = sub_10002D0D8(v5, v6, v7, *(uint64_t *)v30, *(unint64_t *)&v30[8], v30[16]);
  return v8 & 1;
}

unint64_t sub_10002D54C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100015F58(&qword_100094058);
  uint64_t v3 = (void *)sub_10005EAF0();
  long long v13 = *(_OWORD *)(a1 + 32);
  unint64_t result = sub_10002B784(*(void *)(a1 + 32));
  if (v5)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v6 = (long long *)(a1 + 48);
  uint64_t v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    *(void *)(v3[7] + 8 * result) = *((void *)&v13 + 1);
    uint64_t v8 = v3[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      break;
    }
    v3[2] = v10;
    if (!v7) {
      goto LABEL_8;
    }
    long long v11 = *v6++;
    long long v13 = v11;
    swift_retain();
    unint64_t result = sub_10002B784(v11);
    --v7;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002D654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_10005DD50();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_10005DD70();
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
  sub_10005DD60();
  sub_10002BDB4(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_10002D70C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x10002D848);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_10001616C(a3, a4);
              char v15 = sub_10002C028(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
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
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL sub_10002D868(uint64_t a1, uint64_t a2)
{
  if (*(float *)a1 != *(float *)a2) {
    return 0;
  }
  uint64_t v2 = 0;
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 16);
  BOOL v5 = 1;
  while (!v5)
  {
    BOOL v5 = 0;
    uint64_t v8 = 0;
    if (v2 == 3) {
      return v8;
    }
LABEL_4:
    ++v2;
  }
  long long v10 = v3;
  float v6 = *(float *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
  long long v11 = v4;
  float v7 = *(float *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
  BOOL v5 = v6 == v7;
  if (v2 != 3) {
    goto LABEL_4;
  }
  if (v6 != v7
    || *(double *)(a1 + 32) != *(double *)(a2 + 32)
    || *(double *)(a1 + 40) != *(double *)(a2 + 40)
    || *(double *)(a1 + 48) != *(double *)(a2 + 48)
    || *(double *)(a1 + 56) != *(double *)(a2 + 56))
  {
    return 0;
  }
  return *(double *)(a1 + 64) == *(double *)(a2 + 64);
}

BOOL sub_10002D94C(uint64_t a1, uint64_t a2)
{
  if ((sub_10005DE00() & 1) == 0) {
    return 0;
  }
  long long v4 = (int *)type metadata accessor for CRLUSDRendering.SceneRequest(0);
  if ((sub_10002D70C(*(void *)(a1 + v4[5]), *(void *)(a1 + v4[5] + 8), *(void *)(a2 + v4[5]), *(void *)(a2 + v4[5] + 8)) & 1) == 0)return 0; {
  uint64_t v5 = a1 + v4[6];
  }
  long long v6 = *(_OWORD *)(v5 + 48);
  v12[2] = *(_OWORD *)(v5 + 32);
  v12[3] = v6;
  uint64_t v13 = *(void *)(v5 + 64);
  long long v7 = *(_OWORD *)(v5 + 16);
  v12[0] = *(_OWORD *)v5;
  v12[1] = v7;
  uint64_t v8 = a2 + v4[6];
  uint64_t v15 = *(void *)(v8 + 64);
  long long v9 = *(_OWORD *)(v8 + 48);
  v14[2] = *(_OWORD *)(v8 + 32);
  v14[3] = v9;
  long long v10 = *(_OWORD *)(v8 + 16);
  v14[0] = *(_OWORD *)v8;
  v14[1] = v10;
  return sub_10002D868((uint64_t)v12, (uint64_t)v14)
      && CGRectEqualToRect(*(CGRect *)(a1 + v4[7]), *(CGRect *)(a2 + v4[7]));
}

uint64_t sub_10002DA28(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_10002DA54()
{
  sub_10005ED40();
  sub_10005E770();
  Swift::Int v0 = sub_10005EDA0();

  return sub_10002DA28(v0);
}

uint64_t sub_10002DAC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6B6F6F426C7275 && a2 == 0xEF617461446B7261 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72756769666E6F63 && a2 == 0xED00006E6F697461 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x46746C7561666564 && a2 == 0xEC000000656D6172)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10002DCCC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4F466172656D6163 && a2 == 0xE900000000000056;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461746E6569726FLL && a2 == 0xEB000000006E6F69 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x724664656C616373 && a2 == 0xEF657A6953656D61 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010006EC90 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73746E65746E6F63 && a2 == 0xED0000656C616353)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10002DF50(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D696E4179616C70 && a2 == 0xEE00736E6F697461;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696E416573756170 && a2 == 0xEF736E6F6974616DLL || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010006EC50 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696E417465736572 && a2 == 0xEF736E6F6974616DLL || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D696E41706F7473 && a2 == 0xEE00736E6F697461)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10002E1E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000010006EC70 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6150737472617473 && a2 == 0xEC00000064657375)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10002E2E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465737561507369 && a2 == 0xE800000000000000;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C706D6F437369 && a2 == 0xEA00000000006574 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6979616C507369 && a2 == 0xE900000000000067 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6570706F74537369 && a2 == 0xE900000000000064 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6465657073 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10002E520(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6576697463616E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10002E60C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x756F426C65646F6DLL && a2 == 0xEB0000000073646ELL;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F6974616D696E61 && a2 == 0xEA0000000000736ELL || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6956734977656976 && a2 == 0xED0000656C626973 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10002E810(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574736575716572 && a2 == 0xE900000000000064 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E6964616F6CLL && a2 == 0xE700000000000000 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E697265646E6572 && a2 == 0xE900000000000067 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10002EA38(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7245676E69646F63 && a2 == 0xEB00000000726F72;
  if (v2 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7272456C7275 && a2 == 0xE800000000000000 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x45676E6964616F6CLL && a2 == 0xEC000000726F7272 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7272456574617473 && a2 == 0xEA0000000000726FLL || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4574756F656D6974 && a2 == 0xEC000000726F7272 || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F69736E65747865 && a2 == 0xEE00726F7272456ELL || (sub_10005EC40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x45636972656E6567 && a2 == 0xEC000000726F7272)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_10005EC40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_10002EDA0(void *a1)
{
  uint64_t v41 = sub_100015F58(&qword_100093CF8);
  uint64_t v36 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v45 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100015F58(&qword_100093D00);
  uint64_t v42 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  long long v44 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100015F58(&qword_100093D08);
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093D10);
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093D18);
  uint64_t v38 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  long long v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100015F58(&qword_100093D20);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v46 = a1;
  sub_100019664(a1, v16);
  sub_1000325BC();
  int8x16_t v17 = v47;
  sub_10005EDE0();
  if (v17) {
    goto LABEL_10;
  }
  char v47 = v8;
  uint64_t v18 = v11;
  BOOL v19 = v43;
  float v20 = v44;
  uint64_t v33 = v9;
  float v21 = v45;
  uint64_t v22 = sub_10005EBA0();
  if (*(void *)(v22 + 16) != 1)
  {
    uint64_t v25 = v12;
    uint64_t v12 = sub_10005EA20();
    swift_allocError();
    long long v26 = v15;
    long long v28 = v27;
    sub_100015F58(&qword_100093720);
    *long long v28 = &type metadata for CRLUSDRendering.SceneAction;
    sub_10005EB30();
    sub_10005EA10();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v28, enum case for DecodingError.typeMismatch(_:), v12);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v26, v25);
LABEL_10:
    sub_1000196FC((uint64_t)v46);
    return v12;
  }
  switch(*(unsigned char *)(v22 + 32))
  {
    case 1:
      char v51 = 1;
      sub_10003270C();
      long long v29 = v47;
      sub_10005EB20();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v12 = 0;
      goto LABEL_10;
    case 2:
      char v52 = 2;
      sub_1000326B8();
      sub_10005EB20();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v19, v40);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v12 = 0;
      goto LABEL_10;
    case 3:
      char v53 = 3;
      sub_100032664();
      sub_10005EB20();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v12 = 0;
      goto LABEL_10;
    case 4:
      char v54 = 4;
      sub_100032610();
      sub_10005EB20();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v12 = 0;
      goto LABEL_10;
    default:
      char v50 = 0;
      sub_100032760();
      long long v23 = v18;
      sub_10005EB20();
      char v49 = 0;
      uint64_t v24 = v33;
      sub_10005EB70();
      uint64_t v32 = v31;
      char v48 = 1;
      sub_10005EB60();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v23, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v12 = v32;
      sub_1000196FC((uint64_t)v46);
      break;
  }
  return v12;
}

unint64_t sub_10002F5D0(void *a1)
{
  uint64_t v2 = sub_100015F58(&qword_100093D88);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  uint64_t v28 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093D90);
  uint64_t v29 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093D98);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  Swift::String v30 = a1;
  unint64_t v14 = (unint64_t)sub_100019664(a1, v13);
  sub_1000327B4();
  uint64_t v15 = v31;
  sub_10005EDE0();
  if (!v15)
  {
    uint64_t v16 = v29;
    uint64_t v31 = v10;
    unint64_t v14 = (unint64_t)v12;
    uint64_t v17 = sub_10005EBA0();
    if (*(void *)(v17 + 16) == 1)
    {
      if (*(unsigned char *)(v17 + 32))
      {
        char v38 = 1;
        sub_100032808();
        sub_10005EB20();
        sub_10003285C();
        uint64_t v18 = v27;
        sub_10005EB90();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
        uint64_t v19 = 256;
        if (!v33) {
          uint64_t v19 = 0;
        }
        uint64_t v20 = v19 | v32;
        uint64_t v21 = 0x10000;
        if (!v34) {
          uint64_t v21 = 0;
        }
        uint64_t v22 = 0x1000000;
        if (!v35) {
          uint64_t v22 = 0;
        }
        unint64_t v14 = v20 | v21 | v22 | ((unint64_t)v36 << 32);
      }
      else
      {
        char v37 = 0;
        sub_1000328B0();
        sub_10005EB20();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
        unint64_t v14 = 2;
      }
    }
    else
    {
      uint64_t v23 = sub_10005EA20();
      swift_allocError();
      uint64_t v25 = v24;
      sub_100015F58(&qword_100093720);
      *uint64_t v25 = &type metadata for CRLUSDRendering.SceneDescription.AnimationState;
      sub_10005EB30();
      sub_10005EA10();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, enum case for DecodingError.typeMismatch(_:), v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v31 + 8))(v14, v9);
    }
  }
  sub_1000196FC((uint64_t)v30);
  return v14;
}

float sub_10002FA70(void *a1)
{
  uint64_t v2 = sub_100015F58(&qword_100093DE0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100032958();
  sub_10005EDE0();
  char v14 = 0;
  sub_10005EB60();
  char v13 = 1;
  sub_10005EB60();
  char v12 = 2;
  sub_10005EB60();
  char v11 = 3;
  v9[1] = sub_10005EB60();
  char v10 = 4;
  sub_10005EB80();
  float v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1000196FC((uint64_t)a1);
  return v8;
}

uint64_t sub_10002FCC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v64 = a2;
  uint64_t v57 = sub_100015F58(&qword_100093DF8);
  uint64_t v59 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  v63 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100015F58(&qword_100093E00);
  uint64_t v58 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  v62 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100015F58(&qword_100093E08);
  uint64_t v61 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  v60 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093E10);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v53 = v6;
  uint64_t v54 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015F58(&qword_100093E18);
  uint64_t v52 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100015F58(&qword_100093E20);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  v65 = a1;
  sub_100019664(a1, v17);
  sub_100032A58();
  uint64_t v18 = v73;
  sub_10005EDE0();
  if (v18) {
    return sub_1000196FC((uint64_t)v65);
  }
  char v50 = v12;
  uint64_t v49 = v10;
  uint64_t v19 = v9;
  uint64_t v21 = v60;
  uint64_t v20 = v61;
  uint64_t v22 = v62;
  uint64_t v23 = v63;
  uint64_t v51 = 0;
  uint64_t v73 = v14;
  uint64_t v24 = v64;
  uint64_t v25 = sub_10005EBA0();
  if (*(void *)(v25 + 16) != 1)
  {
    uint64_t v29 = v13;
    uint64_t v30 = sub_10005EA20();
    swift_allocError();
    unsigned __int8 v32 = v31;
    sub_100015F58(&qword_100093720);
    *unsigned __int8 v32 = &type metadata for CRLUSDRendering.RendererState;
    sub_10005EB30();
    sub_10005EA10();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, enum case for DecodingError.typeMismatch(_:), v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v29);
    return sub_1000196FC((uint64_t)v65);
  }
  switch(*(unsigned char *)(v25 + 32))
  {
    case 1:
      LOBYTE(v66) = 1;
      sub_100032BFC();
      uint64_t v33 = v51;
      sub_10005EB20();
      uint64_t v28 = v33;
      if (v33) {
        goto LABEL_14;
      }
      uint64_t v51 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v19, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v13);
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      unint64_t v43 = 0x8000000000000000;
      uint64_t v38 = 1;
      goto LABEL_21;
    case 2:
      LOBYTE(v66) = 2;
      sub_100032BA8();
      uint64_t v34 = v51;
      sub_10005EB20();
      uint64_t v28 = v34;
      if (v34) {
        goto LABEL_14;
      }
      uint64_t v51 = 0;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v13);
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      unint64_t v43 = 0x8000000000000000;
      uint64_t v38 = 2;
      goto LABEL_21;
    case 3:
      LOBYTE(v66) = 3;
      sub_100032B00();
      uint64_t v35 = v51;
      sub_10005EB20();
      if (v35) {
        goto LABEL_14;
      }
      sub_100032B54();
      uint64_t v44 = v56;
      sub_10005EB90();
      uint64_t v45 = v73;
      uint64_t v51 = 0;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v22, v44);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v13);
      uint64_t v38 = v66;
      uint64_t v28 = v67;
      uint64_t v39 = v68;
      uint64_t v40 = v69;
      uint64_t v41 = v70;
      unint64_t v43 = v71;
      uint64_t v42 = v72;
      goto LABEL_21;
    case 4:
      v62 = (char *)v25;
      LOBYTE(v66) = 4;
      sub_100032AAC();
      uint64_t v36 = v51;
      sub_10005EB20();
      if (v36) {
        goto LABEL_14;
      }
      sub_1000323E8();
      uint64_t v46 = v57;
      sub_10005EB90();
      uint64_t v47 = v73;
      uint64_t v51 = 0;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v23, v46);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v13);
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v38 = v66;
      uint64_t v28 = v67;
      unint64_t v43 = 0x4000000000000000;
      uint64_t v39 = v68;
      goto LABEL_21;
    default:
      LOBYTE(v66) = 0;
      sub_100032C50();
      long long v26 = v50;
      uint64_t v27 = v51;
      sub_10005EB20();
      uint64_t v28 = v27;
      if (v27)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v13);
        return sub_1000196FC((uint64_t)v65);
      }
      uint64_t v51 = 0;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v26, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v13);
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      unint64_t v43 = 0x8000000000000000;
LABEL_21:
      uint64_t result = sub_1000196FC((uint64_t)v65);
      uint64_t *v24 = v38;
      v24[1] = v28;
      void v24[2] = v39;
      v24[3] = v40;
      v24[4] = v41;
      v24[5] = v43;
      v24[6] = v42;
      break;
  }
  return result;
}

uint64_t sub_100030630(void *a1)
{
  uint64_t v72 = sub_100015F58(&qword_100093EA0);
  uint64_t v78 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  v83 = (char *)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100015F58(&qword_100093EA8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  uint64_t v77 = v4;
  __chkstk_darwin(v3);
  v82 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100015F58(&qword_100093EB0);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  v81 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100015F58(&qword_100093EB8);
  uint64_t v74 = *(void *)(v7 - 8);
  uint64_t v75 = v7;
  __chkstk_darwin(v7);
  v80 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015F58(&qword_100093EC0);
  uint64_t v69 = *(void *)(v9 - 8);
  uint64_t v70 = v9;
  __chkstk_darwin(v9);
  v79 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100015F58(&qword_100093EC8);
  uint64_t v67 = *(void *)(v11 - 8);
  uint64_t v68 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100015F58(&qword_100093ED0);
  uint64_t v66 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100015F58(&qword_100093ED8);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1[3];
  v84 = a1;
  sub_100019664(a1, v21);
  sub_100032D4C();
  uint64_t v22 = v86;
  sub_10005EDE0();
  if (!v22)
  {
    v63 = v16;
    uint64_t v62 = v14;
    v64 = v13;
    uint64_t v65 = 0;
    uint64_t v24 = v79;
    uint64_t v23 = v80;
    uint64_t v25 = v81;
    long long v26 = v82;
    uint64_t v27 = v83;
    uint64_t v86 = v18;
    uint64_t v28 = sub_10005EBA0();
    if (*(void *)(v28 + 16) == 1)
    {
      switch(*(unsigned char *)(v28 + 32))
      {
        case 1:
          LOBYTE(v85) = 1;
          sub_100032F98();
          uint64_t v39 = v64;
          uint64_t v40 = v65;
          sub_10005EB20();
          if (v40) {
            goto LABEL_7;
          }
          uint64_t v41 = v17;
          uint64_t v42 = v68;
          uint64_t v17 = sub_10005EB50();
          (*(void (**)(char *, uint64_t))(v67 + 8))(v39, v42);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v86 + 8))(v20, v41);
          break;
        case 2:
          LOBYTE(v85) = 2;
          sub_100032F44();
          uint64_t v43 = v65;
          sub_10005EB20();
          if (v43) {
            goto LABEL_7;
          }
          uint64_t v44 = v17;
          uint64_t v45 = v70;
          uint64_t v46 = sub_10005EB50();
          uint64_t v47 = v86;
          uint64_t v17 = v46;
          (*(void (**)(char *, uint64_t))(v69 + 8))(v24, v45);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v20, v44);
          break;
        case 3:
          LOBYTE(v85) = 3;
          sub_100032EF0();
          uint64_t v48 = v65;
          sub_10005EB20();
          if (v48) {
            goto LABEL_7;
          }
          uint64_t v49 = v17;
          uint64_t v50 = v75;
          uint64_t v51 = sub_10005EB50();
          uint64_t v52 = v86;
          uint64_t v17 = v51;
          (*(void (**)(char *, uint64_t))(v74 + 8))(v23, v50);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v49);
          break;
        case 4:
          LOBYTE(v85) = 4;
          sub_100032E9C();
          uint64_t v53 = v65;
          sub_10005EB20();
          if (v53) {
            goto LABEL_7;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v25, v73);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v86 + 8))(v20, v17);
          uint64_t v17 = 0;
          break;
        case 5:
          LOBYTE(v85) = 5;
          sub_100032DF4();
          uint64_t v54 = v65;
          sub_10005EB20();
          if (v54) {
            goto LABEL_7;
          }
          sub_100032E48();
          uint64_t v55 = v76;
          sub_10005EB90();
          uint64_t v56 = v86;
          (*(void (**)(char *, uint64_t))(v77 + 8))(v26, v55);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v20, v17);
          uint64_t v17 = v85;
          break;
        case 6:
          LOBYTE(v85) = 6;
          sub_100032DA0();
          uint64_t v57 = v65;
          sub_10005EB20();
          if (v57) {
            goto LABEL_7;
          }
          uint64_t v58 = v17;
          uint64_t v59 = v72;
          uint64_t v17 = sub_10005EB40();
          v60 = v27;
          uint64_t v61 = v86;
          (*(void (**)(char *, uint64_t))(v78 + 8))(v60, v59);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v61 + 8))(v20, v58);
          break;
        default:
          LOBYTE(v85) = 0;
          sub_100032FEC();
          uint64_t v29 = v63;
          uint64_t v30 = v65;
          sub_10005EB20();
          if (v30) {
            goto LABEL_7;
          }
          uint64_t v31 = v17;
          uint64_t v32 = v62;
          uint64_t v33 = sub_10005EB50();
          uint64_t v34 = v86;
          uint64_t v17 = v33;
          (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v32);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v31);
          break;
      }
    }
    else
    {
      uint64_t v35 = sub_10005EA20();
      swift_allocError();
      char v37 = v36;
      sub_100015F58(&qword_100093720);
      void *v37 = &type metadata for CRLUSDRendering.RendererError;
      sub_10005EB30();
      sub_10005EA10();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v37, enum case for DecodingError.typeMismatch(_:), v35);
      swift_willThrow();
LABEL_7:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v20, v17);
    }
  }
  sub_1000196FC((uint64_t)v84);
  return v17;
}

uint64_t sub_1000311D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100015F58(&qword_100093F70);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019664(a1, a1[3]);
  sub_100033094();
  sub_10005EDE0();
  if (v2) {
    return sub_1000196FC((uint64_t)a1);
  }
  LOBYTE(v16) = 0;
  sub_10005EB80();
  int v10 = v9;
  type metadata accessor for simd_quatf(0);
  char v17 = 1;
  sub_1000334E0(&qword_100093F80, 255, type metadata accessor for simd_quatf);
  sub_10005EB90();
  long long v15 = v16;
  type metadata accessor for CGSize(0);
  char v17 = 2;
  sub_1000334E0(&qword_100093F88, 255, type metadata accessor for CGSize);
  sub_10005EB90();
  long long v11 = v16;
  char v17 = 3;
  sub_10005EB90();
  long long v12 = v16;
  char v17 = 4;
  sub_1000330E8();
  sub_10005EB90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v16;
  uint64_t result = sub_1000196FC((uint64_t)a1);
  *(_DWORD *)a2 = v10;
  *(_OWORD *)(a2 + 16) = v15;
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v12;
  *(void *)(a2 + 64) = v13;
  return result;
}

uint64_t sub_1000314F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100015F58(&qword_100093FB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = sub_100023444((uint64_t)&_swiftEmptyArrayStorage);
  sub_100019664(a1, a1[3]);
  sub_100033190();
  sub_10005EDE0();
  if (v2)
  {
    sub_1000196FC((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = 0;
    sub_1000331E4();
    sub_10005EB90();
    long long v14 = v18;
    long long v15 = v17;
    sub_100015F58(&qword_100093FD0);
    char v19 = 1;
    sub_1000332E0(&qword_100093FD8, (void (*)(void))sub_100033238);
    sub_10005EB90();
    uint64_t v9 = v17;
    LOBYTE(v17) = 2;
    swift_bridgeObjectRetain();
    char v10 = sub_10005EB60();
    sub_100015F58(&qword_100093FE8);
    char v19 = 3;
    sub_1000333B0(&qword_100093FF0);
    sub_10005EB90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v11 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1000196FC((uint64_t)a1);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    long long v13 = v14;
    *(_OWORD *)a2 = v15;
    *(_OWORD *)(a2 + 16) = v13;
    *(void *)(a2 + 32) = v9;
    *(unsigned char *)(a2 + 40) = v10 & 1;
    *(void *)(a2 + 48) = v11;
  }
  return result;
}

uint64_t sub_100031848(void *a1)
{
  sub_100019664(a1, a1[3]);
  sub_10005EDD0();
  if (!v1)
  {
    sub_100019664(v4, v4[3]);
    sub_100015F58(&qword_100093A48);
    sub_1000336E0(&qword_1000940C0, &qword_100093A48);
    sub_10005EC50();
    sub_1000196FC((uint64_t)v4);
  }
  return sub_1000196FC((uint64_t)a1);
}

uint64_t sub_100031960(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000319B0()
{
  return type metadata accessor for CRLUSDRendering.LoadReceipt(0);
}

uint64_t type metadata accessor for CRLUSDRendering.LoadReceipt(uint64_t a1)
{
  return sub_1000157B4(a1, (uint64_t *)&unk_100093A80);
}

uint64_t sub_1000319D8()
{
  uint64_t result = sub_10005DE10();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CRLUSDRendering.TaskQueue()
{
  return self;
}

uint64_t destroy for CRLUSDRendering.SceneDescription()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CRLUSDRendering.SceneDescription(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CRLUSDRendering.SceneDescription(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CRLUSDRendering.SceneDescription(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CRLUSDRendering.SceneDescription(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.SceneDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.SceneDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription()
{
  return &type metadata for CRLUSDRendering.SceneDescription;
}

__n128 initializeWithCopy for CRLUSDRendering.SceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.SceneConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.SceneConfiguration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 72) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneConfiguration()
{
  return &type metadata for CRLUSDRendering.SceneConfiguration;
}

uint64_t destroy for CRLUSDRendering.RendererState(uint64_t *a1)
{
  return sub_100018068(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

uint64_t *initializeWithCopy for CRLUSDRendering.RendererState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  sub_1000183D4(*a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  return a1;
}

uint64_t *assignWithCopy for CRLUSDRendering.RendererState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  sub_1000183D4(*a2, v4, v5, v6, v7, v8);
  uint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  unint64_t v15 = a1[5];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  sub_100018068(v10, v11, v12, v13, v14, v15);
  return a1;
}

uint64_t *assignWithTake for CRLUSDRendering.RendererState(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  uint64_t v4 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v10;
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  a1[6] = v3;
  sub_100018068(v4, v6, v5, v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.RendererState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 40) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for CRLUSDRendering.RendererState(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 56) = 1;
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
      double result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 32) = 0;
      *(void *)(a1 + 40) = 2 * -a2;
      *(void *)(a1 + 48) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100031F68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100031F84(uint64_t result)
{
  *(void *)(result + 40) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_100031F94(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(void *)(result + 40) = *(void *)(result + 40) & 1 | (a2 << 62);
  }
  else
  {
    *(void *)double result = (a2 - 2);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = xmmword_1000716F0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState()
{
  return &type metadata for CRLUSDRendering.RendererState;
}

ValueMetadata *type metadata accessor for CRLUSDRendering()
{
  return &type metadata for CRLUSDRendering;
}

unsigned char *sub_100031FF8(unsigned char *result, char a2)
{
  *double result = a2 & 1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_100032018()
{
  unint64_t result = qword_100093C50;
  if (!qword_100093C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C50);
  }
  return result;
}

unint64_t sub_100032074()
{
  unint64_t result = qword_100093C58;
  if (!qword_100093C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C58);
  }
  return result;
}

unint64_t sub_1000320CC()
{
  unint64_t result = qword_100093C60;
  if (!qword_100093C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C60);
  }
  return result;
}

unint64_t sub_100032124()
{
  unint64_t result = qword_100093C68;
  if (!qword_100093C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C68);
  }
  return result;
}

unint64_t sub_10003217C()
{
  unint64_t result = qword_100093C70;
  if (!qword_100093C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C70);
  }
  return result;
}

unint64_t sub_1000321D4()
{
  unint64_t result = qword_100093C78;
  if (!qword_100093C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C78);
  }
  return result;
}

unint64_t sub_10003222C()
{
  unint64_t result = qword_100093C80;
  if (!qword_100093C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C80);
  }
  return result;
}

unint64_t sub_100032284()
{
  unint64_t result = qword_100093C88;
  if (!qword_100093C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C88);
  }
  return result;
}

unint64_t sub_1000322DC()
{
  unint64_t result = qword_100093C90;
  if (!qword_100093C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C90);
  }
  return result;
}

unint64_t sub_100032334()
{
  unint64_t result = qword_100093C98;
  if (!qword_100093C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093C98);
  }
  return result;
}

uint64_t sub_100032388(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_100093CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000323E8()
{
  unint64_t result = qword_100093CA8;
  if (!qword_100093CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093CA8);
  }
  return result;
}

uint64_t type metadata accessor for CRLUSDRendering.SceneRequest(uint64_t a1)
{
  return sub_1000157B4(a1, qword_100094120);
}

unint64_t sub_10003245C()
{
  unint64_t result = qword_100093CB8;
  if (!qword_100093CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093CB8);
  }
  return result;
}

unint64_t sub_1000324B0()
{
  unint64_t result = qword_100093CC8;
  if (!qword_100093CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093CC8);
  }
  return result;
}

uint64_t sub_100032504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLUSDRendering.SceneRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100032568()
{
  unint64_t result = qword_100093CE8;
  if (!qword_100093CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093CE8);
  }
  return result;
}

unint64_t sub_1000325BC()
{
  unint64_t result = qword_100093D28;
  if (!qword_100093D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D28);
  }
  return result;
}

unint64_t sub_100032610()
{
  unint64_t result = qword_100093D30;
  if (!qword_100093D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D30);
  }
  return result;
}

unint64_t sub_100032664()
{
  unint64_t result = qword_100093D38;
  if (!qword_100093D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D38);
  }
  return result;
}

unint64_t sub_1000326B8()
{
  unint64_t result = qword_100093D40;
  if (!qword_100093D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D40);
  }
  return result;
}

unint64_t sub_10003270C()
{
  unint64_t result = qword_100093D48;
  if (!qword_100093D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D48);
  }
  return result;
}

unint64_t sub_100032760()
{
  unint64_t result = qword_100093D50;
  if (!qword_100093D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093D50);
  }
  return result;
}

unint64_t sub_1000327B4()
{
  unint64_t result = qword_100093DA0;
  if (!qword_100093DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DA0);
  }
  return result;
}

unint64_t sub_100032808()
{
  unint64_t result = qword_100093DA8;
  if (!qword_100093DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DA8);
  }
  return result;
}

unint64_t sub_10003285C()
{
  unint64_t result = qword_100093DB0;
  if (!qword_100093DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DB0);
  }
  return result;
}

unint64_t sub_1000328B0()
{
  unint64_t result = qword_100093DB8;
  if (!qword_100093DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DB8);
  }
  return result;
}

unint64_t sub_100032904()
{
  unint64_t result = qword_100093DD8;
  if (!qword_100093DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DD8);
  }
  return result;
}

unint64_t sub_100032958()
{
  unint64_t result = qword_100093DE8;
  if (!qword_100093DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093DE8);
  }
  return result;
}

uint64_t sub_1000329AC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t *sub_1000329C4(uint64_t *a1)
{
  return a1;
}

__n128 *sub_1000329FC(__n128 *a1, __n128 *a2)
{
  return a2;
}

unint64_t sub_100032A58()
{
  unint64_t result = qword_100093E28;
  if (!qword_100093E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E28);
  }
  return result;
}

unint64_t sub_100032AAC()
{
  unint64_t result = qword_100093E30;
  if (!qword_100093E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E30);
  }
  return result;
}

unint64_t sub_100032B00()
{
  unint64_t result = qword_100093E38;
  if (!qword_100093E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E38);
  }
  return result;
}

unint64_t sub_100032B54()
{
  unint64_t result = qword_100093E40;
  if (!qword_100093E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E40);
  }
  return result;
}

unint64_t sub_100032BA8()
{
  unint64_t result = qword_100093E48;
  if (!qword_100093E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E48);
  }
  return result;
}

unint64_t sub_100032BFC()
{
  unint64_t result = qword_100093E50;
  if (!qword_100093E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E50);
  }
  return result;
}

unint64_t sub_100032C50()
{
  unint64_t result = qword_100093E58;
  if (!qword_100093E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E58);
  }
  return result;
}

unint64_t sub_100032CA4()
{
  unint64_t result = qword_100093E90;
  if (!qword_100093E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E90);
  }
  return result;
}

unint64_t sub_100032CF8()
{
  unint64_t result = qword_100093E98;
  if (!qword_100093E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093E98);
  }
  return result;
}

unint64_t sub_100032D4C()
{
  unint64_t result = qword_100093EE0;
  if (!qword_100093EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093EE0);
  }
  return result;
}

unint64_t sub_100032DA0()
{
  unint64_t result = qword_100093EE8;
  if (!qword_100093EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093EE8);
  }
  return result;
}

unint64_t sub_100032DF4()
{
  unint64_t result = qword_100093EF0;
  if (!qword_100093EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093EF0);
  }
  return result;
}

unint64_t sub_100032E48()
{
  unint64_t result = qword_100093EF8;
  if (!qword_100093EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093EF8);
  }
  return result;
}

unint64_t sub_100032E9C()
{
  unint64_t result = qword_100093F00;
  if (!qword_100093F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F00);
  }
  return result;
}

unint64_t sub_100032EF0()
{
  unint64_t result = qword_100093F08;
  if (!qword_100093F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F08);
  }
  return result;
}

unint64_t sub_100032F44()
{
  unint64_t result = qword_100093F10;
  if (!qword_100093F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F10);
  }
  return result;
}

unint64_t sub_100032F98()
{
  unint64_t result = qword_100093F18;
  if (!qword_100093F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F18);
  }
  return result;
}

unint64_t sub_100032FEC()
{
  unint64_t result = qword_100093F20;
  if (!qword_100093F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F20);
  }
  return result;
}

unint64_t sub_100033040()
{
  unint64_t result = qword_100093F68;
  if (!qword_100093F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F68);
  }
  return result;
}

unint64_t sub_100033094()
{
  unint64_t result = qword_100093F78;
  if (!qword_100093F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F78);
  }
  return result;
}

unint64_t sub_1000330E8()
{
  unint64_t result = qword_100093F90;
  if (!qword_100093F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093F90);
  }
  return result;
}

unint64_t sub_10003313C()
{
  unint64_t result = qword_100093FB0;
  if (!qword_100093FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093FB0);
  }
  return result;
}

unint64_t sub_100033190()
{
  unint64_t result = qword_100093FC0;
  if (!qword_100093FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093FC0);
  }
  return result;
}

unint64_t sub_1000331E4()
{
  unint64_t result = qword_100093FC8;
  if (!qword_100093FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093FC8);
  }
  return result;
}

unint64_t sub_100033238()
{
  unint64_t result = qword_100093FE0;
  if (!qword_100093FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100093FE0);
  }
  return result;
}

unint64_t sub_10003328C()
{
  unint64_t result = qword_100094000;
  if (!qword_100094000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094000);
  }
  return result;
}

uint64_t sub_1000332E0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016310(&qword_100093FD0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003335C()
{
  unint64_t result = qword_100094010;
  if (!qword_100094010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094010);
  }
  return result;
}

uint64_t sub_1000333B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016310(&qword_100093FE8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100033414()
{
  unint64_t result = qword_100094030;
  if (!qword_100094030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094030);
  }
  return result;
}

_OWORD *sub_100033468(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10003347C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000334E0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100033528(uint64_t a1)
{
  return sub_10002B330(a1, v1);
}

uint64_t sub_100033530()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100033540(uint64_t a1)
{
  return sub_10002ACC8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100033550(uint64_t a1)
{
  return sub_100033654(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10002AF0C);
}

uint64_t sub_10003356C()
{
  uint64_t v1 = sub_100015F58(&qword_1000940A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003363C(uint64_t a1)
{
  return sub_100033654(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10002B00C);
}

uint64_t sub_100033654(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_100015F58(&qword_1000940A8) - 8);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5, v6);
}

uint64_t sub_1000336E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016310(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneDescription.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneConfiguration.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneConfiguration.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.RendererError.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CRLUSDRendering.RendererError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1000338B0);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.CodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.CodingErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.CodingErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.UrlErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.UrlErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.LoadingErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.LoadingErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.StateErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.StateErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.TimeoutErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.TimeoutErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.ExtensionErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.ExtensionErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError.GenericErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererError.GenericErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.CodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.DisabledCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.RequestedCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.RequestedCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.LoadingCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.LoadingCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.RenderingCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.RenderingCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererState.ErrorCodingKeys()
{
  return &type metadata for CRLUSDRendering.RendererState.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState.InactiveCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState.InactiveCodingKeys;
}

unsigned char *_s20USDRendererExtension15CRLUSDRenderingO13RendererErrorO21CodingErrorCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100033A8CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState.ActiveCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState.ActiveCodingKeys;
}

uint64_t _s20USDRendererExtension15CRLUSDRenderingO18SceneConfigurationV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s20USDRendererExtension15CRLUSDRenderingO18SceneConfigurationV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100033C20);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLPencilAndPaperFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100033DB4);
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

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.PlayAnimationsCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.PlayAnimationsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.PauseAnimationsCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.PauseAnimationsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.ResumeAnimationsCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.ResumeAnimationsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.ResetAnimationsCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.ResetAnimationsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction.StopAnimationsCodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneAction.StopAnimationsCodingKeys;
}

uint64_t _s20USDRendererExtension15CRLUSDRenderingO16SceneDescriptionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s20USDRendererExtension15CRLUSDRenderingO16SceneDescriptionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x100033F88);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneRequest.CodingKeys()
{
  return &type metadata for CRLUSDRendering.SceneRequest.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for CRLUSDRendering.SceneAction(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.SceneAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 < 2) {
    return 0;
  }
  unsigned int v4 = (v3 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v4 - 3;
  if (v4 <= 3) {
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.SceneAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 5;
    }
  }
  return result;
}

uint64_t sub_100034064(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 8);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100034080(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
  }
  else if (a2)
  {
    *(unsigned char *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneAction()
{
  return &type metadata for CRLUSDRendering.SceneAction;
}

void *initializeBufferWithCopyOfBuffer for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[8]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState.PlaybackState;
}

uint64_t *sub_100034168(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10005DE10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = (uint64_t *)((char *)a1 + v8);
    long long v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_10001616C(*v10, v12);
    uint64_t *v9 = v11;
    v9[1] = v12;
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    unint64_t v15 = (char *)a1 + v13;
    unint64_t v16 = (char *)a2 + v13;
    long long v17 = *((_OWORD *)v16 + 3);
    *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
    *((_OWORD *)v15 + 3) = v17;
    *((void *)v15 + 8) = *((void *)v16 + 8);
    long long v18 = *((_OWORD *)v16 + 1);
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
    *((_OWORD *)v15 + 1) = v18;
    char v19 = (_OWORD *)((char *)a1 + v14);
    uint64_t v20 = (_OWORD *)((char *)a2 + v14);
    long long v21 = v20[1];
    *char v19 = *v20;
    v19[1] = v21;
  }
  return a1;
}

uint64_t sub_100034284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];

  return sub_100016114(v6, v7);
}

uint64_t sub_1000342FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  unint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_10001616C(*v9, v11);
  uint64_t *v8 = v10;
  v8[1] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  long long v16 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(v14 + 48) = v16;
  *(void *)(v14 + 64) = *(void *)(v15 + 64);
  long long v17 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v17;
  long long v18 = (_OWORD *)(a1 + v13);
  char v19 = (_OWORD *)(a2 + v13);
  long long v20 = v19[1];
  _OWORD *v18 = *v19;
  v18[1] = v20;
  return a1;
}

uint64_t sub_1000343C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  unint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_10001616C(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  uint64_t *v8 = v10;
  v8[1] = v11;
  sub_100016114(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(v16 + 16);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(void *)(v15 + 40) = *(void *)(v16 + 40);
  *(void *)(v15 + 48) = *(void *)(v16 + 48);
  *(void *)(v15 + 56) = *(void *)(v16 + 56);
  *(void *)(v15 + 64) = *(void *)(v16 + 64);
  uint64_t v17 = a3[7];
  long long v18 = (void *)(a1 + v17);
  char v19 = (void *)(a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  v18[2] = v19[2];
  v18[3] = v19[3];
  return a1;
}

uint64_t sub_1000344D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  long long v10 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v10;
  long long v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  uint64_t v12 = a3[7];
  unint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = (_OWORD *)(a2 + v12);
  long long v15 = v14[1];
  _OWORD *v13 = *v14;
  v13[1] = v15;
  return a1;
}

uint64_t sub_100034588(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005DE10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_100016114(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  long long v14 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
  *(_OWORD *)(v12 + 32) = v14;
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v13 + 48);
  *(void *)(v12 + 64) = *(void *)(v13 + 64);
  long long v15 = (_OWORD *)(a1 + v11);
  uint64_t v16 = (_OWORD *)(a2 + v11);
  long long v17 = v16[1];
  _OWORD *v15 = *v16;
  v15[1] = v17;
  return a1;
}

uint64_t sub_10003464C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100034660);
}

uint64_t sub_100034660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005DE10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
    if (((4 * v10) & 0xC) != 0) {
      return 16 - ((4 * v10) & 0xC | (v10 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100034734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100034748);
}

uint64_t sub_100034748(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005DE10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = (void *)(a1 + *(int *)(a4 + 20));
    *uint64_t v11 = 0;
    v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_100034814()
{
  uint64_t result = sub_10005DE10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.SceneDescription.AnimationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[8]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  unsigned int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    unsigned int v5 = -1;
  }
  if (v5 + 1 >= 2) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.SceneDescription.AnimationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_100034954(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

void *sub_100034970(void *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *uint64_t result = a2 - 255;
  }
  else if (a2)
  {
    *(unsigned char *)uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.SceneDescription.AnimationState()
{
  return &type metadata for CRLUSDRendering.SceneDescription.AnimationState;
}

uint64_t destroy for CRLUSDRendering.RendererError(uint64_t a1)
{
  return sub_1000180C8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s20USDRendererExtension15CRLUSDRenderingO13RendererErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100018434(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CRLUSDRendering.RendererError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100018434(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000180C8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CRLUSDRendering.RendererError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000180C8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLUSDRendering.RendererError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CRLUSDRendering.RendererError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100034B30(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 5u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t sub_100034B48(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(void *)uint64_t result = a2 - 6;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRendering.RendererError()
{
  return &type metadata for CRLUSDRendering.RendererError;
}

unint64_t sub_100034B74()
{
  unint64_t result = qword_100094160;
  if (!qword_100094160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094160);
  }
  return result;
}

unint64_t sub_100034BCC()
{
  unint64_t result = qword_100094168;
  if (!qword_100094168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094168);
  }
  return result;
}

unint64_t sub_100034C24()
{
  unint64_t result = qword_100094170;
  if (!qword_100094170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094170);
  }
  return result;
}

unint64_t sub_100034C7C()
{
  unint64_t result = qword_100094178;
  if (!qword_100094178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094178);
  }
  return result;
}

unint64_t sub_100034CD4()
{
  unint64_t result = qword_100094180;
  if (!qword_100094180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094180);
  }
  return result;
}

unint64_t sub_100034D2C()
{
  unint64_t result = qword_100094188;
  if (!qword_100094188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094188);
  }
  return result;
}

unint64_t sub_100034D84()
{
  unint64_t result = qword_100094190;
  if (!qword_100094190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094190);
  }
  return result;
}

unint64_t sub_100034DDC()
{
  unint64_t result = qword_100094198;
  if (!qword_100094198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094198);
  }
  return result;
}

unint64_t sub_100034E34()
{
  unint64_t result = qword_1000941A0;
  if (!qword_1000941A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941A0);
  }
  return result;
}

unint64_t sub_100034E8C()
{
  unint64_t result = qword_1000941A8;
  if (!qword_1000941A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941A8);
  }
  return result;
}

unint64_t sub_100034EE4()
{
  unint64_t result = qword_1000941B0;
  if (!qword_1000941B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941B0);
  }
  return result;
}

unint64_t sub_100034F3C()
{
  unint64_t result = qword_1000941B8;
  if (!qword_1000941B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941B8);
  }
  return result;
}

unint64_t sub_100034F94()
{
  unint64_t result = qword_1000941C0;
  if (!qword_1000941C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941C0);
  }
  return result;
}

unint64_t sub_100034FEC()
{
  unint64_t result = qword_1000941C8;
  if (!qword_1000941C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941C8);
  }
  return result;
}

unint64_t sub_100035044()
{
  unint64_t result = qword_1000941D0;
  if (!qword_1000941D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941D0);
  }
  return result;
}

unint64_t sub_10003509C()
{
  unint64_t result = qword_1000941D8;
  if (!qword_1000941D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941D8);
  }
  return result;
}

unint64_t sub_1000350F4()
{
  unint64_t result = qword_1000941E0;
  if (!qword_1000941E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941E0);
  }
  return result;
}

unint64_t sub_10003514C()
{
  unint64_t result = qword_1000941E8;
  if (!qword_1000941E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941E8);
  }
  return result;
}

unint64_t sub_1000351A4()
{
  unint64_t result = qword_1000941F0;
  if (!qword_1000941F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941F0);
  }
  return result;
}

unint64_t sub_1000351FC()
{
  unint64_t result = qword_1000941F8;
  if (!qword_1000941F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000941F8);
  }
  return result;
}

unint64_t sub_100035254()
{
  unint64_t result = qword_100094200;
  if (!qword_100094200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094200);
  }
  return result;
}

unint64_t sub_1000352AC()
{
  unint64_t result = qword_100094208;
  if (!qword_100094208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094208);
  }
  return result;
}

unint64_t sub_100035304()
{
  unint64_t result = qword_100094210;
  if (!qword_100094210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094210);
  }
  return result;
}

unint64_t sub_10003535C()
{
  unint64_t result = qword_100094218;
  if (!qword_100094218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094218);
  }
  return result;
}

unint64_t sub_1000353B4()
{
  unint64_t result = qword_100094220;
  if (!qword_100094220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094220);
  }
  return result;
}

unint64_t sub_10003540C()
{
  unint64_t result = qword_100094228;
  if (!qword_100094228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094228);
  }
  return result;
}

unint64_t sub_100035464()
{
  unint64_t result = qword_100094230;
  if (!qword_100094230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094230);
  }
  return result;
}

unint64_t sub_1000354BC()
{
  unint64_t result = qword_100094238;
  if (!qword_100094238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094238);
  }
  return result;
}

unint64_t sub_100035514()
{
  unint64_t result = qword_100094240;
  if (!qword_100094240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094240);
  }
  return result;
}

unint64_t sub_10003556C()
{
  unint64_t result = qword_100094248;
  if (!qword_100094248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094248);
  }
  return result;
}

unint64_t sub_1000355C4()
{
  unint64_t result = qword_100094250;
  if (!qword_100094250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094250);
  }
  return result;
}

unint64_t sub_10003561C()
{
  unint64_t result = qword_100094258;
  if (!qword_100094258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094258);
  }
  return result;
}

unint64_t sub_100035674()
{
  unint64_t result = qword_100094260;
  if (!qword_100094260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094260);
  }
  return result;
}

unint64_t sub_1000356CC()
{
  unint64_t result = qword_100094268;
  if (!qword_100094268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094268);
  }
  return result;
}

unint64_t sub_100035724()
{
  unint64_t result = qword_100094270;
  if (!qword_100094270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094270);
  }
  return result;
}

unint64_t sub_10003577C()
{
  unint64_t result = qword_100094278;
  if (!qword_100094278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094278);
  }
  return result;
}

unint64_t sub_1000357D4()
{
  unint64_t result = qword_100094280;
  if (!qword_100094280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094280);
  }
  return result;
}

unint64_t sub_10003582C()
{
  unint64_t result = qword_100094288;
  if (!qword_100094288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094288);
  }
  return result;
}

unint64_t sub_100035884()
{
  unint64_t result = qword_100094290;
  if (!qword_100094290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094290);
  }
  return result;
}

unint64_t sub_1000358DC()
{
  unint64_t result = qword_100094298;
  if (!qword_100094298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094298);
  }
  return result;
}

unint64_t sub_100035934()
{
  unint64_t result = qword_1000942A0;
  if (!qword_1000942A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942A0);
  }
  return result;
}

unint64_t sub_10003598C()
{
  unint64_t result = qword_1000942A8;
  if (!qword_1000942A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942A8);
  }
  return result;
}

unint64_t sub_1000359E4()
{
  unint64_t result = qword_1000942B0;
  if (!qword_1000942B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942B0);
  }
  return result;
}

unint64_t sub_100035A3C()
{
  unint64_t result = qword_1000942B8;
  if (!qword_1000942B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942B8);
  }
  return result;
}

unint64_t sub_100035A94()
{
  unint64_t result = qword_1000942C0;
  if (!qword_1000942C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942C0);
  }
  return result;
}

unint64_t sub_100035AEC()
{
  unint64_t result = qword_1000942C8;
  if (!qword_1000942C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942C8);
  }
  return result;
}

unint64_t sub_100035B44()
{
  unint64_t result = qword_1000942D0;
  if (!qword_1000942D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942D0);
  }
  return result;
}

unint64_t sub_100035B9C()
{
  unint64_t result = qword_1000942D8;
  if (!qword_1000942D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942D8);
  }
  return result;
}

unint64_t sub_100035BF4()
{
  unint64_t result = qword_1000942E0;
  if (!qword_1000942E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942E0);
  }
  return result;
}

unint64_t sub_100035C4C()
{
  unint64_t result = qword_1000942E8;
  if (!qword_1000942E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942E8);
  }
  return result;
}

unint64_t sub_100035CA4()
{
  unint64_t result = qword_1000942F0;
  if (!qword_1000942F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942F0);
  }
  return result;
}

unint64_t sub_100035CFC()
{
  unint64_t result = qword_1000942F8;
  if (!qword_1000942F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000942F8);
  }
  return result;
}

unint64_t sub_100035D54()
{
  unint64_t result = qword_100094300;
  if (!qword_100094300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094300);
  }
  return result;
}

unint64_t sub_100035DAC()
{
  unint64_t result = qword_100094308;
  if (!qword_100094308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094308);
  }
  return result;
}

unint64_t sub_100035E04()
{
  unint64_t result = qword_100094310;
  if (!qword_100094310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094310);
  }
  return result;
}

unint64_t sub_100035E5C()
{
  unint64_t result = qword_100094318;
  if (!qword_100094318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094318);
  }
  return result;
}

unint64_t sub_100035EB4()
{
  unint64_t result = qword_100094320;
  if (!qword_100094320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094320);
  }
  return result;
}

unint64_t sub_100035F0C()
{
  unint64_t result = qword_100094328;
  if (!qword_100094328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094328);
  }
  return result;
}

unint64_t sub_100035F64()
{
  unint64_t result = qword_100094330;
  if (!qword_100094330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094330);
  }
  return result;
}

unint64_t sub_100035FBC()
{
  unint64_t result = qword_100094338;
  if (!qword_100094338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094338);
  }
  return result;
}

unint64_t sub_100036014()
{
  unint64_t result = qword_100094340;
  if (!qword_100094340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094340);
  }
  return result;
}

unint64_t sub_10003606C()
{
  unint64_t result = qword_100094348;
  if (!qword_100094348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094348);
  }
  return result;
}

unint64_t sub_1000360C4()
{
  unint64_t result = qword_100094350;
  if (!qword_100094350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094350);
  }
  return result;
}

unint64_t sub_10003611C()
{
  unint64_t result = qword_100094358;
  if (!qword_100094358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094358);
  }
  return result;
}

unint64_t sub_100036174()
{
  unint64_t result = qword_100094360;
  if (!qword_100094360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094360);
  }
  return result;
}

unint64_t sub_1000361CC()
{
  unint64_t result = qword_100094368;
  if (!qword_100094368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094368);
  }
  return result;
}

unint64_t sub_100036224()
{
  unint64_t result = qword_100094370;
  if (!qword_100094370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094370);
  }
  return result;
}

unint64_t sub_10003627C()
{
  unint64_t result = qword_100094378;
  if (!qword_100094378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094378);
  }
  return result;
}

unint64_t sub_1000362D4()
{
  unint64_t result = qword_100094380;
  if (!qword_100094380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094380);
  }
  return result;
}

unint64_t sub_10003632C()
{
  unint64_t result = qword_100094388;
  if (!qword_100094388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094388);
  }
  return result;
}

unint64_t sub_100036384()
{
  unint64_t result = qword_100094390;
  if (!qword_100094390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094390);
  }
  return result;
}

unint64_t sub_1000363DC()
{
  unint64_t result = qword_100094398;
  if (!qword_100094398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094398);
  }
  return result;
}

uint64_t sub_100036430(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100015F58(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000364B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E880();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10005E870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10003EC6C(a1, &qword_100094C30);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10005E800();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100036660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005E880();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10005E870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10003EC6C(a1, &qword_100094C30);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10005E800();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_100015F58(&qword_100094560);
  return swift_task_create();
}

uint64_t sub_100036814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a2;
  uint64_t v7 = sub_100015F58(&qword_100093678);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005DED0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 136) = 0;
  uint64_t v14 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_acknowledgeQueue;
  type metadata accessor for CRLUSDRendering.TaskQueue();
  uint64_t v15 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v15 + 128) = _swiftEmptyArrayStorage;
  *(_OWORD *)(v15 + 112) = xmmword_1000714B0;
  *(void *)(v4 + v14) = v15;
  uint64_t v16 = v4
      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState;
  *(_OWORD *)uint64_t v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  *(void *)(v16 + 32) = 0;
  *(_OWORD *)(v16 + 40) = xmmword_100073BA0;
  if (qword_100093120 != -1) {
    swift_once();
  }
  sub_100018E44(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_10005DEC0();
    sub_10003EC6C((uint64_t)v9, &qword_100093678);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v4 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid, v13, v10);
  }
  else
  {
    long long v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v17(v13, v9, v10);
    v17((char *)(v4 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid), v13, v10);
  }
  *(void *)(v4 + 24) = v25;
  swift_unknownObjectWeakAssign();
  char v18 = v26;
  *(void *)(v4 + 40) = v26;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 56) = 0;
  *(void *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0xC000000000000000;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(void *)(v4 + 128) = 0;
  uint64_t v19 = a1;
  if ((v18 & 2) != 0)
  {
    id v20 = [objc_allocWithZone((Class)_s10MetalLayerCMa()) init];
    long long v21 = *(void **)(v4 + 32);
    *(void *)(v5 + 32) = v20;
    uint64_t v22 = (char *)v20;

    [v22 setFrame:0.0, 0.0, 300.0, 300.0];
    uint64_t v28 = *(void *)&v22[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_frameNumber];
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_100015F58(&qword_100094568);
    sub_10003ED08();
    uint64_t v23 = sub_10005E680();

    swift_unknownObjectRelease();
    swift_release();
    sub_10003EC6C(v19, &qword_100093678);
    swift_release();
    *(void *)(v5 + 136) = v23;
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    sub_10003EC6C(a1, &qword_100093678);
  }
  return v5;
}

void *sub_100036BE4()
{
  uint64_t v0 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v0 - 8);
  BOOL v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  unint64_t result = (void *)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)result[4];
    if (!v5) {
      return (void *)swift_release();
    }
    if ((*((unsigned char *)v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_hasDrawnFrame) & 1) != 0
      && (unint64_t v6 = result[9], v6 >> 62 == 1))
    {
      uint64_t v7 = result[15];
      uint64_t v8 = result[16];
      uint64_t v9 = result[13];
      uint64_t v10 = result[14];
      uint64_t v11 = result[12];
      uint64_t v27 = result[11];
      uint64_t v28 = v11;
      uint64_t v32 = result[10];
      uint64_t v33 = v9;
      uint64_t v12 = result[8];
      unint64_t v34 = result[7];
      unint64_t v13 = v34;
      uint64_t v14 = result[6];
      uint64_t v23 = v12;
      uint64_t v24 = v14;
      unint64_t v25 = v6;
      uint64_t v15 = sub_10005E880();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v2, 1, 1, v15);
      uint64_t v26 = sub_10005E860();
      uint64_t v31 = v8;
      uint64_t v30 = v7;
      uint64_t v29 = v10;
      sub_100037624(v14, v13, v12, v6);
      id v16 = v5;
      LOBYTE(v8) = v23;
      uint64_t v17 = v24;
      unint64_t v18 = v25;
      sub_100037624(v24, v34, v23, v25);
      uint64_t v19 = sub_10005E850();
      id v20 = (void *)swift_allocObject();
      v20[2] = v19;
      v20[3] = &protocol witness table for MainActor;
      v20[4] = v17;
      sub_1000364B4((uint64_t)v2, (uint64_t)&unk_100094580, (uint64_t)v20);
      sub_10003768C(v17, v34, v8, v18);
      swift_release();
      if (!v4[17]) {
        goto LABEL_9;
      }
    }
    else
    {
      id v21 = v5;
      if (!v4[17])
      {
LABEL_9:

        v4[17] = 0;
        swift_release();
        return (void *)swift_release();
      }
    }
    swift_retain();
    sub_10005E600();
    swift_release();
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_100036EBC()
{
  v0[2] = sub_10005E860();
  v0[3] = sub_10005E850();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100036F68;
  return sub_1000475C8();
}

uint64_t sub_100036F68()
{
  swift_task_dealloc();
  uint64_t v1 = sub_10005E800();
  return _swift_task_switch(sub_1000370A4, v1, v0);
}

uint64_t sub_1000370A4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100037104()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = *(void *)(v0 + 72);
  if (v5 >> 62 == 1)
  {
    long long v16 = *(_OWORD *)(v0 + 112);
    uint64_t v6 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v18 = v6;
    unint64_t v8 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v10 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
    sub_10005E860();
    swift_retain_n();
    uint64_t v11 = sub_10005E850();
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = v11;
    v12[3] = &protocol witness table for MainActor;
    _OWORD v12[4] = v9;
    sub_1000364B4((uint64_t)v4, (uint64_t)&unk_100094590, (uint64_t)v12);
    sub_10003768C(v9, v8, v7, v5);
    swift_release();
  }
  sub_100019028(v1 + 16);

  sub_10003768C(*(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72));
  swift_release();
  uint64_t v13 = v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  uint64_t v14 = sub_10005DED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_release();
  sub_10003E338(*(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState), *(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState+ 8), *(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState+ 16), *(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState+ 24), *(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState+ 32), *(void *)(v1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState+ 40));
  return v1;
}

uint64_t sub_100037368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_10005E860();
  *(void *)(v4 + 24) = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  return _swift_task_switch(sub_100037400, v6, v5);
}

uint64_t sub_100037400()
{
  swift_release();
  if (qword_100093120 != -1) {
    swift_once();
  }
  sub_10004BB8C(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000374A0()
{
  sub_100037104();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000374F8()
{
  return _s10RepBackendCMa();
}

uint64_t _s10RepBackendCMa()
{
  uint64_t result = qword_1000943E0;
  if (!qword_1000943E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003754C()
{
  uint64_t result = sub_10005DED0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100037624(uint64_t result, unint64_t a2, char a3, unint64_t a4)
{
  if (a4 >> 62 == 2) {
    return sub_100018434(result, a2, a3);
  }
  if ((a4 >> 62) <= 1) {
    return swift_retain();
  }
  return result;
}

uint64_t _s10RepBackendC12BackendStateOwxx(uint64_t *a1)
{
  return sub_10003768C(*a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_10003768C(uint64_t result, unint64_t a2, char a3, unint64_t a4)
{
  if (a4 >> 62 == 2) {
    return sub_1000180C8(result, a2, a3);
  }
  if ((a4 >> 62) <= 1) {
    return swift_release();
  }
  return result;
}

uint64_t *_s10RepBackendC12BackendStateOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  sub_100037624(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  return a1;
}

uint64_t *_s10RepBackendC12BackendStateOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v17 = a2[9];
  uint64_t v18 = a2[10];
  sub_100037624(*a2, v4, v5, v6);
  uint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  unint64_t v15 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v17;
  a1[10] = v18;
  sub_10003768C(v12, v13, v14, v15);
  return a1;
}

__n128 _s10RepBackendC12BackendStateOwtk(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s10RepBackendC12BackendStateOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  long long v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v3;
  sub_10003768C(v4, v6, v5, v7);
  return a1;
}

uint64_t _s10RepBackendC12BackendStateOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 20);
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double _s10RepBackendC12BackendStateOwst(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 88) = 1;
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
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = (unint64_t)-a2 << 32;
      double result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100037994(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_1000379B0(uint64_t result)
{
  *(void *)(result + 24) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1000379C0(uint64_t result, uint64_t a2)
{
  if (a2 < 3)
  {
    *(void *)(result + 16) = *(unsigned int *)(result + 16);
    *(void *)(result + 24) = a2 << 62;
  }
  else
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)double result = (a2 - 3);
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(void *)(result + 80) = 0;
    *(void *)(result + 24) = 0xC000000000000000;
  }
  return result;
}

ValueMetadata *_s10RepBackendC12BackendStateOMa()
{
  return &_s10RepBackendC12BackendStateON;
}

ValueMetadata *_s10RepBackendC5FlagsVMa()
{
  return &_s10RepBackendC5FlagsVN;
}

void *sub_100037A1C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100037A28(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100037A30@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100037A44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100037A58@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100037A6C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100037A9C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100037AC8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100037AEC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100037B00(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100037B14(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100037B28@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100037B3C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100037B50(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100037B64(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100037B78()
{
  return *v0 == 0;
}

void *sub_100037B88(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100037B9C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100037BAC(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100037BB8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100037BCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100044C44();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

unint64_t sub_100037C10()
{
  unint64_t result = qword_1000944A0;
  if (!qword_1000944A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000944A0);
  }
  return result;
}

unint64_t sub_100037C68()
{
  unint64_t result = qword_1000944A8;
  if (!qword_1000944A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000944A8);
  }
  return result;
}

unint64_t sub_100037CC0()
{
  unint64_t result = qword_1000944B0;
  if (!qword_1000944B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000944B0);
  }
  return result;
}

unint64_t sub_100037D18()
{
  unint64_t result = qword_1000944B8;
  if (!qword_1000944B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000944B8);
  }
  return result;
}

uint64_t sub_100037D6C(uint64_t a1)
{
  sub_10003E25C(a1, (uint64_t)v7);
  sub_10003E25C(a1, (uint64_t)&v8);
  uint64_t v3 = 0;
  switch(v9 >> 62)
  {
    case 1uLL:
      v9 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v3 = v8;
      swift_retain();
      break;
    case 2uLL:
      v9 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_1000329AC(&v8, (uint64_t)v10);
      uint64_t v3 = 0;
      break;
    case 3uLL:
      break;
    default:
      uint64_t v3 = 0;
      v9 &= 0x3FFFFFFFFFFFFFFFuLL;
      break;
  }
  if (*(void *)(v1 + 72) >> 62 == 1)
  {
    uint64_t v4 = *(void *)(v1 + 48);
    swift_retain();
    if (v3) {
      goto LABEL_7;
    }
    return swift_release();
  }
  uint64_t v4 = 0;
  if (!v3) {
    return swift_release();
  }
LABEL_7:
  if (!v4 || v3 != v4)
  {
    uint64_t v5 = qword_100093120;
    swift_retain();
    if (v5 != -1) {
      swift_once();
    }
    swift_retain();
    sub_10004BB8C(v3);
    swift_release();
    swift_release();
  }
  return swift_release_n();
}

uint64_t sub_100037EDC()
{
  uint64_t v1 = v0;
  uint64_t v52 = sub_10005DED0();
  uint64_t v47 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v46 = v2;
  uint64_t v51 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v3 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + 48);
  unint64_t v6 = 0x8000000000000000;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  switch(*(void *)(v1 + 72) >> 62)
  {
    case 1:
      uint64_t v7 = *(void *)(v5
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription);
      unint64_t v8 = *(void *)(v5
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                     + 8);
      uint64_t v9 = *(void *)(v5
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                     + 16);
      uint64_t v10 = *(void *)(v5
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 24);
      uint64_t v11 = *(void *)(v5
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 32);
      unint64_t v6 = *(unsigned __int8 *)(v5
                              + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                              + 40);
      uint64_t v12 = *(void *)(v5
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 2:
      uint64_t v9 = *(unsigned __int8 *)(v1 + 64);
      unint64_t v8 = *(void *)(v1 + 56);
      sub_100018434(v5, v8, *(unsigned char *)(v1 + 64));
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      unint64_t v6 = 0x4000000000000000;
      uint64_t v7 = v5;
      break;
    case 3:
      break;
    default:
      unint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v7 = 2;
      break;
  }
  unint64_t v48 = v6;
  uint64_t v49 = v9;
  unint64_t v53 = v8;
  uint64_t v54 = v10;
  uint64_t v55 = v11;
  uint64_t v56 = v12;
  v58[0] = v7;
  v58[1] = v8;
  v58[2] = v9;
  v58[3] = v10;
  v58[4] = v11;
  v58[5] = v6;
  v58[6] = v12;
  if (qword_100093018 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v13 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716D0;
  uint64_t v15 = v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  id v16 = v13;
  uint64_t v45 = v15;
  sub_10005DE80();
  uint64_t v17 = v1;
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_10005E760();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v21 = sub_10003E34C();
  *(void *)(inited + 64) = v21;
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v20;
  sub_100016C08((uint64_t)v58, (uint64_t)&v57);
  unint64_t v23 = v48;
  char v22 = v49;
  sub_1000183D4(v7, v53, v49, v54, v55, v48);
  uint64_t v24 = sub_10005E740();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = v21;
  *(void *)(inited + 72) = v24;
  *(void *)(inited + 80) = v25;
  uint64_t v26 = sub_10005E950();
  sub_100022574((uint64_t)v16, (uint64_t)&_mh_execute_header, v26, (uint64_t)"(CoreRE) [%{public}@] new state: %{public}@", 43, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  char v28 = v22;
  unint64_t v29 = v23;
  if (Strong)
  {
    uint64_t v30 = Strong;
    uint64_t v31 = sub_10005E880();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v50, 1, 1, v31);
    uint64_t v32 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v51, v45, v52);
    sub_10005E860();
    uint64_t v45 = v17;
    sub_1000183D4(v7, v53, v22, v54, v55, v23);
    swift_unknownObjectRetain();
    uint64_t v33 = sub_10005E850();
    unint64_t v34 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    unint64_t v35 = (v46 + v34 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v36 = (char *)swift_allocObject();
    *((void *)v36 + 2) = v33;
    *((void *)v36 + 3) = &protocol witness table for MainActor;
    *((void *)v36 + 4) = v30;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v36[v34], v51, v52);
    sub_100016C08((uint64_t)v58, (uint64_t)&v36[v35]);
    sub_1000364B4(v50, (uint64_t)&unk_100093608, (uint64_t)v36);
    swift_unknownObjectRelease();
    uint64_t v17 = v45;
    swift_release();
  }
  sub_100018068(v7, v53, v28, v54, v55, v29);
  uint64_t v37 = v17
      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState;
  uint64_t v38 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState);
  unint64_t v39 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState
                  + 8);
  uint64_t v40 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState
                  + 16);
  uint64_t v41 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState
                  + 24);
  uint64_t v42 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState
                  + 32);
  unint64_t v43 = *(void *)(v17
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState
                  + 40);
  *(_OWORD *)uint64_t v37 = 0u;
  *(_OWORD *)(v37 + 16) = 0u;
  *(void *)(v37 + 32) = 0;
  *(_OWORD *)(v37 + 40) = xmmword_100073BA0;
  return sub_10003E338(v38, v39, v40, v41, v42, v43);
}

uint64_t sub_100038440()
{
  v1[3] = v0;
  sub_10005E860();
  v1[4] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[5] = v3;
  v1[6] = v2;
  return _swift_task_switch(sub_1000384D8, v3, v2);
}

uint64_t sub_1000384D8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24)
                 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_acknowledgeQueue);
  *(void *)(v0 + 56) = v1;
  swift_weakInit();
  return _swift_task_switch(sub_100038554, v1, 0);
}

uint64_t sub_100038554()
{
  sub_10005E900();
  uint64_t v1 = *(void *)(v0 + 56);
  unint64_t v2 = sub_10003E2E0();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  void *v3 = v0;
  v3[1] = sub_100038684;
  uint64_t v4 = *(void *)(v0 + 56);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v3, v1, v2, 0xD000000000000013, 0x800000010006EC10, sub_100033528, v4, (char *)&type metadata for () + 8);
}

uint64_t sub_100038684()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_1000388B0;
  }
  else {
    uint64_t v4 = sub_1000387B0;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000387B0()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = sub_10005E900();
  if (v1)
  {
    uint64_t v5 = v0[7];
    uint64_t v6 = *(void *)(v5 + 120);
    BOOL v7 = __OFSUB__(v6, 1);
    uint64_t v8 = v6 - 1;
    if (v7)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v5 + 120) = v8;
      sub_10002B4B0();
      v0[12] = v1;
      uint64_t v3 = v0[5];
      uint64_t v4 = v0[6];
      uint64_t v2 = (uint64_t)sub_100038B60;
    }
    return _swift_task_switch(v2, v3, v4);
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    v0[10] = v9;
    void *v9 = v0;
    v9[1] = sub_1000388D0;
    return sub_10003CFD0((uint64_t)v9, (uint64_t)(v0 + 2));
  }
}

uint64_t sub_1000388B0()
{
  v0[12] = v0[9];
  return _swift_task_switch(sub_100038B60, v0[5], v0[6]);
}

uint64_t sub_1000388D0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_100038AE0;
  }
  else {
    uint64_t v4 = sub_1000389FC;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000389FC(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[7];
  uint64_t v5 = *(void *)(v4 + 120);
  BOOL v6 = __OFSUB__(v5, 1);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v4 + 120) = v7;
    sub_10002B4B0();
    swift_weakDestroy();
    a2 = v3[5];
    a3 = v3[6];
    a1 = sub_100038A80;
  }
  return _swift_task_switch(a1, a2, a3);
}

uint64_t sub_100038A80()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100038AE0(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[7];
  uint64_t v5 = *(void *)(v4 + 120);
  BOOL v6 = __OFSUB__(v5, 1);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v4 + 120) = v7;
    sub_10002B4B0();
    v3[12] = v3[11];
    a2 = v3[5];
    a3 = v3[6];
    a1 = sub_100038B60;
  }
  return _swift_task_switch(a1, a2, a3);
}

uint64_t sub_100038B60()
{
  swift_release();
  swift_weakDestroy();
  swift_errorRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100038BD8(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  sub_10005E860();
  v2[21] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[22] = v4;
  v2[23] = v3;
  return _swift_task_switch(sub_100038C70, v4, v3);
}

uint64_t sub_100038C70()
{
  if (qword_100093018 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  swift_beginAccess();
  uint64_t v3 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716D0;
  id v5 = v3;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_10005E760();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v9 = sub_10003E34C();
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v8;
  unint64_t v10 = sub_100029464();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = v9;
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = v11;
  uint64_t v12 = sub_10005E950();
  sub_100022574((uint64_t)v5, (uint64_t)&_mh_execute_header, v12, (uint64_t)"(CoreRE) [%{public}@] loadScene(%@)", 35, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  uint64_t v13 = swift_task_alloc();
  v0[24] = v13;
  *(void *)(v13 + 16) = v2;
  *(void *)(v13 + 24) = v1;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[25] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_100038EF0;
  return sub_10003A578((uint64_t)v14, 0x6E65635364616F6CLL, 0xEB00000000292865, dword_100094528);
}

uint64_t sub_100038EF0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = *(void *)(v2 + 184);
    id v5 = sub_100039070;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = *(void *)(v2 + 184);
    id v5 = sub_10003900C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10003900C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100039070()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000390E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[51] = a2;
  v3[52] = a3;
  sub_100015F58(&qword_100094538);
  v3[53] = swift_task_alloc();
  uint64_t v4 = sub_10005DE10();
  v3[54] = v4;
  v3[55] = *(void *)(v4 - 8);
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  v3[59] = swift_task_alloc();
  v3[60] = sub_10005E860();
  v3[61] = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  v3[62] = v6;
  v3[63] = v5;
  return _swift_task_switch(sub_100039230, v6, v5);
}

uint64_t sub_100039230()
{
  uint64_t v1 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440);
  if (*(unsigned char *)(*(void *)(v0 + 408) + 40))
  {
    uint64_t v4 = *(void *)(v0 + 416);
    uint64_t v5 = *(void *)(v0 + 424);
    type metadata accessor for CRLUSDRendering.SceneRequest(0);
    uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v3(v5, v4, v1);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v5, 0, 1, v1);
    sub_10005DDF0();
    sub_10003EC6C(v5, &qword_100094538);
    uint64_t v6 = *(void *)(v0 + 464);
    uint64_t v7 = *(void *)(v0 + 472);
    uint64_t v8 = *(void *)(v0 + 432);
    unint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 440) + 32);
    v9(v6, *(void *)(v0 + 456), v8);
    v9(v7, v6, v8);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v3(*(void *)(v0 + 472), *(void *)(v0 + 416), *(void *)(v0 + 432));
  }
  uint64_t v11 = *(void *)(v0 + 440);
  uint64_t v10 = *(void *)(v0 + 448);
  uint64_t v12 = *(void *)(v0 + 432);
  uint64_t v13 = *(void *)(v0 + 416);
  v3(v10, *(void *)(v0 + 472), v12);
  type metadata accessor for CRLUSDRendering.LoadReceipt(0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_entityLoadRequest) = 0;
  *(void *)(v0 + 512) = v14;
  *(void *)(v14 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_cancellable) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v14 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_url, v10, v12);
  *(void *)(v14 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_entityLoadRequest) = 0;
  swift_release();
  *(void *)(v14 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_cancellable) = 0;
  swift_release();
  uint64_t v15 = v13 + *(int *)(type metadata accessor for CRLUSDRendering.SceneRequest(0) + 24);
  *(_DWORD *)(v0 + 744) = *(_DWORD *)v15;
  uint64_t v16 = *(void *)(v15 + 24);
  *(void *)(v0 + 384) = *(void *)(v15 + 16);
  *(void *)(v0 + 392) = v16;
  *(void *)(v0 + 520) = *(void *)(v15 + 32);
  *(void *)(v0 + 528) = *(void *)(v15 + 40);
  *(void *)(v0 + 536) = *(void *)(v15 + 48);
  *(void *)(v0 + 544) = *(void *)(v15 + 56);
  *(void *)(v0 + 552) = *(void *)(v15 + 64);
  swift_retain();
  *(void *)(v0 + 560) = sub_10005E850();
  uint64_t v18 = sub_10005E800();
  *(void *)(v0 + 568) = v18;
  *(void *)(v0 + 576) = v17;
  return _swift_task_switch(sub_1000395C0, v18, v17);
}

uint64_t sub_1000395C0()
{
  uint64_t v1 = *(void *)(v0 + 552);
  long long v10 = *(_OWORD *)(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  long long v9 = *(_OWORD *)(v0 + 384);
  uint64_t v4 = *(unsigned int *)(v0 + 744);
  uint64_t v5 = *(void *)(v0 + 512);
  uint64_t v6 = *(void *)(v0 + 408);
  sub_10003E25C(v6 + 48, v0 + 16);
  unint64_t v13 = *(void *)(v6 + 56);
  uint64_t v14 = *(void *)(v6 + 48);
  uint64_t v12 = *(void *)(v6 + 64);
  unint64_t v11 = *(void *)(v6 + 72);
  *(void *)(v6 + 48) = v5;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 64) = v4;
  *(void *)(v6 + 72) = 0;
  *(_OWORD *)(v6 + 80) = v9;
  *(void *)(v6 + 96) = v3;
  *(void *)(v6 + 104) = v2;
  *(_OWORD *)(v6 + 112) = v10;
  *(void *)(v6 + 128) = v1;
  swift_retain_n();
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_100037624);
  sub_10003768C(v14, v13, v12, v11);
  sub_100037D6C(v0 + 16);
  swift_release();
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_10003768C);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 584) = v7;
  void *v7 = v0;
  v7[1] = sub_10003977C;
  return sub_100038440();
}

uint64_t sub_10003977C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 576);
  uint64_t v3 = *(void *)(v1 + 568);
  return _swift_task_switch(sub_10003989C, v3, v2);
}

uint64_t sub_10003989C()
{
  swift_release();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 592) = v1;
  void *v1 = v0;
  v1[1] = sub_100039940;
  return sub_10002A150();
}

uint64_t sub_100039940(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 600) = a1;
  *(void *)(v4 + 608) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 504);
  uint64_t v6 = *(void *)(v3 + 496);
  if (v1) {
    uint64_t v7 = sub_10003A4A8;
  }
  else {
    uint64_t v7 = sub_100039A88;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100039A88()
{
  if (qword_100093018 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 408);
  swift_beginAccess();
  uint64_t v2 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716E0;
  id v4 = v2;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_10005E760();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  *(void *)(inited + 64) = sub_10003E34C();
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  uint64_t v8 = sub_10005E950();
  sub_100022574((uint64_t)v4, (uint64_t)&_mh_execute_header, v8, (uint64_t)"(CoreRE) [%{public}@] loadScene(): entity loaded", 48, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  uint64_t v9 = v1[6];
  *(void *)(v0 + 616) = v9;
  unint64_t v10 = v1[7];
  *(void *)(v0 + 624) = v10;
  uint64_t v11 = v1[8];
  *(void *)(v0 + 632) = v11;
  unint64_t v12 = v1[9];
  *(void *)(v0 + 640) = v12;
  uint64_t v13 = v1[10];
  *(void *)(v0 + 648) = v13;
  uint64_t v14 = v1[11];
  *(void *)(v0 + 656) = v14;
  uint64_t v15 = v1[12];
  *(void *)(v0 + 664) = v15;
  uint64_t v16 = v1[13];
  *(void *)(v0 + 672) = v16;
  uint64_t v17 = v1[14];
  *(void *)(v0 + 680) = v17;
  uint64_t v18 = v1[15];
  *(void *)(v0 + 688) = v18;
  uint64_t v19 = v1[16];
  *(void *)(v0 + 696) = v19;
  if (v12 >> 62)
  {
    uint64_t v35 = *(void *)(v0 + 472);
    uint64_t v21 = *(void *)(v0 + 440);
    uint64_t v34 = *(void *)(v0 + 432);
    sub_100037624(v9, v10, v11, v12);
    swift_release();
    swift_release();
    swift_release();
    sub_10003768C(v9, v10, v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v35, v34);
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(v0 + 512);
  *(_DWORD *)(v0 + 288) = v11;
  *(void *)(v0 + 304) = v13;
  *(void *)(v0 + 312) = v14;
  *(void *)(v0 + 320) = v15;
  *(void *)(v0 + 328) = v16;
  *(void *)(v0 + 336) = v17;
  *(void *)(v0 + 344) = v18;
  *(void *)(v0 + 352) = v19;
  if (v20 != v9)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 440) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 432));
    swift_release();
    swift_release();
    swift_release();
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v22 = *(uint64_t (**)(void))(v0 + 8);
LABEL_8:
    return v22();
  }
  char v33 = v11;
  uint64_t v24 = qword_100093120;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = *(void *)(v0 + 608);
  uint64_t v26 = *(void **)(v0 + 600);
  uint64_t v27 = *(void *)(v0 + 408);
  swift_retain();
  uint64_t v28 = sub_10004BFB0(v27, v26, v0 + 288);
  *(void *)(v0 + 704) = v28;
  if (v25)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 440) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 432));
    swift_release();
    sub_10003768C(v9, v10, v33, v12);
    swift_release();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v22 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_8;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)(v0 + 512);
  swift_release();
  *(void *)(v29 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_loadReceipt) = v30;
  swift_retain();
  swift_release();
  swift_retain();
  *(void *)(v0 + 712) = sub_10005E850();
  uint64_t v32 = sub_10005E800();
  *(void *)(v0 + 720) = v32;
  *(void *)(v0 + 728) = v31;
  return _swift_task_switch(sub_10003A024, v32, v31);
}

uint64_t sub_10003A024()
{
  uint64_t v1 = v0[88];
  uint64_t v2 = v0[51];
  sub_10003E25C(v2 + 48, (uint64_t)(v0 + 22));
  unint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 64);
  unint64_t v5 = *(void *)(v2 + 72);
  uint64_t v8 = *(void *)(v2 + 48);
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0x4000000000000000;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(void *)(v2 + 128) = 0;
  *(_OWORD *)(v2 + 112) = 0u;
  swift_retain_n();
  sub_10003E284(v0 + 22, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_100037624);
  sub_10003768C(v8, v3, v4, v5);
  sub_100037D6C((uint64_t)(v0 + 22));
  swift_release();
  sub_10003E284(v0 + 22, (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_10003768C);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[92] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10003A1B0;
  return sub_100038440();
}

uint64_t sub_10003A1B0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 728);
  uint64_t v3 = *(void *)(v1 + 720);
  return _swift_task_switch(sub_10003A2D0, v3, v2);
}

uint64_t sub_10003A2D0()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 496);
  uint64_t v2 = *(void *)(v0 + 504);
  return _swift_task_switch(sub_10003A340, v1, v2);
}

uint64_t sub_10003A340()
{
  unint64_t v1 = v0[80];
  uint64_t v2 = v0[79];
  unint64_t v3 = v0[78];
  uint64_t v4 = v0[77];
  uint64_t v9 = v0[59];
  uint64_t v5 = v0[55];
  uint64_t v8 = v0[54];
  swift_release();
  swift_release();
  swift_release();
  sub_10003768C(v4, v3, v2, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10003A4A8()
{
  uint64_t v1 = v0[59];
  uint64_t v2 = v0[54];
  uint64_t v3 = v0[55];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10003A578(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v5[51] = a3;
  v5[52] = v4;
  v5[50] = a2;
  v5[53] = sub_10005E860();
  v5[54] = sub_10005E850();
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[55] = v8;
  void *v8 = v5;
  v8[1] = sub_10003A684;
  return v10(a1);
}

uint64_t sub_10003A684()
{
  *(void *)(*(void *)v1 + 448) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_10005E800();
  if (v0) {
    uint64_t v4 = sub_10003A840;
  }
  else {
    uint64_t v4 = sub_10003A7DC;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10003A7DC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003A840()
{
  swift_release();
  if (qword_100093018 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 448);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v21 = *(void *)(v0 + 400);
  swift_beginAccess();
  uint64_t v3 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716C0;
  id v22 = v3;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_10005E760();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v8 = sub_10003E34C();
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = v21;
  *(void *)(inited + 80) = v2;
  swift_getErrorValue();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10005ECE0();
  *(void *)(inited + 136) = &type metadata for String;
  *(void *)(inited + 144) = v8;
  *(void *)(inited + 112) = v9;
  *(void *)(inited + 120) = v10;
  uint64_t v11 = sub_10005E960();
  sub_100022574((uint64_t)v22, (uint64_t)&_mh_execute_header, v11, (uint64_t)"(CoreRE) [%{public}@] %{public}@ error: %{public}@", 50, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  *(void *)(v0 + 392) = v1;
  swift_errorRetain();
  sub_100015F58(&qword_100094C00);
  if (swift_dynamicCast())
  {
    uint64_t v12 = *(void *)(v0 + 328);
    unint64_t v13 = *(void *)(v0 + 336);
    unsigned int v14 = *(unsigned __int8 *)(v0 + 344);
  }
  else
  {
    *(void *)(v0 + 368) = *(void *)(v0 + 448);
    swift_errorRetain();
    if (swift_dynamicCast())
    {
      uint64_t v12 = *(void *)(v0 + 352);
      unint64_t v13 = *(void *)(v0 + 360);
      unsigned int v14 = 4;
    }
    else
    {
      swift_getErrorValue();
      uint64_t v12 = sub_10005ECE0();
      unint64_t v13 = v15;
      unsigned int v14 = 2;
    }
  }
  uint64_t v16 = *(void *)(v0 + 416);
  sub_10003E25C(v16 + 48, v0 + 16);
  unint64_t v17 = *(void *)(v16 + 56);
  uint64_t v18 = *(void *)(v16 + 64);
  unint64_t v23 = *(void *)(v16 + 72);
  uint64_t v24 = *(void *)(v16 + 48);
  *(void *)(v16 + 48) = v12;
  *(void *)(v16 + 56) = v13;
  *(void *)(v16 + 64) = v14;
  *(void *)(v16 + 72) = 0x8000000000000000;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(void *)(v16 + 128) = 0;
  *(_OWORD *)(v16 + 112) = 0u;
  sub_100018434(v12, v13, v14);
  sub_100018434(v12, v13, v14);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_100037624);
  sub_10003768C(v24, v17, v18, v23);
  sub_100037D6C(v0 + 16);
  sub_1000180C8(v12, v13, v14);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_10003768C);
  sub_100037EDC();
  sub_1000180C8(v12, v13, v14);
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_10003AC78(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 136) = *(_OWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 328) = *(_DWORD *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(v2 + 120) = *(void *)(a1 + 24);
  *(void *)(v2 + 128) = v1;
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v4;
  *(_OWORD *)(v2 + 152) = v3;
  *(void *)(v2 + 168) = *(void *)(a1 + 64);
  *(void *)(v2 + 176) = sub_10005E860();
  *(void *)(v2 + 184) = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  *(void *)(v2 + 192) = v6;
  *(void *)(v2 + 200) = v5;
  return _swift_task_switch(sub_10003AD38, v6, v5);
}

uint64_t sub_10003AD38()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v1[6];
  v0[26] = v2;
  unint64_t v3 = v1[7];
  v0[27] = v3;
  uint64_t v4 = v1[8];
  v0[28] = v4;
  unint64_t v5 = v1[9];
  v0[29] = v5;
  v0[30] = v1[10];
  v0[31] = v1[11];
  v0[32] = v1[12];
  v0[33] = v1[13];
  v0[34] = v1[14];
  v0[35] = v1[15];
  v0[36] = v1[16];
  if (v5 >> 62 == 1)
  {
    unint64_t v15 = v3;
    uint64_t v8 = v0[13];
    char v16 = v4;
    swift_retain();
    swift_release();
    uint64_t v9 = v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v8;
    long long v10 = *(_OWORD *)(v8 + 16);
    long long v11 = *(_OWORD *)(v8 + 32);
    long long v12 = *(_OWORD *)(v8 + 48);
    *(void *)(v9 + 64) = *(void *)(v8 + 64);
    *(_OWORD *)(v9 + 32) = v11;
    *(_OWORD *)(v9 + 48) = v12;
    *(_OWORD *)(v9 + 16) = v10;
    sub_10003768C(v2, v15, v16, v5);
  }
  else
  {
    if (!(v5 >> 62))
    {
      sub_100037624(v2, v3, v4, v5);
      swift_retain_n();
      v0[37] = sub_10005E850();
      uint64_t v7 = sub_10005E800();
      v0[38] = v7;
      v0[39] = v6;
      return _swift_task_switch(sub_10003AF44, v7, v6);
    }
    swift_release();
  }
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10003AF44()
{
  unint64_t v1 = *(void *)(v0 + 232);
  unint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 144);
  long long v12 = *(_OWORD *)(v0 + 112);
  long long v13 = *(_OWORD *)(v0 + 152);
  uint64_t v8 = *(void *)(v0 + 128);
  uint64_t v9 = *(unsigned int *)(v0 + 328);
  sub_10003E25C(v8 + 48, v0 + 16);
  unint64_t v16 = *(void *)(v8 + 56);
  uint64_t v17 = *(void *)(v8 + 48);
  unint64_t v14 = *(void *)(v8 + 72);
  uint64_t v15 = *(void *)(v8 + 64);
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = v9;
  *(void *)(v8 + 72) = 0;
  *(_OWORD *)(v8 + 80) = v12;
  *(void *)(v8 + 96) = v6;
  *(void *)(v8 + 104) = v7;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 128) = v5;
  sub_100037624(v4, v2, v3, v1);
  sub_100037624(v4, v2, v3, v1);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_100037624);
  sub_10003768C(v17, v16, v15, v14);
  sub_100037D6C(v0 + 16);
  sub_10003768C(v4, v2, v3, v1);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_10003768C);
  long long v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v10;
  void *v10 = v0;
  v10[1] = sub_10003B1E8;
  return sub_100038440();
}

uint64_t sub_10003B1E8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 312);
  uint64_t v3 = *(void *)(v1 + 304);
  return _swift_task_switch(sub_10003B308, v3, v2);
}

uint64_t sub_10003B308()
{
  uint64_t v2 = v0[28];
  unint64_t v1 = v0[29];
  uint64_t v4 = v0[26];
  unint64_t v3 = v0[27];
  swift_release();
  sub_10003768C(v4, v3, v2, v1);
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[25];
  return _swift_task_switch(sub_10003B3D4, v5, v6);
}

uint64_t sub_10003B3D4()
{
  unint64_t v1 = v0[29];
  unint64_t v2 = v0[27];
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[26];
  swift_release();
  sub_10003768C(v4, v2, v3, v1);
  sub_10003768C(v4, v2, v3, v1);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10003B4D0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_10005E860();
  v2[4] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_10003B568, v4, v3);
}

uint64_t sub_10003B568()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[6];
  v0[7] = v2;
  unint64_t v3 = v1[7];
  v0[8] = v3;
  uint64_t v4 = v1[8];
  v0[9] = v4;
  unint64_t v5 = v1[9];
  v0[10] = v5;
  v0[11] = v1[10];
  v0[12] = v1[11];
  v0[13] = v1[12];
  v0[14] = v1[13];
  v0[15] = v1[14];
  v0[16] = v1[15];
  v0[17] = v1[16];
  if (v5 >> 62 == 1)
  {
    uint64_t v6 = *(void *)(v0[2] + 16);
    v0[18] = v6;
    if (v6)
    {
      sub_100037624(v2, v3, v4, v5);
      v0[19] = 0;
      uint64_t v7 = v0[2];
      int v8 = *(unsigned __int8 *)(v7 + 40);
      swift_bridgeObjectRetain();
      switch(v8)
      {
        case 2:
          uint64_t v9 = (void *)swift_task_alloc();
          v0[21] = v9;
          void *v9 = v0;
          v9[1] = sub_10003BAC8;
          uint64_t result = sub_100045E78();
          break;
        case 3:
          unint64_t v14 = (void *)swift_task_alloc();
          v0[22] = v14;
          *unint64_t v14 = v0;
          v14[1] = sub_10003BBE8;
          uint64_t result = sub_1000462A4();
          break;
        case 4:
          uint64_t v15 = (void *)swift_task_alloc();
          v0[24] = v15;
          void *v15 = v0;
          v15[1] = sub_10003BE28;
          uint64_t result = sub_100046CB0();
          break;
        case 5:
          unint64_t v16 = (void *)swift_task_alloc();
          v0[23] = v16;
          *unint64_t v16 = v0;
          v16[1] = sub_10003BD08;
          uint64_t result = sub_100046670();
          break;
        default:
          double v12 = *(double *)(v7 + 32);
          long long v13 = (void *)swift_task_alloc();
          v0[20] = v13;
          void *v13 = v0;
          v13[1] = sub_10003B9A8;
          uint64_t result = sub_1000457A0(v8 & 1, v12);
          break;
      }
      return result;
    }
    unint64_t v17 = v3;
    char v18 = v4;
    swift_retain();
    swift_release();
    sub_10003768C(v2, v17, v18, v5);
  }
  else
  {
    swift_release();
  }
  long long v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10003B9A8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10003EF18, v3, v2);
}

uint64_t sub_10003BAC8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10003EF18, v3, v2);
}

uint64_t sub_10003BBE8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10003EF18, v3, v2);
}

uint64_t sub_10003BD08()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10003EF18, v3, v2);
}

uint64_t sub_10003BE28()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10003BF48, v3, v2);
}

uint64_t sub_10003BF48()
{
  uint64_t v1 = v0[19] + 1;
  if (v1 == v0[18])
  {
    uint64_t v3 = v0[9];
    unint64_t v2 = v0[10];
    uint64_t v5 = v0[7];
    unint64_t v4 = v0[8];
    swift_bridgeObjectRelease();
    swift_release();
    sub_10003768C(v5, v4, v3, v2);
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    v0[19] = v1;
    uint64_t v8 = v0[2] + 16 * v1;
    switch(*(unsigned char *)(v8 + 40))
    {
      case 2:
        uint64_t v9 = (void *)swift_task_alloc();
        v0[21] = v9;
        void *v9 = v0;
        v9[1] = sub_10003BAC8;
        uint64_t result = sub_100045E78();
        break;
      case 3:
        long long v13 = (void *)swift_task_alloc();
        v0[22] = v13;
        void *v13 = v0;
        v13[1] = sub_10003BBE8;
        uint64_t result = sub_1000462A4();
        break;
      case 4:
        unint64_t v14 = (void *)swift_task_alloc();
        v0[24] = v14;
        *unint64_t v14 = v0;
        v14[1] = sub_10003BE28;
        uint64_t result = sub_100046CB0();
        break;
      case 5:
        uint64_t v15 = (void *)swift_task_alloc();
        v0[23] = v15;
        void *v15 = v0;
        v15[1] = sub_10003BD08;
        uint64_t result = sub_100046670();
        break;
      default:
        double v10 = *(double *)(v8 + 32);
        char v11 = *(unsigned char *)(v8 + 40) & 1;
        double v12 = (void *)swift_task_alloc();
        v0[20] = v12;
        void *v12 = v0;
        v12[1] = sub_10003B9A8;
        uint64_t result = sub_1000457A0(v11, v10);
        break;
    }
  }
  return result;
}

uint64_t sub_10003C308(float a1)
{
  *(void *)(v2 + 16) = v1;
  *(float *)(v2 + 160) = a1;
  sub_10005E860();
  *(void *)(v2 + 24) = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v3;
  return _swift_task_switch(sub_10003C3A4, v4, v3);
}

uint64_t sub_10003C3A4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 48) = v1[6];
  *(void *)(v0 + 56) = v1[7];
  *(void *)(v0 + 64) = v1[8];
  unint64_t v2 = v1[9];
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v1[10];
  *(void *)(v0 + 88) = v1[11];
  *(void *)(v0 + 96) = v1[12];
  *(void *)(v0 + 104) = v1[13];
  *(void *)(v0 + 112) = v1[14];
  *(void *)(v0 + 120) = v1[15];
  *(void *)(v0 + 128) = v1[16];
  if (v2 >> 62 == 1)
  {
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v3;
    void *v3 = v0;
    v3[1] = sub_10003C4E8;
    float v4 = *(float *)(v0 + 160);
    return sub_100046F64(v4);
  }
  else
  {
    swift_release();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

uint64_t sub_10003C4E8(uint64_t a1)
{
  float v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v7 = sub_10003C6E4;
  }
  else
  {
    v4[19] = a1;
    uint64_t v5 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v7 = sub_10003C610;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_10003C610()
{
  uint64_t v2 = v0[8];
  unint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  unint64_t v3 = v0[7];
  swift_release();
  sub_10003768C(v4, v3, v2, v1);
  uint64_t v5 = v0[19];
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_10003C6E4()
{
  sub_10003768C(v0[6], v0[7], v0[8], v0[9]);
  swift_release();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10003C770(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v10 - 8);
  double v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [a1 device];
  unint64_t v14 = *(void **)(v4 + 32);
  if (v14)
  {
    uint64_t v32 = a4;
    uint64_t v15 = v14;
    id v16 = [v15 device];
    id v17 = v16;
    if (v16)
    {
      id v18 = [v16 registryID];
      swift_unknownObjectRelease();
    }
    else
    {
      id v18 = 0;
    }
    char v33 = v12;
    uint64_t v34 = v5;
    id v19 = [v13 registryID];
    if (!v17 || v18 != v19) {
      [v15 setDevice:v13];
    }
    uint64_t v20 = &v15[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
    uint64_t v21 = *(void *)&v15[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
    uint64_t v22 = *(void *)&v15[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData + 8];
    id v31 = v13;
    uint64_t v23 = *(void *)&v15[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData + 16];
    uint64_t v24 = *(void **)&v15[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData + 24];
    *(void *)uint64_t v20 = a1;
    *((void *)v20 + 1) = a2;
    a4 = v32;
    *((void *)v20 + 2) = a3;
    *((void *)v20 + 3) = a4;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain_n();
    id v25 = a4;
    sub_10003EB54(v21, v22, v23, v24);
    sub_100055AC8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    double v12 = v33;
    uint64_t v5 = v34;
  }
  uint64_t v26 = sub_10005E880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v12, 1, 1, v26);
  sub_10005E860();
  swift_unknownObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v27 = a4;
  uint64_t v28 = sub_10005E850();
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = v28;
  v29[3] = &protocol witness table for MainActor;
  v29[4] = v5;
  v29[5] = a1;
  v29[6] = a2;
  v29[7] = a3;
  v29[8] = v27;
  sub_100036660((uint64_t)v12, (uint64_t)&unk_100094548, (uint64_t)v29);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_10003CA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  v8[3] = a4;
  v8[8] = sub_10005E860();
  v8[9] = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  v8[10] = v10;
  v8[11] = v9;
  return _swift_task_switch(sub_10003CAC4, v10, v9);
}

uint64_t sub_10003CAC4()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 96) = Strong;
  if (Strong)
  {
    *(void *)(v0 + 104) = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
    *(void *)(v0 + 112) = sub_10005E850();
    uint64_t v3 = sub_10005E800();
    *(void *)(v0 + 120) = v3;
    *(void *)(v0 + 128) = v2;
    return _swift_task_switch(sub_10003CBB4, v3, v2);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10003CBB4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 24) + *(void *)(v0 + 104);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 136) = v3;
  long long v4 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v2;
  *(void *)(v3 + 56) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000935B8 + dword_1000935B8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10003CCB8;
  return v7(0xD00000000000002CLL, 0x800000010006DF80, (uint64_t)sub_100017D38, v3);
}

uint64_t sub_10003CCB8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v5 = sub_10003CEE8;
  }
  else {
    uint64_t v5 = sub_10003CE10;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10003CE10()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return _swift_task_switch(sub_10003CE80, v1, v2);
}

uint64_t sub_10003CE80()
{
  swift_release();
  **(unsigned char **)(v0 + 16) = 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003CEE8()
{
  swift_release();
  swift_errorRelease();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return _swift_task_switch(sub_10003CF64, v1, v2);
}

uint64_t sub_10003CF64()
{
  swift_release();
  **(unsigned char **)(v0 + 16) = 1;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003CFD0(uint64_t a1, uint64_t a2)
{
  v2[83] = a2;
  v2[84] = sub_10005E860();
  v2[85] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  v2[86] = v4;
  v2[87] = v3;
  return _swift_task_switch(sub_10003D070, v4, v3);
}

uint64_t sub_10003D070()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[88] = Strong;
  if (!Strong) {
    goto LABEL_18;
  }
  uint64_t v2 = Strong;
  uint64_t v62 = (uint64_t)(v0 + 54);
  uint64_t v3 = *(void *)(Strong + 48);
  unint64_t v4 = 0x8000000000000000;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  switch(*(void *)(Strong + 72) >> 62)
  {
    case 1:
      uint64_t v11 = v3 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription;
      uint64_t v5 = *(void *)(v3
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription);
      unint64_t v12 = *(void *)(v3
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 8);
      uint64_t v7 = *(void *)(v3
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                     + 16);
      uint64_t v13 = *(void *)(v3
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 24);
      uint64_t v14 = *(void *)(v3
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                      + 32);
      unint64_t v15 = *(unsigned __int8 *)(v3
                               + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                               + 40);
      uint64_t v16 = *(void *)(v11 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v10 = v16;
      uint64_t v9 = v14;
      uint64_t v8 = v13;
      unint64_t v6 = v12;
      unint64_t v4 = v15;
      break;
    case 2:
      uint64_t v7 = *(unsigned __int8 *)(Strong + 64);
      unint64_t v17 = *(void *)(Strong + 56);
      sub_100018434(*(void *)(Strong + 48), v17, *(unsigned char *)(Strong + 64));
      unint64_t v6 = v17;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unint64_t v4 = 0x4000000000000000;
      uint64_t v5 = v3;
      break;
    case 3:
      break;
    default:
      unint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v5 = 2;
      break;
  }
  v0[95] = v10;
  v0[94] = v4;
  v0[93] = v9;
  v0[92] = v8;
  v0[91] = v7;
  v0[90] = v6;
  v0[89] = v5;
  v0[54] = v5;
  v0[55] = v6;
  v0[56] = v7;
  v0[57] = v8;
  v0[58] = v9;
  v0[59] = v4;
  v0[60] = v10;
  uint64_t v18 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState;
  v0[96] = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_lastSentAcknowledgedRenderState;
  unint64_t v64 = v4;
  id v19 = (uint64_t *)(v2 + v18);
  uint64_t v21 = *v19;
  unint64_t v20 = v19[1];
  uint64_t v23 = v19[2];
  uint64_t v22 = v19[3];
  uint64_t v24 = v19[4];
  unint64_t v25 = v19[5];
  uint64_t v26 = v19[6];
  unint64_t v63 = v6;
  uint64_t v61 = v8;
  uint64_t v59 = v24;
  char v60 = v23;
  uint64_t v58 = v22;
  if (v25 >> 1 == 0xFFFFFFFF)
  {
    unint64_t v27 = v6;
    unint64_t v57 = v20;
    unint64_t v28 = v4;
    sub_1000183D4(v5, v6, v7, v8, v9, v4);
    sub_10003E338(v5, v27, v7, v8, v9, v28);
    sub_10003E338(v21, v57, v23, v58, v59, v25);
  }
  else
  {
    v0[44] = v21;
    v0[45] = v20;
    v0[46] = v23;
    v0[47] = v22;
    v0[48] = v24;
    v0[49] = v25;
    v0[50] = v26;
    unint64_t v29 = v20;
    uint64_t v30 = v22;
    sub_1000183D4(v5, v6, v7, v8, v9, v4);
    sub_10003E768(v21, v29, v23, v30, v59, v25);
    char v31 = sub_10002D230(v62, (uint64_t)(v0 + 44));
    sub_10003E338(v21, v29, v60, v58, v59, v25);
    sub_100018068(v5, v63, v7, v8, v9, v64);
    if (v31)
    {
      swift_release();
      sub_100018068(v5, v63, v7, v8, v9, v64);
      goto LABEL_18;
    }
  }
  if (qword_100093018 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v32 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  v0[97] = sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716D0;
  v0[98] = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  id v34 = v32;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_10005E760();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v38 = sub_10003E34C();
  v0[99] = v38;
  *(void *)(inited + 64) = v38;
  *(void *)(inited + 32) = v35;
  *(void *)(inited + 40) = v37;
  sub_100016C08(v62, (uint64_t)(v0 + 64));
  sub_1000183D4(v5, v63, v7, v61, v9, v64);
  uint64_t v39 = sub_10005E740();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = v38;
  *(void *)(inited + 72) = v39;
  *(void *)(inited + 80) = v40;
  uint64_t v41 = sub_10005E950();
  sub_100022574((uint64_t)v34, (uint64_t)&_mh_execute_header, v41, (uint64_t)"(CoreRE) [%{public}@] new state (with acknowledge): %{public}@", 62, 2, inited);
  swift_setDeallocating();
  v0[100] = sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  uint64_t v42 = swift_unknownObjectWeakLoadStrong();
  v0[101] = v42;
  if (v42)
  {
    v0[102] = sub_10005E850();
    uint64_t v44 = sub_10005E800();
    v0[103] = v44;
    v0[104] = v43;
    return _swift_task_switch(sub_10003D68C, v44, v43);
  }
  swift_release();
  uint64_t v45 = v0[95];
  uint64_t v46 = (uint64_t *)(v0[88] + v0[96]);
  uint64_t v47 = *v46;
  unint64_t v48 = v46[1];
  uint64_t v49 = v46[2];
  uint64_t v50 = v46[3];
  uint64_t v51 = v46[4];
  unint64_t v52 = v46[5];
  long long v53 = *(_OWORD *)(v0 + 91);
  long long v54 = *(_OWORD *)(v0 + 93);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)(v0 + 89);
  *((_OWORD *)v46 + 1) = v53;
  *((_OWORD *)v46 + 2) = v54;
  v46[6] = v45;
  sub_10003E338(v47, v48, v49, v50, v51, v52);
LABEL_18:
  swift_release();
  uint64_t v55 = (uint64_t (*)(void))v0[1];
  return v55();
}

uint64_t sub_10003D68C()
{
  uint64_t v1 = v0[101];
  uint64_t v2 = v0[88] + v0[98];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[105] = v3;
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0 + 54;
  unint64_t v6 = (char *)&dword_1000935B8 + dword_1000935B8;
  unint64_t v4 = (void *)swift_task_alloc();
  v0[106] = v4;
  void *v4 = v0;
  v4[1] = sub_10003D798;
  return ((uint64_t (*)(unint64_t, unint64_t, void (*)(id *, uint64_t), void *))v6)(0xD00000000000002DLL, 0x800000010006DFB0, sub_100018048, v3);
}

uint64_t sub_10003D798()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 856) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 832);
  uint64_t v4 = *(void *)(v2 + 824);
  if (v0) {
    uint64_t v5 = sub_10003DA0C;
  }
  else {
    uint64_t v5 = sub_10003D8F0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10003D8F0()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 696);
  uint64_t v2 = *(void *)(v0 + 688);
  return _swift_task_switch(sub_10003D964, v2, v1);
}

uint64_t sub_10003D964()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 760);
  uint64_t v2 = (uint64_t *)(*(void *)(v0 + 704) + *(void *)(v0 + 768));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  long long v9 = *(_OWORD *)(v0 + 728);
  long long v10 = *(_OWORD *)(v0 + 744);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v0 + 712);
  *((_OWORD *)v2 + 1) = v9;
  *((_OWORD *)v2 + 2) = v10;
  v2[6] = v1;
  sub_10003E338(v3, v4, v5, v6, v7, v8);
  swift_release();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_10003DA0C()
{
  unint64_t v1 = v0[94];
  uint64_t v2 = v0[93];
  uint64_t v3 = v0[92];
  uint64_t v4 = v0[91];
  unint64_t v5 = v0[90];
  uint64_t v6 = v0[89];
  swift_release();
  swift_unknownObjectRelease();
  sub_100018068(v6, v5, v4, v3, v2, v1);
  uint64_t v7 = v0[87];
  uint64_t v8 = v0[86];
  return _swift_task_switch(sub_10003DAD4, v8, v7);
}

uint64_t sub_10003DAD4()
{
  uint64_t v1 = *(void *)(v0 + 856);
  uint64_t v2 = *(void *)(v0 + 792);
  swift_release();
  uint64_t v3 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716D0;
  id v5 = v3;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_10005E760();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  *(void *)(inited + 64) = v2;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v8;
  swift_getErrorValue();
  uint64_t v9 = sub_10005ECE0();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = v2;
  *(void *)(inited + 72) = v9;
  *(void *)(inited + 80) = v10;
  uint64_t v11 = sub_10005E950();
  sub_100022574((uint64_t)v5, (uint64_t)&_mh_execute_header, v11, (uint64_t)"(CoreRE) [%{public}@] error sending state: %{public}@", 53, 2, inited);
  swift_setDeallocating();
  swift_arrayDestroy();

  *(void *)(v0 + 632) = v1;
  swift_errorRetain();
  sub_100015F58(&qword_100094C00);
  if (swift_dynamicCast())
  {
    uint64_t v12 = *(void *)(v0 + 592);
    unint64_t v13 = *(void *)(v0 + 600);
    unsigned int v14 = *(unsigned __int8 *)(v0 + 608);
  }
  else
  {
    *(void *)(v0 + 640) = *(void *)(v0 + 856);
    swift_errorRetain();
    if (swift_dynamicCast())
    {
      uint64_t v12 = *(void *)(v0 + 616);
      unint64_t v13 = *(void *)(v0 + 624);
      unsigned int v14 = 4;
    }
    else
    {
      swift_getErrorValue();
      uint64_t v12 = sub_10005ECE0();
      unint64_t v13 = v15;
      unsigned int v14 = 2;
    }
  }
  uint64_t v16 = *(void *)(v0 + 704);
  sub_10003E25C(v16 + 48, v0 + 16);
  unint64_t v17 = *(void *)(v16 + 56);
  uint64_t v18 = *(void *)(v16 + 64);
  unint64_t v21 = *(void *)(v16 + 72);
  uint64_t v22 = *(void *)(v16 + 48);
  *(void *)(v16 + 48) = v12;
  *(void *)(v16 + 56) = v13;
  *(void *)(v16 + 64) = v14;
  *(void *)(v16 + 72) = 0x8000000000000000;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(void *)(v16 + 128) = 0;
  *(_OWORD *)(v16 + 112) = 0u;
  sub_100018434(v12, v13, v14);
  sub_100018434(v12, v13, v14);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_100037624);
  sub_10003768C(v22, v17, v18, v21);
  sub_100037D6C(v0 + 16);
  sub_1000180C8(v12, v13, v14);
  sub_10003E284((void *)(v0 + 16), (void (*)(void, void, void, void, void, void, void, void, void, void, void))sub_10003768C);
  sub_100037EDC();
  sub_1000180C8(v12, v13, v14);
  swift_release();
  swift_errorRelease();
  id v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_10003DE98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  uint64_t v4 = sub_10005DED0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10003DF0C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100019FC8;
  return sub_100038BD8(a1);
}

uint64_t sub_10003DFA0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100018B00;
  return sub_10003AC78(a1);
}

uint64_t sub_10003E034(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100019FC8;
  return sub_10003B4D0(a1);
}

uint64_t sub_10003E0C8(float a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10003E15C;
  return sub_10003C308(a1);
}

uint64_t sub_10003E15C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10003E25C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(void *)(a2 + 80) = *(void *)(a1 + 80);
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 64) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  return a2;
}

void *sub_10003E284(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

unint64_t sub_10003E2E0()
{
  unint64_t result = qword_100094098;
  if (!qword_100094098)
  {
    type metadata accessor for CRLUSDRendering.TaskQueue();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100094098);
  }
  return result;
}

uint64_t sub_10003E338(uint64_t result, unint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a6 >> 1 != 0xFFFFFFFF) {
    return sub_100018068(result, a2, a3, a4, a5, a6);
  }
  return result;
}

unint64_t sub_10003E34C()
{
  unint64_t result = qword_100095400;
  if (!qword_100095400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100095400);
  }
  return result;
}

uint64_t sub_10003E3A0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10003E47C;
  return v6(a1);
}

uint64_t sub_10003E47C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10003E574(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  long long v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_10003E654;
  return v5(v2 + 32);
}

uint64_t sub_10003E654()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10003E768(uint64_t result, unint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a6 >> 1 != 0xFFFFFFFF) {
    return sub_1000183D4(result, a2, a3, a4, a5, a6);
  }
  return result;
}

uint64_t sub_10003E77C()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 0xF;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_100018068(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8), *(void *)(v0 + v6 + 16), *(void *)(v0 + v6 + 24), *(void *)(v0 + v6 + 32), *(void *)(v0 + v6 + 40));

  return _swift_deallocObject(v0, v6 + 56, v5);
}

uint64_t sub_10003E87C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003E8B4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100019FC8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100094508 + dword_100094508);
  return v6(a1, v4);
}

uint64_t sub_10003E96C(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_100018B00;
  return sub_1000390E0(a1, v5, v4);
}

uint64_t sub_10003EA18()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10003EA78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100019FC8;
  return sub_10003CA20(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_10003EB54(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_10003EBB4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100019FC8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100094550 + dword_100094550);
  return v6(a1, v4);
}

uint64_t sub_10003EC6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100015F58(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003ECC8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void *sub_10003ED00()
{
  return sub_100036BE4();
}

unint64_t sub_10003ED08()
{
  unint64_t result = qword_100094570;
  if (!qword_100094570)
  {
    sub_100016310(&qword_100094568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100094570);
  }
  return result;
}

uint64_t sub_10003ED68()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100019FC8;
  return sub_100036EBC();
}

uint64_t sub_10003EE20()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003EE60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100019FC8;
  return sub_100037368(a1, v4, v5, v6);
}

uint64_t sub_10003EF20@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100044C48(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_10003EF60()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v4 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v39 = v3;
    uint64_t v40 = result;
    uint64_t v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v43 = v1;
    uint64_t v8 = v0[6];
    unint64_t v9 = v0[7];
    uint64_t v10 = v0[8];
    unint64_t v11 = v0[9];
    unint64_t v12 = 0x8000000000000000;
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v41 = v6;
    switch(v11 >> 62)
    {
      case 1uLL:
        uint64_t v38 = v2;
        uint64_t v19 = v0[13];
        unint64_t v36 = v0[12];
        uint64_t v37 = v19;
        char v20 = v10;
        uint64_t v35 = v8;
        sub_100042D20(v8, v9, v10, v11);
        swift_retain();
        sub_10005E620();
        swift_release();
        uint64_t v2 = v38;
        uint64_t v6 = v41;
        sub_100042E0C(v35, v9, v20, v11);
        uint64_t v13 = v44;
        unint64_t v14 = v45;
        uint64_t v15 = v46;
        uint64_t v16 = v47;
        uint64_t v17 = v48;
        unint64_t v12 = v49;
        uint64_t v18 = v50;
        break;
      case 2uLL:
        uint64_t v15 = v10;
        uint64_t v13 = v8;
        sub_100018434(v8, v9, v10);
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unint64_t v12 = 0x4000000000000000;
        unint64_t v14 = v9;
        break;
      case 3uLL:
        break;
      default:
        unint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v13 = 2;
        break;
    }
    uint64_t v44 = v13;
    unint64_t v45 = v14;
    uint64_t v46 = v15;
    uint64_t v47 = v16;
    uint64_t v48 = v17;
    unint64_t v49 = v12;
    uint64_t v50 = v18;
    unint64_t v21 = (char *)v0 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering13ARViewBackend_uuid;
    unint64_t v22 = v12;
    uint64_t v37 = v16;
    uint64_t v38 = v17;
    uint64_t v23 = v17;
    unint64_t v36 = v14;
    uint64_t v24 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v42, v21, v43);
    sub_10005E860();
    uint64_t v25 = v40;
    swift_unknownObjectRetain();
    unint64_t v26 = v14;
    char v27 = v15;
    char v28 = v15;
    unint64_t v29 = v22;
    sub_1000183D4(v13, v26, v27, v16, v23, v22);
    uint64_t v30 = sub_10005E850();
    unint64_t v31 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    unint64_t v32 = (v39 + v31 + 15) & 0xFFFFFFFFFFFFFFF0;
    char v33 = (char *)swift_allocObject();
    *((void *)v33 + 2) = v30;
    *((void *)v33 + 3) = &protocol witness table for MainActor;
    *((void *)v33 + 4) = v25;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v33[v31], v42, v43);
    sub_100016C08((uint64_t)&v44, (uint64_t)&v33[v32]);
    sub_1000364B4((uint64_t)v41, (uint64_t)&unk_100094910, (uint64_t)v33);
    swift_unknownObjectRelease();
    swift_release();
    return sub_100018068(v13, v36, v28, v37, v38, v29);
  }
  return result;
}

uint64_t sub_10003F360(uint64_t a1)
{
  v2[52] = a1;
  v2[53] = v1;
  sub_100015F58(&qword_100094538);
  v2[54] = swift_task_alloc();
  uint64_t v3 = sub_10005DE10();
  v2[55] = v3;
  v2[56] = *(void *)(v3 - 8);
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  sub_10005E860();
  v2[61] = sub_10005E850();
  uint64_t v5 = sub_10005E800();
  v2[62] = v5;
  v2[63] = v4;
  return _swift_task_switch(sub_10003F4AC, v5, v4);
}

uint64_t sub_10003F4AC()
{
  if (qword_100093018 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[53];
  swift_beginAccess();
  uint64_t v2 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  v0[64] = sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716E0;
  id v4 = v2;
  unint64_t v5 = sub_100029464();
  uint64_t v7 = v6;
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v8 = sub_10003E34C();
  v0[65] = v8;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  uint64_t v9 = sub_10005E950();
  sub_100022574((uint64_t)v4, (uint64_t)&_mh_execute_header, v9, (uint64_t)"(ARViewBackend) loadScene(%@)", 29, 2, inited);
  swift_setDeallocating();
  v0[66] = sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  uint64_t v10 = v0[55];
  uint64_t v11 = v0[56];
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v13 = v0[54];
    uint64_t v14 = v0[52];
    type metadata accessor for CRLUSDRendering.SceneRequest(0);
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v12(v13, v14, v10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_10005DDF0();
    sub_100044F50(v13);
    uint64_t v16 = v0[59];
    uint64_t v15 = v0[60];
    uint64_t v17 = v0[55];
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[56] + 32);
    v18(v16, v0[58], v17);
    v18(v15, v16, v17);
  }
  else
  {
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v12(v0[60], v0[52], v0[55]);
  }
  uint64_t v20 = v0[56];
  uint64_t v19 = v0[57];
  uint64_t v21 = v0[55];
  uint64_t v23 = v0[52];
  uint64_t v22 = v0[53];
  v12(v19, v0[60], v21);
  type metadata accessor for CRLUSDRendering.LoadReceipt(0);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_entityLoadRequest) = 0;
  v0[67] = v24;
  *(void *)(v24 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_cancellable) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v24 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_url, v19, v21);
  *(void *)(v24 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_entityLoadRequest) = 0;
  swift_release();
  *(void *)(v24 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering11LoadReceipt_cancellable) = 0;
  swift_release();
  uint64_t v25 = type metadata accessor for CRLUSDRendering.SceneRequest(0);
  v0[68] = v25;
  unint64_t v26 = (unsigned int *)(v23 + *(int *)(v25 + 24));
  uint64_t v27 = *v26;
  uint64_t v29 = *((void *)v26 + 2);
  uint64_t v28 = *((void *)v26 + 3);
  uint64_t v30 = *((void *)v26 + 8);
  unint64_t v31 = *(void *)(v22 + 56);
  uint64_t v32 = *(void *)(v22 + 64);
  unint64_t v33 = *(void *)(v22 + 72);
  uint64_t v38 = *(void *)(v22 + 48);
  long long v34 = *((_OWORD *)v26 + 2);
  long long v35 = *((_OWORD *)v26 + 3);
  *(void *)(v22 + 48) = v24;
  *(void *)(v22 + 56) = 0;
  *(void *)(v22 + 64) = v27;
  *(void *)(v22 + 72) = 0;
  *(void *)(v22 + 80) = v29;
  *(void *)(v22 + 88) = v28;
  *(_OWORD *)(v22 + 96) = v34;
  *(_OWORD *)(v22 + 112) = v35;
  *(void *)(v22 + 128) = v30;
  swift_retain_n();
  sub_100042E0C(v38, v31, v32, v33);
  sub_10003EF60();
  swift_release();
  unint64_t v36 = (void *)swift_task_alloc();
  v0[69] = v36;
  *unint64_t v36 = v0;
  v36[1] = sub_10003FBD4;
  return sub_10002A150();
}

uint64_t sub_10003FBD4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 560) = a1;
  *(void *)(v4 + 568) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 504);
  uint64_t v6 = *(void *)(v3 + 496);
  if (v1) {
    uint64_t v7 = sub_100040200;
  }
  else {
    uint64_t v7 = sub_10003FD1C;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_10003FD1C()
{
  uint64_t v1 = *(void **)(v0 + 424);
  swift_release();
  id v2 = (id)static OS_os_log.crlThreeDimensionalObjects;
  uint64_t v3 = sub_10005E950();
  sub_100022574((uint64_t)v2, (uint64_t)&_mh_execute_header, v3, (uint64_t)"(ARViewBackend) loadScene(): entity loaded", 42, 2, (uint64_t)_swiftEmptyArrayStorage);

  uint64_t v5 = v1[6];
  unint64_t v4 = v1[7];
  uint64_t v7 = v1[8];
  unint64_t v6 = v1[9];
  uint64_t v8 = v1[10];
  uint64_t v9 = v1[11];
  uint64_t v11 = v1[12];
  uint64_t v10 = v1[13];
  uint64_t v12 = v1[14];
  uint64_t v13 = v1[15];
  uint64_t v14 = v1[16];
  if (v6 >> 62)
  {
    uint64_t v43 = *(void *)(v0 + 480);
    uint64_t v16 = *(void *)(v0 + 448);
    uint64_t v42 = *(void *)(v0 + 440);
    unint64_t v17 = v1[7];
    unint64_t v18 = v6;
    sub_100042D20(v5, v4, v7, v6);
    swift_release();
    swift_release();
    sub_100042E0C(v5, v17, v7, v18);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v43, v42);
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 536);
    *(_DWORD *)(v0 + 16) = v7;
    *(void *)(v0 + 32) = v8;
    *(void *)(v0 + 40) = v9;
    *(void *)(v0 + 48) = v11;
    *(void *)(v0 + 56) = v10;
    *(void *)(v0 + 64) = v12;
    *(void *)(v0 + 72) = v13;
    *(void *)(v0 + 80) = v14;
    if (v15 == v5)
    {
      uint64_t v35 = v15;
      uint64_t v41 = *(void *)(v0 + 480);
      uint64_t v39 = *(void *)(v0 + 448);
      uint64_t v40 = *(void *)(v0 + 440);
      uint64_t v19 = *(void *)(v0 + 424);
      uint64_t v20 = (double *)(*(void *)(v0 + 416) + *(int *)(*(void *)(v0 + 544) + 28));
      double v21 = *v20;
      double v22 = v20[1];
      double v23 = v20[2];
      double v24 = v20[3];
      unint64_t v36 = v4;
      unint64_t v25 = v4;
      char v37 = v7;
      unint64_t v38 = v6;
      unint64_t v26 = v6;
      _s13ARViewBackendC17ARViewCoordinatorCMa();
      swift_allocObject();
      sub_100042D20(v5, v25, v7, v26);
      uint64_t v27 = swift_retain();
      uint64_t v28 = sub_100043998(v27, v0 + 16, v21, v22, v23, v24);
      swift_release();
      *(void *)(v0 + 392) = *(void *)(v28 + 168);
      swift_allocObject();
      swift_weakInit();
      swift_retain();
      sub_100015F58(&qword_100094918);
      sub_100044EF4();
      sub_10005E680();
      swift_release();
      swift_release();
      sub_10005E5F0();
      swift_release();
      uint64_t v30 = *(void *)(v19 + 48);
      unint64_t v29 = *(void *)(v19 + 56);
      uint64_t v31 = *(void *)(v19 + 64);
      unint64_t v34 = *(void *)(v19 + 72);
      *(void *)(v19 + 48) = v35;
      *(void *)(v19 + 56) = v28;
      *(void *)(v19 + 64) = &_swiftEmptySetSingleton;
      *(void *)(v19 + 72) = 0x4000000000000000;
      *(_OWORD *)(v19 + 80) = 0u;
      *(_OWORD *)(v19 + 96) = 0u;
      *(_OWORD *)(v19 + 112) = 0u;
      *(void *)(v19 + 128) = 0;
      swift_retain_n();
      swift_retain_n();
      swift_bridgeObjectRetain();
      sub_100042E0C(v30, v29, v31, v34);
      sub_10003EF60();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_release();
      sub_100042E0C(v5, v36, v37, v38);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 448) + 8))(*(void *)(v0 + 480), *(void *)(v0 + 440));
      swift_release();
      swift_release();
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_100040200()
{
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 448);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = *(void *)(v0 + 568);
  uint64_t v5 = *(void *)(v0 + 520);
  unint64_t v6 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716E0;
  swift_getErrorValue();
  id v8 = v6;
  uint64_t v9 = sub_10005ECE0();
  *(void *)(inited + 56) = &type metadata for String;
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v10;
  uint64_t v11 = sub_10005E960();
  sub_100022574((uint64_t)v8, (uint64_t)&_mh_execute_header, v11, (uint64_t)"(ARViewBackend) loadScene() error: %{public}@", 45, 2, inited);
  swift_setDeallocating();
  swift_arrayDestroy();

  *(void *)(v0 + 384) = v4;
  swift_errorRetain();
  sub_100015F58(&qword_100094C00);
  if (swift_dynamicCast())
  {
    uint64_t v12 = *(void *)(v0 + 328);
    unint64_t v13 = *(void *)(v0 + 336);
    unsigned int v14 = *(unsigned __int8 *)(v0 + 344);
  }
  else
  {
    *(void *)(v0 + 368) = v4;
    swift_errorRetain();
    if (swift_dynamicCast())
    {
      uint64_t v12 = *(void *)(v0 + 352);
      unint64_t v13 = *(void *)(v0 + 360);
      unsigned int v14 = 4;
    }
    else
    {
      swift_getErrorValue();
      uint64_t v12 = sub_10005ECE0();
      unint64_t v13 = v15;
      unsigned int v14 = 2;
    }
  }
  uint64_t v16 = *(void *)(v0 + 424);
  uint64_t v17 = *(void *)(v16 + 48);
  unint64_t v18 = *(void *)(v16 + 56);
  uint64_t v20 = *(void *)(v16 + 64);
  unint64_t v19 = *(void *)(v16 + 72);
  *(void *)(v16 + 48) = v12;
  *(void *)(v16 + 56) = v13;
  *(void *)(v16 + 64) = v14;
  *(void *)(v16 + 72) = 0x8000000000000000;
  *(void *)(v16 + 128) = 0;
  *(_OWORD *)(v16 + 96) = 0u;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  sub_100018434(v12, v13, v14);
  sub_100042E0C(v17, v18, v20, v19);
  sub_10003EF60();
  sub_1000180C8(v12, v13, v14);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_100040520()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100040AD4();
    return swift_release();
  }
  return result;
}

uint64_t sub_100040578(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  *(_DWORD *)(v2 + 96) = *(_DWORD *)a1;
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(v2 + 16) = *(void *)(a1 + 16);
  *(void *)(v2 + 24) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v4;
  *(void *)(v2 + 80) = *(void *)(a1 + 64);
  sub_10005E860();
  *(void *)(v2 + 88) = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  return _swift_task_switch(sub_100040630, v6, v5);
}

uint64_t sub_100040630()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  unint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v1 + 64);
  unint64_t v5 = *(void *)(v1 + 72);
  if (v5 >> 62 == 1)
  {
    uint64_t v13 = *(void *)(v0 + 32);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)v13;
    long long v14 = *(_OWORD *)(v13 + 16);
    long long v15 = *(_OWORD *)(v13 + 32);
    long long v16 = *(_OWORD *)(v13 + 48);
    *(void *)(v3 + 80) = *(void *)(v13 + 64);
    *(_OWORD *)(v3 + 48) = v15;
    *(_OWORD *)(v3 + 64) = v16;
    *(_OWORD *)(v3 + 32) = v14;
    sub_100042D20(v2, v3, v4, v5);
    swift_retain();
    sub_100041C2C();
    swift_release();
    sub_100042E0C(v2, v3, v4, v5);
  }
  else if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v7 = *(void *)(v0 + 24);
    uint64_t v9 = *(unsigned int *)(v0 + 96);
    long long v10 = *(_OWORD *)(v0 + 48);
    long long v11 = *(_OWORD *)(v0 + 64);
    *(void *)(v1 + 56) = 0;
    *(void *)(v1 + 64) = v9;
    *(void *)(v1 + 72) = 0;
    *(void *)(v1 + 80) = v8;
    *(void *)(v1 + 88) = v7;
    *(_OWORD *)(v1 + 96) = v10;
    *(_OWORD *)(v1 + 112) = v11;
    *(void *)(v1 + 128) = v6;
    sub_100042D20(v2, v3, v4, v5);
    sub_100042D20(v2, v3, v4, v5);
    uint64_t v12 = swift_retain_n();
    sub_100042E0C(v12, v3, v4, v5);
    sub_10003EF60();
    sub_100042E0C(v2, v3, v4, v5);
    sub_100042E0C(v2, v3, v4, v5);
    swift_release();
  }
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_100040910(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_10005E860();
  v2[4] = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  return _swift_task_switch(sub_1000409A8, v4, v3);
}

uint64_t sub_1000409A8()
{
  uint64_t v1 = v0[3];
  swift_release();
  if (*(void *)(v1 + 72) >> 62 == 1)
  {
    uint64_t v2 = *(void *)(v0[2] + 16);
    swift_retain();
    if (v2)
    {
      uint64_t v3 = (unsigned char *)(swift_bridgeObjectRetain() + 40);
      do
      {
        switch(*v3)
        {
          case 2:
            sub_100041370();
            break;
          case 3:
            sub_100041388();
            break;
          case 4:
            sub_1000419F8();
            break;
          case 5:
            sub_1000415E0();
            break;
          default:
            sub_100040ED4();
            break;
        }
        v3 += 16;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
    }
    swift_release();
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100040AD4()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v4 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v39 = v3;
    uint64_t v40 = result;
    uint64_t v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v43 = v1;
    uint64_t v8 = v0[6];
    unint64_t v9 = v0[7];
    uint64_t v10 = v0[8];
    unint64_t v11 = v0[9];
    unint64_t v12 = 0x8000000000000000;
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v41 = v6;
    switch(v11 >> 62)
    {
      case 1uLL:
        uint64_t v38 = v2;
        uint64_t v19 = v0[13];
        unint64_t v36 = v0[12];
        uint64_t v37 = v19;
        char v20 = v10;
        uint64_t v35 = v8;
        sub_100042D20(v8, v9, v10, v11);
        swift_retain();
        sub_10005E620();
        swift_release();
        uint64_t v2 = v38;
        uint64_t v6 = v41;
        sub_100042E0C(v35, v9, v20, v11);
        uint64_t v13 = v44;
        unint64_t v14 = v45;
        uint64_t v15 = v46;
        uint64_t v16 = v47;
        uint64_t v17 = v48;
        unint64_t v12 = v49;
        uint64_t v18 = v50;
        break;
      case 2uLL:
        uint64_t v15 = v10;
        uint64_t v13 = v8;
        sub_100018434(v8, v9, v10);
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unint64_t v12 = 0x4000000000000000;
        unint64_t v14 = v9;
        break;
      case 3uLL:
        break;
      default:
        unint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v13 = 2;
        break;
    }
    uint64_t v44 = v13;
    unint64_t v45 = v14;
    uint64_t v46 = v15;
    uint64_t v47 = v16;
    uint64_t v48 = v17;
    unint64_t v49 = v12;
    uint64_t v50 = v18;
    double v21 = (char *)v0 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering13ARViewBackend_uuid;
    unint64_t v22 = v12;
    uint64_t v37 = v16;
    uint64_t v38 = v17;
    uint64_t v23 = v17;
    unint64_t v36 = v14;
    uint64_t v24 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v42, v21, v43);
    sub_10005E860();
    uint64_t v25 = v40;
    swift_unknownObjectRetain();
    unint64_t v26 = v14;
    char v27 = v15;
    char v28 = v15;
    unint64_t v29 = v22;
    sub_1000183D4(v13, v26, v27, v16, v23, v22);
    uint64_t v30 = sub_10005E850();
    unint64_t v31 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    unint64_t v32 = (v39 + v31 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v33 = (char *)swift_allocObject();
    *((void *)v33 + 2) = v30;
    *((void *)v33 + 3) = &protocol witness table for MainActor;
    *((void *)v33 + 4) = v25;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v33[v31], v42, v43);
    sub_100016C08((uint64_t)&v44, (uint64_t)&v33[v32]);
    sub_1000364B4((uint64_t)v41, (uint64_t)&unk_100093608, (uint64_t)v33);
    swift_unknownObjectRelease();
    swift_release();
    return sub_100018068(v13, v36, v28, v37, v38, v29);
  }
  return result;
}

uint64_t sub_100040ED4()
{
  uint64_t v1 = (void *)(v0 + 176);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v39 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & v3;
  int64_t v40 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v41 = v0;
  uint64_t v42 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_23;
    }
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_44;
    }
    if (v11 >= v40) {
      break;
    }
    unint64_t v12 = *(void *)(v39 + 8 * v11);
    ++v7;
    if (!v12)
    {
      int64_t v7 = v11 + 1;
      if (v11 + 1 >= v40) {
        break;
      }
      unint64_t v12 = *(void *)(v39 + 8 * v7);
      if (!v12)
      {
        int64_t v7 = v11 + 2;
        if (v11 + 2 >= v40) {
          break;
        }
        unint64_t v12 = *(void *)(v39 + 8 * v7);
        if (!v12)
        {
          int64_t v13 = v11 + 3;
          if (v13 >= v40) {
            break;
          }
          unint64_t v12 = *(void *)(v39 + 8 * v13);
          if (!v12)
          {
            while (1)
            {
              int64_t v7 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_46;
              }
              if (v7 >= v40) {
                goto LABEL_40;
              }
              unint64_t v12 = *(void *)(v39 + 8 * v7);
              ++v13;
              if (v12) {
                goto LABEL_22;
              }
            }
          }
          int64_t v7 = v13;
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
LABEL_23:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v42 + 48) + v14);
    uint64_t v16 = v15[1];
    uint64_t v45 = *v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v42 + 56) + v14);
    uint64_t v18 = *v17;
    if (!v17[1])
    {
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_29:
      unint64_t v43 = v6;
      int64_t v44 = v7;
      sub_10005E0B0();
      uint64_t v19 = sub_10005E410();
      char v20 = v1;
      swift_beginAccess();
      swift_retain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v22 = *(void **)(v41 + 176);
      *(void *)(v41 + 176) = 0x8000000000000000;
      unint64_t v24 = sub_10002B70C(v45, v16);
      uint64_t v25 = v22[2];
      BOOL v26 = (v23 & 1) == 0;
      uint64_t v27 = v25 + v26;
      if (__OFADD__(v25, v26))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        uint64_t result = sub_10005EC90();
        __break(1u);
        return result;
      }
      char v28 = v23;
      if (v22[3] < v27)
      {
        sub_1000516F4(v27, isUniquelyReferenced_nonNull_native);
        unint64_t v29 = sub_10002B70C(v45, v16);
        if ((v28 & 1) != (v30 & 1)) {
          goto LABEL_47;
        }
        unint64_t v24 = v29;
        if ((v28 & 1) == 0) {
          goto LABEL_36;
        }
LABEL_4:
        uint64_t v8 = (void *)(v22[7] + 16 * v24);
        swift_release();
        swift_release();
        void *v8 = v18;
        v8[1] = v19;
LABEL_5:
        uint64_t v1 = v20;
        *char v20 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        swift_release();
        swift_release();
        unint64_t v6 = v43;
        int64_t v7 = v44;
        goto LABEL_6;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v23) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_100053430();
        if (v28) {
          goto LABEL_4;
        }
      }
LABEL_36:
      v22[(v24 >> 6) + 8] |= 1 << v24;
      unint64_t v31 = (uint64_t *)(v22[6] + 16 * v24);
      *unint64_t v31 = v45;
      v31[1] = v16;
      unint64_t v32 = (void *)(v22[7] + 16 * v24);
      *unint64_t v32 = v18;
      v32[1] = v19;
      uint64_t v33 = v22[2];
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (v34) {
        goto LABEL_45;
      }
      v22[2] = v35;
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if ((sub_10005E1E0() & 1) == 0) {
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
    if (sub_10005E260()) {
      sub_10005E250();
    }
    swift_release();
LABEL_6:
    swift_release();
  }
LABEL_40:
  swift_release();
  uint64_t v36 = swift_bridgeObjectRetain();
  sub_1000436DC(v36);
  swift_bridgeObjectRelease();
  id v37 = [*(id *)(v41 + 88) superview];
  if (v37) {

  }
  sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  sub_10005E610();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100041370()
{
  return sub_1000413A0((void (*)(void))&dispatch thunk of AnimationPlaybackController.pause());
}

uint64_t sub_100041388()
{
  return sub_1000413A0((void (*)(void))&dispatch thunk of AnimationPlaybackController.resume());
}

uint64_t sub_1000413A0(void (*a1)(void))
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 176);
  uint64_t v4 = v3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v3 + 56) + 16 * v12 + 8))
    {
      swift_retain();
      swift_retain();
      if (sub_10005E1E0()) {
        a1();
      }
      swift_release();
      uint64_t result = swift_release();
    }
  }
  int64_t v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  if (v13 >= v8) {
    goto LABEL_24;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v10;
  if (v14) {
    goto LABEL_20;
  }
  int64_t v10 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_24;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_20;
  }
  int64_t v10 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_24;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_20:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_21;
  }
  int64_t v15 = v13 + 3;
  if (v15 < v8)
  {
    unint64_t v14 = *(void *)(v4 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v10 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_28;
        }
        if (v10 >= v8) {
          goto LABEL_24;
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        ++v15;
        if (v14) {
          goto LABEL_20;
        }
      }
    }
    int64_t v10 = v15;
    goto LABEL_20;
  }
LABEL_24:
  swift_release();
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_1000436DC(v16);
  swift_bridgeObjectRelease();
  id v17 = [*(id *)(v1 + 88) superview];
  if (v17) {

  }
  sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  sub_10005E610();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1000415E0()
{
  uint64_t v1 = (void *)(v0 + 176);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v39 = v0;
  uint64_t v40 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & v3;
  int64_t v41 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v42 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v43)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (i << 6);
      goto LABEL_22;
    }
    int64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      goto LABEL_43;
    }
    if (v11 >= v41) {
      break;
    }
    unint64_t v12 = *(void *)(v40 + 8 * v11);
    ++i;
    if (!v12)
    {
      int64_t i = v11 + 1;
      if (v11 + 1 >= v41) {
        break;
      }
      unint64_t v12 = *(void *)(v40 + 8 * i);
      if (!v12)
      {
        int64_t i = v11 + 2;
        if (v11 + 2 >= v41) {
          break;
        }
        unint64_t v12 = *(void *)(v40 + 8 * i);
        if (!v12)
        {
          int64_t v13 = v11 + 3;
          if (v13 >= v41) {
            break;
          }
          unint64_t v12 = *(void *)(v40 + 8 * v13);
          if (!v12)
          {
            while (1)
            {
              int64_t i = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_44;
              }
              if (i >= v41) {
                goto LABEL_38;
              }
              unint64_t v12 = *(void *)(v40 + 8 * i);
              ++v13;
              if (v12) {
                goto LABEL_21;
              }
            }
          }
          int64_t i = v13;
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (i << 6);
LABEL_22:
    uint64_t v14 = 16 * v10;
    int64_t v15 = (uint64_t *)(*(void *)(v42 + 48) + v14);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v42 + 56) + v14);
    uint64_t v19 = *v18;
    int64_t v43 = i;
    if (v18[1])
    {
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_retain();
      if (sub_10005E1E0()) {
        sub_10005E230();
      }
      swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    double v21 = (void *)*v1;
    int64_t v44 = (void *)*v1;
    void *v1 = 0x8000000000000000;
    unint64_t v23 = sub_10002B70C(v17, v16);
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      uint64_t result = sub_10005EC90();
      __break(1u);
      return result;
    }
    char v27 = v22;
    if (v21[3] >= v26)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        char v30 = v44;
        if (v22) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_100053430();
        char v30 = v44;
        if (v27) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_1000516F4(v26, isUniquelyReferenced_nonNull_native);
      unint64_t v28 = sub_10002B70C(v17, v16);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_45;
      }
      unint64_t v23 = v28;
      char v30 = v44;
      if (v27)
      {
LABEL_4:
        int64_t v8 = (void *)(v30[7] + 16 * v23);
        swift_release();
        swift_release();
        void *v8 = v19;
        v8[1] = 0;
        goto LABEL_5;
      }
    }
    v30[(v23 >> 6) + 8] |= 1 << v23;
    unint64_t v31 = (uint64_t *)(v30[6] + 16 * v23);
    *unint64_t v31 = v17;
    v31[1] = v16;
    unint64_t v32 = (void *)(v30[7] + 16 * v23);
    *unint64_t v32 = v19;
    v32[1] = 0;
    uint64_t v33 = v30[2];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_42;
    }
    v30[2] = v35;
    swift_bridgeObjectRetain();
LABEL_5:
    void *v1 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    swift_release();
  }
LABEL_38:
  swift_release();
  uint64_t v36 = swift_bridgeObjectRetain();
  sub_1000436DC(v36);
  swift_bridgeObjectRelease();
  id v37 = [*(id *)(v39 + 88) superview];
  if (v37) {

  }
  sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  sub_10005E610();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1000419F8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v5)
  {
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v1 + 56) + 16 * v10 + 8))
    {
      swift_retain();
      swift_retain();
      if (sub_10005E1E0()) {
        sub_10005E1C0();
      }
      swift_release();
      uint64_t result = swift_release();
    }
  }
  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  if (v11 >= v6) {
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v11);
  ++v8;
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v6) {
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v6) {
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12)
  {
LABEL_20:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_21;
  }
  int64_t v13 = v11 + 3;
  if (v13 < v6)
  {
    unint64_t v12 = *(void *)(v2 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_28;
        }
        if (v8 >= v6) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_20;
  }
LABEL_24:
  swift_release();
  uint64_t v14 = swift_bridgeObjectRetain();
  sub_1000436DC(v14);
  swift_bridgeObjectRelease();
  id v15 = [*(id *)(v0 + 88) superview];
  if (v15) {

  }
  sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  sub_10005E610();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100041C2C()
{
  float v1 = *(float *)(v0 + 16);
  sub_10005DEE0();
  float v3 = v2;
  float v4 = (float)((float)(v1 * 0.5) * 3.1416) / 180.0;
  if (v1 <= 0.0) {
    float v4 = 0.0087266;
  }
  float v5 = v3 / sinf(v4);
  sub_100015F58((uint64_t *)&unk_100094C50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716C0;
  *(void *)(inited + 32) = 0;
  *(float *)(inited + 40) = v5;
  sub_1000497C0(inited);
  swift_setDeallocating();
  sub_10005DF60();
  sub_10005DFB0();
  sub_10005E0E0();
  unint64_t v7 = (void (*)(unsigned char *, void))sub_10005E150();
  sub_10005E190();
  v7(v9, 0);
  return sub_10005DF90();
}

uint64_t sub_100041D7C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100041DCC()
{
  sub_100041D7C();

  return _swift_deallocClassInstance(v0, 184, 15);
}

uint64_t sub_100041E00()
{
  sub_100019028((uint64_t)(v0 + 2));
  sub_100042E0C(v0[6], v0[7], v0[8], v0[9]);
  float v1 = (char *)v0 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering13ARViewBackend_uuid;
  uint64_t v2 = sub_10005DED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100041ED4()
{
  return _s13ARViewBackendCMa(0);
}

uint64_t _s13ARViewBackendCMa(uint64_t a1)
{
  return sub_1000157B4(a1, (uint64_t *)&unk_1000945C0);
}

uint64_t sub_100041EFC()
{
  uint64_t result = sub_10005DED0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t _s13ARViewBackendC17ARViewCoordinatorCMa()
{
  return self;
}

uint64_t type metadata accessor for CRLARView(uint64_t a1)
{
  return sub_1000157B4(a1, (uint64_t *)&unk_100094850);
}

uint64_t sub_100041FF4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100042040@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCO20USDRendererExtension15CRLUSDRendering13ARViewBackend_uuid;
  uint64_t v4 = sub_10005DED0();
  float v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_1000420B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100019FC8;
  return sub_10003F360(a1);
}

uint64_t sub_100042148(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100018B00;
  return sub_100040578(a1);
}

uint64_t sub_1000421DC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100019FC8;
  return sub_100040910(a1);
}

uint64_t sub_100042270()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000948E0 + dword_1000948E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10003E15C;
  return v3();
}

uint64_t sub_100042310(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100015F58(&qword_1000948F8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10005E880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_10005E860();
  id v12 = a2;
  uint64_t v13 = sub_10005E850();
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = v13;
  *((void *)v15 + 3) = &protocol witness table for MainActor;
  *((void *)v15 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v14], v7, v4);
  sub_1000364B4((uint64_t)v10, (uint64_t)&unk_100094908, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_100042508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_100015F58(&qword_1000948F8);
  v5[4] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[5] = v7;
  v5[6] = *(void *)(v7 + 64);
  v5[7] = swift_task_alloc();
  sub_10005E860();
  uint64_t v5[8] = sub_10005E850();
  uint64_t v9 = sub_10005E800();
  return _swift_task_switch(sub_100042608, v9, v8);
}

uint64_t sub_100042608()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = (void *)v0[2];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  sub_10005E3D0();
  swift_release();
  [v5 bounds];
  [v5 setNeedsDisplayInRect:];
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10004273C(void *a1)
{
  id v1 = a1;
  sub_100015F58(&qword_1000948F8);
  return sub_10005E820();
}

uint64_t sub_100042784()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for CRLARView(0);
  [super didMoveToSuperview];
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v2 = result;
    swift_beginAccess();
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_1000436DC(v3);
    swift_bridgeObjectRelease();
    id v4 = [*(id *)(v2 + 88) superview];
    if (v4) {

    }
    sub_100023444((uint64_t)_swiftEmptyArrayStorage);
    sub_10005E610();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_1000428A4(void *a1)
{
  id v1 = a1;
  sub_100042784();
}

id sub_1000428EC(void *a1, uint64_t a2, uint64_t a3)
{
  swift_weakInit();
  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for CRLARView(0);
  return [super initWithCoder:a3];
}

id sub_10004294C(void *a1, double a2, double a3, double a4, double a5)
{
  swift_weakInit();
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for CRLARView(0);
  return [super initWithFrame:a2, a3, a4, a5];
}

uint64_t sub_1000429D4(uint64_t a1)
{
  uint64_t v3 = sub_10005E350();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  objc_super v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_10005E3B0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

uint64_t sub_100042B20()
{
  return swift_weakDestroy();
}

id sub_100042B30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLARView(0);
  return [super dealloc];
}

uint64_t sub_100042B68()
{
  return swift_weakDestroy();
}

uint64_t sub_100042B78()
{
  return type metadata accessor for CRLARView(0);
}

void *_s11ClientSceneC22InternalAnimationStateOwCP(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwxx()
{
  return swift_release();
}

void *_s11ClientSceneC22InternalAnimationStateOwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *_s11ClientSceneC22InternalAnimationStateOwtk(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *_s11ClientSceneC22InternalAnimationStateOwta(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s11ClientSceneC22InternalAnimationStateOwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t _s11ClientSceneC22InternalAnimationStateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_100042CD8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100042CF0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *_s13ARViewBackendC17ARViewCoordinatorC22InternalAnimationStateOMa()
{
  return &_s13ARViewBackendC17ARViewCoordinatorC22InternalAnimationStateON;
}

uint64_t sub_100042D20(uint64_t result, unint64_t a2, char a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 62;
  if (a4 >> 62 == 2)
  {
    return sub_100018434(result, a2, a3);
  }
  else if (v4 == 1)
  {
    swift_retain();
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  else if (!v4)
  {
    return swift_retain();
  }
  return result;
}

uint64_t _s13ARViewBackendC12BackendStateOwxx(uint64_t *a1)
{
  return sub_100042E0C(*a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_100042E0C(uint64_t result, unint64_t a2, char a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 62;
  if (a4 >> 62 == 2)
  {
    return sub_1000180C8(result, a2, a3);
  }
  else if (v4 == 1)
  {
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else if (!v4)
  {
    return swift_release();
  }
  return result;
}

uint64_t *_s13ARViewBackendC12BackendStateOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  sub_100042D20(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  return a1;
}

uint64_t *_s13ARViewBackendC12BackendStateOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v17 = a2[9];
  uint64_t v18 = a2[10];
  sub_100042D20(*a2, v4, v5, v6);
  uint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  unint64_t v15 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v17;
  a1[10] = v18;
  sub_100042E0C(v12, v13, v14, v15);
  return a1;
}

uint64_t _s13ARViewBackendC12BackendStateOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  long long v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v3;
  sub_100042E0C(v4, v6, v5, v7);
  return a1;
}

uint64_t _s13ARViewBackendC12BackendStateOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double _s13ARViewBackendC12BackendStateOwst(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 88) = 1;
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
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 24) = -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)(a1 + 64) = 0u;
      *(void *)(a1 + 80) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_10004316C(uint64_t result, uint64_t a2)
{
  if (a2 < 3)
  {
    *(void *)(result + 24) = a2 << 62;
  }
  else
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)double result = (a2 - 3);
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(void *)(result + 80) = 0;
    *(void *)(result + 24) = 0xC000000000000000;
  }
  return result;
}

ValueMetadata *_s13ARViewBackendC12BackendStateOMa()
{
  return &_s13ARViewBackendC12BackendStateON;
}

ValueMetadata *_s13ARViewBackendC5FlagsVMa()
{
  return &_s13ARViewBackendC5FlagsVN;
}

unint64_t sub_1000431C8()
{
  unint64_t result = qword_1000948A0;
  if (!qword_1000948A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000948A0);
  }
  return result;
}

unint64_t sub_100043220()
{
  unint64_t result = qword_1000948A8;
  if (!qword_1000948A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000948A8);
  }
  return result;
}

unint64_t sub_100043278()
{
  unint64_t result = qword_1000948B0;
  if (!qword_1000948B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000948B0);
  }
  return result;
}

unint64_t sub_1000432D0()
{
  unint64_t result = qword_1000948B8;
  if (!qword_1000948B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000948B8);
  }
  return result;
}

uint64_t sub_100043324(void *a1, char a2, void *a3)
{
  if (!a1[2]) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v44 = a1[2];
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  swift_bridgeObjectRetain();
  long long v9 = (void *)*a3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v11 = sub_10002B70C(v6, v5);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_100053430();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    char v20 = (uint64_t *)(v19[6] + 16 * v11);
    *char v20 = v6;
    v20[1] = v5;
    double v21 = (void *)(v19[7] + 16 * v11);
    *double v21 = v7;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v24;
    uint64_t v25 = v44 - 1;
    if (v44 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (int64_t i = a1 + 11; ; i += 4)
    {
      uint64_t v28 = *(i - 3);
      uint64_t v27 = *(i - 2);
      uint64_t v29 = *(i - 1);
      uint64_t v30 = *i;
      unint64_t v31 = (void *)*a3;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      unint64_t v32 = sub_10002B70C(v28, v27);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v23 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v23) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_1000516F4(v36, 1);
        unint64_t v32 = sub_10002B70C(v28, v27);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      uint64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
      *uint64_t v40 = v28;
      v40[1] = v27;
      int64_t v41 = (void *)(v39[7] + 16 * v32);
      *int64_t v41 = v29;
      v41[1] = v30;
      uint64_t v42 = v39[2];
      BOOL v23 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v39[2] = v43;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1000516F4(v14, a2 & 1);
  unint64_t v16 = sub_10002B70C(v6, v5);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100015F58(&qword_100094C00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_10005EC90();
  __break(1u);
LABEL_26:
  sub_10005E9D0(30);
  v46._object = (void *)0x800000010006F170;
  v46._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10005E790(v46);
  sub_10005EAA0();
  v47._countAndFlagsBits = 39;
  v47._object = (void *)0xE100000000000000;
  sub_10005E790(v47);
  uint64_t result = sub_10005EAB0();
  __break(1u);
  return result;
}

uint64_t sub_1000436DC(uint64_t a1)
{
  sub_100015F58((uint64_t *)&unk_100094C70);
  uint64_t result = sub_10005EAD0();
  int v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v39 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v36 = v6;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v38 = result + 64;
  BOOL v35 = (void *)result;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    unint64_t v16 = (uint64_t *)(*(void *)(v39 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    if (*(void *)(*(void *)(v39 + 56) + 16 * i + 8))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      char v40 = sub_10005E260();
      char v19 = sub_10005E220();
      char v20 = sub_10005E200();
      uint64_t v21 = v17;
      char v22 = sub_10005E210();
      sub_10005E1D0();
      unsigned int v24 = v23;
      swift_release();
      uint64_t result = swift_release();
      int v3 = v35;
      uint64_t v25 = 256;
      if ((v19 & 1) == 0) {
        uint64_t v25 = 0;
      }
      unint64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL | v40 & 1;
      uint64_t v27 = 0x10000;
      if ((v20 & 1) == 0) {
        uint64_t v27 = 0;
      }
      BOOL v28 = (v22 & 1) == 0;
      uint64_t v17 = v21;
      uint64_t v29 = 0x1000000;
      if (v28) {
        uint64_t v29 = 0;
      }
      unint64_t v30 = v26 | v27 | v29 | ((unint64_t)v24 << 32);
    }
    else
    {
      uint64_t result = swift_bridgeObjectRetain();
      unint64_t v30 = 2;
    }
    *(void *)(v38 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    unint64_t v31 = (void *)(v3[6] + 16 * i);
    *unint64_t v31 = v17;
    v31[1] = v18;
    *(void *)(v3[7] + 8 * i) = v30;
    uint64_t v32 = v3[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33)
    {
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v3[2] = v34;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_34;
    }
    if (v13 >= v37) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v36 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v37) {
        return (uint64_t)v3;
      }
      unint64_t v14 = *(void *)(v36 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v37) {
          return (uint64_t)v3;
        }
        unint64_t v14 = *(void *)(v36 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v37) {
    return (uint64_t)v3;
  }
  unint64_t v14 = *(void *)(v36 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v37) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v36 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100043998(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_10005E380();
  __chkstk_darwin(v14 - 8);
  *(void *)&long long v57 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10005E350();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v7 + 96) = a1;
  long long v20 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 64) = v20;
  *(void *)(v7 + 80) = *(void *)(a2 + 64);
  long long v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 32) = v21;
  sub_10005DF60();
  sub_1000497C0((uint64_t)&off_1000822D0);
  long long v56 = v22;
  swift_retain();
  *(void *)(v7 + 144) = sub_10005DF50();
  sub_10005E470();
  sub_10005DFA0();
  *(_OWORD *)(v7 + 112) = v23;
  *(_OWORD *)(v7 + 128) = v24;
  sub_10005DF00();
  uint64_t v25 = v7;
  sub_10005DFB0();
  swift_retain();
  sub_10005DF70();
  swift_release();
  sub_10005E0E0();
  swift_allocObject();
  *(void *)(v7 + 152) = sub_10005E0D0();
  sub_1000497C0((uint64_t)&off_100082300);
  *(void *)(v7 + 160) = sub_10005DF50();
  swift_retain();
  swift_retain();
  sub_10005DF70();
  swift_release();
  swift_release();
  Class v55 = (Class)type metadata accessor for CRLARView(0);
  *(void *)(v7 + 88) = [objc_allocWithZone(v55) initWithFrame:a3, a4, a5, a6];
  sub_10005E3C0();
  sub_10005E2E0();
  swift_release();
  sub_10005E2A0();
  if (swift_dynamicCastClass())
  {
    sub_10005E270();
    sub_10005E290();
    sub_10005E280();
  }
  swift_unknownObjectRelease();
  unint64_t v26 = *(void **)(v7 + 88);
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, enum case for ARView.CameraMode.nonAR(_:), v16);
  sub_10005E360();
  [v26 setUserInteractionEnabled:0];
  sub_10005E3C0();
  swift_retain();
  sub_10005E320();
  swift_release();
  swift_release();
  sub_10005E3C0();
  swift_retain();
  sub_10005E320();
  swift_release();
  swift_release();
  id v27 = [self clearColor];
  sub_10005E370();

  BOOL v28 = (void (*)(long long *, void))sub_10005E3A0();
  sub_10005E390();
  v28(&v59, 0);
  unint64_t v29 = sub_10005E430();
  unint64_t v30 = v29;
  if (v29 >> 62)
  {
    uint64_t v31 = sub_10005EAC0();
    if (v31)
    {
LABEL_5:
      uint64_t v58 = _swiftEmptyArrayStorage;
      sub_100048D14(0, v31 & ~(v31 >> 63), 0);
      if (v31 < 0)
      {
        __break(1u);
        uint64_t result = swift_unexpectedError();
        __break(1u);
        return result;
      }
      *(void *)&long long v56 = v25;
      uint64_t v32 = 0;
      BOOL v33 = v58;
      *(void *)&long long v57 = v30 & 0xC000000000000001;
      unint64_t v34 = v30;
      do
      {
        if ((void)v57)
        {
          uint64_t v35 = sub_10005E9F0();
        }
        else
        {
          uint64_t v35 = *(void *)(v30 + 8 * v32 + 32);
          swift_retain();
        }
        uint64_t v64 = sub_10005E6D0();
        *(void *)&long long v59 = sub_10005EC20();
        *((void *)&v59 + 1) = v36;
        v65._countAndFlagsBits = 47;
        v65._object = (void *)0xE100000000000000;
        sub_10005E790(v65);
        v37._countAndFlagsBits = sub_10005E0A0();
        if (v37._object)
        {
          object = v37._object;
        }
        else
        {
          v37._countAndFlagsBits = 0x64656D616E6E75;
          object = (void *)0xE700000000000000;
        }
        v37._object = object;
        sub_10005E790(v37);
        swift_bridgeObjectRelease();
        long long v39 = v59;
        uint64_t v58 = v33;
        unint64_t v41 = v33[2];
        unint64_t v40 = v33[3];
        if (v41 >= v40 >> 1)
        {
          sub_100048D14((void *)(v40 > 1), v41 + 1, 1);
          BOOL v33 = v58;
        }
        ++v32;
        v33[2] = v41 + 1;
        uint64_t v42 = &v33[4 * v41];
        *((_OWORD *)v42 + 2) = v39;
        v42[6] = v35;
        v42[7] = 0;
        unint64_t v30 = v34;
      }
      while (v31 != v32);
      swift_bridgeObjectRelease();
      uint64_t v25 = v56;
      if (v33[2]) {
        goto LABEL_17;
      }
LABEL_20:
      uint64_t v43 = &_swiftEmptyDictionarySingleton;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v31 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v31) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  if (!_swiftEmptyArrayStorage[2]) {
    goto LABEL_20;
  }
LABEL_17:
  sub_100015F58(&qword_100094928);
  uint64_t v43 = (void *)sub_10005EAF0();
LABEL_21:
  *(void *)&long long v59 = v43;
  uint64_t v44 = (void *)swift_bridgeObjectRetain();
  sub_100043324(v44, 1, &v59);
  swift_bridgeObjectRelease();
  *(void *)(v25 + 176) = v59;
  long long v45 = *(_OWORD *)(v25 + 112);
  long long v56 = *(_OWORD *)(v25 + 128);
  long long v57 = v45;
  unint64_t v46 = sub_100023568((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v47 = sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  long long v59 = v57;
  long long v60 = v56;
  unint64_t v61 = v46;
  BOOL v62 = 0;
  unint64_t v63 = v47;
  sub_100015F58(&qword_100094918);
  swift_allocObject();
  *(void *)(v25 + 168) = sub_10005E650();
  if (swift_dynamicCastClass()) {
    swift_weakAssign();
  }
  sub_100041C2C();
  swift_beginAccess();
  uint64_t v48 = swift_bridgeObjectRetain();
  uint64_t v49 = sub_1000436DC(v48);
  swift_bridgeObjectRelease();
  id v50 = [*(id *)(v25 + 88) superview];
  id v51 = v50;
  if (v50) {

  }
  unint64_t v52 = sub_100023444((uint64_t)_swiftEmptyArrayStorage);
  long long v59 = v57;
  long long v60 = v56;
  unint64_t v61 = v49;
  BOOL v62 = v51 != 0;
  unint64_t v63 = v52;
  sub_10005E610();
  swift_release();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_100044118(uint64_t a1)
{
  v1[3] = a1;
  v1[4] = sub_10005E860();
  v1[5] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[6] = v3;
  v1[7] = v2;
  return _swift_task_switch(sub_1000441B4, v3, v2);
}

uint64_t sub_1000441B4()
{
  [*(id *)(v0 + 24) frame];
  if (CGRectIsEmpty(v13))
  {
    id v1 = [*(id *)(v0 + 24) superview];
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v3 = *(void **)(v0 + 24);
      [v1 setNeedsLayout];
      [v2 layoutIfNeeded];
      [v3 frame];
      if (CGRectIsEmpty(v14)) {
        [*(id *)(v0 + 24) setFrame:0.0, 0.0, 300.0, 300.0];
      }
    }
  }
  [*(id *)(v0 + 24) frame];
  if (v4 != v5)
  {
    if (v4 <= v5) {
      double v4 = v5;
    }
    [*(id *)(v0 + 24) setFrame:0.0, 0.0, v4, v4];
  }
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = sub_10005E850();
  *(void *)(v0 + 64) = v7;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 72) = v8;
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v9;
  uint64_t v10 = sub_100015F58(&qword_1000948F0);
  void *v9 = v0;
  v9[1] = sub_100044394;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, v7, &protocol witness table for MainActor, 0xD000000000000012, 0x800000010006F090, sub_10004495C, v8, v10);
}

uint64_t sub_100044394()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return _swift_task_switch(sub_1000444F4, v3, v2);
}

uint64_t sub_1000444F4()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = [v1 CGImage];

  uint64_t v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100044580()
{
  v1[2] = v0;
  sub_10005E860();
  v1[3] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[4] = v3;
  v1[5] = v2;
  return _swift_task_switch(sub_100044618, v3, v2);
}

uint64_t sub_100044618()
{
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + 72) >> 62 == 1)
  {
    uint64_t v2 = *(void *)(v1 + 56);
    v0[6] = v2;
    uint64_t v3 = *(void **)(v2 + 88);
    v0[7] = v3;
    uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_1000948E8 + dword_1000948E8);
    id v4 = v3;
    swift_retain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[8] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100044740;
    return v8((uint64_t)v4);
  }
  else
  {
    swift_release();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7(0);
  }
}

uint64_t sub_100044740(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 32);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v7 = sub_1000448E4;
  }
  else
  {

    *(void *)(v4 + 80) = a1;
    uint64_t v5 = *(void *)(v4 + 32);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v7 = sub_100044870;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100044870()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000448E4()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004495C(uint64_t a1)
{
  return sub_100042310(a1, *(void **)(v1 + 16));
}

uint64_t sub_100044964()
{
  uint64_t v1 = sub_100015F58(&qword_1000948F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100044A3C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100015F58(&qword_1000948F8) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100019FC8;
  return sub_100042508(a1, v5, v6, v7, v8);
}

uint64_t sub_100044B3C()
{
  uint64_t v1 = sub_100015F58(&qword_1000948F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100044BD0(void *a1)
{
  sub_100015F58(&qword_1000948F8);

  return sub_10004273C(a1);
}

uint64_t sub_100044C48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100044C88()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 0xF;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_100018068(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8), *(void *)(v0 + v6 + 16), *(void *)(v0 + v6 + 24), *(void *)(v0 + v6 + 32), *(void *)(v0 + v6 + 40));

  return _swift_deallocObject(v0, v6 + 56, v5);
}

uint64_t sub_100044D88(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10005DED0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (uint64_t)v1 + ((*(void *)(v4 + 64) + v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100018B00;
  return sub_100014C3C(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_100044EB4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100044EEC()
{
  return sub_100040520();
}

unint64_t sub_100044EF4()
{
  unint64_t result = qword_100094920;
  if (!qword_100094920)
  {
    sub_100016310(&qword_100094918);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094920);
  }
  return result;
}

uint64_t sub_100044F50(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_100094538);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100044FB4(uint64_t a1, void **a2)
{
  sub_10005EA90();
  uint64_t v3 = (void *)swift_allocObject();
  v3[2] = 8;
  v3[3] = 0;
  uint64_t v4 = v3 + 3;
  v3[4] = 0;
  v3[5] = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_25:
    uint64_t v22 = sub_10005EA80();
    sub_10005E9E0();
    NSString v23 = sub_10005E6F0();
    swift_bridgeObjectRelease();
    id v24 = [self crl_redactedStringWithFormat:v23 arguments:v22];

    uint64_t v25 = *a2;
    *a2 = v24;
    swift_release();

    return;
  }
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 32;
  while (1)
  {
    sub_1000233DC(v7 + 40 * v6, (uint64_t)v27);
    sub_100019664(v27, v27[3]);
    uint64_t v8 = sub_10005EDC0();
    uint64_t v9 = *v4;
    uint64_t v10 = *(void *)(v8 + 16);
    BOOL v11 = __OFADD__(*v4, v10);
    uint64_t v12 = *v4 + v10;
    if (v11) {
      break;
    }
    uint64_t v13 = v8;
    uint64_t v14 = v3[4];
    if (v14 >= v12) {
      goto LABEL_18;
    }
    if (v14 + 0x4000000000000000 < 0) {
      goto LABEL_28;
    }
    uint64_t v15 = (char *)v3[5];
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    v3[4] = v12;
    if ((unint64_t)(v12 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_29;
    }
    uint64_t v16 = (char *)swift_slowAlloc();
    v3[5] = v16;
    if (v15)
    {
      if (v16 != v15 || v16 >= &v15[8 * v9]) {
        memmove(v16, v15, 8 * v9);
      }
      sub_10005EA70();
LABEL_18:
      uint64_t v16 = (char *)v3[5];
    }
    if (!v16) {
      goto LABEL_30;
    }
    uint64_t v18 = *(void *)(v13 + 16);
    if (v18)
    {
      char v19 = (uint64_t *)(v13 + 32);
      uint64_t v20 = *v4;
      while (1)
      {
        uint64_t v21 = *v19++;
        *(void *)&v16[8 * v20] = v21;
        uint64_t v20 = *v4 + 1;
        if (__OFADD__(*v4, 1)) {
          break;
        }
        uint64_t *v4 = v20;
        if (!--v18) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v6;
    swift_bridgeObjectRelease();
    sub_1000196FC((uint64_t)v27);
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

void sub_1000451EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, uint64_t a12)
{
  unsigned int v30 = [self _atomicIncrementAssertCount];
  id v33 = [objc_allocWithZone((Class)NSString) init];
  sub_100044FB4(a12, &v33);
  sub_10005E9E0();
  NSString v12 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  sub_10005E9E0();
  NSString v13 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  id v14 = [v13 lastPathComponent];

  uint64_t v15 = sub_10005E720();
  uint64_t v17 = v16;

  if (qword_100092F08 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v18 = (void *)static OS_os_log.crlAssert;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716A0;
  *(void *)(inited + 56) = &type metadata for Int32;
  *(void *)(inited + 64) = &protocol witness table for Int32;
  *(_DWORD *)(inited + 32) = v30;
  unint64_t v20 = sub_1000454C8();
  *(void *)(inited + 96) = v20;
  unint64_t v21 = sub_100045508();
  *(void *)(inited + 104) = v21;
  *(void *)(inited + 72) = v12;
  *(void *)(inited + 136) = &type metadata for String;
  unint64_t v22 = sub_10003E34C();
  *(void *)(inited + 112) = v15;
  *(void *)(inited + 120) = v17;
  *(void *)(inited + 176) = &type metadata for UInt;
  *(void *)(inited + 184) = &protocol witness table for UInt;
  *(void *)(inited + 144) = v22;
  *(void *)(inited + 152) = a8;
  NSString v23 = v33;
  *(void *)(inited + 216) = v20;
  *(void *)(inited + 224) = v21;
  *(void *)(inited + 192) = v23;
  id v24 = v18;
  id v25 = v12;
  id v26 = v23;
  uint64_t v27 = sub_10005E960();
  sub_100022574((uint64_t)v24, a1, v27, (uint64_t)"#Assert *** Assertion failure #%d: %{public}@ %{public}@:%lu %{public}@", 71, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  id v28 = (id)static OS_os_log.crlAssert;
  uint64_t v29 = sub_10005E960();
  sub_100022574((uint64_t)v28, a1, v29, a9, a10, a11, a12);
}

unint64_t sub_1000454C8()
{
  unint64_t result = qword_100094930;
  if (!qword_100094930)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100094930);
  }
  return result;
}

unint64_t sub_100045508()
{
  unint64_t result = qword_100094938;
  if (!qword_100094938)
  {
    sub_1000454C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094938);
  }
  return result;
}

void *sub_100045560(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100048D44(0, v1, 0);
  unint64_t result = (void *)sub_100049738(a1);
  uint64_t v5 = (uint64_t)result;
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 64;
  int64_t v21 = v1;
  int v22 = v4;
  uint64_t v23 = a1 + 64;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v10 = (unint64_t)v5 >> 6;
    if ((*(void *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v4) {
      goto LABEL_24;
    }
    BOOL v11 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v5);
    uint64_t v12 = v11[1];
    uint64_t v24 = *v11;
    unint64_t v14 = _swiftEmptyArrayStorage[2];
    unint64_t v13 = _swiftEmptyArrayStorage[3];
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1) {
      unint64_t result = sub_100048D44((void *)(v13 > 1), v14 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v14 + 1;
    uint64_t v15 = &_swiftEmptyArrayStorage[4 * v14];
    void v15[4] = 0x617453656B617761;
    v15[5] = 0xEA00000000006574;
    v15[6] = v24;
    v15[7] = v12;
    int64_t v8 = 1 << *(unsigned char *)(a1 + 32);
    if (v5 >= v8) {
      goto LABEL_25;
    }
    uint64_t v7 = a1 + 64;
    uint64_t v16 = *(void *)(v23 + 8 * v10);
    if ((v16 & (1 << v5)) == 0) {
      goto LABEL_26;
    }
    int v4 = v22;
    if (*(_DWORD *)(a1 + 36) != v22) {
      goto LABEL_27;
    }
    unint64_t v17 = v16 & (-2 << (v5 & 0x3F));
    if (v17)
    {
      int64_t v8 = __clz(__rbit64(v17)) | v5 & 0xFFFFFFFFFFFFFFC0;
      int64_t v9 = v21;
    }
    else
    {
      unint64_t v18 = v10 + 1;
      unint64_t v19 = (unint64_t)(v8 + 63) >> 6;
      int64_t v9 = v21;
      if (v10 + 1 < v19)
      {
        unint64_t v20 = *(void *)(v23 + 8 * v18);
        if (v20)
        {
LABEL_20:
          int64_t v8 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v10)
          {
            unint64_t v20 = *(void *)(a1 + 80 + 8 * v10++);
            if (v20)
            {
              unint64_t v18 = v10 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v6;
    uint64_t v5 = v8;
    if (v6 == v9) {
      return _swiftEmptyArrayStorage;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

double sub_10004578C()
{
  *(void *)&double result = 1060439283;
  xmmword_100094940 = xmmword_1000740C0;
  return result;
}

uint64_t sub_1000457A0(char a1, double a2)
{
  *(void *)(v3 + 72) = v2;
  *(unsigned char *)(v3 + 112) = a1;
  *(double *)(v3 + 64) = a2;
  sub_10005E860();
  *(void *)(v3 + 80) = sub_10005E850();
  uint64_t v5 = sub_10005E800();
  *(void *)(v3 + 88) = v5;
  *(void *)(v3 + 96) = v4;
  return _swift_task_switch(sub_100045840, v5, v4);
}

uint64_t sub_100045840()
{
  uint64_t v1 = *(void *)(v0 + 72) + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations;
  swift_beginAccess();
  uint64_t v34 = *(void *)v1 + 64;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(*(void *)v1 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  unint64_t v4 = v2 & *(void *)(*(void *)v1 + 64);
  int64_t v35 = (unint64_t)(63 - v3) >> 6;
  uint64_t v37 = *(void *)v1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v6 << 6);
      goto LABEL_23;
    }
    int64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_47;
    }
    if (v10 >= v35) {
      break;
    }
    unint64_t v11 = *(void *)(v34 + 8 * v10);
    ++v6;
    if (!v11)
    {
      int64_t v6 = v10 + 1;
      if (v10 + 1 >= v35) {
        break;
      }
      unint64_t v11 = *(void *)(v34 + 8 * v6);
      if (!v11)
      {
        int64_t v6 = v10 + 2;
        if (v10 + 2 >= v35) {
          break;
        }
        unint64_t v11 = *(void *)(v34 + 8 * v6);
        if (!v11)
        {
          int64_t v12 = v10 + 3;
          if (v12 >= v35) {
            break;
          }
          unint64_t v11 = *(void *)(v34 + 8 * v12);
          if (!v11)
          {
            while (1)
            {
              int64_t v6 = v12 + 1;
              if (__OFADD__(v12, 1)) {
                goto LABEL_49;
              }
              if (v6 >= v35) {
                goto LABEL_40;
              }
              unint64_t v11 = *(void *)(v34 + 8 * v6);
              ++v12;
              if (v11) {
                goto LABEL_22;
              }
            }
          }
          int64_t v6 = v12;
        }
      }
    }
LABEL_22:
    unint64_t v4 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v6 << 6);
LABEL_23:
    uint64_t v13 = 16 * v9;
    unint64_t v14 = (uint64_t *)(*(void *)(v37 + 48) + v13);
    uint64_t v15 = v14[1];
    uint64_t v40 = *v14;
    uint64_t v16 = (uint64_t *)(*(void *)(v37 + 56) + v13);
    uint64_t v17 = *v16;
    if (!v16[1])
    {
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_29:
      unint64_t v38 = v4;
      int64_t v39 = v6;
      sub_10005E0B0();
      uint64_t v18 = sub_10005E410();
      swift_beginAccess();
      swift_retain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v20 = *(void **)v1;
      unint64_t v41 = *(void **)v1;
      uint64_t v21 = v1;
      *(void *)uint64_t v1 = 0x8000000000000000;
      unint64_t v23 = sub_10002B70C(v40, v15);
      uint64_t v24 = v20[2];
      BOOL v25 = (v22 & 1) == 0;
      uint64_t result = v24 + v25;
      if (__OFADD__(v24, v25))
      {
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        return result;
      }
      char v26 = v22;
      if (v20[3] < result)
      {
        sub_100051A28(result, isUniquelyReferenced_nonNull_native);
        unint64_t v20 = v41;
        uint64_t result = sub_10002B70C(v40, v15);
        if ((v26 & 1) != (v27 & 1))
        {
          return sub_10005EC90();
        }
        unint64_t v23 = result;
        if ((v26 & 1) == 0) {
          goto LABEL_36;
        }
LABEL_4:
        uint64_t v7 = (void *)(v20[7] + 16 * v23);
        swift_release();
        swift_release();
        void *v7 = v17;
        v7[1] = v18;
LABEL_5:
        uint64_t v1 = v21;
        unint64_t v4 = v38;
        int64_t v6 = v39;
        *(void *)uint64_t v1 = v20;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        swift_release();
        swift_release();
        goto LABEL_6;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v22) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t result = (uint64_t)sub_1000535F8();
        unint64_t v20 = v41;
        if (v26) {
          goto LABEL_4;
        }
      }
LABEL_36:
      v20[(v23 >> 6) + 8] |= 1 << v23;
      id v28 = (uint64_t *)(v20[6] + 16 * v23);
      *id v28 = v40;
      v28[1] = v15;
      uint64_t v29 = (void *)(v20[7] + 16 * v23);
      *uint64_t v29 = v17;
      v29[1] = v18;
      uint64_t v30 = v20[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_48;
      }
      v20[2] = v32;
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if ((sub_10005E1E0() & 1) == 0) {
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
    if (sub_10005E260()) {
      sub_10005E250();
    }
    swift_release();
LABEL_6:
    uint64_t result = swift_release();
  }
LABEL_40:
  swift_release();
  id v33 = (void *)swift_task_alloc();
  *(void *)(v36 + 104) = v33;
  *id v33 = v36;
  v33[1] = sub_100045CF8;
  return sub_1000475C8();
}

uint64_t sub_100045CF8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return _swift_task_switch(sub_100045E18, v3, v2);
}

uint64_t sub_100045E18()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100045E78()
{
  v1[5] = v0;
  sub_10005E860();
  v1[6] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[7] = v3;
  v1[8] = v2;
  return _swift_task_switch(sub_100045F10, v3, v2);
}

uint64_t sub_100045F10()
{
  uint64_t v1 = *(void *)(v0 + 40) + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)v1 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(*(void *)v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(*(void *)v1 + 64);
  int64_t v7 = (unint64_t)(63 - v5) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v2 + 56) + 16 * v11 + 8))
    {
      swift_retain();
      swift_retain();
      if (sub_10005E1E0()) {
        sub_10005E240();
      }
      swift_release();
      uint64_t result = swift_release();
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  if (v12 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v7)
  {
    unint64_t v13 = *(void *)(v3 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v9 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_28;
        }
        if (v9 >= v7) {
          goto LABEL_24;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v9 = v14;
    goto LABEL_20;
  }
LABEL_24:
  swift_release();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v15;
  void *v15 = v0;
  v15[1] = sub_100046124;
  return sub_1000475C8();
}

uint64_t sub_100046124()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_100046244, v3, v2);
}

uint64_t sub_100046244()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000462A4()
{
  v1[5] = v0;
  sub_10005E860();
  v1[6] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[7] = v3;
  v1[8] = v2;
  return _swift_task_switch(sub_10004633C, v3, v2);
}

uint64_t sub_10004633C()
{
  uint64_t v1 = *(void *)(v0 + 40) + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)v1 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(*(void *)v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(*(void *)v1 + 64);
  int64_t v7 = (unint64_t)(63 - v5) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v2 + 56) + 16 * v11 + 8))
    {
      swift_retain();
      swift_retain();
      if (sub_10005E1E0()) {
        sub_10005E250();
      }
      swift_release();
      uint64_t result = swift_release();
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  if (v12 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v7)
  {
    unint64_t v13 = *(void *)(v3 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v9 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_28;
        }
        if (v9 >= v7) {
          goto LABEL_24;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v9 = v14;
    goto LABEL_20;
  }
LABEL_24:
  swift_release();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v15;
  void *v15 = v0;
  v15[1] = sub_100046550;
  return sub_1000475C8();
}

uint64_t sub_100046550()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_10004A560, v3, v2);
}

uint64_t sub_100046670()
{
  v1[8] = v0;
  sub_10005E860();
  v1[9] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[10] = v3;
  v1[11] = v2;
  return _swift_task_switch(sub_100046708, v3, v2);
}

uint64_t sub_100046708()
{
  uint64_t v1 = v0 + 40;
  uint64_t v2 = *(void *)(v0 + 64) + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations;
  swift_beginAccess();
  uint64_t v37 = *(void *)v2 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(*(void *)v2 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(*(void *)v2 + 64);
  int64_t v38 = (unint64_t)(63 - v4) >> 6;
  uint64_t v39 = *(void *)v2;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = v9 | (v7 << 6);
      goto LABEL_22;
    }
    int64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_46;
    }
    if (v12 >= v38) {
      break;
    }
    unint64_t v13 = *(void *)(v37 + 8 * v12);
    ++v7;
    if (!v13)
    {
      int64_t v7 = v12 + 1;
      if (v12 + 1 >= v38) {
        break;
      }
      unint64_t v13 = *(void *)(v37 + 8 * v7);
      if (!v13)
      {
        int64_t v7 = v12 + 2;
        if (v12 + 2 >= v38) {
          break;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v7);
        if (!v13)
        {
          int64_t v14 = v12 + 3;
          if (v14 >= v38) {
            break;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            while (1)
            {
              int64_t v7 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_47;
              }
              if (v7 >= v38) {
                goto LABEL_38;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v7);
              ++v14;
              if (v13) {
                goto LABEL_21;
              }
            }
          }
          int64_t v7 = v14;
        }
      }
    }
LABEL_21:
    uint64_t v10 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v7 << 6);
LABEL_22:
    uint64_t v15 = 16 * v11;
    uint64_t v16 = (uint64_t *)(*(void *)(v39 + 48) + v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    unint64_t v19 = (uint64_t *)(*(void *)(v39 + 56) + v15);
    uint64_t v20 = *v19;
    unint64_t v40 = v10;
    int64_t v41 = v7;
    if (v19[1])
    {
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_retain();
      if (sub_10005E1E0()) {
        sub_10005E230();
      }
      swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    uint64_t v21 = v1;
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v23 = *(void **)v2;
    uint64_t v42 = *(void **)v2;
    *(void *)uint64_t v2 = 0x8000000000000000;
    unint64_t v25 = sub_10002B70C(v18, v17);
    uint64_t v26 = v23[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t result = v26 + v27;
    if (__OFADD__(v26, v27))
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
      return result;
    }
    char v28 = v24;
    if (v23[3] >= result)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v24) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t result = (uint64_t)sub_1000535F8();
        unint64_t v23 = v42;
        if (v28) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_100051A28(result, isUniquelyReferenced_nonNull_native);
      unint64_t v23 = v42;
      uint64_t result = sub_10002B70C(v18, v17);
      if ((v28 & 1) != (v29 & 1))
      {
        return sub_10005EC90();
      }
      unint64_t v25 = result;
      if (v28)
      {
LABEL_4:
        unint64_t v8 = (void *)(v23[7] + 16 * v25);
        swift_release();
        swift_release();
        void *v8 = v20;
        v8[1] = 0;
        goto LABEL_5;
      }
    }
    v23[(v25 >> 6) + 8] |= 1 << v25;
    uint64_t v30 = (uint64_t *)(v23[6] + 16 * v25);
    *uint64_t v30 = v18;
    v30[1] = v17;
    BOOL v31 = (void *)(v23[7] + 16 * v25);
    *BOOL v31 = v20;
    v31[1] = 0;
    uint64_t v32 = v23[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_45;
    }
    v23[2] = v34;
    swift_bridgeObjectRetain();
LABEL_5:
    uint64_t v1 = v21;
    unint64_t v5 = v40;
    int64_t v7 = v41;
    *(void *)uint64_t v2 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    uint64_t result = swift_release();
  }
LABEL_38:
  swift_release();
  int64_t v35 = (void *)swift_task_alloc();
  *(void *)(v36 + 96) = v35;
  void *v35 = v36;
  v35[1] = sub_100046B30;
  return sub_1000475C8();
}

uint64_t sub_100046B30()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return _swift_task_switch(sub_100046C50, v3, v2);
}

uint64_t sub_100046C50()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100046CB0()
{
  v1[5] = v0;
  sub_10005E860();
  v1[6] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[7] = v3;
  v1[8] = v2;
  return _swift_task_switch(sub_100046D48, v3, v2);
}

uint64_t sub_100046D48()
{
  uint64_t v1 = *(void *)(v0 + 40) + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)v1 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(*(void *)v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(*(void *)v1 + 64);
  int64_t v7 = (unint64_t)(63 - v5) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v2 + 56) + 16 * v11 + 8))
    {
      swift_retain();
      swift_retain();
      if (sub_10005E1E0())
      {
        sub_10005E1C0();
        sub_10005E240();
      }
      swift_release();
      uint64_t result = swift_release();
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  if (v12 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v7) {
    goto LABEL_24;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v7)
  {
    unint64_t v13 = *(void *)(v3 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v9 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_28;
        }
        if (v9 >= v7) {
          goto LABEL_24;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v9 = v14;
    goto LABEL_20;
  }
LABEL_24:
  swift_release();
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v15;
  void *v15 = v0;
  v15[1] = sub_100046550;
  return sub_1000475C8();
}

uint64_t sub_100046F64(float a1)
{
  *(void *)(v2 + 24) = v1;
  *(float *)(v2 + 96) = a1;
  *(void *)(v2 + 32) = sub_10005E860();
  *(void *)(v2 + 40) = sub_10005E850();
  uint64_t v4 = sub_10005E800();
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 56) = v3;
  return _swift_task_switch(sub_100047004, v4, v3);
}

uint64_t sub_100047004()
{
  uint64_t v1 = *(void *)(v0 + 24);
  double v2 = *(float *)(v0 + 96);
  double v3 = *(double *)(v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration + 48)
     * v2;
  double v4 = *(double *)(v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration + 56)
     * v2;
  uint64_t v5 = sub_10005E850();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *(void *)(v6 + 16) = v1;
  *(double *)(v6 + 24) = v3;
  *(double *)(v6 + 32) = v4;
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v7;
  type metadata accessor for CGImage(0);
  void *v7 = v0;
  v7[1] = sub_100047144;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, v5, &protocol witness table for MainActor, 0xD000000000000011, 0x800000010006DE50, sub_10004A550, v6, v8);
}

uint64_t sub_100047144()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_1000472D0;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_100047268;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100047268()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000472D0()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100047348(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (qword_100093120 != -1) {
    swift_once();
  }
  uint64_t result = sub_10004C5F4(a2, a1, a3, a4);
  if ((result & 1) == 0)
  {
    sub_1000161C4();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD000000000000018;
    *(void *)(v9 + 8) = 0x800000010006F2C0;
    *(unsigned char *)(v9 + 16) = 5;
    sub_100015F58(&qword_100094C80);
    return sub_10005E810();
  }
  return result;
}

__n128 sub_10004743C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong && (v4 = *(void **)(Strong + 32), uint64_t v5 = v4, swift_release(), v4))
  {
    char v6 = v5[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_hasDrawnFrame];
  }
  else
  {
    char v6 = 1;
  }
  __n128 v15 = *(__n128 *)(v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelBounds + 16);
  long long v16 = *(_OWORD *)(v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelBounds);
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1000436DC(v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_100045560(v9);
  swift_bridgeObjectRelease();
  if (v10[2])
  {
    sub_100015F58((uint64_t *)&unk_1000952E0);
    unint64_t v11 = (void *)sub_10005EAF0();
  }
  else
  {
    unint64_t v11 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v17 = v11;
  int64_t v12 = (void *)swift_bridgeObjectRetain();
  sub_100048FE0(v12, 1, &v17);
  swift_bridgeObjectRelease();
  unint64_t v13 = v17;
  __n128 result = v15;
  *(_OWORD *)a1 = v16;
  *(__n128 *)(a1 + 16) = v15;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v13;
  return result;
}

uint64_t sub_1000475C8()
{
  v1[11] = v0;
  v1[12] = sub_10005E860();
  v1[13] = sub_10005E850();
  uint64_t v3 = sub_10005E800();
  v1[14] = v3;
  v1[15] = v2;
  return _swift_task_switch(sub_100047664, v3, v2);
}

uint64_t sub_100047664()
{
  uint64_t v1 = *(void *)(v0 + 88);
  sub_10004743C(v0 + 16);
  *(void *)(v0 + 72) = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = v1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription;
  long long v4 = *(_OWORD *)(v0 + 32);
  long long v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 32) = v5;
  *(void *)(v3 + 48) = v2;
  sub_10004A4F8(v0 + 72);
  sub_10004A4F8(v0 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004A524(v0 + 72);
  sub_10004A524(v0 + 80);
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 128) = Strong;
  if (Strong)
  {
    *(void *)(v0 + 136) = sub_10005E850();
    uint64_t v8 = sub_10005E800();
    *(void *)(v0 + 144) = v8;
    *(void *)(v0 + 152) = v7;
    return _swift_task_switch(sub_1000477D0, v8, v7);
  }
  else
  {
    swift_release();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_1000477D0()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v1[6];
  v0[20] = v2;
  v0[21] = v1[7];
  v0[22] = v1[8];
  unint64_t v3 = v1[9];
  v0[23] = v3;
  v0[24] = v1[10];
  v0[25] = v1[11];
  v0[26] = v1[12];
  v0[27] = v1[13];
  v0[28] = v1[14];
  v0[29] = v1[15];
  v0[30] = v1[16];
  if (v3 >> 62 == 1 && v0[11] == v2)
  {
    swift_retain();
    char v6 = (void *)swift_task_alloc();
    v0[31] = v6;
    *char v6 = v0;
    v6[1] = sub_100047920;
    return sub_100038440();
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v4 = v0[14];
    uint64_t v5 = v0[15];
    return _swift_task_switch(sub_100047B1C, v4, v5);
  }
}

uint64_t sub_100047920()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return _swift_task_switch(sub_100047A40, v3, v2);
}

uint64_t sub_100047A40()
{
  uint64_t v2 = v0[22];
  unint64_t v1 = v0[23];
  uint64_t v4 = v0[20];
  unint64_t v3 = v0[21];
  swift_release();
  sub_10003768C(v4, v3, v2, v1);
  swift_release();
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[15];
  return _swift_task_switch(sub_100047B1C, v5, v6);
}

uint64_t sub_100047B1C()
{
  swift_release();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100047B7C()
{
  float v1 = *(float *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration);
  sub_10005DEE0();
  float v3 = v2;
  float v4 = (float)((float)(v1 * 0.5) * 3.1416) / 180.0;
  if (v1 <= 0.0) {
    float v4 = 0.0087266;
  }
  float v5 = v3 / sinf(v4);
  sub_100015F58((uint64_t *)&unk_100094C50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716C0;
  *(void *)(inited + 32) = 0;
  *(float *)(inited + 40) = v5;
  sub_1000497C0(inited);
  swift_setDeallocating();
  sub_10005DF60();
  sub_10005DFB0();
  sub_10005E0E0();
  uint64_t v7 = (void (*)(unsigned char *, void))sub_10005E150();
  sub_10005E190();
  v7(v9, 0);
  sub_10005DF90();
  sub_1000497C0((uint64_t)&off_100082380);
  return sub_10005DFB0();
}

uint64_t sub_100047D18()
{
  uint64_t v1 = sub_100015F58(&qword_100094C48);
  __chkstk_darwin(v1 - 8);
  float v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_lighting))
  {
    swift_retain_n();
    sub_10005E570();
    uint64_t v4 = sub_10005E580();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
    float v5 = (void (*)(unsigned char *, void))sub_10005E3F0();
    sub_10005E400();
    v5(v9, 0);
    return swift_release();
  }
  else
  {
    sub_10005E140();
    sub_10005E130();
    sub_10005E570();
    uint64_t v7 = sub_10005E580();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 0, 1, v7);
    uint64_t v8 = (uint64_t (*)(unsigned char *, void))sub_10005E3F0();
    sub_10005E400();
    return v8(v9, 0);
  }
}

uint64_t sub_100047F18()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    if (*(void *)(*(void *)(v2 + 56) + 16 * v11 + 8))
    {
      swift_retain();
      if (sub_10005E1E0())
      {
        char v15 = sub_10005E200();
        uint64_t result = swift_release();
        if (v15)
        {
          uint64_t v16 = 1;
LABEL_26:
          swift_release();
          return v16;
        }
      }
      else
      {
        uint64_t result = swift_release();
      }
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v12 >= v7) {
    goto LABEL_25;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v7) {
    goto LABEL_25;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v7) {
    goto LABEL_25;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_25:
    uint64_t v16 = 0;
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_25;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

Swift::Int sub_1000480C0()
{
  sub_10005EDB0();
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  Swift::Int result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v22 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v23 = v22 | (v9 << 6);
      goto LABEL_34;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v24 >= v7) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v3 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v7) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v3 + 8 * v9);
      if (!v25)
      {
        int64_t v9 = v24 + 2;
        if (v24 + 2 >= v7) {
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v3 + 8 * v9);
        if (!v25) {
          break;
        }
      }
    }
LABEL_33:
    unint64_t v6 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_34:
    BOOL v27 = (Swift::UInt *)(*(void *)(v2 + 56) + 16 * v23);
    Swift::UInt v28 = *v27;
    Swift::UInt v29 = v27[1];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_10005E770();
    swift_bridgeObjectRelease();
    sub_10005ED50(v28);
    if (v29)
    {
      sub_10005ED60(1u);
      sub_10005ED50(v29);
      swift_retain();
      char v10 = sub_10005E1E0();
      sub_10005ED60(v10 & 1);
      char v11 = sub_10005E200();
      sub_10005ED60(v11 & 1);
      char v12 = sub_10005E260();
      sub_10005ED60(v12 & 1);
      char v13 = sub_10005E210();
      sub_10005ED60(v13 & 1);
      sub_10005E1D0();
      if ((v14 & 0x7FFFFFFF) != 0) {
        Swift::UInt32 v15 = v14;
      }
      else {
        Swift::UInt32 v15 = 0;
      }
      sub_10005ED70(v15);
      sub_10005E1B0();
      if ((v16 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v17 = v16;
      }
      else {
        Swift::UInt64 v17 = 0;
      }
      sub_10005ED80(v17);
      sub_10005E1A0();
      if ((v18 & 0x7FFFFFFF) != 0) {
        Swift::UInt32 v19 = v18;
      }
      else {
        Swift::UInt32 v19 = 0;
      }
      sub_10005ED70(v19);
      sub_10005E1F0();
      if ((v20 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v21 = v20;
      }
      else {
        Swift::UInt64 v21 = 0;
      }
      sub_10005ED80(v21);
      swift_release_n();
    }
    else
    {
      sub_10005ED60(0);
    }
    Swift::Int result = swift_release();
  }
  int64_t v26 = v24 + 3;
  if (v26 >= v7)
  {
LABEL_36:
    swift_release();
    return sub_10005ED90();
  }
  unint64_t v25 = *(void *)(v3 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_33;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v3 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_33;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

Swift::Int sub_1000483AC()
{
  return sub_10005EDA0();
}

uint64_t sub_100048404()
{
  return sub_10005E770();
}

Swift::Int sub_100048420()
{
  return sub_10005EDA0();
}

uint64_t sub_100048474@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100082410;
  v7._object = v3;
  Swift::Int v5 = sub_10005EB10(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000484C8(void *a1@<X8>)
{
  *a1 = 0x617453656B617761;
  a1[1] = 0xEA00000000006574;
}

uint64_t sub_1000484E8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_metadata);
  *(void *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_metadata) = a1;
  uint64_t v8 = swift_bridgeObjectRetain();
  char v9 = sub_100028D20(v8, v7);
  swift_bridgeObjectRelease();
  if (v9)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    sub_10005E860();
    swift_retain();
    uint64_t v12 = sub_10005E850();
    char v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = &protocol witness table for MainActor;
    v13[4] = v2;
    sub_1000364B4((uint64_t)v6, (uint64_t)&unk_100094C40, (uint64_t)v13);
    swift_bridgeObjectRelease();
    return swift_release();
  }
}

uint64_t sub_100048678()
{
  swift_weakDestroy();
  uint64_t v1 = v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_uuid;
  uint64_t v2 = sub_10005DED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000487A4()
{
  sub_100048678();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000487FC()
{
  return _s11ClientSceneCMa();
}

uint64_t _s11ClientSceneCMa()
{
  uint64_t result = qword_100094980;
  if (!qword_100094980) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100048850()
{
  uint64_t result = sub_10005DED0();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

unsigned char *_s11ClientSceneC11MetadataKeyOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000489DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s11ClientSceneC11MetadataKeyOMa()
{
  return &_s11ClientSceneC11MetadataKeyON;
}

ValueMetadata *_s11ClientSceneC22InternalAnimationStateOMa()
{
  return &_s11ClientSceneC22InternalAnimationStateON;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwCP(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  return a1;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  return a1;
}

uint64_t _s11ClientSceneC15ImageBasedLightVwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 12)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s11ClientSceneC15ImageBasedLightVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 12) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 12) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *_s11ClientSceneC15ImageBasedLightVMa()
{
  return &_s11ClientSceneC15ImageBasedLightVN;
}

unint64_t sub_100048BC4()
{
  unint64_t result = qword_100094BE8;
  if (!qword_100094BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100094BE8);
  }
  return result;
}

Swift::Int sub_100048C18()
{
  Swift::UInt v1 = *v0;
  sub_10005ED40();
  sub_10005ED50(v1);
  return sub_10005EDA0();
}

void sub_100048C60()
{
  sub_10005ED50(*v0);
}

Swift::Int sub_100048C8C()
{
  sub_10005ED40();
  sub_10005ED50(*v0);
  return sub_10005EDA0();
}

uint64_t sub_100048CCC()
{
  return sub_10004A3BC(&qword_100094BF0, (void (*)(uint64_t))_s11ClientSceneCMa);
}

void *sub_100048D14(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100048EB8(a1, a2, a3, *v3, &qword_100094C88, qword_100094C90);
  void *v3 = result;
  return result;
}

void *sub_100048D44(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100048D94(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

void *sub_100048D64(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100048EB8(a1, a2, a3, *v3, &qword_100094C08, &qword_100094C10);
  void *v3 = result;
  return result;
}

void *sub_100048D94(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100015F58(&qword_100094C60);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100015F58(&qword_100094C68);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_100048EB8(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_100015F58(a5);
    char v13 = (void *)swift_allocObject();
    int64_t v14 = j__malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 1;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 5);
  }
  else
  {
    char v13 = _swiftEmptyArrayStorage;
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[4 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 32 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100015F58(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_100048FE0(void *a1, char a2, void *a3)
{
  uint64_t v3 = a1[2];
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = a1[7];
  uint64_t v44 = a1[6];
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10002B70C(v7, v6);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_10005343C();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    Swift::UInt32 v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    Swift::UInt64 v20 = (uint64_t *)(v19[6] + 16 * v11);
    *Swift::UInt64 v20 = v7;
    v20[1] = v6;
    Swift::UInt64 v21 = (void *)(v19[7] + 16 * v11);
    *Swift::UInt64 v21 = v44;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v24;
    uint64_t v25 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = a1 + 11; ; i += 4)
    {
      uint64_t v28 = *(i - 3);
      uint64_t v27 = *(i - 2);
      uint64_t v29 = *(i - 1);
      uint64_t v30 = *i;
      BOOL v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_10002B70C(v28, v27);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v23 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v23) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_100051700(v36, 1);
        unint64_t v32 = sub_10002B70C(v28, v27);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      unint64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
      *unint64_t v40 = v28;
      v40[1] = v27;
      int64_t v41 = (void *)(v39[7] + 16 * v32);
      *int64_t v41 = v29;
      v41[1] = v30;
      uint64_t v42 = v39[2];
      BOOL v23 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v39[2] = v43;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_100051700(v14, a2 & 1);
  unint64_t v16 = sub_10002B70C(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100015F58(&qword_100094C00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_10005EC90();
  __break(1u);
LABEL_26:
  sub_10005E9D0(30);
  v46._object = (void *)0x800000010006F170;
  v46._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10005E790(v46);
  sub_10005EAA0();
  v47._countAndFlagsBits = 39;
  v47._object = (void *)0xE100000000000000;
  sub_10005E790(v47);
  uint64_t result = sub_10005EAB0();
  __break(1u);
  return result;
}

uint64_t sub_100049380(void *a1, char a2, void *a3)
{
  if (!a1[2]) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v44 = a1[2];
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)*a3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v11 = sub_10002B70C(v6, v5);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000535F8();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    Swift::UInt32 v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    Swift::UInt64 v20 = (uint64_t *)(v19[6] + 16 * v11);
    *Swift::UInt64 v20 = v6;
    v20[1] = v5;
    Swift::UInt64 v21 = (void *)(v19[7] + 16 * v11);
    *Swift::UInt64 v21 = v7;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v24;
    uint64_t v25 = v44 - 1;
    if (v44 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = a1 + 11; ; i += 4)
    {
      uint64_t v28 = *(i - 3);
      uint64_t v27 = *(i - 2);
      uint64_t v29 = *(i - 1);
      uint64_t v30 = *i;
      BOOL v31 = (void *)*a3;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      unint64_t v32 = sub_10002B70C(v28, v27);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v23 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v23) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_100051A28(v36, 1);
        unint64_t v32 = sub_10002B70C(v28, v27);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      unint64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
      *unint64_t v40 = v28;
      v40[1] = v27;
      int64_t v41 = (void *)(v39[7] + 16 * v32);
      *int64_t v41 = v29;
      v41[1] = v30;
      uint64_t v42 = v39[2];
      BOOL v23 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v39[2] = v43;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_100051A28(v14, a2 & 1);
  unint64_t v16 = sub_10002B70C(v6, v5);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100015F58(&qword_100094C00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_10005EC90();
  __break(1u);
LABEL_26:
  sub_10005E9D0(30);
  v46._object = (void *)0x800000010006F170;
  v46._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10005E790(v46);
  sub_10005EAA0();
  v47._countAndFlagsBits = 39;
  v47._object = (void *)0xE100000000000000;
  sub_10005E790(v47);
  uint64_t result = sub_10005EAB0();
  __break(1u);
  return result;
}

uint64_t sub_100049738(uint64_t a1)
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
  unint64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_1000497C0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 3;
    if ((unint64_t)(v1 - 1) < 3) {
      unint64_t v3 = v1 - 1;
    }
    long long v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 2)
      {
        __break(1u);
        goto LABEL_10;
      }
      int v5 = *(_DWORD *)(result + 32 + 4 * v2);
      long long v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      long long v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 2) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

double sub_100049830()
{
  uint64_t v0 = sub_100015F58(&qword_100094C18);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10005E110();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v19 - v8;
  sub_10005E470();
  sub_10005DF80();
  long long v19 = v10;
  sub_10005E2B0();
  uint64_t v11 = sub_10005E120();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v2, 1, v11) == 1)
  {
    sub_10004A35C((uint64_t)v2);
  }
  else if ((*(unsigned int (**)(char *, uint64_t))(v12 + 88))(v2, v11) == enum case for __REAnchoringType.surface(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v2, v11);
    BOOL v13 = &v2[*(int *)(sub_100015F58(&qword_100094C20) + 48)];
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    uint64_t v14 = sub_10005E0F0();
    (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
    sub_10005E100();
    sub_10004A3BC(&qword_100094C28, (void (*)(uint64_t))&type metadata accessor for __REAnchoringType.Alignment);
    sub_10005E7B0();
    sub_10005E7B0();
    uint64_t v16 = v20;
    uint64_t v15 = v21;
    char v17 = *(void (**)(char *, uint64_t))(v4 + 8);
    v17(v7, v3);
    if (v15 == v16)
    {
      if (qword_100093118 != -1) {
        swift_once();
      }
      long long v19 = xmmword_100094940;
    }
    v17(v9, v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v11);
  }
  return *(double *)&v19;
}

uint64_t sub_100049B94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  *(void *)&long long v59 = sub_10005E2D0();
  *(void *)&long long v57 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  long long v56 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_loadReceipt) = 0;
  uint64_t v11 = v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_lighting;
  *(void *)uint64_t v11 = 0;
  *(_DWORD *)(v11 + 8) = 0;
  uint64_t v12 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_metadata;
  *(void *)(v5 + v12) = sub_1000237B4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v13 = a1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  uint64_t v14 = v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_uuid;
  uint64_t v15 = sub_10005DED0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v14, v13, v15);
  v53[1] = a1;
  swift_weakAssign();
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_scene) = a2;
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_objectEntity) = a3;
  uint64_t v16 = v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration;
  long long v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v16 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v16 + 48) = v17;
  *(void *)(v16 + 64) = *(void *)(a4 + 64);
  long long v18 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)a4;
  *(_OWORD *)(v16 + 16) = v18;
  sub_10005DF60();
  sub_1000497C0((uint64_t)&off_1000823B0);
  long long v58 = v19;
  swift_retain();
  swift_retain();
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelAnchor) = sub_10005DF50();
  sub_10005E470();
  sub_10005DFA0();
  uint64_t v20 = (_OWORD *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelBounds);
  *uint64_t v20 = v21;
  v20[1] = v22;
  sub_10005DF00();
  sub_10005DFB0();
  swift_retain();
  sub_10005DF70();
  swift_release();
  sub_10005E0E0();
  swift_allocObject();
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_cameraEntity) = sub_10005E0D0();
  sub_1000497C0((uint64_t)&off_1000823E0);
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_cameraAnchor) = sub_10005DF50();
  swift_retain();
  swift_retain();
  BOOL v23 = a3;
  sub_10005DF70();
  swift_release();
  swift_release();
  swift_retain();
  sub_10005E320();
  swift_release();
  swift_retain();
  sub_10005E320();
  swift_release();
  *(void *)&long long v58 = a2;
  *(double *)&long long v24 = sub_100049830();
  long long v55 = v24;
  sub_10005DF80();
  uint64_t v26 = 0;
  while (1)
  {
    long long v60 = v55;
    float v28 = *(float *)((unint64_t)&v60 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3)));
    long long v61 = v25;
    float v29 = *(float *)((unint64_t)&v61 & 0xFFFFFFFFFFFFFFF3 | (4 * (v26 & 3)));
    BOOL v27 = v28 == v29;
    if (v26 == 3) {
      break;
    }
    while (1)
    {
      ++v26;
      if (v27) {
        break;
      }
      if (v26 == 3) {
        goto LABEL_8;
      }
      BOOL v27 = 0;
    }
  }
  if (v28 != v29) {
LABEL_8:
  }
    sub_10005DF90();
  swift_allocObject();
  *(void *)(v5 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_environmentEntity) = sub_10005E460();
  swift_retain();
  sub_10005E440();
  swift_release();
  swift_retain();
  sub_10005E420();
  swift_release();
  uint64_t v30 = v56;
  sub_10005E300();
  sub_10005E2C0();
  (*(void (**)(char *, void))(v57 + 8))(v30, v59);
  unint64_t v31 = sub_10005E430();
  unint64_t v32 = v31;
  if (v31 >> 62) {
LABEL_30:
  }
    uint64_t v33 = sub_10005EAC0();
  else {
    uint64_t v33 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v54 = v5;
  v53[2] = v23;
  if (!v33)
  {
    swift_bridgeObjectRelease();
    if (!_swiftEmptyArrayStorage[2])
    {
LABEL_27:
      uint64_t v44 = &_swiftEmptyDictionarySingleton;
      goto LABEL_28;
    }
LABEL_25:
    sub_100015F58(&qword_100094BF8);
    uint64_t v44 = (void *)sub_10005EAF0();
LABEL_28:
    *(void *)&v64[0] = v44;
    long long v45 = (void *)swift_bridgeObjectRetain();
    sub_100049380(v45, 1, v64);
    swift_bridgeObjectRelease();
    uint64_t v46 = v54;
    *(void *)(v54 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_animations) = *(void *)&v64[0];
    long long v59 = *(_OWORD *)(v46 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelBounds);
    long long v57 = *(_OWORD *)(v46
                    + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_modelBounds
                    + 16);
    unint64_t v47 = sub_100023568((uint64_t)_swiftEmptyArrayStorage);
    unint64_t v48 = sub_100023444((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v49 = v46 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription;
    long long v50 = v57;
    *(_OWORD *)uint64_t v49 = v59;
    *(_OWORD *)(v49 + 16) = v50;
    *(void *)(v49 + 32) = v47;
    *(unsigned char *)(v49 + 40) = 0;
    *(void *)(v49 + 48) = v48;
    sub_100047B7C();
    sub_100047D18();
    sub_10004743C((uint64_t)v64);
    swift_release();
    swift_release();
    swift_release();
    long long v51 = v64[1];
    *(_OWORD *)uint64_t v49 = v64[0];
    *(_OWORD *)(v49 + 16) = v51;
    *(_OWORD *)(v49 + 32) = v64[2];
    *(void *)(v49 + 48) = v65;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v46;
  }
  unint64_t v63 = _swiftEmptyArrayStorage;
  sub_100048D64(0, v33 & ~(v33 >> 63), 0);
  if ((v33 & 0x8000000000000000) == 0)
  {
    uint64_t v34 = 0;
    BOOL v23 = v63;
    *(void *)&long long v59 = v32 & 0xC000000000000001;
    unint64_t v35 = v32;
    do
    {
      if (v33 == v34)
      {
        __break(1u);
        goto LABEL_30;
      }
      if ((void)v59)
      {
        uint64_t v36 = sub_10005E9F0();
      }
      else
      {
        uint64_t v36 = *(void *)(v32 + 8 * v34 + 32);
        swift_retain();
      }
      uint64_t v62 = sub_10005E6D0();
      *(void *)&v64[0] = sub_10005EC20();
      *((void *)&v64[0] + 1) = v37;
      v66._countAndFlagsBits = 47;
      v66._object = (void *)0xE100000000000000;
      sub_10005E790(v66);
      v38._countAndFlagsBits = sub_10005E0A0();
      if (v38._object)
      {
        object = v38._object;
      }
      else
      {
        v38._countAndFlagsBits = 0x64656D616E6E75;
        object = (void *)0xE700000000000000;
      }
      v38._object = object;
      sub_10005E790(v38);
      swift_bridgeObjectRelease();
      uint64_t v40 = *((void *)&v64[0] + 1);
      uint64_t v5 = *(void *)&v64[0];
      unint64_t v63 = v23;
      unint64_t v42 = v23[2];
      unint64_t v41 = v23[3];
      if (v42 >= v41 >> 1)
      {
        sub_100048D64((void *)(v41 > 1), v42 + 1, 1);
        BOOL v23 = v63;
      }
      ++v34;
      v23[2] = v42 + 1;
      uint64_t v43 = &v23[4 * v42];
      v43[4] = v5;
      v43[5] = v40;
      v43[6] = v36;
      v43[7] = 0;
      unint64_t v32 = v35;
    }
    while (v33 != v34);
    swift_bridgeObjectRelease();
    if (!v23[2]) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_10004A35C(uint64_t a1)
{
  uint64_t v2 = sub_100015F58(&qword_100094C18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004A3BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004A404()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004A444()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100018B00;
  return sub_100036EBC();
}

uint64_t sub_10004A4F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004A524(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004A550(uint64_t a1)
{
  return sub_100047348(a1, *(void *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32));
}

uint64_t CRLAsyncStreamProperty.__allocating_init(wrappedValue:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_allocObject();
  uint64_t v4 = sub_10004ACF0(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t CRLAsyncStreamProperty.init(wrappedValue:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_10004ACF0(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t sub_10004A660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005E8D0();
  uint64_t v5 = sub_10005E990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  uint64_t v8 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a1, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56);

  return v6(a2, 0, 1, v4);
}

uint64_t *CRLAsyncStreamProperty.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = (uint64_t)v0 + *(void *)(*v0 + 104);
  uint64_t v4 = *(void *)(v2 + 80);
  uint64_t v5 = sub_10005E8D0();
  sub_10005E8C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))((uint64_t)v1 + *(void *)(*v1 + 88), v4);
  uint64_t v6 = (uint64_t)v1 + *(void *)(*v1 + 96);
  uint64_t v7 = sub_10005E8E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  swift_release();
  return v1;
}

uint64_t CRLAsyncStreamProperty.__deallocating_deinit()
{
  CRLAsyncStreamProperty.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t CRLAsyncStreamProperty.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t CRLAsyncStreamProperty.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_10004B198(a1);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v4(a1);
}

void (*CRLAsyncStreamProperty.wrappedValue.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[4] = v7;
  CRLAsyncStreamProperty.wrappedValue.getter((uint64_t)v7);
  return sub_10004AB04;
}

void sub_10004AB04(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 8);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    sub_10004B198((uint64_t)v3);
    uint64_t v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
    v7(v4, v5);
  }
  else
  {
    sub_10004B198(*(void *)(*(void *)a1 + 32));
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t CRLAsyncStreamProperty.projectedValue.getter()
{
  return swift_retain();
}

uint64_t CRLAsyncStreamProperty.ProjectedValue.values.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(void *)(*(void *)a1 + 96);
  uint64_t v4 = sub_10005E8E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v3, v4);
}

uint64_t CRLAsyncStreamProperty.ProjectedValue.publisher()()
{
  return sub_10005E660();
}

uint64_t sub_10004ACF0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v38 = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  unint64_t v31 = (char *)&v29 - v6;
  uint64_t v35 = sub_10005E8A0();
  uint64_t v7 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  unint64_t v9 = (uint64_t *)((char *)&v29 - v8);
  uint64_t v10 = sub_10005E8E0();
  uint64_t v33 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v36 = (char *)&v29 - v11;
  uint64_t v12 = sub_10005E8D0();
  uint64_t v37 = sub_10005E990();
  uint64_t v34 = *(void *)(v37 - 8);
  uint64_t v13 = __chkstk_darwin(v37);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  long long v17 = (char *)&v29 - v16;
  long long v18 = (char *)v2 + *(void *)(v3 + 88);
  long long v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v32 = v5 + 16;
  uint64_t v30 = v19;
  v19(v18, v38, v4);
  uint64_t v20 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v17, 1, 1, v12);
  void *v9 = 1;
  uint64_t v21 = v33;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for AsyncStream.Continuation.BufferingPolicy.bufferingNewest<A>(_:), v35);
  long long v22 = v36;
  uint64_t v39 = v4;
  uint64_t v40 = v17;
  sub_10005E8F0();
  uint64_t v23 = (uint64_t)v2 + *(void *)(*v2 + 96);
  long long v24 = *(void (**)(uint64_t, char *, uint64_t))(v21 + 16);
  uint64_t v35 = v10;
  uint64_t v25 = v10;
  uint64_t v26 = v34;
  v24(v23, v22, v25);
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v15, v17, v37);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v12);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))((uint64_t)v2 + *(void *)(*v2 + 104), v15, v12);
    sub_10005E630();
    v30(v31, v38, v4);
    uint64_t v28 = sub_10005E640();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v36, v35);
    *(uint64_t *)((char *)v2 + *(void *)(*v2 + 112)) = v28;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v37);
    return (uint64_t)v2;
  }
  return result;
}

uint64_t sub_10004B198(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v4 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = sub_10005E890();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t v13 = (char *)v2 + *(void *)(v4 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 24))(v13, a1, v5);
  swift_endAccess();
  sub_10005E610();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  sub_10005E8D0();
  sub_10005E8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10004B3BC()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = sub_10005E8E0();
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      uint64_t v0 = sub_10005E8D0();
      if (v4 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return v0;
}

uint64_t type metadata accessor for CRLAsyncStreamProperty()
{
  return sub_10004B538();
}

uint64_t sub_10004B510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t type metadata accessor for CRLAsyncStreamProperty.ProjectedValue()
{
  return sub_10004B538();
}

uint64_t sub_10004B530(uint64_t a1)
{
  return sub_10004A660(a1, *(void *)(v1 + 24));
}

uint64_t sub_10004B538()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10004B568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10005E880();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_10005E870();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10003EC6C(a1, &qword_100094C30);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10005E800();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_10004B6F0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_100015F58((uint64_t *)&unk_1000952D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_10003EC6C(a1, (uint64_t *)&unk_1000952D0);
    sub_10005AE7C(a2, (uint64_t)v8);
    uint64_t v13 = sub_10005DED0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_10003EC6C((uint64_t)v8, (uint64_t *)&unk_1000952D0);
  }
  else
  {
    sub_10003347C(a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_100052EB0((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_10005DED0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

void sub_10004B8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10005EA90();
  uint64_t v9 = (void *)swift_allocObject();
  _DWORD v9[2] = 8;
  v9[3] = 0;
  uint64_t v10 = v9 + 3;
  _OWORD v9[4] = 0;
  v9[5] = 0;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = a1 + 32;
    while (1)
    {
      sub_1000233DC(v13 + 40 * v12, (uint64_t)v34);
      sub_100019664(v34, v34[3]);
      uint64_t v14 = sub_10005EDC0();
      uint64_t v15 = *v10;
      uint64_t v16 = *(void *)(v14 + 16);
      BOOL v17 = __OFADD__(*v10, v16);
      uint64_t v18 = *v10 + v16;
      if (v17)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      uint64_t v19 = v14;
      uint64_t v20 = v9[4];
      if (v20 >= v18) {
        goto LABEL_18;
      }
      if (v20 + 0x4000000000000000 < 0) {
        goto LABEL_29;
      }
      uint64_t v21 = (char *)v9[5];
      if (2 * v20 > v18) {
        uint64_t v18 = 2 * v20;
      }
      _OWORD v9[4] = v18;
      if ((unint64_t)(v18 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_30;
      }
      long long v22 = (char *)swift_slowAlloc();
      v9[5] = v22;
      if (v21) {
        break;
      }
LABEL_19:
      if (!v22) {
        goto LABEL_32;
      }
      uint64_t v24 = *(void *)(v19 + 16);
      if (v24)
      {
        uint64_t v25 = (uint64_t *)(v19 + 32);
        uint64_t v26 = *v10;
        while (1)
        {
          uint64_t v27 = *v25++;
          *(void *)&v22[8 * v26] = v27;
          uint64_t v26 = *v10 + 1;
          if (__OFADD__(*v10, 1)) {
            break;
          }
          uint64_t *v10 = v26;
          if (!--v24) {
            goto LABEL_3;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v12;
      swift_bridgeObjectRelease();
      sub_1000196FC((uint64_t)v34);
      if (v12 == v11) {
        goto LABEL_25;
      }
    }
    if (v22 != v21 || v22 >= &v21[8 * v15]) {
      memmove(v22, v21, 8 * v15);
    }
    sub_10005EA70();
LABEL_18:
    long long v22 = (char *)v9[5];
    goto LABEL_19;
  }
LABEL_25:
  uint64_t v28 = sub_10005EA80();
  uint64_t v29 = self;
  sub_10005E9E0();
  NSString v30 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  sub_10005E9E0();
  NSString v31 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  if (a8 < 0) {
    goto LABEL_31;
  }
  sub_10005E9E0();
  NSString v32 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  [v29 handleFailureInFunction:v30 file:v31 lineNumber:a8 isFatal:0 format:v32 args:v28];
  swift_release();
}

void sub_10004BB8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [*(id *)(v1 + 16) objectForKey:a1];
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7 + 64;
    swift_beginAccess();
    sub_100036430(v8, (uint64_t)&v20, &qword_100095248);
    if (*((void *)&v21 + 1))
    {
      sub_1000233DC((uint64_t)&v20, (uint64_t)v19);
      sub_10003EC6C((uint64_t)&v20, &qword_100095248);
      sub_100019664(v19, v19[3]);
      sub_10005E5E0();
      sub_1000196FC((uint64_t)v19);
    }
    else
    {
      sub_10003EC6C((uint64_t)&v20, &qword_100095248);
    }
    uint64_t v22 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    swift_beginAccess();
    sub_100054CE8((uint64_t)&v20, v8, &qword_100095248);
    swift_endAccess();
    [*(id *)(v1 + 16) removeObjectForKey:a1];
    sub_10005E040();
    sub_100019664(&v20, *((uint64_t *)&v21 + 1));
    sub_10005DFD0();
    sub_1000196FC((uint64_t)&v20);
    if (![*(id *)(v1 + 16) count])
    {
      sub_10004D520();
      uint64_t v16 = sub_10005E880();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
      sub_10005E860();
      swift_retain();
      uint64_t v17 = sub_10005E850();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = v17;
      v18[3] = &protocol witness table for MainActor;
      v18[4] = v2;
      sub_10004B568((uint64_t)v6, (uint64_t)&unk_100095258, (uint64_t)v18);
      swift_release();
    }
    swift_release();
  }
  else
  {
    if (qword_100093018 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v9 = (void *)static OS_os_log.crlThreeDimensionalObjects;
    sub_100015F58((uint64_t *)&unk_100095230);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000716E0;
    id v11 = v9;
    sub_10005DE80();
    sub_10005E780();
    sub_10005E7A0();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_10005E760();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for String;
    *(void *)(inited + 64) = sub_10003E34C();
    *(void *)(inited + 32) = v12;
    *(void *)(inited + 40) = v14;
    uint64_t v15 = sub_10005E950();
    sub_100022574((uint64_t)v11, (uint64_t)&_mh_execute_header, v15, (uint64_t)"(CoreRE) [%{public}@] Cannot remove unknown client.", 51, 2, inited);
    swift_setDeallocating();
    sub_100015F58(&qword_100095240);
    swift_arrayDestroy();
  }
}

uint64_t sub_10004BFB0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_100093018 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000716E0;
  uint64_t v8 = a1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10RepBackend_uuid;
  id v9 = v6;
  uint64_t v33 = a1;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v10 = v8;
  uint64_t v11 = sub_10005E760();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for String;
  unint64_t v14 = sub_10003E34C();
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 32) = v11;
  *(void *)(inited + 40) = v13;
  uint64_t v15 = sub_10005E950();
  sub_100022574((uint64_t)v9, (uint64_t)&_mh_execute_header, v15, (uint64_t)"(CoreRE) [%{public}@] Adding new client.", 40, 2, inited);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  strcpy((char *)v38, "ClientScene-");
  BYTE5(v38[1]) = 0;
  HIWORD(v38[1]) = -5120;
  sub_10005DED0();
  sub_100054868(&qword_100095288, (void (*)(uint64_t))&type metadata accessor for UUID);
  v40._countAndFlagsBits = sub_10005EC20();
  sub_10005E790(v40);
  swift_bridgeObjectRelease();
  sub_10004D140(v38[0], v38[1]);
  swift_bridgeObjectRelease();
  sub_10005E750();
  swift_bridgeObjectRelease();
  RESceneCreate();
  swift_release();
  RESceneSetRequiresAnchoring();
  sub_10005E340();
  uint64_t v16 = sub_10005E310();
  RERelease();
  sub_10005E040();
  sub_100019664(v38, v38[3]);
  sub_10005DFC0();
  sub_1000196FC((uint64_t)v38);
  _s11ClientSceneCMa();
  swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v17 = sub_100049B94(v33, v16, a2, a3);
  uint64_t v18 = *(void **)(v4 + 24);
  _s6CoreREO19SceneRenderingStateCMa(0);
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v19 = v39;
  uint64_t v20 = sub_10004DCF8(v18, v17);
  if (v19)
  {
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v21 = v20;
    if (!*(void *)(v4 + 96)) {
      sub_10004D238();
    }
    uint64_t v39 = v10;
    if ((sub_10005E500() & 1) == 0) {
      sub_10005E4F0();
    }
    [*(id *)(v4 + 16) setObject:v21 forKey:v17];
    sub_10005DF20();
    uint64_t v37 = 0;
    memset(v36, 0, sizeof(v36));
    uint64_t v22 = swift_allocObject();
    swift_weakInit();
    uint64_t v23 = swift_allocObject();
    swift_weakInit();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v22;
    *(void *)(v24 + 24) = v23;
    sub_10005E330();
    swift_release();
    sub_10003EC6C((uint64_t)v36, &qword_100095278);
    sub_100054C84((uint64_t)v38, (uint64_t)v36, &qword_100095248);
    swift_beginAccess();
    sub_100054CE8((uint64_t)v36, v21 + 64, &qword_100095248);
    swift_endAccess();
    uint64_t v25 = (void *)static OS_os_log.crlThreeDimensionalObjects;
    uint64_t v26 = swift_initStackObject();
    *(_OWORD *)(v26 + 16) = xmmword_1000716E0;
    id v32 = v25;
    sub_10005DE80();
    sub_10005E780();
    sub_10005E7A0();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_10005E760();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)(v26 + 56) = &type metadata for String;
    *(void *)(v26 + 64) = v14;
    *(void *)(v26 + 32) = v27;
    *(void *)(v26 + 40) = v29;
    uint64_t v30 = sub_10005E950();
    sub_100022574((uint64_t)v32, (uint64_t)&_mh_execute_header, v30, (uint64_t)"(CoreRE) [%{public}@] Added new client.", 39, 2, v26);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_release();
    swift_release();
  }
  return v17;
}

BOOL sub_10004C5F4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v9 = sub_100015F58((uint64_t *)&unk_1000952D0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (double *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_10005DED0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v24 - v17;
  id v19 = [*(id *)(v4 + 16) objectForKey:a1];
  if (v19)
  {
    sub_10005DEC0();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    uint64_t v20 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
    uint64_t v21 = (char *)v11 + *(int *)(v20 + 20);
    uint64_t v22 = sub_100015F58(&qword_100094C80);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v21, a2, v22);
    *uint64_t v11 = a3;
    v11[1] = a4;
    *((unsigned char *)v11 + *(int *)(v20 + 24)) = 0;
    (*(void (**)(double *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 0, 1, v20);
    swift_beginAccess();
    sub_10004B6F0((uint64_t)v11, (uint64_t)v16);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    swift_release();
  }
  return v19 != 0;
}

uint64_t sub_10004C870()
{
  _s6CoreREO6EngineCMa();
  swift_allocObject();
  uint64_t result = sub_10004C8AC();
  qword_10009D740 = result;
  return result;
}

uint64_t sub_10004C8AC()
{
  uint64_t v1 = sub_10005E180();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10005E4D0();
  uint64_t v19 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [self mapTableWithKeyOptions:517 valueOptions:0];
  uint64_t v21 = v0;
  *(_OWORD *)(v0 + 48) = 0u;
  uint64_t v8 = v0 + 48;
  *(void *)(v0 + 16) = v7;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(void *)(v0 + 96) = 0;
  if (qword_100093018 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v9 = (id)static OS_os_log.crlThreeDimensionalObjects;
  uint64_t v10 = sub_10005E950();
  sub_100022574((uint64_t)v9, (uint64_t)&_mh_execute_header, v10, (uint64_t)"(CoreRE) Loading CoreRE.Engine.", 31, 2, (uint64_t)&_swiftEmptyArrayStorage);

  sub_10005E4C0();
  sub_10005E480();
  type metadata accessor for REEngineServiceMask(0);
  uint64_t v12 = v11;
  sub_10005E170();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v4, v1);
  unsigned int v14 = v27 & 0xFFFFDE3F;
  if ((v27 & 0x21C0) != 0) {
    v27 &= 0xFFFFDE3F;
  }
  uint64_t v26 = v12;
  LODWORD(v25[0]) = v14;
  sub_10005E160();
  sub_1000196FC((uint64_t)v25);
  sub_10005E490();
  sub_10005E4A0();
  sub_10005E170();
  v13(v4, v1);
  unsigned int v27 = v25[0];
  if ((v25[0] & 0x21C0) != 0) {
    unsigned int v27 = v25[0] & 0xFFFFDE3F;
  }
  uint64_t v26 = v12;
  LODWORD(v25[0]) &= 0xFFFFDE3F;
  sub_10005E160();
  sub_1000196FC((uint64_t)v25);
  sub_10005E4B0();
  sub_10005E090();
  sub_10005E060();
  uint64_t v15 = sub_10005E080();
  uint64_t v16 = v21;
  *(void *)(v21 + 40) = v15;
  *(void *)(v16 + 32) = sub_10005E070();
  sub_10005E050();
  sub_100019664(v25, v26);
  *(void *)(v16 + 24) = sub_10005DFF0();
  sub_1000196FC((uint64_t)v25);
  sub_10005E030();
  sub_100019664(v24, v24[3]);
  sub_10005E0C0();
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  swift_allocObject();
  swift_weakInit();
  sub_10005E560();
  swift_release();
  sub_10003EC6C((uint64_t)v22, &qword_100095278);
  swift_beginAccess();
  sub_100054CE8((uint64_t)v25, v8, &qword_100095248);
  swift_endAccess();
  sub_1000196FC((uint64_t)v24);
  sub_10005E010();
  uint64_t result = REServiceLocatorGetECSService();
  if (result)
  {
    REECSManagerAddDefaultSystems();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10004CD40()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10004CD98();
    return swift_release();
  }
  return result;
}

uint64_t sub_10004CD98()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005DDE0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005E010();
  uint64_t result = REServiceLocatorGetEngine();
  if (!result) {
    return result;
  }
  uint64_t result = REServiceLocatorGetRenderManager();
  if (!result || !*(void *)(v0 + 96)) {
    return result;
  }
  uint64_t v7 = *(void *)(v0 + 88);
  BOOL v8 = __CFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    goto LABEL_20;
  }
  uint64_t v10 = result;
  v30[0] = *(void *)(v0 + 96);
  uint64_t v31 = v3;
  uint64_t v32 = v2;
  *(void *)(v0 + 88) = v9;
  REEngineGetCurrentTime();
  v30[1] = v10;
  uint64_t RenderFrameSettings = RERenderManagerCreateRenderFrameSettings();
  RERenderFrameSettingsSetTotalTime();
  id v12 = [*(id *)(v0 + 16) objectEnumerator];
  if (!v12) {
    id v12 = [objc_allocWithZone((Class)NSEnumerator) init];
  }
  sub_10005E940();

  sub_10005DDD0();
  if (!v52)
  {
LABEL_15:
    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v32);
    RERenderManagerCreateRenderFrameWorkload();
    RERenderFrameWorkloadConfigure();
    RERenderGraphEmitterAssetExecute();
    RERenderFrameWorkloadCommit();
    RERelease();
    return RERelease();
  }
  uint64_t v13 = (char *)&type metadata for Any + 8;
  while (1)
  {
    sub_100033468(&v51, v50);
    _s6CoreREO19SceneRenderingStateCMa(0);
    if (!swift_dynamicCast())
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v32);
      return RERelease();
    }
    uint64_t v14 = v39[0];
    if (*(unsigned char *)(v39[0] + 256) == 1) {
      break;
    }
    swift_release();
LABEL_10:
    sub_10005DDD0();
    if (!v52) {
      goto LABEL_15;
    }
  }
  uint64_t v15 = v5;
  uint64_t v16 = v13;
  uint64_t v17 = v1;
  uint64_t v38 = *(void *)(v1 + 88);
  uint64_t v18 = *(void *)(v39[0] + 16);
  int v19 = *(_DWORD *)(v18 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration);
  long long v20 = *(_OWORD *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                  + 16);
  long long v36 = *(_OWORD *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                  + 32);
  long long v37 = v20;
  long long v35 = *(_OWORD *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                  + 48);
  uint64_t v21 = *(void *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                  + 64);
  long long v22 = *(_OWORD *)(v18 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription);
  long long v33 = *(_OWORD *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                  + 16);
  long long v34 = v22;
  uint64_t v23 = *(void *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                  + 32);
  char v24 = *(unsigned char *)(v18
                 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                 + 40);
  uint64_t v25 = RenderFrameSettings;
  uint64_t v26 = *(void *)(v18
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                  + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Swift::Int v27 = sub_1000480C0();
  LODWORD(v39[0]) = v19;
  long long v40 = v37;
  long long v41 = v36;
  long long v42 = v35;
  uint64_t v43 = v21;
  long long v44 = v34;
  long long v45 = v33;
  uint64_t v46 = v23;
  char v47 = v24;
  uint64_t v48 = v26;
  Swift::Int v49 = v27;
  uint64_t RenderFrameSettings = v25;
  nullsub_2(v39);
  sub_100054C84(v14 + 112, (uint64_t)v50, &qword_100095280);
  sub_100054C84((uint64_t)v39, v14 + 112, &qword_100095280);
  sub_10005164C((uint64_t *)v50);
  uint64_t result = RERenderFrameSettingsAddGpuSignalEvent();
  uint64_t v28 = *(void *)(v14 + 264);
  BOOL v8 = __CFADD__(v28, 1);
  uint64_t v29 = v28 + 1;
  if (!v8)
  {
    *(void *)(v14 + 264) = v29;
    swift_release();
    uint64_t v1 = v17;
    uint64_t v13 = v16;
    uint64_t v5 = v15;
    goto LABEL_10;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_10004D140(uint64_t a1, uint64_t a2)
{
  if (sub_10004D63C(a1, a2, v2))
  {
    uint64_t v5 = 1;
    while (1)
    {
      swift_bridgeObjectRetain();
      v8._countAndFlagsBits = 45;
      v8._object = (void *)0xE100000000000000;
      sub_10005E790(v8);
      v9._countAndFlagsBits = sub_10005EC20();
      sub_10005E790(v9);
      swift_bridgeObjectRelease();
      if ((sub_10004D63C(a1, a2, v2) & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_10004D238()
{
  if (*(void *)(v0 + 96))
  {
    sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"loadRenderGraphEmitter()", 24, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 259, (uint64_t)"expected nil value, but non-nil found", 37, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_10004B8FC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"loadRenderGraphEmitter()", 24, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 259);
  }
  else
  {
    sub_10005E020();
    sub_100019664(v3, v4);
    sub_10005E000();
    sub_1000196FC((uint64_t)v3);
    uint64_t AssetHandle = REAssetManagerCreateAssetHandle();
    if (AssetHandle)
    {
      uint64_t v2 = AssetHandle;
      REAssetHandleLoadNow();
      sub_10005E050();
      sub_100019664(v3, v4);
      sub_10005DFE0();
      sub_1000196FC((uint64_t)v3);
      RERenderGraphEmitterAssetRegisterProviders();
      *(void *)(v0 + 96) = v2;
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10004D3A8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      if ([*(id *)(v1 + 16) objectForKey:Strong])
      {
        sub_10004E3A0();
        swift_release();
      }
      else
      {
        sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"doUpdateCallback(client:update:)", 32, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 307, (uint64_t)"invalid nil found when unwrapping value", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
        sub_10004B8FC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"doUpdateCallback(client:update:)", 32, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 307);
      }
      swift_release();
    }
    return swift_release();
  }
  return result;
}

void sub_10004D520()
{
  if (*(void *)(v0 + 96))
  {
    sub_10005E050();
    sub_100019664(v1, v1[3]);
    sub_10005DFE0();
    sub_1000196FC((uint64_t)v1);
    RERenderGraphEmitterAssetUnregisterProviders();
    RERelease();
    *(void *)(v0 + 96) = 0;
  }
  else
  {
    sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"unloadRenderGraphEmitter()", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 277, (uint64_t)"invalid nil found when unwrapping value", 39, 2u, (uint64_t)&_swiftEmptyArrayStorage);
    sub_10004B8FC((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)"unloadRenderGraphEmitter()", 26, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/CoreRE/CRLUSDRendering+CoreRE_Engine.swift", 126, 2, 277);
  }
}

uint64_t sub_10004D63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005DDE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::String v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [*(id *)(a3 + 16) keyEnumerator];
  sub_10005E940();

  sub_10005DDD0();
  while (v19)
  {
    sub_100033468(&v18, &v17);
    _s11ClientSceneCMa();
    if (swift_dynamicCast())
    {
      if (sub_10005E2F0() == a1 && v11 == a2)
      {
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v14 = 1;
        goto LABEL_12;
      }
      char v13 = sub_10005EC40();
      swift_bridgeObjectRelease();
      swift_release();
      if (v13)
      {
        uint64_t v14 = 1;
        goto LABEL_12;
      }
    }
    sub_10005DDD0();
  }
  uint64_t v14 = 0;
LABEL_12:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

uint64_t sub_10004D824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_10005EA50();
  v4[3] = v5;
  void v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_10005E860();
  v4[6] = sub_10005E850();
  uint64_t v7 = sub_10005E800();
  v4[7] = v7;
  v4[8] = v6;
  return _swift_task_switch(sub_10004D918, v7, v6);
}

uint64_t sub_10004D918()
{
  sub_10005EA40();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100095260 + dword_100095260);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_10004D9E0;
  return v3(0xA055690D9DB80000, 1, 0, 0, 1);
}

uint64_t sub_10004D9E0()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *(void *)(*v1 + 24);
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v8 = sub_10004DC08;
  }
  else {
    uint64_t v8 = sub_10004DB78;
  }
  return _swift_task_switch(v8, v7, v6);
}

uint64_t sub_10004DB78()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  if (![*(id *)(v1 + 16) count]) {
    sub_10005E4E0();
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10004DC08()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004DC74()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_10003EC6C(v0 + 48, &qword_100095248);

  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t _s6CoreREO6EngineCMa()
{
  return self;
}

uint64_t sub_10004DCF8(void *a1, uint64_t a2)
{
  uint64_t v4 = v2;
  *(_OWORD *)(v2 + 64) = 0u;
  uint64_t v7 = v2 + 64;
  uint64_t v8 = v2 + 112;
  *(void *)(v4 + 96) = 0;
  *(_OWORD *)(v4 + 80) = 0u;
  sub_10005484C(v35);
  sub_100054C84((uint64_t)v35, v8, &qword_100095280);
  *(unsigned char *)(v4 + 256) = 1;
  *(void *)(v4 + 264) = 0;
  uint64_t v9 = v4
     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_lastTextureResizeTimestamp;
  uint64_t v10 = sub_10005DE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(unsigned char *)(v4
           + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_textureSizeIsStale) = 1;
  uint64_t v11 = v4
      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  *(unsigned char *)(v4
           + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValid) = 0;
  uint64_t v12 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_snapshotRequests;
  *(void *)(v4 + v12) = sub_1000238AC((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a1;
  long long v13 = *(_OWORD *)(a2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration + 48);
  v33[2] = *(_OWORD *)(a2
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                     + 32);
  void v33[3] = v13;
  uint64_t v34 = *(void *)(a2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration + 64);
  long long v14 = *(_OWORD *)(a2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration + 16);
  v33[0] = *(_OWORD *)(a2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration);
  v33[1] = v14;
  swift_unknownObjectRetain_n();
  swift_retain();
  uint64_t v15 = sub_10005CD70((double *)v33);
  id v17 = [self texture2DDescriptorWithPixelFormat:81 width:v15 height:v16 mipmapped:0];
  [v17 setStorageMode:2];
  [v17 setUsage:23];
  long long v18 = sub_10005D020(a1, v17, 0, 0);
  if (v3)
  {
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    sub_10003EC6C(v7, &qword_100095248);
    sub_100054C84(v8, (uint64_t)v32, &qword_100095280);
    sub_10005164C(v32);
    sub_10003EC6C(v4+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_lastTextureResizeTimestamp, (uint64_t *)&unk_100095290);
    swift_bridgeObjectRelease();
    _s6CoreREO19SceneRenderingStateCMa(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v4 + 32) = v18;
    *(void *)(v4 + 40) = v19;
    *(void *)(v4 + 48) = v20;
    *(void *)(v4 + 56) = v21;
    *(unsigned char *)(v4
             + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_textureSizeIsStale) = 0;
    if (swift_weakLoadStrong())
    {
      long long v22 = *(void **)(v4 + 32);
      uint64_t v23 = *(void *)(v4 + 40);
      uint64_t v25 = *(void *)(v4 + 48);
      char v24 = *(void **)(v4 + 56);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v26 = v24;
      sub_10003C770(v22, v23, v25, v26);
      swift_release();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    if (*(unsigned char *)(v4
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState
                  + 8) == 1)
    {
      if (*(void *)(v4
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState))
        uint64_t v27 = 0x7065656C7361;
      else {
        uint64_t v27 = 0x656B617761;
      }
      if (*(void *)(v4
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState))
        uint64_t v28 = 0xE600000000000000;
      else {
        uint64_t v28 = 0xE500000000000000;
      }
    }
    else
    {
      uint64_t v28 = 0x800000010006F790;
      uint64_t v27 = 0xD000000000000011;
    }
    uint64_t v29 = *(void *)(a2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_metadata);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v32[0] = v29;
    sub_100052D84(v27, v28, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_1000484E8(v29);
    swift_release();
    swift_unknownObjectRelease();
  }
  return v4;
}

BOOL sub_10004E0E4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration;
  if (*(float *)(a1 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration) != *v1) {
    return 1;
  }
  uint64_t v5 = 0;
  long long v6 = *(_OWORD *)(v3 + 16);
  double v7 = *(double *)(v3 + 32);
  long long v8 = *((_OWORD *)v2 + 1);
  double v9 = *((double *)v2 + 4);
  float64x2_t v10 = *(float64x2_t *)(v3 + 56);
  float64x2_t v11 = *(float64x2_t *)(v3 + 40);
  float64x2_t v12 = *(float64x2_t *)(v2 + 14);
  BOOL v13 = 1;
  float64x2_t v14 = *(float64x2_t *)(v2 + 10);
  while (1)
  {
    while (!v13)
    {
      if (v5 == 3) {
        return 1;
      }
      BOOL v13 = 0;
      ++v5;
    }
    long long v24 = v6;
    float v15 = *(float *)((unint64_t)&v24 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    long long v25 = v8;
    float v16 = *(float *)((unint64_t)&v25 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    BOOL v13 = v15 == v16;
    if (v5 == 3) {
      break;
    }
    ++v5;
  }
  BOOL result = 1;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, v14), (int32x4_t)vceqq_f64(v10, v12))), 0xFuLL))) & 1) != 0&& v15 == v16&& v7 == v9)
  {
    uint64_t v19 = *(void *)(a1
                    + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                    + 32);
    int v20 = *(unsigned __int8 *)(a1
                             + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription
                             + 40);
    uint64_t v21 = *((void *)v2 + 14);
    int v22 = *((unsigned __int8 *)v2 + 120);
    if (sub_10002D004(*(__n128 *)(a1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription), *(__n128 *)(a1+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_sceneDescription+ 16), *(__n128 *)(v2 + 20), *(__n128 *)(v2 + 24)))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v23 = sub_100028900(v19, v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0 && ((v20 ^ v22) & 1) == 0) {
        return sub_1000480C0() != *((void *)v2 + 17);
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_10004E280(uint64_t result, char a2)
{
  uint64_t v3 = v2
     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState;
  uint64_t v4 = *(void *)(v2
                 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState);
  int v5 = *(unsigned __int8 *)(v2
                          + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState
                          + 8);
  *(void *)uint64_t v3 = result;
  *(unsigned char *)(v3 + 8) = a2 & 1;
  if (a2)
  {
    if (result)
    {
      if (!v4) {
        int v5 = 0;
      }
      if (v5 == 1) {
        return result;
      }
LABEL_10:
      uint64_t v6 = 0x7065656C7361;
      if (!result) {
        uint64_t v6 = 0x656B617761;
      }
      unint64_t v7 = 0xE600000000000000;
      if (!result) {
        unint64_t v7 = 0xE500000000000000;
      }
      if (a2) {
        uint64_t v8 = v6;
      }
      else {
        uint64_t v8 = 0xD000000000000011;
      }
      if (a2) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = 0x800000010006F790;
      }
      uint64_t v10 = *(void *)(*(void *)(v2 + 16)
                      + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_metadata);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_100052D84(v8, v9, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      return sub_1000484E8(v10);
    }
    if (v4) {
      LOBYTE(v5) = 0;
    }
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    if (v4 != result) {
      LOBYTE(v5) = 1;
    }
    if (v5) {
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t sub_10004E3A0()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_10005DF40();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100015F58((uint64_t *)&unk_100095290);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  BOOL v13 = (char *)&v64 - v12;
  __chkstk_darwin(v11);
  float v15 = (char *)&v64 - v14;
  uint64_t v75 = sub_10005DE60();
  uint64_t v74 = *(void *)(v75 - 8);
  uint64_t v16 = __chkstk_darwin(v75);
  uint64_t v72 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v71 = (char *)&v64 - v18;
  if (sub_10004EC24())
  {
    uint64_t v65 = v13;
    Swift::String v66 = v10;
    uint64_t v69 = v3;
    uint64_t v73 = v1;
    if (*(unsigned char *)(v0
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState
                  + 8) == 1
      && *(void *)(v0
                   + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState))
    {
      uint64_t v19 = *(void **)(v0 + 32);
      int v20 = *(void **)(v0 + 56);
      swift_unknownObjectRetain();
      id v21 = v20;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      if ((char *)[v19 setPurgeableState:1] - 3 < (char *)2) {
        [v19 setPurgeableState:2];
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    uint64_t v67 = v6;
    uint64_t v68 = v4;
    sub_10004E280(0, 1);
    *(unsigned char *)(v0 + 256) = 1;
    int v22 = *(void **)(v0 + 32);
    char v23 = *(void **)(v0 + 56);
    uint64_t v70 = *(void *)(v0 + 16);
    long long v24 = (long long *)(v70 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration);
    long long v25 = *(_OWORD *)(v70
                    + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                    + 48);
    v78[2] = *(_OWORD *)(v70
                       + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                       + 32);
    v78[3] = v25;
    uint64_t v79 = *(void *)(v70
                    + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                    + 64);
    long long v26 = *(_OWORD *)(v70
                    + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration
                    + 16);
    v78[0] = *(_OWORD *)(v70
                       + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE11ClientScene_configuration);
    v78[1] = v26;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v27 = v23;
    id v28 = (id)sub_10005CD70((double *)v78);
    id v30 = v29;
    if ([v22 width] == v28)
    {
      id v31 = [v22 height];
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      if (v31 == v30) {
        goto LABEL_27;
      }
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    if (*(void *)(v0 + 264) >= 0x79uLL)
    {
      uint64_t v35 = v0
          + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_lastTextureResizeTimestamp;
      swift_beginAccess();
      sub_100036430(v35, (uint64_t)v15, (uint64_t *)&unk_100095290);
      uint64_t v36 = v74;
      uint64_t v37 = v75;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v15, 1, v75) == 1)
      {
        sub_10003EC6C((uint64_t)v15, (uint64_t *)&unk_100095290);
      }
      else
      {
        uint64_t v38 = v71;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v71, v15, v37);
        uint64_t v39 = v72;
        sub_10005DE50();
        sub_10005DE40();
        double v41 = v40;
        long long v42 = *(void (**)(char *, uint64_t))(v36 + 8);
        v42(v39, v37);
        v42(v38, v37);
        if (v41 < 1.0)
        {
          char v43 = 1;
LABEL_26:
          *(unsigned char *)(v2
                   + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_textureSizeIsStale) = v43;
LABEL_27:
          sub_100047B7C();
          return sub_10004EDB4();
        }
      }
    }
    long long v44 = *(void **)(v2 + 40);
    long long v45 = *(void **)(v2 + 48);
    uint64_t v46 = *(void **)(v2 + 24);
    long long v47 = v24[3];
    v76[2] = v24[2];
    v76[3] = v47;
    uint64_t v77 = *((void *)v24 + 8);
    long long v49 = *v24;
    long long v48 = v24[1];
    long long v50 = v44;
    v76[0] = v49;
    v76[1] = v48;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    uint64_t v51 = sub_10005CD70((double *)v76);
    id v53 = [self texture2DDescriptorWithPixelFormat:81 width:v51 height:v52 mipmapped:0];
    [v53 setStorageMode:2];
    [v53 setUsage:23];
    uint64_t v54 = v73;
    long long v55 = sub_10005D020(v46, v53, v50, v45);
    if (v54)
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(unsigned char *)(v2 + 256) = 0;
      swift_retain();
      long long v59 = v67;
      sub_10005E3E0();
      swift_release();
      sub_10005DF30();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v59, v69);
      RECameraViewDescriptorsComponentGetComponentType();
      REEntityGetOrAddComponentByClass();
      RECameraViewDescriptorsComponentClearCameraViewDescriptors();
      *(unsigned char *)(v2
               + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValid) = 0;
      return swift_willThrow();
    }
    long long v60 = v58;
    uint64_t v73 = 0;
    sub_100054B7C((uint64_t)v55, v56, v57, v58);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    uint64_t v61 = (uint64_t)v65;
    sub_10005DE50();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v74 + 56))(v61, 0, 1, v75);
    uint64_t v62 = (uint64_t)v66;
    sub_100054C84(v61, (uint64_t)v66, (uint64_t *)&unk_100095290);
    uint64_t v63 = v2
        + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_lastTextureResizeTimestamp;
    swift_beginAccess();
    sub_100054CE8(v62, v63, (uint64_t *)&unk_100095290);
    swift_endAccess();
    char v43 = 0;
    goto LABEL_26;
  }
  swift_retain();
  sub_10005E3E0();
  swift_release();
  sub_10005DF30();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  RECameraViewDescriptorsComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  RECameraViewDescriptorsComponentClearCameraViewDescriptors();
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValid) = 0;
  *(unsigned char *)(v0 + 256) = 0;
  uint64_t v32 = *(void *)(v0
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_awakeState
                + 8) == 1)
  {
    char v33 = v32 != 0;
    uint64_t result = 1;
    return sub_10004E280(result, v33);
  }
  uint64_t result = v32 + 1;
  if (!__OFADD__(v32, 1))
  {
    if (result > 59)
    {
      [*(id *)(v0 + 32) setPurgeableState:3];
      uint64_t result = 1;
      char v33 = 1;
    }
    else
    {
      char v33 = 0;
    }
    return sub_10004E280(result, v33);
  }
  __break(1u);
  return result;
}

uint64_t sub_10004EC24()
{
  uint64_t v1 = v0;
  id v2 = [*(id *)(v0 + 48) signaledValue];
  if (v2 != [*(id *)(v1 + 40) signaledValue]) {
    return 0;
  }
  sub_100054C84(v1 + 112, (uint64_t)v9, &qword_100095280);
  sub_100054C84((uint64_t)v9, (uint64_t)v10, &qword_100095280);
  if (sub_100054B64((uint64_t)v10) == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    int v21 = v10[0];
    long long v22 = v11;
    long long v23 = v12;
    long long v24 = v13;
    uint64_t v25 = v14;
    long long v26 = v15;
    long long v27 = v16;
    uint64_t v28 = v17;
    char v29 = v18;
    uint64_t v30 = v19;
    uint64_t v31 = v20;
    uint64_t v5 = *(void *)(v1 + 16);
    sub_100054C84((uint64_t)v9, (uint64_t)&v8, &qword_100095280);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    BOOL v3 = sub_10004E0E4(v5);
    sub_10005164C(v9);
  }
  char v6 = sub_100047F18();
  uint64_t v7 = v1
     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_snapshotRequests;
  swift_beginAccess();
  if (v3 || (v6 & 1) != 0 || *(uint64_t *)(*(void *)v7 + 16) > 0 || *(void *)(v1 + 264) <= 0x77uLL) {
    return 1;
  }
  else {
    return *(unsigned __int8 *)(v1
  }
                              + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_textureSizeIsStale);
}

uint64_t sub_10004EDB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005DED0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015F58(&qword_100093678);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10005DF40();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  long long v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v0 + 16);
  swift_retain();
  sub_10005E3E0();
  swift_release();
  sub_10005DF30();
  long long v13 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v39 = v9;
  uint64_t v14 = v9;
  long long v15 = v13;
  v13(v12, v14);
  RECameraViewDescriptorsComponentGetComponentType();
  uint64_t v35 = (void *)REEntityGetOrAddComponentByClass();
  uint64_t v32 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValid;
  char v16 = *(unsigned char *)(v0
                 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValid);
  uint64_t v40 = v0;
  if ((v16 & 1) == 0)
  {
    swift_retain();
    sub_10005E3E0();
    swift_release();
    sub_10005DF30();
    v15(v12, v39);
    RECameraViewDescriptorsComponentGetComponentType();
    REEntityGetOrAddComponentByClass();
    RECameraViewDescriptorsComponentClearCameraViewDescriptors();
    *(unsigned char *)(v40 + v32) = 0;
    RECameraViewDescriptorsComponentAddViewDescriptor();
    RECameraViewDescriptorsComponentAddSpecifyCommandFromTexture();
    RECameraViewDescriptorsComponentCameraViewDescriptorSetViewport();
    RECameraViewDescriptorsComponentCameraViewDescriptorCopySettingStruct();
    RERenderGraphDataStructAddFloat4();
    RECameraViewDescriptorsComponentCameraViewDescriptorSetSettingStruct();
    RERelease();
    uint64_t v1 = v40;
  }
  uint64_t v17 = (uint64_t *)(v1
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_snapshotRequests);
  swift_beginAccess();
  uint64_t v18 = *v17;
  uint64_t v19 = *(void *)(*v17 + 64);
  uint64_t v33 = *v17 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(v18 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  int64_t v34 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v38 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v36 = v3 + 48;
  uint64_t v39 = v18;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v24 = 0;
  uint64_t v25 = v40;
  if (!v22) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v26 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  for (unint64_t i = v26 | (v24 << 6); ; unint64_t i = __clz(__rbit64(v29)) + (v24 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(void *)(v39 + 48) + *(void *)(v3 + 72) * i, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
      goto LABEL_29;
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    id v31 = [*(id *)(v25 + 32) device];
    sub_10004F844((uint64_t)v5, v35, v31);
    swift_unknownObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v22) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v28 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v28 >= v34) {
      goto LABEL_28;
    }
    unint64_t v29 = *(void *)(v33 + 8 * v28);
    ++v24;
    if (!v29)
    {
      int64_t v24 = v28 + 1;
      if (v28 + 1 >= v34) {
        goto LABEL_28;
      }
      unint64_t v29 = *(void *)(v33 + 8 * v24);
      if (!v29)
      {
        int64_t v24 = v28 + 2;
        if (v28 + 2 >= v34) {
          goto LABEL_28;
        }
        unint64_t v29 = *(void *)(v33 + 8 * v24);
        if (!v29)
        {
          int64_t v24 = v28 + 3;
          if (v28 + 3 >= v34) {
            goto LABEL_28;
          }
          unint64_t v29 = *(void *)(v33 + 8 * v24);
          if (!v29)
          {
            int64_t v24 = v28 + 4;
            if (v28 + 4 >= v34) {
              goto LABEL_28;
            }
            unint64_t v29 = *(void *)(v33 + 8 * v24);
            if (!v29) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v22 = (v29 - 1) & v29;
  }
  int64_t v30 = v28 + 5;
  if (v30 >= v34)
  {
LABEL_28:
    (*v38)(v8, 1, 1, v2);
LABEL_29:
    uint64_t result = swift_release();
    *(unsigned char *)(v40 + v32) = 1;
    return result;
  }
  unint64_t v29 = *(void *)(v33 + 8 * v30);
  if (v29)
  {
    int64_t v24 = v30;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v24 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v24 >= v34) {
      goto LABEL_28;
    }
    unint64_t v29 = *(void *)(v33 + 8 * v24);
    ++v30;
    if (v29) {
      goto LABEL_24;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t (*sub_10004F388())()
{
  return j__swift_endAccess;
}

uint64_t sub_10004F3E4(uint64_t a1, void *a2, unint64_t a3, int a4)
{
  int v37 = a4;
  unint64_t v35 = a3;
  id v38 = a2;
  uint64_t v40 = sub_10005DED0();
  uint64_t v6 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  long long v42 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100015F58(&qword_100094C80);
  uint64_t v39 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015F58((uint64_t *)&unk_1000952D0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  long long v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  long long v15 = (char *)&v35 - v14;
  uint64_t v16 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (uint64_t *)(v4
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_snapshotRequests);
  swift_beginAccess();
  uint64_t v21 = *v20;
  uint64_t v22 = *(void *)(*v20 + 16);
  uint64_t v41 = a1;
  if (!v22)
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v25(v15, 1, 1, v16);
LABEL_7:
    sub_10003EC6C((uint64_t)v15, (uint64_t *)&unk_1000952D0);
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_10002B7C8(a1);
  if (v24)
  {
    sub_100054A9C(*(void *)(v21 + 56) + *(void *)(v17 + 72) * v23, (uint64_t)v15);
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v25(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v25(v15, 1, 1, v16);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1) {
    goto LABEL_7;
  }
  sub_10003347C((uint64_t)v15, (uint64_t)v19);
  uint64_t v26 = v36;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v9, &v19[*(int *)(v16 + 20)], v36);
  char v27 = v37;
  if ((v37 & 0x100) != 0)
  {
    sub_1000161C4();
    uint64_t v29 = swift_allocError();
    uint64_t v30 = (uint64_t)v38;
    unint64_t v31 = v35;
    *(void *)uint64_t v32 = v38;
    *(void *)(v32 + 8) = v31;
    *(unsigned char *)(v32 + 16) = v27;
    uint64_t v43 = v29;
    sub_100018434(v30, v31, v27);
    sub_10005E810();
  }
  else
  {
    uint64_t v43 = (uint64_t)v38;
    id v28 = v38;
    sub_10005E820();
  }
  (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v26);
  sub_1000548B0((uint64_t)v19);
LABEL_12:
  uint64_t v33 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v42, v41, v40);
  v25(v13, 1, 1, v16);
  swift_beginAccess();
  sub_10004B6F0((uint64_t)v13, v33);
  return swift_endAccess();
}

uint64_t sub_10004F844(uint64_t a1, void *a2, void *a3)
{
  id v50 = a3;
  id v48 = a2;
  uint64_t v5 = (void *)sub_10005DED0();
  uint64_t v51 = *(v5 - 1);
  uint64_t v6 = *(void *)(v51 + 64);
  uint64_t v7 = __chkstk_darwin(v5);
  long long v49 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = sub_100015F58((uint64_t *)&unk_1000952D0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (double *)((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = (uint64_t *)(v3
                  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_snapshotRequests);
  swift_beginAccess();
  uint64_t v18 = *v17;
  if (!*(void *)(v18 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    return sub_10003EC6C((uint64_t)v12, (uint64_t *)&unk_1000952D0);
  }
  swift_bridgeObjectRetain();
  uint64_t v47 = a1;
  unint64_t v19 = sub_10002B7C8(a1);
  if (v20)
  {
    sub_100054A9C(*(void *)(v18 + 56) + *(void *)(v14 + 72) * v19, (uint64_t)v12);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v21, 1, v13);
  swift_bridgeObjectRelease();
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v22(v12, 1, v13) == 1) {
    return sub_10003EC6C((uint64_t)v12, (uint64_t *)&unk_1000952D0);
  }
  uint64_t result = sub_10003347C((uint64_t)v12, (uint64_t)v16);
  if (*((unsigned char *)v16 + *(int *)(v13 + 24))) {
    return sub_1000548B0((uint64_t)v16);
  }
  double v24 = *v16;
  if ((~*(void *)v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v24 >= 9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  double v25 = v16[1];
  if ((~*(void *)&v25 & 0x7FF0000000000000) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v25 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v25 < 9.22337204e18)
  {
    id v26 = [self texture2DDescriptorWithPixelFormat:81 width:(uint64_t)v24 height:(uint64_t)v25 mipmapped:0];
    [v26 setUsage:23];
    [v26 setStorageMode:0];
    id v27 = [v50 newTextureWithDescriptor:v26];

    if (v27)
    {
      uint64_t RenderGraphDataStruct = RERenderGraphCreateRenderGraphDataStruct();
      RERenderGraphDataStructAddFloat4();
      uint64_t v42 = swift_allocObject();
      swift_weakInit();
      uint64_t v46 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v22;
      uint64_t v28 = v51;
      uint64_t v29 = *(void (**)(char *, uint64_t, id))(v51 + 16);
      uint64_t v43 = v51 + 16;
      long long v44 = v29;
      v29(v9, v47, v5);
      unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
      id v50 = v5;
      id v31 = v27;
      unint64_t v32 = (v6 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = v42;
      (*(void (**)(unint64_t, char *, id))(v28 + 32))(v33 + v30, v9, v50);
      *(void *)(v33 + v32) = v31;
      aBlock[4] = sub_1000549F4;
      aBlock[5] = v33;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10004FF00;
      aBlock[3] = &unk_100084880;
      int64_t v34 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      swift_release();
      id v48 = v31;
      id v35 = v50;
      RECameraViewDescriptorsComponentSnapshotNextFrameWithSettings();
      _Block_release(v34);
      uint64_t v36 = v49;
      v44(v49, v47, v35);
      int v37 = sub_10004F388();
      id v38 = sub_10004FF44(v52);
      uint64_t v40 = v39;
      if (!v46(v39, 1, v13)) {
        *(unsigned char *)(v40 + *(int *)(v13 + 24)) = 1;
      }
      ((void (*)(void *, void))v38)(v52, 0);
      (*(void (**)(char *, id))(v51 + 8))(v36, v35);
      ((void (*)(void *, void))v37)(aBlock, 0);
      RERelease();
      swift_unknownObjectRelease();
    }
    else
    {
      sub_10004F3E4(v47, (void *)0xD000000000000022, 0x800000010006F7E0, 261);
    }
    return sub_1000548B0((uint64_t)v16);
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10004FE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000500AC(a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_10004FF00(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void (*sub_10004FF44(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  uint64_t v3 = sub_10005DED0();
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  v2[5] = v4;
  uint64_t v6 = malloc(*(void *)(v4 + 64));
  v2[6] = v6;
  (*(void (**)(void))(v5 + 16))();
  v2[7] = sub_1000540FC(v2, (uint64_t)v6);
  return sub_100050034;
}

void sub_100050034(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 48);
  uint64_t v3 = *(void *)(*a1 + 32);
  uint64_t v4 = *(void *)(*a1 + 40);
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);

  free(v1);
}

void sub_1000500AC(uint64_t a1, uint64_t a2)
{
  CGColorSpaceRef v4 = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
  if (v4)
  {
    CGColorSpaceRef v5 = v4;
    sub_100015F58((uint64_t *)&unk_1000952C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000716D0;
    *(void *)(inited + 32) = kCIContextWorkingColorSpace;
    type metadata accessor for CGColorSpace(0);
    *(void *)(inited + 40) = v5;
    *(void *)(inited + 64) = v7;
    *(void *)(inited + 72) = kCIContextOutputColorSpace;
    *(void *)(inited + 104) = v7;
    *(void *)(inited + 80) = v5;
    uint64_t v8 = v5;
    uint64_t v9 = kCIContextWorkingColorSpace;
    uint64_t v10 = kCIContextOutputColorSpace;
    sub_100023AC8(inited);
    id v11 = objc_allocWithZone((Class)CIContext);
    type metadata accessor for CIContextOption(0);
    sub_100054868(&qword_100093760, type metadata accessor for CIContextOption);
    Class isa = sub_10005E6A0().super.isa;
    swift_bridgeObjectRelease();
    id v13 = [v11 initWithOptions:isa];

    id v14 = [objc_allocWithZone((Class)CIImage) initWithMTLTexture:a2 options:0];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = [v14 imageByApplyingCGOrientation:4];

      if (v16)
      {
        [v16 extent];
        id v17 = [v13 createCGImage:v16 fromRect:kCIFormatBGRA8 colorSpace:v8];
        if (v17)
        {
          uint64_t v18 = v17;
          id v19 = v17;
          sub_10004F3E4(a1, v18, 0, 0);

LABEL_8:
          return;
        }
      }
    }
    sub_10004F3E4(a1, (void *)0xD000000000000024, 0x800000010006F7B0, 261);
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t sub_1000502FC()
{
  if (*(unsigned char *)(v0 + 8) != 1) {
    return 0xD000000000000011;
  }
  if (*(void *)v0) {
    return 0x7065656C7361;
  }
  return 0x656B617761;
}

uint64_t sub_100050358(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 8);
  unsigned int v3 = (*(void *)a1 == *(void *)a2) & ~v2;
  if (*(void *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(void *)a2) {
    unsigned int v2 = 0;
  }
  if (*(void *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 8) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t sub_100050394()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void **)(v0 + 56);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_10003EC6C(v0 + 64, &qword_100095248);
  sub_100054C84(v0 + 112, (uint64_t)v3, &qword_100095280);
  sub_10005164C(v3);
  sub_10003EC6C(v0+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_lastTextureResizeTimestamp, (uint64_t *)&unk_100095290);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100050448()
{
  uint64_t v0 = sub_100050394();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10005049C()
{
  return _s6CoreREO19SceneRenderingStateCMa(0);
}

uint64_t _s6CoreREO19SceneRenderingStateCMa(uint64_t a1)
{
  return sub_1000157B4(a1, (uint64_t *)&unk_100094F20);
}

void sub_1000504C4()
{
  sub_1000505BC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000505BC()
{
  if (!qword_100094F30)
  {
    sub_10005DE60();
    unint64_t v0 = sub_10005E990();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100094F30);
    }
  }
}

void *sub_100050614(_OWORD *a1, void *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    void *v4 = *a2;
    unsigned int v4 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_OWORD *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100015F58(&qword_100094C80);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_100050700(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_100015F58(&qword_100094C80);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

_OWORD *sub_10005076C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100015F58(&qword_100094C80);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_100050808(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100015F58(&qword_100094C80);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_1000508AC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100015F58(&qword_100094C80);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_100050948(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100015F58(&qword_100094C80);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000509E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000509F8);
}

uint64_t sub_1000509F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015F58(&qword_100094C80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100050AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100050AE4);
}

uint64_t sub_100050AE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100015F58(&qword_100094C80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(uint64_t a1)
{
  return sub_1000157B4(a1, (uint64_t *)&unk_1000951D8);
}

void sub_100050BC8()
{
  sub_100050C68();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100050C68()
{
  if (!qword_1000951E8)
  {
    type metadata accessor for CGImage(255);
    sub_100016310(&qword_100094C00);
    unint64_t v0 = sub_10005E830();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000951E8);
    }
  }
}

uint64_t _s6CoreREO19SceneRenderingStateC10AwakeStateOwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s6CoreREO19SceneRenderingStateC10AwakeStateOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_100050D2C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100050D48(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *_s6CoreREO19SceneRenderingStateC10AwakeStateOMa()
{
  return &_s6CoreREO19SceneRenderingStateC10AwakeStateON;
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwxx()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwcp(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v6 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwca(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

__n128 _s6CoreREO19SceneRenderingStateC12FrameReceiptVwtk(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwta(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 112);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6CoreREO19SceneRenderingStateC12FrameReceiptVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
      *(void *)(result + 112) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6CoreREO19SceneRenderingStateC12FrameReceiptVMa()
{
  return &_s6CoreREO19SceneRenderingStateC12FrameReceiptVN;
}

ValueMetadata *_s6CoreREOMa()
{
  return &_s6CoreREON;
}

uint64_t sub_10005104C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10005108C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100018B00;
  return sub_10004D824(a1, v4, v5, v6);
}

uint64_t sub_100051140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_10005EA30();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_100051244, 0, 0);
}

uint64_t sub_100051244()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_10005EA50();
  uint64_t v5 = sub_100054868(&qword_100095268, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_10005ECA0();
  sub_100054868(&qword_100095270, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_10005EA60();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  long long v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_1000513E4;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_1000513E4()
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
    return _swift_task_switch(sub_1000515A0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_1000515A0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10005160C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100051644()
{
  return sub_10004CD40();
}

uint64_t *sub_10005164C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1000516A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t result = a15;
  if (a15)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000516F4(uint64_t a1, char a2)
{
  return sub_100051A34(a1, a2, &qword_100094928);
}

uint64_t sub_100051700(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100015F58((uint64_t *)&unk_1000952E0);
  char v42 = a2;
  uint64_t v6 = sub_10005EAE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    double v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    id v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_10005ED40();
    sub_10005E770();
    uint64_t result = sub_10005EDA0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    id v19 = (void *)(*(void *)(v7 + 48) + v18);
    *id v19 = v34;
    v19[1] = v33;
    char v20 = (void *)(*(void *)(v7 + 56) + v18);
    *char v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  double v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100051A28(uint64_t a1, char a2)
{
  return sub_100051A34(a1, a2, &qword_100094BF8);
}

uint64_t sub_100051A34(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_100015F58(a3);
  char v41 = a2;
  uint64_t v7 = sub_10005EAE0();
  uint64_t v8 = v7;
  if (*(void *)(v6 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
    int64_t v40 = (void *)(v6 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v6 + 64);
    int64_t v39 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v23 = v22 | (v14 << 6);
      }
      else
      {
        int64_t v24 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v24 >= v39) {
          goto LABEL_33;
        }
        unint64_t v25 = v40[v24];
        ++v14;
        if (!v25)
        {
          int64_t v14 = v24 + 1;
          if (v24 + 1 >= v39) {
            goto LABEL_33;
          }
          unint64_t v25 = v40[v14];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v39)
            {
LABEL_33:
              swift_release();
              uint64_t v4 = v3;
              if (v41)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v6 + 32);
                if (v38 >= 64) {
                  bzero(v40, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v40 = -1 << v38;
                }
                *(void *)(v6 + 16) = 0;
              }
              break;
            }
            unint64_t v25 = v40[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v14 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v39) {
                  goto LABEL_33;
                }
                unint64_t v25 = v40[v14];
                ++v26;
                if (v25) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v26;
          }
        }
LABEL_30:
        unint64_t v11 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v14 << 6);
      }
      uint64_t v31 = 16 * v23;
      unint64_t v32 = (uint64_t *)(*(void *)(v6 + 48) + v31);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      id v35 = (uint64_t *)(*(void *)(v6 + 56) + v31);
      uint64_t v37 = *v35;
      uint64_t v36 = v35[1];
      if ((v41 & 1) == 0)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_10005ED40();
      sub_10005E770();
      uint64_t result = sub_10005EDA0();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v17 == v28;
          if (v17 == v28) {
            unint64_t v17 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v12 + 8 * v17);
        }
        while (v30 == -1);
        unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      char v20 = (void *)(*(void *)(v8 + 48) + v19);
      *char v20 = v34;
      v20[1] = v33;
      unint64_t v21 = (void *)(*(void *)(v8 + 56) + v19);
      *unint64_t v21 = v37;
      v21[1] = v36;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_100051D4C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100015F58(&qword_100094058);
  uint64_t result = sub_10005EAE0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  uint64_t *v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_10005ED30();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100052004(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100015F58((uint64_t *)&unk_1000952A0);
  char v36 = a2;
  uint64_t v6 = sub_10005EAE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v2;
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v35 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v35 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v35 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v35 + 8 * v14);
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v21);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    if ((v36 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_10005ED40();
    sub_10005E770();
    uint64_t result = sub_10005EDA0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
    unint64_t v19 = (void *)(*(void *)(v7 + 56) + 16 * v18);
    *unint64_t v19 = v31;
    v19[1] = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v23 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v23, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100052308(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t v49 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005DED0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100015F58(&qword_100094068);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_10005EAE0();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  long long v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  unint64_t v21 = v51;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    char v26 = v46;
    unint64_t v27 = v46[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
    unint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_10003347C(v32 + v33 * v24, v54);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_100054A9C(v34 + v33 * v24, v54);
    }
    sub_100054868(&qword_100094070, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_10005E6C0();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      unint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      unint64_t v21 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v13 + 48) + v22 * v30), (unint64_t)v21, v53);
    uint64_t result = sub_10003347C(v54, *(void *)(v13 + 56) + v22 * v33);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  char v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v13;
  return result;
}

uint64_t sub_1000527E4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v51 = sub_10005DED0();
  uint64_t v5 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100015F58((uint64_t *)&unk_1000952B0);
  int v52 = a2;
  uint64_t v9 = sub_10005EAE0();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    int64_t v45 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v47 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v46 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v48 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v53 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v49 = v8;
    int v50 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v21 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v22 = v21 | (v17 << 6);
      }
      else
      {
        int64_t v23 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v46) {
          goto LABEL_34;
        }
        unint64_t v24 = v47[v23];
        ++v17;
        if (!v24)
        {
          int64_t v17 = v23 + 1;
          if (v23 + 1 >= v46) {
            goto LABEL_34;
          }
          unint64_t v24 = v47[v17];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v46)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v45;
              if (v52)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v8 + 32);
                if (v43 >= 64) {
                  bzero(v47, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v47 = -1 << v43;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v47[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v17 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v46) {
                  goto LABEL_34;
                }
                unint64_t v24 = v47[v17];
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
        unint64_t v14 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v17 << 6);
      }
      uint64_t v26 = v5;
      uint64_t v27 = *(void *)(v5 + 72);
      unint64_t v28 = *(void *)(v8 + 48) + v27 * v22;
      uint64_t v29 = v50;
      uint64_t v30 = v51;
      if (v52)
      {
        (*v53)(v50, v28, v51);
        unint64_t v31 = (long long *)(*(void *)(v8 + 56) + 32 * v22);
        long long v32 = v31[1];
        long long v54 = *v31;
        long long v55 = v32;
      }
      else
      {
        (*v48)(v50, v28, v51);
        uint64_t v33 = (long long *)(*(void *)(v8 + 56) + 32 * v22);
        long long v34 = v33[1];
        long long v54 = *v33;
        long long v55 = v34;
        swift_retain();
        swift_unknownObjectRetain();
        swift_retain();
        id v35 = *((id *)&v55 + 1);
      }
      sub_100054868(&qword_100094070, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_10005E6C0();
      uint64_t v36 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v15 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v37) & ~*(void *)(v15 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v15 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v18 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v53)(*(void *)(v10 + 48) + v27 * v18, v29, v30);
      unint64_t v19 = (_OWORD *)(*(void *)(v10 + 56) + 32 * v18);
      long long v20 = v55;
      *unint64_t v19 = v54;
      v19[1] = v20;
      ++*(void *)(v10 + 16);
      uint64_t v5 = v26;
      uint64_t v8 = v49;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_100052C48(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10002B784(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000537C8();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_100051D4C(result, a3 & 1);
  uint64_t result = sub_10002B784(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10005EC90();
  __break(1u);
  return result;
}

uint64_t sub_100052D84(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10002DA54();
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10005396C();
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = (void *)(*(void *)(v16 + 56) + 16 * v10);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v17 = a1;
      v17[1] = a2;
      return result;
    }
LABEL_11:
    *(void *)(v16 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    uint64_t v19 = (void *)(*(void *)(v16 + 56) + 16 * v10);
    *uint64_t v19 = a1;
    v19[1] = a2;
    uint64_t v20 = *(void *)(v16 + 16);
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      *(void *)(v16 + 16) = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_100052004(result, a3 & 1);
  uint64_t result = sub_10002DA54();
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = *v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10005EC90();
  __break(1u);
  return result;
}

uint64_t sub_100052EB0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_10005DED0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = (void *)*v3;
  unint64_t v14 = sub_10002B7C8(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_100053B0C();
      goto LABEL_7;
    }
    sub_100052308(v17, a3 & 1);
    unint64_t v24 = sub_10002B7C8(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_100053280(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_10005EC90();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21 + *(void *)(*(void *)(_s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0) - 8) + 72) * v14;

  return sub_100054B00(a1, v22);
}

uint64_t sub_100053098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v31 = a2;
  uint64_t v11 = sub_10005DED0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)*v6;
  unint64_t v17 = sub_10002B7C8(a5);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a6 & 1) != 0)
  {
LABEL_7:
    int64_t v23 = *v7;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7] + 32 * v17;

      swift_release();
      swift_unknownObjectRelease();
      uint64_t result = swift_release();
      uint64_t v26 = v31;
      *(void *)uint64_t v24 = a1;
      *(void *)(v24 + 8) = v26;
      uint64_t v27 = v33;
      *(void *)(v24 + 16) = v32;
      *(void *)(v24 + 24) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a6 & 1) == 0)
  {
    sub_100053E24();
    goto LABEL_7;
  }
  sub_1000527E4(v20, a6 & 1);
  unint64_t v28 = sub_10002B7C8(a5);
  if ((v21 & 1) != (v29 & 1))
  {
LABEL_14:
    uint64_t result = sub_10005EC90();
    __break(1u);
    return result;
  }
  unint64_t v17 = v28;
  int64_t v23 = *v7;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
  return sub_10005335C(v17, (uint64_t)v14, a1, v31, v32, v33, v23);
}

uint64_t sub_100053280(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_10005DED0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t result = sub_10003347C(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
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

uint64_t sub_10005335C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v14 = a7[6];
  uint64_t v15 = sub_10005DED0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a2, v15);
  unint64_t v17 = (void *)(a7[7] + 32 * a1);
  *unint64_t v17 = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  uint64_t v18 = a7[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a7[2] = v20;
  }
  return result;
}

void *sub_100053430()
{
  return sub_100053604(&qword_100094928);
}

void *sub_10005343C()
{
  uint64_t v1 = v0;
  sub_100015F58((uint64_t *)&unk_1000952E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10005EAD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000535F8()
{
  return sub_100053604(&qword_100094BF8);
}

void *sub_100053604(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_100015F58(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_10005EAD0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    int64_t v26 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v14) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v7 + 8 * v26);
    ++v10;
    if (!v27)
    {
      int64_t v10 = v26 + 1;
      if (v26 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v7 + 8 * v10);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v27 - 1) & v27;
    unint64_t v16 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = *(void *)(v3 + 56);
    uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v23 = *(void *)(v18 + v17);
    uint64_t v22 = *(void *)(v18 + v17 + 8);
    uint64_t v24 = (void *)(*(void *)(v5 + 48) + v17);
    void *v24 = v20;
    v24[1] = v21;
    int64_t v25 = (void *)(*(void *)(v5 + 56) + v17);
    *int64_t v25 = v23;
    v25[1] = v22;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v14) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v7 + 8 * v28);
  if (v27)
  {
    int64_t v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v7 + 8 * v10);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000537C8()
{
  uint64_t v1 = v0;
  sub_100015F58(&qword_100094058);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10005EAD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10005396C()
{
  uint64_t v1 = v0;
  sub_100015F58((uint64_t *)&unk_1000952A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10005EAD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 56) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 56) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100053B0C()
{
  uint64_t v1 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t v30 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015F58(&qword_100094068);
  int64_t v25 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_10005EAD0();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 16);
  if (!v11)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *int64_t v25 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    uint64_t v11 = *(void *)(v8 + 16);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = v11;
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v26 = v8 + 64;
  int64_t v27 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v28 = v5 + 32;
  uint64_t v29 = v5 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v14);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    unint64_t v21 = *(void *)(v30 + 72) * v19;
    sub_100054A9C(*(void *)(v8 + 56) + v21, (uint64_t)v3);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
    uint64_t result = (void *)sub_10003347C((uint64_t)v3, *(void *)(v10 + 56) + v21);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v27) {
    goto LABEL_23;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v14 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v14);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_100053E24()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005DED0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015F58((uint64_t *)&unk_1000952B0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_10005EAD0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (id)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v28 = v1;
  id result = (id)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v29 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v30 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v31 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v30) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v30) {
        goto LABEL_23;
      }
      unint64_t v26 = *(void *)(v29 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v16 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    unint64_t v19 = (long long *)(*(void *)(v6 + 56) + v18);
    unint64_t v20 = *(void *)(v8 + 48) + v17;
    unint64_t v21 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    long long v22 = v19[1];
    long long v32 = *v19;
    long long v33 = v22;
    v21(v20, v5, v2);
    unint64_t v23 = (_OWORD *)(*(void *)(v8 + 56) + v18);
    long long v24 = v33;
    *unint64_t v23 = v32;
    v23[1] = v24;
    swift_retain();
    swift_unknownObjectRetain();
    swift_retain();
    id result = *((id *)&v33 + 1);
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v30)
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t v1 = v28;
    goto LABEL_25;
  }
  unint64_t v26 = *(void *)(v29 + 8 * v27);
  if (v26)
  {
    int64_t v11 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v30) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void (*sub_1000540FC(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x68uLL);
  *a1 = v4;
  uint64_t v5 = sub_10005DED0();
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  v4[9] = v6;
  uint64_t v8 = malloc(*(void *)(v6 + 64));
  v4[10] = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v8, a2, v5);
  v4[11] = sub_100054524(v4);
  v4[12] = sub_1000542B4(v4 + 4, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  return sub_10005421C;
}

void sub_10005421C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 88);
  uint64_t v4 = *(void *)(*(void *)a1 + 72);
  uint64_t v3 = *(void **)(*(void *)a1 + 80);
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 96))();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0);
  free(v3);

  free(v1);
}

void (*sub_1000542B4(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  void *v8 = a2;
  v8[1] = v3;
  uint64_t v9 = sub_100015F58((uint64_t *)&unk_1000952D0);
  unint64_t v10 = malloc(*(void *)(*(void *)(v9 - 8) + 64));
  v8[2] = v10;
  uint64_t v11 = *v3;
  unint64_t v13 = sub_10002B7C8(a2);
  *((unsigned char *)v8 + 32) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*v4 + 56);
        uint64_t v20 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
        uint64_t v21 = *(void *)(v20 - 8);
        sub_10003347C(v19 + *(void *)(v21 + 72) * v13, (uint64_t)v10);
        uint64_t v22 = 0;
LABEL_12:
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v10, v22, 1, v20);
        return sub_1000544C4;
      }
LABEL_11:
      uint64_t v20 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v22 = 1;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_100053B0C();
      goto LABEL_7;
    }
    sub_100052308(v16, a3 & 1);
    unint64_t v23 = sub_10002B7C8(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      v8[3] = v23;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  sub_10005DED0();
  id result = (void (*)(uint64_t **))sub_10005EC90();
  __break(1u);
  return result;
}

void sub_1000544C4(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)(*a1)[2];
  sub_100054560((uint64_t)v2, *((unsigned __int8 *)*a1 + 32), (uint64_t *)(*a1)[1], (*a1)[3], **a1);
  sub_10003EC6C((uint64_t)v2, (uint64_t *)&unk_1000952D0);
  free(v2);

  free(v1);
}

uint64_t (*sub_100054524(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_100054554;
}

uint64_t sub_100054554(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

unint64_t sub_100054560(uint64_t a1, int a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v23 = a5;
  unint64_t v25 = a4;
  int v26 = a2;
  uint64_t v7 = sub_10005DED0();
  uint64_t v24 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015F58((uint64_t *)&unk_1000952D0);
  __chkstk_darwin(v10 - 8);
  char v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  char v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v23 - v18;
  sub_100036430(a1, (uint64_t)v12, (uint64_t *)&unk_1000952D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    unint64_t result = sub_10003EC6C((uint64_t)v12, (uint64_t *)&unk_1000952D0);
    if (v26)
    {
      int64_t v21 = v25;
      swift_arrayDestroy();
      return sub_10005B15C(v21, *a3);
    }
  }
  else
  {
    sub_10003347C((uint64_t)v12, (uint64_t)v19);
    uint64_t v22 = (void *)*a3;
    if (v26)
    {
      return sub_10003347C((uint64_t)v19, v22[7] + *(void *)(v14 + 72) * v25);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v9, v23, v7);
      sub_10003347C((uint64_t)v19, (uint64_t)v17);
      return sub_100053280(v25, (uint64_t)v9, (uint64_t)v17, v22);
    }
  }
  return result;
}

uint64_t sub_100054804()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100054844()
{
  return sub_10004D3A8();
}

double sub_10005484C(_OWORD *a1)
{
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_100054868(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000548B0(uint64_t a1)
{
  uint64_t v2 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10005490C()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_1000549F4()
{
  uint64_t v1 = *(void *)(sub_10005DED0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10004FE8C(v3, v0 + v2, v4);
}

uint64_t sub_100054A84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100054A94()
{
  return swift_release();
}

uint64_t sub_100054A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100054B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100054B64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 112);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_100054B7C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = (void *)v5[7];
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = (void *)v5[4];
    uint64_t v11 = v5[5];
    uint64_t v12 = v5[6];
    uint64_t v13 = (void *)v5[7];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v14 = v13;
    sub_10003C770(v10, v11, v12, v14);
    swift_release();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t result = swift_unknownObjectRelease();
  }
  *((unsigned char *)v5
  + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreREP33_6B26D7FDF97DFF6774F3E1B8C546A30619SceneRenderingState_viewDescriptorsValvoid (*v44)(char *, uint64_t, id) = 0;
  return result;
}

uint64_t sub_100054C84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100015F58(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100054CE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100015F58(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

NSString sub_100054D54()
{
  NSString result = sub_10005E6F0();
  static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName = (uint64_t)result;
  return result;
}

uint64_t *CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.unsafeMutableAddressor()
{
  if (qword_100093128 != -1) {
    swift_once();
  }
  return &static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName;
}

id static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter()
{
  return sub_10005533C(&qword_100093128, (void **)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName);
}

uint64_t CRLDeviceManagementRestrictionsManager.isMathPaperSolvingAllowed.getter()
{
  unint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess();
  return *v1;
}

uint64_t CRLDeviceManagementRestrictionsManager.isKeyboardMathSolvingAllowed.getter()
{
  unint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  swift_beginAccess();
  return *v1;
}

uint64_t CRLDeviceManagementRestrictionsManager.isDefinitionLookupAllowed.getter()
{
  unint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  return *v1;
}

id sub_1000550B4()
{
  uint64_t v1 = OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = [self sharedConnection];
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_100055904(v4);
  }
  sub_100055914(v2);
  return v3;
}

id CRLDeviceManagementRestrictionsManager.__deallocating_deinit()
{
  id v1 = sub_1000550B4();
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 unregisterObserver:v0];
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CRLDeviceManagementRestrictionsManager()
{
  return self;
}

void sub_100055230()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for CRLDeviceManagementRestrictionsManager()) init];
  CRLDeviceManagementRestrictionsManager.registerObserver()();
  qword_1000952F0 = (uint64_t)v0;
}

id CRLDeviceManagementRestrictionsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_1000552C8(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  id v5 = *a4;

  return v5;
}

id static CRLDeviceManagementRestrictionsManager.shared.getter()
{
  return sub_10005533C(&qword_100093130, (void **)&qword_1000952F0);
}

id sub_10005533C(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;

  return v3;
}

Swift::Void __swiftcall CRLDeviceManagementRestrictionsManager.registerObserver()()
{
  id v1 = sub_1000550B4();
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 registerObserver:v0];
  }
  id v3 = sub_1000550B4();
  if (v3)
  {
    objc_super v4 = v3;
    unsigned __int8 v5 = [v3 isMathPaperSolvingAllowed];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  unint64_t v6 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  unsigned __int8 v7 = 1;
  swift_beginAccess();
  *unint64_t v6 = v5;
  id v8 = sub_1000550B4();
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned __int8 v7 = [v8 isKeyboardMathSolvingAllowed];
  }
  uint64_t v10 = (unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  unsigned __int8 v11 = 1;
  swift_beginAccess();
  unsigned __int8 *v10 = v7;
  id v12 = sub_1000550B4();
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned __int8 v11 = [v12 isDefinitionLookupAllowed];
  }
  id v14 = (unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  *id v14 = v11;
}

id CRLDeviceManagementRestrictionsManager.init()()
{
  v0[OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed] = 1;
  v0[OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed] = 1;
  v0[OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed] = 1;
  *(void *)&v0[OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection] = 1;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return [super init];
}

void _s20USDRendererExtension38CRLDeviceManagementRestrictionsManagerC63profileConnectionDidReceiveEffectiveSettingsChangedNotification_8userInfoySo09MCProfileH0CSg_SDys11AnyHashableVypGSgtF_0(void *a1)
{
  if (!a1)
  {
    __break(1u);
    return;
  }
  unsigned __int8 v3 = [a1 isMathPaperSolvingAllowed];
  objc_super v4 = (unsigned char *)(v1
               + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess();
  char v5 = v3 ^ *v4;
  if (v5) {
    unsigned char *v4 = [a1 isMathPaperSolvingAllowed];
  }
  unsigned int v6 = [a1 isKeyboardMathSolvingAllowed];
  unsigned __int8 v7 = (unsigned char *)(v1
               + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
  swift_beginAccess();
  if (v6 != *v7)
  {
    unsigned char *v7 = [a1 isKeyboardMathSolvingAllowed];
    char v5 = 1;
  }
  unsigned int v8 = [a1 isDefinitionLookupAllowed];
  uint64_t v9 = (unsigned char *)(v1
               + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
  swift_beginAccess();
  if (v8 == *v9)
  {
    if ((v5 & 1) == 0) {
      return;
    }
  }
  else
  {
    unsigned char *v9 = [a1 isDefinitionLookupAllowed];
  }
  id v10 = [self defaultCenter];
  if (qword_100093128 != -1) {
    swift_once();
  }
  [v10 postNotificationName:static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName object:0 userInfo:0];
}

uint64_t sub_100055820@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_10005585C(a1, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, a2);
}

uint64_t sub_10005582C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000558B8(a1, a2, a3, a4, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
}

uint64_t sub_100055838@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_10005585C(a1, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, a2);
}

uint64_t sub_100055844(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000558B8(a1, a2, a3, a4, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed);
}

uint64_t sub_100055850@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_10005585C(a1, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, a2);
}

uint64_t sub_10005585C@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  objc_super v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_1000558AC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000558B8(a1, a2, a3, a4, &OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed);
}

uint64_t sub_1000558B8(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  unsigned int v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *unsigned int v6 = v5;
  return result;
}

void sub_100055904(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100055914(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

id sub_100055924()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  objc_super v2 = &v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
  *objc_super v2 = 0u;
  v2[1] = 0u;
  v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_hasDrawnFrame] = 0;
  uint64_t v3 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_frameNumber;
  uint64_t v12 = 0;
  sub_100015F58(&qword_100094568);
  swift_allocObject();
  objc_super v4 = v0;
  *(void *)&v0[v3] = sub_10005E650();
  char v5 = &v4[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext];
  *(void *)char v5 = 0;
  *((void *)v5 + 1) = 0;
  unsigned int v6 = &v4[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState];
  *(void *)unsigned int v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 2;
  sub_1000572F8();
  unsigned __int8 v7 = (void *)sub_10005E970();
  id v8 = [objc_allocWithZone((Class)MTLSharedEventListener) initWithDispatchQueue:v7];

  *(void *)&v4[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_listener] = v8;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  [super init];
  [v9 setBackgroundColor:0];
  [v9 setOpaque:0];

  return v9;
}

void sub_100055AC8()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData);
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData);
  if (v2)
  {
    objc_super v4 = (void *)v1[2];
    uint64_t v3 = (void *)v1[3];
    char v5 = (void *)v1[1];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v6 = v3;
    id v7 = [v2 device];
    id v8 = *(id *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext);
    if (v8)
    {
      uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext + 8);
      swift_unknownObjectRetain();
      if (v7 == v8) {
        goto LABEL_7;
      }
      swift_unknownObjectRelease();
    }
    id v10 = [v7 newCommandQueue];
    if (v10)
    {
      uint64_t v9 = (uint64_t)v10;
LABEL_7:
      swift_unknownObjectRetain();
      sub_10001A7F4(v7);
      swift_release();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_100056D28((uint64_t)v7, v9);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      id v11 = [v4 signaledValue];
      BOOL v12 = __CFADD__(v11, 1);
      unint64_t v13 = (unint64_t)v11 + 1;
      if (v12)
      {
        __break(1u);
      }
      else
      {
        sub_100056E08(v13, v5);

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();
      }
      return;
    }
    sub_100056D28(0, 0);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100056D28(0, 0);
  }
}

uint64_t sub_100055CD4(id a1, id a2)
{
  if (a1 == a2)
  {
LABEL_17:
    char v10 = 1;
    return v10 & 1;
  }
  id v4 = [a2 label];
  if (v4)
  {

    id v5 = [a1 label];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = sub_10005E720();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    id v11 = [a2 label];
    if (v11)
    {
      BOOL v12 = v11;
      uint64_t v13 = sub_10005E720();
      uint64_t v15 = v14;

      if (v9)
      {
        if (v15)
        {
          if (v7 == v13 && v9 == v15)
          {
            swift_bridgeObjectRelease();
            char v10 = 1;
          }
          else
          {
            char v10 = sub_10005EC40();
            swift_bridgeObjectRelease();
          }
          goto LABEL_19;
        }
        goto LABEL_14;
      }
      if (v15)
      {
        char v10 = 0;
        goto LABEL_19;
      }
    }
    else if (v9)
    {
LABEL_14:
      char v10 = 0;
LABEL_19:
      swift_bridgeObjectRelease();
      return v10 & 1;
    }
    goto LABEL_17;
  }
  char v10 = 0;
  return v10 & 1;
}

void sub_100055E18(void *a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (void *)Strong;
    uint64_t v6 = Strong + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState;
    if (!*(unsigned char *)(Strong
                   + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState
                   + 16))
    {
      unint64_t v8 = *(void *)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      swift_unknownObjectRetain();
      if ((sub_100055CD4(a1, v7) & 1) != 0 && v8 <= a2)
      {
        uint64_t v9 = *(void *)v6;
        uint64_t v10 = *(void *)(v6 + 8);
        *(void *)uint64_t v6 = a2;
        *(void *)(v6 + 8) = a1;
        unsigned __int8 v11 = *(unsigned char *)(v6 + 16);
        *(unsigned char *)(v6 + 16) = 1;
        swift_unknownObjectRetain();
        sub_100056C14(v9, v10, v11);
        sub_1000560AC(a2);
      }
      sub_100056C14(v8, (uint64_t)v7, 0);
    }
  }
}

uint64_t sub_100056044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v5 = swift_unknownObjectRetain();
  v4(v5, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_1000560AC(uint64_t a1)
{
  uint64_t v3 = v2;
  id v4 = &v1[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
  if (v5)
  {
    uint64_t v6 = v1;
    uint64_t v9 = (void *)*((void *)v4 + 2);
    unint64_t v8 = (void *)*((void *)v4 + 3);
    uint64_t v10 = (void *)*((void *)v4 + 1);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v11 = v8;
    id v12 = [v10 signaledValue];
    if (v12 < [v9 signaledValue])
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      return;
    }
    id v50 = v11;
    uint64_t v13 = *(void **)&v6[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext];
    if (!v13) {
      goto LABEL_30;
    }
    uint64_t v14 = *(void **)&v6[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext + 8];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    [v6 bounds];
    double v16 = v15;
    double v18 = v17;
    [v6 contentsScale];
    double v20 = v16 * v19;
    if (qword_100093140 != -1)
    {
      double v41 = v19;
      swift_once();
      double v19 = v41;
    }
    if (v20 > (double)qword_10009D758) {
      double v20 = (double)qword_10009D758;
    }
    double v21 = v18 * v19;
    if (v21 <= (double)qword_10009D758) {
      double v22 = v21;
    }
    else {
      double v22 = (double)qword_10009D758;
    }
    [v6 drawableSize];
    if (v24 != v20 || v23 != v22) {
      [v6 setDrawableSize:v20, v22];
    }
    id v40 = [v6 nextDrawable];
    if (!v40)
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      return;
    }
    id v26 = [v14 commandBuffer];
    if (!v26)
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    id v38 = v26;
    id v37 = [v10 signaledValue];
    id v27 = [v40 texture];
    id v28 = [(id)swift_unknownObjectRetain() width];
    id v39 = v27;
    if (v28 == [v27 width] && (id v29 = objc_msgSend(v5, "height"), v29 == objc_msgSend(v27, "height")))
    {
      id v30 = [v38 blitCommandEncoder];
      if (!v30)
      {
        __break(1u);
        return;
      }
      uint64_t v31 = v30;
      sub_10005707C([v5 width], [v5 height], [v5 depth], &aBlock);
      long long v32 = v46;
      long long v33 = aBlock;
      long long aBlock = 0uLL;
      int64_t v46 = 0;
      long long v43 = v33;
      uint64_t v44 = v32;
      memset(v42, 0, sizeof(v42));
      [v31 copyFromTexture:v5 sourceSlice:0 sourceLevel:0 sourceOrigin:&aBlock sourceSize:&v43 toTexture:v39 destinationSlice:0 destinationLevel:0 destinationOrigin:v42];
      [v31 endEncoding];
      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001A7F4(v13);
      if (v3)
      {
        swift_unknownObjectRelease_n();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
LABEL_30:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();

        return;
      }
      sub_100019FF4(v5, v27, v38);
      swift_release();
    }
    [v38 encodeSignalEvent:v9 value:v37];
    [v38 presentDrawable:v40];
    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v35 = (void *)swift_allocObject();
    v35[2] = v34;
    v35[3] = a1;
    v35[4] = v37;
    uint64_t v48 = sub_100057070;
    uint64_t v49 = v35;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    int64_t v46 = sub_100056A40;
    uint64_t v47 = &unk_1000849E0;
    uint64_t v36 = _Block_copy(&aBlock);
    swift_release();
    [v38 addCompletedHandler:v36];
    _Block_release(v36);
    [v38 commit];
    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_30;
  }
}

uint64_t sub_100056668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v10 = (void *)result;
    uint64_t v11 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
    sub_10005E860();
    id v12 = v10;
    uint64_t v13 = sub_10005E850();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    _OWORD v14[4] = v12;
    v14[5] = a3;
    v14[6] = a4;
    sub_1000364B4((uint64_t)v8, (uint64_t)&unk_100095410, (uint64_t)v14);

    return swift_release();
  }
  return result;
}

uint64_t sub_1000567D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  _OWORD v6[4] = a6;
  _OWORD v6[2] = a4;
  sub_10005E860();
  v6[5] = sub_10005E850();
  uint64_t v8 = sub_10005E800();
  return _swift_task_switch(sub_10005686C, v8, v7);
}

uint64_t sub_10005686C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  swift_release();
  sub_1000568E4(v2, v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_1000568E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData);
  if (v4)
  {
    uint64_t v8 = (void *)v3[1];
    uint64_t v7 = v3[2];
    uint64_t v9 = (void *)v3[3];
    *(unsigned char *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_hasDrawnFrame) = 1;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v10 = v9;
    sub_10005E610();
    uint64_t v11 = v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState;
    if (*(unsigned char *)(v11 + 16) == 1 && *(void *)v11 == a1)
    {
      id v12 = *(void **)(v11 + 8);
      swift_unknownObjectRetain();
      if ((sub_100055CD4(v8, v12) & 1) == 0)
      {
LABEL_7:
        sub_10003EB54(v4, (uint64_t)v8, v7, v9);
        sub_100056C14(a1, (uint64_t)v12, 1u);
        return;
      }
      uint64_t v13 = *(void *)v11;
      uint64_t v14 = *(void *)(v11 + 8);
      *(void *)uint64_t v11 = 0;
      *(void *)(v11 + 8) = 0;
      unsigned __int8 v15 = *(unsigned char *)(v11 + 16);
      *(unsigned char *)(v11 + 16) = 2;
      sub_100056C14(v13, v14, v15);
      if (a2 != -1)
      {
        sub_100056E08(a2 + 1, v8);
        goto LABEL_7;
      }
      __break(1u);
    }
    else
    {
      sub_10003EB54(v4, (uint64_t)v8, v7, v9);
    }
  }
}

uint64_t sub_100056A40(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t _s10MetalLayerCMa()
{
  return self;
}

uint64_t sub_100056BEC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t _s10MetalLayerC11SignalStateOwxx(uint64_t a1)
{
  return sub_100056C14(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100056C14(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t _s10MetalLayerC11SignalStateOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100056BEC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s10MetalLayerC11SignalStateOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100056BEC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100056C14(v6, v7, v8);
  return a1;
}

uint64_t _s10MetalLayerC11SignalStateOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100056C14(v4, v5, v6);
  return a1;
}

ValueMetadata *_s10MetalLayerC11SignalStateOMa()
{
  return &_s10MetalLayerC11SignalStateON;
}

void sub_100056D28(uint64_t a1, uint64_t a2)
{
  char v3 = (uint64_t *)&v2[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext];
  uint64_t *v3 = a1;
  v3[1] = a2;
  sub_100057190(a1);
  sub_1000571D0(v4);
  uint64_t v5 = *v3;
  if (*v3) {
    swift_unknownObjectRetain();
  }
  [v2 setDevice:v5];
  swift_unknownObjectRelease();
  [v2 setFramebufferOnly:0];
  [v2 setPixelFormat:81];
  CGColorSpaceRef v6 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
  [v2 setColorspace:v6];
}

void sub_100056E08(unint64_t a1, void *a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState;
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState + 16))
  {
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState + 16) == 1) {
      return;
    }
    swift_unknownObjectRetain();
    unsigned __int8 v6 = 2;
    goto LABEL_10;
  }
  unint64_t v7 = *(void *)v5;
  unsigned __int8 v8 = *(void **)(v5 + 8);
  swift_unknownObjectRetain();
  sub_100056BEC(v7, (uint64_t)v8, 0);
  char v9 = sub_100055CD4(a2, v8);
  sub_100056C14(v7, (uint64_t)v8, 0);
  if ((v9 & 1) == 0 || v7 > a1)
  {
    unsigned __int8 v6 = *(unsigned char *)(v5 + 16);
LABEL_10:
    uint64_t v10 = *(void *)v5;
    uint64_t v11 = *(void *)(v5 + 8);
    *(void *)uint64_t v5 = a1;
    *(void *)(v5 + 8) = a2;
    *(unsigned char *)(v5 + 16) = 0;
    swift_unknownObjectRetain();
    sub_100056C14(v10, v11, v6);
    uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_listener);
    uint64_t v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    void v15[4] = sub_100057018;
    v15[5] = v13;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_100056044;
    v15[3] = &unk_100084990;
    uint64_t v14 = _Block_copy(v15);
    swift_release();
    [a2 notifyListener:v12 atValue:a1 block:v14];
    swift_unknownObjectRelease();
    _Block_release(v14);
    return;
  }

  swift_unknownObjectRelease();
}

uint64_t sub_100056FE0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100057018(void *a1, unint64_t a2)
{
}

uint64_t sub_100057020(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100057030()
{
  return swift_release();
}

uint64_t sub_100057038()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100057070(uint64_t a1)
{
  return sub_100056668(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10005707C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t sub_100057088()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000570C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  char v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100018B00;
  return sub_1000567D0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100057190(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRetain();
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_1000571D0(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100057210()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData];
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_hasDrawnFrame] = 0;
  uint64_t v2 = OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_frameNumber;
  sub_100015F58(&qword_100094568);
  swift_allocObject();
  *(void *)&v0[v2] = sub_10005E650();
  char v3 = &v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext];
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 2;

  sub_10005EAB0();
  __break(1u);
}

unint64_t sub_1000572F8()
{
  unint64_t result = qword_100095420;
  if (!qword_100095420)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100095420);
  }
  return result;
}

const char *sub_100057340(char a1)
{
  unint64_t result = "AdoptTipsNext";
  switch(a1)
  {
    case 1:
      unint64_t result = "AppAnalytics";
      break;
    case 2:
      unint64_t result = "AppIntents";
      break;
    case 3:
      unint64_t result = "AppIntentsSettings";
      break;
    case 4:
      unint64_t result = "BetterPencilSelection";
      break;
    case 5:
      unint64_t result = "ChangeShape";
      break;
    case 6:
      unint64_t result = "CloudQuotaMessaging";
      break;
    case 7:
      unint64_t result = "DrawingDataDetectors";
      break;
    case 8:
      unint64_t result = "EasierConnectionLines";
      break;
    case 9:
      unint64_t result = "FileImportExport";
      break;
    case 10:
      unint64_t result = "PKDrawingExport";
      break;
    case 11:
      unint64_t result = "Folders";
      break;
    case 12:
      unint64_t result = "Follow";
      break;
    case 13:
      unint64_t result = "GenerativePlayground";
      break;
    case 14:
      unint64_t result = "HandwritingIntelligence";
      break;
    case 15:
      unint64_t result = "MathPaper";
      break;
    case 16:
      unint64_t result = "MagicLists";
      break;
    case 17:
      unint64_t result = "Scenes";
      break;
    case 18:
      unint64_t result = "SendACopy";
      break;
    case 19:
      unint64_t result = "SnapToGrid";
      break;
    case 20:
      unint64_t result = "Stencils";
      break;
    case 21:
      unint64_t result = "ThreeDimensionalObjects";
      break;
    case 22:
      unint64_t result = "ToolPickerItemAPI";
      break;
    case 23:
      unint64_t result = "VerticalTextBoxAlignment";
      break;
    case 24:
      unint64_t result = "AllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKit";
      break;
    case 25:
      unint64_t result = "UseSandboxEnvironment";
      break;
    default:
      return result;
  }
  return result;
}

const char *sub_100057590()
{
  return "Freeform";
}

const char *sub_1000575A4()
{
  return sub_100057340(*v0);
}

const char *sub_1000575C4()
{
  return "UIKit";
}

const char *sub_1000575D8()
{
  return "redesigned_text_cursor";
}

const char *sub_1000575EC()
{
  return "GenerativePlayground";
}

const char *sub_100057600()
{
  return "App";
}

const char *sub_100057614()
{
  return "AppleAccount";
}

const char *sub_100057628()
{
  return "AABranding";
}

const char *sub_10005763C()
{
  return "PencilAndPaper";
}

const char *sub_100057650()
{
  if (*v0) {
    return "DrawingDataDetectors";
  }
  else {
    return "MathPaper";
  }
}

uint64_t sub_100057738(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v10 = &type metadata for CRLPencilAndPaperFeatureFlags;
  unint64_t v11 = sub_100057A18();
  v9[0] = a3;
  char v6 = sub_10005E540();
  sub_1000196FC((uint64_t)v9);
  if (v6)
  {
    uint64_t v10 = &type metadata for CRLFeatureFlags;
    unint64_t v11 = sub_100057970();
    v9[0] = a4;
    char v7 = sub_10005E540();
    sub_1000196FC((uint64_t)v9);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_1000577F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a3;
  uint64_t v8 = a4();
  char v4 = sub_10005E540();
  sub_1000196FC((uint64_t)v6);
  return v4 & 1;
}

uint64_t sub_100057880(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = &type metadata for CRLFeatureFlags;
  unint64_t v8 = sub_100057970();
  v6[0] = a3;
  char v4 = sub_10005E540();
  sub_1000196FC((uint64_t)v6);
  return v4 & 1;
}

id sub_100057918()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLFeatureFlagGroup();
  return [super dealloc];
}

uint64_t type metadata accessor for CRLFeatureFlagGroup()
{
  return self;
}

unint64_t sub_100057970()
{
  unint64_t result = qword_100095458;
  if (!qword_100095458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095458);
  }
  return result;
}

unint64_t sub_1000579C4()
{
  unint64_t result = qword_100095460;
  if (!qword_100095460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095460);
  }
  return result;
}

unint64_t sub_100057A18()
{
  unint64_t result = qword_100095468;
  if (!qword_100095468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095468);
  }
  return result;
}

id sub_100057A6C()
{
  char v4 = &type metadata for CRLGenerativePlaygroundFeatureFlags;
  unint64_t v5 = sub_100057C00();
  char v0 = sub_10005E540();
  sub_1000196FC((uint64_t)v3);
  if ((v0 & 1) != 0
    && (char v4 = &type metadata for CRLFeatureFlags,
        unint64_t v5 = sub_100057970(),
        v3[0] = 13,
        char v1 = sub_10005E540(),
        sub_1000196FC((uint64_t)v3),
        (v1 & 1) != 0))
  {
    return [(id)sub_10005E550() available];
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100057B0C()
{
  unint64_t v5 = &type metadata for CRLPencilAndPaperFeatureFlags;
  unint64_t v6 = sub_100057A18();
  v4[0] = 0;
  char v0 = sub_10005E540();
  sub_1000196FC((uint64_t)v4);
  uint64_t result = 0;
  if (v0)
  {
    unint64_t v5 = &type metadata for CRLFeatureFlags;
    unint64_t v6 = sub_100057970();
    v4[0] = 15;
    char v2 = sub_10005E540();
    sub_1000196FC((uint64_t)v4);
    if (v2)
    {
      if (qword_100093130 != -1) {
        swift_once();
      }
      char v3 = (unsigned __int8 *)(qword_1000952F0
                             + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
      swift_beginAccess();
      return *v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100057C00()
{
  unint64_t result = qword_100095470;
  if (!qword_100095470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095470);
  }
  return result;
}

unint64_t sub_100057C54()
{
  unint64_t result = qword_100095478;
  if (!qword_100095478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095478);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLAppleAccountFeatureFlags()
{
  return &type metadata for CRLAppleAccountFeatureFlags;
}

ValueMetadata *type metadata accessor for CRLGenerativePlaygroundFeatureFlags()
{
  return &type metadata for CRLGenerativePlaygroundFeatureFlags;
}

unsigned char *storeEnumTagSinglePayload for CRLPencilAndPaperFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100057D98);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLPencilAndPaperFeatureFlags()
{
  return &type metadata for CRLPencilAndPaperFeatureFlags;
}

unsigned char *_s20USDRendererExtension27CRLAppleAccountFeatureFlagsOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100057E6CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUIKitFeatureFlags()
{
  return &type metadata for CRLUIKitFeatureFlags;
}

uint64_t getEnumTagSinglePayload for CRLFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
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
      return (*a1 | (v4 << 8)) - 25;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1A;
  int v8 = v6 - 26;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CRLFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE6)
  {
    unsigned int v6 = ((a2 - 231) >> 8) + 1;
    *unint64_t result = a2 + 25;
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
        JUMPOUT(0x100058000);
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
          *unint64_t result = a2 + 25;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLFeatureFlags()
{
  return &type metadata for CRLFeatureFlags;
}

unint64_t sub_10005803C()
{
  unint64_t result = qword_100095480;
  if (!qword_100095480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095480);
  }
  return result;
}

unint64_t sub_100058094()
{
  unint64_t result = qword_100095488;
  if (!qword_100095488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095488);
  }
  return result;
}

unint64_t sub_1000580EC()
{
  unint64_t result = qword_100095490;
  if (!qword_100095490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095490);
  }
  return result;
}

unint64_t sub_100058144()
{
  unint64_t result = qword_100095498;
  if (!qword_100095498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095498);
  }
  return result;
}

unint64_t sub_10005819C()
{
  unint64_t result = qword_1000954A0;
  if (!qword_1000954A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000954A0);
  }
  return result;
}

id sub_100058264()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLGenerativePlaygroundAvailabilityHelper();
  return [super dealloc];
}

uint64_t type metadata accessor for CRLGenerativePlaygroundAvailabilityHelper()
{
  return self;
}

uint64_t CRLWeakWrapper.init(_:)()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t CRLWeakWrapper.value.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t CRLWeakWrapper.value.setter()
{
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t (*CRLWeakWrapper.value.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = swift_unknownObjectWeakLoadStrong();
  return sub_100058398;
}

uint64_t sub_100058398()
{
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

BOOL static CRLWeakWrapper.== infix(_:_:)()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v1 = swift_unknownObjectWeakLoadStrong();
  uint64_t v2 = v1;
  if (Strong)
  {
    swift_unknownObjectRelease();
    if (v2)
    {
      swift_unknownObjectRelease();
      return Strong == v2;
    }
    return 0;
  }
  if (v1)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return 1;
}

uint64_t sub_100058460(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100058480(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for CRLWeakWrapper()
{
  return sub_10004B538();
}

uint64_t sub_1000584C0(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_10002B7C8(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (uint64_t *)(*(void *)(a2 + 56) + 32 * v3);
  uint64_t v6 = *v5;
  BOOL v7 = (void *)v5[3];
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  id v8 = v7;
  return v6;
}

char *sub_100058548(uint64_t a1, uint64_t a2)
{
  sub_10005EA90();
  unint64_t v3 = (void *)swift_allocObject();
  v3[2] = 8;
  void v3[3] = 0;
  char v4 = v3 + 3;
  v3[4] = 0;
  v3[5] = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_25:
    uint64_t v21 = sub_10005EA80();
    CRLSetCrashReporterInfov(a2, v21);
    return (char *)swift_release();
  }
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 32;
  while (1)
  {
    sub_1000233DC(v7 + 40 * v6, (uint64_t)v23);
    sub_100019664(v23, v23[3]);
    unint64_t result = (char *)sub_10005EDC0();
    uint64_t v9 = *v4;
    uint64_t v10 = *((void *)result + 2);
    BOOL v11 = __OFADD__(*v4, v10);
    uint64_t v12 = *v4 + v10;
    if (v11) {
      break;
    }
    uint64_t v13 = result;
    uint64_t v14 = v3[4];
    if (v14 >= v12) {
      goto LABEL_18;
    }
    if (v14 + 0x4000000000000000 < 0) {
      goto LABEL_28;
    }
    unsigned __int8 v15 = (char *)v3[5];
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    v3[4] = v12;
    if ((unint64_t)(v12 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_29;
    }
    unint64_t result = (char *)swift_slowAlloc();
    v3[5] = result;
    if (v15)
    {
      if (result != v15 || result >= &v15[8 * v9]) {
        memmove(result, v15, 8 * v9);
      }
      sub_10005EA70();
LABEL_18:
      unint64_t result = (char *)v3[5];
    }
    if (!result) {
      goto LABEL_30;
    }
    uint64_t v17 = *((void *)v13 + 2);
    if (v17)
    {
      double v18 = (uint64_t *)(v13 + 32);
      uint64_t v19 = *v4;
      while (1)
      {
        uint64_t v20 = *v18++;
        *(void *)&result[8 * v19] = v20;
        uint64_t v19 = *v4 + 1;
        if (__OFADD__(*v4, 1)) {
          break;
        }
        uint64_t *v4 = v19;
        if (!--v17) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v6;
    swift_bridgeObjectRelease();
    sub_1000196FC((uint64_t)v23);
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void sub_100058720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10005EA90();
  uint64_t v9 = (void *)swift_allocObject();
  _DWORD v9[2] = 8;
  v9[3] = 0;
  uint64_t v10 = v9 + 3;
  _OWORD v9[4] = 0;
  v9[5] = 0;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = a1 + 32;
    while (1)
    {
      sub_1000233DC(v13 + 40 * v12, (uint64_t)v34);
      sub_100019664(v34, v34[3]);
      uint64_t v14 = sub_10005EDC0();
      uint64_t v15 = *v10;
      uint64_t v16 = *(void *)(v14 + 16);
      BOOL v17 = __OFADD__(*v10, v16);
      uint64_t v18 = *v10 + v16;
      if (v17)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      uint64_t v19 = v14;
      uint64_t v20 = v9[4];
      if (v20 >= v18) {
        goto LABEL_18;
      }
      if (v20 + 0x4000000000000000 < 0) {
        goto LABEL_29;
      }
      uint64_t v21 = (char *)v9[5];
      if (2 * v20 > v18) {
        uint64_t v18 = 2 * v20;
      }
      _OWORD v9[4] = v18;
      if ((unint64_t)(v18 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_30;
      }
      double v22 = (char *)swift_slowAlloc();
      v9[5] = v22;
      if (v21) {
        break;
      }
LABEL_19:
      if (!v22) {
        goto LABEL_32;
      }
      uint64_t v24 = *(void *)(v19 + 16);
      if (v24)
      {
        unint64_t v25 = (uint64_t *)(v19 + 32);
        uint64_t v26 = *v10;
        while (1)
        {
          uint64_t v27 = *v25++;
          *(void *)&v22[8 * v26] = v27;
          uint64_t v26 = *v10 + 1;
          if (__OFADD__(*v10, 1)) {
            break;
          }
          uint64_t *v10 = v26;
          if (!--v24) {
            goto LABEL_3;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v12;
      swift_bridgeObjectRelease();
      sub_1000196FC((uint64_t)v34);
      if (v12 == v11) {
        goto LABEL_25;
      }
    }
    if (v22 != v21 || v22 >= &v21[8 * v15]) {
      memmove(v22, v21, 8 * v15);
    }
    sub_10005EA70();
LABEL_18:
    double v22 = (char *)v9[5];
    goto LABEL_19;
  }
LABEL_25:
  uint64_t v28 = sub_10005EA80();
  id v29 = self;
  sub_10005E9E0();
  NSString v30 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  sub_10005E9E0();
  NSString v31 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  if (a8 < 0) {
    goto LABEL_31;
  }
  sub_10005E9E0();
  NSString v32 = sub_10005E6F0();
  swift_bridgeObjectRelease();
  [v29 handleFailureInFunction:v30 file:v31 lineNumber:a8 isFatal:1 format:v32 args:v28];
  swift_release();
}

uint64_t sub_1000589B0()
{
  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(0x7974706D65, 0xE500000000000000, nullsub_2, 0, sub_100019B68, 0, &type metadata for EmptyView, &protocol witness table for EmptyView);
}

uint64_t sub_100058A08()
{
  return sub_10005E520();
}

uint64_t sub_100058AB0()
{
  type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = _swiftEmptyArrayStorage;
  qword_10009D750 = result;
  return result;
}

uint64_t sub_100058AE8()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = v0 + 16;
  swift_beginAccess();
  unint64_t v6 = *(void *)(v0 + 16);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_10005EAC0();
  if (!v7) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  unint64_t v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v9 = *(void *)(v6 + 8 * v8 + 32);
      swift_retain();
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = sub_10005E9F0();
LABEL_8:
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9+ OBJC_IVAR____TtCCV20USDRendererExtension24CRLUSDRenderingExtension22APIEndpointCoordinatorP33_16A498A59AE630C2B6A999A1E566D34011APIEndpoint_uuid, v1);
  unint64_t v5 = *(void *)v5;
  uint64_t v14 = v1;
  if (!(v5 >> 62))
  {
    uint64_t v10 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_25;
    }
    goto LABEL_10;
  }
LABEL_24:
  swift_bridgeObjectRetain();
  uint64_t result = sub_10005EAC0();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_25;
  }
LABEL_10:
  if (v10 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v10; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
    {
      uint64_t v13 = sub_10005E9F0();
    }
    else
    {
      uint64_t v13 = *(void *)(v5 + 8 * i + 32);
      swift_retain();
    }
    if ((sub_10005DEA0() & 1) == 0) {
      [*(id *)(v13 + 16) invalidate];
    }
    swift_release();
  }
LABEL_25:
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v14);
}

uint64_t sub_100058D78(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = sub_10005E9F0();
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_10005EAC0();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v10 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t sub_100058E9C(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_10005B79C(v3);
    unint64_t v3 = result;
    unint64_t *v1 = result;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v5 + 8 * a1;
    uint64_t v9 = *(void *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(void *)(v5 + 16) = v7;
    sub_10005E7D0();
    return v9;
  }
  return result;
}

uint64_t sub_100058F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_10005E860();
  *(void *)(v4 + 72) = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  return _swift_task_switch(sub_100058FCC, v6, v5);
}

uint64_t sub_100058FCC()
{
  swift_release();
  if (qword_100093138 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = qword_10009D750;
  swift_beginAccess();
  unint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v1;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_100058D78((uint64_t (*)(uint64_t *))sub_10005C828, v4, v3);
  LOBYTE(v1) = v6;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if ((v1 & 1) == 0)
  {
    swift_beginAccess();
    sub_100058E9C(v5);
    swift_endAccess();
    swift_release();
  }
  unint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100059124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10005DED0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10005E880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  sub_10005E860();
  uint64_t v12 = sub_10005E850();
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_1000364B4((uint64_t)v10, a3, v14);
  return swift_release();
}

uint64_t sub_100059300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_10005E860();
  *(void *)(v4 + 72) = sub_10005E850();
  uint64_t v6 = sub_10005E800();
  return _swift_task_switch(sub_100059398, v6, v5);
}

uint64_t sub_100059398()
{
  swift_release();
  if (qword_100093138 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = qword_10009D750;
  swift_beginAccess();
  unint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v1;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_100058D78((uint64_t (*)(uint64_t *))sub_10005C610, v4, v3);
  LOBYTE(v1) = v6;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if ((v1 & 1) == 0)
  {
    swift_beginAccess();
    sub_100058E9C(v5);
    swift_endAccess();
    swift_release();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000594F0()
{
  uint64_t v1 = (void *)v0[2];
  [v1 invalidate];

  uint64_t v2 = (char *)v0
     + OBJC_IVAR____TtCCV20USDRendererExtension24CRLUSDRenderingExtension22APIEndpointCoordinatorP33_16A498A59AE630C2B6A999A1E566D34011APIEndpoint_uuid;
  uint64_t v3 = sub_10005DED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(unsigned int *)(*v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_100059664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v13;
  v8[8] = v14;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  sub_10005E860();
  v8[9] = sub_10005E850();
  uint64_t v10 = sub_10005E800();
  return _swift_task_switch(sub_100059710, v10, v9);
}

uint64_t sub_100059710()
{
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v2 = (void (*)(void))v0[7];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[3];
  swift_release();
  sub_1000597B0(v6, v5, v4, v3, v2, v1);
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

void sub_1000597B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v76 = a6;
  uint64_t v81 = a4;
  uint64_t v12 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100015F58(&qword_100093678);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v73 = (char *)v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v72 - v18;
  uint64_t v20 = sub_10005DED0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v75 = (char *)v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  unint64_t v25 = (char *)v72 - v24;
  sub_10005DE70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_100018EAC((uint64_t)v19);
    sub_100015F58((uint64_t *)&unk_100095230);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000716E0;
    *(void *)(inited + 56) = &type metadata for String;
    *(void *)(inited + 64) = sub_10003E34C();
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"_makeCoreRERendererProxy(for:delegateProxy:flags:response:)", 59, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/App Extension/USDRendererExtension.swift", 124, 2, 210, (uint64_t)"Expected valid UUID string, got: %{public}@", 43, 2u, inited);
    sub_100058548(inited, (uint64_t)"Expected valid UUID string, got: %{public}@");
    uint64_t v70 = (void *)inited;
    uint64_t v71 = 210;
LABEL_14:
    sub_100058720((uint64_t)v70, (uint64_t)"_makeCoreRERendererProxy(for:delegateProxy:flags:response:)", 59, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/App Extension/USDRendererExtension.swift", 124, 2, v71);
    CRLCrashBreakpoint();
    sub_10005EAB0();
    __break(1u);
    return;
  }
  uint64_t v26 = v21;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  uint64_t v78 = v20;
  v27(v25, v19, v20);
  uint64_t v28 = (uint64_t *)(v7
                  + OBJC_IVAR____TtCCV20USDRendererExtension24CRLUSDRenderingExtension22APIEndpointCoordinatorP33_16A498A59AE630C2B6A999A1E566D34011APIEndpoint_coreREInstances);
  swift_beginAccess();
  uint64_t v74 = v28;
  uint64_t v29 = sub_1000584C0((uint64_t)v25, *v28);
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  id v35 = v34;
  swift_endAccess();
  sub_10005B988(v29, v31, v33, v35);
  if (v29)
  {
    uint64_t v36 = sub_10005DE80();
    uint64_t v38 = v37;
    uint64_t v39 = sub_10005E880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v14, 1, 1, v39);
    uint64_t v40 = swift_allocObject();
    swift_weakInit();
    sub_10005E860();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_10005E850();
    uint64_t v42 = (void *)swift_allocObject();
    v42[2] = v41;
    void v42[3] = &protocol witness table for MainActor;
    v42[4] = v40;
    v42[5] = v36;
    v42[6] = v38;
    swift_release();
    sub_100036660((uint64_t)v14, (uint64_t)&unk_100095730, (uint64_t)v42);
    swift_release();
    swift_bridgeObjectRelease();
  }
  v84 = &OBJC_PROTOCOL___NSXPCProxyCreating;
  uint64_t v43 = swift_dynamicCastObjCProtocolConditional();
  if (!v43)
  {
    sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"_makeCoreRERendererProxy(for:delegateProxy:flags:response:)", 59, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/App Extension/USDRendererExtension.swift", 124, 2, 221, (uint64_t)"Expected XPC proxy for delegate argument.", 41, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_100058548((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"Expected XPC proxy for delegate argument.");
    uint64_t v70 = _swiftEmptyArrayStorage;
    uint64_t v71 = 221;
    goto LABEL_14;
  }
  uint64_t v80 = v43;
  uint64_t v77 = a5;
  uint64_t v44 = qword_100093018;
  swift_unknownObjectRetain();
  v72[1] = a3;
  if (v44 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int64_t v45 = (void *)static OS_os_log.crlThreeDimensionalObjects;
  sub_100015F58((uint64_t *)&unk_100095230);
  uint64_t v46 = swift_initStackObject();
  *(_OWORD *)(v46 + 16) = xmmword_1000716E0;
  id v47 = v45;
  sub_10005DE80();
  sub_10005E780();
  sub_10005E7A0();
  swift_bridgeObjectRelease();
  uint64_t v48 = sub_10005E760();
  uint64_t v50 = v49;
  swift_bridgeObjectRelease();
  *(void *)(v46 + 56) = &type metadata for String;
  *(void *)(v46 + 64) = sub_10003E34C();
  *(void *)(v46 + 32) = v48;
  *(void *)(v46 + 40) = v50;
  uint64_t v51 = sub_10005E950();
  sub_100022574((uint64_t)v47, (uint64_t)&_mh_execute_header, v51, (uint64_t)"(AppEx:CoreRE) connected: %{public}@", 36, 2, v46);
  swift_setDeallocating();
  sub_100015F58(&qword_100095240);
  swift_arrayDestroy();

  int v52 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  uint64_t v53 = (uint64_t)v75;
  long long v54 = v25;
  uint64_t v79 = v25;
  uint64_t v55 = v78;
  v52(v75, v54, v78);
  uint64_t v56 = (void (*)(char *, uint64_t, uint64_t))v52;
  v72[0] = v52;
  type metadata accessor for CRLUSDRendererExtensionShared.RendererDelegateSenderProxy();
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = v80;
  uint64_t v58 = (uint64_t)v73;
  v56(v73, v53, v55);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v58, 0, 1, v55);
  _s10RepBackendCMa();
  swift_allocObject();
  swift_unknownObjectRetain_n();
  swift_retain();
  uint64_t v59 = sub_100036814(v58, v57, (uint64_t)&off_1000824B0, v81);
  long long v60 = (objc_class *)type metadata accessor for CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy();
  uint64_t v61 = (char *)objc_allocWithZone(v60);
  *(void *)&v61[OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer
                + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = &off_100084018;
  swift_unknownObjectWeakAssign();
  v83.receiver = v61;
  v83.super_class = v60;
  id v62 = [super init];
  uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v63(v53, v55);
  ((void (*)(uint64_t, char *, uint64_t))v72[0])(v53, v79, v55);
  uint64_t v64 = v74;
  swift_beginAccess();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  id v65 = v62;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v82 = *v64;
  uint64_t *v64 = 0x8000000000000000;
  sub_100053098(v59, v80, v57, (uint64_t)v65, v53, isUniquelyReferenced_nonNull_native);
  uint64_t *v64 = v82;
  swift_bridgeObjectRelease();
  v63(v53, v55);
  swift_endAccess();
  id v67 = v65;
  v77();

  if ((v81 & 8) != 0)
  {
    uint64_t v68 = v79;
    if (qword_100093138 != -1) {
      swift_once();
    }
    sub_100058AE8();
    swift_release();
    swift_unknownObjectRelease_n();
    swift_release();

    v63((uint64_t)v68, v78);
  }
  else
  {
    v63((uint64_t)v79, v55);
    swift_unknownObjectRelease_n();
    swift_release();
    swift_release();
  }
}

uint64_t sub_10005A3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[5] = a1;
  v6[6] = a4;
  sub_10005E860();
  v6[9] = sub_10005E850();
  uint64_t v8 = sub_10005E800();
  return _swift_task_switch(sub_10005A448, v8, v7);
}

uint64_t sub_10005A448()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_10005A4F8(*(void *)(v0 + 56), *(void *)(v0 + 64));
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10005A4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015F58(&qword_100093678);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10005DED0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10005DE70();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100018EAC((uint64_t)v6);
    sub_100015F58((uint64_t *)&unk_100095230);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000716E0;
    *(void *)(inited + 56) = &type metadata for String;
    *(void *)(inited + 64) = sub_10003E34C();
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1000451EC((uint64_t)&_mh_execute_header, (uint64_t)"_didTeardownCoreRERenderer(for:)", 32, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/App Extension/USDRendererExtension.swift", 124, 2, 248, (uint64_t)"Expected valid UUID string, got: %{public}@", 43, 2u, inited);
    sub_100058548(inited, (uint64_t)"Expected valid UUID string, got: %{public}@");
    sub_100058720(inited, (uint64_t)"_didTeardownCoreRERenderer(for:)", 32, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/USD Rendering/App Extension/USDRendererExtension.swift", 124, 2, 248);
    CRLCrashBreakpoint();
    uint64_t result = sub_10005EAB0();
    __break(1u);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v10, v6, v7);
    swift_beginAccess();
    uint64_t v11 = sub_10005B034((uint64_t)v10);
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    swift_endAccess();
    sub_10005B988(v11, v13, v15, v17);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return result;
}

uint64_t sub_10005A980()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10005A9B8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10005A9E0()
{
  return sub_10005A9B8(*v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10005AA4C()
{
  unint64_t result = qword_100095550;
  if (!qword_100095550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100095550);
  }
  return result;
}

uint64_t type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator()
{
  return self;
}

uint64_t sub_10005AAC4()
{
  return type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint();
}

uint64_t type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint()
{
  uint64_t result = qword_100095630;
  if (!qword_100095630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10005AB18()
{
  uint64_t result = sub_10005DED0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void destroy for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance(uint64_t a1)
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance(uint64_t a1, _OWORD *a2)
{
  swift_release();
  *(_OWORD *)a1 = *a2;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t _s11TextureDataVwet(uint64_t *a1, int a2)
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

uint64_t _s11TextureDataVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance()
{
  return &type metadata for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint.CoreREInstance;
}

ValueMetadata *type metadata accessor for CRLUSDRenderingExtension()
{
  return &type metadata for CRLUSDRenderingExtension;
}

uint64_t sub_10005ADF0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10005AE0C(uint64_t a1)
{
  unint64_t result = sub_10005AA4C();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10005AE34()
{
  return sub_10005B9E8(&qword_1000956F0, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

uint64_t sub_10005AE7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10002B7C8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100053B0C();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_10005DED0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_10003347C(v12 + *(void *)(v20 + 72) * v6, a2);
    sub_10005B15C(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = _s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_10005B034(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10002B7C8(a1);
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
    sub_100053E24();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_10005DED0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 32 * v4);
  sub_10005B4A4(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_10005B15C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_10005E9C0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_10005B9E8(&qword_100094070, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v19 = sub_10005E6C0();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(_s6CoreREO19SceneRenderingStateC15SnapshotRequestVMa(0) - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10005B4A4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v35 = a2 + 64;
    unint64_t result = sub_10005E9C0();
    uint64_t v12 = v35;
    if ((*(void *)(v35 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v32 = (result + 1) & v11;
      BOOL v33 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v34 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v33(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_10005B9E8(&qword_100094070, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v17 = sub_10005E6C0();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 >= v32 && a1 >= (uint64_t)v18)
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
            uint64_t v23 = (_OWORD *)(v22 + 32 * a1);
            uint64_t v24 = (_OWORD *)(v22 + 32 * v10);
            uint64_t v12 = v35;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 2))
            {
              long long v25 = v24[1];
              *uint64_t v23 = *v24;
              v23[1] = v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v32 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v35;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    int64_t v26 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *int64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10005B79C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10005EAC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

void sub_10005B818(void *a1@<X8>)
{
  *a1 = nullsub_2;
  a1[1] = 0;
}

unint64_t sub_10005B830()
{
  unint64_t result = qword_100095708;
  if (!qword_100095708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100095708);
  }
  return result;
}

uint64_t sub_10005B884()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005B8C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100019FC8;
  return sub_10005A3AC(a1, v4, v5, v6, v7, v8);
}

void sub_10005B988(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
}

uint64_t sub_10005B9E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10005BA30()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005BA68()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10005BA7C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10005BAD4(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_100019FC8;
  return sub_100059664(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_10005BBCC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

ValueMetadata *type metadata accessor for CRLUSDRenderingExtensionConfiguration()
{
  return &type metadata for CRLUSDRenderingExtensionConfiguration;
}

ValueMetadata *type metadata accessor for CRLUSDRenderingExtension.EmptyScene()
{
  return &type metadata for CRLUSDRenderingExtension.EmptyScene;
}

ValueMetadata *type metadata accessor for CRLUSDRenderingExtensionSceneBuilder()
{
  return &type metadata for CRLUSDRenderingExtensionSceneBuilder;
}

uint64_t sub_10005BC44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_10005BC4C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10005BC7C()
{
  return swift_release();
}

void *sub_10005BC84(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10005BCC0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_10005BCF4(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10005BD3C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CRLUSDRenderingExtensionSceneBuilder._CRLUSDRenderingExtensionScene()
{
  return sub_10004B538();
}

uint64_t sub_10005BD90()
{
  return sub_10005BDC4(&qword_1000957B8);
}

uint64_t sub_10005BDC4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016310(&qword_1000956F8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10005BE0C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10005BE48()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10005BE64(uint64_t a1)
{
  unint64_t result = sub_10005BE8C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10005BE8C()
{
  unint64_t result = qword_1000957C0;
  if (!qword_1000957C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000957C0);
  }
  return result;
}

uint64_t sub_10005BEE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10005BF24(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10005DED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = OBJC_IVAR____TtCCV20USDRendererExtension24CRLUSDRenderingExtension22APIEndpointCoordinatorP33_16A498A59AE630C2B6A999A1E566D34011APIEndpoint_coreREInstances;
  *(void *)(v2 + v10) = sub_100023BF8((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v2 + 16) = a1;
  id v11 = a1;
  sub_10005DEC0();
  uint64_t v12 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 16);
  v12(v2+ OBJC_IVAR____TtCCV20USDRendererExtension24CRLUSDRenderingExtension22APIEndpointCoordinatorP33_16A498A59AE630C2B6A999A1E566D34011APIEndpoint_uuid, v9, v4);
  uint64_t v29 = v2;
  [v11 setExportedObject:v2];
  if (qword_100092EF0 != -1) {
    swift_once();
  }
  [v11 setExportedInterface:qword_10009D488];
  v12((uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9, v4);
  uint64_t v13 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = (v13 + 16) & ~v13;
  int64_t v26 = v9;
  uint64_t v27 = v13 | 7;
  uint64_t v28 = v14 + v6;
  uint64_t v15 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  uint64_t v24 = (void (*)(char *, char *, uint64_t))v12;
  id v25 = v11;
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v17(v16 + v14, v15, v4);
  uint64_t v34 = sub_10005C3C0;
  uint64_t v35 = v16;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  unint64_t v32 = sub_10004FF00;
  BOOL v33 = &unk_100084FC8;
  unint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  [v11 setInterruptionHandler:v18];
  _Block_release(v18);
  uint64_t v19 = v26;
  v24(v15, v26, v4);
  uint64_t v20 = swift_allocObject();
  v17(v20 + v14, v15, v4);
  uint64_t v34 = sub_10005C48C;
  uint64_t v35 = v20;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  unint64_t v32 = sub_10004FF00;
  BOOL v33 = &unk_100085018;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  id v22 = v25;
  [v25 setInvalidationHandler:v21];
  _Block_release(v21);
  [v22 resume];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v19, v4);
  return v29;
}

uint64_t sub_10005C2B4(void *a1)
{
  if (qword_100093138 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10009D750;
  type metadata accessor for CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint();
  swift_allocObject();
  id v3 = a1;
  sub_10005BF24(v3);

  swift_beginAccess();
  swift_retain();
  sub_10005E7C0();
  if (*(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_10005E7E0();
  sub_10005E7F0();
  sub_10005E7D0();
  swift_endAccess();
  swift_release();
  return 1;
}

uint64_t sub_10005C3C0()
{
  return sub_10005C4AC((uint64_t)&unk_100085078, (uint64_t)&unk_1000957E0);
}

uint64_t sub_10005C3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10005C3F0()
{
  return swift_release();
}

uint64_t sub_10005C3FC()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10005C48C()
{
  return sub_10005C4AC((uint64_t)&unk_100085050, (uint64_t)&unk_1000957D0);
}

uint64_t sub_10005C4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10005DED0() - 8);
  return sub_100059124(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a1, a2);
}

uint64_t sub_10005C524(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10005DED0() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100018B00;
  return sub_100059300(a1, v5, v6, v7);
}

uint64_t sub_10005C610()
{
  return sub_10005DEA0() & 1;
}

uint64_t sub_10005C654()
{
  uint64_t v1 = sub_10005DED0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10005C720(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10005DED0() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100019FC8;
  return sub_100058F34(a1, v5, v6, v7);
}

uint64_t sub_10005C80C(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *sub_10005C814()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_10005C828()
{
  return sub_10005C610() & 1;
}

uint64_t sub_10005C848()
{
  uint64_t result = (uint64_t)MTLCreateSystemDefaultDevice();
  if (!result) {
    goto LABEL_7;
  }
  uint64_t v1 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v1)
  {
    uint64_t result = swift_unknownObjectRelease();
LABEL_7:
    uint64_t v3 = 4096;
    goto LABEL_8;
  }
  uint64_t v2 = (uint64_t)[v1 maxTextureWidth2D];
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v3 = 4096;
  if (v2 < 4096) {
    uint64_t v3 = v2;
  }
LABEL_8:
  qword_10009D758 = v3;
  return result;
}

id sub_10005C8D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_10005D39C();
  uint64_t v5 = v2;
  uint64_t v6 = sub_10005E980();
  if (v6)
  {
    *(void *)&v5[OBJC_IVAR___CRLUSDRenderingCoreRESharedTextureHandle_handle] = v6;

    v9.receiver = v5;
    v9.super_class = ObjectType;
    [super init];
  }
  else
  {

    swift_deallocPartialClassInstance();
    return 0;
  }
  return v7;
}

uint64_t _s19SharedTextureHandleCMa()
{
  return self;
}

void _s11TextureDataVwxx(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *_s11TextureDataVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v5 = v4;
  return a1;
}

void *_s11TextureDataVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

uint64_t _s11TextureDataVwta(uint64_t a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *(_OWORD *)a1 = *a2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

ValueMetadata *_s11TextureDataVMa()
{
  return &_s11TextureDataVN;
}

id sub_10005CC58(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  id v9 = [a1 newSharedTextureWithHandle:*(void *)&a2[OBJC_IVAR___CRLUSDRenderingCoreRESharedTextureHandle_handle]];
  if (v9)
  {
    id v4 = v9;
    if ([a1 newSharedEventWithHandle:a3])
    {
      if ([a1 newSharedEventWithHandle:a4]) {
        return v4;
      }
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  sub_1000161C4();
  swift_allocError();
  *(void *)uint64_t v10 = 0xD00000000000001ELL;
  *(void *)(v10 + 8) = 0x8000000100070740;
  *(unsigned char *)(v10 + 16) = 5;
  swift_willThrow();

  return v4;
}

uint64_t sub_10005CD70(double *a1)
{
  float v3 = a1[8];
  float v4 = a1[4];
  float v5 = v3 * v4;
  if (v5 <= -9.2234e18)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v5 >= 9.2234e18)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  float v6 = a1[5];
  float v7 = v3 * v6;
  if ((LODWORD(v5) & 0x7F800000) == 0x7F800000 || (LODWORD(v7) & 0x7F800000) == 2139095040) {
    goto LABEL_27;
  }
  if (v7 <= -9.2234e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v7 < 9.2234e18)
  {
    uint64_t v2 = (uint64_t)v5;
    uint64_t v1 = (uint64_t)v7;
    if (qword_100093140 == -1) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  swift_once();
LABEL_10:
  uint64_t result = qword_10009D758;
  if (qword_10009D758 >= v2 && qword_10009D758 >= v1) {
    return v2;
  }
  if (v2 != v1)
  {
    float v11 = (float)qword_10009D758;
    if (v1 >= v2)
    {
      float v13 = (float)((float)v2 / (float)v1) * v11;
      if ((~LODWORD(v13) & 0x7F800000) != 0)
      {
        if (v13 > -9.2234e18)
        {
          if (v13 < 9.2234e18) {
            return (uint64_t)v13;
          }
          goto LABEL_36;
        }
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        return result;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    float v12 = (float)((float)v1 / (float)v2) * v11;
    if ((~LODWORD(v12) & 0x7F800000) != 0)
    {
      if (v12 > -9.2234e18)
      {
        if (v12 < 9.2234e18) {
          return result;
        }
        goto LABEL_33;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  return result;
}

id sub_10005CF3C(uint64_t a1, id a2)
{
  id v2 = [a2 newSharedTextureWithDescriptor:a1];
  if (v2)
  {
    float v3 = (objc_class *)_s19SharedTextureHandleCMa();
    float v4 = (char *)objc_allocWithZone(v3);
    id v5 = [(id)swift_unknownObjectRetain() newSharedTextureHandle];
    if (v5)
    {
      *(void *)&v4[OBJC_IVAR___CRLUSDRenderingCoreRESharedTextureHandle_handle] = v5;

      v7.receiver = v4;
      v7.super_class = v3;
      [super init];
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();

      swift_deallocPartialClassInstance();
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return v2;
}

void *sub_10005D020(void *a1, id a2, void *a3, void *a4)
{
  uint64_t v10 = sub_10005DED0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  float v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = sub_10005CF3C((uint64_t)a2, a1);
  if (!v14) {
    goto LABEL_15;
  }
  id v5 = v14;
  id v32 = v15;
  if (!a3)
  {
    id v28 = [a1 newSharedEvent];
    if (!v28)
    {
      swift_unknownObjectRelease();

      goto LABEL_15;
    }
    id v29 = a2;
    if (a4)
    {
      uint64_t v27 = v4;
      swift_unknownObjectRetain();
      id v26 = a4;
LABEL_11:
      swift_unknownObjectRetain();
      sub_10005DEC0();
      uint64_t v18 = sub_10005DE80();
      uint64_t v20 = v19;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      uint64_t v30 = 0x72657265646E6572;
      unint64_t v31 = 0xE90000000000003ALL;
      v33._countAndFlagsBits = v18;
      v33._object = v20;
      sub_10005E790(v33);
      NSString v21 = sub_10005E6F0();
      swift_bridgeObjectRelease();
      [v28 setLabel:v21];

      uint64_t v16 = &off_100091000;
      uint64_t v30 = 0x6579616C70736964;
      unint64_t v31 = 0xEA00000000003A72;
      v34._countAndFlagsBits = v18;
      v34._object = v20;
      sub_10005E790(v34);
      swift_bridgeObjectRelease();
      NSString v22 = sub_10005E6F0();
      swift_bridgeObjectRelease();
      [v26 setLabel:v22];

      goto LABEL_12;
    }
LABEL_9:
    swift_unknownObjectRetain();
    id v17 = [a1 newSharedEvent];
    if (v17)
    {
      id v26 = v17;
      uint64_t v27 = v4;
      goto LABEL_11;
    }
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    a2 = v29;
LABEL_15:
    sub_1000161C4();
    swift_allocError();
    *(void *)uint64_t v24 = 0xD00000000000001ELL;
    *(void *)(v24 + 8) = 0x80000001000706D0;
    *(unsigned char *)(v24 + 16) = 5;
    swift_willThrow();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return v5;
  }
  id v29 = a2;
  if (!a4)
  {
    id v28 = a3;
    goto LABEL_9;
  }
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v16 = &off_100091000;
LABEL_12:
  NSString v23 = sub_10005E6F0();
  [v5 v16[487]:v23];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5;
}

unint64_t sub_10005D39C()
{
  unint64_t result = qword_1000959A8;
  if (!qword_1000959A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000959A8);
  }
  return result;
}

void sub_10005D3DC(void *a1)
{
  id v2 = a1;
  float v3 = [(id)sub_10000A1FC() packedBacktraceString];
  sub_10000A184();
  sub_10000A19C((void *)&_mh_execute_header, v4, v5, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v6, v7, v8, v9, v10);
}

void sub_10005D47C()
{
  sub_10000A1BC();
  sub_10000A208();
  sub_10000A1D0();
  sub_10000A1E0((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005D514()
{
  sub_10000A1BC();
  sub_10000A208();
  sub_10000A1D0();
  sub_10000A1E0((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005D5AC()
{
  sub_10000A1BC();
  sub_10000A208();
  sub_10000A1D0();
  sub_10000A1E0((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005D644(uint64_t a1, int a2)
{
  v4[0] = 67110146;
  v4[1] = a2;
  __int16 v5 = 2082;
  sub_10000A208();
  uint8_t v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
  __int16 v7 = 1024;
  int v8 = 1331;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to make a string out of data with UTI %@", (uint8_t *)v4, 0x2Cu);
}

void sub_10005D6FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to use AddressBook API. Localization format may be incorrect.", v1, 2u);
}

void sub_10005D740(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[CRLAssertionHandler packedBacktraceString];
  sub_10000A184();
  sub_10000A19C((void *)&_mh_execute_header, v3, v4, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v5, v6, v7, v8, v9);
}

void sub_10005D7E4()
{
  sub_10000A1BC();
  uint64_t v3 = "-[CRLMetalDeviceCapabilities initWithDevice:]";
  __int16 v4 = v0;
  uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m";
  __int16 v6 = 1024;
  int v7 = 20;
  __int16 v8 = v0;
  uint8_t v9 = "device";
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, 0x2Cu);
}

void sub_10005D894()
{
  sub_10000A1BC();
  uint64_t v3 = "-[CRLMetalDeviceCapabilities supportsGPUFamily:]";
  __int16 v4 = v0;
  uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m";
  __int16 v6 = 1024;
  int v7 = 62;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Can't compare iOS to macOS GPUs.", v2, 0x22u);
}

void sub_10005D934()
{
  sub_10000A1BC();
  sub_10000C038();
  sub_10000C04C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unknown platform!", v2, v3, v4, v5, v6);
}

void sub_10005D9BC()
{
  sub_10000A1BC();
  sub_10000C038();
  sub_10000C04C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unknown platform!", v2, v3, v4, v5, v6);
}

void sub_10005DA44()
{
  sub_10000A1BC();
  sub_10000C038();
  sub_10000C04C((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Shouldn't be asking for the maximum Metal texture size on a device that doesn't support Metal.", v2, v3, v4, v5, v6);
}

void sub_10005DACC()
{
  sub_10000A1BC();
  uint64_t v3 = "-[CRLCapabilities metalCapabilitiesForDevice:]";
  __int16 v4 = v0;
  uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m";
  __int16 v6 = 1024;
  int v7 = 438;
  __int16 v8 = v0;
  uint8_t v9 = "device";
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, 0x2Cu);
}

void sub_10005DB7C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Ignored previous assertion failure ***", v1, 2u);
}

void sub_10005DBC0(void *a1)
{
  os_log_t v1 = a1;
  uint64_t v2 = +[CRLAssertionHandler packedBacktraceString];
  int v3 = 138543362;
  __int16 v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace: >>%{public}@<<", (uint8_t *)&v3, 0xCu);
}

void sub_10005DC6C(void *a1, uint64_t a2)
{
  int v3 = a1;
  int v4 = 134218242;
  intptr_t v5 = CRLDynamicBaseAddress();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace. Load address 0x%0llx, Backtrace:\n%{public}@", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_10005DD10()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10005DD20()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10005DD30()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_10005DD40()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_10005DD50()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10005DD60()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10005DD70()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10005DD80()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10005DD90()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10005DDA0()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_10005DDB0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10005DDC0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10005DDD0()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_10005DDE0()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_10005DDF0()
{
  return URL.init(resolvingBookmarkData:options:relativeTo:bookmarkDataIsStale:)();
}

uint64_t sub_10005DE00()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_10005DE10()
{
  return type metadata accessor for URL();
}

NSData sub_10005DE20()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10005DE30()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005DE40()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10005DE50()
{
  return Date.init()();
}

uint64_t sub_10005DE60()
{
  return type metadata accessor for Date();
}

uint64_t sub_10005DE70()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10005DE80()
{
  return UUID.uuidString.getter();
}

NSUUID sub_10005DE90()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10005DEA0()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_10005DEB0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005DEC0()
{
  return UUID.init()();
}

uint64_t sub_10005DED0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10005DEE0()
{
  return BoundingBox.boundingRadius.getter();
}

uint64_t sub_10005DEF0()
{
  return BoundingBox.init(min:max:)();
}

uint64_t sub_10005DF00()
{
  return BoundingBox.center.getter();
}

uint64_t sub_10005DF10()
{
  return BoundingBox.extents.getter();
}

uint64_t sub_10005DF20()
{
  return type metadata accessor for SceneEvents.Update();
}

uint64_t sub_10005DF30()
{
  return __EntityRef.__as<A>(_:)();
}

uint64_t sub_10005DF40()
{
  return type metadata accessor for __EntityRef();
}

uint64_t sub_10005DF50()
{
  return AnchorEntity.__allocating_init(world:)();
}

uint64_t sub_10005DF60()
{
  return type metadata accessor for AnchorEntity();
}

uint64_t sub_10005DF70()
{
  return HasHierarchy.addChild(_:preservingWorldTransform:)();
}

uint64_t sub_10005DF80()
{
  return HasTransform.orientation.getter();
}

uint64_t sub_10005DF90()
{
  return HasTransform.orientation.setter();
}

uint64_t sub_10005DFA0()
{
  return HasTransform.visualBounds(recursive:relativeTo:excludeInactive:)();
}

uint64_t sub_10005DFB0()
{
  return HasTransform.position.setter();
}

uint64_t sub_10005DFC0()
{
  return dispatch thunk of __SceneService.append(scene:)();
}

uint64_t sub_10005DFD0()
{
  return dispatch thunk of __SceneService.remove(scene:)();
}

uint64_t sub_10005DFE0()
{
  return dispatch thunk of __RenderService.__coreRenderManager.getter();
}

uint64_t sub_10005DFF0()
{
  return dispatch thunk of __RenderService.device.getter();
}

uint64_t sub_10005E000()
{
  return dispatch thunk of __REAssetService.__handle.getter();
}

uint64_t sub_10005E010()
{
  return dispatch thunk of __ServiceLocator.coreServiceLocator.getter();
}

uint64_t sub_10005E020()
{
  return dispatch thunk of __ServiceLocator.assetService.getter();
}

uint64_t sub_10005E030()
{
  return dispatch thunk of __ServiceLocator.eventService.getter();
}

uint64_t sub_10005E040()
{
  return dispatch thunk of __ServiceLocator.sceneService.getter();
}

uint64_t sub_10005E050()
{
  return dispatch thunk of __ServiceLocator.renderService.getter();
}

uint64_t sub_10005E060()
{
  return static __ServiceLocator.__createSharedIfNeeded(with:)();
}

uint64_t sub_10005E070()
{
  return dispatch thunk of __ServiceLocator.engine.getter();
}

uint64_t sub_10005E080()
{
  return static __ServiceLocator.shared.getter();
}

uint64_t sub_10005E090()
{
  return type metadata accessor for __ServiceLocator();
}

uint64_t sub_10005E0A0()
{
  return AnimationResource.name.getter();
}

uint64_t sub_10005E0B0()
{
  return AnimationResource.repeat(duration:)();
}

uint64_t sub_10005E0C0()
{
  return type metadata accessor for EngineRenderEvent();
}

uint64_t sub_10005E0D0()
{
  return PerspectiveCamera.init()();
}

uint64_t sub_10005E0E0()
{
  return type metadata accessor for PerspectiveCamera();
}

uint64_t sub_10005E0F0()
{
  return type metadata accessor for __REAnchoringType.Classification();
}

uint64_t sub_10005E100()
{
  return static __REAnchoringType.Alignment.vertical.getter();
}

uint64_t sub_10005E110()
{
  return type metadata accessor for __REAnchoringType.Alignment();
}

uint64_t sub_10005E120()
{
  return type metadata accessor for __REAnchoringType();
}

uint64_t sub_10005E130()
{
  return static EnvironmentResource.defaultObject()();
}

uint64_t sub_10005E140()
{
  return type metadata accessor for EnvironmentResource();
}

uint64_t sub_10005E150()
{
  return HasPerspectiveCamera.camera.modify();
}

uint64_t sub_10005E160()
{
  return static __EngineServiceMaskRef.__fromCore(_:)();
}

uint64_t sub_10005E170()
{
  return __EngineServiceMaskRef.__as<A>(_:)();
}

uint64_t sub_10005E180()
{
  return type metadata accessor for __EngineServiceMaskRef();
}

uint64_t sub_10005E190()
{
  return PerspectiveCameraComponent.fieldOfViewInDegrees.setter();
}

uint64_t sub_10005E1A0()
{
  return AnimationPlaybackController.blendFactor.getter();
}

uint64_t sub_10005E1B0()
{
  return AnimationPlaybackController.time.getter();
}

uint64_t sub_10005E1C0()
{
  return AnimationPlaybackController.time.setter();
}

uint64_t sub_10005E1D0()
{
  return AnimationPlaybackController.speed.getter();
}

uint64_t sub_10005E1E0()
{
  return AnimationPlaybackController.isValid.getter();
}

uint64_t sub_10005E1F0()
{
  return AnimationPlaybackController.duration.getter();
}

uint64_t sub_10005E200()
{
  return AnimationPlaybackController.isPlaying.getter();
}

uint64_t sub_10005E210()
{
  return AnimationPlaybackController.isStopped.getter();
}

uint64_t sub_10005E220()
{
  return dispatch thunk of AnimationPlaybackController.isComplete.getter();
}

uint64_t sub_10005E230()
{
  return dispatch thunk of AnimationPlaybackController.stop()();
}

uint64_t sub_10005E240()
{
  return dispatch thunk of AnimationPlaybackController.pause()();
}

uint64_t sub_10005E250()
{
  return dispatch thunk of AnimationPlaybackController.resume()();
}

uint64_t sub_10005E260()
{
  return dispatch thunk of AnimationPlaybackController.isPaused.getter();
}

uint64_t sub_10005E270()
{
  return dispatch thunk of __RKEntityInteractionManager.areInteractionsEnabled.setter();
}

uint64_t sub_10005E280()
{
  return dispatch thunk of __RKEntityInteractionManager.__removeAllInteractions()();
}

uint64_t sub_10005E290()
{
  return dispatch thunk of __RKEntityInteractionManager.automaticallyInvokesStartTrigger.setter();
}

uint64_t sub_10005E2A0()
{
  return type metadata accessor for __RKEntityInteractionManager();
}

uint64_t sub_10005E2B0()
{
  return Scene.__anchoringType.getter();
}

uint64_t sub_10005E2C0()
{
  return Scene.AnchorCollection.appendNinja(_:)();
}

uint64_t sub_10005E2D0()
{
  return type metadata accessor for Scene.AnchorCollection();
}

uint64_t sub_10005E2E0()
{
  return dispatch thunk of Scene.__interactionService.getter();
}

uint64_t sub_10005E2F0()
{
  return dispatch thunk of Scene.name.getter();
}

uint64_t sub_10005E300()
{
  return dispatch thunk of Scene.anchors.getter();
}

uint64_t sub_10005E310()
{
  return static Scene.fromCore(_:)();
}

uint64_t sub_10005E320()
{
  return dispatch thunk of Scene.addAnchor(_:)();
}

uint64_t sub_10005E330()
{
  return Scene.subscribe<A>(to:on:_:)();
}

uint64_t sub_10005E340()
{
  return type metadata accessor for Scene();
}

uint64_t sub_10005E350()
{
  return type metadata accessor for ARView.CameraMode();
}

uint64_t sub_10005E360()
{
  return ARView.cameraMode.setter();
}

uint64_t sub_10005E370()
{
  return static ARView.Environment.Background.color(_:)();
}

uint64_t sub_10005E380()
{
  return type metadata accessor for ARView.Environment.Background();
}

uint64_t sub_10005E390()
{
  return ARView.Environment.background.setter();
}

uint64_t sub_10005E3A0()
{
  return dispatch thunk of ARView.environment.modify();
}

uint64_t sub_10005E3B0()
{
  return ARView.init(frame:cameraMode:automaticallyConfigureSession:)();
}

uint64_t sub_10005E3C0()
{
  return dispatch thunk of ARView.scene.getter();
}

uint64_t sub_10005E3D0()
{
  return dispatch thunk of ARView.snapshot(saveToHDR:completion:)();
}

uint64_t sub_10005E3E0()
{
  return dispatch thunk of Entity.__coreEntity.getter();
}

uint64_t sub_10005E3F0()
{
  return dispatch thunk of Entity.components.modify();
}

uint64_t sub_10005E400()
{
  return Entity.ComponentSet.subscript.setter();
}

uint64_t sub_10005E410()
{
  return Entity.playAnimation(_:transitionDuration:startsPaused:)();
}

void sub_10005E420()
{
}

uint64_t sub_10005E430()
{
  return Entity.availableAnimations.getter();
}

uint64_t sub_10005E440()
{
  return dispatch thunk of Entity.name.setter();
}

uint64_t sub_10005E450()
{
  return static Entity.loadAsync(contentsOf:withName:)();
}

uint64_t sub_10005E460()
{
  return Entity.init()();
}

uint64_t sub_10005E470()
{
  return type metadata accessor for Entity();
}

uint64_t sub_10005E480()
{
  return __Engine.Configuration.__createServices.getter();
}

uint64_t sub_10005E490()
{
  return __Engine.Configuration.__createServices.setter();
}

uint64_t sub_10005E4A0()
{
  return __Engine.Configuration.__updateServices.getter();
}

uint64_t sub_10005E4B0()
{
  return __Engine.Configuration.__updateServices.setter();
}

uint64_t sub_10005E4C0()
{
  return __Engine.Configuration.init()();
}

uint64_t sub_10005E4D0()
{
  return type metadata accessor for __Engine.Configuration();
}

uint64_t sub_10005E4E0()
{
  return dispatch thunk of __Engine.__stop()();
}

uint64_t sub_10005E4F0()
{
  return dispatch thunk of __Engine.__start()();
}

uint64_t sub_10005E500()
{
  return dispatch thunk of __Engine.isRunning.getter();
}

uint64_t sub_10005E520()
{
  return AppExtensionSceneConfiguration.init<A, B>(_:configuration:)();
}

uint64_t sub_10005E530()
{
  return AppExtensionScene._makeScene(with:)();
}

uint64_t sub_10005E540()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_10005E550()
{
  return type metadata accessor for ImagePlaygroundViewController();
}

uint64_t sub_10005E560()
{
  return EventService.subscribe<A>(to:on:componentType:_:)();
}

uint64_t sub_10005E570()
{
  return __ImageBasedLightComponent.init(environment:intensityExponent:)();
}

uint64_t sub_10005E580()
{
  return type metadata accessor for __ImageBasedLightComponent();
}

uint64_t sub_10005E590()
{
  return static AppExtension<>.main()();
}

uint64_t sub_10005E5A0()
{
  return UTType.identifier.getter();
}

uint64_t sub_10005E5B0()
{
  return static UTType.png.getter();
}

uint64_t sub_10005E5C0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10005E5D0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10005E5E0()
{
  return dispatch thunk of Cancellable.cancel()();
}

uint64_t sub_10005E5F0()
{
  return AnyCancellable.store(in:)();
}

void sub_10005E600()
{
}

uint64_t sub_10005E610()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_10005E620()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_10005E630()
{
  return type metadata accessor for CurrentValueSubject();
}

uint64_t sub_10005E640()
{
  return CurrentValueSubject.__allocating_init(_:)();
}

uint64_t sub_10005E650()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_10005E660()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_10005E670()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_10005E680()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_10005E690()
{
  return CancellationError.init()();
}

NSDictionary sub_10005E6A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10005E6B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005E6C0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10005E6D0()
{
  return ObjectIdentifier.hashValue.getter();
}

uint64_t sub_10005E6E0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10005E6F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10005E700()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10005E710()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10005E720()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005E730()
{
  return String.init(format:_:)();
}

uint64_t sub_10005E740()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10005E750()
{
  return String.utf8CString.getter();
}

uint64_t sub_10005E760()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_10005E770()
{
  return String.hash(into:)();
}

uint64_t sub_10005E780()
{
  return String.index(_:offsetBy:)();
}

void sub_10005E790(Swift::String a1)
{
}

uint64_t sub_10005E7A0()
{
  return String.subscript.getter();
}

uint64_t sub_10005E7B0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10005E7C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10005E7D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10005E7E0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10005E7F0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10005E800()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10005E810()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10005E820()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10005E830()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t sub_10005E840()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_10005E850()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10005E860()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10005E870()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10005E880()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10005E890()
{
  return type metadata accessor for AsyncStream.Continuation.YieldResult();
}

uint64_t sub_10005E8A0()
{
  return type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
}

uint64_t sub_10005E8B0()
{
  return AsyncStream.Continuation.yield(_:)();
}

void sub_10005E8C0()
{
}

uint64_t sub_10005E8D0()
{
  return type metadata accessor for AsyncStream.Continuation();
}

uint64_t sub_10005E8E0()
{
  return type metadata accessor for AsyncStream();
}

uint64_t sub_10005E8F0()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t sub_10005E900()
{
  return static Task<>.checkCancellation()();
}

uint64_t sub_10005E910()
{
  return Double.description.getter();
}

uint64_t sub_10005E920()
{
  return Float.write<A>(to:)();
}

uint64_t sub_10005E930()
{
  return simd_quatf.hash(into:)();
}

uint64_t sub_10005E940()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_10005E950()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10005E960()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10005E970()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10005E980()
{
  return NSCoder.decodeObject<A>(of:forKey:)();
}

uint64_t sub_10005E990()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10005E9A0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10005E9C0()
{
  return _HashTable.previousHole(before:)();
}

void sub_10005E9D0(Swift::Int a1)
{
}

uint64_t sub_10005E9E0()
{
  return StaticString.description.getter();
}

uint64_t sub_10005E9F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10005EA10()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10005EA20()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10005EA30()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_10005EA40()
{
  return ContinuousClock.init()();
}

uint64_t sub_10005EA50()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_10005EA60()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_10005EA70()
{
  return __VaListBuilder.deallocStorage(wordCount:storage:)();
}

uint64_t sub_10005EA80()
{
  return __VaListBuilder.va_list()();
}

uint64_t sub_10005EA90()
{
  return type metadata accessor for __VaListBuilder();
}

uint64_t sub_10005EAA0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10005EAB0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10005EAC0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10005EAD0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10005EAE0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10005EAF0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10005EB10(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10005EB20()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10005EB30()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10005EB40()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10005EB50()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005EB60()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005EB70()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005EB80()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005EB90()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10005EBA0()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10005EBB0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10005EBC0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10005EBD0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005EBE0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005EBF0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005EC00()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005EC10()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10005EC20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10005EC40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10005EC50()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t sub_10005EC60()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
}

uint64_t sub_10005EC80()
{
  return SIMD.description.getter();
}

uint64_t sub_10005EC90()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10005ECA0()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_10005ECE0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10005ECF0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10005ED00()
{
  return Error._code.getter();
}

uint64_t sub_10005ED10()
{
  return Error._domain.getter();
}

uint64_t sub_10005ED20()
{
  return Error._userInfo.getter();
}

uint64_t sub_10005ED30()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10005ED40()
{
  return Hasher.init(_seed:)();
}

void sub_10005ED50(Swift::UInt a1)
{
}

void sub_10005ED60(Swift::UInt8 a1)
{
}

void sub_10005ED70(Swift::UInt32 a1)
{
}

void sub_10005ED80(Swift::UInt64 a1)
{
}

Swift::Int sub_10005ED90()
{
  return Hasher.finalize()();
}

Swift::Int sub_10005EDA0()
{
  return Hasher._finalize()();
}

uint64_t sub_10005EDB0()
{
  return Hasher.init()();
}

uint64_t sub_10005EDC0()
{
  return dispatch thunk of CVarArg._cVarArgEncoding.getter();
}

uint64_t sub_10005EDD0()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t sub_10005EDE0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10005EDF0()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t sub_10005EE00()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return _CFStringTokenizerGoToTokenAtIndex(tokenizer, index);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return _MTLPixelFormatGetInfoForDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return _NSZoneMalloc(zone, size);
}

uint64_t REAssetHandleLoadNow()
{
  return _REAssetHandleLoadNow();
}

uint64_t REAssetManagerCreateAssetHandle()
{
  return _REAssetManagerCreateAssetHandle();
}

uint64_t RECameraViewDescriptorsComponentAddSpecifyCommandFromTexture()
{
  return _RECameraViewDescriptorsComponentAddSpecifyCommandFromTexture();
}

uint64_t RECameraViewDescriptorsComponentAddViewDescriptor()
{
  return _RECameraViewDescriptorsComponentAddViewDescriptor();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorCopySettingStruct()
{
  return _RECameraViewDescriptorsComponentCameraViewDescriptorCopySettingStruct();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorSetSettingStruct()
{
  return _RECameraViewDescriptorsComponentCameraViewDescriptorSetSettingStruct();
}

uint64_t RECameraViewDescriptorsComponentCameraViewDescriptorSetViewport()
{
  return _RECameraViewDescriptorsComponentCameraViewDescriptorSetViewport();
}

uint64_t RECameraViewDescriptorsComponentClearCameraViewDescriptors()
{
  return _RECameraViewDescriptorsComponentClearCameraViewDescriptors();
}

uint64_t RECameraViewDescriptorsComponentGetComponentType()
{
  return _RECameraViewDescriptorsComponentGetComponentType();
}

uint64_t RECameraViewDescriptorsComponentSnapshotNextFrameWithSettings()
{
  return _RECameraViewDescriptorsComponentSnapshotNextFrameWithSettings();
}

uint64_t REECSManagerAddDefaultSystems()
{
  return _REECSManagerAddDefaultSystems();
}

uint64_t REEngineGetCurrentTime()
{
  return _REEngineGetCurrentTime();
}

uint64_t REEntityGetOrAddComponentByClass()
{
  return _REEntityGetOrAddComponentByClass();
}

uint64_t RERelease()
{
  return _RERelease();
}

uint64_t RERenderFrameSettingsAddGpuSignalEvent()
{
  return _RERenderFrameSettingsAddGpuSignalEvent();
}

uint64_t RERenderFrameSettingsSetTotalTime()
{
  return _RERenderFrameSettingsSetTotalTime();
}

uint64_t RERenderFrameWorkloadCommit()
{
  return _RERenderFrameWorkloadCommit();
}

uint64_t RERenderFrameWorkloadConfigure()
{
  return _RERenderFrameWorkloadConfigure();
}

uint64_t RERenderGraphCreateRenderGraphDataStruct()
{
  return _RERenderGraphCreateRenderGraphDataStruct();
}

uint64_t RERenderGraphDataStructAddFloat4()
{
  return _RERenderGraphDataStructAddFloat4();
}

uint64_t RERenderGraphEmitterAssetExecute()
{
  return _RERenderGraphEmitterAssetExecute();
}

uint64_t RERenderGraphEmitterAssetRegisterProviders()
{
  return _RERenderGraphEmitterAssetRegisterProviders();
}

uint64_t RERenderGraphEmitterAssetUnregisterProviders()
{
  return _RERenderGraphEmitterAssetUnregisterProviders();
}

uint64_t RERenderManagerCreateRenderFrameSettings()
{
  return _RERenderManagerCreateRenderFrameSettings();
}

uint64_t RERenderManagerCreateRenderFrameWorkload()
{
  return _RERenderManagerCreateRenderFrameWorkload();
}

uint64_t RESceneCreate()
{
  return _RESceneCreate();
}

uint64_t RESceneSetRequiresAnchoring()
{
  return _RESceneSetRequiresAnchoring();
}

uint64_t REServiceLocatorGetECSService()
{
  return _REServiceLocatorGetECSService();
}

uint64_t REServiceLocatorGetEngine()
{
  return _REServiceLocatorGetEngine();
}

uint64_t REServiceLocatorGetRenderManager()
{
  return _REServiceLocatorGetRenderManager();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return __dyld_get_image_name(image_index);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return __dyld_get_image_vmaddr_slide(image_index);
}

uint32_t _dyld_image_count(void)
{
  return __dyld_image_count();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return _ether_ntoa(a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  return _getsectbyname(segname, sectname);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return _getsegmentdata(mhp, segname, size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_destroyWeak(id *location)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

float sinf(float a1)
{
  return _sinf(a1);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_deallocate()
{
  return _swift_defaultActor_deallocate();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__atomicIncrementAssertCount(void *a1, const char *a2, ...)
{
  return _[a1 _atomicIncrementAssertCount];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 addCharactersInString:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:length:];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_canBeConvertedToEncoding_(void *a1, const char *a2, ...)
{
  return [a1 canBeConvertedToEncoding:];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return [a1 characterIsMember:];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithRange:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByCharactersInSet:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crl_appendJSONStringToString_(void *a1, const char *a2, ...)
{
  return [a1 crl_appendJSONStringToString:];
}

id objc_msgSend_crl_compressWithAlgorithm_operation_(void *a1, const char *a2, ...)
{
  return [a1 crl_compressWithAlgorithm:operation:];
}

id objc_msgSend_crl_countInstancesOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 crl_countInstancesOfString:options:];
}

id objc_msgSend_crl_filenameTruncatedToCharacterLimit_(void *a1, const char *a2, ...)
{
  return [a1 crl_filenameTruncatedToCharacterLimit:];
}

id objc_msgSend_crl_initRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 crl_initRedactedWithFormat:];
}

id objc_msgSend_crl_initUnRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 crl_initUnRedactedWithFormat:arguments:];
}

id objc_msgSend_crl_isCJKString(void *a1, const char *a2, ...)
{
  return [a1 crl_isCJKString];
}

id objc_msgSend_crl_parseBaseTitleWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_outNumber_(void *a1, const char *a2, ...)
{
  return [a1 crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:];
}

id objc_msgSend_crl_platformString(void *a1, const char *a2, ...)
{
  return [a1 crl_platformString];
}

id objc_msgSend_crl_regexForTitleParsingWithLocalizedCopyString_isFirstCopyFormatString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:");
}

id objc_msgSend_crl_stringByApplyingSubstitutions_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByApplyingSubstitutions:];
}

id objc_msgSend_crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_numberFormatter_uniquenessTest_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:];
}

id objc_msgSend_crl_stringByRemovingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByRemovingCharactersInSet:];
}

id objc_msgSend_crl_stringByReplacingInstancesOfCharactersInSet_withString_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByReplacingInstancesOfCharactersInSet:withString:];
}

id objc_msgSend_crl_stringWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithFormat:arguments:];
}

id objc_msgSend_crl_stringWithNormalizedHyphens(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithNormalizedHyphens];
}

id objc_msgSend_crl_stringWithNormalizedQuotationMarks(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithNormalizedQuotationMarks];
}

id objc_msgSend_crl_stringWithPathRelativeTo_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithPathRelativeTo:];
}

id objc_msgSend_crl_tolerantStringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 crl_tolerantStringByAppendingPathExtension:];
}

id objc_msgSend_crl_uncommentedAddress(void *a1, const char *a2, ...)
{
  return [a1 crl_uncommentedAddress];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithSharedKeySet];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return [a1 escapedPatternForString:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 firstMatchInString:options:range:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCharacters_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:];
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:range:];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:description:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_format_args_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:isFatal:format:args:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:length:encoding:freeWhenDone:];
}

id objc_msgSend_initWithCharacters_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithCharacters:length:];
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:arguments:];
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithPattern:options:error:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertString:atIndex:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isMetalCapable(void *a1, const char *a2, ...)
{
  return _[a1 isMetalCapable];
}

id objc_msgSend_isQAFatalAssertionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isQAFatalAssertionsEnabled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastThrottleCheck(void *a1, const char *a2, ...)
{
  return _[a1 lastThrottleCheck];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromPersonNameComponents:style:options:];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_maximumHardcodedTextureSize(void *a1, const char *a2, ...)
{
  return _[a1 maximumHardcodedTextureSize];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 mutableCopyWithZone:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectWithItemProviderData_typeIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 objectWithItemProviderData:typeIdentifier:error:];
}

id objc_msgSend_p_assignFeatureSet(void *a1, const char *a2, ...)
{
  return [a1 p_assignFeatureSet];
}

id objc_msgSend_p_deviceGPUFamily(void *a1, const char *a2, ...)
{
  return [a1 p_deviceGPUFamily];
}

id objc_msgSend_p_isMetalCapable(void *a1, const char *a2, ...)
{
  return [a1 p_isMetalCapable];
}

id objc_msgSend_p_performBlockIgnoringAssertions_onlyFatal_(void *a1, const char *a2, ...)
{
  return [a1 p_performBlockIgnoringAssertions:onlyFatal:];
}

id objc_msgSend_p_setupDevice(void *a1, const char *a2, ...)
{
  return [a1 p_setupDevice];
}

id objc_msgSend_p_setupPlatform(void *a1, const char *a2, ...)
{
  return [a1 p_setupPlatform];
}

id objc_msgSend_packedBacktraceString(void *a1, const char *a2, ...)
{
  return _[a1 packedBacktraceString];
}

id objc_msgSend_packedBacktraceStringWithReturnAddresses_(void *a1, const char *a2, ...)
{
  return [a1 packedBacktraceStringWithReturnAddresses:];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_physicalMemory(void *a1, const char *a2, ...)
{
  return _[a1 physicalMemory];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 punctuationCharacterSet];
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeAtIndex:];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:options:];
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfComposedCharacterSequenceAtIndex:];
}

id objc_msgSend_rangeOfComposedCharacterSequencesForRange_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfComposedCharacterSequencesForRange:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:range:];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 regularExpressionWithPattern:options:error:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 replaceOccurrencesOfString:withString:options:range:];
}

id objc_msgSend_scanCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanCharactersFromSet:intoString:];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanUpToCharactersFromSet:intoString:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setCaseSensitive_(void *a1, const char *a2, ...)
{
  return [a1 setCaseSensitive:];
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return [a1 setCharactersToBeSkipped:];
}

id objc_msgSend_setLastThrottleCheck_(void *a1, const char *a2, ...)
{
  return [a1 setLastThrottleCheck:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setThrottleCount_(void *a1, const char *a2, ...)
{
  return [a1 setThrottleCount:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return [a1 sharedKeySetForKeys:];
}

id objc_msgSend_simulateCrashWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 simulateCrashWithMessage:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stringByPaddingToLength:withString:startingAtIndex:];
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingMatchesInString:options:range:withTemplate:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCharacters:length:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_supportsFamily_(void *a1, const char *a2, ...)
{
  return [a1 supportsFamily:];
}

id objc_msgSend_supportsGPUFamily_(void *a1, const char *a2, ...)
{
  return [a1 supportsGPUFamily:];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_throttleCount(void *a1, const char *a2, ...)
{
  return _[a1 throttleCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return [a1 valueWithRange:];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}