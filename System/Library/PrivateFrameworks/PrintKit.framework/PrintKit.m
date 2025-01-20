void sub_22EA55D9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22EA55E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA55E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA55EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA56028(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_22EA56270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA5646C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA564FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA566A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void PKLogXPCError(objc_selector *a1, NSError *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector((SEL)a1);
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_ERROR, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
  if ([(NSError *)v3 code] == 4099)
  {
    v6 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector((SEL)a1);
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_ERROR, "%@ Ensure the com.apple.PrintKit.PrinterTool XPCService is available.", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_22EA56820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA56960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA569FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA56C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA56E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA56F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22EA56FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22EA570C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_22EA571B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_22EA57270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA574AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA575DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA5767C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA577B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA57854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA579F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_22EA57CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA57D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA57ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_22EA57F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA58050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA5818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA5822C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA58360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA58404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA58530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA585D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA586EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA58830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA588D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void PrintdRPC::RemoveKeychainItem(PrintdRPC *this, PKPrinterBonjourEndpoint *a2)
{
  v3 = this;
  v2 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v2, "printerTool_removeKeychainItem:", v3);
}

void sub_22EA589E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void PrintdRPC::IdentifyPrinter(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  v7 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v7, "printerTool_identifyPrinter:message:actions:", v8, v5, v6);
}

void sub_22EA58A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void PrintdRPC::GetPrinterDescription(void *a1, uint64_t a2, void *a3)
{
  id v7 = a1;
  id v5 = a3;
  id v6 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v6, "printerTool_getPrinterDescription:assertReachability:completionHandler:", v7, a2, v5);
}

void sub_22EA58B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void PrintdRPC::CheckAccessStateAsync(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  v4 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v4, "printerTool_checkAccessState:completionHandler:", v5, v3);
}

void sub_22EA58BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void PrintdRPC::QueryPrinterWithAttributess(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  id v7 = +[PKPrinterTool_Client sharedClient];
  objc_msgSend(v7, "printerTool_queryPrinter:attributes:completionHandler:", v8, v5, v6);
}

void sub_22EA58C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

NSString *internString(NSString *a1)
{
  v1 = a1;
  v2 = [&unk_26E263B30 objectForKeyedSubscript:v1];
  id v3 = v2;
  if (v2)
  {
    v4 = v2;
LABEL_9:
    __int16 v10 = v4;
    goto LABEL_10;
  }
  id v5 = v1;
  id v6 = [(NSString *)v5 UTF8String];
  size_t v7 = strlen(v6);
  if ([(NSString *)v5 length] != v7)
  {
    v4 = v5;
    v1 = v4;
    goto LABEL_9;
  }
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = dynamicHash(v6, v7);
  v12[3] = 0;
  if (internEntriesDict(void)::sOnce != -1) {
    dispatch_once(&internEntriesDict(void)::sOnce, &__block_literal_global_0);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)internEntriesDict(void)::sInternEntriesDict, v12);
  if (Value)
  {
    v9 = (NSString *)Value[3];
  }
  else if (isAsciiString(v6, v7))
  {
    forcedAsciiIntern(v5);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    id v5 = v9;
  }
  else
  {
    v9 = v5;
  }
  __int16 v10 = v9;
  v1 = v5;
LABEL_10:

  return v10;
}

void sub_22EA58E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t dynamicHash(const char *a1, uint64_t a2)
{
  if (a2) {
    return 257 * dynamicHash(a1 + 1, a2 - 1) + *a1;
  }
  else {
    return 0;
  }
}

BOOL isAsciiString(const char *a1, uint64_t a2)
{
  v2 = a1;
  id v3 = &a1[a2];
  uint64_t v4 = MEMORY[0x263EF8318];
  while (1)
  {
    id v5 = v2;
    if (v2 >= v3) {
      break;
    }
    ++v2;
    unsigned int v6 = *v5;
    if ((v6 & 0x80000000) != 0)
    {
      if (!__maskrune(v6, 0x40000uLL)) {
        return v5 >= v3;
      }
    }
    else if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x40000) == 0)
    {
      return v5 >= v3;
    }
  }
  return v5 >= v3;
}

NSString *forcedAsciiIntern(NSString *a1)
{
  v1 = a1;
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (void *)forcedAsciiIntern(NSString *)::sForced;
  if (!forcedAsciiIntern(NSString *)::sForced)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)forcedAsciiIntern(NSString *)::sForced;
    forcedAsciiIntern(NSString *)::sForced = v4;

    id v3 = (void *)forcedAsciiIntern(NSString *)::sForced;
  }
  unsigned int v6 = [v3 objectForKeyedSubscript:v1];
  size_t v7 = v6;
  if (!v6)
  {
    unint64_t v8 = [(id)forcedAsciiIntern(NSString *)::sForced count];
    size_t v7 = v1;
    if (v8 <= 0x7F)
    {
      [(id)forcedAsciiIntern(NSString *)::sForced setObject:v1 forKeyedSubscript:v1];
      size_t v7 = v1;
    }
  }
  v9 = v7;

  objc_sync_exit(v2);

  return v9;
}

void sub_22EA58FC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

NSString *internUTF8ByteString(const char *a1, uint64_t a2)
{
  v9 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = dynamicHash(a1, a2);
  uint64_t v12 = 0;
  if (internEntriesDict(void)::sOnce != -1) {
    dispatch_once(&internEntriesDict(void)::sOnce, &__block_literal_global_0);
  }
  Value = (id *)CFDictionaryGetValue((CFDictionaryRef)internEntriesDict(void)::sInternEntriesDict, &v9);
  if (Value)
  {
    id v5 = (NSString *)Value[3];
  }
  else
  {
    id v7 = [NSString alloc];
    id v5 = (NSString *)objc_msgSend(v7, "initWithBytes:length:encoding:", a1, a2, 4, v9, v10, v11, v12);
    if (v5 && isAsciiString(a1, a2))
    {
      uint64_t v8 = forcedAsciiIntern(v5);

      id v5 = (NSString *)v8;
    }
  }

  return v5;
}

void sub_22EA590D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFDictionaryRef ___ZL17internEntriesDictv_block_invoke()
{
  keyCallBacks.version = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)_ZZZL17internEntriesDictvEUb_EN3__08__invokeEPK13__CFAllocatorPKv;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)_ZZZL17internEntriesDictvEUb_EN3__18__invokeEPK13__CFAllocatorPKv;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)_ZZZL17internEntriesDictvEUb_EN3__28__invokeEPKv;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)_ZZZL17internEntriesDictvEUb_EN3__38__invokeEPKvS1_;
  keyCallBacks.hash = (CFDictionaryHashCallBack)_ZZZL17internEntriesDictvEUb_EN3__48__invokeEPKv;
  valueCallBacks.version = 0;
  valueCallBacks.retain = (CFDictionaryRetainCallBack)_ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv;
  valueCallBacks.release = (CFDictionaryReleaseCallBack)_ZZZL17internEntriesDictvEUb_EN3__68__invokeEPK13__CFAllocatorPKv;
  valueCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)_ZZZL17internEntriesDictvEUb_EN3__78__invokeEPKv;
  valueCallBacks.equal = (CFDictionaryEqualCallBack)_ZZZL17internEntriesDictvEUb_EN3__88__invokeEPKvS1_;
  if ((char **)sEntryPtrs != &sEntryValues) {
    ___ZL17internEntriesDictv_block_invoke_cold_2();
  }
  if ((char **)qword_26861AF70 != &off_2649EBDA0) {
    ___ZL17internEntriesDictv_block_invoke_cold_1();
  }
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&sEntryPtrs, (const void **)&sEntryPtrs, 1337, &keyCallBacks, &valueCallBacks);
  internEntriesDict(void)::sInternEntriesDict = (uint64_t)result;
  return result;
}

uint64_t _ZZZL17internEntriesDictvEUb_EN3__08__invokeEPK13__CFAllocatorPKv(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef _ZZZL17internEntriesDictvEUb_EN3__28__invokeEPKv(char **a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = entryIndex(a1);
  uint64_t v4 = entryString(a1);
  CFStringRef v5 = CFStringCreateWithFormat(v2, 0, @"key<%d/%@>", v3, v4);

  return v5;
}

void sub_22EA59280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t entryIndex(char **a1)
{
  uint64_t v1 = (char *)a1 - (char *)&sEntryValues;
  if (a1 < &sEntryValues || a1 >= (char **)&__block_descriptor_32_e28_B16__0__PK_ipp_attribute_t_8l) {
    return 0xFFFFFFFFLL;
  }
  if (&(&sEntryValues)[4 * (int)(v1 >> 5)] != a1) {
    entryIndex();
  }
  return (unint64_t)v1 >> 5;
}

id entryString(void *a1)
{
  uint64_t v1 = (void *)a1[3];
  if (v1) {
    id v2 = v1;
  }
  else {
    id v2 = (id)[[NSString alloc] initWithBytes:*a1 length:a1[1] encoding:4];
  }

  return v2;
}

BOOL _ZZZL17internEntriesDictvEUb_EN3__38__invokeEPKvS1_(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t _ZZZL17internEntriesDictvEUb_EN3__48__invokeEPKv(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

char **_ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv(uint64_t a1, char **a2)
{
  if (entryIndex(a2) == -1) {
    _ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv_cold_1();
  }
  return a2;
}

CFStringRef _ZZZL17internEntriesDictvEUb_EN3__78__invokeEPKv(char **a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = entryIndex(a1);
  uint64_t v4 = entryString(a1);
  CFStringRef v5 = CFStringCreateWithFormat(v2, 0, @"val<%d/%@>", v3, v4);

  return v5;
}

void sub_22EA59430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _ZZZL17internEntriesDictvEUb_EN3__88__invokeEPKvS1_(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t ippReadIO(void *a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), PK_ipp_t *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFStringRef v5 = a3;
  unsigned int v6 = v5;
  uint64_t v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    IPPIOReader::IPPIOReader((IPPIOReader *)v11, a2, a1);
    ipp_state_e v9 = IPP_STATE_IDLE;
    ipp_tag_e v10 = IPP_TAG_NOVALUE;
    ippReadWithReader((IPPIOReader *)v11, &v9, &v10, 0, v6);
    uint64_t v7 = 3;
  }
  return v7;
}

void ippReadWithReader(IPPIOReader *a1, ipp_state_e *a2, ipp_tag_e *a3, int a4, PK_ipp_t *a5)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  v108 = a5;
  v109 = a2;
  ipp_state_e v9 = *a2;
  if (*a2 == IPP_STATE_ATTRIBUTE)
  {
LABEL_8:
    v110 = v108;
    while (1)
    {
      uint64_t v11 = (void *)MEMORY[0x230FA8DB0]();
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
      uint64_t v12 = validate_enum<ipp_tag_e,unsigned char>(LOBYTE(__dst[0]));
      uint64_t v13 = v12;
      if (v12 != 3) {
        break;
      }
      v17 = 0;
      id v18 = 0;
LABEL_26:
      ipp_state_e *v109 = IPP_STATE_DATA;
      int v19 = 1;
LABEL_104:

      if (v19 && v19 != 3)
      {

        goto LABEL_107;
      }
    }
    if (v12 == 127)
    {
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
      uint64_t v13 = 0xFFFFFFFFLL;
LABEL_21:
      if (a4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad tag 0x%02x.", v13);
        v67 = (NSString *)objc_claimAutoreleasedReturnValue();
        IPPIOReader::THROW_FAIL(a1, 662, &cfstr_InvalidGroupTa.isa, v67);
      }
      if (*a3 == v13) {
        ippAddSeparator(v110);
      }
      v17 = 0;
      id v18 = 0;
      *a3 = v13;
      int v19 = 3;
      goto LABEL_104;
    }
    if (!v12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad tag 0x%02x.", 0);
      v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 651, &cfstr_InvalidGroupTa.isa, v68);
    }
    if ((int)v12 <= 15) {
      goto LABEL_21;
    }
    v14 = v110;
    IPPIOReader::read(a1, (unsigned __int8 *)__dst, 2uLL);
    unsigned int v15 = bswap32(LOWORD(__dst[0]));
    unint64_t v16 = HIWORD(v15);
    if (v16 > 0x8000)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad name length %d.", HIWORD(v15));
      v71 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 213, &cfstr_IppNameLargerT.isa, v71);
    }
    if (LOWORD(__dst[0]) && a4)
    {
      v70 = [NSString stringWithFormat:@"ippReadIO: bad attribute name in collection."];
      IPPIOReader::THROW_FAIL(a1, 220, &cfstr_InvalidNamedIp.isa, v70);
    }
    if (LOWORD(__dst[0]))
    {
      if (v13 != 55)
      {
        if (v13 == 74)
        {
          v73 = [NSString stringWithFormat:@"ippReadIO: member name not empty."];
          IPPIOReader::THROW_FAIL(a1, 311, &cfstr_IppMemberNameI.isa, v73);
        }
        goto LABEL_34;
      }
    }
    else
    {
      if (v13 == 16)
      {
LABEL_34:
        v24 = IPPIOReader::readString((id *)a1, v16, 1);
        v25 = [(PK_ipp_t *)v14 addNewEmptyAttribute:v24 groupTag:*(unsigned int *)a3 valueTag:v13];
        v21 = v25;
        if (!v25)
        {
          v72 = [NSString stringWithFormat:@"ippReadIO: unable to allocate attribute."];
          IPPIOReader::THROW_FAIL(a1, 338, &cfstr_IppreadioUnabl.isa, v72);
        }
        id v23 = [(PK_ipp_attribute_t *)v25 addNewEmptyValue];

        goto LABEL_57;
      }
      if (v13 != 55)
      {
        if (v13 == 74)
        {
          if ((a4 & 1) == 0)
          {
            v75 = [NSString stringWithFormat:@"ippReadIO: member attribute outside of collection."];
            IPPIOReader::THROW_FAIL(a1, 315, &cfstr_IppMemberAttri.isa, v75);
          }
          v20 = [(PK_ipp_t *)v14 addNewEmptyAttribute:0 groupTag:*(unsigned int *)a3 valueTag:0];
          v21 = v20;
          if (!v20)
          {
            v76 = [NSString stringWithFormat:@"ippReadIO: unable to allocate attribute."];
            IPPIOReader::THROW_FAIL(a1, 322, &cfstr_IppreadioUnabl.isa, v76);
          }
          id v22 = [(PK_ipp_attribute_t *)v20 addNewEmptyValue];
        }
        else
        {
          v26 = [(PK_ipp_t *)v14 attrs];
          v21 = [v26 lastObject];

          if (!v21)
          {
            v74 = [NSString stringWithFormat:@"ippReadIO: Attribute without name and no current."];
            IPPIOReader::THROW_FAIL(a1, 231, &cfstr_IppAttributeHa.isa, v74);
          }
          uint64_t v27 = [(PK_ipp_attribute_t *)v21 value_tag];
          uint64_t v28 = v27;
          if (v27)
          {
            if ((v27 - 53) < 2 || (v27 - 65) <= 8)
            {
              if ((v13 - 55) <= 0xFFFFFFFD && v13 != 19 && (v13 - 74) <= 0xFFFFFFF6)
              {
                v99 = NSString;
                v100 = ippTagString(v27);
                objc_msgSend(v99, "stringWithFormat:", @"ippReadIO: 1setOf value tag %x(%s) != %x(%s)", v28, v100, v13, ippTagString(v13));
                v101 = (NSString *)objc_claimAutoreleasedReturnValue();
                IPPIOReader::THROW_FAIL(a1, 258, &cfstr_Ipp1setofAttri.isa, v101);
              }
              if (v27 != v13 && !ippCoerceAttrToValue(v14, v21, v13))
              {
                v95 = NSString;
                uint64_t v96 = [(PK_ipp_attribute_t *)v21 name];
                v97 = ippTagString(v28);
                v98 = [v95 stringWithFormat:@"ippReadIO: Failed to convert %@ attribute from %s to %s.", v96, v97, ippTagString(v13)];
                IPPIOReader::THROW_FAIL(a1, 267, &cfstr_Ipp1setofAttri.isa, v98);
              }
            }
            else if (v27 == 51 || v27 == 33)
            {
              if (v13 != 33 && v13 != 51)
              {
                v105 = NSString;
                v106 = ippTagString(v27);
                objc_msgSend(v105, "stringWithFormat:", @"ippReadIO: 1setOf value tag %x(%s) != %x(%s)", v28, v106, v13, ippTagString(v13));
                v107 = (NSString *)objc_claimAutoreleasedReturnValue();
                IPPIOReader::THROW_FAIL(a1, 280, &cfstr_Ipp1setofAttri.isa, v107);
              }
              if (v13 == 51 && v27 == 33) {
                ippCoerceAttrToValue(v14, v21, 51);
              }
            }
            else if (v27 != v13)
            {
              v102 = NSString;
              v103 = ippTagString(v27);
              objc_msgSend(v102, "stringWithFormat:", @"ippReadIO: value tag %x(%s) != %x(%s)", v28, v103, v13, ippTagString(v13));
              v104 = (NSString *)objc_claimAutoreleasedReturnValue();
              IPPIOReader::THROW_FAIL(a1, 295, &cfstr_Ipp1setofAttri.isa, v104);
            }
          }
          else
          {
            [(PK_ipp_attribute_t *)v21 setValueTag:v13];
          }
          id v22 = [(PK_ipp_attribute_t *)v21 addNewEmptyValue];
        }
        id v23 = v22;
        goto LABEL_57;
      }
    }
    v21 = 0;
    id v23 = 0;
LABEL_57:

    v29 = v21;
    id v30 = v23;
    v17 = v29;
    id v18 = v30;
    IPPIOReader::read(a1, (unsigned __int8 *)__dst, 2uLL);
    int v31 = LOWORD(__dst[0]);
    unint64_t v32 = __rev16(LOWORD(__dst[0]));
    if (v32 > 0x8000)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad value length %d.", v32);
      v69 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 372, &cfstr_IppValueLarger.isa, v69);
    }
    switch((int)v13)
    {
      case 16:
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
        if ([(PK_ipp_attribute_t *)v17 value_tag] != v13) {
          goto LABEL_62;
        }
        if (!v31) {
          goto LABEL_67;
        }
        [(PK_ipp_attribute_t *)v17 setValueTag:65];
LABEL_62:
        v33 = (void *)[v18 string];
        v35 = v34;
        v36 = IPPIOReader::readString((id *)a1, v32, ((v13 - 67) < 7) & (0x73u >> (v13 - 67)));

        id v37 = v33;
        id v38 = v36;
        v39 = v38;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v33, v38);
        }
        else
        {
        }
LABEL_66:

LABEL_67:
        if (v13 == 16)
        {
          v40 = [(PK_ipp_attribute_t *)v17 values];
          [v40 removeAllObjects];
        }
LABEL_103:
        int v19 = 0;
        break;
      case 33:
      case 35:
        if (LOWORD(__dst[0]) != 1024)
        {
          if (v13 == 33)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad integer value length %d.", v32);
            v83 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 382, &cfstr_IppIntegerValu.isa, v83);
          }
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad integer value length %d.", v32);
          v85 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 384, &cfstr_IppEnumValueNo.isa, v85);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        unsigned int v41 = __dst[0];
        int v42 = [(PK_ipp_attribute_t *)v17 value_tag];
        uint64_t v43 = bswap32(v41);
        if (v42 == 51)
        {
          v113[0] = v43;
          v113[1] = v43;
          [v18 setRange:v113];
        }
        else
        {
          [v18 setInteger:v43];
        }
        goto LABEL_102;
      case 34:
        if (LOWORD(__dst[0]) != 256)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad BOOLean value length %d.", v32);
          v93 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 398, &cfstr_IppBooleanValu.isa, v93);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
        [v18 setBoolean:LOBYTE(__dst[0]) != 0];
        goto LABEL_102;
      case 49:
        if (LOWORD(__dst[0]) != 2816)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad date value length %d.", v32);
          v92 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 446, &cfstr_IppDateValueNo.isa, v92);
        }
        v59 = (unsigned __int8 *)IPPIOReader::autoAlloc((id *)a1, 0xCuLL);
        IPPIOReader::read(a1, v59, 0xBuLL);
        goto LABEL_102;
      case 50:
        if (LOWORD(__dst[0]) != 2304)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad resolution value length %d.", v32);
          v91 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 455, &cfstr_IppResolutionV.isa, v91);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        uint64_t v61 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        uint64_t v62 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
        objc_msgSend(v18, "setResolution:", bswap64(v62 | (v61 << 32)), validate_enum<ipp_res_e,unsigned char>(LOBYTE(__dst[0])));
        goto LABEL_102;
      case 51:
        if (LOWORD(__dst[0]) != 2048)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad rangeOfInteger value length %d.", v32);
          v90 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 470, &cfstr_IppRangeofinte.isa, v90);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        unsigned int v63 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v112[0] = bswap32(v63);
        v112[1] = bswap32(__dst[0]);
        [v18 setRange:v112];
        goto LABEL_102;
      case 52:
        v64 = objc_opt_new();
        [v18 setCollection:v64];

        if (v31)
        {
          v89 = [NSString stringWithFormat:@"ippReadIO: begCollection tag with value length > 0."];
          IPPIOReader::THROW_FAIL(a1, 557, &cfstr_IppBegcollecti.isa, v89);
        }
        __dst[0] = 19;
        ipp_state_e v111 = IPP_STATE_IDLE;
        v65 = (void *)MEMORY[0x230FA8DB0]();
        v66 = [v18 collection];
        ippReadWithReader(a1, &v111, (ipp_tag_e *)__dst, 1, v66);

        goto LABEL_102;
      case 53:
      case 54:
        if (v32 <= 3)
        {
          if (v13 == 53)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad stringWithLanguage value length %d.", v32);
            v82 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 485, &cfstr_IppTextwithlan.isa, v82);
          }
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad stringWithLanguage value length %d.", v32);
          v84 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 487, &cfstr_IppNamewithlan.isa, v84);
        }
        v44 = (unsigned __int8 *)IPPIOReader::autoAlloc((id *)a1, v32 + 1);
        IPPIOReader::read(a1, v44, v32);
        v45 = v44 + 2;
        size_t v46 = __rev16(*(unsigned __int16 *)v44);
        if (v46 > 0x3FF || (unint64_t v47 = (unint64_t)&v44[v32], (unint64_t)v45 + v46 > v47))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad language value length %d.", v46);
          v81 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 510, &cfstr_IppLanguageLen.isa, v81);
        }
        if (v46 >= 0x40)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad language value length %d.", v46);
          v80 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 514, &cfstr_IppLanguageLen_0.isa, v80);
        }
        memcpy(__dst, v45, v46);
        *((unsigned char *)__dst + v46) = 0;
        v48 = [NSString stringWithUTF8String:__dst];
        if (!v48)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: language value length %d.", v46);
          v79 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 522, &cfstr_IppStringLanga.isa, v79);
        }
        v49 = &v44[v46];
        unsigned int v51 = *((unsigned __int16 *)v49 + 1);
        v50 = v49 + 2;
        uint64_t v52 = __rev16(v51);
        if ((unint64_t)&v50[v52 + 2] > v47)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad string value length %d.", v52);
          v78 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 530, &cfstr_IppStringLengt.isa, v78);
        }
        v50[v52 + 2] = 0;
        v53 = objc_msgSend(NSString, "stringWithUTF8String:");
        if (!v53)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: string value length %d.", v52);
          v77 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 537, &cfstr_IppStringTextI.isa, v77);
        }
        id v54 = v48;
        id v55 = v53;
        id v56 = v54;
        id v57 = v55;
        v58 = v57;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v56, v57);
        }
        else
        {
        }
        goto LABEL_102;
      case 55:
        if (LOWORD(__dst[0]))
        {
          v88 = [NSString stringWithFormat:@"ippReadIO: endCollection tag with value length > 0."];
          IPPIOReader::THROW_FAIL(a1, 572, &cfstr_IppEndcollecti.isa, v88);
        }

        goto LABEL_26;
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
        goto LABEL_62;
      case 74:
        if (!v17)
        {
          v87 = [NSString stringWithFormat:@"ippReadIO: Member name without attribute."];
          IPPIOReader::THROW_FAIL(a1, 586, &cfstr_IppMembernameW.isa, v87);
        }
        if (!LOWORD(__dst[0]))
        {
          v86 = [NSString stringWithFormat:@"ippReadIO: Empty member name value."];
          IPPIOReader::THROW_FAIL(a1, 591, &cfstr_IppMembernameV.isa, v86);
        }
        v60 = IPPIOReader::readString((id *)a1, v32, 1);
        [(PK_ipp_attribute_t *)v17 setNSName:v60];

        [(PK_ipp_attribute_t *)v17 toss_last_value];
LABEL_102:

        goto LABEL_103;
      default:
        if (v13 == 48 && (v32 & 0x8000) != 0)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"ippReadIO: bad octetString value length %d.", 0x8000);
          v94 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 610, &cfstr_IppOctetstring.isa, v94);
        }
        id v37 = [MEMORY[0x263EFF990] dataWithLength:v32];
        IPPIOReader::read(a1, (unsigned __int8 *)[v37 bytes], v32);
        [v18 setUnknown:v37];
        goto LABEL_66;
    }
    goto LABEL_104;
  }
  if (v9 == IPP_STATE_HEADER)
  {
LABEL_5:
    ipp_tag_e v10 = v108;
    if ((a4 & 1) == 0)
    {
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 8uLL);
      [(PK_ipp_t *)v10 setOp_or_status:bswap32(HIWORD(__dst[0])) >> 16];
      [(PK_ipp_t *)v10 setRequest_id:bswap32(__dst[1])];
    }
    ipp_state_e *v109 = IPP_STATE_ATTRIBUTE;
    *a3 = IPP_TAG_ZERO;

    goto LABEL_8;
  }
  if (v9 == IPP_STATE_IDLE)
  {
    *a2 = IPP_STATE_HEADER;
    goto LABEL_5;
  }
LABEL_107:
}

void sub_22EA5A67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void IPPIOReader::IPPIOReader(IPPIOReader *this, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), void *a3)
{
  *(void *)this = a3;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  uint64_t v4 = objc_opt_new();
  CFStringRef v5 = (void *)*((void *)this + 3);
  *((void *)this + 3) = v4;
}

void sub_22EA5AA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IPPIOReader::read(IPPIOReader *this, unsigned __int8 *__b, size_t a3)
{
  memset(__b, 120, a3);
  uint64_t result = (*((uint64_t (**)(void, unsigned __int8 *, size_t))this + 1))(*(void *)this, __b, a3);
  if (result != a3)
  {
    uint64_t v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)ipp_state_e v9 = 0;
      _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_ERROR, "Failed to read data from ipp record", v9, 2u);
    }

    id v8 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"failed to read enough" userInfo:0];
    objc_exception_throw(v8);
  }
  *((void *)this + 2) += a3;
  return result;
}

void IPPIOReader::THROW_FAIL(IPPIOReader *this, uint64_t a2, NSString *a3, NSString *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unsigned int v6 = a3;
  uint64_t v7 = a4;
  id v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a2;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    int v19 = v7;
    _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_ERROR, "IPPIOReader: Failure on line %d: %{public}@ - %{public}@", buf, 0x1Cu);
  }

  ipp_state_e v9 = objc_msgSend(NSNumber, "numberWithInt:", a2, @"line");
  v13[0] = v9;
  v13[1] = v6;
  v12[1] = @"msg";
  v12[2] = @"log";
  v13[2] = v7;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v11 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:v6 userInfo:v10];
  objc_exception_throw(v11);
}

void sub_22EA5ACB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id IPPIOReader::readString(id *this, unint64_t a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 >= 0x101) {
    p_b = (unsigned __int8 *)IPPIOReader::autoAlloc(this, a2);
  }
  else {
    p_b = &__b;
  }
  IPPIOReader::read((IPPIOReader *)this, p_b, a2);
  if (a3)
  {
    uint64_t v7 = internUTF8ByteString((const char *)p_b, a2);
  }
  else
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithBytes:p_b length:a2 encoding:4];
  }
  if (!v7) {
    IPPIOReader::THROW_FAIL((IPPIOReader *)this, 91, &cfstr_InvalidUtf8Byt.isa, &cfstr_InvalidUtf8Byt.isa);
  }

  return v7;
}

uint64_t IPPIOReader::autoAlloc(id *this, unint64_t a2)
{
  if ([this[3] count])
  {
    uint64_t v4 = [this[3] lastObject];
    CFStringRef v5 = v4;
    if (v4 && [v4 length] + a2 < 0x400) {
      goto LABEL_10;
    }
  }
  else
  {
    CFStringRef v5 = 0;
  }
  if (a2 <= 0x400) {
    uint64_t v6 = 1024;
  }
  else {
    uint64_t v6 = a2;
  }
  uint64_t v7 = [MEMORY[0x263EFF990] dataWithCapacity:v6];

  CFStringRef v5 = (void *)v7;
  [this[3] addObject:v7];
LABEL_10:
  uint64_t v8 = [v5 length];
  [v5 setLength:v8 + a2];
  id v9 = v5;
  uint64_t v10 = [v9 mutableBytes] + v8;

  return v10;
}

void sub_22EA5AEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t withNamedAttrGet<BOOL>(void *a1, uint64_t a2, void *a3)
{
  CFStringRef v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values")) {
    uint64_t v8 = v5[2](v5, v7);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5AF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___Z12getNamedAttrIbET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  size_t v2 = [a2 values];
  uint64_t v3 = [v2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 BOOLean];

  return v4;
}

void sub_22EA5AFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t withNamedAttrGet<int>(void *a1, uint64_t a2, void *a3)
{
  CFStringRef v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values")) {
    uint64_t v8 = v5[2](v5, v7);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5B07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___Z12getNamedAttrIiET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  size_t v2 = [a2 values];
  uint64_t v3 = [v2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 integer];

  return v4;
}

void sub_22EA5B0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getNamedAttr<ipp_orient_e>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = withNamedAttrGet<int>(v3, (uint64_t)v4, &__block_literal_global_3);
  uint64_t v6 = validate_enum<ipp_orient_e,unsigned char>(v5);

  return v6;
}

void sub_22EA5B170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void withNamedAttrGet<ipp_value_range_t>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  id v9 = a3;
  uint64_t v7 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v8 = v7;
  if (v7 && objc_msgSend(v7, "num_values")) {
    v9[2](v9, v8);
  }
  else {
    *a4 = 0;
  }
}

void sub_22EA5B224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrI17ipp_value_range_tET_P8PK_ipp_tP8NSString_block_invoke(void *a1@<X1>, void *a2@<X8>)
{
  id v5 = [a1 values];
  id v3 = [v5 objectAtIndexedSubscript:0];
  id v4 = v3;
  if (v3) {
    [v3 range];
  }
  else {
    *a2 = 0;
  }
}

void sub_22EA5B2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<PK_ipp_collection_t * {__strong}>(void *a1, uint64_t a2)
{
  size_t v2 = withNamedAttrGet<PK_ipp_collection_t * {__strong}>(a1, a2, &__block_literal_global_16);

  return v2;
}

id withNamedAttrGet<PK_ipp_collection_t * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5B3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP19PK_ipp_collection_tET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  size_t v2 = [a2 values];
  id v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 collection];

  return v4;
}

void sub_22EA5B434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSString * {__strong}>(void *a1, uint64_t a2)
{
  size_t v2 = withNamedAttrGet<NSString * {__strong}>(a1, a2, &__block_literal_global_22);

  return v2;
}

id withNamedAttrGet<NSString * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5B520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP8NSStringET_P8PK_ipp_tS1__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 values];
  if ([v3 count] != 1)
  {
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = (void *)[v4 string];
  uint64_t v7 = v6;

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_ERROR, "attribute value expected to be a string", v10, 2u);
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v7;
}

void sub_22EA5B644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSURL * {__strong}>(void *a1, uint64_t a2)
{
  id v2 = getNamedAttr<NSString * {__strong}>(a1, a2);
  if (v2)
  {
    id v3 = [NSURL URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_22EA5B6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSString *> * {__strong}>(void *a1, uint64_t a2)
{
  id v2 = withNamedAttrGet<NSArray<NSString *> * {__strong}>(a1, a2, &__block_literal_global_26);

  return v2;
}

id withNamedAttrGet<NSArray<NSString *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  uint64_t v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke_2;
  v6[3] = &unk_2649EBE88;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateValues:v6];

  return v4;
}

void sub_22EA5B8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v9 = v4;
  uint64_t v6 = (void *)[v4 string];
  uint64_t v8 = v7;
  [v5 addObject:v7];
}

void sub_22EA5B934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSNumber *> * {__strong}>(void *a1, uint64_t a2)
{
  id v2 = withNamedAttrGet<NSArray<NSNumber *> * {__strong}>(a1, a2, &__block_literal_global_30);

  return v2;
}

id withNamedAttrGet<NSArray<NSNumber *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  id v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5BA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke_2;
  v6[3] = &unk_2649EBE88;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateValues:v6];

  return v4;
}

void sub_22EA5BB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v7 = v4;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(v4, "integer"));
  [v5 addObject:v6];
}

void sub_22EA5BB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSData *> * {__strong}>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke;
  v9[3] = &unk_2649EBED8;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  id v7 = withNamedAttrGet<NSArray<NSData *> * {__strong}>(v5, (uint64_t)v6, v9);

  return v7;
}

void sub_22EA5BC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id withNamedAttrGet<NSArray<NSData *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 _findAttribute0:a2 valueTag:0];
  id v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5BD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke_2;
  uint64_t v13 = &unk_2649EBEB0;
  int v15 = &v16;
  id v5 = v4;
  id v14 = v5;
  [v3 enumerateValues:&v10];
  if (*((unsigned char *)v17 + 24) && objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    id v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_ERROR, "Expected ipp record with empty data value to be completely empty for %@ (%@)", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

void sub_22EA5BF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 unknown];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 unknown];
    [v5 addObject:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_22EA5BFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke;
  v9[3] = &unk_2649EBED8;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  id v7 = withNamedAttrGet<NSArray<PK_ipp_collection_t *> * {__strong}>(v5, (uint64_t)v6, v9);

  return v7;
}

void sub_22EA5C0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id withNamedAttrGet<NSArray<PK_ipp_collection_t *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 _findAttribute0:a2 valueTag:0];
  id v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_22EA5C198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke_2;
  uint64_t v13 = &unk_2649EBEB0;
  int v15 = &v16;
  id v5 = v4;
  id v14 = v5;
  [v3 enumerateValues:&v10];
  if (*((unsigned char *)v17 + 24) && objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    id v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_ERROR, "Expected ipp record with empty collection value to be completely empty for %@ (%@)", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

void sub_22EA5C34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 collection];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 collection];
    [v5 addObject:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_22EA5C41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

PKMediaSize *getNamedAttr<PKMediaSize * {__strong}>(void *a1, uint64_t a2)
{
  id v2 = getNamedAttr<PK_ipp_collection_t * {__strong}>(a1, a2);
  if (v2) {
    id v3 = [(PKCollectionSpecialization *)[PKMediaSize alloc] initWithCollection:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_22EA5C4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedMediaAttrArray(PK_ipp_t *a1, NSString *a2, objc_class *a3)
{
  id v4 = [(PK_ipp_t *)a1 _findAttribute0:a2 valueTag:52];
  id v5 = v4;
  if (v4 && objc_msgSend(v4, "num_values"))
  {
    id v6 = objc_opt_new();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZL22getNamedMediaAttrArrayP8PK_ipp_tP8NSStringP10objc_class_block_invoke;
    v9[3] = &unk_2649EBF00;
    id v7 = v6;
    id v10 = v7;
    uint64_t v11 = a3;
    [v5 enumerateValues:v9];
  }
  else
  {
    id v7 = [MEMORY[0x263EFF8C0] array];
  }

  return v7;
}

void sub_22EA5C5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = getNamedMediaAttrArray(v3, v4, v5);

  return v6;
}

void sub_22EA5C644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

PKMediaSourceProperties *getNamedAttr<PKMediaSourceProperties * {__strong}>(void *a1, uint64_t a2)
{
  id v2 = getNamedAttr<PK_ipp_collection_t * {__strong}>(a1, a2);
  if (v2) {
    id v3 = [(PKCollectionSpecialization *)[PKMediaSourceProperties alloc] initWithCollection:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_22EA5C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL Printd_Parameters::_has_LandscapeOrientationRequestedPreferred(id *this)
{
  return [*this _findAttribute0:@"landscape-orientation-requested-preferred" valueTag:35] != 0;
}

uint64_t Printd_Parameters::_get_LandscapeOrientationRequestedPreferred(void **this)
{
  return getNamedAttr<ipp_orient_e>(*this, @"landscape-orientation-requested-preferred");
}

BOOL Printd_Parameters::_has_DocumentPasswordSupported(id *this)
{
  return [*this _findAttribute0:@"document-password-supported" valueTag:33] != 0;
}

BOOL Printd_Parameters::_has_JpegFeaturesSupported(id *this)
{
  return [*this _findAttribute0:@"jpeg-features-supported" valueTag:68] != 0;
}

id Printd_Parameters::_get_JpegFeaturesSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"jpeg-features-supported");

  return v1;
}

id Printd_Parameters::_get_PrintScalingSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"print-scaling-supported");

  return v1;
}

id Printd_Parameters::_get_PrinterMandatoryJobAttributes(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"printer-mandatory-job-attributes");

  return v1;
}

id Printd_Parameters::_get_PrinterStateReasons(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"printer-state-reasons");

  return v1;
}

BOOL Printd_Parameters::_has_CopiesSupported(id *this)
{
  return [*this _findAttribute0:@"copies-supported" valueTag:51] != 0;
}

double __copy_helper_block_ea8_32c23_ZTS17ipp_value_range_t(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

void Printd_Parameters::_get_CopiesSupported(void **this@<X0>, void *a2@<X8>)
{
  v3[3] = *MEMORY[0x263EF8340];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, @"copies-supported", &__block_literal_global_6, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegKOctetsSupported(id *this)
{
  return [*this _findAttribute0:@"jpeg-k-octets-supported" valueTag:51] != 0;
}

void Printd_Parameters::_get_JpegKOctetsSupported(void **this@<X0>, void *a2@<X8>)
{
  v3[3] = *MEMORY[0x263EF8340];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, @"jpeg-k-octets-supported", &__block_literal_global_6, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegXDimensionSupported(id *this)
{
  return [*this _findAttribute0:@"jpeg-x-dimension-supported" valueTag:51] != 0;
}

void Printd_Parameters::_get_JpegXDimensionSupported(void **this@<X0>, void *a2@<X8>)
{
  v3[3] = *MEMORY[0x263EF8340];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, @"jpeg-x-dimension-supported", &__block_literal_global_6, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegYDimensionSupported(id *this)
{
  return [*this _findAttribute0:@"jpeg-y-dimension-supported" valueTag:51] != 0;
}

void Printd_Parameters::_get_JpegYDimensionSupported(void **this@<X0>, void *a2@<X8>)
{
  v3[3] = *MEMORY[0x263EF8340];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, @"jpeg-y-dimension-supported", &__block_literal_global_6, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_PdfKOctetsSupported(id *this)
{
  return [*this _findAttribute0:@"pdf-k-octets-supported" valueTag:51] != 0;
}

void Printd_Parameters::_get_PdfKOctetsSupported(void **this@<X0>, void *a2@<X8>)
{
  v3[3] = *MEMORY[0x263EF8340];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, @"pdf-k-octets-supported", &__block_literal_global_6, v3);
  *a2 = v3[0];
}

id Printd_Parameters::_get_PrinterDeviceId(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"printer-device-id");

  return v1;
}

id Printd_Parameters::_get_PrinterChargeInfoUri(void **this)
{
  uint64_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-charge-info-uri");

  return v1;
}

id Printd_Parameters::_get_PrinterMoreInfo(void **this)
{
  uint64_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-more-info");

  return v1;
}

id Printd_Parameters::_get_PrinterSupplyInfoURI(void **this)
{
  uint64_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-supply-info-uri");

  return v1;
}

id Printd_Parameters::_get_JobPresetsSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(*this, @"job-presets-supported");

  return v1;
}

id Printd_Parameters::_get_DocumentFormatSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"document-format-supported");

  return v1;
}

id Printd_Parameters::_get_MediaColSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"media-col-supported");

  return v1;
}

id Printd_Parameters::_get_MediaColReady(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(*this, @"media-col-ready");

  return v1;
}

id Printd_Parameters::_get_MediaColDatabase(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(*this, @"media-col-database");

  return v1;
}

id Printd_Parameters::_get_PrintColorModeSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"print-color-mode-supported");

  return v1;
}

id Printd_Parameters::_get_PrintQualitySupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"print-quality-supported");

  return v1;
}

id Printd_Parameters::_get_SidesSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"sides-supported");

  return v1;
}

id Printd_Parameters::_get_FinishingsSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"finishings-supported");

  return v1;
}

id Printd_Parameters::_get_FinishingsColDatabase(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(*this, @"finishings-col-database");

  return v1;
}

id Printd_Parameters::_get_OutputBinDefault(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"output-bin-default");

  return v1;
}

BOOL Printd_Parameters::_has_JobAccountIDSupported(id *this)
{
  return [*this _findAttribute0:@"job-account-id-supported" valueTag:34] != 0;
}

uint64_t Printd_Parameters::_get_JobAccountIDSupported(void **this)
{
  return withNamedAttrGet<BOOL>(*this, @"job-account-id-supported", &__block_literal_global_1);
}

id Printd_Parameters::_get_IdentifyActionsSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"identify-actions-supported");

  return v1;
}

id Printd_Parameters::_get_MediaTypeSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"media-type-supported");

  return v1;
}

id Printd_Parameters::_get_OutputBinSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"output-bin-supported");

  return v1;
}

id Printd_Parameters::_get_PrinterOutputTray(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSData *> * {__strong}>(*this, @"printer-output-tray");

  return v1;
}

id Printd_Parameters::_get_MediaSourceSupported(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"media-source-supported");

  return v1;
}

id Printd_Parameters::_get_PrinterInputTray(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSData *> * {__strong}>(*this, @"printer-input-tray");

  return v1;
}

id Printd_Parameters::_get_MarkerNames(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"marker-names");

  return v1;
}

id Printd_Parameters::_get_MarkerColors(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"marker-colors");

  return v1;
}

id Printd_Parameters::_get_MarkerTypes(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"marker-types");

  return v1;
}

id Printd_Parameters::_get_MarkerLevels(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"marker-levels");

  return v1;
}

id Printd_Parameters::_get_MarkerHighLevels(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"marker-high-levels");

  return v1;
}

id Printd_Parameters::_get_MarkerLowLevels(void **this)
{
  uint64_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"marker-low-levels");

  return v1;
}

id Printd_Parameters::_get_MediaSize(void **this)
{
  uint64_t v1 = getNamedAttr<PKMediaSize * {__strong}>(*this, @"media-size");

  return v1;
}

id Printd_Parameters::_get_MediaSourceProperties(void **this)
{
  uint64_t v1 = getNamedAttr<PKMediaSourceProperties * {__strong}>(*this, @"media-source-properties");

  return v1;
}

id Printd_Parameters::_get_MediaSource(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"media-source");

  return v1;
}

id Printd_Parameters::_get_MediaType(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"media-type");

  return v1;
}

id Printd_Parameters::_get_MediaKey(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"media-key");

  return v1;
}

id Printd_Parameters::_get_FeedDirection(void **this)
{
  uint64_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"media-source-feed-direction");

  return v1;
}

uint64_t Printd_Parameters::_get_FeedOrientation(void **this)
{
  return getNamedAttr<ipp_orient_e>(*this, @"media-source-feed-orientation");
}

void ___ZL22getNamedMediaAttrArrayP8PK_ipp_tP8NSStringP10objc_class_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [v9 collection];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_alloc(*(Class *)(a1 + 40));
    id v7 = [v9 collection];
    uint64_t v8 = (void *)[v6 initWithCollection:v7];
    [v5 addObject:v8];
  }
}

void sub_22EA5FC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ippWriteIO(void *a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), PK_ipp_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  ipp_state_e v13 = IPP_STATE_IDLE;
  v14[0] = IPP_TAG_NOVALUE;
  uint64_t v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    v9[0] = a1;
    v9[1] = a2;
    id v10 = (char *)malloc_type_malloc(0x8001uLL, 0x11478DC1uLL);
    uint64_t v11 = v10;
    uint64_t v12 = v10 + 32769;
    ippWriteWithWriter((IPPIOWriter *)v9, &v13, v14, 0, v6);
    uint64_t v7 = 3;
    IPPIOWriter::~IPPIOWriter(v9);
  }

  return v7;
}

void ippWriteWithWriter(IPPIOWriter *a1, ipp_state_e *a2, ipp_tag_e *a3, char a4, PK_ipp_t *a5)
{
  id v9 = a5;
  id v10 = v9;
  ipp_state_e v11 = *a2;
  if (*a2 != IPP_STATE_ATTRIBUTE)
  {
    if (v11 != IPP_STATE_HEADER)
    {
      if (v11) {
        goto LABEL_12;
      }
      *a2 = IPP_STATE_HEADER;
    }
    uint64_t v12 = v9;
    if ((a4 & 1) == 0)
    {
      LOBYTE(v27) = 2;
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      LOBYTE(v27) = 0;
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      unsigned __int16 v13 = [(PK_ipp_t *)v12 op_or_status];
      LOBYTE(v27) = HIBYTE(v13);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      LOBYTE(v27) = v13;
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      unsigned int v14 = [(PK_ipp_t *)v12 request_id];
      LOBYTE(v27) = HIBYTE(v14);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      LOBYTE(v27) = BYTE2(v14);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      LOBYTE(v27) = BYTE1(v14);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
      LOBYTE(v27) = v14;
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
      __int16 v22 = (PK_ipp_t *)&v27;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v18);
    }
    IPPIOWriter::flush((uint64_t)a1);
    *a2 = IPP_STATE_ATTRIBUTE;
    *a3 = IPP_TAG_ZERO;

    IPPIOWriter::flush((uint64_t)a1);
  }
  uint64_t v15 = v10;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = ___ZL25writeAllCurrentAttributesR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP8PK_ipp_tb_block_invoke;
  uint64_t v21 = &unk_2649EBF48;
  char v26 = a4;
  uint64_t v23 = a3;
  uint64_t v24 = a1;
  v25 = a2;
  uint64_t v16 = v15;
  __int16 v22 = v16;
  [(PK_ipp_t *)v16 enumerateAttributes:&v18];
  if (a4)
  {
    char v17 = 55;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    id v30 = &__block_descriptor_40_e8_v16__0_8l;
    int v31 = &v17;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v27);
    char v17 = 0;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    id v30 = &__block_descriptor_40_e8_v16__0_8l;
    int v31 = &v17;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v27);
    char v17 = 0;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    id v30 = &__block_descriptor_40_e8_v16__0_8l;
    int v31 = &v17;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v27);
    char v17 = 0;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    id v30 = &__block_descriptor_40_e8_v16__0_8l;
    int v31 = &v17;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v27);
    char v17 = 0;
  }
  else
  {
    char v17 = 3;
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  id v30 = &__block_descriptor_40_e8_v16__0_8l;
  int v31 = &v17;
  IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v27);
  IPPIOWriter::flush((uint64_t)a1);
  *a2 = IPP_STATE_DATA;

  IPPIOWriter::flush((uint64_t)a1);
LABEL_12:
}

void sub_22EA603E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t IPPIOWriter::flush(uint64_t this)
{
  if ((uint64_t)(*(void *)(this + 24) - *(void *)(this + 16)) >= 1)
  {
    uint64_t v1 = this;
    this = (*(uint64_t (**)(void))(this + 8))(*(void *)this);
    if (this <= 0)
    {
      id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"ipp stream write failure" userInfo:0];
      objc_exception_throw(v2);
    }
    *(void *)(v1 + 24) = *(void *)(v1 + 16);
  }
  return this;
}

void IPPIOWriter::withBufferN(uint64_t a1, size_t a2, void *a3)
{
  id v6 = a3;
  id v5 = *(char **)(a1 + 24);
  if ((unint64_t)&v5[a2] >= *(void *)(a1 + 32))
  {
    IPPIOWriter::flush(a1);
    id v5 = *(char **)(a1 + 24);
    if ((unint64_t)&v5[a2] >= *(void *)(a1 + 32))
    {
      free(*(void **)(a1 + 16));
      id v5 = (char *)malloc_type_malloc(a2, 0x69155969uLL);
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = &v5[a2];
    }
  }
  *(void *)(a1 + 24) = &v5[a2];
  v6[2]();
}

void sub_22EA60584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN11IPPIOWriterlsERKh_block_invoke(uint64_t result, unsigned char *a2)
{
  *a2 = **(unsigned char **)(result + 32);
  return result;
}

void ___ZL25writeAllCurrentAttributesR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP8PK_ipp_tb_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 64)) {
    goto LABEL_2;
  }
  int v24 = **(_DWORD **)(a1 + 40);
  if (v24 == objc_msgSend(v3, "group_tag"))
  {
    if (!objc_msgSend(v4, "group_tag")) {
      goto LABEL_29;
    }
  }
  else
  {
    **(_DWORD **)(a1 + 40) = objc_msgSend(v4, "group_tag");
    if (!objc_msgSend(v4, "group_tag")) {
      goto LABEL_29;
    }
    uint64_t v27 = *(void *)(a1 + 48);
    char v59 = objc_msgSend(v4, "group_tag");
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v27, 1uLL, &v60);
  }
  if (*(unsigned char *)(a1 + 64))
  {
LABEL_2:
    id v5 = [v4 name];
    int v6 = [v5 length];

    if (v6 >= 32758)
    {
      id v57 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"'attr.name' value length too large" userInfo:0];
      objc_exception_throw(v57);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    char v59 = 74;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v7, 1uLL, &v60);
    uint64_t v8 = *(void *)(a1 + 48);
    char v59 = 0;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v8, 1uLL, &v60);
    uint64_t v9 = *(void *)(a1 + 48);
    char v59 = 0;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v9, 1uLL, &v60);
    uint64_t v10 = *(void *)(a1 + 48);
    char v59 = BYTE1(v6);
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v10, 1uLL, &v60);
    uint64_t v11 = *(void *)(a1 + 48);
    char v59 = v6;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v11, 1uLL, &v60);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v4 name];
    unsigned int v14 = (char *)[v13 UTF8String];
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    unsigned int v63 = &__block_descriptor_48_e8_v16__0_8l;
    v64 = v14;
    uint64_t v65 = v6;
    IPPIOWriter::withBufferN(v12, v6, &v60);

    int v15 = objc_msgSend(v4, "value_tag");
    uint64_t v16 = *(void *)(a1 + 48);
    if (v15 >= 128)
    {
      char v59 = 127;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v16, 1uLL, &v60);
      uint64_t v17 = *(void *)(a1 + 48);
      char v59 = objc_msgSend(v4, "value_tag") >> 24;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v17, 1uLL, &v60);
      uint64_t v18 = *(void *)(a1 + 48);
      char v59 = objc_msgSend(v4, "value_tag") >> 16;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v18, 1uLL, &v60);
      uint64_t v19 = *(void *)(a1 + 48);
      char v59 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v19, 1uLL, &v60);
      uint64_t v16 = *(void *)(a1 + 48);
    }
    char v59 = objc_msgSend(v4, "value_tag");
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v16, 1uLL, &v60);
    uint64_t v20 = *(void *)(a1 + 48);
    char v59 = 0;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v20, 1uLL, &v60);
    uint64_t v21 = *(void *)(a1 + 48);
    char v59 = 0;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v21, 1uLL, &v60);
    IPPIOWriter::flush(*(void *)(a1 + 48));
  }
  else
  {
    uint64_t v28 = [v4 name];
    int v29 = [v28 length];

    if (v29 >= 32762)
    {
      id v58 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"'attr name' value length too large" userInfo:0];
      objc_exception_throw(v58);
    }
    int v30 = objc_msgSend(v4, "value_tag");
    uint64_t v31 = *(void *)(a1 + 48);
    if (v30 >= 128)
    {
      char v59 = 127;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v31, 1uLL, &v60);
      uint64_t v32 = *(void *)(a1 + 48);
      char v59 = objc_msgSend(v4, "value_tag") >> 24;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v32, 1uLL, &v60);
      uint64_t v33 = *(void *)(a1 + 48);
      char v59 = objc_msgSend(v4, "value_tag") >> 16;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v33, 1uLL, &v60);
      uint64_t v34 = *(void *)(a1 + 48);
      char v59 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v34, 1uLL, &v60);
      uint64_t v31 = *(void *)(a1 + 48);
    }
    char v59 = objc_msgSend(v4, "value_tag");
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v31, 1uLL, &v60);
    uint64_t v40 = *(void *)(a1 + 48);
    char v59 = BYTE1(v29);
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v40, 1uLL, &v60);
    uint64_t v41 = *(void *)(a1 + 48);
    char v59 = v29;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
    v64 = &v59;
    IPPIOWriter::withBufferN(v41, 1uLL, &v60);
    uint64_t v42 = *(void *)(a1 + 48);
    id v43 = [v4 name];
    v44 = (char *)[v43 UTF8String];
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    uint64_t v62 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    unsigned int v63 = &__block_descriptor_48_e8_v16__0_8l;
    v64 = v44;
    uint64_t v65 = v29;
    IPPIOWriter::withBufferN(v42, v29, &v60);

    IPPIOWriter::flush(*(void *)(a1 + 48));
  }
  switch(objc_msgSend(v4, "value_tag"))
  {
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
      uint64_t v25 = *(void *)(a1 + 48);
      char v59 = 0;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v25, 1uLL, &v60);
      uint64_t v26 = *(void *)(a1 + 48);
      char v59 = 0;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      unsigned int v63 = &__block_descriptor_40_e8_v16__0_8l;
      v64 = &v59;
      IPPIOWriter::withBufferN(v26, 1uLL, &v60);
      goto LABEL_28;
    case 0x21u:
    case 0x23u:
      uint64_t v35 = *(void *)(a1 + 48);
      id v36 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL20writeIntegersOrEnumsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      uint64_t v65 = v35;
      id v37 = (char *)v36;
      v64 = v37;
      [v37 enumerateValues:&v60];
      IPPIOWriter::flush(v35);
      goto LABEL_27;
    case 0x22u:
      uint64_t v53 = *(void *)(a1 + 48);
      id v54 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL13writeBooleansR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      uint64_t v65 = v53;
      id v37 = (char *)v54;
      v64 = v37;
      [v37 enumerateValues:&v60];
      IPPIOWriter::flush(v53);
LABEL_27:

      goto LABEL_28;
    case 0x31u:
      uint64_t v47 = *(void *)(a1 + 48);
      v48 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL10writeDatesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v48;
      uint64_t v65 = v47;
      [v48 enumerateValues:&v60];
      goto LABEL_8;
    case 0x32u:
      uint64_t v51 = *(void *)(a1 + 48);
      uint64_t v52 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL16writeResolutionsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v52;
      uint64_t v65 = v51;
      [v52 enumerateValues:&v60];
      goto LABEL_8;
    case 0x33u:
      uint64_t v49 = *(void *)(a1 + 48);
      v50 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL11writeRangesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v50;
      uint64_t v65 = v49;
      [v50 enumerateValues:&v60];
      goto LABEL_8;
    case 0x34u:
      uint64_t v45 = *(void *)(a1 + 48);
      size_t v46 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL20writeBeginCollectionR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP18PK_ipp_attribute_tP8PK_ipp_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v46;
      uint64_t v65 = v45;
      [v46 enumerateValues:&v60];
      goto LABEL_8;
    case 0x35u:
    case 0x36u:
      uint64_t v38 = *(void *)(a1 + 48);
      v39 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL14writeTextLangsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v39;
      uint64_t v65 = v38;
      [v39 enumerateValues:&v60];
      goto LABEL_8;
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL12writeStringsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v23;
      uint64_t v65 = v22;
      [v23 enumerateValues:&v60];
      goto LABEL_8;
    default:
      uint64_t v55 = *(void *)(a1 + 48);
      id v56 = v4;
      uint64_t v60 = MEMORY[0x263EF8330];
      uint64_t v61 = 3221225472;
      uint64_t v62 = ___ZL19writeDefaultUnknownR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      unsigned int v63 = &unk_2649EBF90;
      v64 = v56;
      uint64_t v65 = v55;
      [v56 enumerateValues:&v60];
LABEL_8:

LABEL_28:
      IPPIOWriter::flush(*(void *)(a1 + 48));
      break;
  }
LABEL_29:
}

void sub_22EA613DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void *___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke(uint64_t a1, void *__dst)
{
  return memcpy(__dst, *(const void **)(a1 + 32), *(void *)(a1 + 40));
}

void ___ZL20writeIntegersOrEnumsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v15 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v20 = &v15;
    IPPIOWriter::withBufferN(v6, 1uLL, &v16);
    uint64_t v7 = *(void *)(a1 + 40);
    char v15 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v20 = &v15;
    IPPIOWriter::withBufferN(v7, 1uLL, &v16);
    uint64_t v8 = *(void *)(a1 + 40);
    char v15 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v20 = &v15;
    IPPIOWriter::withBufferN(v8, 1uLL, &v16);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  char v15 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v9, 1uLL, &v16);
  uint64_t v10 = *(void *)(a1 + 40);
  char v15 = 4;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v10, 1uLL, &v16);
  uint64_t v11 = *(void *)(a1 + 40);
  char v15 = [v5 integer] >> 24;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v11, 1uLL, &v16);
  uint64_t v12 = *(void *)(a1 + 40);
  char v15 = [v5 integer] >> 16;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v12, 1uLL, &v16);
  uint64_t v13 = *(void *)(a1 + 40);
  char v15 = (unsigned __int16)[v5 integer] >> 8;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v13, 1uLL, &v16);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = [v5 integer];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v20 = &v15;
  IPPIOWriter::withBufferN(v14, 1uLL, &v16);
}

void sub_22EA61924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL13writeBooleansR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v12 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v17 = &v12;
    IPPIOWriter::withBufferN(v6, 1uLL, &v13);
    uint64_t v7 = *(void *)(a1 + 40);
    char v12 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v17 = &v12;
    IPPIOWriter::withBufferN(v7, 1uLL, &v13);
    uint64_t v8 = *(void *)(a1 + 40);
    char v12 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v17 = &v12;
    IPPIOWriter::withBufferN(v8, 1uLL, &v13);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  char v12 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v17 = &v12;
  IPPIOWriter::withBufferN(v9, 1uLL, &v13);
  uint64_t v10 = *(void *)(a1 + 40);
  char v12 = 1;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v17 = &v12;
  IPPIOWriter::withBufferN(v10, 1uLL, &v13);
  uint64_t v11 = *(void *)(a1 + 40);
  char v12 = [v5 BOOLean];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  char v15 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v16 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v17 = &v12;
  IPPIOWriter::withBufferN(v11, 1uLL, &v13);
}

void sub_22EA61BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL12writeStringsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v23 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v27 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v28 = &v23;
    IPPIOWriter::withBufferN(v6, 1uLL, &v24);
    uint64_t v7 = *(void *)(a1 + 40);
    char v23 = 0;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v27 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v28 = &v23;
    IPPIOWriter::withBufferN(v7, 1uLL, &v24);
    uint64_t v8 = *(void *)(a1 + 40);
    char v23 = 0;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v27 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v28 = &v23;
    IPPIOWriter::withBufferN(v8, 1uLL, &v24);
  }
  uint64_t v9 = (void *)[v5 string];
  uint64_t v11 = v10;

  if (v11)
  {
    char v12 = (void *)[v5 string];
    uint64_t v14 = v13;
    LODWORD(v11) = strlen((const char *)[v13 UTF8String]);

    if ((int)v11 >= 0x8000)
    {
      id v22 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"'text' value length too large" userInfo:0];
      objc_exception_throw(v22);
    }
  }
  uint64_t v15 = *(void *)(a1 + 40);
  char v23 = BYTE1(v11);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v27 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v28 = &v23;
  IPPIOWriter::withBufferN(v15, 1uLL, &v24);
  uint64_t v16 = *(void *)(a1 + 40);
  char v23 = (char)v11;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v27 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v28 = &v23;
  IPPIOWriter::withBufferN(v16, 1uLL, &v24);
  if ((int)v11 >= 1)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = (void *)[v5 string];
    uint64_t v20 = v19;
    uint64_t v21 = [v19 UTF8String];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    uint64_t v27 = &__block_descriptor_48_e8_v16__0_8l;
    uint64_t v28 = (char *)v21;
    uint64_t v29 = v11;
    IPPIOWriter::withBufferN(v17, v11, &v24);
  }
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA61EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL10writeDatesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v21) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v18 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v19 = &v21;
    IPPIOWriter::withBufferN(v6, 1uLL, &v15);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v21) = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v18 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v19 = &v21;
    IPPIOWriter::withBufferN(v7, 1uLL, &v15);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v21) = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v18 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v19 = &v21;
    IPPIOWriter::withBufferN(v8, 1uLL, &v15);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v21) = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v18 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v19 = &v21;
  IPPIOWriter::withBufferN(v9, 1uLL, &v15);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v21) = 11;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v18 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v19 = &v21;
  IPPIOWriter::withBufferN(v10, 1uLL, &v15);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v5 date];
  __int16 v22 = v13;
  char v23 = v14;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
  uint64_t v18 = &__block_descriptor_48_e8_v16__0_8l;
  uint64_t v19 = &v21;
  uint64_t v20 = 11;
  uint64_t v21 = v12;
  IPPIOWriter::withBufferN(v11, 0xBuLL, &v15);
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA621A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL16writeResolutionsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v21 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v26 = &v21;
    IPPIOWriter::withBufferN(v6, 1uLL, &v22);
    uint64_t v7 = *(void *)(a1 + 40);
    char v21 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v26 = &v21;
    IPPIOWriter::withBufferN(v7, 1uLL, &v22);
    uint64_t v8 = *(void *)(a1 + 40);
    char v21 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v26 = &v21;
    IPPIOWriter::withBufferN(v8, 1uLL, &v22);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  char v21 = 0;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v9, 1uLL, &v22);
  uint64_t v10 = *(void *)(a1 + 40);
  char v21 = 9;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v10, 1uLL, &v22);
  uint64_t v11 = *(void *)(a1 + 40);
  char v21 = [v5 resolution] >> 24;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v11, 1uLL, &v22);
  uint64_t v12 = *(void *)(a1 + 40);
  char v21 = [v5 resolution] >> 16;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v12, 1uLL, &v22);
  uint64_t v13 = *(void *)(a1 + 40);
  char v21 = (unsigned __int16)[v5 resolution] >> 8;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v13, 1uLL, &v22);
  uint64_t v14 = *(void *)(a1 + 40);
  char v21 = [v5 resolution];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v14, 1uLL, &v22);
  uint64_t v15 = *(void *)(a1 + 40);
  char v21 = (unint64_t)[v5 resolution] >> 56;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v15, 1uLL, &v22);
  uint64_t v16 = *(void *)(a1 + 40);
  char v21 = (unint64_t)[v5 resolution] >> 48;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v16, 1uLL, &v22);
  uint64_t v17 = *(void *)(a1 + 40);
  char v21 = (unsigned __int16)((unint64_t)[v5 resolution] >> 32) >> 8;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v17, 1uLL, &v22);
  uint64_t v18 = *(void *)(a1 + 40);
  char v21 = (unint64_t)[v5 resolution] >> 32;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v18, 1uLL, &v22);
  uint64_t v19 = *(void *)(a1 + 40);
  [v5 resolution];
  char v21 = v20;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v25 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v26 = &v21;
  IPPIOWriter::withBufferN(v19, 1uLL, &v22);
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA6272C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL11writeRangesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v27) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v33 = &v27;
    IPPIOWriter::withBufferN(v6, 1uLL, &v29);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v27) = 0;
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v33 = &v27;
    IPPIOWriter::withBufferN(v7, 1uLL, &v29);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v27) = 0;
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v33 = &v27;
    IPPIOWriter::withBufferN(v8, 1uLL, &v29);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v27) = 0;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = &v27;
  IPPIOWriter::withBufferN(v9, 1uLL, &v29);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v27) = 8;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = &v27;
  IPPIOWriter::withBufferN(v10, 1uLL, &v29);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v12 = BYTE3(v27);
  }
  else
  {
    char v12 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v12;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v11, 1uLL, &v29);
  uint64_t v13 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v14 = BYTE2(v27);
  }
  else
  {
    char v14 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v14;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v13, 1uLL, &v29);
  uint64_t v15 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v16 = BYTE1(v27);
  }
  else
  {
    char v16 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v16;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v15, 1uLL, &v29);
  uint64_t v17 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v18 = v27;
  }
  else
  {
    char v18 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v18;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v17, 1uLL, &v29);
  uint64_t v19 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v20 = HIBYTE(v27);
  }
  else
  {
    char v20 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v20;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v19, 1uLL, &v29);
  uint64_t v21 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v22 = BYTE6(v27);
  }
  else
  {
    char v22 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v22;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v21, 1uLL, &v29);
  uint64_t v23 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    int v24 = HIDWORD(v27) >> 8;
  }
  else
  {
    LOBYTE(v24) = 0;
    uint64_t v27 = 0;
  }
  char v28 = v24;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v23, 1uLL, &v29);
  uint64_t v25 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v26 = BYTE4(v27);
  }
  else
  {
    char v26 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v26;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v32 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v33 = (uint64_t *)&v28;
  IPPIOWriter::withBufferN(v25, 1uLL, &v29);
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA62D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL14writeTextLangsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v49 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
    id v54 = &v49;
    IPPIOWriter::withBufferN(v6, 1uLL, &v50);
    uint64_t v7 = *(void *)(a1 + 40);
    char v49 = 0;
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
    id v54 = &v49;
    IPPIOWriter::withBufferN(v7, 1uLL, &v50);
    uint64_t v8 = *(void *)(a1 + 40);
    char v49 = 0;
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
    id v54 = &v49;
    IPPIOWriter::withBufferN(v8, 1uLL, &v50);
  }
  uint64_t v9 = (void *)[v5 string];

  if (v9)
  {
    uint64_t v11 = (void *)[v5 string];
    uint64_t v13 = v12;
    int v14 = strlen((const char *)[v11 UTF8String]) + 4;
  }
  else
  {
    int v14 = 4;
  }
  uint64_t v15 = (void *)[v5 string];
  uint64_t v17 = v16;

  if (v17)
  {
    char v18 = (void *)[v5 string];
    char v20 = v19;
    v14 += strlen((const char *)[v19 UTF8String]);
  }
  if (v14 >= 0x8000)
  {
    id v48 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"'text' value length too large" userInfo:0];
    objc_exception_throw(v48);
  }
  uint64_t v21 = *(void *)(a1 + 40);
  char v49 = BYTE1(v14);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v21, 1uLL, &v50);
  uint64_t v22 = *(void *)(a1 + 40);
  char v49 = v14;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v22, 1uLL, &v50);
  uint64_t v23 = (void *)[v5 string];

  if (v23)
  {
    uint64_t v25 = (void *)[v5 string];
    uint64_t v27 = v26;
    LODWORD(v23) = strlen((const char *)[v25 UTF8String]);
  }
  uint64_t v28 = *(void *)(a1 + 40);
  char v49 = BYTE1(v23);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v28, 1uLL, &v50);
  uint64_t v29 = *(void *)(a1 + 40);
  char v49 = (char)v23;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v29, 1uLL, &v50);
  if ((int)v23 >= 1)
  {
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = (void *)[v5 string];
    uint64_t v33 = v32;
    uint64_t v34 = [v31 UTF8String];
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    uint64_t v53 = &__block_descriptor_48_e8_v16__0_8l;
    id v54 = (char *)v34;
    uint64_t v55 = v23;
    IPPIOWriter::withBufferN(v30, v23, &v50);
  }
  uint64_t v35 = (void *)[v5 string];
  id v37 = v36;

  if (v37)
  {
    uint64_t v38 = (void *)[v5 string];
    uint64_t v40 = v39;
    LODWORD(v37) = strlen((const char *)[v39 UTF8String]);
  }
  uint64_t v41 = *(void *)(a1 + 40);
  char v49 = BYTE1(v37);
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v41, 1uLL, &v50);
  uint64_t v42 = *(void *)(a1 + 40);
  char v49 = (char)v37;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v53 = &__block_descriptor_40_e8_v16__0_8l;
  id v54 = &v49;
  IPPIOWriter::withBufferN(v42, 1uLL, &v50);
  if ((int)v37 >= 1)
  {
    uint64_t v43 = *(void *)(a1 + 40);
    v44 = (void *)[v5 string];
    size_t v46 = v45;
    uint64_t v47 = [v45 UTF8String];
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    uint64_t v53 = &__block_descriptor_48_e8_v16__0_8l;
    id v54 = (char *)v47;
    uint64_t v55 = v37;
    IPPIOWriter::withBufferN(v43, v37, &v50);
  }
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA632C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL20writeBeginCollectionR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP18PK_ipp_attribute_tP8PK_ipp_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v15) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    *(void *)char v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    char v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    char v20 = &v15;
    IPPIOWriter::withBufferN(v6, 1uLL, v16);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v15) = 0;
    *(void *)char v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    char v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    char v20 = &v15;
    IPPIOWriter::withBufferN(v7, 1uLL, v16);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v15) = 0;
    *(void *)char v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    char v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
    char v20 = &v15;
    IPPIOWriter::withBufferN(v8, 1uLL, v16);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v15) = 0;
  *(void *)char v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  char v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  char v20 = &v15;
  IPPIOWriter::withBufferN(v9, 1uLL, v16);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v15) = 0;
  *(void *)char v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  char v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v19 = &__block_descriptor_40_e8_v16__0_8l;
  char v20 = &v15;
  IPPIOWriter::withBufferN(v10, 1uLL, v16);
  uint64_t v11 = [v5 collection];

  if (!v11)
  {
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"IPP Value nil" userInfo:0];
    objc_exception_throw(v14);
  }
  ipp_state_e v15 = IPP_STATE_IDLE;
  v16[0] = IPP_TAG_NOVALUE;
  char v12 = *(IPPIOWriter **)(a1 + 40);
  uint64_t v13 = [v5 collection];
  ippWriteWithWriter(v12, &v15, v16, 1, v13);

  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA635CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL19writeDefaultUnknownR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    char v17 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    char v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v22 = &v17;
    IPPIOWriter::withBufferN(v6, 1uLL, &v18);
    uint64_t v7 = *(void *)(a1 + 40);
    char v17 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    char v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v22 = &v17;
    IPPIOWriter::withBufferN(v7, 1uLL, &v18);
    uint64_t v8 = *(void *)(a1 + 40);
    char v17 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    char v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
    uint64_t v22 = &v17;
    IPPIOWriter::withBufferN(v8, 1uLL, &v18);
  }
  uint64_t v9 = [v5 unknown];
  int v10 = [v9 length];

  if (v10 >= 0x8000)
  {
    id v16 = [MEMORY[0x263EFF940] exceptionWithName:@"IPPInternal" reason:@"'unknown' value length too large" userInfo:0];
    objc_exception_throw(v16);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  char v17 = BYTE1(v10);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  char v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v22 = &v17;
  IPPIOWriter::withBufferN(v11, 1uLL, &v18);
  uint64_t v12 = *(void *)(a1 + 40);
  char v17 = v10;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  char v20 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  uint64_t v21 = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v22 = &v17;
  IPPIOWriter::withBufferN(v12, 1uLL, &v18);
  if (v10 >= 1)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [v5 unknown];
    uint64_t v15 = [v14 bytes];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    char v20 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    uint64_t v21 = &__block_descriptor_48_e8_v16__0_8l;
    uint64_t v22 = (char *)v15;
    uint64_t v23 = v10;
    IPPIOWriter::withBufferN(v13, v10, &v18);
  }
  IPPIOWriter::flush(*(void *)(a1 + 40));
}

void sub_22EA638CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IPPIOWriter::~IPPIOWriter(void **this)
{
}

void __clang_call_terminate(void *a1)
{
}

uint64_t urfWriteLine(uint64_t a1, void *__src, int a3, int a4, int a5)
{
  uint64_t result = 0;
  if (a1 && a3 >= 1 && a4 >= 1)
  {
    unsigned int v8 = *(_DWORD *)(a1 + 80);
    unsigned int v9 = *(_DWORD *)(a1 + 40);
    if (v9 <= v8)
    {
      uint64_t result = 0;
      *(void *)(a1 + 112) = "Too many lines in page image";
      return result;
    }
    uint64_t v11 = __src;
    if (v8 + a4 <= v9) {
      int v12 = a4;
    }
    else {
      int v12 = v9 - v8;
    }
    size_t v13 = *(void *)(a1 + 72);
    unsigned int v14 = v12 + v8;
    *(_DWORD *)(a1 + 80) = v12 + v8;
    int v15 = *(_DWORD *)(a1 + 84);
    unint64_t __n = v13 / a3;
    if (v15)
    {
      if (*(_DWORD *)(a1 + 88) == a3)
      {
        id v16 = *(const void **)(a1 + 64);
        if (!memcmp(__src, v16, __n))
        {
          *(_DWORD *)(a1 + 84) = v15 + v12;
          if (a5)
          {
            *(void *)(a1 + 64) = v11;
          }
          else
          {
            char v17 = *(void **)(a1 + 56);
            if (v16 != v17)
            {
              memcpy(v17, v11, v13);
              *(void *)(a1 + 64) = *(void *)(a1 + 56);
              unsigned int v14 = *(_DWORD *)(a1 + 80);
              unsigned int v9 = *(_DWORD *)(a1 + 40);
            }
          }
          if (v14 >= v9)
          {
            while (*(_DWORD *)(a1 + 84))
            {
              int v18 = urf_compress(a1);
              uint64_t result = 0;
              if (!v18) {
                return result;
              }
            }
          }
          return 1;
        }
      }
      while (*(_DWORD *)(a1 + 84))
      {
        uint64_t result = urf_compress(a1);
        if (!result) {
          return result;
        }
      }
    }
    *(_DWORD *)(a1 + 84) = v12;
    *(_DWORD *)(a1 + 88) = a3;
    if (!a5 && *(_DWORD *)(a1 + 80) < *(_DWORD *)(a1 + 40))
    {
      memcpy(*(void **)(a1 + 56), v11, __n);
      uint64_t v11 = *(const void **)(a1 + 56);
    }
    *(void *)(a1 + 64) = v11;
    if (*(_DWORD *)(a1 + 80) >= *(_DWORD *)(a1 + 40))
    {
      while (*(_DWORD *)(a1 + 84))
      {
        uint64_t result = urf_compress(a1);
        if (!result) {
          return result;
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t urf_compress(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 24) - 16;
  BOOL v2 = v1 > 0x30;
  uint64_t v3 = (1 << v1) & 0x1000100000001;
  if (v2 || v3 == 0)
  {
    unsigned int v36 = *(_DWORD *)(a1 + 84);
    if (v36 >= 0x100) {
      unsigned int v36 = 256;
    }
    id v37 = *(unsigned char **)(a1 + 96);
    *id v37 = v36 - 1;
    uint64_t v38 = v37 + 1;
    unint64_t v39 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v36;
    uint64_t v40 = *(void *)(a1 + 72) / v39;
    if (v40 >= 1)
    {
      size_t v41 = (unint64_t)*(unsigned __int8 *)(a1 + 24) >> 3;
      unint64_t v42 = *(void *)(a1 + 64);
      uint64_t v43 = (unsigned __int8 *)(v42 + v40);
      v44 = (unsigned __int8 *)(v42 + v40 - v41);
      if (*(unsigned char *)(a1 + 25) == 6) {
        int v45 = 0;
      }
      else {
        int v45 = 255;
      }
      int v78 = v45;
      uint64_t v46 = 2 * v41;
      unint64_t v47 = 0x80 / v39;
      v76 = v43;
      while (v78 != *(unsigned __int8 *)v42 || memcmp((const void *)v42, (const void *)(v42 + 1), (size_t)&v43[~v42]))
      {
        id v48 = (unsigned __int8 *)(v42 + v41);
        if ((unsigned __int8 *)(v42 + v41) == v43)
        {
          *uint64_t v38 = v39 - 1;
          v68 = v38 + 1;
          memcpy(v68, (const void *)v42, v41);
          uint64_t v38 = &v68[v41];
          goto LABEL_99;
        }
        int v49 = memcmp((const void *)v42, (const void *)(v42 + v41), v41);
        BOOL v50 = v48 < v44;
        if (v49)
        {
          unint64_t v51 = 1;
          if (v39 > 0x40)
          {
            BOOL v52 = v39 < 0x41;
          }
          else
          {
            BOOL v52 = v39 < 0x41;
            if (v48 < v44)
            {
              unint64_t v53 = v42;
              unint64_t v51 = 1;
              while (1)
              {
                id v48 = (unsigned __int8 *)(v53 + v41);
                unint64_t v54 = v53 + v46;
                if (!memcmp((const void *)(v53 + v41), (const void *)(v53 + v46), v41)) {
                  break;
                }
                ++v51;
                BOOL v50 = v54 < (unint64_t)v44;
                BOOL v52 = v51 < v47;
                if (v51 < v47)
                {
                  unint64_t v53 = (unint64_t)v48;
                  if (v54 < (unint64_t)v44) {
                    continue;
                  }
                }
                v48 += v41;
                goto LABEL_79;
              }
              BOOL v52 = 1;
              BOOL v50 = 1;
            }
          }
LABEL_79:
          int v60 = v50 || !v52;
          if (v60) {
            size_t v61 = 0;
          }
          else {
            size_t v61 = v41;
          }
          char v59 = &v48[v61];
          unint64_t v62 = v51 + (v60 ^ 1u);
          *v38++ = 1 - v62 * v39;
          if (v39 == 1)
          {
            size_t v63 = v62 * v41;
            memcpy(v38, (const void *)v42, v63);
            v38 += v63;
          }
          else
          {
            do
            {
              unint64_t v64 = v39;
              do
              {
                memcpy(v38, (const void *)v42, v41);
                v38 += v41;
                --v64;
              }
              while (v64);
              v42 += v41;
              --v62;
            }
            while (v62);
          }
        }
        else
        {
          LOBYTE(v55) = 2;
          if (v39 <= 0x2A && v48 < v44)
          {
            unint64_t v56 = v42;
            uint64_t v55 = 2;
            while (1)
            {
              id v48 = (unsigned __int8 *)(v56 + v41);
              unint64_t v57 = v56 + v46;
              if (memcmp((const void *)(v56 + v41), (const void *)(v56 + v46), v41)) {
                break;
              }
              if (++v55 < v47)
              {
                unint64_t v56 = (unint64_t)v48;
                if (v57 < (unint64_t)v44) {
                  continue;
                }
              }
              v48 += v41;
              break;
            }
          }
          *uint64_t v38 = v55 * v39 - 1;
          id v58 = v38 + 1;
          memcpy(v58, (const void *)v42, v41);
          uint64_t v38 = &v58[v41];
          char v59 = &v48[v41];
        }
        unint64_t v42 = (unint64_t)v59;
        BOOL v65 = v59 >= v76;
        uint64_t v43 = v76;
        if (v65) {
          goto LABEL_99;
        }
      }
      *v38++ = 0x80;
    }
LABEL_99:
    uint64_t v66 = a1;
    v67 = &v38[-*(void *)(a1 + 96)];
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a1 + 84);
    if (v5 >= 0x100) {
      unsigned int v5 = 256;
    }
    uint64_t v6 = *(unsigned char **)(a1 + 96);
    unsigned char *v6 = v5 - 1;
    uint64_t v7 = v6 + 1;
    unint64_t v8 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v5;
    uint64_t v9 = *(void *)(a1 + 72) / v8;
    if (v9 < 1)
    {
LABEL_94:
      uint64_t v29 = v7;
    }
    else
    {
      unint64_t v10 = *(unsigned __int8 *)(a1 + 24);
      unint64_t v11 = v10 >> 4;
      int v12 = *(unsigned char **)(a1 + 64);
      size_t v13 = &v12[v9];
      unint64_t v14 = (unint64_t)&v12[v9 + -2 * (v10 >> 4)];
      if (*(unsigned char *)(a1 + 25) == 6) {
        int v15 = 0;
      }
      else {
        int v15 = 0xFFFF;
      }
      v72 = &v12[v9];
      v73 = v13 - 2;
      size_t v16 = 2 * v11;
      int v74 = v15;
      uint64_t v17 = 4 * v11;
      uint64_t v70 = v11 + 1;
      unint64_t v75 = v10 >> 4;
      unint64_t v77 = 0x80 / v8;
      while (1)
      {
        if (v74 == *(unsigned __int16 *)v12 && !memcmp(v12, v12 + 2, v73 - v12))
        {
          *v7++ = 0x80;
          goto LABEL_94;
        }
        int v18 = &v12[2 * v75];
        if (v18 == v13) {
          break;
        }
        int v19 = memcmp(v12, &v12[2 * v75], v16);
        BOOL v20 = (unint64_t)v18 < v14;
        if (v19)
        {
          LOBYTE(v21) = 1;
          if (v8 > 0x40)
          {
            BOOL v22 = v8 < 0x41;
          }
          else
          {
            BOOL v22 = v8 < 0x41;
            if ((unint64_t)v18 < v14)
            {
              uint64_t v23 = v12;
              unint64_t v21 = 1;
              while (1)
              {
                int v18 = &v23[v16];
                unint64_t v24 = (unint64_t)&v23[v17];
                if (!memcmp(&v23[v16], &v23[v17], v16)) {
                  break;
                }
                ++v21;
                BOOL v20 = v24 < v14;
                BOOL v22 = v21 < v77;
                if (v21 < v77)
                {
                  uint64_t v23 = v18;
                  if (v24 < v14) {
                    continue;
                  }
                }
                v18 += v16;
                goto LABEL_38;
              }
              BOOL v22 = 1;
              BOOL v20 = 1;
LABEL_38:
              size_t v13 = v72;
            }
          }
          int v31 = v20 || !v22;
          unint64_t v32 = v10 >> 4;
          if (v31) {
            unint64_t v32 = 0;
          }
          uint64_t v28 = &v18[2 * v32];
          unsigned char *v7 = 1 - (v21 + (v31 ^ 1)) * v8;
          uint64_t v29 = v7 + 1;
          while (v12 < v28)
          {
            unint64_t v33 = v8;
            do
            {
              if (v10 >= 0x10)
              {
                uint64_t v34 = 0;
                do
                {
                  uint64_t v35 = &v29[v34];
                  unsigned char *v35 = v12[v34 + 1];
                  v35[1] = v12[v34];
                  v34 += 2;
                }
                while (v16 != v34);
                v29 += v34;
              }
              --v33;
            }
            while (v33);
            v12 += v16;
          }
        }
        else
        {
          LOBYTE(v25) = 2;
          if (v8 <= 0x2A && (unint64_t)v18 < v14)
          {
            uint64_t v25 = 2;
            while (1)
            {
              int v18 = &v12[v16];
              char v26 = &v12[v17];
              if (memcmp(&v12[v16], &v12[v17], v16)) {
                break;
              }
              if (++v25 < v77)
              {
                v12 += v16;
                if ((unint64_t)v26 < v14) {
                  continue;
                }
              }
              v18 += v16;
              break;
            }
            size_t v13 = v72;
          }
          unsigned char *v7 = v25 * v8 - 1;
          uint64_t v27 = v7 + 1;
          if (v10 >= 0x10)
          {
            uint64_t v30 = v70;
            do
            {
              *uint64_t v27 = v18[1];
              uint64_t v28 = v18 + 2;
              uint64_t v29 = v27 + 2;
              v27[1] = *v18;
              --v30;
              v27 += 2;
              v18 += 2;
            }
            while (v30 > 1);
          }
          else
          {
            uint64_t v28 = v18;
            uint64_t v29 = v27;
          }
        }
        uint64_t v7 = v29;
        int v12 = v28;
        if (v28 >= v13) {
          goto LABEL_95;
        }
      }
      *v7++ = v8 - 1;
      if (v10 < 0x10) {
        goto LABEL_94;
      }
      do
      {
        unsigned char *v7 = v12[1];
        uint64_t v29 = v7 + 2;
        v7[1] = *v12;
        v7 += 2;
        v12 += 2;
      }
      while (v12 < v13);
    }
LABEL_95:
    uint64_t v66 = a1;
    v67 = &v29[-*(void *)(a1 + 96)];
    if ((unint64_t)v67 > *(void *)(a1 + 104)) {
      urf_compress();
    }
  }
  if ((char *)(*(uint64_t (**)(void))v66)(*(void *)(v66 + 8)) == v67) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(v66 + 112) = "Unable to write line";
  return result;
}

uint64_t urfWritePage(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      unsigned int v4 = *(_DWORD *)(result + 16);
      if (v4 && *(_DWORD *)(result + 20) >= v4)
      {
        uint64_t result = 0;
        uint64_t v9 = "Done writing all pages";
      }
      else
      {
        uint64_t result = _urfSetLineSize(result, (unsigned __int8 *)a2);
        if (!result) {
          return result;
        }
        uint64_t v10 = *a2;
        int v11 = *((_DWORD *)a2 + 2);
        int8x8_t v12 = vrev32_s8(*(int8x8_t *)((char *)a2 + 12));
        unsigned int v5 = bswap32(*((_DWORD *)a2 + 5));
        uint64_t v14 = 0;
        unsigned int v13 = v5;
        if ((*(uint64_t (**)(void, uint64_t *, uint64_t))v3)(*(void *)(v3 + 8), &v10, 32) == 32)
        {
          ++*(_DWORD *)(v3 + 20);
          *(void *)(v3 + 80) = 0;
          unint64_t v6 = 2 * *(void *)(v3 + 72) + 2;
          if (v6 <= *(void *)(v3 + 104)) {
            return 1;
          }
          uint64_t v7 = *(void **)(v3 + 96);
          if (v7)
          {
            unint64_t v8 = malloc_type_realloc(v7, 2 * *(void *)(v3 + 72) + 2, 0xF73AE04CuLL);
            if (v8)
            {
LABEL_10:
              *(void *)(v3 + 96) = v8;
              *(void *)(v3 + 104) = v6;
              return 1;
            }
          }
          else
          {
            unint64_t v8 = malloc_type_malloc(2 * *(void *)(v3 + 72) + 2, 0x5EA8BDB2uLL);
            if (v8) {
              goto LABEL_10;
            }
          }
          free(*(void **)(v3 + 96));
          uint64_t result = 0;
          *(void *)(v3 + 96) = 0;
          *(void *)(v3 + 104) = 0;
          uint64_t v9 = "Unable to allocate memory for compression buffer";
        }
        else
        {
          uint64_t result = 0;
          uint64_t v9 = "Unable to write page header";
        }
      }
    }
    else
    {
      uint64_t result = 0;
      uint64_t v9 = "NULL page header";
    }
    *(void *)(v3 + 112) = v9;
  }
  return result;
}

uint64_t urfWriteStart(uint64_t result, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v2 = result;
    *(_DWORD *)(result + 16) = a2;
    uint64_t v3 = 0x54534152494E55;
    char v4 = HIBYTE(a2);
    char v5 = BYTE2(a2);
    char v6 = BYTE1(a2);
    char v7 = a2;
    if ((*(uint64_t (**)(void, uint64_t *, uint64_t))result)(*(void *)(result + 8), &v3, 12) == 12)
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(void *)(v2 + 112) = "Unable to write file header";
    }
  }
  return result;
}

id getPrintdRPCProtocolInterface(void)
{
  if (getPrintdRPCProtocolInterface(void)::sOnce != -1) {
    dispatch_once(&getPrintdRPCProtocolInterface(void)::sOnce, &__block_literal_global_2);
  }
  v0 = (void *)getPrintdRPCProtocolInterface(void)::sInterface;

  return v0;
}

void ___Z29getPrintdRPCProtocolInterfacev_block_invoke()
{
  v15[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E26D278];
  v15[0] = objc_opt_class();
  unsigned int v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v2 = [v0 classesForSelector:sel_getRecentJobsReply_ argumentIndex:1 ofReply:1];
  uint64_t v3 = [v2 setByAddingObjectsFromArray:v1];
  [v0 setClasses:v3 forSelector:sel_getRecentJobsReply_ argumentIndex:1 ofReply:1];

  uint64_t v14 = objc_opt_class();
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  char v5 = [v0 classesForSelector:sel_getJobUpdateStatus_includeThumbnail_reply_ argumentIndex:0 ofReply:1];
  char v6 = [v5 setByAddingObjectsFromArray:v4];
  [v0 setClasses:v6 forSelector:sel_getJobUpdateStatus_includeThumbnail_reply_ argumentIndex:0 ofReply:1];

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  void v13[3] = objc_opt_class();
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  uint64_t v8 = [v0 classesForSelector:sel_browseInfoForPrinter_timeout_reply_ argumentIndex:0 ofReply:0];
  uint64_t v9 = [v8 setByAddingObjectsFromArray:v7];
  [v0 setClasses:v9 forSelector:sel_browseInfoForPrinter_timeout_reply_ argumentIndex:0 ofReply:0];

  uint64_t v10 = [v0 classesForSelector:sel_browseInfoForPrinter_timeout_reply_ argumentIndex:0 ofReply:1];
  int v11 = [v10 setByAddingObjectsFromArray:v7];
  [v0 setClasses:v11 forSelector:sel_browseInfoForPrinter_timeout_reply_ argumentIndex:0 ofReply:1];

  int8x8_t v12 = (void *)getPrintdRPCProtocolInterface(void)::sInterface;
  getPrintdRPCProtocolInterface(void)::sInterface = (uint64_t)v0;
}

void sub_22EA64634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getPrintdRPCBrowseProtocolInterface(void)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E26B330];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  unsigned int v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:3];
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    char v5 = objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_browserAdded_removed_, v2, 0, v8, v9);
    char v6 = [v5 setByAddingObjectsFromArray:v1];
    [v0 setClasses:v6 forSelector:sel_browserAdded_removed_ argumentIndex:v2 ofReply:0];

    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);

  return v0;
}

void sub_22EA64830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA64A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA64DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA64ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA652C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA653B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA65FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66284(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_22EA66354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_22EA66620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

const char *ippTagString(int a1)
{
  if (a1 > 74) {
    return "UNKNOWN";
  }
  uint64_t v2 = ipp_tag_names[a1];
  return (const char *)[(__CFString *)v2 UTF8String];
}

void sub_22EA6672C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA667E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA66918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66D90(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 16) = v2;
  objc_exception_rethrow();
}

void sub_22EA66DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA66EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA66F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6704C(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA67204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  int v19 = v18;

  _Unwind_Resume(a1);
}

void sub_22EA672A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA67354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA67480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA674F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA67650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

unint64_t _read_cb(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 8) length];
  if (v6 - *(void *)a1 < a3) {
    a3 = v6 - *(void *)a1;
  }
  objc_msgSend(*(id *)(a1 + 8), "getBytes:range:", a2);
  *(void *)a1 += a3;
  return a3;
}

void sub_22EA67774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _write_cb(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  return a3;
}

void sub_22EA67824(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA67888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA678E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA679BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA67A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA67B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA67CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA67DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA67E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA67F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6809C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA68220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA68358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_22EA68578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

__CFString *ipp_lang_code(NSString *a1)
{
  uint64_t v1 = a1;
  if ([(NSString *)v1 caseInsensitiveCompare:@"c"])
  {
    char v2 = [(NSString *)v1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  }
  else
  {
    char v2 = @"en";
  }

  return v2;
}

void sub_22EA68644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA686D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c24_ZTS18ipp_value_string_t(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  id result = *(id *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c24_ZTS18ipp_value_string_t(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
}

void sub_22EA68838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA688E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA689E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA68B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA68C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA68CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA68DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA68ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA68F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA69098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
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

void sub_22EA691CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA69314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6950C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_22EA695EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA696BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA69978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA69BF8(_Unwind_Exception *a1)
{
  uint64_t v8 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA69F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ippAddSeparator(PK_ipp_t *a1)
{
  char v2 = a1;
  if (v2) {
    id v1 = [(PK_ipp_t *)v2 addNewEmptyAttribute:0 groupTag:0 valueTag:0];
  }
}

void sub_22EA6A0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ippGetIXCollection(PK_ipp_attribute_t *a1, unsigned int a2)
{
  char v3 = a1;
  char v4 = v3;
  if (!v3)
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  int v5 = [(PK_ipp_attribute_t *)v3 value_tag];
  uint64_t v6 = 0;
  if ((a2 & 0x80000000) == 0 && v5 == 52)
  {
    uint64_t v7 = a2;
    if ([(PK_ipp_attribute_t *)v4 num_values] > a2)
    {
      uint64_t v8 = [(PK_ipp_attribute_t *)v4 values];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
      uint64_t v6 = [v9 collection];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

void sub_22EA6A168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ippGetIXInteger(PK_ipp_attribute_t *a1, unsigned int a2)
{
  char v3 = a1;
  char v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if ([(PK_ipp_attribute_t *)v3 value_tag] == 33)
  {
    if ((a2 & 0x80000000) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    int v5 = [(PK_ipp_attribute_t *)v4 value_tag];
    uint64_t v6 = 0;
    if ((a2 & 0x80000000) != 0 || v5 != 35) {
      goto LABEL_10;
    }
  }
  uint64_t v7 = a2;
  if ([(PK_ipp_attribute_t *)v4 num_values] <= a2)
  {
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [(PK_ipp_attribute_t *)v4 values];
  uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
  uint64_t v6 = [v9 integer];

LABEL_10:
  return v6;
}

void sub_22EA6A248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ippGetIXRange(PK_ipp_attribute_t *a1, unsigned int a2, int *a3)
{
  int v5 = a1;
  uint64_t v6 = v5;
  if (v5
    && (int v7 = [(PK_ipp_attribute_t *)v5 value_tag], (a2 & 0x80000000) == 0)
    && v7 == 51
    && [(PK_ipp_attribute_t *)v6 num_values] > a2)
  {
    if (a3)
    {
      uint64_t v8 = [(PK_ipp_attribute_t *)v6 values];
      uint64_t v9 = [v8 objectAtIndexedSubscript:a2];
      uint64_t v10 = v9;
      if (v9)
      {
        [v9 range];
        int v11 = v18;
      }
      else
      {
        int v11 = 0;
        unsigned int v17 = 0;
      }
      *a3 = v11;
    }
    unsigned int v13 = [(PK_ipp_attribute_t *)v6 values];
    uint64_t v14 = [v13 objectAtIndexedSubscript:a2];
    int v15 = v14;
    if (v14)
    {
      [v14 range];
      uint64_t v12 = v17;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a3) {
      *a3 = 0;
    }
  }

  return v12;
}

void sub_22EA6A390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ippGetIXString(PK_ipp_attribute_t *a1, unsigned int a2)
{
  char v3 = a1;
  char v4 = v3;
  int v5 = 0;
  if (v3 && (a2 & 0x80000000) == 0)
  {
    uint64_t v6 = a2;
    if ([(PK_ipp_attribute_t *)v3 num_values] > a2
      && ((int v7 = [(PK_ipp_attribute_t *)v4 value_tag], (v7 - 55) > 0xFFFFFFFD)
       || (v7 - 74) >= 0xFFFFFFF7))
    {
      uint64_t v8 = [(PK_ipp_attribute_t *)v4 values];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v6];
      uint64_t v10 = (void *)[v9 string];
      int v5 = v11;
    }
    else
    {
      int v5 = 0;
    }
  }

  return v5;
}

void sub_22EA6A49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ippCoerceAttrToValue(PK_ipp_t *a1, PK_ipp_attribute_t *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = a2;
  int v7 = v6;
  BOOL v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_11;
  }
  if ([(PK_ipp_attribute_t *)v6 value_tag] == a3)
  {
LABEL_10:
    BOOL v8 = 1;
    goto LABEL_11;
  }
  int v9 = [(PK_ipp_attribute_t *)v7 value_tag];
  BOOL v8 = 0;
  if ((int)a3 > 50)
  {
    if ((int)a3 <= 53)
    {
      if (a3 == 51)
      {
        if (v9 == 33)
        {
          uint64_t v28 = [(PK_ipp_attribute_t *)v7 num_values];
          if (v28)
          {
            uint64_t v29 = 0;
            do
            {
              uint64_t v30 = [(PK_ipp_attribute_t *)v7 values];
              int v31 = [v30 objectAtIndexedSubscript:v29];
              int v32 = [v31 integer];

              unint64_t v33 = [(PK_ipp_attribute_t *)v7 values];
              uint64_t v34 = [v33 objectAtIndexedSubscript:v29];
              v52[0] = v32;
              v52[1] = v32;
              [v34 setRange:v52];

              ++v29;
            }
            while (v28 != v29);
          }
          [(PK_ipp_attribute_t *)v7 setValueTag:51];
          goto LABEL_10;
        }
        goto LABEL_41;
      }
      if (a3 != 53) {
        goto LABEL_11;
      }
      if (v9 != 65) {
        goto LABEL_41;
      }
    }
    else
    {
      if (a3 != 54)
      {
        if (a3 != 66)
        {
          if (a3 == 68) {
            BOOL v8 = v9 == 66 || v9 == 54;
          }
          goto LABEL_11;
        }
        if (v9 == 68)
        {
          a3 = 66;
LABEL_9:
          [(PK_ipp_attribute_t *)v7 setValueTag:a3];
          goto LABEL_10;
        }
LABEL_41:
        BOOL v8 = 0;
        goto LABEL_11;
      }
      if (v9 != 66 && v9 != 68) {
        goto LABEL_41;
      }
    }
    unsigned int v13 = [(PK_ipp_t *)v5 attrs];
    if ((unint64_t)[v13 count] >= 3)
    {
      uint64_t v14 = [(PK_ipp_t *)v5 attrs];
      int v15 = [v14 objectAtIndexedSubscript:1];
      size_t v16 = [v15 name];
      if ([v16 compare:@"attributes-natural-language"])
      {
        unsigned int v17 = [(PK_ipp_t *)v5 attrs];
        int v18 = v5;
        int v19 = [v17 objectAtIndexedSubscript:0];
        if (objc_msgSend(v19, "value_tag") == 72)
        {
          BOOL v20 = [(PK_ipp_t *)v18 attrs];
          unint64_t v21 = [v20 objectAtIndexedSubscript:0];
          uint64_t v50 = objc_msgSend(v21, "num_values");

          int v5 = v18;
          if (v50)
          {
            BOOL v22 = [(PK_ipp_t *)v18 attrs];
            uint64_t v23 = [v22 objectAtIndexedSubscript:1];

            if (objc_msgSend(v23, "num_values"))
            {
              unint64_t v24 = [v23 values];
              uint64_t v25 = [v24 objectAtIndexedSubscript:0];
              char v26 = (void *)[v25 string];
              unint64_t v51 = v27;
            }
            else
            {
              unint64_t v51 = 0;
            }
            goto LABEL_46;
          }
LABEL_45:
          uint64_t v35 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v23 = [v35 objectForKey:*MEMORY[0x263EFF508]];

          unint64_t v51 = ipp_lang_code((NSString *)v23);
LABEL_46:

          uint64_t v36 = [(PK_ipp_attribute_t *)v7 num_values];
          if (v36)
          {
            uint64_t v37 = 0;
            do
            {
              uint64_t v38 = [(PK_ipp_attribute_t *)v7 values];
              unint64_t v39 = [v38 objectAtIndexedSubscript:v37];
              uint64_t v40 = (void *)[v39 string];
              unint64_t v42 = v41;

              id v43 = v51;
              v44 = [(PK_ipp_attribute_t *)v7 values];
              int v45 = v5;
              uint64_t v46 = [v44 objectAtIndexedSubscript:v37];
              id v47 = v43;
              id v48 = v42;
              int v49 = v48;
              if (v46)
              {
                objc_msgSend(v46, "setString:", v51, v42);
              }
              else
              {
              }
              ++v37;
              int v5 = v45;
            }
            while (v36 != v37);
          }
          [(PK_ipp_attribute_t *)v7 setValueTag:54];

          goto LABEL_10;
        }

        int v5 = v18;
      }
    }
    goto LABEL_45;
  }
  if ((a3 - 16) < 4 || (a3 - 21) < 3)
  {
    if ([(PK_ipp_attribute_t *)v7 num_values])
    {
      uint64_t v10 = [(PK_ipp_attribute_t *)v7 values];
      [v10 removeAllObjects];
    }
    goto LABEL_9;
  }
LABEL_11:

  return v8;
}

void sub_22EA6A950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t validate_enum<ipp_tag_e,unsigned char>(int a1)
{
  uint64_t result = 0xFFFFFFFFLL;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      uint64_t result = 1;
      break;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 7;
      break;
    case 8:
      uint64_t result = 8;
      break;
    case 9:
      uint64_t result = 9;
      break;
    case 10:
      uint64_t result = 10;
      break;
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 20:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
      return result;
    case 16:
      uint64_t result = 16;
      break;
    case 17:
      uint64_t result = 17;
      break;
    case 18:
      uint64_t result = 18;
      break;
    case 19:
      uint64_t result = 19;
      break;
    case 21:
      uint64_t result = 21;
      break;
    case 22:
      uint64_t result = 22;
      break;
    case 23:
      uint64_t result = 23;
      break;
    case 33:
      uint64_t result = 33;
      break;
    case 34:
      uint64_t result = 34;
      break;
    case 35:
      uint64_t result = 35;
      break;
    case 48:
      uint64_t result = 48;
      break;
    case 49:
      uint64_t result = 49;
      break;
    case 50:
      uint64_t result = 50;
      break;
    case 51:
      uint64_t result = 51;
      break;
    case 52:
      uint64_t result = 52;
      break;
    case 53:
      uint64_t result = 53;
      break;
    case 54:
      uint64_t result = 54;
      break;
    case 55:
      uint64_t result = 55;
      break;
    case 65:
      uint64_t result = 65;
      break;
    case 66:
      uint64_t result = 66;
      break;
    case 67:
      uint64_t result = 67;
      break;
    case 68:
      uint64_t result = 68;
      break;
    case 69:
      uint64_t result = 69;
      break;
    case 70:
      uint64_t result = 70;
      break;
    case 71:
      uint64_t result = 71;
      break;
    case 72:
      uint64_t result = 72;
      break;
    case 73:
      uint64_t result = 73;
      break;
    case 74:
      uint64_t result = 74;
      break;
    default:
      if (a1 == 127) {
        uint64_t result = 127;
      }
      else {
        uint64_t result = 0xFFFFFFFFLL;
      }
      break;
  }
  return result;
}

uint64_t validate_enum<ipp_res_e,unsigned char>(int a1)
{
  if (a1 == 3) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t validate_enum<ipp_orient_e,unsigned char>(char a1)
{
  if (((a1 - 4) & 0xFC) != 0) {
    return 3;
  }
  else {
    return (a1 - 4) + 4;
  }
}

void ___ZL17pretty_data_linesP6NSData_block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"  %@", a2];
  objc_msgSend(v2, "addObject:");
}

void sub_22EA6ADFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id PKLocalizedString(NSString *a1, const char *a2)
{
  char v2 = a1;
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
  char v4 = [v3 localizedStringForKey:v2 value:v2 table:@"Localizable"];

  return v4;
}

void sub_22EA6AE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void urfDelete(void *a1)
{
  if (a1)
  {
    char v2 = (void *)a1[7];
    if (v2) {
      free(v2);
    }
    id v3 = (void *)a1[12];
    if (v3) {
      free(v3);
    }
    char v4 = (void *)a1[15];
    if (v4) {
      free(v4);
    }
    free(a1);
  }
}

uint64_t urfErrorString(uint64_t result)
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

void *urfNew(uint64_t a1, uint64_t a2)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x90uLL, 0x10D00403A2F05C1uLL);
  if (result)
  {
    *uint64_t result = a1;
    result[1] = a2;
  }
  return result;
}

uint64_t _urfSetLineSize(uint64_t a1, unsigned __int8 *a2)
{
  long long v3 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 40) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 24) = v3;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 112) = 0;
  switch(a2[1])
  {
    case 0u:
    case 4u:
      unsigned int v4 = *a2;
      if (v4 == 8 || v4 == 16) {
        goto LABEL_19;
      }
      goto LABEL_32;
    case 1u:
      unsigned int v4 = *a2;
      if (v4 != 24) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 2u:
      unsigned int v4 = *a2;
      if (v4 != 32) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 3u:
    case 5u:
      unsigned int v4 = *a2;
      if (v4 == 24) {
        goto LABEL_19;
      }
      goto LABEL_18;
    case 6u:
      unsigned int v4 = *a2;
      if (v4 != 32 && v4 != 64) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 7u:
      unsigned int v4 = *a2;
LABEL_18:
      if (v4 == 48) {
        goto LABEL_19;
      }
      goto LABEL_32;
    case 8u:
      unsigned int v4 = *a2;
      if (v4 != 16)
      {
LABEL_32:
        uint64_t result = 0;
        int v7 = "Bad bitsPerPixel in page header";
        goto LABEL_33;
      }
LABEL_19:
      if (a2[2] >= 4u)
      {
        uint64_t result = 0;
        int v7 = "Bad duplexMode in page header";
LABEL_33:
        *(void *)(a1 + 112) = v7;
        return result;
      }
      unsigned int v8 = a2[3];
      if (v8 > 5 || v8 - 1 <= 1)
      {
        uint64_t result = 0;
        int v7 = "Bad printQuality in page header";
        goto LABEL_33;
      }
      unsigned int v10 = *((_DWORD *)a2 + 3);
      if (!v10)
      {
        uint64_t result = 0;
        int v7 = "Bad width in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 4))
      {
        uint64_t result = 0;
        int v7 = "Bad height in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 5))
      {
        uint64_t result = 0;
        int v7 = "Bad resolution in page header";
        goto LABEL_33;
      }
      unsigned int v11 = v4 >> 3;
      unint64_t v12 = v10 * (unint64_t)v11;
      unsigned int v13 = *(void **)(a1 + 56);
      if (v13) {
        uint64_t v14 = malloc_type_realloc(v13, v10 * (unint64_t)v11, 0x9092D853uLL);
      }
      else {
        uint64_t v14 = malloc_type_malloc(v10 * (unint64_t)v11, 0x62CE6984uLL);
      }
      if (!v14)
      {
        free(*(void **)(a1 + 56));
        uint64_t result = 0;
        *(void *)(a1 + 56) = 0;
        *(void *)(a1 + 72) = 0;
        int v7 = "Unable to allocate memory for line buffer";
        goto LABEL_33;
      }
      *(void *)(a1 + 56) = v14;
      *(void *)(a1 + 72) = v12;
      return 1;
    default:
      uint64_t result = 0;
      int v7 = "Bad colorSpace in page header";
      goto LABEL_33;
  }
}

CGFloat _lite_page_transform@<D0>(CGRect a1@<0:D0, 8:D1, 16:D2, 24:D3>, unint64_t a2@<X0>, unint64_t a3@<X1>, int a4@<W2>, int a5@<W3>, int a6@<W4>, uint64_t a7@<X8>)
{
  CGFloat height = a1.size.height;
  CGFloat width = a1.size.width;
  CGFloat y = a1.origin.y;
  CGFloat x = a1.origin.x;
  if (a6) {
    unint64_t v16 = a3;
  }
  else {
    unint64_t v16 = a2;
  }
  double v17 = (double)v16 * -0.5;
  if (a6) {
    unint64_t v18 = a2;
  }
  else {
    unint64_t v18 = a3;
  }
  CGAffineTransformMakeTranslation(&v47, v17, (double)v18 * -0.5);
  switch(a4)
  {
    case 2:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v19 = -1.0;
      CGFloat v20 = 1.0;
      goto LABEL_12;
    case 3:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v20 = -1.0;
      CGFloat v21 = 0.0;
      CGFloat v22 = 0.0;
      CGFloat v19 = -1.0;
      break;
    case 4:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v19 = 1.0;
      CGFloat v20 = -1.0;
LABEL_12:
      CGFloat v21 = 0.0;
      CGFloat v22 = 0.0;
      break;
    case 5:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v20 = 0.0;
      CGFloat v21 = -1.0;
      CGFloat v22 = -1.0;
      goto LABEL_17;
    case 6:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v20 = 0.0;
      CGFloat v22 = 1.0;
      CGFloat v21 = -1.0;
      goto LABEL_17;
    case 7:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v20 = 0.0;
      CGFloat v21 = 1.0;
      CGFloat v22 = 1.0;
      goto LABEL_17;
    case 8:
      v48.CGFloat a = 0.0;
      v48.CGFloat b = 0.0;
      CGFloat v20 = 0.0;
      CGFloat v22 = -1.0;
      CGFloat v21 = 1.0;
LABEL_17:
      CGFloat v19 = 0.0;
      break;
    default:
      CGFloat v19 = *MEMORY[0x263F000D0];
      CGFloat v21 = *(double *)(MEMORY[0x263F000D0] + 8);
      CGFloat v22 = *(double *)(MEMORY[0x263F000D0] + 16);
      CGFloat v20 = *(double *)(MEMORY[0x263F000D0] + 24);
      *(_OWORD *)&v48.CGFloat a = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      break;
  }
  long long v49 = *(_OWORD *)&v48.a;
  if (a5 == 1 || a5 == -1)
  {
    memset(&v48, 0, sizeof(v48));
    CGAffineTransformMakeRotation(&v48, (double)a5 * 3.14159265 * 0.5);
    t1.CGFloat a = v19;
    t1.CGFloat b = v21;
    t1.CGFloat c = v22;
    t1.CGFloat d = v20;
    *(_OWORD *)&t1.tCGFloat x = v49;
    CGAffineTransform t2 = v48;
    CGAffineTransformConcat(&v46, &t1, &t2);
    CGFloat c = v46.c;
    CGFloat a = v46.a;
    CGFloat b = v46.b;
    CGFloat d = v46.d;
    long long v49 = *(_OWORD *)&v46.tx;
  }
  else
  {
    CGFloat b = v21;
    CGFloat d = v20;
    CGFloat a = v19;
    CGFloat c = v22;
  }
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v26 = CGRectGetWidth(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double v27 = CGRectGetHeight(v53);
  double v28 = v26 / (double)a2;
  if (v28 >= v27 / (double)a3) {
    double v28 = v27 / (double)a3;
  }
  CGAffineTransformMakeScale(&v48, v28, v28);
  CGAffineTransformMakeTranslation(&v46, MinX + v26 * 0.5, MinY + v27 * 0.5);
  CGAffineTransform v43 = v47;
  v42.CGFloat a = a;
  v42.CGFloat b = b;
  v42.CGFloat c = c;
  v42.CGFloat d = d;
  *(_OWORD *)&v42.tCGFloat x = v49;
  CGAffineTransformConcat((CGAffineTransform *)a7, &v43, &v42);
  long long v29 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v40.CGFloat a = *(_OWORD *)a7;
  *(_OWORD *)&v40.CGFloat c = v29;
  *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)(a7 + 32);
  CGAffineTransform v39 = v48;
  CGAffineTransformConcat(&v41, &v40, &v39);
  long long v30 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v30;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  long long v31 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v38.CGFloat a = *(_OWORD *)a7;
  *(_OWORD *)&v38.CGFloat c = v31;
  *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)(a7 + 32);
  CGAffineTransform v37 = v46;
  CGAffineTransformConcat(&v41, &v38, &v37);
  long long v32 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v32;
  CGFloat result = v41.tx;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  return result;
}

void _liteDrawImageToSheet(CGContext *a1, CGImageRef image, int a3, CGSize a4, CGRect a5)
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.height;
  double v10 = a4.width;
  unsigned int v14 = CGImageGetWidth(image);
  unsigned int v15 = CGImageGetHeight(image);
  int v16 = v15;
  if (x <= v10 - (x + width)) {
    double v17 = v10 - (x + width);
  }
  else {
    double v17 = x;
  }
  if (v9 - (y + height) <= y) {
    double v18 = y;
  }
  else {
    double v18 = v9 - (y + height);
  }
  if (a3 <= 4) {
    unint64_t v19 = v14;
  }
  else {
    unint64_t v19 = v15;
  }
  if (a3 <= 4) {
    unint64_t v20 = v15;
  }
  else {
    unint64_t v20 = v14;
  }
  double v21 = (double)(int)v20;
  double v22 = (double)(int)v19;
  BOOL v23 = v10 > v9 && v22 < v21;
  if (v23 || v10 < v9 && v22 > v21)
  {
    double v24 = v17;
    double v25 = v10;
  }
  else
  {
    double v24 = v18;
    double v18 = v17;
    double v25 = v9;
    double v9 = v10;
  }
  if (v18 == 0.0 && v24 == 0.0 && v20 < 2 * v19 && 2 * v20 > v19 && (v9 >= v22 ? (BOOL v26 = v25 < v21) : (BOOL v26 = 1), !v26))
  {
    int v27 = 1;
    double v28 = v9;
    double v29 = v25;
  }
  else
  {
    int v27 = 0;
    double v28 = v9 - v18 - v18;
    double v29 = v25 - v24 - v24;
  }
  double v30 = v28 / v22;
  double v31 = v29 / v21;
  if (v30 <= v31) {
    double v32 = v31;
  }
  else {
    double v32 = v30;
  }
  if (v30 >= v31) {
    double v30 = v31;
  }
  if (v27) {
    double v30 = v32;
  }
  CGFloat v33 = (v9 - v22 * v30) * 0.5;
  CGFloat v34 = (v25 - v21 * v30) * 0.5;
  CGFloat v35 = v30 * v22;
  CGFloat v36 = v30 * v21;
  CGContextSaveGState(a1);
  v38.origin.double x = v33;
  v38.origin.double y = v34;
  v38.size.double width = v35;
  v38.size.double height = v36;
  _lite_page_transform(v38, v19, v20, a3, 0, a3 > 4, (uint64_t)&v37);
  CGContextConcatCTM(a1, &v37);
  v39.size.double width = (double)(int)v14;
  v39.size.double height = (double)v16;
  v39.origin.double x = 0.0;
  v39.origin.double y = 0.0;
  CGContextDrawImage(a1, v39, image);
  CGContextRestoreGState(a1);
}

uint64_t liteFigureOutDriverSetupInfo(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *(void **)(a2 + 2040);
  *(void *)(a2 + 2040) = @"application/octet-stream";

  CGAffineTransform v47 = v5;
  if (!v5)
  {
    BOOL v10 = 0;
    BOOL v8 = 0;
    unsigned int v12 = 0;
LABEL_31:
    int v25 = 0;
    *(void *)(a2 + 2020) = 0x2580000012CLL;
    *(unsigned char *)(a2 + 120) |= 3u;
    *(int32x4_t *)(a2 + 972) = vdupq_n_s32(0x27Bu);
    *(_OWORD *)(a2 + 988) = xmmword_22EAA18E0;
    *(_DWORD *)(a2 + 128) = 1;
    *(_OWORD *)(a2 + 1988) = xmmword_22EAA18F0;
LABEL_32:
    *(void *)a1 |= *(void *)(a2 + 120);
    objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 2040));
    uint64_t v26 = objc_opt_new();
    int v27 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v26;

    [*(id *)(a1 + 8) addObject:@"application/octet-stream"];
    [*(id *)(a1 + 8) addObjectsFromArray:*(void *)(a1 + 16)];
    int v28 = v25 ^ 1;
    if ((([*(id *)(a1 + 8) containsObject:@"application/pdf"] | v25 ^ 1 | v8) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"application/pdf"];
    }
    if (((objc_msgSend(*(id *)(a1 + 8), "containsObject:", @"image/jpeg", v42, v43) | v28 | v10) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"image/jpeg"];
    }
    if ((([*(id *)(a1 + 8) containsObject:@"image/png"] | v28 | v12) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"image/png"];
    }
    if ((v25 & ([*(id *)(a1 + 8) containsObject:@"image/urf"] ^ 1)) == 1) {
      [*(id *)(a1 + 8) addObject:@"image/urf"];
    }
    int v29 = *(_DWORD *)(a2 + 1508);
    if (v29 >= 21590)
    {
      int v30 = *(_DWORD *)(a2 + 1512);
      if (v30 < 27940)
      {
LABEL_44:
        if (v30 >= 15240) {
          *(_DWORD *)(a2 + 988) = 5;
        }
      }
    }
    else if (v29 >= 10160)
    {
      int v30 = *(_DWORD *)(a2 + 1512);
      goto LABEL_44;
    }
    if (*(int *)(a2 + 140) < 1)
    {
LABEL_68:
      if (*(_DWORD *)(a2 + 548))
      {
        CGFloat v36 = objc_opt_new();
        if (*(int *)(a2 + 548) >= 1)
        {
          uint64_t v37 = 0;
          do
          {
            CGRect v38 = [NSString stringWithUTF8String:MediaSourceStrings[*(unsigned int *)(a2 + 752 + 4 * v37)]];
            [v36 addObject:v38];

            ++v37;
          }
          while (v37 < *(int *)(a2 + 548));
        }
        CGRect v39 = *(NSObject **)(a1 + 24);
        *(void *)(a1 + 24) = v36;
      }
      else
      {
        CGRect v39 = *(NSObject **)(a1 + 24);
        *(void *)(a1 + 24) = &unk_26E264F70;
      }
      uint64_t v40 = 1;
      goto LABEL_75;
    }
    uint64_t v31 = 0;
    while (1)
    {
      int v32 = *(_DWORD *)(a2 + 144 + 4 * v31);
      if ((v32 & 0xFFFFFFFC) == 0x14 || ((v32 - 28) >= 8 ? (BOOL v33 = v32 == 4) : (BOOL v33 = 1), v33))
      {
        char v34 = 64;
      }
      else if (v32 != 5 && (v32 - 70) >= 0x14)
      {
        if (v32 == 6)
        {
          char v34 = 16;
        }
        else
        {
          if (v32 != 7 && (v32 - 50) > 3) {
            goto LABEL_56;
          }
          char v34 = 8;
        }
      }
      else
      {
        char v34 = 32;
      }
      *(unsigned char *)a1 |= v34;
LABEL_56:
      if (++v31 >= *(int *)(a2 + 140)) {
        goto LABEL_68;
      }
    }
  }
  int v7 = [v5 objectForKey:@"TEST-NO-PDF"];
  BOOL v8 = v7 != 0;

  double v9 = [v5 objectForKey:@"TEST-NO-JPEG"];
  BOOL v10 = v9 != 0;

  unsigned int v11 = [v5 objectForKey:@"TEST-NO-PNG"];
  unsigned int v12 = v11 != 0;

  unsigned int v13 = [v5 objectForKeyedSubscript:@"COMMAND SET"];
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [v5 objectForKeyedSubscript:@"CMD"];
    if (!v14)
    {
      CGAffineTransform v46 = [MEMORY[0x263EFF8C0] array];
      id v14 = 0;
      uint64_t v15 = [v46 count];
      goto LABEL_7;
    }
  }
  CGAffineTransform v46 = [v14 componentsSeparatedByString:@","];

  uint64_t v15 = [v46 count];
LABEL_7:
  if (!v15)
  {

    goto LABEL_31;
  }
  uint64_t v16 = objc_opt_new();
  BOOL v44 = v8;
  double v17 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v16;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v18 = v46;
  int v45 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
  unint64_t v42 = __PAIR64__(v12, v10);
  uint64_t v43 = a2;
  unint64_t v20 = 0;
  if (!v19) {
    goto LABEL_27;
  }
  uint64_t v21 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v50 != v21) {
        objc_enumerationMutation(v18);
      }
      BOOL v23 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", @"URF", v42, v43))
      {
        unint64_t v20 = liteInitURF;
        [*(id *)(a1 + 16) addObject:@"image/urf"];
        continue;
      }
      if (![v23 caseInsensitiveCompare:@"PDF"])
      {
        double v24 = @"application/pdf";
LABEL_24:
        [*(id *)(a1 + 16) addObject:v24];
        continue;
      }
      if (![v23 caseInsensitiveCompare:@"JPEG"])
      {
        double v24 = @"image/jpeg";
        goto LABEL_24;
      }
      if (![v23 caseInsensitiveCompare:@"PNG"])
      {
        double v24 = @"image/png";
        goto LABEL_24;
      }
      if ([v23 caseInsensitiveCompare:@"application/octet-stream"]
        && [v23 containsString:@"/"])
      {
        [*(id *)(a1 + 16) addObject:v23];
      }
    }
    uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
  }
  while (v19);
LABEL_27:

  a2 = v43;
  BOOL v10 = v42;
  unsigned int v12 = HIDWORD(v42);
  BOOL v8 = v44;

  if (!v20) {
    goto LABEL_31;
  }
  if (((unsigned int (*)(void *, uint64_t, uint64_t))v20)(v47, v43, 1))
  {
    int v25 = 1;
    goto LABEL_32;
  }
  CGRect v39 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22EA54000, v39, OS_LOG_TYPE_ERROR, "Driver initialization failed.", buf, 2u);
  }
  uint64_t v40 = 0;
LABEL_75:

  return v40;
}

void sub_22EA6BD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void XDriverSetupInfo::~XDriverSetupInfo(id *this)
{
}

char **pwgMediaForPWG(void *a1, char *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v3 = a1;
  PWGMediCGFloat a = 0;
  if (v3)
  {
    if (a2)
    {
      bzero(a2, 0x90uLL);
      PWGMediCGFloat a = MediaArray::findPWGMedia(v3, v5);
      if (!PWGMedia)
      {
        uint64_t v6 = (char *)[(MediaArray *)v3 UTF8String];
        int v7 = strchr(v6, 95);
        if (!v7) {
          goto LABEL_21;
        }
        BOOL v8 = strchr(v7 + 1, 95);
        if (!v8) {
          goto LABEL_21;
        }
        double v9 = v8;
        BOOL v10 = v8 + 1;
        unsigned int v11 = strchr(v8 + 1, 95);
        if (!v11) {
          unsigned int v11 = (char *)&v9[strlen(v9)];
        }
        unsigned int v12 = v11 - 2;
        uint64_t v21 = v10;
        if (v11 - 2 >= v10 && (!strcmp(v11 - 2, "in") || !strncmp(v12, "in_", 3uLL)))
        {
          int v14 = 0;
          int v13 = 2540;
        }
        else
        {
          int v13 = 100;
          int v14 = 1;
        }
        int v15 = pwg_scan_measurement(v10, &v21, v13, 1);
        if (v21 && *v21 == 120 && (int v16 = v15, v17 = pwg_scan_measurement(v21 + 1, &v21, v13, 1), v21))
        {
          int v18 = v17;
          if (!strncmp(v6, "disc_", 5uLL)) {
            int v19 = v18;
          }
          else {
            int v19 = v16;
          }
          *((_DWORD *)a2 + 6) = v19;
          *((_DWORD *)a2 + 7) = v18;
          strlcpy(a2 + 32, v6, 0x41uLL);
          *(void *)a2 = a2 + 32;
          if (v14)
          {
            pwg_format_millimeters(__str, 0x20uLL, v19);
            pwg_format_millimeters(v22, 0x20uLL, v18);
            snprintf(a2 + 97, 0x29uLL, "%sx%smm");
          }
          else
          {
            pwg_format_inches(__str, 0x20uLL, v19);
            pwg_format_inches(v22, 0x20uLL, v18);
            snprintf(a2 + 97, 0x29uLL, "%sx%s");
          }
          *((void *)a2 + 2) = a2 + 97;
          PWGMediCGFloat a = (char **)a2;
        }
        else
        {
LABEL_21:
          PWGMediCGFloat a = 0;
        }
      }
    }
  }

  return PWGMedia;
}

void sub_22EA6C0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **MediaArray::findPWGMedia(MediaArray *this, NSString *a2)
{
  char v2 = this;
  MediCGFloat a = MediaArray::findMedia((const char *)[(MediaArray *)v2 UTF8String], (uint64_t)&__block_literal_global_537);

  return Media;
}

void sub_22EA6C124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t pwg_scan_measurement(char *a1, char **a2, int a3, int a4)
{
  int v4 = *a1;
  if ((v4 - 48) > 9)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    int v6 = *a1;
    do
    {
      int v7 = *++a1;
      int v4 = v7;
      int v5 = v6 + 10 * v5 - 48;
      int v6 = v7;
    }
    while ((v7 - 48) < 0xA);
  }
  if (v4 == 46)
  {
    int v8 = 10 * a3 * a4;
    double v9 = a1 + 1;
    if (v8 < 2)
    {
      int v10 = 0;
      int i = 1;
    }
    else
    {
      int v10 = 0;
      for (int i = 1; i < v8; i *= 10)
      {
        int v12 = *(unsigned __int8 *)v9;
        if ((v12 - 48) > 9) {
          break;
        }
        int v10 = v12 + 10 * v10 - 48;
        ++v9;
      }
    }
    a1 = (char *)(v9 - 1);
    do
      int v13 = *++a1;
    while ((v13 - 48) < 0xA);
  }
  else
  {
    int v10 = 0;
    int i = 1;
  }
  if (a2) {
    *a2 = a1;
  }
  return (v10 * a3 / a4 / i + v5 * a3 / a4);
}

char *pwg_format_millimeters(char *__str, size_t a2, int a3)
{
  if (a3 % 100)
  {
    if ((a3 % 100) == 10
                                      * ((((103 * (a3 % 100)) & 0x8000) != 0)
                                       + ((103 * (a3 % 100)) >> 10)))
      snprintf(__str, a2, "%d.%01d");
    else {
      snprintf(__str, a2, "%d.%02d");
    }
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char *pwg_format_inches(char *__str, size_t a2, int a3)
{
  int v4 = (1000 * a3 + 1270) / 2540 % 1000;
  if (v4)
  {
    if ((__int16)v4 % 10)
    {
      snprintf(__str, a2, "%d.%03d");
    }
    else if ((__int16)v4 % 100)
    {
      snprintf(__str, a2, "%d.%02d");
    }
    else
    {
      snprintf(__str, a2, "%d.%01d");
    }
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char *pwgMediaForSize(const char *a1, uint64_t a2, char *a3)
{
  CGFloat result = 0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)a1 >= 1 && (int)a2 >= 1 && a3)
  {
    bzero(a3, 0x90uLL);
    CGFloat result = 0;
    int v9 = 999;
    unsigned int v10 = 177;
    int v11 = 999;
    int v12 = &cups_pwg_media;
    do
    {
      int v13 = *((_DWORD *)v12 + 7);
      int v14 = *((_DWORD *)v12 + 6) - a1;
      if (v14) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = v13 == a2;
      }
      if (v15) {
        return (char *)v12;
      }
      int v16 = v13 - a2;
      if (v16 < 0) {
        int v16 = -v16;
      }
      if (v14 < 0) {
        int v14 = a1 - *((_DWORD *)v12 + 6);
      }
      if (v14 <= 0x32 && v16 <= 0x32 && v14 <= v11 && v16 <= v9)
      {
        CGFloat result = (char *)v12;
        int v11 = v14;
        int v9 = v16;
      }
      v12 += 4;
      --v10;
    }
    while (v10 > 1);
    if (!result)
    {
      pwgFormatSizeName(a3 + 32, "custom", 0, a1, a2, v7, v8);
      *(void *)a3 = a3 + 32;
      *((_DWORD *)a3 + 6) = a1;
      *((_DWORD *)a3 + 7) = a2;
      if ((a2 % 0x27B) | (a1 % 0x27B))
      {
        pwg_format_millimeters(__str, 0x20uLL, (int)a1);
        pwg_format_millimeters(v21, 0x20uLL, a2);
        snprintf(a3 + 97, 0x29uLL, "%sx%smm");
      }
      else
      {
        pwg_format_inches(__str, 0x20uLL, (int)a1);
        pwg_format_inches(v21, 0x20uLL, a2);
        snprintf(a3 + 97, 0x29uLL, "%sx%s");
      }
      *((void *)a3 + 2) = a3 + 97;
      return a3;
    }
  }
  return result;
}

char **MediaArray::findMedia(const char *a1, uint64_t a2)
{
  int v4 = &cups_pwg_media;
  while (1)
  {
    int v5 = (const char *)(*(uint64_t (**)(uint64_t, char **))(a2 + 16))(a2, v4);
    if (v5)
    {
      if (!strcmp(v5, a1)) {
        break;
      }
    }
    v4 += 4;
    if (v4 >= &__block_descriptor_48_ea8_32bs_e5_v8__0ls32l8) {
      return 0;
    }
  }
  return v4;
}

void pwgFormatSizeName(char *a1, char *__s1, const char *a3, const char *a4, uint64_t a5, int a6, const char *a7)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!a1 || (uint64_t v8 = (uint64_t)a4, *a1 = 0, ((a5 | a4) & 0x80000000) != 0))
  {
    BOOL v15 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      return;
    }
    *(_DWORD *)buf = 136315650;
    int v32 = "pwgFormatSizeName";
    __int16 v33 = 1024;
    int v34 = 1280;
    __int16 v35 = 2080;
    CGFloat v36 = "Invalid media name arguments.";
    int v16 = buf;
LABEL_17:
    _os_log_impl(&dword_22EA54000, v15, OS_LOG_TYPE_ERROR, "%s: setting ipp status %d error message %s", v16, 0x1Cu);
    goto LABEL_18;
  }
  unsigned int v10 = a3;
  int v11 = __s1;
  if (a3)
  {
    int v12 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      uint64_t v13 = 1;
      while ((v12 - 97) < 0x1A || (v12 - 48) < 0xA || (v12 - 45) < 2)
      {
        int v12 = a3[v13++];
        if (!v12) {
          goto LABEL_10;
        }
      }
      BOOL v15 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v25 = 136315650;
      uint64_t v26 = "pwgFormatSizeName";
      __int16 v27 = 1024;
      int v28 = 1280;
      __int16 v29 = 2080;
      int v30 = "Invalid media name arguments.";
      int v16 = (uint8_t *)&v25;
      goto LABEL_17;
    }
LABEL_10:
    if (__s1) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v10 = (const char *)buf;
    if (__s1)
    {
LABEL_11:
      if (!strcmp(__s1, "disc")) {
        uint64_t v8 = 4000;
      }
      else {
        uint64_t v8 = v8;
      }
      int v14 = v11;
      goto LABEL_21;
    }
  }
  int v14 = "oe";
  int v11 = "om";
LABEL_21:
  if ((v8 % 0x27B) | (a5 % 0x27B)) {
    int v17 = "mm";
  }
  else {
    int v17 = "in";
  }
  int v18 = *(unsigned __int16 *)v17;
  int v19 = *((unsigned __int8 *)v17 + 2);
  int v20 = v18 ^ 0x6E69 | v19;
  if (v20) {
    uint64_t v21 = pwg_format_millimeters;
  }
  else {
    uint64_t v21 = pwg_format_inches;
  }
  if (!v20) {
    int v11 = v14;
  }
  v21((char *)buf, 28, v8);
  size_t v22 = strlen((const char *)buf);
  buf[v22] = 120;
  uint64_t v23 = (const char *)&buf[v22 + 1];
  v21((char *)v23, 27 - v22, a5);
  uint64_t v24 = (char *)&v23[strlen(v23)];
  *(_WORD *)uint64_t v24 = v18;
  v24[2] = v19;
  snprintf(a1, 0x41uLL, "%s_%s_%s", v11, v10, (const char *)buf);
}

uint64_t ___ZN10MediaArray12findPWGMediaEPKc_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

void sub_22EA6C9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6CA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA6CC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6CCF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6D130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6D42C(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

PKNotification *makeNotification<PKNotification>(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  unsigned int v10 = [[PKNotification alloc] initWithNotifier:v7 notifyKind:a4];
  [(PKNotification *)v10 setHeaderString:v8];
  [(PKNotification *)v10 setMessageString:v9];

  return v10;
}

void sub_22EA6D4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6D63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6D704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6D7C0(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22EA6D950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6DA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_22EA6DC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _notifyCallout(__CFUserNotification *a1, uint64_t a2)
{
  id v4 = +[PKNotifier sharedNotifier];
  [v4 notification:a1 completedWithResult:a2];
}

void sub_22EA6DCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA6DD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

uint64_t PKCancelAlert(NSString *a1)
{
  pthread_mutex_lock(&pk_dialog_mutex);
  if (pk_dialog_ref)
  {
    CFUserNotificationCancel((CFUserNotificationRef)pk_dialog_ref);
    pk_dialog_ref = 0;
    pk_dialog_level = 0;
  }

  return pthread_mutex_unlock(&pk_dialog_mutex);
}

BOOL liteInitURF(void *a1, uint64_t a2, int a3)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v104 = 0;
  id v100 = a1;
  id v4 = [v100 objectForKeyedSubscript:@"URF"];
  int v5 = v4;
  if (v4)
  {
    int v6 = [v4 componentsSeparatedByString:@","];
  }
  else
  {
    int v6 = 0;
  }

  for (unint64_t i = 0; [v6 count] > i; ++i)
  {
    id v8 = [v6 objectAtIndexedSubscript:i];
    id v9 = (const char *)[v8 UTF8String];

    if (!strncmp(v9, "CP", 2uLL))
    {
      *(_DWORD *)(a2 + 128) = atoi(v9 + 2) > 1;
    }
    else if (!strncmp(v9, "DM", 2uLL))
    {
      int v12 = v9[2];
      if (v12 >= 49)
      {
        *(unsigned char *)(a2 + 120) |= 1u;
        LOBYTE(v12) = v9[2];
      }
      if (v12 == 51)
      {
        *(_DWORD *)(a2 + 136) = 2;
      }
      else if (v12 == 50)
      {
        *(_DWORD *)(a2 + 136) = 1;
      }
    }
    else if (!strncmp(v9, "FN", 2uLL))
    {
      *(_DWORD *)(a2 + 140) = urf_parse_values(v9 + 2, (int *)(a2 + 144), 101);
    }
    else if (!strncmp(v9, "IS", 2uLL))
    {
      *(_DWORD *)(a2 + 548) = urf_parse_values(v9 + 2, (int *)(a2 + 752), 50);
    }
    else if (!strncmp(v9, "MT", 2uLL))
    {
      *(_DWORD *)(a2 + 1524) = urf_parse_values(v9 + 2, (int *)(a2 + 1528), 14);
    }
    else if (!strncmp(v9, "OB", 2uLL))
    {
      *(_DWORD *)(a2 + 1584) = urf_parse_values(v9 + 2, (int *)(a2 + 1788), 50);
    }
    else if (!strncmp(v9, "RS", 2uLL))
    {
      *(_DWORD *)(a2 + 2000) = urf_parse_values(v9 + 2, (int *)(a2 + 2020), 4);
    }
    else if (!strcmp(v9, "SRGB24"))
    {
      *(unsigned char *)(a2 + 120) |= 2u;
    }
    else if (!strncmp(v9, "ADOBERGB", 8uLL))
    {
      int v13 = urf_parse_values(v9 + 8, v105, 4);
      if (v13 < 1)
      {
        BOOL v16 = 0;
      }
      else
      {
        unint64_t v14 = 0;
        do
          int v15 = v105[v14++];
        while (v14 < v13 && v15 != 48);
        BOOL v16 = v15 == 48;
      }
      *(_DWORD *)(a2 + 2008) = v16;
    }
    else if (!strncmp(v9, "P3E48", 5uLL))
    {
      *(_DWORD *)(a2 + 2012) = 1;
    }
    else if (!strncmp(v9, "WE16", 4uLL))
    {
      *(_DWORD *)(a2 + 2016) = 1;
    }
    else if (*v9 == 86)
    {
      int v10 = urf_parse_values(v9 + 1, v105, 2);
      if (v10 >= 1)
      {
        BOOL v11 = v10 != 1;
        if (v105[0] != 1) {
          BOOL v11 = 0;
        }
        if (v105[1] <= 1) {
          BOOL v11 = 0;
        }
        if (v105[0] > 1 || v11) {
          *(_DWORD *)(a2 + 2004) = 1;
        }
      }
    }
  }
  uint64_t v17 = *(unsigned int *)(a2 + 548);
  if ((int)v17 >= 2)
  {
    *(_DWORD *)(a2 + 548) = v17 + 1;
    *(_DWORD *)(a2 + 4 * v17 + 752) = 0;
  }
  uint64_t v18 = *(unsigned int *)(a2 + 1524);
  if ((int)v18 >= 2)
  {
    *(_DWORD *)(a2 + 1524) = v18 + 1;
    *(_DWORD *)(a2 + 4 * v18 + 1528) = 0;
  }
  uint64_t v19 = *(unsigned int *)(a2 + 1584);
  if ((int)v19 >= 2)
  {
    *(_DWORD *)(a2 + 1584) = v19 + 1;
    *(_DWORD *)(a2 + 4 * v19 + 1788) = 0;
  }
  for (unint64_t j = 0; [v6 count] > j; ++j)
  {
    id v21 = [v6 objectAtIndexedSubscript:j];
    size_t v22 = (const char *)[v21 UTF8String];

    if (!strncmp(v22, "OFU", 3uLL))
    {
      int v23 = urf_parse_values(v22 + 3, v105, 50);
      if (v23 != 1 || v105[0])
      {
        if (v23 >= 1)
        {
          uint64_t v25 = v23;
          uint64_t v26 = v105;
          do
          {
            uint64_t v28 = *v26++;
            uint64_t v27 = v28;
            if ((int)v28 <= 49) {
              *(_DWORD *)(a2 + 4 * v27 + 1588) = 1;
            }
            --v25;
          }
          while (v25);
        }
      }
      else
      {
        uint64_t v24 = *(unsigned int *)(a2 + 1584);
        if ((int)v24 >= 1) {
          memset_pattern16((void *)(a2 + 1588), &unk_22EAA1A00, 4 * v24);
        }
      }
    }
  }
  int v29 = *(_DWORD *)(a2 + 2000);
  if (!v29)
  {
    int v29 = 1;
    *(_DWORD *)(a2 + 2000) = 1;
    *(_DWORD *)(a2 + 2020) = 300;
  }
  *(_DWORD *)(a2 + 1996) = *(_DWORD *)(a2 + 4 * (v29 / 2) + 2020);
  unint64_t v30 = *(unsigned int *)(a2 + 1524);
  if ((int)v30 < 1)
  {
    BOOL v31 = 1;
  }
  else if (*(_DWORD *)(a2 + 1528) == 3)
  {
    BOOL v31 = 0;
  }
  else
  {
    uint64_t v32 = 0;
    do
    {
      uint64_t v33 = v32;
      if (v30 - 1 == v32) {
        break;
      }
      int v34 = *(_DWORD *)(a2 + 1532 + 4 * v32++);
    }
    while (v34 != 3);
    BOOL v31 = v33 + 1 >= v30;
  }
  id v35 = [v100 objectForKeyedSubscript:@"MAXSIZE"];
  CGFloat v36 = (const char *)[v35 UTF8String];

  if (!v36) {
    goto LABEL_83;
  }
  LOBYTE(v102) = 0;
  if (sscanf(v36, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3) {
    goto LABEL_83;
  }
  if (!(v102 ^ 0x6E69 | v103))
  {
    double v94 = *((float *)&v104 + 1);
    double v95 = 2540.0;
LABEL_174:
    int v38 = (int)(v94 * v95);
    int v37 = (int)(*(float *)&v104 * v95);
    goto LABEL_84;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    double v94 = *((float *)&v104 + 1);
    double v95 = 100.0;
    goto LABEL_174;
  }
LABEL_83:
  int v37 = 35560;
  int v38 = 21590;
LABEL_84:
  id v39 = [v100 objectForKeyedSubscript:@"MINSIZE"];
  uint64_t v40 = (const char *)[v39 UTF8String];

  if (!v40) {
    goto LABEL_88;
  }
  LOBYTE(v102) = 0;
  if (sscanf(v40, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3) {
    goto LABEL_88;
  }
  if (!(v102 ^ 0x6E69 | v103))
  {
    double v96 = *((float *)&v104 + 1);
    double v97 = 2540.0;
LABEL_176:
    int v42 = (int)(v96 * v97);
    int v41 = (int)(*(float *)&v104 * v97);
    goto LABEL_89;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    double v96 = *((float *)&v104 + 1);
    double v97 = 100.0;
    goto LABEL_176;
  }
LABEL_88:
  int v41 = 27940;
  int v42 = 21000;
LABEL_89:
  int v43 = 0;
  BOOL v44 = &dword_22EAA190C;
  do
  {
    int v45 = *(v44 - 1);
    if (v45 >= v42 && v45 <= v38 && *v44 >= v41 && *v44 <= v37 && ((v43 - 19) >= 5 || !v31))
    {
      uint64_t v49 = *(int *)(a2 + 992);
      *(_DWORD *)(a2 + 992) = v49 + 1;
      *(_DWORD *)(a2 + 4 * v49 + 996) = v43;
    }
    ++v43;
    v44 += 2;
  }
  while (v43 != 24);
  unint64_t v50 = *(unsigned int *)(a2 + 548);
  if ((int)v50 < 1)
  {
    BOOL v55 = 0;
  }
  else
  {
    int v51 = *(_DWORD *)(a2 + 752);
    unsigned int v52 = v51 - 9;
    unsigned int v53 = v51 - 40;
    if (v52 >= 2 && v53 >= 0xA)
    {
      uint64_t v56 = 0;
      do
      {
        uint64_t v57 = v56;
        if (v50 - 1 == v56) {
          break;
        }
        int v58 = *(_DWORD *)(a2 + 756 + 4 * v56);
        unsigned int v59 = v58 - 9;
        unsigned int v60 = v58 - 40;
        uint64_t v56 = v57 + 1;
      }
      while (v59 >= 2 && v60 > 9);
      BOOL v55 = v57 + 1 < v50;
    }
    else
    {
      BOOL v55 = 1;
    }
  }
  if (v42 != v38 || v41 != v37)
  {
    uint64_t v62 = *(int *)(a2 + 992);
    *(_DWORD *)(a2 + 992) = v62 + 1;
    *(_DWORD *)(a2 + 4 * v62 + 996) = 24;
    *(_DWORD *)(a2 + 1520) = v41;
    *(_DWORD *)(a2 + 1512) = v37;
    if (v55)
    {
      for (uint64_t k = 4u; k != -1; --k)
      {
        int v64 = RollWidths[k];
        if (v64 >= v42) {
          *(_DWORD *)(a2 + 1516) = v64;
        }
      }
      for (uint64_t m = 0; m != 5; ++m)
      {
        int v66 = RollWidths[m];
        if (v66 <= v38) {
          *(_DWORD *)(a2 + 1508) = v66;
        }
      }
    }
    else
    {
      *(_DWORD *)(a2 + 1516) = v42;
      *(_DWORD *)(a2 + 1508) = v38;
    }
  }
  id v67 = [v100 objectForKeyedSubscript:@"TEST-BORDERLESS"];
  v68 = (const char *)[v67 UTF8String];

  if (v68) {
    int v69 = atoi(v68);
  }
  else {
    int v69 = 0;
  }
  *(_DWORD *)(a2 + 952) = v69;
  id v70 = [v100 objectForKeyedSubscript:@"TEST-MARGINS"];
  v71 = (const char *)[v70 UTF8String];

  if (!v71)
  {
    *(_DWORD *)(a2 + 972) = 635;
    *(int32x2_t *)(a2 + 976) = vdup_n_s32(0x27Bu);
    v72 = (_DWORD *)(a2 + 984);
    goto LABEL_140;
  }
  v72 = (_DWORD *)(a2 + 984);
  if (sscanf(v71, "%d%d%d%d", a2 + 972, a2 + 976, a2 + 980, a2 + 984) != 4)
  {
    *(int32x2_t *)(a2 + 972) = vdup_n_s32(0x27Bu);
    *(_DWORD *)(a2 + 980) = 635;
LABEL_140:
    _DWORD *v72 = 635;
  }
  id v73 = [v100 objectForKeyedSubscript:@"TEST-DUPLEX"];
  int v74 = (const char *)[v73 UTF8String];

  if (v74 && sscanf(v74, "%d%d%d%d", a2 + 956, a2 + 960, a2 + 964, a2 + 968) != 4)
  {
    *(void *)(a2 + 956) = 0;
    *(void *)(a2 + 964) = 0;
  }
  unint64_t v75 = [v100 objectForKeyedSubscript:@"TEST-MEDIA-READY"];
  if (v75)
  {
    id v99 = v75;
    v76 = [v75 componentsSeparatedByString:@","];
    for (unint64_t n = 0; [v76 count] > n; ++n)
    {
      id v78 = [v76 objectAtIndexedSubscript:n];
      v79 = (const char *)[v78 UTF8String];

      LOBYTE(v102) = 0;
      v105[0] = 0;
      int v101 = 0;
      if (sscanf(v79, "%fx%f%2s IS%d MT%d", (char *)&v104 + 4, &v104, &v102, v105, &v101) != 5) {
        break;
      }
      double v80 = 2540.0;
      if (v102 ^ 0x6E69 | v103)
      {
        if (v102 ^ 0x6D6D | v103) {
          break;
        }
        double v80 = 100.0;
      }
      int v81 = 0;
      int v82 = (int)(v80 * *(float *)&v104);
      int v83 = (int)(v80 * *((float *)&v104 + 1));
      BOOL v84 = v83 <= v82;
      if (v83 >= v82) {
        int v85 = (int)(v80 * *(float *)&v104);
      }
      else {
        int v85 = (int)(v80 * *((float *)&v104 + 1));
      }
      if (v83 > v82) {
        int v82 = (int)(v80 * *((float *)&v104 + 1));
      }
      if (v84) {
        int v86 = 3;
      }
      else {
        int v86 = 4;
      }
      v87 = &dword_22EAA190C;
      do
      {
        if (*(v87 - 1) == v85 && *v87 == v82) {
          break;
        }
        ++v81;
        v87 += 2;
      }
      while (v81 != 24);
      uint64_t v88 = *(int *)(a2 + 1096);
      v89 = (_DWORD *)(a2 + 4 * v88);
      v89[275] = v81;
      v89[325] = v105[0];
      v89[300] = v101;
      v89[350] = v86;
      *(_DWORD *)(a2 + 1096) = v88 + 1;
      if (v81 == 24)
      {
        *(_DWORD *)(a2 + 1500) = v85;
        *(_DWORD *)(a2 + 1504) = v82;
      }
    }

    unint64_t v75 = v99;
  }

  *(_DWORD *)(a2 + 988) = 10;
  v90 = *(void **)(a2 + 2040);
  *(void *)(a2 + 2040) = @"image/urf";

  if (a3)
  {
    BOOL v91 = 1;
  }
  else
  {
    v92 = urfNew((uint64_t)urf_write_cb, a2);
    *(void *)(a2 + 2048) = v92;
    *(void *)(a2 + 2064) = urf_startjob;
    *(void *)(a2 + 2072) = urf_endjob;
    *(void *)(a2 + 2080) = urf_startpage;
    *(void *)(a2 + 2088) = urf_endpage;
    *(void *)(a2 + 2096) = urf_sendpixels;
    BOOL v91 = v92 != 0;
  }

  return v91;
}

void sub_22EA6EA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

uint64_t urf_parse_values(const char *a1, int *a2, int a3)
{
  unsigned __int8 v3 = *a1;
  if (!*a1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = MEMORY[0x263EF8318];
  do
  {
    if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x400) != 0)
    {
      int v6 = 0;
      do
      {
        int v6 = 10 * v6 + (char)v3 - 48;
        unsigned int v7 = *(unsigned __int8 *)++a1;
        unsigned __int8 v3 = v7;
      }
      while ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x400) != 0);
    }
    else
    {
      int v6 = 0;
    }
    uint64_t v8 = v4 + 1;
    a2[v4] = v6;
    if (*(unsigned __int8 *)a1 - 45 > 1 || v8 >= a3) {
      break;
    }
    int v10 = *(unsigned __int8 *)++a1;
    unsigned __int8 v3 = v10;
    ++v4;
  }
  while (v10);
  return v8;
}

uint64_t urf_write_cb(uint64_t a1)
{
  return (*(uint64_t (**)(void))a1)(*(void *)(a1 + 8));
}

uint64_t urf_startjob(uint64_t a1, int a2)
{
  return urfWriteStart(*(void *)(a1 + 2048), a2);
}

uint64_t urf_endjob(uint64_t a1)
{
  *(void *)(a1 + 2048) = 0;
  return 1;
}

uint64_t urf_startpage(uint64_t a1, uint64_t *a2)
{
  return urfWritePage(*(void *)(a1 + 2048), a2);
}

uint64_t urf_endpage()
{
  return 1;
}

uint64_t urf_sendpixels(uint64_t a1, void *a2, int a3)
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  unsigned int v5 = *(_DWORD *)(a1 + 84) & 0xFFFFFFFE;
  uint64_t v6 = *(void *)(a1 + 2048);
  uint64_t v7 = 1;
  if (v5 == 4)
  {
    int v8 = 1;
  }
  else
  {
    a3 = 1;
    int v8 = v3;
  }
  if (!urfWriteLine(v6, a2, a3, v8, 0))
  {
    id v9 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 2048);
      int v11 = *(_DWORD *)(v10 + 80);
      int v12 = *(_DWORD *)(v10 + 40);
      int v14 = 136316162;
      int v15 = "urf_sendpixels";
      __int16 v16 = 1024;
      int v17 = v3;
      __int16 v18 = 1024;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 2080;
      uint64_t v23 = urfErrorString(v10);
      _os_log_impl(&dword_22EA54000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to send %d lines at %d/%d: %s", (uint8_t *)&v14, 0x28u);
    }

    return 0;
  }
  return v7;
}

void sub_22EA6ED28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6EDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6EE0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6EF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6F9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6FAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6FC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6FD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA6FE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7001C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA70128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7026C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA70344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7042C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA70688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_22EA70750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA708E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_22EA70A9C(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22EA70C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA70EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA7108C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSArray * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__0;
  __int16 v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  int v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA711C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA715C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA71794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA71D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA72100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSArray<NSDictionary *> * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__0;
  __int16 v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  int v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA72280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA72310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void pk_iCloudPrintersChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"PRINTERTOOL_ICLOUDPRINTERS_CHANGED_NOTIFICATION" object:0];
}

void sub_22EA726F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA728E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA729A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA72DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA72E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA73018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA731B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSURL * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__0;
  __int16 v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  int v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA73304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void unxferSize(NSMutableDictionary *a1, NSDictionary *a2, NSString *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = [(NSDictionary *)v6 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:@"width"];
    [v10 doubleValue];
    uint64_t v12 = v11;
    int v13 = [v9 objectForKeyedSubscript:@"height"];
    [v13 doubleValue];
    uint64_t v16 = v12;
    uint64_t v17 = v14;

    int v15 = [MEMORY[0x263F08D40] valueWithBytes:&v16 objCType:"{CGSize=dd}"];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, v7, v16, v17);
  }
}

void sub_22EA73458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initMCProfileConnection(void)
{
  if (LoadManagedConfiguration(void)::loadPredicate != -1) {
    dispatch_once(&LoadManagedConfiguration(void)::loadPredicate, &__block_literal_global_107);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnectiounint64_t n = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)(void))MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction(void)
{
  return (id)classMCProfileConnection;
}

void ___ZL24LoadManagedConfigurationv_block_invoke()
{
  LoadManagedConfiguration(void)::frameworkLibrardouble y = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  if (!LoadManagedConfiguration(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
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

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_2649EDEE8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA73608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke_2;
  v8[3] = &unk_2649EDEE8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA73728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_2649EDF38;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA73848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

double PKDrawImageToSheet(CGContext *a1, CGImage *a2, unsigned int a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a3 > 7) {
    int v9 = 1;
  }
  else {
    int v9 = PKDrawImageToSheet::_UIImageOrientationToEXIFOrientationMapping[a3];
  }
  double v10 = a5 - (a7 + a9);
  _liteDrawImageToSheet(a1, a2, v9, *(CGSize *)&a4, *(CGRect *)&a6);
  return result;
}

void sub_22EA73964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA73A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA73A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA73B84(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22EA73C90(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA73D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA73DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA73F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<PKPrinter * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA74080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA741C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<PKJob * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA742F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA743BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA74504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA74648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA74810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA74974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA74A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA74C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  _Block_object_dispose(&a24, 8);
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

void sub_22EA74DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA74EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA74F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA75010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA75128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA751CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA752D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t withDebuggableSemaphore<PKStatus>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  uint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_22EA753C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22EA75430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7548C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA754E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7558C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA755E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA756D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA757C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA758C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7591C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA759D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA75DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void ___ZL27_initPrintKitNotificiationsv_block_invoke()
{
  notify_register_check("com.apple.printd.running", &printd_running_token);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_printkitJobListChanged, @"com.apple.printd.job-list", 0, (CFNotificationSuspensionBehavior)0);
  id v1 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_printkitProgress, @"com.apple.printd.job-progress", 0, (CFNotificationSuspensionBehavior)0);
}

void _printkitJobListChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"PKJobListNotification" object:0];
}

void sub_22EA765C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _printkitProgress(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"PKJobProgressNotification" object:0];
}

void sub_22EA76630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_2649EE410;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA766EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_2649EE438;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA7680C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke_2;
  v8[3] = &unk_2649EE460;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA7692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

intptr_t ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_22EA769B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76C80(_Unwind_Exception *a1)
{
  id v9 = v8;

  _Unwind_Resume(a1);
}

void sub_22EA76D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA76FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA77040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA770B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7712C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA77600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22)
{
  if (a21)
  {
  }
  _Unwind_Resume(a1);
}

id _PKLogCategory(void *a1)
{
  id v1 = a1;
  if (logInit(void)::onceToken != -1) {
    dispatch_once(&logInit(void)::onceToken, &__block_literal_global_7);
  }
  char v2 = [(id)pkLogCategories objectForKeyedSubscript:v1];
  if (!v2)
  {
    char v2 = (void *)&_os_log_internal;
    id v3 = &_os_log_internal;
  }

  return v2;
}

void sub_22EA7780C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void withDebuggableSemaphore(void *a1, void *a2, double a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  adCGFloat d = atomic_fetch_add(withDebuggableSemaphore(NSString *,double,void({block_pointer})(NSObject  {objcproto21OS_dispatch_semaphore}*))::sSequence, 1u);
  int v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109378;
    unsigned int v15 = add;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - begin", (uint8_t *)&v14, 0x12u);
  }

  id v9 = dispatch_semaphore_create(0);
  v6[2](v6, v9);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  uint64_t v12 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = "timed out";
    int v14 = 67109634;
    unsigned int v15 = add;
    if (!v11) {
      int v13 = "completed";
    }
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2082;
    int v19 = v13;
    _os_log_impl(&dword_22EA54000, v12, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - %{public}s", (uint8_t *)&v14, 0x1Cu);
  }
}

void sub_22EA779E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL7logInitv_block_invoke()
{
  v8[5] = *MEMORY[0x263EF8340];
  v7[0] = PKLogCategoryDefault[0];
  os_log_t v0 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryDefault[0] UTF8String]);
  v8[0] = v0;
  v7[1] = PKLogCategoryNetwork[0];
  os_log_t v1 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryNetwork[0] UTF8String]);
  v8[1] = v1;
  v7[2] = PKLogCategoryDiscovery[0];
  os_log_t v2 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryDiscovery[0] UTF8String]);
  v8[2] = v2;
  v7[3] = PKLogCategoryProgress[0];
  os_log_t v3 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryProgress[0] UTF8String]);
  v8[3] = v3;
  v7[4] = PKLogCategoryFramework;
  os_log_t v4 = os_log_create("com.apple.printing", (const char *)[PKLogCategoryFramework UTF8String]);
  void v8[4] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)pkLogCategories;
  pkLogCategories = v5;
}

void sub_22EA77B7C(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_22EA77C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA77CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA77D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKMediaName;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22EA77F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA7804C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7829C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA783CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7882C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA78B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA78DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA791A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_22EA79330(_Unwind_Exception *a1)
{
  os_log_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA79428(_Unwind_Exception *a1)
{
  os_log_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA794E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7956C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7968C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA798C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA79FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

PKPaper *genericSize(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  int v8 = [[PKPaper alloc] initWithWidth:a2 Height:a3 Left:635 Top:635 Right:635 Bottom:a4 localizedName:0 codeName:v7 mediaInfo:0];

  return v8;
}

void sub_22EA7A290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7A998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7AB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7AB58()
{
}

void sub_22EA7AB60()
{
}

void sub_22EA7AB68()
{
}

void sub_22EA7AB70()
{
}

void sub_22EA7AC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7AF9C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA7B0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7B180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7B22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7B314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7B3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7B84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_22EA7BAB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7BBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7C1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7C2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
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

void sub_22EA7C42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA7CDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7CF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_22EA7D090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7D13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7D224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7D2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7D70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7DC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7DC90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7DD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7E1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

id GetLocalizedNameForOption(NSString *a1, NSString *a2)
{
  os_log_t v3 = a1;
  os_log_t v4 = a2;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
  id v6 = [v5 localizedStringForKey:v3 value:v3 table:v4];

  return v6;
}

void sub_22EA7E34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7E3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7E538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA7E728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7E908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7EB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7EC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7EDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7EEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA7EFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7F2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7F3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7F5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA7F7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA7FB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA7FE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_22EA80118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id _cupsGet1284Values(NSString *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_log_t v1 = a1;
  os_log_t v2 = objc_opt_new();
  os_log_t v3 = v1;
  os_log_t v4 = [(NSString *)v3 UTF8String];
  char v5 = *v4;
  if (*v4)
  {
LABEL_2:
    while (v5 <= 0x20 && ((1 << v5) & 0x100003600) != 0 || v5 == 11)
    {
      char v6 = *++v4;
      char v5 = v6;
    }
    if (v5)
    {
      uint64_t v7 = 0;
      int v8 = v4 + 2;
      while (v5)
      {
        if (v5 == 58)
        {
          dispatch_time_t v10 = &v35[v7];
          if (v7 >= 1)
          {
            do
            {
              intptr_t v11 = v10 - 1;
              unsigned int v12 = (char)*(v10 - 1);
              BOOL v13 = v12 > 0x20;
              uint64_t v14 = (1 << v12) & 0x100003600;
              if ((v13 || v14 == 0) && *(v10 - 1) != 11) {
                break;
              }
              --v10;
            }
            while (v11 > v35);
          }
          *dispatch_time_t v10 = 0;
          do
          {
            unsigned int v17 = *++v4;
            __int16 v18 = v8;
            int v19 = v17;
            uint64_t v20 = (1 << v17) & 0x100003600;
            BOOL v22 = v17 <= 0x20 && v20 != 0 || v19 == 11;
            int v8 = v18 + 1;
          }
          while (v22);
          if (v19)
          {
            uint64_t v23 = 0;
            os_log_t v4 = v18;
            while ((_BYTE)v19)
            {
              if (v19 == 59)
              {
                uint64_t v25 = &v34[v23];
                if (v23 >= 1)
                {
                  do
                  {
                    uint64_t v26 = v25 - 1;
                    unsigned int v27 = (char)*(v25 - 1);
                    BOOL v13 = v27 > 0x20;
                    uint64_t v28 = (1 << v27) & 0x100003600;
                    if ((v13 || v28 == 0) && *(v25 - 1) != 11) {
                      break;
                    }
                    --v25;
                  }
                  while (v26 > v34);
                }
                unsigned char *v25 = 0;
                BOOL v31 = [NSString stringWithUTF8String:v34];
                uint64_t v32 = [NSString stringWithUTF8String:v35];
                [v2 setObject:v31 forKey:v32];

                char v5 = *v4;
                if (*v4) {
                  goto LABEL_2;
                }
                goto LABEL_50;
              }
              if (v23 <= 254) {
                v34[v23++] = v19;
              }
              char v24 = *v4++;
              LOBYTE(v19) = v24;
            }
          }
          break;
        }
        if (v7 <= 254) {
          v35[v7++] = v5;
        }
        char v9 = *++v4;
        char v5 = v9;
        ++v8;
      }
    }
  }
LABEL_50:

  return v2;
}

void sub_22EA803F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA80644(_Unwind_Exception *a1)
{
  XDriverSetupInfo::~XDriverSetupInfo((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_22EA80BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_22EA80C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA80E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA813B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA814A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA816E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA817A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA81904(_Unwind_Exception *a1)
{
  char v5 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA81B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA81BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA81E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA81FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  for (uint64_t i = 48; i != -16; i -= 16)
  _Unwind_Resume(a1);
}

void sub_22EA8214C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA82244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA82358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  for (uint64_t i = 48; i != -16; i -= 16)
  _Unwind_Resume(a1);
}

void sub_22EA8253C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8264C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL21convertIPPIntsToArrayP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  char v5 = *(void **)(a1 + 32);
  id v7 = v4;
  char v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "integer"));
  [v5 addObject:v6];
}

void sub_22EA8276C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL20ensureLowercasedKeysP12NSDictionaryIP8NSStringS1_E_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  char v5 = *(void **)(a1 + 32);
  char v6 = [a2 lowercaseString];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

void sub_22EA827FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA82878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA82B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA82C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA82D60(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA82DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA82ECC(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_22EA82FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA83188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8342C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8361C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA836FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA837BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA838D4(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_22EA839DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA83C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA840D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  for (uint64_t i = 16; i != -8; i -= 8)
  for (uint64_t j = 16; j != -8; j -= 8)

  _Unwind_Resume(a1);
}

void sub_22EA843C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8461C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA848A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA84B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA84D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA84EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA84F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA85074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA85190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA85298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA853A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA85418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8549C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8559C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA857C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA860BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_22EA86294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA86550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_22EA86684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void DescVisitor::visitProperties(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  _DescVisitor::_DescVisitor((_DescVisitor *)v6);
  char v5 = (void *)MEMORY[0x230FA8DB0]();
  [v3 visitProperties:v6];
  v4[2](v4, v6);
}

void sub_22EA86820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::~_DescVisitor(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x230FA8A40);
}

void EncodeVisitor::visitProperties(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v6 = &unk_26E24FC90;
  id v7 = v4;
  char v5 = (void *)MEMORY[0x230FA8DB0](v4);
  [v3 visitProperties:&v6];
}

void sub_22EA86910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _EncodeVisitor::~_EncodeVisitor(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x230FA8A40);
}

void DecodeVisitor::visitProperties(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v6 = &unk_26E24FBB8;
  id v7 = v4;
  char v5 = (void *)MEMORY[0x230FA8DB0](v4);
  [v3 visitProperties:&v6];
}

void sub_22EA869E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _DecodeVisitor::~_DecodeVisitor(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x230FA8A40);
}

void CompareVisitor::visitProperties(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  dispatch_time_t v10 = &unk_26E24FD68;
  id v12 = v8;
  char v11 = 1;
  char v9 = (void *)MEMORY[0x230FA8DB0]();
  [v5 visitProperties:&v10];
  v7[2](v7, &v10);
}

void sub_22EA86AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::~_CompareVisitor(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x230FA8A40);
}

void UserCodedSerializationVisitor::visitProperties(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v5 = &unk_26E24FE48;
  id v6 = (id)MEMORY[0x230FA9020](a2);
  id v4 = (void *)MEMORY[0x230FA8DB0]();
  [v3 visitProperties:&v5];
}

void sub_22EA86BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::~_UserCodedSerializationVisitor(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x230FA8A40);
}

void _DescVisitor::_DescVisitor(_DescVisitor *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26E24FAD0;
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)*((void *)this + 2);
  *((void *)this + 2) = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)*((void *)this + 1);
  *((void *)this + 1) = v4;
}

void sub_22EA86C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, BOOL *a3)
{
  if (*a3) {
    id v3 = @"true";
  }
  else {
    id v3 = @"false";
  }
  _DescVisitor::addNamed(this, a2, &v3->isa);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, unsigned int *a3)
{
  id v6 = a2;
  objc_msgSend(NSString, "stringWithFormat:", @"%d", *a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);
}

void sub_22EA86D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, uint64_t *a3)
{
  id v6 = a2;
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", *a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);
}

void sub_22EA86E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, unint64_t *a3)
{
  id v6 = a2;
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", *a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);
}

void sub_22EA86ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::visit(id *a1, void *a2, NSObject **a3)
{
  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

{
  NSString *v5;
  NSString *v6;
  uint64_t vars8;

  id v6 = a2;
  _DescVisitor::see(a1, *a3);
  id v5 = [*a3 debugDescription];
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);
}

void sub_22EA86F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA86FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA87094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8712C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA871C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8725C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA872F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8738C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA87424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA874BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA87554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA875EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA87684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8771C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA877B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8784C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA878E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _DescVisitor::lines(id *this)
{
  return this[2];
}

uint64_t _DescVisitor::seenClasses(id *this)
{
  return [this[1] allObjects];
}

void _DescVisitor::addNamed(_DescVisitor *this, NSString *a2, NSString *a3)
{
  id v3 = (void *)*((void *)this + 2);
  id v4 = [NSString stringWithFormat:@"%@: %@", a2, a3];
  objc_msgSend(v3, "addObject:");
}

void sub_22EA8797C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void _DescVisitor::see(id *this, NSObject *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    [this[1] addObject:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v3 allObjects];
      _DescVisitor::see((_DescVisitor *)this, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = ___ZN12_DescVisitor3seeEP8NSObject_block_invoke;
          v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
          void v9[4] = this;
          [v3 enumerateObjectsUsingBlock:v9];
        }
        goto LABEL_7;
      }
      id v6 = v3;
      id v7 = [v6 allKeys];
      _DescVisitor::see((_DescVisitor *)this, v7);

      id v8 = [v6 allValues];
      _DescVisitor::see((_DescVisitor *)this, v8);
    }
LABEL_7:
  }
}

void sub_22EA87B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN12_DescVisitor3seeEP8NSObject_block_invoke(uint64_t a1, NSObject *a2)
{
  return _DescVisitor::see(*(_DescVisitor **)(a1 + 32), a2);
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, BOOL *a3)
{
  return [this[1] encodeBool:*a3 forKey:a2];
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, unsigned int *a3)
{
  return [this[1] encodeInt:*a3 forKey:a2];
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, uint64_t *a3)
{
  return [this[1] encodeInteger:*a3 forKey:a2];
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, unint64_t *a3)
{
  return [this[1] encodeInteger:*a3 forKey:a2];
}

uint64_t _EncodeVisitor::visit(uint64_t a1, uint64_t a2, void *a3)
{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

{
  return [*(id *)(a1 + 8) encodeObject:*a3 forKey:a2];
}

void _EncodeVisitor::visit(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 8);
  id v6 = [*a3 allObjects];
  [v5 encodeObject:v6 forKey:v7];
}

void sub_22EA87CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, BOOL *a3)
{
  uint64_t result = [this[1] decodeBoolForKey:a2];
  *a3 = result;
  return result;
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, int *a3)
{
  uint64_t result = [this[1] decodeIntForKey:a2];
  *a3 = result;
  return result;
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, uint64_t *a3)
{
  uint64_t result = [this[1] decodeIntegerForKey:a2];
  *a3 = result;
  return result;
}

unint64_t _DecodeVisitor::visit(id *this, NSString *a2, unint64_t *a3)
{
  unint64_t result = [this[1] decodeIntegerForKey:a2];
  *a3 = result;
  return result;
}

void _DecodeVisitor::visit(uint64_t a1, void *a2, void **a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t vars8;

  char v9 = a2;
  uint64_t v5 = *(void **)(a1 + 8);
  id v6 = objc_opt_class();
  id v7 = [v5 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:v9];
  id v8 = *a3;
  *a3 = (void *)v7;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t vars8;

  char v9 = a2;
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v9];
  id v7 = [v5 setWithArray:v6];
  id v8 = *a3;
  *a3 = (void *)v7;
}

{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __int16 v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = (void *)MEMORY[0x263EFFA08];
  char v11 = objc_opt_class();
  id v12 = objc_opt_class();
  BOOL v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  unsigned int v15 = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:5];
  id v8 = objc_msgSend(v6, "setWithArray:", v7, v11, v12, v13, v14);

  char v9 = [*(id *)(a1 + 8) decodeObjectOfClasses:v8 forKey:v5];
  dispatch_time_t v10 = *a3;
  *a3 = (void *)v9;
}

{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t vars8;

  char v9 = a2;
  uint64_t v5 = *(void **)(a1 + 8);
  id v6 = objc_opt_class();
  id v7 = [v5 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:v9];
  id v8 = *a3;
  *a3 = (void *)v7;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeObjectOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 8) decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v7];
  id v6 = *a3;
  *a3 = (void *)v5;
}

void sub_22EA87EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA87F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA880A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8812C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA881D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8825C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA882E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8862C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA886B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA887D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8885C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA888E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, BOOL *a3)
{
  uint64_t v5 = a2;
  if (*((unsigned char *)this + 8))
  {
    int v6 = *a3;
    id v7 = v5;
    *((unsigned char *)this + 8) = v6 == _CompareVisitor::getProp<BOOL>((uint64_t)this, v5);
    uint64_t v5 = v7;
  }
}

void sub_22EA889B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, int *a3)
{
  uint64_t v5 = a2;
  if (*((unsigned char *)this + 8))
  {
    int v6 = *a3;
    id v7 = v5;
    *((unsigned char *)this + 8) = v6 == _CompareVisitor::getProp<int>((uint64_t)this, v5);
    uint64_t v5 = v7;
  }
}

void sub_22EA88A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, id *a3)
{
  uint64_t v5 = a2;
  if (*((unsigned char *)this + 8))
  {
    id v6 = *a3;
    id v7 = v5;
    *((unsigned char *)this + 8) = v6 == _CompareVisitor::getProp<long>((uint64_t)this, v5);
    uint64_t v5 = v7;
  }
}

{
  NSString *v5;
  id v6;
  NSString *v7;
  uint64_t vars8;

  uint64_t v5 = a2;
  if (*((unsigned char *)this + 8))
  {
    id v6 = *a3;
    id v7 = v5;
    *((unsigned char *)this + 8) = v6 == _CompareVisitor::getProp<unsigned long>((uint64_t)this, v5);
    uint64_t v5 = v7;
  }
}

void sub_22EA88AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA88B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *a1, NSString *a2, NSObject **a3)
{
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

uint64_t _CompareVisitor::wasEqual(_CompareVisitor *this)
{
  return *((unsigned __int8 *)this + 8);
}

id _CompareVisitor::getProp<BOOL>(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 16) NSSelectorFromString(v3)];

  return v4;
}

void sub_22EA88C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<int>(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 16) NSSelectorFromString(v3)];

  return v4;
}

void sub_22EA88C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<long>(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 16) NSSelectorFromString(v3)];

  return v4;
}

void sub_22EA88CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<unsigned long>(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 16) NSSelectorFromString(v3)];

  return v4;
}

void sub_22EA88D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CompareVisitor::equalObj(_CompareVisitor *this, NSString *a2, NSObject *a3)
{
  id v7 = a2;
  uint64_t v5 = a3;
  if (*((unsigned char *)this + 8))
  {
    id v6 = _CompareVisitor::getProp<NSObject * {__strong}>((uint64_t)this, v7);
    if (v6 != v5) {
      *((unsigned char *)this + 8) = [v5 isEqual:v6];
    }
  }
}

void sub_22EA88DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<NSObject * {__strong}>(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 16) NSSelectorFromString(v3)];

  return v4;
}

void sub_22EA88E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, BOOL *a3)
{
  uint64_t v5 = a2;
  id v6 = [NSNumber numberWithBool:*a3];
  (*(void (**)(void))(*((void *)this + 1) + 16))();
  *a3 = [v6 BOOLValue];
}

void sub_22EA88F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, unsigned int *a3)
{
  uint64_t v5 = a2;
  id v6 = [NSNumber numberWithInt:*a3];
  (*(void (**)(void))(*((void *)this + 1) + 16))();
  *a3 = [v6 intValue];
}

void sub_22EA88FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, uint64_t *a3)
{
  uint64_t v5 = a2;
  id v6 = [NSNumber numberWithInteger:*a3];
  (*(void (**)(void))(*((void *)this + 1) + 16))();
  *a3 = [v6 integerValue];
}

void sub_22EA890AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, unint64_t *a3)
{
  uint64_t v5 = a2;
  id v6 = [NSNumber numberWithUnsignedInteger:*a3];
  (*(void (**)(void))(*((void *)this + 1) + 16))();
  *a3 = [v6 unsignedIntegerValue];
}

void sub_22EA89164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _UserCodedSerializationVisitor::visit(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void _UserCodedSerializationVisitor::visit(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 8);
  id v6 = XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSValue * {__strong}>();
  id v7 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSValue * {__strong}>();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);
}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v4 = *(void *)(a1 + 8);
  uint64_t v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSNumber * {__strong}>();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSNumber * {__strong}>();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);
}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v4 = *(void *)(a1 + 8);
  uint64_t v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);
}

{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t vars8;

  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 8);
  id v6 = XUserCodedSerializationVisitor::makeToUserCoded<NSSet<NSString *> * {__strong}>();
  id v7 = XUserCodedSerializationVisitor::makeFromUserCoded<NSSet<NSString *> * {__strong}>();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);
}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v4 = *(void *)(a1 + 8);
  uint64_t v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSDictionary * {__strong}>();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSDictionary * {__strong}>();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);
}

{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t vars8;

  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 8);
  id v6 = XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKTray * {__strong}>();
  id v7 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKTray * {__strong}>();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);
}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t vars8;

  id v4 = *(void *)(a1 + 8);
  uint64_t v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);
}

void sub_22EA892F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA893B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8945C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8950C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA895C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA89708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA897C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return a2;
  }
  else {
    return &unk_26E264E50;
  }
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

__CFString *___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return (__CFString *)a2;
  }
  else {
    return &stru_26E251B90;
  }
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSURLEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 absoluteString];

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSURLEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [NSURL URLWithString:a2];

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSDataEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 base64EncodedStringWithOptions:0];

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSDataEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v2 options:0];

  return v3;
}

void sub_22EA8994C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSUUIDEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 UUIDString];

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSUUIDEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];

  return v3;
}

void sub_22EA899E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSDateEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = NSString;
  [v2 timeIntervalSince1970];
  uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"%f", v4);

  return v5;
}

void sub_22EA89A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSDateEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x263EFF910]);
  [v2 doubleValue];
  uint64_t v4 = objc_msgSend(v3, "initWithTimeIntervalSince1970:");

  return v4;
}

void sub_22EA89ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSValue * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_365;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE828;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA89CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA89D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6.locatiounint64_t n = [v2 rangeValue];
  id v3 = NSStringFromRange(v6);

  return v3;
}

void sub_22EA89D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSValue * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_368;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA89FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x263F08D40];
  NSRange v4 = NSRangeFromString(v2);
  id v5 = objc_msgSend(v3, "valueWithRange:", v4.location, v4.length);

  return v5;
}

void sub_22EA8A058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSNumber * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_331;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE850;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA8A1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA8A274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSNumber * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_335;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA8A48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_337;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE878;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA8A654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA8A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_342;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA8A8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeToUserCoded<NSSet<NSString *> * {__strong}>()
{
  os_log_t v0 = XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS7_Ev_block_invoke;
  v4[3] = &unk_2649EE9C8;
  id v5 = v0;
  id v1 = v0;
  id v2 = (void *)MEMORY[0x230FA9020](v4);

  return v2;
}

id XUserCodedSerializationVisitor::makeFromUserCoded<NSSet<NSString *> * {__strong}>()
{
  os_log_t v0 = XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS7_Ev_block_invoke;
  v4[3] = &unk_2649EE980;
  id v5 = v0;
  id v1 = v0;
  id v2 = (void *)MEMORY[0x230FA9020](v4);

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS7_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 allObjects];
  NSRange v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

void sub_22EA8AAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS7_Ev_block_invoke(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = [v1 setWithArray:v2];

  return v3;
}

void sub_22EA8AB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSDictionary * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_360;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE8A0;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA8AD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA8AD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSDictionary * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_362;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA8AFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userCodableDictionary];

  return v2;
}

PKPaper *___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP7PKPaperEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKPaper alloc] initWithUserCodableDictionary:v2];

  return v3;
}

void sub_22EA8B078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP11PKPaperListEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>();
  id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    NSRange v4 = [v2 papers];
    id v5 = ((void (**)(void, void *))v3)[2](v3, v4);
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

void sub_22EA8B11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_371;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE8C8;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA8B2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA8B348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP11PKPaperListEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>();
  id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  NSRange v4 = ((void (**)(void, id))v3)[2](v3, v2);
  id v5 = +[PKPaperList paperListWithPapers:v4];

  return v5;
}

void sub_22EA8B3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7PKPaperEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_374;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7PKPaperEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA8B608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP15PKPrintSettingsEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userCodableDictionary];

  return v2;
}

PKPrintSettings *___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP15PKPrintSettingsEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKPrintSettings alloc] initWithUserCodableDictionary:v2];

  return v3;
}

void sub_22EA8B6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKTray * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_2649EE958;
  id v3 = &__block_literal_global_386;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_2649EE8F0;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void sub_22EA8B864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  __int16 v16 = v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

void sub_22EA8B8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userCodableDictionary];

  return v2;
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKTray * {__strong}>()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP6PKTrayEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_2649EE980;
  id v3 = &__block_literal_global_388;
  os_log_t v0 = (void *)MEMORY[0x230FA9020](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP6PKTrayEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  NSRange v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_22EA8BB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

PKTray *___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6PKTrayEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKTray alloc] initWithUserCodableDictionary:v2];

  return v3;
}

void sub_22EA8BBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8BCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8BD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8BDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8BE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8BF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_22EA8C1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8C664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_22EA8C798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA8CFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8D194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8D340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8D64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8D7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8D9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA8DAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _visitHexLines(void *a1, int a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x4812000000;
  unint64_t v30 = __Block_byref_object_copy__5;
  BOOL v31 = __Block_byref_object_dispose__5;
  uint64_t v32 = &unk_22EAB63C5;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  int v35 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  if (a2)
  {
    uint64_t v7 = "/* ";
    id v8 = ",";
    id v9 = "0x";
    id v10 = " */";
  }
  else
  {
    id v10 = "";
    id v9 = "";
    id v8 = "";
    uint64_t v7 = "";
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke;
  v17[3] = &unk_2649EEA98;
  int v21 = v9;
  BOOL v22 = v8;
  int v19 = &v27;
  uint64_t v20 = v25;
  uint64_t v23 = v7;
  char v24 = v10;
  id v11 = v6;
  id v18 = v11;
  long long v12 = (void *)MEMORY[0x230FA9020](v17);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke_2;
  v14[3] = &unk_2649EEAC0;
  __int16 v16 = &v27;
  long long v13 = v12;
  id v15 = v13;
  [v5 enumerateByteRangesUsingBlock:v14];
  if ((v28[6] & 0x80000000) == 0) {
    v13[2](v13);
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
}

void sub_22EA8DFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__5(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u32[0] = a2[4].n128_u32[0];
  a1[3] = result;
  return result;
}

void ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  v21[0] = *MEMORY[0x263EF8340];
  id v3 = __str;
  NSRange v4 = v19;
  do
  {
    if ((v2 & 3) == 0) {
      *v3++ = 32;
    }
    if (v2 >= *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 48))
    {
      size_t v9 = strlen(*(const char **)(a1 + 56)) + 2;
      if (v9 + strlen(*(const char **)(a1 + 64)))
      {
        size_t v10 = 0;
        do
        {
          v3[v10++] = 32;
          size_t v11 = strlen(*(const char **)(a1 + 56));
        }
        while (v11 + strlen(*(const char **)(a1 + 64)) + 2 > v10);
        v3 += v10;
      }
      char *v4 = 32;
    }
    else
    {
      int v5 = snprintf(v3, (char *)v21 - v3, "%s", *(const char **)(a1 + 56));
      uint64_t v6 = *(char *)(*(void *)(*(void *)(a1 + 40) + 8) + v2 + 52);
      uint64_t v7 = &v3[v5];
      char *v7 = a0123456789abcd[*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + v2 + 52) >> 4];
      v7[1] = a0123456789abcd[v6 & 0xF];
      if (v6 < 0) {
        int v8 = __maskrune(v6, 0x40000uLL);
      }
      else {
        int v8 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60) & 0x40000;
      }
      long long v12 = v7 + 2;
      if (v8) {
        char v13 = v6;
      }
      else {
        char v13 = 46;
      }
      char *v4 = v13;
      id v3 = &v12[snprintf(v12, (char *)v21 - v12, "%s", *(const char **)(a1 + 64))];
    }
    ++v4;
    ++v2;
  }
  while (v2 != 16);
  char *v3 = 0;
  char *v4 = 0;
  long long v14 = NSString;
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  int v17 = *(_DWORD *)(v16 + 24);
  *(_DWORD *)(v16 + 24) = v17 + 1;
  id v18 = objc_msgSend(v14, "stringWithFormat:", @"%s%8.8x%s  %s  %s%s%s", v15, (16 * v17), *(void *)(a1 + 80), __str, v15, v19, *(void *)(a1 + 80));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = 0;
}

void sub_22EA8E27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke_2(uint64_t result, char *a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    NSRange v4 = a2;
    uint64_t v5 = result;
    unint64_t v6 = (unint64_t)&a2[a4];
    while (1)
    {
      uint64_t v7 = *(void *)(*(void *)(v5 + 40) + 8);
      uint64_t v8 = *(int *)(v7 + 48);
      if ((int)v8 > 15) {
        break;
      }
      char v9 = *v4++;
      *(_DWORD *)(v7 + 48) = v8 + 1;
      *(unsigned char *)(v7 + 48 + v8 + 4) = v9;
      if ((unint64_t)v4 >= v6)
      {
        if (*(int *)(*(void *)(*(void *)(v5 + 40) + 8) + 48) >= 16) {
          break;
        }
LABEL_7:
        if ((unint64_t)v4 >= v6) {
          return result;
        }
      }
    }
    __n128 result = (*(uint64_t (**)(void))(*(void *)(v5 + 32) + 16))();
    goto LABEL_7;
  }
  return result;
}

void sub_22EA8E3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8E57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8E624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8E810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8E938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA8EA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8EAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8EC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8EDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA8EF14(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA8EFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F6A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8F9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8FB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA8FCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSDictionary * {__strong}>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__365;
  uint64_t v16 = __Block_byref_object_dispose__366;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  size_t v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_22EA8FE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_22EA8FEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA8FF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA90038(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22EA900B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA901E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_22EA90528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_22EA906B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA907E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA90878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA90C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230FA9020](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_22EA90E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA91010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id PrinterStatusQueuePoll::requestedAttributess(PrinterStatusQueuePoll *this)
{
  void v3[4] = *MEMORY[0x263EF8340];
  v3[0] = IPPNomenclature::keyPrinterStateReasons;
  v3[1] = IPPNomenclature::keyMediaSourceSupported;
  v3[2] = IPPNomenclature::keyPrinterInputTray;
  v3[3] = IPPNomenclature::keyPrinterMandatoryJobAttributes;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:4];

  return v1;
}

void sub_22EA91584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA9177C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA91954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA919BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA91F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_22EA92650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void writeURLToPrinter(void *a1, void *a2, void *a3)
{
  id v9 = a1;
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:1 error:0];
    writeRequestDataToPrinter(v9, v8, v7);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void sub_22EA92824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA92910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA92C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t withDebuggableSemaphore<BOOL>(void *a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke;
  v9[3] = &unk_2649EDF10;
  id v10 = v5;
  size_t v11 = &v12;
  id v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  uint64_t v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_22EA92D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22EA92F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA93000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA930CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA9322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22EA93D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA93F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA94000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKCloudResolveContext;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t ___ZL30makeLocalizedNamesOfEmptyTraysPK22PrinterStatusQueuePoll_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEmpty];
}

uint64_t initPUTIsPersistentURL(const __CFURL *a1)
{
  if (LoadPhotoLibraryServicesCore(void)::loadPredicate != -1) {
    dispatch_once(&LoadPhotoLibraryServicesCore(void)::loadPredicate, &__block_literal_global_340);
  }
  uint64_t v2 = (uint64_t (*)(const __CFURL *))dlsym((void *)LoadPhotoLibraryServicesCore(void)::frameworkLibrary, "PUTIsPersistentURL");
  softLinkPUTIsPersistentURL = v2;

  return v2(a1);
}

void ___ZL28LoadPhotoLibraryServicesCorev_block_invoke()
{
  LoadPhotoLibraryServicesCore(void)::frameworkLibrardouble y = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PhotoLibraryServicesCore.framework/PhotoLibraryServicesCore", 2);
  if (!LoadPhotoLibraryServicesCore(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_0.isa);
  }
}

void ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init((Class)getPHFetchOptionsClass());
  [v2 setWantsIncrementalChangeDetails:0];
  PHAssetClass = (void *)getPHAssetClass();
  v12[0] = *(void *)(a1 + 32);
  NSRange v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v5 = [PHAssetClass fetchAssetsWithALAssetURLs:v4 options:v2];

  id v6 = [v5 firstObject];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    [v7 setVersion:0];
    [v7 setNetworkAccessAllowed:1];
    [v7 setDeliveryMode:1];
    [v7 setSynchronous:1];
    uint64_t v8 = [(id)getPHImageManagerClass() defaultManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke_2;
    v9[3] = &unk_2649EEE98;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v8 requestImageDataForAsset:v6 options:v7 resultHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22EA9435C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke_2(uint64_t a1, void *a2)
{
}

void writeRequestDataToPrinter(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke;
  v15[3] = &unk_2649EED88;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x230FA9020](v15);
  id v10 = v9;
  if (v6)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_356;
    v11[3] = &unk_2649EEF10;
    uint64_t v14 = v9;
    id v12 = v5;
    id v13 = v6;
    [v12 startRequestCompletionHandler:v11];
  }
  else
  {
    v9[2](v9, 0);
  }
}

void sub_22EA94538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

Class initPHFetchOptions(void)
{
  if (LoadPhotos(void)::loadPredicate != -1) {
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_348_0);
  }
  Class result = objc_getClass("PHFetchOptions");
  classPHFetchOptions = (uint64_t)result;
  getPHFetchOptionsClass = (uint64_t (*)(void))PHFetchOptionsFunction;
  return result;
}

id PHFetchOptionsFunction(void)
{
  return (id)classPHFetchOptions;
}

void ___ZL10LoadPhotosv_block_invoke()
{
  LoadPhotos(void)::frameworkLibrardouble y = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  if (!LoadPhotos(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_1.isa);
  }
}

Class initPHAsset(void)
{
  if (LoadPhotos(void)::loadPredicate != -1) {
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_348_0);
  }
  Class result = objc_getClass("PHAsset");
  classPHAsset = (uint64_t)result;
  getPHAssetClass = (uint64_t (*)(void))PHAssetFunction;
  return result;
}

id PHAssetFunction(void)
{
  return (id)classPHAsset;
}

Class initPHImageRequestOptions(void)
{
  if (LoadPhotos(void)::loadPredicate != -1) {
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_348_0);
  }
  Class result = objc_getClass("PHImageRequestOptions");
  classPHImageRequestOptions = (uint64_t)result;
  getPHImageRequestOptionsClass = (uint64_t (*)(void))PHImageRequestOptionsFunction;
  return result;
}

id PHImageRequestOptionsFunction(void)
{
  return (id)classPHImageRequestOptions;
}

Class initPHImageManager(void)
{
  if (LoadPhotos(void)::loadPredicate != -1) {
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_348_0);
  }
  Class result = objc_getClass("PHImageManager");
  classPHImageManager = (uint64_t)result;
  getPHImageManagerClass = (uint64_t (*)(void))PHImageManagerFunction;
  return result;
}

id PHImageManagerFunction(void)
{
  return (id)classPHImageManager;
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    NSRange v4 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_ERROR, "writeRequestDataToPrinter: failed to stream data", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22EA9481C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_356(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_2;
    v6[3] = &unk_2649EEEE8;
    id v8 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 32);
    [v3 writeRequestData:v4 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void sub_22EA94918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_3;
    v4[3] = &unk_2649EED88;
    id v2 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v2 finishRequest:0 completionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void sub_22EA949F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_DEFAULT, "writeRequestDataToPrinter: local job ID %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22EA94AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFURLRef jpegWithImageSource(CGImageSource *a1, int a2)
{
  uint64_t v4 = NSURL;
  int v5 = NSTemporaryDirectory();
  id v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  uint64_t v7 = [MEMORY[0x263F08AB0] processInfo];
  id v8 = [v7 globallyUniqueString];

  CFURLRef v9 = [v6 URLByAppendingPathComponent:v8];
  CFURLRef v10 = v9;
  if (v9)
  {
    id v11 = CGImageDestinationCreateWithURL(v9, @"public.jpeg", 1uLL, 0);
    if (v11)
    {
      id v12 = [MEMORY[0x263EFF9A0] dictionary];
      [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F0F028]];
      LODWORD(v13) = 1062836634;
      uint64_t v14 = [NSNumber numberWithFloat:v13];
      [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x263F0EFE8]];

      if (a2) {
        [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F0F008]];
      }
      CGImageDestinationAddImageFromSource(v11, a1, 0, (CFDictionaryRef)v12);
      CGImageDestinationFinalize(v11);
      CFRelease(v11);
    }
    else
    {
      char v15 = [MEMORY[0x263F08850] defaultManager];
      [v15 removeItemAtURL:v10 error:0];

      id v12 = v10;
      CFURLRef v10 = 0;
    }
  }

  return v10;
}

void sub_22EA94CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL34convertFromImageSourceAndWriteJPEGP17PKPrintJobRequestP13CGImageSourcebhU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 removeItemAtURL:*(void *)(a1 + 32) error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_22EA94D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL21convertToSharableJPEGP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 removeItemAtURL:*(void *)(a1 + 32) error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_22EA94E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__365(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__366(uint64_t a1)
{
}

void ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_2649EEF60;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA94F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke_2;
  v8[3] = &unk_2649EEF88;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_22EA95038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

intptr_t ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_22EA950F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA95314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  _Unwind_Resume(a1);
}

void sub_22EA95394()
{
}

void sub_22EA95564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA956D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA95800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA959EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA95A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA95D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA95DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA95EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA95F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA96038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA96114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA96894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA96920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA96B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA96C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)PKPrinterBrowser;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22EA96D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA96FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, void *a10, void *a11)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_22EA970F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA97320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  uint64_t v27 = v25;
  objc_destroyWeak(v27);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v26 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_22EA973F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA97490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA9790C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22EA97B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA97CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_22EA97D38()
{
}

void sub_22EA97DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA981C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_22EA9835C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _is_valid_color(const char *a1)
{
  if (*a1 != 35
    || a1[1] < 0
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 1) + 60) & 0x10000) == 0
    || a1[2] < 0
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 2) + 60) & 0x10000) == 0
    || a1[3] < 0
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 3) + 60) & 0x10000) == 0
    || a1[4] < 0
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 4) + 60) & 0x10000) == 0
    || a1[5] < 0
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 5) + 60) & 0x10000) == 0
    || a1[6] < 0)
  {
    return 0;
  }
  else
  {
    return HIWORD(*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)a1 + 6) + 60)) & 1;
  }
}

void sub_22EA98818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA98ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void sub_22EA98DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initUIColor(void)
{
  if (LoadUIKit(void)::loadPredicate != -1) {
    dispatch_once(&LoadUIKit(void)::loadPredicate, &__block_literal_global_11);
  }
  Class result = objc_getClass("UIColor");
  classUIColor = (uint64_t)result;
  getUIColorClass = (uint64_t (*)(void))UIColorFunction;
  return result;
}

id UIColorFunction(void)
{
  return (id)classUIColor;
}

void ___ZL9LoadUIKitv_block_invoke()
{
  LoadUIKit(void)::frameworkLibrardouble y = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit(void)::frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_2.isa);
  }
}

void ___ZL21makeUserCodableColorsP7NSArray_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 debugDescription];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_22EA98FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id SuppliesPoll::requestedAttributess(SuppliesPoll *this)
{
  v3[6] = *MEMORY[0x263EF8340];
  v3[0] = IPPNomenclature::keyMarkerColors;
  v3[1] = IPPNomenclature::keyMarkerHighLevels;
  v3[2] = IPPNomenclature::keyMarkerLevels;
  v3[3] = IPPNomenclature::keyMarkerLowLevels;
  void v3[4] = IPPNomenclature::keyMarkerNames;
  void v3[5] = IPPNomenclature::keyMarkerTypes;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:6];

  return v1;
}

id suppliesForPollResponse(void **a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v34 = Printd_Parameters::_get_MarkerNames(a1);
  id v2 = Printd_Parameters::_get_MarkerColors(a1);
  uint64_t v33 = Printd_Parameters::_get_MarkerTypes(a1);
  uint64_t v32 = Printd_Parameters::_get_MarkerLevels(a1);
  uint64_t v30 = Printd_Parameters::_get_MarkerHighLevels(a1);
  BOOL v31 = Printd_Parameters::_get_MarkerLowLevels(a1);
  if (!v34 || !v2 || !v33 || !v32)
  {
    if (!v34)
    {
      uint64_t v23 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22EA54000, v23, OS_LOG_TYPE_DEFAULT, "marker-names attribute is missing", buf, 2u);
      }
    }
    if (!v2)
    {
      char v24 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22EA54000, v24, OS_LOG_TYPE_DEFAULT, "marker-colors attribute is missing", buf, 2u);
      }
    }
    if (!v33)
    {
      uint64_t v25 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22EA54000, v25, OS_LOG_TYPE_DEFAULT, "marker-types attribute is missing", buf, 2u);
      }
    }
    if (v32)
    {
      BOOL v22 = 0;
      goto LABEL_53;
    }
    id v6 = _PKLogCategory(PKLogCategoryFramework);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "marker-levels attribute is missing";
    goto LABEL_50;
  }
  if ([v2 count] == 1)
  {
    id v3 = [v2 firstObject];
    int v4 = [v3 compare:@"none"];

    if (!v4)
    {
      id v6 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v26 = "marker-colors is \"none\"";
        goto LABEL_50;
      }
LABEL_51:
      BOOL v22 = 0;
      goto LABEL_52;
    }
  }
  uint64_t v5 = [v34 count];
  if ([v2 count] != v5
    || [v33 count] != v5
    || [v32 count] != v5
    || v30 && [v30 count] != v5
    || v31 && [v31 count] != v5)
  {
    id v6 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "Not all marker attributes contain the same number of values";
LABEL_50:
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      goto LABEL_51;
    }
    goto LABEL_51;
  }
  id v6 = objc_opt_new();
  uint64_t v29 = v5;
  if (v5)
  {
    uint64_t v8 = 0;
    *(void *)&long long v7 = 136315138;
    long long v28 = v7;
    do
    {
      objc_msgSend(v34, "objectAtIndexedSubscript:", v8, v28);
      id v9 = objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 UTF8String];

      id v11 = [v2 objectAtIndexedSubscript:v8];
      uint64_t v12 = [v11 UTF8String];

      id v13 = [v33 objectAtIndexedSubscript:v8];
      uint64_t v14 = [v13 UTF8String];

      char v15 = [v32 objectAtIndexedSubscript:v8];
      uint64_t v16 = [v15 integerValue];

      if (v31)
      {
        id v17 = [v31 objectAtIndexedSubscript:v8];
        uint64_t v18 = [v17 integerValue];
      }
      else
      {
        uint64_t v18 = 0;
      }
      if (v30)
      {
        int v19 = [v30 objectAtIndexedSubscript:v8];
        uint64_t v20 = [v19 integerValue];
      }
      else
      {
        uint64_t v20 = 100;
      }
      if (+[PKSupply isValidColorString:v12])
      {
        int v21 = [[PKSupply alloc] initWithName:v10 markerType:v14 colors:v12 level:v16 lowLevel:v18 highLevel:v20];
        if (v21) {
          [v6 addObject:v21];
        }
      }
      else
      {
        _PKLogCategory(PKLogCategoryFramework);
        int v21 = (PKSupply *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v28;
          uint64_t v36 = v12;
          _os_log_impl(&dword_22EA54000, &v21->super, OS_LOG_TYPE_DEFAULT, "Ignoring invalid supply color: %s", buf, 0xCu);
        }
      }

      ++v8;
    }
    while (v29 != v8);
  }
  if (![v6 count]) {
    goto LABEL_51;
  }
  BOOL v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
LABEL_52:

LABEL_53:

  return v22;
}

void sub_22EA99658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA9982C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA998E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA999AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA99B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA99C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA99D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA99DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA99E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA99F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9A9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA9AAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA9AC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9AD1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9AF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PKTray;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22EA9B12C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B2B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id dictionaryWithLowercasedKeys(NSDictionary *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [(NSDictionary *)v1 allKeys];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "lowercaseString", (void)v13);
        [v3 objectForKeyedSubscript:v9];
        if (objc_claimAutoreleasedReturnValue()) {
          __assert_rtn("dictionaryWithLowercasedKeys", "PKPrinterBrowseInfo.mm", 25, "dict[lck] == nil");
        }
        uint64_t v10 = [(NSDictionary *)v1 objectForKeyedSubscript:v8];
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [v3 count];
  if (v11 != [(NSDictionary *)v1 count]) {
    __assert_rtn("dictionaryWithLowercasedKeys", "PKPrinterBrowseInfo.mm", 29, "dict.count == src.count");
  }

  return v3;
}

void sub_22EA9B864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9B964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9BAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22EA9BBE0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22EA9BC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22EA9BCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9BD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9C81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22EA9CB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id findOrMakePrinter(PKPrinterBrowseInfo *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (findOrMakePrinter(PKPrinterBrowseInfo *)::sOnce != -1) {
    dispatch_once(&findOrMakePrinter(PKPrinterBrowseInfo *)::sOnce, &__block_literal_global_13);
  }
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (findOrMakePrinter(PKPrinterBrowseInfo *)::sGen != gPrinterCacheGeneration)
  {
    id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v12 = findOrMakePrinter(PKPrinterBrowseInfo *)::sGen;
      __int16 v13 = 1024;
      int v14 = gPrinterCacheGeneration;
      _os_log_impl(&dword_22EA54000, v3, OS_LOG_TYPE_DEFAULT, "flushing printerInfo to printerCache: %d -> %d", buf, 0xEu);
    }

    findOrMakePrinter(PKPrinterBrowseInfo *)::sGeunint64_t n = gPrinterCacheGeneration;
    [(id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict removeAllObjects];
  }
  objc_sync_exit(v2);

  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  uint64_t v5 = [(PKPrinterBrowseInfo *)v1 bonjourName];
  uint64_t v10 = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v7 = [(id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [[PKPrinter alloc] initPKPrinterWithBrowseInfo:v1];
    [(id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict setObject:v7 forKeyedSubscript:v6];
  }

  objc_sync_exit(v4);

  return v7;
}

void sub_22EA9CD68(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_22EA9CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22EA9D024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL17findOrMakePrinterP19PKPrinterBrowseInfo_block_invoke()
{
  if (!findOrMakePrinter(PKPrinterBrowseInfo *)::sDict)
  {
    uint64_t v0 = objc_opt_new();
    id v1 = (void *)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict;
    findOrMakePrinter(PKPrinterBrowseInfo *)::sDict = v0;
  }
  findOrMakePrinter(PKPrinterBrowseInfo *)::sGeunint64_t n = gPrinterCacheGeneration;
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = (id)[v3 addObserverForName:@"com.apple.printkit.iCloudPrintersChanged.notification" object:0 queue:0 usingBlock:&__block_literal_global_175];
}

void sub_22EA9D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL17findOrMakePrinterP19PKPrinterBrowseInfo_block_invoke_2()
{
  return +[PKPrinterBrowseInfo rollCacheGeneration];
}

uint64_t PKParsePrinterStateReasons(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = a1;
  unsigned int v2 = 0;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v5), "lowercaseString", (void)v13);
        if ([v6 hasPrefix:@"toner-empty"])
        {
          v2 |= 0x200u;
        }
        else if ([v6 hasPrefix:@"toner-low"])
        {
          v2 |= 8u;
        }
        else if ([v6 hasPrefix:@"marker-supply-empty"])
        {
          v2 |= 0x400u;
        }
        else if ([v6 hasPrefix:@"marker-supply-low"])
        {
          v2 |= 0x10u;
        }
        else if ([v6 hasPrefix:@"media-empty"])
        {
          v2 |= 0x40u;
        }
        else if ([v6 hasPrefix:@"media-jam"])
        {
          v2 |= 0x80u;
        }
        else if ([v6 hasPrefix:@"media-low"])
        {
          v2 |= 4u;
        }
        else if ([v6 hasPrefix:@"media-needed"])
        {
          v2 |= 0x100u;
        }
        else if ([v6 hasPrefix:@"input-tray-missing"])
        {
          v2 |= 0x800u;
        }
        else if ([v6 hasPrefix:@"door-open"])
        {
          v2 |= 0x1000u;
        }
        else if ([v6 hasPrefix:@"cover-open"])
        {
          v2 |= 0x2000u;
        }
        else if ([v6 hasPrefix:@"paused"] {
               || [v6 hasPrefix:@"device-stopped"])
        }
        {
          v2 |= 0x20000u;
        }
        else if (([v6 hasSuffix:@"-report"] & 1) == 0 {
               && ([v6 hasPrefix:@"spool-area-full"] & 1) == 0
        }
               && ([v6 hasPrefix:@"connecting-to-device"] & 1) == 0
               && ([v6 hasPrefix:@"stopped-partly"] & 1) == 0
               && ![v6 hasPrefix:@"none"])
        {
          v2 |= 0x8000u;
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v7 = [v1 countByEnumeratingWithState:&v13 objects:v21 count:16];
      uint64_t v3 = v7;
    }
    while (v7);
  }

  unsigned int v8 = v2 & 0xFFFFFFEF;
  if ((v2 & 0x400) == 0) {
    unsigned int v8 = v2;
  }
  if ((v8 & 0x200) != 0) {
    uint64_t v9 = v8 & 0xFFFFFFF7;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v1 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_impl(&dword_22EA54000, v10, OS_LOG_TYPE_DEFAULT, "Reasons [%@] => %8.8x", buf, 0x12u);
  }
  return v9;
}

void sub_22EA9D4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKCopyLocalizedPrinterStateReasons(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v21 = a2;
  int v22 = PKParsePrinterStateReasons(a1);
  id v23 = v21;
  uint64_t v3 = objc_opt_new();
  if (v22)
  {
    int v4 = v22;
    do
    {
      int v24 = v4;
      int v5 = 1;
      if (v4 >= 2)
      {
        do
        {
          v5 *= 2;
          BOOL v6 = v4 >= 4;
          v4 >>= 1;
        }
        while (v6);
        if ((v22 & 0x100) != 0 || v5 != 64)
        {
          if (v5 <= 511)
          {
            if (v5 <= 15)
            {
              if (v5 == 4)
              {
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterIsAl.isa, "Low paper notice.");
                int v5 = 4;
              }
              else
              {
                if (v5 != 8) {
                  goto LABEL_37;
                }
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterIsLo.isa, "Low toner notice.");
                int v5 = 8;
              }
            }
            else
            {
              switch(v5)
              {
                case 16:
                  uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterIsLo_0.isa, "Low ink notice.");
                  int v5 = 16;
                  break;
                case 128:
                  uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterHasA.isa, "Paper jam alert.");
                  int v5 = 128;
                  break;
                case 256:
                  uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterNeed.isa, "Paper needed alert.");
                  int v5 = 256;
                  break;
                default:
                  goto LABEL_37;
              }
            }
          }
          else if (v5 > 4095)
          {
            switch(v5)
            {
              case 0x1000:
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterDoor.isa, "Door open alert.");
                int v5 = 4096;
                break;
              case 0x2000:
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterCove.isa, "Cover open alert.");
                int v5 = 0x2000;
                break;
              case 0x20000:
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterIsPa.isa, "Paused/stopped printer alert.");
                int v5 = 0x20000;
                break;
              default:
                goto LABEL_37;
            }
          }
          else
          {
            switch(v5)
            {
              case 512:
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterMayB.isa, "Out of toner alert.");
                int v5 = 512;
                break;
              case 1024:
                uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterMayB_0.isa, "Out of ink alert.");
                int v5 = 1024;
                break;
              case 2048:
                uint64_t v19 = PKLocalizedString(&cfstr_APaperTrayIsMi.isa, "Input tray missing alert.");
                int v5 = 2048;
                break;
              default:
                goto LABEL_37;
            }
          }
        }
        else
        {
          if (v23 && [v23 count])
          {
            id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v8 = v23;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v9; ++i)
                {
                  if (*(void *)v30 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  int v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  if (([v12 isEqualToString:@"auto"] & 1) == 0)
                  {
                    long long v13 = PKLocalizedString(&cfstr_ThePrinterIsOu.isa, "Out of paper alert with empty tray.");
                    long long v14 = [NSString stringWithValidatedFormat:v13, @"%@", 0, v12 validFormatSpecifiers error];
                    [v7 addObject:v14];
                  }
                }
                uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
              }
              while (v9);
            }

            if (!v7)
            {
              int v5 = 64;
              goto LABEL_37;
            }
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v15 = v7;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v26;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v26 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  [v3 addObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v16);
            }

            int v5 = 64;
            goto LABEL_36;
          }
          uint64_t v19 = PKLocalizedString(&cfstr_ThePrinterIsOu_0.isa, "Out of paper alert.");
          int v5 = 64;
        }
        id v15 = (id)v19;
        if (v19)
        {
          [v3 addObject:v19];
LABEL_36:
        }
      }
LABEL_37:
      int v4 = v24 & ~v5;
    }
    while (v4);
  }

  return v3;
}

void sub_22EA9DA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id PKDefaultPortForScheme(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v2 = [v1 lowercaseString];
  uint64_t v3 = [&unk_26E263BF8 objectForKeyedSubscript:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    int v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v1;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_ERROR, "Unknown scheme %@ - defaulting to 631", (uint8_t *)&v7, 0xCu);
    }

    id v4 = &unk_26E264F28;
  }

  return v4;
}

void sub_22EA9DB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKURLWithString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    unsigned int v2 = [MEMORY[0x263F08BA0] componentsWithString:v1 encodingInvalidCharacters:0];
    if (!v2)
    {
      unsigned int v2 = [MEMORY[0x263F08BA0] componentsWithString:v1 encodingInvalidCharacters:1];
    }
    uint64_t v3 = [v2 port];

    if (!v3)
    {
      id v4 = [v2 scheme];
      int v5 = PKDefaultPortForScheme(v4);
      [v2 setPort:v5];
    }
    BOOL v6 = [v2 URL];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_22EA9DD90()
{
}

id PKURLWithUTF8String(uint64_t a1)
{
  if (a1)
  {
    id v1 = [NSString stringWithUTF8String:a1];
    unsigned int v2 = PKURLWithString(v1);
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

void sub_22EA9DE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *toString(int a1)
{
  Class result = @"Unknown";
  switch(a1)
  {
    case 1:
      Class result = @"Managed";
      break;
    case 2:
      Class result = @"Extension";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      Class result = @"Bonjour";
      break;
    case 8:
      Class result = @"Beacon";
      break;
    default:
      uint64_t v3 = @"NAN";
      if (a1 != 32) {
        uint64_t v3 = @"Unknown";
      }
      if (a1 == 16) {
        Class result = @"Cups";
      }
      else {
        Class result = v3;
      }
      break;
  }
  return result;
}

void ___ZL17internEntriesDictv_block_invoke_cold_1()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 185, "sEntryPtrs[sEntriesCount - 1] == &sEntryValues[sEntriesCount - 1]");
}

void ___ZL17internEntriesDictv_block_invoke_cold_2()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 184, "sEntryPtrs[0] == &sEntryValues[0]");
}

void entryIndex()
{
  __assert_rtn("entryIndex", "xcups_strings.mm", 124, "e == &sEntryValues[ix]");
}

void _ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv_cold_1()
{
  __assert_rtn("operator()", "xcups_strings.mm", 168, "entryIndex(entry) != -1");
}

void urf_compress()
{
  __assert_rtn("urf_compress16", "urf-write.c", 578, "count <= context->compsize");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x270EE54E8](userNotification);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x270EF2BA8](aString);
  result.length = v2;
  result.locatiounint64_t n = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x270F770D8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x270F77220]();
}

uint64_t SBShowNetworkPromptsIfNecessary()
{
  return MEMORY[0x270F77228]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x270EE5630]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x270EF7E68]();
}

nw_txt_record_t nw_endpoint_copy_txt_record(nw_endpoint_t endpoint)
{
  return (nw_txt_record_t)MEMORY[0x270EF7E78](endpoint);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x270EF7E98](name, type, domain);
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return (nw_endpoint_t)MEMORY[0x270EF7ED8](url);
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x270EF7EF8]();
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F00](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F08](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F68](endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F78](endpoint);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x270EF95F0](txt_record, applier);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x270F9AA68](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}