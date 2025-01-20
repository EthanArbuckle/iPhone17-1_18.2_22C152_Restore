void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_130);
  }
  v0 = (void *)logHandle_handle;
  return v0;
}

const void *symbolicColorForLegacyRGB(CFStringRef theString)
{
  if (symbolicColorForLegacyRGB_onceToken != -1) {
    dispatch_once(&symbolicColorForLegacyRGB_onceToken, &__block_literal_global_0);
  }
  if (CFStringGetLength(theString) == 9)
  {
    v4.location = 0;
    v4.length = 7;
    theString = CFStringCreateWithSubstring(0, theString, v4);
  }
  else
  {
    CFRetain(theString);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, theString);
  CFRelease(theString);
  return Value;
}

void __symbolicColorForLegacyRGB_block_invoke()
{
  symbolicColorForLegacyRGB_legacyColorMapping = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#0252D4", @"blue");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#492BA1", @"purple");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#F57802", @"orange");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#2CA10B", @"green");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#E51717", @"red");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#0F4D8C", @"blue");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#670A6C", @"purple");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#E56200", @"orange");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#2F8D00", @"green");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#B5000D", @"red");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#0E61B9", @"blue");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#711A76", @"purple");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#EC4400", @"orange");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#44A703", @"green");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#B90E28", @"red");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#0E61B9", @"blue");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#711A76", @"purple");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#F64F00", @"orange");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#44A703", @"green");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#B90E28", @"red");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#E6C800", @"yellow");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#882F00", @"brown");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#1BADF8", @"blue");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#CC73E1", @"purple");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#FF9500", @"orange");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#63DA38", @"green");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#FF2968", @"red");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#FFCC00", @"yellow");
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, @"#A2845E", @"brown");
  v0 = (__CFDictionary *)symbolicColorForLegacyRGB_legacyColorMapping;
  CFDictionarySetValue(v0, @"#EABB00", @"yellow");
}

void sub_1DB9C76C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB9CAB48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void iCalendarAppendStringToStringWithOptions(void *a1, void *a2, char a3)
{
  id v7 = a1;
  id v5 = a2;
  if (v7)
  {
    if ((a3 & 0x20) != 0)
    {
      v6 = ICSRedactString(v7);
      [v5 appendString:v6];
    }
    else
    {
      [v5 appendString:v7];
    }
  }
}

__CFString *iCalendarRepresentationForCALDay(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"ERROR";
  }
  else {
    return off_1E6C25938[a1 - 1];
  }
}

void sub_1DB9D22D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB9D6620(_Unwind_Exception *a1)
{
}

id VCSLogHandle()
{
  if (VCSLogHandle_onceToken != -1) {
    dispatch_once(&VCSLogHandle_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)VCSLogHandle_handle;
  return v0;
}

uint64_t __VCSLogHandle_block_invoke()
{
  VCSLogHandle_handle = (uint64_t)os_log_create("com.apple.vCalendar", "VCS");
  return MEMORY[0x1F41817F8]();
}

id ICSRedactString(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  ICSRedactBytes((const void *)[v1 bytes], objc_msgSend(v1, "length"), v4);
  v2 = (void *)[[NSString alloc] initWithBytes:v4 length:20 encoding:4];

  return v2;
}

void ICSRedactBytes(const void *a1, CC_LONG a2, _WORD *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = (void *)_testModeSalt;
  if (!_testModeSalt)
  {
    if (_uniqueSaltForThisMachine_onceToken != -1) {
      dispatch_once(&_uniqueSaltForThisMachine_onceToken, &__block_literal_global_6);
    }
    v6 = (void *)_uniqueSaltForThisMachine_saltData;
  }
  id v7 = v6;
  memset(&v13, 0, sizeof(v13));
  CC_SHA256_Init(&v13);
  id v8 = v7;
  CC_SHA256_Update(&v13, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  CC_SHA256_Update(&v13, a1, a2);
  CC_SHA256_Final(md, &v13);
  uint64_t v9 = 0;
  uint64_t v10 = md[8];
  *a3 = -24592;
  a3[1] = _pictureForByte_table[v10];
  v11 = (char *)a3 + 5;
  do
  {
    unint64_t v12 = md[v9];
    *(v11 - 1) = _nibbleToChar_byteMap[v12 >> 4];
    unsigned char *v11 = _nibbleToChar_byteMap[v12 & 0xF];
    v11 += 2;
    ++v9;
  }
  while (v9 != 8);
}

uint64_t _pictureForByte(uint64_t result, _WORD *a2)
{
  *a2 = -24592;
  a2[1] = _pictureForByte_table[result];
  return result;
}

id ICSAppendEmoji(void *a1)
{
  id v1 = a1;
  v5[0] = -24592;
  v5[1] = _pictureForByte_table[[v1 hash]];
  v2 = (void *)[[NSString alloc] initWithBytes:v5 length:4 encoding:4];
  v3 = [v1 stringByAppendingString:v2];

  return v3;
}

void ICSRedactionSetTestModeEnabled(int a1)
{
  if (a1)
  {
    char v4 = 4;
    uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:1];
    v2 = (void *)_testModeSalt;
    _testModeSalt = v1;
  }
  else
  {
    v3 = (void *)_testModeSalt;
    _testModeSalt = 0;
  }
}

void ___uniqueSaltForThisMachine_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  CFAllocatorRef alloc = [v0 objectForKey:@"icaluuid"];

  if (!alloc)
  {
    CFUUIDRef v1 = CFUUIDCreate(0);
    CFAllocatorRef alloc = (CFAllocatorRef)CFUUIDCreateString(0, v1);
    CFRelease(v1);
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v2 setObject:alloc forKey:@"icaluuid"];

    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 synchronize];
  }
  char v4 = [(__CFAllocator *)alloc dataUsingEncoding:4];
  uint64_t v5 = [v4 copy];
  v6 = (void *)_uniqueSaltForThisMachine_saltData;
  _uniqueSaltForThisMachine_saltData = v5;
}

void *VCSByteBufferWithCapacity(NSUInteger a1)
{
  v2 = NSZoneMalloc(0, 0x18uLL);
  if (a1 <= 1) {
    a1 = 1;
  }
  v3 = NSZoneMalloc(0, a1);
  v2[1] = 0;
  v2[2] = a1;
  void *v2 = v3;
  return v2;
}

void VCSByteBufferAppendByte(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 && v5 <= 0x7FFFFFFE)
  {
    unint64_t v5 = 2 * v4;
    id v7 = NSZoneRealloc(0, *(void **)a1, 2 * v4);
    if (v7)
    {
      *(void *)a1 = v7;
      *(void *)(a1 + 16) = v5;
    }
    else
    {
      unint64_t v5 = *(void *)(a1 + 16);
    }
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 == v5)
  {
    uint64_t v9 = VCSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      VCSByteBufferAppendByte_cold_1(a1, v9);
    }
  }
  else
  {
    uint64_t v10 = *(unsigned char **)a1;
    *(void *)(a1 + 8) = v8 + 1;
    v10[v8] = a2;
  }
}

void VCSByteBufferAppendCString(uint64_t a1, char *a2)
{
  char v2 = *a2;
  if (*a2)
  {
    uint64_t v4 = (unsigned __int8 *)(a2 + 1);
    do
    {
      VCSByteBufferAppendByte(a1, v2);
      int v5 = *v4++;
      char v2 = v5;
    }
    while (v5);
  }
}

id VCSByteBufferData(void *a1)
{
  char v2 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*a1 length:a1[1]];
  NSZoneFree(0, a1);
  return v2;
}

id ICSDefaultPRODID()
{
  if (ICSDefaultPRODID_onceToken != -1) {
    dispatch_once(&ICSDefaultPRODID_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)ICSDefaultPRODID_defaultPRODID;
  return v0;
}

void __ICSDefaultPRODID_block_invoke()
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"-//Apple Inc."];
  v0 = (void *)_CFCopySystemVersionDictionary();
  CFUUIDRef v1 = v0;
  if (v0)
  {
    char v2 = [v0 objectForKey:*MEMORY[0x1E4F1CD18]];
    v3 = v2;
    if (v2 && [v2 length])
    {
      [v8 appendFormat:@"//%@", v3];
      uint64_t v4 = [v1 objectForKey:*MEMORY[0x1E4F1CD30]];
      int v5 = v4;
      if (v4 && [v4 length]) {
        [v8 appendFormat:@" %@", v5];
      }
    }
  }
  [v8 appendString:@"//EN"];
  uint64_t v6 = [v8 copy];
  id v7 = (void *)ICSDefaultPRODID_defaultPRODID;
  ICSDefaultPRODID_defaultPRODID = v6;
}

void sub_1DB9DCA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
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

uint64_t __logHandle_block_invoke()
{
  logHandle_handle = (uint64_t)os_log_create("com.apple.calendar.iCalendar", "ICSTimeZoneTranslator");
  return MEMORY[0x1F41817F8]();
}

CFDataRef ICSDecodeBase64(const __CFAllocator *a1, CFStringRef theString)
{
  if (theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x201u);
    if (CStringPtr) {
      CharactersPtr = 0;
    }
    else {
      CharactersPtr = CFStringGetCharactersPtr(theString);
    }
    CFIndex Length = CFStringGetLength(theString);
    CFAllocatorRef bytesDeallocator = a1;
    uint64_t v9 = (const UInt8 *)CFAllocatorAllocate(a1, 3 * Length / 4 + 1, 0);
    if (Length < 1)
    {
      CFIndex v14 = 0;
    }
    else
    {
      int v10 = 0;
      CFIndex v11 = 0;
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      CFIndex v14 = 0;
      do
      {
        if (CStringPtr)
        {
          int v16 = *(unsigned __int8 *)CStringPtr++;
          int CharacterAtIndex = v16;
        }
        else
        {
          CStringPtr = 0;
          if (CharactersPtr)
          {
            int v17 = *(unsigned __int8 *)CharactersPtr++;
            int CharacterAtIndex = v17;
          }
          else
          {
            int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v11);
          }
        }
        if (CharacterAtIndex == 61) {
          ++v12;
        }
        int v18 = __CFPLDataDecodeTable[CharacterAtIndex & 0x7F];
        if ((v18 & 0x80000000) == 0)
        {
          ++v13;
          int v10 = v18 + (v10 << 6);
          if ((v13 & 3) == 0)
          {
            v9[v14] = BYTE2(v10);
            if (v12 > 1)
            {
              ++v14;
            }
            else
            {
              CFIndex v19 = v14 + 2;
              v9[v14 + 1] = BYTE1(v10);
              if (v12)
              {
                v14 += 2;
              }
              else
              {
                v14 += 3;
                v9[v19] = v10;
              }
            }
          }
        }
        ++v11;
      }
      while (Length != v11);
    }
    return CFDataCreateWithBytesNoCopy(bytesDeallocator, v9, v14, bytesDeallocator);
  }
  else
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
    return (CFDataRef)objc_alloc_init(v6);
  }
}

CFStringRef ICSEncodeBase64(const __CFAllocator *a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  uint64_t v6 = (const char *)CFAllocatorAllocate(a1, 2 * (4 * Length / 3) + 4, 0);
  if (Length < 1)
  {
    int v7 = 0;
    goto LABEL_18;
  }
  int v7 = 0;
  unint64_t v8 = 0;
  CFIndex v9 = Length;
  do
  {
    unint64_t v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      int v12 = v7 + 1;
      v6[v7] = __CFPLDataEncodeTable[((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 6) & 0x3F];
      unint64_t v11 = *BytePtr & 0x3F;
      int v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        unint64_t v11 = ((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10) {
          goto LABEL_11;
        }
        unint64_t v11 = (unint64_t)*BytePtr >> 2;
      }
      int v13 = 1;
      int v12 = v7;
    }
    v7 += v13;
    v6[v12] = __CFPLDataEncodeTable[v11];
LABEL_11:
    ++v8;
    ++BytePtr;
    --v9;
  }
  while (v9);
  if (Length % 3uLL == 2)
  {
    char v16 = __CFPLDataEncodeTable[4 * (*(BytePtr - 1) & 0xF)];
    int v15 = 2;
    unsigned int v17 = 1;
    int v14 = v7;
LABEL_17:
    uint64_t v18 = v17 + (uint64_t)v7;
    v6[v14] = v16;
    v7 += v15;
    v6[v18] = 61;
  }
  else if (Length % 3uLL == 1)
  {
    int v14 = v7 + 1;
    v6[v7] = __CFPLDataEncodeTable[16 * (*(BytePtr - 1) & 3)];
    int v15 = 3;
    char v16 = 61;
    unsigned int v17 = 2;
    goto LABEL_17;
  }
LABEL_18:
  v6[v7] = 0;
  return CFStringCreateWithCStringNoCopy(a1, v6, 0x600u, a1);
}

__CFString *stringForEntityStatus(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", a1);
    CFUUIDRef v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFUUIDRef v1 = off_1E6C25C48[a1];
  }
  return v1;
}

__CFString *stringForEntityTransparency(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", a1);
    CFUUIDRef v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFUUIDRef v1 = off_1E6C25C90[a1];
  }
  return v1;
}

__CFString *stringForEntityClassification(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", a1);
    CFUUIDRef v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFUUIDRef v1 = off_1E6C25CB8[a1];
  }
  return v1;
}

uint64_t strncmp_s(const char *a1, const char *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  size_t v6 = strlen(a1);
  if (!a2 || v6 < a3 || strlen(a2) < a3) {
    return 0xFFFFFFFFLL;
  }
  return strncmp(a1, a2, a3);
}

uint64_t vcsTokenCompare(const char *a1, uint64_t a2)
{
  return strcasecmp(a1, *(const char **)(a2 + 8));
}

uint64_t vcsPropertyCompare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void VCSByteBufferAppendByte_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB9BF000, a2, OS_LOG_TYPE_ERROR, "Cannot append any more bytes to buffer at %p.", (uint8_t *)&v2, 0xCu);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7318](zone, ptr, size);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BF0](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}