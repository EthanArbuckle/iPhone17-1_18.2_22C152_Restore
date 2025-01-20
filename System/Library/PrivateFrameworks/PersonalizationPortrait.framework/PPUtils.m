@interface PPUtils
+ (BOOL)isFirstPartyApp:(id)a3;
+ (BOOL)isInternalDevice;
+ (BOOL)localizedTimeStructForDate:(id)a3 tm:(tm *)a4;
+ (BOOL)localizedTimeStructForSecondsFrom1970:(double)a3 tm:(tm *)a4;
+ (BOOL)yesWithProbability:(double)a3;
+ (double)jaroSimilarityForString:(id)a3 other:(id)a4;
+ (id)Sha256ForData:(id)a3 withSalt:(id)a4;
+ (id)coordinatesToGeoHashWithLength:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5;
+ (id)currentLocaleLanguageCode;
+ (id)formatStringArray:(id)a3 truncatingAtLength:(unint64_t)a4;
+ (id)hexOfBytes:(const void *)a3 size:(unint64_t)a4;
+ (id)hexUUID;
+ (id)osBuild;
+ (id)preferredLanguages;
+ (id)reduceSpotlightDomainIdentifiers:(id)a3;
+ (id)sqliteGlobEscape:(id)a3;
+ (int64_t)compareDouble:(double)a3 withDouble:(double)a4;
+ (int64_t)reverseCompareDouble:(double)a3 withDouble:(double)a4;
+ (void)enumerateChunksOfSize:(unint64_t)a3 fromArray:(id)a4 usingBlock:(id)a5;
@end

@implementation PPUtils

+ (id)coordinatesToGeoHashWithLength:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5
{
  unint64_t v7 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  if (a3 >= 0xD)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PPUtils.m", 148, @"Invalid parameter not satisfying: %@", @"hashLength <= GEOHASH_MAX_LENGTH" object file lineNumber description];
  }
  unint64_t v8 = 0;
  unint64_t v9 = 1 << (5 * v7 - 1);
  double v10 = -90.0;
  double v11 = 90.0;
  double v12 = -180.0;
  double v13 = 180.0;
  do
  {
    double v14 = v12 + (v13 - v12) * 0.5;
    if (v14 <= a5) {
      unint64_t v15 = v9;
    }
    else {
      unint64_t v15 = 0;
    }
    v8 |= v15;
    if (v9 == 1) {
      break;
    }
    if (v14 <= a5) {
      double v12 = v12 + (v13 - v12) * 0.5;
    }
    else {
      double v13 = v12 + (v13 - v12) * 0.5;
    }
    unint64_t v16 = v9 >> 1;
    if (v10 + (v11 - v10) * 0.5 > a4)
    {
      double v11 = v10 + (v11 - v10) * 0.5;
      unint64_t v16 = 0;
    }
    else
    {
      double v10 = v10 + (v11 - v10) * 0.5;
    }
    v8 |= v16;
    BOOL v17 = v9 > 3;
    v9 >>= 2;
  }
  while (v17);
  memset(v25, 0, 13);
  if (v7)
  {
    uint64_t v18 = 5 * v7 - 5;
    v19 = v25;
    do
    {
      *v19++ = geoHashBase32Map[(v8 >> v18) & 0x1F];
      v18 -= 5;
      --v7;
    }
    while (v7);
  }
  v20 = (void *)[[NSString alloc] initWithCString:v25 encoding:4];
  return v20;
}

+ (id)preferredLanguages
{
  if (preferredLanguages__pasOnceToken9 != -1) {
    dispatch_once(&preferredLanguages__pasOnceToken9, &__block_literal_global_58);
  }
  v2 = (void *)preferredLanguages__pasExprOnceResult;
  return v2;
}

void __29__PPUtils_preferredLanguages__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);
  uint64_t v4 = [v1 initWithArray:v3];
  v5 = (void *)preferredLanguages__pasExprOnceResult;
  preferredLanguages__pasExprOnceResult = v4;
}

uint64_t __29__PPUtils_preferredLanguages__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:a2];
}

+ (BOOL)localizedTimeStructForSecondsFrom1970:(double)a3 tm:(tm *)a4
{
  BOOL v5 = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 >= -2147483650.0 && a3 <= 2147483650.0)
  {
    time_t v13 = (uint64_t)a3;
    *__error() = 0;
    unint64_t v7 = localtime_r(&v13, a4);
    BOOL v5 = v7 != 0;
    if (!v7)
    {
      unint64_t v8 = pp_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        double v10 = __error();
        double v11 = strerror(*v10);
        int v12 = *__error();
        *(_DWORD *)buf = 134218498;
        double v15 = a3;
        __int16 v16 = 2080;
        BOOL v17 = v11;
        __int16 v18 = 1024;
        int v19 = v12;
        _os_log_fault_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_FAULT, "localtime_r() failure when converting %.1f : %s (%d)", buf, 0x1Cu);
      }
    }
  }
  return v5;
}

+ (BOOL)localizedTimeStructForDate:(id)a3 tm:(tm *)a4
{
  [a3 timeIntervalSince1970];
  return +[PPUtils localizedTimeStructForSecondsFrom1970:tm:](PPUtils, "localizedTimeStructForSecondsFrom1970:tm:", a4);
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  return [a3 hasPrefix:@"com.apple."];
}

+ (id)sqliteGlobEscape:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"PPUtils.m", 238, @"Invalid parameter not satisfying: %@", @"unescaped" object file lineNumber description];

    v6 = (void *)MEMORY[0x192F97350]();
    goto LABEL_39;
  }
  v6 = (void *)MEMORY[0x192F97350]();
  unint64_t v7 = (__CFString *)v5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v39 = 0u;
  CFIndex Length = CFStringGetLength(v7);
  CFStringRef v46 = v7;
  uint64_t v49 = 0;
  CFIndex v50 = Length;
  theString = v7;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v47 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  int64_t v51 = 0;
  int64_t v52 = 0;
  v48 = CStringPtr;
  if (Length <= 0)
  {

LABEL_39:
    id v12 = v5;
    goto LABEL_40;
  }
  v35 = v6;
  id v36 = v5;
  uint64_t v11 = 0;
  id v12 = 0;
  int64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 64;
  do
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v17 = 4;
    }
    else {
      uint64_t v17 = v13;
    }
    CFIndex v18 = v50;
    if (v50 <= v13) {
      goto LABEL_31;
    }
    if (v47)
    {
      UniChar v19 = v47[v13 + v49];
    }
    else if (v48)
    {
      UniChar v19 = v48[v49 + v13];
    }
    else
    {
      int64_t v20 = v51;
      if (v52 <= v13 || v51 > v13)
      {
        uint64_t v22 = v17 + v11;
        uint64_t v23 = v16 - v17;
        int64_t v24 = v13 - v17;
        CFIndex v25 = v24 + 64;
        if (v24 + 64 >= v50) {
          CFIndex v25 = v50;
        }
        int64_t v51 = v24;
        int64_t v52 = v25;
        if (v50 >= v23) {
          CFIndex v18 = v23;
        }
        v54.length = v18 + v22;
        v54.location = v24 + v49;
        CFStringGetCharacters(v46, v54, buffer);
        int64_t v20 = v51;
      }
      UniChar v19 = buffer[v13 - v20];
    }
    uint64_t v26 = v19;
    uint64_t v27 = (1 << (v19 - 42)) & 0x2000000200001;
    if ((v26 - 42) > 0x31 || v27 == 0)
    {
LABEL_31:
      ++v15;
    }
    else
    {
      v29 = (void *)MEMORY[0x192F97350]();
      if (!v12) {
        id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", -[__CFString length](theString, "length"));
      }
      v30 = -[__CFString substringWithRange:](theString, "substringWithRange:", v14, v15);
      [v12 appendFormat:@"%@[%c]", v30, v26];

      v14 += v15 + 1;
      uint64_t v15 = 0;
    }
    ++v13;
    --v11;
    ++v16;
  }
  while (Length != v13);

  if (!v12)
  {
    v6 = v35;
    id v5 = v36;
    goto LABEL_39;
  }
  if (v15)
  {
    v31 = (void *)MEMORY[0x192F97350]();
    v32 = -[__CFString substringWithRange:](theString, "substringWithRange:", v14, v15);
    [v12 appendString:v32];
  }
  v6 = v35;
  id v5 = v36;
LABEL_40:

  return v12;
}

+ (double)jaroSimilarityForString:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = 1.0;
  if (([v5 isEqualToString:v6] & 1) == 0)
  {
    [v5 length];
    [v6 length];
    unint64_t v8 = objc_opt_new();
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    CFIndex v25 = __41__PPUtils_jaroSimilarityForString_other___block_invoke;
    uint64_t v26 = &unk_1E550E398;
    id v27 = v8;
    v28 = &v29;
    _PASIterateLongChars();
    uint64_t v19 = 0;
    int64_t v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    id v10 = v27;
    _PASIterateLongChars();
    double v7 = (v20[3] / (double)(unint64_t)v12[3]
        + v20[3] / (double)(unint64_t)v30[3]
        + (v20[3] - v16[3]) / v20[3])
       / 3.0;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v29, 8);
  }

  return v7;
}

void __41__PPUtils_jaroSimilarityForString_other___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x192F97350]();
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInt:a2];
  double v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    unint64_t v8 = objc_opt_new();
    unint64_t v9 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithUnsignedInt:a2];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [NSNumber numberWithUnsignedInt:a2];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v13 addObject:v14];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __41__PPUtils_jaroSimilarityForString_other___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x192F97350]();
  id v5 = (void *)a1[4];
  id v6 = [NSNumber numberWithUnsignedInt:a2];
  double v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7) {
    goto LABEL_17;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v8 = (void *)a1[4];
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", a2, 0);
  id v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v11)
  {

    goto LABEL_17;
  }
  uint64_t v12 = v11;
  char v13 = 0;
  uint64_t v14 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v18 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if ((unint64_t)([v16 unsignedIntegerValue] - *(void *)(*(void *)(a1[5] + 8) + 24)) <= a1[8])
      {
        if ([v16 unsignedIntegerValue] != *(void *)(*(void *)(a1[5] + 8) + 24))
        {
          *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + 1.0;

LABEL_15:
          *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + 1.0;
          goto LABEL_17;
        }
        char v13 = 1;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12) {
      continue;
    }
    break;
  }

  if (v13) {
    goto LABEL_15;
  }
LABEL_17:
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
}

+ (id)reduceSpotlightDomainIdentifiers:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PPUtils.m", 187, @"Invalid parameter not satisfying: %@", @"domainIdentifiers" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x192F97350]();
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F93B20]) initWithDomainsFromArray:v5];
  unint64_t v8 = [v7 allDomains];
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v11 = [v8 sortedArrayUsingDescriptors:v10];

  return v11;
}

+ (id)currentLocaleLanguageCode
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v4 = [v3 localeIdentifier];
  id v5 = [v2 componentsFromLocaleIdentifier:v4];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  return v6;
}

+ (BOOL)yesWithProbability:(double)a3
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < a3;
}

+ (id)formatStringArray:(id)a3 truncatingAtLength:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x192F97350]();
  if ([v5 count] > a4)
  {
    double v7 = objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    uint64_t v8 = [v7 arrayByAddingObject:@"..."];

    id v5 = (id)v8;
  }
  id v9 = [NSString alloc];
  id v10 = objc_msgSend(v5, "_pas_componentsJoinedByString:", @", ");
  uint64_t v11 = (void *)[v9 initWithFormat:@"[ %@ ]", v10];

  return v11;
}

+ (int64_t)reverseCompareDouble:(double)a3 withDouble:(double)a4
{
  return [a1 compareDouble:a4 withDouble:a3];
}

+ (int64_t)compareDouble:(double)a3 withDouble:(double)a4
{
  if (a3 >= a4) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = -1;
  }
  if (a3 > a4) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (id)hexUUID
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  v2 = objc_opt_new();
  [v2 getUUIDBytes:v5];

  v3 = +[PPUtils hexOfBytes:v5 size:16];
  return v3;
}

+ (id)hexOfBytes:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v6 = 2 * a4;
  double v7 = (char *)malloc_type_malloc(2 * a4, 0x33078D37uLL);
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v12);
  }
  if (v4)
  {
    uint64_t v8 = v7 + 1;
    do
    {
      *(v8 - 1) = charOfNibble[(unint64_t)*(unsigned __int8 *)a3 >> 4];
      char v9 = *(unsigned char *)a3;
      a3 = (char *)a3 + 1;
      *uint64_t v8 = charOfNibble[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  id v10 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:v6 encoding:4 freeWhenDone:1];
  return v10;
}

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  memset(&v13, 0, sizeof(v13));
  id v6 = a3;
  CC_SHA256_Init(&v13);
  id v7 = v6;
  uint64_t v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(void *)&v13.wbuf[14]);
  CC_LONG v9 = [v7 length];

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    id v10 = v5;
    CC_SHA256_Update(&v13, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  *(_OWORD *)md = 0u;
  long long v15 = 0u;
  CC_SHA256_Final(md, &v13);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

  return v11;
}

+ (id)osBuild
{
  if (osBuild__pasOnceToken3 != -1) {
    dispatch_once(&osBuild__pasOnceToken3, &__block_literal_global_2736);
  }
  v2 = (void *)osBuild__pasExprOnceResult;
  return v2;
}

void __18__PPUtils_osBuild__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  id v1 = [MEMORY[0x1E4F93B10] currentOsBuild];
  if (v1)
  {
    uint64_t v2 = [@"iOS-" stringByAppendingString:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  v3 = (void *)osBuild__pasExprOnceResult;
  osBuild__pasExprOnceResult = v2;
}

+ (BOOL)isInternalDevice
{
  return MEMORY[0x1F40CD650]("com.apple.suggestions.suggestd", a2);
}

+ (void)enumerateChunksOfSize:(unint64_t)a3 fromArray:(id)a4 usingBlock:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, id, unsigned char *))a5;
  if (!a3)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"PPUtils.m" lineNumber:27 description:@"Chunk size must be nonzero"];
  }
  if ([v9 count])
  {
    if ([v9 count] <= a3)
    {
      char v19 = 0;
      v10[2](v10, v9, &v19);
    }
    else
    {
      unint64_t v11 = 0;
      do
      {
        if (v11 >= [v9 count]) {
          break;
        }
        id v12 = (void *)MEMORY[0x192F97350]();
        unsigned __int8 v18 = 0;
        uint64_t v13 = [v9 count];
        unint64_t v14 = v13 - v11 >= a3 ? a3 : v13 - v11;
        long long v15 = objc_msgSend(v9, "subarrayWithRange:", v11, v14);
        v10[2](v10, v15, &v18);

        v11 += v14;
        int v16 = v18;
      }
      while (!v16);
    }
  }
}

@end