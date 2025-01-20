uint64_t ACMobileShimCopyTicket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRunLoopRef Current;
  NSObject *global_queue;
  CFStringRef v10;
  uint64_t v11;
  void block[11];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  Current = CFRunLoopGetCurrent();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __ACMobileShimCopyTicket_block_invoke;
  block[3] = &unk_265043B40;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[9] = a4;
  block[4] = &v14;
  block[5] = &v18;
  block[10] = Current;
  dispatch_async(global_queue, block);
  v10 = (const __CFString *)*MEMORY[0x263EFFE88];
  while (!*((unsigned char *)v19 + 24))
    CFRunLoopRunInMode(v10, 1.0, 1u);
  v11 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_23EBEFCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __ACMobileShimCopyTicket_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v1 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __ACMobileShimCopyTicket_block_invoke_2;
  v11[3] = &unk_265043B18;
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v12 = v3;
  uint64_t v14 = *(void *)(a1 + 80);
  id v4 = objc_alloc_init(MEMORY[0x263F086B0]);
  v5 = objc_alloc_init(ACMDelegate);
  [(ACMDelegate *)v5 setCopyTicketCompletion:v11];
  id v6 = +[ACMRequest authenticationRequest];
  [v6 setRealm:@"APPLECONNECT.APPLE.COM"];
  [v6 setAppID:[NSNumber numberWithInteger:1205]];
  [v6 setAppIDKey:@"D134F7CA19FC87A2BD841EE11F2A825C058040C92792F87B7E1C04B40291F620"];
  [v6 setUserName:v2];
  v7 = +[ACMAppleConnect sharedInstance];
  [(ACMAppleConnect *)v7 setDelegate:v5];
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(@"ACLogLevel", @"com.apple.ACMobileShim");
  if (v8)
  {
    v9 = (void *)v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ACMAppleConnect setLogLevel:](v7, "setLogLevel:", (int)[v9 intValue]);
    }
  }
  [(ACMAppleConnect *)v7 authenticateWithRequest:v6 password:v1];
  return [v4 drain];
}

void __ACMobileShimCopyTicket_block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = (void *)a1[6];
  if (v6)
  {
    if (a2)
    {
      id v7 = a2;
      id v6 = (void *)a1[6];
    }
    *id v6 = a2;
  }
  CFPropertyListRef v8 = (void *)a1[7];
  if (v8)
  {
    if (a3)
    {
      id v9 = a3;
      CFPropertyListRef v8 = (void *)a1[7];
    }
    *CFPropertyListRef v8 = a3;
  }
  if (a2 && !a3) {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  v10 = (__CFRunLoop *)a1[8];

  CFRunLoopWakeUp(v10);
}

uint64_t ACMImageWithName(uint64_t a1)
{
  uint64_t v2 = +[ACMImageLoader sharedInstance];

  return (uint64_t)[(ACMImageLoader *)v2 imageNamed:a1];
}

void ACMClearImagesCache()
{
  sLoader = 0;
}

void sub_23EBF137C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_23EBF921C(_Unwind_Exception *a1)
{
}

void sub_23EBFABBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC02144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC021F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0641C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ACFMakeRandomData(unsigned char *bytes, size_t a2)
{
  size_t v2 = a2;
  long long v3 = bytes;
  int v4 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], a2, bytes);
  if (v4)
  {
    if (ACFLog)
    {
      int v5 = v4;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"void ACFMakeRandomData(unsigned char *, NSUInteger)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 71, 0, "Error with code %d occurred while creating random string", v5);
      }
    }
    for (; v2; --v2)
      *v3++ = arc4random_uniform(0x100u);
  }
}

void *ACFRandomData(uint64_t a1)
{
  size_t v1 = a1;
  v4[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    a1 = [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to allcoate 0 size random block"];
  }
  MEMORY[0x270FA5388](a1);
  ACFMakeRandomData((unsigned char *)v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  size_t v2 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:(char *)v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0) length:v1];
  if (![v2 length]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Failed to create data block"];
  }
  return v2;
}

void ACFMakeRandomString(char *a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  int v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ACFMakeRandomData(v5, v4);
  for (; a2; --a2)
  {
    unsigned int v6 = *v5++;
    unint64_t v7 = (107374183 * (unint64_t)v6) >> 32;
    char v8 = v6 - 40 * v7 + 46;
    if (v6 - 40 * v7 == 12) {
      char v8 = 59;
    }
    *a1++ = v8;
  }
}

uint64_t ACFRandomString(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  size_t v2 = (char *)v4 - ((MEMORY[0x270FA5388]() + 16) & 0xFFFFFFFFFFFFFFF0);
  ACFMakeRandomString(v2, a1);
  v2[a1] = 0;
  return [NSString stringWithUTF8String:v2];
}

uint64_t ACFEncodeBase64(uint64_t result)
{
  if (result)
  {
    size_t v1 = (void *)result;
    if (objc_opt_respondsToSelector())
    {
      return [v1 base64EncodedStringWithOptions:0];
    }
    else
    {
      return [v1 base64Encoding];
    }
  }
  return result;
}

id ACFDecodeBase64(void *a1)
{
  if (a1)
  {
    size_t v2 = a1;
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v4 = [[(id)[v2 componentsSeparatedByCharactersInSet:[MEMORY[0x263F08708] newlineCharacterSet]] componentsJoinedByString:&stru_26F261788];
    if (objc_opt_respondsToSelector()) {
      a1 = (void *)[v3 initWithBase64EncodedString:v4 options:0];
    }
    else {
      a1 = (void *)[v3 initWithBase64Encoding:v4];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

void *ACFDecodeBase32(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  if ((v2 & 7) != 0) {
    return 0;
  }
  unint64_t v3 = v2;
  qmemcpy(v20, "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", sizeof(v20));
  char v18 = 61;
  id v4 = (id)[[NSString alloc] initWithBytes:v20 length:32 encoding:1];
  id v5 = objc_alloc_init(MEMORY[0x263F089C0]);
  [v5 addCharactersInString:v4];
  [v5 addCharactersInString:((id)[NSString alloc] initWithBytes:&v18 length:1 encoding:1]);
  if (objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v5), "length")) {
    return 0;
  }
  unint64_t v6 = 0;
  do
  {
    unint64_t v7 = v3 + v6;
    uint64_t v8 = [a1 rangeOfString:@"=" options:12 range:v3 + v6--];
  }
  while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  if (v6 < 0xFFFFFFFFFFFFFFF9) {
    return 0;
  }
  id v9 = 0;
  if (~v6 != 2 && ~v6 != 5)
  {
    id v9 = 0;
    if (objc_msgSend(a1, "rangeOfString:options:range:", @"=", 0, 0, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = (void *)[MEMORY[0x263EFF990] dataWithCapacity:5 * (v3 >> 3)];
      CFRetain(a1);
      if (v3)
      {
        for (unint64_t i = 0; i < v3; i += 8)
        {
          uint64_t v12 = 0;
          uint64_t v19 = 0;
          do
          {
            uint64_t v13 = [a1 characterAtIndex:i + v12];
            if (v13 == v18) {
              char v14 = -1;
            }
            else {
              char v14 = [v4 rangeOfString:[NSString stringWithFormat:@"%C", v13]];
            }
            *((unsigned char *)&v19 + v12++) = v14;
          }
          while (v12 != 8);
          char v17 = 0;
          int v16 = ((8 * v19) | (BYTE1(v19) >> 2) & 7);
          if (BYTE2(v19) == 255)
          {
            uint64_t v15 = 1;
          }
          else
          {
            BYTE1(v16) = (BYTE1(v19) << 6) | (2 * (BYTE2(v19) & 0x1F)) | ((v19 & 0x10000000) != 0);
            if (BYTE4(v19) == 255)
            {
              uint64_t v15 = 2;
            }
            else
            {
              BYTE2(v16) = (16 * BYTE3(v19)) | (BYTE4(v19) >> 1) & 0xF;
              if (BYTE5(v19) == 255)
              {
                uint64_t v15 = 3;
              }
              else
              {
                HIBYTE(v16) = (BYTE4(v19) << 7) | (4 * (BYTE5(v19) & 0x1F)) | (BYTE6(v19) >> 3) & 3;
                if (HIBYTE(v19) == 255)
                {
                  uint64_t v15 = 4;
                }
                else
                {
                  char v17 = HIBYTE(v19) & 0x1F | (32 * BYTE6(v19));
                  uint64_t v15 = 5;
                }
              }
            }
          }
          [v9 appendBytes:&v16 length:v15];
        }
      }
      CFRelease(a1);
    }
  }
  return v9;
}

uint64_t ACFEncodeBase16(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
    uint64_t v3 = [a1 bytes];
    if ([a1 length])
    {
      unint64_t v4 = 0;
      do
        [v2 appendFormat:@"%02x", *(unsigned __int8 *)(v3 + v4++)];
      while (v4 < [a1 length]);
    }
    id v5 = NSString;
    return [v5 stringWithString:v2];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSString *ACFEncodeBase16(NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 306, 0, "Invalid parameter!");
    }
    return 0;
  }
}

uint64_t ACFDecodeBase16(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)[MEMORY[0x263EFF990] data];
    if ([a1 length])
    {
      unint64_t v3 = 0;
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v5 = [@"0123456789abcdef" rangeOfString:[a1 substringWithRange:v3, 1] options:1];
        if (v5 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v4 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v4 = v5;
          }
          else
          {
            char v8 = v5 + 16 * v4;
            [v2 appendBytes:&v8 length:1];
            uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        ++v3;
      }
      while (v3 < [a1 length]);
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      {
        char v7 = 16 * v4;
        [v2 appendBytes:&v7 length:1];
      }
    }
    return [MEMORY[0x263EFF8F8] dataWithData:v2];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSData *ACFDecodeBase16(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 352, 0, "Invalid parameter!");
    }
    return 0;
  }
}

uint64_t ACFSHA1Init()
{
  v0 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  if (v0)
  {
    uint64_t v1 = v0;
    v0[4] = 0u;
    v0[5] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    _OWORD *v0 = 0u;
    v0[1] = 0u;
    CC_SHA1_Init((CC_SHA1_CTX *)v0);
    uint64_t v2 = (void *)MEMORY[0x263EFF8F8];
    return [v2 dataWithBytesNoCopy:v1 length:96 freeWhenDone:1];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSData *ACFSHA1Init(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 375, 0, "Error occured: malloc return NULL");
    }
    return 0;
  }
}

void ACFSHA1Update(void *a1, void *a2)
{
  if (a1 && a2)
  {
    unint64_t v3 = (CC_SHA1_CTX *)[a1 bytes];
    uint64_t v4 = (const void *)[a2 bytes];
    CC_LONG v5 = [a2 length];
    CC_SHA1_Update(v3, v4, v5);
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"void ACFSHA1Update(NSData *, NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 389, 0, "Invalid parameters!");
  }
}

uint64_t ACFSHA1Final(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)[a1 bytes]);
    return [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"NSData *ACFSHA1Final(NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 407, 0, "Invalid parameter!");
      }
    }
    return 0;
  }
}

uint64_t ACFSHA1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  CC_SHA1((const void *)[a1 UTF8String], [a1 length], md);
  return [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
}

void *ACFSHA1AsString(void *a1)
{
  uint64_t v1 = (void *)ACFSHA1(a1);
  unint64_t v2 = [v1 length];
  uint64_t v3 = [v1 bytes];
  uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  if (v2)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      [v4 appendFormat:@"%02X", *(unsigned __int8 *)(v3 + v5)];
      uint64_t v5 = v6;
    }
    while (v2 > v6++);
  }
  return v4;
}

uint64_t ACFSHA256(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  CC_SHA256((const void *)[a1 bytes], [a1 length], md);
  return [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
}

void *ACFSHA256AsString(void *a1)
{
  uint64_t v1 = (void *)ACFSHA256(a1);
  unint64_t v2 = [v1 length];
  uint64_t v3 = [v1 bytes];
  uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  if (v2)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      [v4 appendFormat:@"%02X", *(unsigned __int8 *)(v3 + v5)];
      uint64_t v5 = v6;
    }
    while (v2 > v6++);
  }
  return v4;
}

uint64_t ACFSHA256ForString(void *a1)
{
  uint64_t v1 = [MEMORY[0x263EFF8F8] dataWithBytes:[a1 UTF8String] length:[a1 length]];

  return ACFSHA256(v1);
}

uint64_t ACFDES_ECB_Encrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 1u, 8, 8uLL, 0, 1, 2u);
}

uint64_t ACFCrypt_Process(void *a1, void *a2, CCAlgorithm a3, uint64_t a4, unint64_t a5, void *a6, int a7, CCOptions a8)
{
  uint64_t v16 = [a1 length];
  if (!v16)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      uint64_t v19 = @"decrypt";
      if (a7) {
        uint64_t v19 = @"encrypt";
      }
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 527, 0, "Attempt to %@ data with zero size", v19);
    }
    return 0;
  }
  unint64_t v17 = v16;
  if ([a2 length] != a4)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      v20 = @"decrypt";
      if (a7) {
        v20 = @"encrypt";
      }
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 522, 0, "Attempt to %@ data with incorrect key", v20);
    }
    return 0;
  }
  if ((a8 & 1) == 0 && v17 % a5)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      char v18 = @"decrypt";
      if (a7) {
        char v18 = @"encrypt";
      }
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 517, 0, "Attempt to %@ data with incorrect size", v18);
    }
    return 0;
  }
  size_t dataOutAvailable = v17 + a5;
  dataOut = malloc_type_malloc(dataOutAvailable, 0xDFABB69FuLL);
  if (!dataOut)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 512, 0, "Error occured in crypt: malloc return NULL");
    }
    return 0;
  }
  v23 = dataOut;
  *(_DWORD *)&op[8] = 0;
  *(void *)op = a7 ^ 1u;
  uint64_t v24 = CCCrypt(*(CCOperation *)op, a3, a8, (const void *)[a2 bytes], [a2 length], (const void *)[a6 bytes], (const void *)[a1 bytes], [a1 length], dataOut, dataOutAvailable, (size_t *)&op[4]);
  if (v24)
  {
    if (ACFLog)
    {
      uint64_t v25 = v24;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        v26 = @"decryption";
        if (a7) {
          v26 = @"encryption";
        }
        ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 494, 0, "Error with code %d has been occured during %@ process", v25, v26);
      }
    }
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = [MEMORY[0x263EFF990] dataWithBytes:v23 length:*(void *)&op[4]];
  }
  free(v23);
  return v27;
}

uint64_t ACFDES_ECB_Decrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 1u, 8, 8uLL, 0, 0, 2u);
}

uint64_t ACF3DES_CBC_Encrypt(void *a1, void *a2, CCOptions a3)
{
  return ACFCrypt_Process(a1, a2, 2u, 24, 8uLL, 0, 1, a3);
}

uint64_t ACF3DES_CBC_Decrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 2u, 24, 8uLL, 0, 0, 0);
}

uint64_t ACFAES128_CBC_Encrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, a3, 1, a4);
}

uint64_t ACFAES128_CBC_Decrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, a3, 0, a4);
}

uint64_t ACFAES128_Key256_CBC_Encrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 32, 0x10uLL, a3, 1, a4);
}

uint64_t ACFAES128_Key256_CBC_Decrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 32, 0x10uLL, a3, 0, a4);
}

uint64_t ACFAES128_ECB_Encrypt(void *a1, void *a2, int a3)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, 0, 1, a3 | 2u);
}

uint64_t ACFAES128_ECB_Decrypt(void *a1, void *a2, int a3)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, 0, 0, a3 | 2u);
}

void *ACFEncodeObscuredString(void *a1, unint64_t a2)
{
  uint64_t v3 = (const char *)[a1 UTF8String];
  if (v3)
  {
    uint64_t v4 = v3;
    size_t v5 = strlen(v3);
    size_t v6 = v5;
    if (2 * v5 > a2) {
      a2 = 2 * v5;
    }
    char v7 = (void *)ACFRandomString(a2);
    char v8 = [MEMORY[0x263EFF990] dataWithBytes:[v7 UTF8String] length:[v7 length]];
    uint64_t v9 = [v8 mutableBytes];
    if (v9) {
      BOOL v10 = a2 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      unint64_t v11 = 0;
      do
      {
        if (v11 >> 1 >= v6) {
          char v12 = 0;
        }
        else {
          char v12 = v4[v11 >> 1];
        }
        *(unsigned char *)(v9 + v11) = v12;
        v11 += 2;
      }
      while (v11 < a2);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSData *ACFEncodeObscuredString(NSString *, NSUInteger)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 626, 0, "Failed to generate obscured string, extractng UTF8 string from NSString failed.");
    }
    return 0;
  }
  return v8;
}

uint64_t ACFObscureAndBaseEncode64String(void *a1)
{
  if (!a1)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 655, 0, "Invalid Parameters");
    }
    return 0;
  }
  uint64_t v1 = ACFEncodeObscuredString(a1, 2 * [a1 lengthOfBytesUsingEncoding:4]);
  if (!v1)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 650, 0, "Failed to generate obscured string");
    }
    return 0;
  }
  uint64_t result = ACFEncodeBase64((uint64_t)v1);
  if (!result && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 645, 0, "Failed encoding Base64 string");
    }
    return 0;
  }
  return result;
}

uint64_t ACFDecodeObscuredString(void *a1)
{
  unint64_t v2 = [a1 length];
  if (v2 < 2) {
    return 0;
  }
  unint64_t v3 = v2 >> 1;
  uint64_t v4 = malloc_type_malloc((v2 >> 1) + 1, 0x44658E6CuLL);
  if (!v4) {
    return 0;
  }
  size_t v5 = v4;
  size_t v6 = (char *)[a1 bytes];
  uint64_t v7 = 0;
  if (v3 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v3;
  }
  do
  {
    char v9 = *v6;
    v6 += 2;
    v5[v7++] = v9;
  }
  while (v8 != v7);
  v5[v3] = 0;
  uint64_t v10 = [NSString stringWithUTF8String:v5];
  free(v5);
  return v10;
}

uint64_t ACFHmacSHA1(void *a1, void *a2)
{
  uint64_t result = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2)
    {
      size_t v5 = (const void *)[a2 bytes];
      size_t v6 = [a2 length];
      uint64_t v7 = (const void *)[a1 bytes];
      size_t v8 = [a1 length];
      uint64_t result = 0;
      if (v7)
      {
        if (v5)
        {
          v9[0] = 0;
          v9[1] = 0;
          int v10 = 0;
          CCHmac(0, v5, v6, v7, v8, v9);
          return [MEMORY[0x263EFF8F8] dataWithBytes:v9 length:20];
        }
      }
    }
  }
  return result;
}

uint64_t ACFHmacSHA256(void *a1, void *a2)
{
  uint64_t result = 0;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2)
    {
      size_t v5 = (const void *)[a2 bytes];
      size_t v6 = [a2 length];
      uint64_t v7 = (const void *)[a1 bytes];
      size_t v8 = [a1 length];
      uint64_t result = 0;
      if (v7)
      {
        if (v5)
        {
          memset(v9, 0, sizeof(v9));
          CCHmac(2u, v5, v6, v7, v8, v9);
          return [MEMORY[0x263EFF8F8] dataWithBytes:v9 length:32];
        }
      }
    }
  }
  return result;
}

char *ACFLogSettingsGetLevelName(int a1)
{
  return kACFLogLevelNames[a1];
}

uint64_t ACFLogSettingsGetLevelMask()
{
  return kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

uint64_t ACFLogSettingsGetLevel()
{
  uint64_t v1 = 2;
  uint64_t result = _logLevel;
  if (_logLevel < 0)
  {
    if (ACFPreferencesGetIntegerValue(@"ACCLogLevel", @"com.apple.ist.ds.appleconnect.mobile.external", (const __CFString *)*MEMORY[0x263EFFE70], (const __CFString *)*MEMORY[0x263EFFE50], 0, &v1))return v1; {
    else
    }
      return 2;
  }
  return result;
}

uint64_t ACFLogSettingsGetDestination()
{
  uint64_t v1 = 0;
  uint64_t result = _logDestination;
  if (_logDestination >= 3)
  {
    uint64_t result = ACFPreferencesGetIntegerValue(@"ACCLogDestination", @"com.apple.ist.ds.appleconnect.mobile.external", (const __CFString *)*MEMORY[0x263EFFE70], (const __CFString *)*MEMORY[0x263EFFE50], 0, &v1);
    if (result) {
      return v1;
    }
  }
  return result;
}

CFStringRef ACFLogSettingsGetFilePath()
{
  if (_logFilePath) {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)_logFilePath);
  }
  else {
    return (CFStringRef)ACFPreferencesCopyString(@"ACCLogFilePath", @"com.apple.ist.ds.appleconnect.mobile.external", (const __CFString *)*MEMORY[0x263EFFE70], (const __CFString *)*MEMORY[0x263EFFE50], 0);
  }
}

void ACFLogSettingsSetLevel(unsigned int a1)
{
  unsigned int valuePtr = a1;
  if (a1 <= 5)
  {
    CFNumberRef v1 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      CFNumberRef v2 = v1;
      CFPreferencesSetValue(@"ACCLogLevel", v1, @"com.apple.ist.ds.appleconnect.mobile.external", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
      CFRelease(v2);
    }
  }
}

void ACFLogSettingsSetDestination(unsigned int a1)
{
  unsigned int valuePtr = a1;
  if (a1 <= 2)
  {
    CFNumberRef v1 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      CFNumberRef v2 = v1;
      CFPreferencesSetValue(@"ACCLogDestination", v1, @"com.apple.ist.ds.appleconnect.mobile.external", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
      CFRelease(v2);
    }
  }
}

void ACFLogSettingsSetFilePath(CFPropertyListRef value)
{
}

uint64_t ACFLogSettingsSynchronizeWithPreferences()
{
  if (ACFGetHomedirAccess())
  {
    v0 = ACFPreferencesCopyPreferencesFilePath(@"com.apple.ist.ds.appleconnect.mobile.external", (const __CFString *)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    if (v0)
    {
      CFNumberRef v1 = v0;
      CFStringRef v7 = 0;
      CFDictionaryRef v2 = ACFPreferencesCopyDictionaryWithContentsOfFile(v0, &v7);
      CFDictionaryRef v3 = v2;
      if (v7 || !v2)
      {
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        if (!v2)
        {
LABEL_9:
          CFRelease(v1);
          return v5;
        }
      }
      else
      {
        ACFLogSettingsSynchronizeFromDictionary(v2);
        uint64_t v4 = 1;
      }
      CFRelease(v3);
      uint64_t v5 = v4;
      goto LABEL_9;
    }
  }
  return 0;
}

CFDictionaryRef ACFLogSettingsSynchronizeFromDictionary(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    Value = CFDictionaryGetValue(result, @"ACCLogLevel");
    unint64_t v7 = 0;
    if (ACFConvertCFTypeToInteger((uint64_t)Value, &v7) && v7 <= 5) {
      _logLevel = v7;
    }
    CFDictionaryRef v3 = CFDictionaryGetValue(v1, @"ACCLogDestination");
    unint64_t v6 = 0;
    if (ACFConvertCFTypeToInteger((uint64_t)v3, &v6) && v6 <= 2) {
      _logDestination = v6;
    }
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(v1, @"ACCLogFilePath");
    if (result)
    {
      CFStringRef v4 = (const __CFString *)result;
      CFTypeID v5 = CFGetTypeID(result);
      uint64_t result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v5 == result)
      {
        uint64_t result = (const __CFDictionary *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v4);
        _logFilePath = (uint64_t)result;
      }
    }
  }
  return result;
}

void ACFLogImpl(int a1, uint64_t a2, char *__s, uint64_t a4, const char *a5, uint64_t a6)
{
  if (!a6) {
    return;
  }
  size_t v8 = __s;
  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v11 = "ACUnknown";
  }
  if (__s)
  {
    char v12 = strrchr(__s, 47);
    if (v12) {
      size_t v8 = v12 + 1;
    }
  }
  int Destination = ACFLogSettingsGetDestination();
  if (!Destination)
  {
    unsigned int v14 = a1;
    uint64_t v15 = a2;
    uint64_t v16 = (uint64_t)v8;
    uint64_t v17 = a4;
    char v18 = v11;
    uint64_t v19 = a6;
    int v20 = 0;
LABEL_14:
    ACFLogImplASL(v14, v15, v16, v17, v18, v19, v20);
    return;
  }
  if (Destination != 1)
  {
    if (Destination != 2) {
      return;
    }
    unsigned int v14 = a1;
    uint64_t v15 = a2;
    uint64_t v16 = (uint64_t)v8;
    uint64_t v17 = a4;
    char v18 = v11;
    uint64_t v19 = a6;
    int v20 = 1;
    goto LABEL_14;
  }

  ACFLogImplStandard(a1, a2, (uint64_t)v8, a4, v11, a6);
}

asl_object_t ACFLogImplASL(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, int a7)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a5) {
    uint64_t v13 = a5;
  }
  else {
    uint64_t v13 = "";
  }
  asl_object_t result = asl_open(0, v13, 2u);
  if (!result) {
    return result;
  }
  uint64_t v15 = result;
  if (a7 != 1)
  {
    uint64_t v20 = 0xFFFFFFFFLL;
LABEL_25:
    char v21 = 1;
    goto LABEL_26;
  }
  CFStringRef FilePath = ACFLogSettingsGetFilePath();
  CFStringRef v17 = FilePath;
  if (FilePath) {
    CopyExpandingTildeInPath = (__CFString *)FilePath;
  }
  else {
    CopyExpandingTildeInPath = @"~/Library/Logs/AppleConnect.log";
  }
  if (CFStringHasPrefix(CopyExpandingTildeInPath, @"~"))
  {
    if (!ACFGetHomedirAccess())
    {
      uint64_t v19 = 0;
      goto LABEL_19;
    }
    CopyExpandingTildeInPath = ACFStringCreateCopyExpandingTildeInPath(CopyExpandingTildeInPath);
    uint64_t v19 = CopyExpandingTildeInPath;
    if (!CopyExpandingTildeInPath)
    {
LABEL_19:
      uint64_t v20 = 0xFFFFFFFFLL;
      if (!v17) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  buffer[0] = 0;
  if (CFStringGetCString(CopyExpandingTildeInPath, buffer, 1024, 0x8000100u) != 1) {
    goto LABEL_19;
  }
  uint64_t v20 = open(buffer, 522, 438);
  if (v17) {
LABEL_20:
  }
    CFRelease(v17);
LABEL_21:
  if (v19) {
    CFRelease(v19);
  }
  if (v20 == -1) {
    goto LABEL_25;
  }
  asl_add_log_file(v15, v20);
  char v21 = 0;
LABEL_26:
  if (a1 >= 5) {
    int v22 = 5;
  }
  else {
    int v22 = a1;
  }
  buffer[0] = 0;
  v23 = kACFLogLevelNames[a1];
  pthread_t v24 = pthread_self();
  CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"%s: %@ <%s:%s, %s:%ld, Thread:%p>", v23, a6, v13, a2, a3, a4, v24);
  CFStringRef v26 = v25;
  if (v25) {
    uint64_t v27 = ACFStringConvertToCString(v25, 0x8000100u, buffer);
  }
  else {
    uint64_t v27 = 0;
  }
  v28 = "";
  if (v27) {
    v28 = v27;
  }
  asl_log(v15, 0, v22, "%s", v28);
  if ((v21 & 1) == 0)
  {
    MEMORY[0x23ED0E090](v15, v20);
    close(v20);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v27)
  {
    if (buffer[0] == 1) {
      free(v27);
    }
  }
  return (asl_object_t)MEMORY[0x23ED0E060](v15);
}

void ACFLogImplStandard(int a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6)
{
  uint64_t v10 = kACFLogLevelNames[a1];
  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v11 = "";
  }
  pthread_t v12 = pthread_self();
  CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%s: %@ <%s:%s, %s:%ld, Thread:%p>", v10, a6, v11, a2, a3, a4, v12);
  if (v13)
  {
    CFStringRef v14 = v13;
    CFShow(v13);
    CFRelease(v14);
  }
}

void ACFLog(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *a6, ...)
{
  va_start(va, a6);
  if (a6) {
    ACFLogWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)va);
  }
}

void ACFLogWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *cStr, uint64_t a7)
{
  if (cStr)
  {
    CFStringRef v13 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v13)
    {
      CFStringRef v14 = v13;
      ACFLogNSWithArgs(a1, a2, a3, a4, a5, (uint64_t)v13, a7);
      CFRelease(v14);
    }
  }
}

void ACFLogNSWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7)
{
  if (a6) {
    ACFLogImpl(a1, a2, a3, a4, a5, (uint64_t)(id)[[NSString alloc] initWithFormat:a6 arguments:a7]);
  }
}

void ACFLogCF(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a6) {
    ACFLogCFWithArgs(a1, a2, a3, a4, a5, a6, &a9);
  }
}

void ACFLogCFWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, CFStringRef format, va_list arguments)
{
  if (format)
  {
    CFStringRef v12 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
    if (v12)
    {
      CFStringRef v13 = v12;
      ACFLogImpl(a1, a2, a3, a4, a5, (uint64_t)v12);
      CFRelease(v13);
    }
  }
}

void ACFLogNS(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6) {
    ACFLogNSWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)&a9);
  }
}

double ACFProfileCurrentTime()
{
  if (*(double *)&ACFProfileCurrentTime_sACFProfileScale == 0.0
    && !pthread_mutex_lock(&ACFProfileCurrentTime_sACFProfileMutex))
  {
    if (*(double *)&ACFProfileCurrentTime_sACFProfileScale == 0.0)
    {
      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      LODWORD(v1) = info.denom;
      LODWORD(v0) = info.numer;
      *(double *)&ACFProfileCurrentTime_sACFProfileScale = (double)v0 / (double)v1 * 0.000000001;
    }
    pthread_mutex_unlock(&ACFProfileCurrentTime_sACFProfileMutex);
  }
  return *(double *)&ACFProfileCurrentTime_sACFProfileScale * (double)mach_absolute_time();
}

double ACFProfileStart(uint64_t a1, char *a2, uint64_t a3, const char *a4, uint64_t a5)
{
  double v10 = ACFProfileCurrentTime();
  if (a5) {
    ACFLog(8, a1, a2, a3, a4, "<%s> { ");
  }
  else {
    ACFLog(8, a1, a2, a3, a4, "{");
  }
  return v10;
}

void ACFProfileEnd(uint64_t a1, char *a2, uint64_t a3, const char *a4, uint64_t a5)
{
  if (a5) {
    ACFLog(8, a1, a2, a3, a4, "} <%s> duration: %g seconds");
  }
  else {
    ACFLog(8, a1, a2, a3, a4, "} duration: %g seconds");
  }
}

void ACFLogC(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6) {
    ACFLogWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)&a9);
  }
}

uint64_t ACFLogLevelsMasks()
{
  return (int)kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

uint64_t ACFLogLevelMask()
{
  return (int)kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

id mapUserName(uint64_t a1)
{
  unint64_t v1 = (void *)[MEMORY[0x263F089D8] stringWithString:a1];
  uint64_t v2 = [v1 length];
  [v1 replaceOccurrencesOfString:@" " withString:@"#" options:0 range:v2];
  [v1 replaceOccurrencesOfString:@"@" withString:@"%" options:0 range:v2];
  CFDictionaryRef v3 = (void *)[v1 copy];

  return v3;
}

void sub_23EC0B388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0B4CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0B560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0B5D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0B6A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0B7F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0CB94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

void sub_23EC0CBD4(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x23EC0CBC0);
  }
  JUMPOUT(0x23EC0CBECLL);
}

void sub_23EC0CBE4(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exc_buf);
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 182, 0, "Exception has been thrown - %@");
      }
      objc_end_catch();
      JUMPOUT(0x23EC0CAC0);
    }
    objc_begin_catch(exc_buf);
    JUMPOUT(0x23EC0CAC8);
  }
  JUMPOUT(0x23EC0CBC0);
}

void sub_23EC0CC48(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x23EC0CC54);
  }
  JUMPOUT(0x23EC0CBC0);
}

void sub_23EC0CD30(_Unwind_Exception *a1)
{
}

void sub_23EC0CE54(_Unwind_Exception *a1)
{
}

void sub_23EC0CF7C(_Unwind_Exception *a1)
{
}

void sub_23EC0D4F0()
{
}

void sub_23EC0D508(_Unwind_Exception *a1)
{
}

__CFData *ACFDataCreateFromByteString(const __CFAllocator *a1, const __CFString *a2)
{
  char v14 = 0;
  CFDictionaryRef v3 = ACFStringConvertToCString(a2, 0x8000100u, &v14);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  int64_t v5 = strlen(v3);
  uint64_t v6 = v5;
  if (v5)
  {
    Mutable = 0;
  }
  else
  {
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    Mutable = CFDataCreateMutable(a1, v7 >> 1);
    if (Mutable)
    {
      __endptr = 0;
      __str[2] = 0;
      if (v6 >= 1)
      {
        for (uint64_t i = 0; i < v6; i += 2)
        {
          __str[0] = v4[i];
          __str[1] = v4[i + 1];
          UInt8 bytes = 0;
          UInt8 bytes = strtol(__str, &__endptr, 16);
          CFDataAppendBytes(Mutable, &bytes, 1);
        }
      }
    }
  }
  if (v14) {
    free(v4);
  }
  return Mutable;
}

char *ACFStringConvertToCString(const __CFString *a1, CFStringEncoding a2, unsigned char *a3)
{
  if (a1)
  {
    CStringPtr = CFStringGetCStringPtr(a1, a2);
    if (CStringPtr)
    {
      asl_object_t result = strdup(CStringPtr);
      *a3 = 1;
      return result;
    }
    CFIndex Length = CFStringGetLength(a1);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, a2);
    size_t v10 = MaximumSizeForEncoding + 1;
    if ((unint64_t)(MaximumSizeForEncoding + 1) >= 2)
    {
      uint64_t v11 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x2AC1F145uLL);
      if (!v11) {
        return v11;
      }
      if (CFStringGetCString(a1, v11, v10, a2))
      {
        *a3 = 1;
        return v11;
      }
      bzero(v11, v10);
      free(v11);
    }
  }
  return 0;
}

__CFString *ACFDataCreateByteString(const __CFAllocator *a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  if (!BytePtr) {
    return 0;
  }
  uint64_t v6 = Length;
  Mutable = CFStringCreateMutable(a1, 2 * Length);
  if (Mutable && v6 >= 1)
  {
    do
    {
      unsigned int v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, @"%02X", v8);
      --v6;
    }
    while (v6);
  }
  return Mutable;
}

uint64_t ACFNumberGetBooleanValue(const __CFNumber *a1)
{
  double valuePtr = 0.0;
  if (!CFNumberGetValue(a1, kCFNumberFloat64Type, &valuePtr)) {
    return 0;
  }
  uint64_t v1 = MEMORY[0x263EFFB38];
  if (valuePtr != 0.0) {
    uint64_t v1 = MEMORY[0x263EFFB40];
  }
  return *(void *)v1;
}

uint64_t ACFGetBooleanValue(const __CFString *a1)
{
  uint64_t v1 = *MEMORY[0x263EFFB38];
  if (!a1) {
    return v1;
  }
  CFTypeID v3 = CFGetTypeID(a1);
  if (v3 == CFBooleanGetTypeID()) {
    return (uint64_t)a1;
  }
  if (v3 == CFNumberGetTypeID())
  {
    return ACFNumberGetBooleanValue((const __CFNumber *)a1);
  }
  else
  {
    if (v3 != CFStringGetTypeID()) {
      return v1;
    }
    return ACFStringGetBooleanValue(a1);
  }
}

uint64_t ACFStringGetBooleanValue(CFStringRef theString)
{
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v2 = MutableCopy;
  CFStringTrimWhitespace(MutableCopy);
  CFIndex Length = CFStringGetLength(v2);
  v7.location = 0;
  v7.length = Length;
  if (CFStringCompareWithOptions(v2, @"NO", v7, 1uLL)
    && (v8.location = 0, v8.length = Length, CFStringCompareWithOptions(v2, @"FALSE", v8, 1uLL))
    && (v9.location = 0, v9.length = Length, CFStringCompareWithOptions(v2, @"0", v9, 1uLL)))
  {
    v10.location = 0;
    v10.length = Length;
    if (CFStringCompareWithOptions(v2, @"YES", v10, 1uLL))
    {
      v11.location = 0;
      v11.length = Length;
      if (CFStringCompareWithOptions(v2, @"TRUE", v11, 1uLL))
      {
        if (CFStringGetDoubleValue(v2) == 0.0)
        {
          uint64_t v5 = 0;
          goto LABEL_11;
        }
      }
    }
    CFStringRef v4 = (uint64_t *)MEMORY[0x263EFFB40];
  }
  else
  {
    CFStringRef v4 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v5 = *v4;
LABEL_11:
  CFRelease(v2);
  return v5;
}

__CFString *ACFStringCreateCopyExpandingTildeInPath(CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringRef v2 = (__CFString *)MutableCopy;
  if (MutableCopy)
  {
    if (CFStringHasPrefix(MutableCopy, @"~"))
    {
      CFURLRef v3 = ACFCopyHomeDirectoryURLForUser(0);
      if (v3)
      {
        CFURLRef v4 = v3;
        CFStringRef v5 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
        if (v5)
        {
          CFStringRef v6 = v5;
          v8.location = 0;
          v8.length = 1;
          CFStringReplace(v2, v8, v5);
          CFRelease(v6);
        }
        CFRelease(v4);
      }
    }
  }
  return v2;
}

CFURLRef ACFCopyHomeDirectoryURLForUser(const __CFString *a1)
{
  if (a1)
  {
    char v11 = 0;
    CFStringRef v2 = ACFStringConvertToCString(a1, 0x8000100u, &v11);
    if (!v2)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, "CFURLRef ACFCopyHomeDirectoryURLForUser(CFStringRef)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 259, 0, "Failed to convert user name '%@' to UTF8 string.", a1);
      }
      return 0;
    }
    CFURLRef v3 = v2;
    CFURLRef v4 = getpwnam(v2);
    if (v11 == 1)
    {
      free(v3);
      if (!v4) {
        return 0;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uid_t v5 = geteuid();
    if (!v5) {
      uid_t v5 = getuid();
    }
    CFURLRef v4 = getpwuid(v5);
  }
  if (!v4) {
    return 0;
  }
LABEL_10:
  pw_dir = v4->pw_dir;
  if (!pw_dir) {
    return 0;
  }
  size_t v7 = strlen(pw_dir);
  if (!v7) {
    return 0;
  }
  CFIndex v8 = v7;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB30];

  return CFURLCreateFromFileSystemRepresentation(v9, (const UInt8 *)pw_dir, v8, 1u);
}

uint64_t ACFConvertCFTypeToInteger(uint64_t result, void *a2)
{
  if (result)
  {
    CFNumberRef v3 = (const __CFNumber *)result;
    CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFNumberGetTypeID())
    {
      return CFNumberGetValue(v3, kCFNumberCFIndexType, a2);
    }
    else if (v4 == CFStringGetTypeID())
    {
      *a2 = CFStringGetIntValue((CFStringRef)v3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ACFGetHomedirAccess()
{
  return sACFHomedirAllowed;
}

uint64_t ACFSetHomedirAccess(uint64_t result)
{
  sACFHomedirAllowed = result;
  return result;
}

__CFString *ACFPreferencesCopyPreferencesFilePath(const __CFString *a1, const __CFString *a2, CFStringRef theString1)
{
  CFComparisonResult v6 = CFStringCompare(theString1, (CFStringRef)*MEMORY[0x263EFFE50], 0);
  CFComparisonResult v7 = CFStringCompare(a2, (CFStringRef)*MEMORY[0x263EFFE58], 0);
  Mutable = CFStringCreateMutable(0, 0);
  CFAllocatorRef v9 = Mutable;
  if (Mutable)
  {
    if (v7)
    {
      if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x263EFFE70], 0)) {
        CFStringRef v10 = a2;
      }
      else {
        CFStringRef v10 = 0;
      }
      CFURLRef v11 = ACFCopyHomeDirectoryURLForUser(v10);
      if (v11)
      {
        CFURLRef v12 = v11;
        CFStringRef v13 = CFURLCopyFileSystemPath(v11, kCFURLPOSIXPathStyle);
        if (v13)
        {
          CFStringRef v14 = v13;
          CFStringAppend(v9, v13);
          CFStringAppend(v9, @"/");
          CFRelease(v14);
        }
        CFRelease(v12);
      }
    }
    else
    {
      if (v6) {
        CFStringRef v15 = @"/";
      }
      else {
        CFStringRef v15 = @"/Network/";
      }
      CFStringAppend(Mutable, v15);
    }
    if (v6) {
      BOOL v16 = v7 == kCFCompareEqualTo;
    }
    else {
      BOOL v16 = 1;
    }
    char v17 = v16;
    if (v16) {
      CFStringRef v18 = @"Library/Preferences/";
    }
    else {
      CFStringRef v18 = @"Library/Preferences/ByHost/";
    }
    CFStringAppend(v9, v18);
    CFStringAppend(v9, a1);
    if ((v17 & 1) == 0 && CFStringCompare(theString1, (CFStringRef)*MEMORY[0x263EFFE68], 0))
    {
      CFStringAppend(v9, @".");
      CFStringAppend(v9, theString1);
    }
    CFStringAppend(v9, @".plist");
  }
  return v9;
}

uint64_t ACFCopyHostUUIDString()
{
  return 0;
}

CFTypeRef ACFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, const __CFString *a4, const __CFDictionary *a5)
{
  if (!sACFHomedirAllowed)
  {
    if ((CFStringRef)*MEMORY[0x263EFFE58] != userName) {
      goto LABEL_13;
    }
    CFTypeRef v10 = ACFPreferencesCopyValueDirectlyFromFile(@"/Library/Preferences", key, (uint64_t)applicationID);
    if (a5) {
      goto LABEL_16;
    }
    return v10;
  }
  CFTypeRef v10 = CFPreferencesCopyValue(key, applicationID, userName, a4);
  if (v10) {
    return v10;
  }
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE70];
  if ((CFStringRef)*MEMORY[0x263EFFE58] != userName && v11 != userName)
  {
    CFStringRef v13 = ACFCopyLoginUserName();
    if (v13)
    {
      CFStringRef v14 = v13;
      CFTypeRef v10 = 0;
      if (CFEqual(userName, v13)) {
        CFTypeRef v10 = CFPreferencesCopyValue(key, applicationID, v11, a4);
      }
      CFRelease(v14);
      if (!a5) {
        return v10;
      }
      goto LABEL_16;
    }
  }
LABEL_13:
  CFTypeRef v10 = 0;
  if (!a5) {
    return v10;
  }
LABEL_16:
  if (v10) {
    return v10;
  }
  Value = CFDictionaryGetValue(a5, key);
  if (!Value) {
    return 0;
  }

  return CFRetain(Value);
}

CFStringRef ACFCopyLoginUserName()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (getlogin_r(cStr, 0x100uLL)) {
    return 0;
  }
  else {
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  }
}

CFTypeRef ACFPreferencesCopyValueDirectlyFromFile(uint64_t a1, const void *a2, uint64_t a3)
{
  CFErrorRef error = 0;
  CFPropertyListFormat format = 0;
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%@/%@.plist", a1, a3);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  if (v6)
  {
    CFURLRef v7 = v6;
    CFIndex v8 = CFReadStreamCreateWithFile(0, v6);
    CFAllocatorRef v9 = v8;
    if (v8 && CFReadStreamOpen(v8) == 1)
    {
      CFPropertyListRef v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, &format, &error);
      if (v10
        && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v10))
        && (Value = CFDictionaryGetValue((CFDictionaryRef)v10, a2)) != 0)
      {
        CFTypeRef v13 = CFRetain(Value);
      }
      else
      {
        CFTypeRef v13 = 0;
      }
    }
    else
    {
      CFTypeRef v13 = 0;
      CFPropertyListRef v10 = 0;
    }
    CFRelease(v5);
    CFRelease(v7);
    if (v9)
    {
      CFReadStreamClose(v9);
      CFRelease(v9);
    }
    if (v10) {
      CFRelease(v10);
    }
  }
  else
  {
    CFRelease(v5);
    CFTypeRef v13 = 0;
  }
  if (error) {
    CFRelease(error);
  }
  return v13;
}

CFMutableDictionaryRef ACFPreferencesCopyDictionaryWithContentsOfFile(CFStringRef filePath, CFStringRef *a2)
{
  CFURLRef v4 = CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 0);
  if (v4)
  {
    CFURLRef v5 = v4;
    CFURLRef v6 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], v4);
    if (v6)
    {
      CFURLRef v7 = v6;
      if (CFReadStreamOpen(v6))
      {
        CFErrorRef error = 0;
        CFPropertyListFormat format = kCFPropertyListXMLFormat_v1_0;
        CFDictionaryRef v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v7, 0, 0, &format, &error);
        if (v8)
        {
          CFDictionaryRef v9 = v8;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (TypeID == CFGetTypeID(v9)) {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v9);
          }
          else {
            CFMutableDictionaryRef MutableCopy = 0;
          }
          CFRelease(v9);
        }
        else
        {
          CFMutableDictionaryRef MutableCopy = 0;
        }
        CFErrorRef v12 = error;
        if (error)
        {
          if (a2)
          {
            *a2 = CFErrorCopyDescription(error);
            CFErrorRef v12 = error;
          }
          CFRelease(v12);
        }
        CFReadStreamClose(v7);
      }
      else
      {
        CFMutableDictionaryRef MutableCopy = 0;
      }
      CFRelease(v7);
    }
    else
    {
      CFMutableDictionaryRef MutableCopy = 0;
      if (a2) {
        *a2 = CFStringCreateWithFormat(0, 0, @"Failed to create read stream with file %@.", v5);
      }
    }
    CFRelease(v5);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = 0;
    if (a2) {
      *a2 = CFStringCreateWithFormat(0, 0, @"Failed to create CFURL with path %@.", filePath);
    }
  }
  return MutableCopy;
}

const void *ACFPreferencesCopyArray(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  CFURLRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFArrayGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

const void *ACFPreferencesCopyDictionary(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  CFURLRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFDictionaryGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

const void *ACFPreferencesCopyString(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  CFURLRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

uint64_t ACFPreferencesGetBooleanValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, Boolean *a6)
{
  CFStringRef v7 = (const __CFString *)ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  CFBooleanRef v9 = (const __CFBoolean *)ACFGetBooleanValue(v7);
  if (v9)
  {
    if (a6) {
      *a6 = CFBooleanGetValue(v9);
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  CFRelease(v8);
  return v10;
}

uint64_t ACFPreferencesGetIntegerValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, void *a6)
{
  CFTypeRef v7 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  uint64_t v8 = ACFConvertCFTypeToInteger((uint64_t)v7, a6);
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

uint64_t ACFPreferencesGetDoubleValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, double *a6)
{
  CFNumberRef v7 = (const __CFNumber *)ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  if (!v7) {
    return 0;
  }
  CFNumberRef v8 = v7;
  CFTypeID v9 = CFGetTypeID(v7);
  if (v9 == CFNumberGetTypeID())
  {
    uint64_t Value = CFNumberGetValue(v8, kCFNumberDoubleType, a6);
  }
  else if (v9 == CFStringGetTypeID())
  {
    if (a6) {
      *a6 = CFStringGetDoubleValue((CFStringRef)v8);
    }
    uint64_t Value = 1;
  }
  else
  {
    uint64_t Value = 0;
  }
  CFRelease(v8);
  return Value;
}

uint64_t ACFPreferencesSynchronize(const __CFString *a1, const __CFString *a2, const __CFString *a3)
{
  if (sACFHomedirAllowed) {
    return CFPreferencesSynchronize(a1, a2, a3);
  }
  else {
    return 0;
  }
}

uint64_t ACFSystemVersion()
{
  if (!ACFSystemVersion_sACFSystemVersion)
  {
    CFDictionaryRef v0 = (const __CFDictionary *)ACFCopySystemVersionDictionary();
    if (v0)
    {
      CFDictionaryRef v1 = v0;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v0, @"ProductVersion");
      if (!Value)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"unsigned int ACFSystemVersion(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 664, 0, "Failed to get system version. SystemVersion.plist doesn't contain ProductVersion.");
        }
        goto LABEL_20;
      }
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, Value, @".");
      if (!ArrayBySeparatingStrings)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"unsigned int ACFSystemVersion(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 669, 0, "Failed to get system version. Failed to create substring from ProductVersion string %@.", 0);
        }
        goto LABEL_20;
      }
      CFArrayRef v4 = ArrayBySeparatingStrings;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count < 1)
      {
        SInt32 v9 = 0;
        SInt32 v8 = 0;
      }
      else
      {
        unint64_t v6 = Count;
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
        SInt32 v8 = CFStringGetIntValue(ValueAtIndex) << 16;
        if (v6 == 1)
        {
          SInt32 v9 = 0;
        }
        else
        {
          CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(v4, 1);
          SInt32 v9 = CFStringGetIntValue(v10) << 8;
          if (v6 >= 3)
          {
            CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v4, 2);
            IntCFStringRef Value = CFStringGetIntValue(v11);
LABEL_19:
            ACFSystemVersion_sACFSystemVersion = v8 | v9 | IntValue;
            CFRelease(v4);
LABEL_20:
            CFRelease(v1);
            return ACFSystemVersion_sACFSystemVersion;
          }
        }
      }
      IntCFStringRef Value = 0;
      goto LABEL_19;
    }
  }
  return ACFSystemVersion_sACFSystemVersion;
}

CFPropertyListRef ACFCopySystemVersionDictionary()
{
  CFErrorRef error = 0;
  CFPropertyListFormat format = kCFPropertyListXMLFormat_v1_0;
  CFURLRef v0 = CFURLCreateWithFileSystemPath(0, @"/System/Library/CoreServices/SystemVersion.plist", kCFURLPOSIXPathStyle, 0);
  if (!v0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 712, 0, "Failed to read SystemVersion.plist. CFURLCreateWithFileSystemPath fails");
    }
    return 0;
  }
  CFURLRef v1 = v0;
  uint64_t v2 = CFReadStreamCreateWithFile(0, v0);
  if (!v2)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 714, 0, "Failed to read SystemVersion.plist. CFReadStreamCreateWithFile fails.");
    }
    CFRelease(v1);
    return 0;
  }
  CFNumberRef v3 = v2;
  if (!CFReadStreamOpen(v2))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 716, 0, "Failed to read SystemVersion.plist. CFReadStreamOpen fails.");
    }
    goto LABEL_19;
  }
  CFPropertyListRef v4 = CFPropertyListCreateWithStream(0, v3, 0, 0, &format, &error);
  if (!v4 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 718, 0, "Failed to read SystemVersion.plist. CFPropertyListCreateFromStream fails: %@.", error);
    }
LABEL_19:
    CFPropertyListRef v4 = 0;
  }
  CFRelease(v1);
  CFReadStreamClose(v3);
  CFRelease(v3);
  if (error) {
    CFRelease(error);
  }
  return v4;
}

uint64_t ACFCopySystemVersionString()
{
  return 0;
}

uint64_t ACFCopySystemVersionDictionaryProductName()
{
  return 0;
}

CFStringRef ACFCopyProcessNameForPID(int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v7, 0, 512);
  size_t v3 = 648;
  *(void *)CFPropertyListRef v4 = 0xE00000001;
  int v5 = 1;
  int v6 = a1;
  int v1 = sysctl(v4, 4u, v7, &v3, 0, 0);
  CFStringRef result = 0;
  if (!v1) {
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)&v7[15] + 3, 0x8000100u);
  }
  return result;
}

void sub_23EC0F9CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0FA94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0FB84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC0FD88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ACMExternalAppleConnectPrivateCreate(uint64_t a1)
{
  id v2 = +[ACMExternalAppleConnectImplComponents components];

  return [v2 createAppleConnectImplWithMasterObject:a1];
}

void sub_23EC140F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_23EC16358(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC163D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC17C04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC17D24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC17E9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC17FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void dispatch_async_on_main_thread(uint64_t a1)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  SInt32 v9 = __Block_byref_object_dispose__0;
  uint64_t v10 = 0;
  id v2 = [ACFDispatchHelper alloc];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  int v4[2] = __dispatch_async_on_main_thread_block_invoke;
  v4[3] = &unk_265043FD0;
  v4[4] = a1;
  v4[5] = &v5;
  size_t v3 = [(ACFDispatchHelper *)v2 initWithBlock:v4];
  v6[5] = (uint64_t)v3;
  [(ACFDispatchHelper *)v3 performSelectorOnMainThread:sel_dispatch withObject:0 waitUntilDone:0];
  _Block_object_dispose(&v5, 8);
}

void sub_23EC1C148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __dispatch_async_on_main_thread_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

void sub_23EC1FD54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC1FE18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC1FE88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC20D9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC20E6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC20EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC210A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21A8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21AEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21B54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC21D6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EC2B0B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecKeyEncrypt(SecKeyRef key, SecPadding padding, const uint8_t *plainText, size_t plainTextLen, uint8_t *cipherText, size_t *cipherTextLen)
{
  return MEMORY[0x270EFDA70](key, *(void *)&padding, plainText, plainTextLen, cipherText, cipherTextLen);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x270EFDA90](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x270EFDAB0](key, *(void *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int asl_add_log_file(asl_object_t client, int descriptor)
{
  return MEMORY[0x270ED8630](client, *(void *)&descriptor);
}

void asl_close(asl_object_t obj)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x270ED8648](client, msg, *(void *)&level, format);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x270ED8658](ident, facility, *(void *)&opts);
}

int asl_remove_log_file(asl_object_t client, int descriptor)
{
  return MEMORY[0x270ED8660](client, *(void *)&descriptor);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x270F9C680](dest, destLen, source, sourceLen, *(void *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x270F9C688](sourceLen);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

int getlogin_r(char *a1, size_t a2)
{
  return MEMORY[0x270ED9C90](a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x270ED9D38](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x270ED9EB8](*(void *)&a1.s_addr);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}