@interface PRSRankingItemRelativeFeatureContext
+ (id)_predicateForRelativeFeature:(unint64_t)a3 currentTime:(double)a4;
+ (id)_relativeContextsForFeatures:(id)a3 currentTime:(double)a4;
+ (id)_resultComparatorForRelativeFeature:(unint64_t)a3;
+ (id)relativeContextsForBundle:(id)a3 currentTime:(double)a4;
+ (id)relativeContextsForResultSetWithCurrentTime:(double)a3;
+ (void)_associatedPRSL2FeatureFromRelativeFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5;
- (NSPredicate)predicate;
- (PRSRankingItemRelativeFeatureContext)initWithFeature:(unint64_t)a3 currentTime:(double)a4;
- (id)comparator;
- (unsigned)absRankFeature;
- (unsigned)relRankFeature;
- (void)setAbsRankFeature:(unsigned __int16)a3;
- (void)setComparator:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setRelRankFeature:(unsigned __int16)a3;
@end

@implementation PRSRankingItemRelativeFeatureContext

+ (id)relativeContextsForBundle:(id)a3 currentTime:(double)a4
{
  id v5 = a3;
  v6 = +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:&unk_1F1864628 currentTime:a4];
  if ([v5 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    v7 = &unk_1F1864640;
LABEL_9:
    v8 = +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:v7 currentTime:a4];
    id v9 = [v6 arrayByAddingObjectsFromArray:v8];

    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"com.apple.reminders"])
  {
    v7 = &unk_1F1864658;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"com.apple.mobilecal"])
  {
    v7 = &unk_1F1864670;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"com.apple.application"])
  {
    v7 = &unk_1F1864688;
    goto LABEL_9;
  }
  id v9 = v6;
LABEL_10:

  return v9;
}

+ (id)relativeContextsForResultSetWithCurrentTime:(double)a3
{
  return +[PRSRankingItemRelativeFeatureContext _relativeContextsForFeatures:&unk_1F18646A0 currentTime:a3];
}

+ (id)_relativeContextsForFeatures:(id)a3 currentTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PRSRankingItemRelativeFeatureContext initWithFeature:currentTime:]([PRSRankingItemRelativeFeatureContext alloc], "initWithFeature:currentTime:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (void)v14), a4);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)_resultComparatorForRelativeFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 0xEuLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 32);
      goto LABEL_16;
    case 1uLL:
    case 0xFuLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 9);
      goto LABEL_16;
    case 2uLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 17);
      goto LABEL_16;
    case 3uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_87);
      goto LABEL_16;
    case 4uLL:
      (*((void (**)(uint64_t, int))comparatorForDateAttribute + 2))((uint64_t)comparatorForDateAttribute, 29);
      goto LABEL_16;
    case 5uLL:
    case 6uLL:
    case 0x10uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_89);
      goto LABEL_16;
    case 7uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_91);
      goto LABEL_16;
    case 8uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_93);
      goto LABEL_16;
    case 9uLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_95);
      goto LABEL_16;
    case 0xAuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_97);
      goto LABEL_16;
    case 0xBuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_99);
      goto LABEL_16;
    case 0xCuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_101);
      goto LABEL_16;
    case 0xDuLL:
      (*((void (**)(uint64_t, uint64_t))comparatorWithBlock + 2))((uint64_t)comparatorWithBlock, (uint64_t)&__block_literal_global_103);
      v3 = LABEL_16:;
      goto LABEL_17;
    case 0x11uLL:
      id v5 = (void (__cdecl **)())comparatorForPastDateRecency;
      goto LABEL_22;
    case 0x12uLL:
      id v5 = (void (__cdecl **)())comparatorForFutureDateRecency;
LABEL_22:
      v3 = v5[2]();
LABEL_17:
      return v3;
    default:
      +[PRSRankingItemRelativeFeatureContext _resultComparatorForRelativeFeature:]();
  }
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[a2 attributes], 0x11uLL);
  v6 = (int8x8_t *)[v4 attributes];

  id v7 = SSCompactRankingAttrsGetValue(v6, 0x11uLL);
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v7 timeIntervalSinceReferenceDate];
  if (v9 <= v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v9 < v10) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }

  return v12;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributes];
  uint64_t v6 = [v4 attributes];

  uint64_t v12 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x151uLL, (_DWORD *)&v12 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x151uLL, &v12);
  if (*((float *)&v12 + 1) > *(float *)&v12) {
    return 1;
  }
  if (*((float *)&v12 + 1) < *(float *)&v12) {
    return -1;
  }
  uint64_t v11 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x152uLL, (_DWORD *)&v11 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x152uLL, &v11);
  if (*((float *)&v11 + 1) > *(float *)&v11) {
    return 1;
  }
  if (*((float *)&v11 + 1) < *(float *)&v11) {
    return -1;
  }
  uint64_t v10 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x153uLL, (_DWORD *)&v10 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x153uLL, &v10);
  if (*((float *)&v10 + 1) > *(float *)&v10) {
    return 1;
  }
  if (*((float *)&v10 + 1) < *(float *)&v10) {
    return -1;
  }
  uint64_t v9 = 0;
  SSCompactRankingAttrsGetFloat(v5, 0x154uLL, (_DWORD *)&v9 + 1);
  SSCompactRankingAttrsGetFloat(v6, 0x154uLL, &v9);
  if (*((float *)&v9 + 1) >= *(float *)&v9) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (*((float *)&v9 + 1) > *(float *)&v9) {
    return 1;
  }
  else {
    return v8;
  }
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a2 attributes];
  uint64_t v6 = [v4 attributes];
  memset(__dst, 0, sizeof(__dst));
  memset(v14, 0, sizeof(v14));
  uint64_t ArrayInt64 = SSCompactRankingAttrsGetArrayInt64(v5, 0x156uLL, __dst, 4);
  uint64_t v8 = SSCompactRankingAttrsGetArrayInt64(v6, 0x156uLL, v14, 4);
  if (ArrayInt64 && v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      float v10 = (float)*(uint64_t *)((char *)__dst + v9);
      float v11 = (float)*(uint64_t *)((char *)v14 + v9);
      uint64_t v12 = v10 < v11 ? -1 : ArrayInt64;
      uint64_t ArrayInt64 = v10 > v11 ? 1 : v12;
      if (v10 != v11) {
        break;
      }
      v9 += 8;
      if (v9 == 32)
      {
        uint64_t ArrayInt64 = 0;
        break;
      }
    }
  }
  else if (ArrayInt64)
  {
    uint64_t ArrayInt64 = 1;
  }
  else
  {
    uint64_t ArrayInt64 = v8 << 63 >> 63;
  }

  return ArrayInt64;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a2 attributes];
  uint64_t v6 = [v4 attributes];
  memset(__dst, 0, sizeof(__dst));
  memset(v14, 0, sizeof(v14));
  uint64_t ArrayInt64 = SSCompactRankingAttrsGetArrayInt64(v5, 0x155uLL, __dst, 4);
  uint64_t v8 = SSCompactRankingAttrsGetArrayInt64(v6, 0x155uLL, v14, 4);
  if (ArrayInt64 && v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      float v10 = (float)*(uint64_t *)((char *)__dst + v9);
      float v11 = (float)*(uint64_t *)((char *)v14 + v9);
      uint64_t v12 = v10 < v11 ? -1 : ArrayInt64;
      uint64_t ArrayInt64 = v10 > v11 ? 1 : v12;
      if (v10 != v11) {
        break;
      }
      v9 += 8;
      if (v9 == 32)
      {
        uint64_t ArrayInt64 = 0;
        break;
      }
    }
  }
  else if (ArrayInt64)
  {
    uint64_t ArrayInt64 = 1;
  }
  else
  {
    uint64_t ArrayInt64 = v8 << 63 >> 63;
  }

  return ArrayInt64;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (int8x8_t *)[v4 attributes];
  id v7 = (int8x8_t *)[v5 attributes];
  unsigned int v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4CuLL);
  uint64_t v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4CuLL);
  if (v8 && v9)
  {
    float v10 = [v4 L2FeatureVector];
    float v11 = [v5 L2FeatureVector];
    [v10 scoreForFeature:342];
    float v13 = v12;
    [v11 scoreForFeature:342];
    BOOL v15 = v13 <= v14;
    if (v13 != v14) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:341];
    float v17 = v16;
    [v11 scoreForFeature:341];
    BOOL v15 = v17 <= v18;
    if (v17 != v18) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:340];
    float v20 = v19;
    [v11 scoreForFeature:340];
    BOOL v15 = v20 <= v21;
    if (v20 != v21) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:340];
    float v23 = v22;
    [v11 scoreForFeature:340];
    BOOL v15 = v23 <= v24;
    if (v23 == v24)
    {
      uint64_t v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
    }
  }
  else if (v8)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = (uint64_t)((void)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (int8x8_t *)[v4 attributes];
  id v7 = (int8x8_t *)[v5 attributes];
  unsigned int v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4EuLL);
  uint64_t v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4EuLL);
  if (v8 && v9)
  {
    float v10 = [v4 L2FeatureVector];
    float v11 = [v5 L2FeatureVector];
    [v10 scoreForFeature:346];
    float v13 = v12;
    [v11 scoreForFeature:346];
    BOOL v15 = v13 <= v14;
    if (v13 != v14) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:345];
    float v17 = v16;
    [v11 scoreForFeature:345];
    BOOL v15 = v17 <= v18;
    if (v17 != v18) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:344];
    float v20 = v19;
    [v11 scoreForFeature:344];
    BOOL v15 = v20 <= v21;
    if (v20 != v21) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:343];
    float v23 = v22;
    [v11 scoreForFeature:343];
    BOOL v15 = v23 <= v24;
    if (v23 == v24)
    {
      uint64_t v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
    }
  }
  else if (v8)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = (uint64_t)((void)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (int8x8_t *)[v4 attributes];
  id v7 = (int8x8_t *)[v5 attributes];
  unsigned int v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4BuLL);
  uint64_t v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4BuLL);
  if (v8 && v9)
  {
    float v10 = [v4 L2FeatureVector];
    float v11 = [v5 L2FeatureVector];
    [v10 scoreForFeature:338];
    float v13 = v12;
    [v11 scoreForFeature:338];
    BOOL v15 = v13 <= v14;
    if (v13 != v14) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:337];
    float v17 = v16;
    [v11 scoreForFeature:337];
    BOOL v15 = v17 <= v18;
    if (v17 != v18) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:336];
    float v20 = v19;
    [v11 scoreForFeature:336];
    BOOL v15 = v20 <= v21;
    if (v20 != v21) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:335];
    float v23 = v22;
    [v11 scoreForFeature:335];
    BOOL v15 = v23 <= v24;
    if (v23 == v24)
    {
      uint64_t v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
    }
  }
  else if (v8)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = (uint64_t)((void)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (int8x8_t *)[v4 attributes];
  id v7 = (int8x8_t *)[v5 attributes];
  unsigned int v8 = SSCompactRankingAttrsDoesItemExist(v6, 0x4AuLL);
  uint64_t v9 = SSCompactRankingAttrsDoesItemExist(v7, 0x4AuLL);
  if (v8 && v9)
  {
    float v10 = [v4 L2FeatureVector];
    float v11 = [v5 L2FeatureVector];
    [v10 scoreForFeature:334];
    float v13 = v12;
    [v11 scoreForFeature:334];
    BOOL v15 = v13 <= v14;
    if (v13 != v14) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:333];
    float v17 = v16;
    [v11 scoreForFeature:333];
    BOOL v15 = v17 <= v18;
    if (v17 != v18) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:332];
    float v20 = v19;
    [v11 scoreForFeature:332];
    BOOL v15 = v20 <= v21;
    if (v20 != v21) {
      goto LABEL_7;
    }
    [v10 scoreForFeature:331];
    float v23 = v22;
    [v11 scoreForFeature:331];
    BOOL v15 = v23 <= v24;
    if (v23 == v24)
    {
      uint64_t v25 = 0;
    }
    else
    {
LABEL_7:
      if (v15) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
    }
  }
  else if (v8)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = (uint64_t)((void)v9 << 63) >> 63;
  }

  return v25;
}

uint64_t __76__PRSRankingItemRelativeFeatureContext__resultComparatorForRelativeFeature___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = -[PRSRankingItem indexScore](a2);
  unint64_t v7 = v6;
  uint64_t v8 = -[PRSRankingItem indexScore]((uint64_t)v4);
  unint64_t v10 = v9;

  if (__PAIR128__(v7, v5) < __PAIR128__(v10, v8)) {
    return -1;
  }
  else {
    return __PAIR128__(v10, v8) < __PAIR128__(v7, v5);
  }
}

+ (id)_predicateForRelativeFeature:(unint64_t)a3 currentTime:(double)a4
{
  switch(a3)
  {
    case 0uLL:
    case 0xEuLL:
      unint64_t v6 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v7 = 32;
      goto LABEL_9;
    case 1uLL:
    case 0xFuLL:
      unint64_t v6 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v7 = 9;
      goto LABEL_9;
    case 2uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      float v17 = __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke;
      float v18 = &__block_descriptor_40_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
      double v19 = a4;
      uint64_t v5 = &v15;
      goto LABEL_14;
    case 3uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      float v12 = __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_2;
      float v13 = &__block_descriptor_40_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
      double v14 = a4;
      uint64_t v5 = &v10;
      goto LABEL_14;
    case 4uLL:
      unint64_t v6 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v7 = 29;
LABEL_9:
      uint64_t v8 = objc_msgSend(v6, "_predicateForItemsWithAttribute:", v7, a4);
      goto LABEL_15;
    case 5uLL:
    case 0x10uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v5 = (uint64_t *)&__block_literal_global_108;
      goto LABEL_14;
    case 6uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v5 = (uint64_t *)&__block_literal_global_110;
      goto LABEL_14;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v5 = (uint64_t *)&__block_literal_global_112;
      goto LABEL_14;
    case 0xDuLL:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 1, a4);
      goto LABEL_15;
    case 0x11uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v5 = (uint64_t *)&__block_literal_global_116;
      goto LABEL_14;
    case 0x12uLL:
      id v4 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v5 = (uint64_t *)&__block_literal_global_114;
LABEL_14:
      uint64_t v8 = objc_msgSend(v4, "predicateWithBlock:", v5, a4, v10, v11, v12, v13, *(void *)&v14, v15, v16, v17, v18, *(void *)&v19);
LABEL_15:
      return v8;
    default:
      +[PRSRankingItemRelativeFeatureContext _predicateForRelativeFeature:currentTime:]();
  }
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke(uint64_t a1, void *a2)
{
  v3 = SSCompactRankingAttrsGetValue((int8x8_t *)[a2 attributes], 0x11uLL);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 32)];
  if (v3)
  {
    uint64_t v5 = [v3 earlierDate:v4];
    BOOL v6 = v5 == v3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = SSCompactRankingAttrsGetValue((int8x8_t *)[a2 attributes], 0x11uLL);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 32)];
  if (v3)
  {
    uint64_t v5 = [v3 earlierDate:v4];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = SSCompactRankingAttrsGetValue((int8x8_t *)[a2 attributes], 0x43uLL);
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 sectionBundleIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.application"];

  return v3;
}

uint64_t __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 sectionBundleIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.MobileAddressBook"];

  return v3;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_6(uint64_t a1, void *a2)
{
  [a2 closestUpComingDate];
  return v2 != 0.0;
}

BOOL __81__PRSRankingItemRelativeFeatureContext__predicateForRelativeFeature_currentTime___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 mostRecentUsedDate];
  return v2 != 0.0;
}

+ (void)_associatedPRSL2FeatureFromRelativeFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5
{
  if (a3 >= 0x13) {
    +[PRSRankingItemRelativeFeatureContext _associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:]();
  }
  unsigned __int16 v5 = word_1BDC5D74E[a3];
  *a5 = word_1BDC5D728[a3];
  *a4 = v5;
}

- (PRSRankingItemRelativeFeatureContext)initWithFeature:(unint64_t)a3 currentTime:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PRSRankingItemRelativeFeatureContext;
  BOOL v6 = [(PRSRankingItemRelativeFeatureContext *)&v12 init];
  if (v6)
  {
    unsigned __int16 v11 = 3235;
    unsigned __int16 v10 = 3235;
    +[PRSRankingItemRelativeFeatureContext _associatedPRSL2FeatureFromRelativeFeature:a3 absRankFeatureOut:&v11 relRankFeatureOut:&v10];
    [(PRSRankingItemRelativeFeatureContext *)v6 setAbsRankFeature:v11];
    [(PRSRankingItemRelativeFeatureContext *)v6 setRelRankFeature:v10];
    uint64_t v7 = +[PRSRankingItemRelativeFeatureContext _predicateForRelativeFeature:a3 currentTime:a4];
    [(PRSRankingItemRelativeFeatureContext *)v6 setPredicate:v7];

    uint64_t v8 = +[PRSRankingItemRelativeFeatureContext _resultComparatorForRelativeFeature:a3];
    [(PRSRankingItemRelativeFeatureContext *)v6 setComparator:v8];
  }
  return v6;
}

- (unsigned)relRankFeature
{
  return self->_relRankFeature;
}

- (void)setRelRankFeature:(unsigned __int16)a3
{
  self->_relRankFeature = a3;
}

- (unsigned)absRankFeature
{
  return self->_absRankFeature;
}

- (void)setAbsRankFeature:(unsigned __int16)a3
{
  self->_absRankFeature = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (void)_resultComparatorForRelativeFeature:.cold.1()
{
}

+ (void)_predicateForRelativeFeature:currentTime:.cold.1()
{
}

+ (void)_associatedPRSL2FeatureFromRelativeFeature:absRankFeatureOut:relRankFeatureOut:.cold.1()
{
}

@end