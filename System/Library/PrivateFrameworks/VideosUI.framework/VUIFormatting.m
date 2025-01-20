@interface VUIFormatting
+ (id)isoDateFormatter;
+ (id)rfc1123DateFormatter;
+ (id)sharedInstance;
- (VUIFormatting)init;
- (id)formatDate:(id)a3 format:(id)a4;
- (id)formatDuration:(id)a3 format:(id)a4;
- (id)formatInitialsForFirstName:(id)a3 lastName:(id)a4;
- (id)formatLocalizedLocaleIdentifier:(id)a3;
- (id)formatLocalizedNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6 currencyCode:(id)a7;
- (id)formatNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6;
- (id)joinComponents:(id)a3 withASCII:(id)a4 arabic:(id)a5 ethiopic:(id)a6 ideograph:(id)a7;
- (id)joinComponentsWithLocalizedCommaAndSpace:(id)a3;
- (id)joinComponentsWithLocalizedSemicolonAndSpace:(id)a3;
@end

@implementation VUIFormatting

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_sSharedInstance_0;
  return v2;
}

void __31__VUIFormatting_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIFormatting);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;
}

- (VUIFormatting)init
{
  v12.receiver = self;
  v12.super_class = (Class)VUIFormatting;
  v2 = [(VUIFormatting *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dateFormatters = v2->_dateFormatters;
    v2->_dateFormatters = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    numberFormatters = v2->_numberFormatters;
    v2->_numberFormatters = v5;

    v2->_dateFormattersLock._os_unfair_lock_opaque = 0;
    v2->_numberFormattersLock._os_unfair_lock_opaque = 0;
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v7;

    [(NSNumberFormatter *)v2->_durationFormatter setNumberStyle:1];
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    durationPaddedFormatter = v2->_durationPaddedFormatter;
    v2->_durationPaddedFormatter = v9;

    [(NSNumberFormatter *)v2->_durationPaddedFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v2->_durationPaddedFormatter setPositiveFormat:@"00"];
  }
  return v2;
}

- (id)formatLocalizedNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6 currencyCode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v26 = a3;
  id v17 = objc_alloc_init(v16);
  v18 = v17;
  if (v12) {
    [v17 addObject:v12];
  }
  if (v13) {
    [v18 addObject:v13];
  }
  if (v14) {
    [v18 addObject:v14];
  }
  if (v15) {
    [v18 addObject:v15];
  }
  v19 = [v18 valueForKey:@"description"];
  v20 = [v19 componentsJoinedByString:@"|"];

  os_unfair_lock_lock(&self->_numberFormattersLock);
  id v21 = [(NSMutableDictionary *)self->_numberFormatters objectForKey:v20];
  if (!v21)
  {
    if ([v12 isEqualToString:@"noStyle"])
    {
      uint64_t v22 = 0;
    }
    else if ([v12 isEqualToString:@"decimal"])
    {
      uint64_t v22 = 1;
    }
    else if ([v12 isEqualToString:@"currency"])
    {
      uint64_t v22 = 2;
    }
    else if ([v12 isEqualToString:@"percent"])
    {
      uint64_t v22 = 3;
    }
    else if ([v12 isEqualToString:@"scientific"])
    {
      uint64_t v22 = 4;
    }
    else if ([v12 isEqualToString:@"spellOut"])
    {
      uint64_t v22 = 5;
    }
    else
    {
      uint64_t v22 = 1;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v21 setNumberStyle:v22];
    v23 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v21 setLocale:v23];

    if ([v13 length]) {
      [v21 setPositiveFormat:v13];
    }
    if ([v14 length]) {
      [v21 setNegativeFormat:v14];
    }
    if ([v15 length]) {
      [v21 setCurrencyCode:v15];
    }
    if (v21) {
      [(NSMutableDictionary *)self->_numberFormatters setObject:v21 forKey:v20];
    }
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  v24 = [v21 stringFromNumber:v26];

  return v24;
}

+ (id)rfc1123DateFormatter
{
  if (rfc1123DateFormatter_onceToken != -1) {
    dispatch_once(&rfc1123DateFormatter_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  return v2;
}

void __37__VUIFormatting_rfc1123DateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  rfc1123DateFormatter_sRFC1123Formatter = (uint64_t)v0;

  v2 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)rfc1123DateFormatter_sRFC1123Formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
  v4 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

+ (id)isoDateFormatter
{
  if (isoDateFormatter_onceToken != -1) {
    dispatch_once(&isoDateFormatter_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)isoDateFormatter_sISOFormatter;
  return v2;
}

void __33__VUIFormatting_isoDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)isoDateFormatter_sISOFormatter;
  isoDateFormatter_sISOFormatter = (uint64_t)v0;

  v2 = (void *)isoDateFormatter_sISOFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)isoDateFormatter_sISOFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v4 = (void *)isoDateFormatter_sISOFormatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

- (id)formatDate:(id)a3 format:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  uint64_t v8 = [(__CFString *)v6 length];
  v9 = @"default";
  if (v8) {
    v9 = v6;
  }
  v10 = v9;

  os_unfair_lock_lock(&self->_dateFormattersLock);
  id v11 = [(NSMutableDictionary *)self->_dateFormatters objectForKey:v10];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    if ([(__CFString *)v10 isEqualToString:@"default"])
    {
      [v11 setDateStyle:2];
      [v11 setTimeStyle:0];
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C10];
      id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v14 = [v12 dateFormatFromTemplate:v10 options:0 locale:v13];

      [v11 setDateFormat:v14];
      if (!v11) {
        goto LABEL_9;
      }
    }
    [(NSMutableDictionary *)self->_dateFormatters setObject:v11 forKey:v10];
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_dateFormattersLock);
  id v15 = [v11 stringFromDate:v7];

  return v15;
}

- (id)formatDuration:(id)a3 format:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v42 = v5;
  if ([v6 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v5 integerValue];
    goto LABEL_5;
  }
  uint64_t v7 = [v6 rangeOfString:@"k"];
  uint64_t v8 = [v5 integerValue];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    uint64_t v9 = v8 / 3600;
    goto LABEL_6;
  }
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v10 = v8 - 3600 * v9;
  uint64_t v11 = ((unsigned __int128)(v10 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v10;
  uint64_t v12 = v11 >> 5;
  id v13 = (void *)MEMORY[0x1E4F28C10];
  id v14 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v15 = [v13 dateFormatFromTemplate:v6 options:0 locale:v14];
  v16 = (void *)[v15 mutableCopy];

  if (v9 >= 1)
  {
    uint64_t v17 = [v16 rangeOfString:@"HH"];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v17 = [v16 rangeOfString:@"H"], v17 != 0x7FFFFFFFFFFFFFFFLL)
      || (uint64_t v17 = [v16 rangeOfString:@"kk"], v17 != 0x7FFFFFFFFFFFFFFFLL)
      || (uint64_t v17 = [v16 rangeOfString:@"k"], v17 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v19 = v17;
      uint64_t v20 = v18;
      durationFormatter = self->_durationFormatter;
      uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
      v23 = [(NSNumberFormatter *)durationFormatter stringFromNumber:v22];

      objc_msgSend(v16, "replaceCharactersInRange:withString:", v19, v20, v23);
      uint64_t v12 = v11 >> 5;
    }
  }
  unint64_t v24 = v12 + ((unint64_t)v11 >> 63);
  uint64_t v25 = [v16 rangeOfString:@"mm"];
  if (v25 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v25 = [v16 rangeOfString:@"m"], v25 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v27 = v25;
    uint64_t v28 = v26;
    uint64_t v29 = 40;
    if (v9 > 0) {
      uint64_t v29 = 48;
    }
    v30 = (void *)MEMORY[0x1E4F28ED0];
    id v31 = *(id *)((char *)&self->super.isa + v29);
    v32 = [v30 numberWithInteger:v24];
    v33 = [v31 stringFromNumber:v32];

    objc_msgSend(v16, "replaceCharactersInRange:withString:", v27, v28, v33);
  }
  uint64_t v34 = [v16 rangeOfString:@"ss"];
  if (v34 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v34 = [v16 rangeOfString:@"s"], v34 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v36 = v34;
    uint64_t v37 = v35;
    durationPaddedFormatter = self->_durationPaddedFormatter;
    v39 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10 - 60 * v24];
    v40 = [(NSNumberFormatter *)durationPaddedFormatter stringFromNumber:v39];

    objc_msgSend(v16, "replaceCharactersInRange:withString:", v36, v37, v40);
  }

  return v16;
}

- (id)formatNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  v16 = v15;
  if (v10) {
    [v15 addObject:v10];
  }
  if (v11) {
    [v16 addObject:v11];
  }
  if (v12) {
    [v16 addObject:v12];
  }
  uint64_t v17 = [v16 valueForKey:@"description"];
  uint64_t v18 = [v17 componentsJoinedByString:@"_"];

  os_unfair_lock_lock(&self->_numberFormattersLock);
  id v19 = [(NSMutableDictionary *)self->_numberFormatters objectForKey:v18];
  if (!v19)
  {
    if ([v10 isEqualToString:@"noStyle"])
    {
      uint64_t v20 = 0;
    }
    else if ([v10 isEqualToString:@"decimal"])
    {
      uint64_t v20 = 1;
    }
    else if ([v10 isEqualToString:@"currency"])
    {
      uint64_t v20 = 2;
    }
    else if ([v10 isEqualToString:@"percent"])
    {
      uint64_t v20 = 3;
    }
    else if ([v10 isEqualToString:@"scientific"])
    {
      uint64_t v20 = 4;
    }
    else if ([v10 isEqualToString:@"spellOut"])
    {
      uint64_t v20 = 5;
    }
    else
    {
      uint64_t v20 = 1;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v19 setNumberStyle:v20];
    if ([v11 length]) {
      [v19 setPositiveFormat:v11];
    }
    if ([v12 length]) {
      [v19 setNegativeFormat:v12];
    }
    if (v19) {
      [(NSMutableDictionary *)self->_numberFormatters setObject:v19 forKey:v18];
    }
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  id v21 = [v19 stringFromNumber:v14];

  return v21;
}

- (id)formatLocalizedLocaleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 localizedStringForLocaleIdentifier:v3];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v3];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v5 = [v7 localizedStringForLocaleIdentifier:v6];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)joinComponents:(id)a3 withASCII:(id)a4 arabic:(id)a5 ethiopic:(id)a6 ideograph:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v33 = a7;
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v39 = v12 - 1;
    if (v12 == 1)
    {
      id v13 = [v11 objectAtIndexedSubscript:0];
      id v14 = [v13 description];

      goto LABEL_36;
    }
    id v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = v11;
    id obj = v11;
    uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        uint64_t v34 = v19;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v21), "description", v32);
          uint64_t v23 = [v22 length];
          if (v23)
          {
            unint64_t v24 = v23;
            [v16 appendString:v22];
            if (v19 != v39)
            {
              while (1)
              {
                unint64_t v25 = v24 - 1;
                uint64_t v26 = [v22 characterAtIndex:v24 - 1];
                if ([v15 characterIsMember:v26]) {
                  goto LABEL_31;
                }
                if (v24 >= 2 && (v26 & 0xFC00) == 0xDC00)
                {
                  int v27 = [v22 characterAtIndex:v24 - 2];
                  if ((v27 & 0xFC00) != 0xD800) {
                    goto LABEL_23;
                  }
                  LODWORD(v26) = v26 + (v27 << 10) - 56613888;
                  --v24;
                }
                int32x4_t v28 = vdupq_n_s32(v26);
                if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1E38FD970, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E38FD960)))) & 1) != 0|| (v26 & 0xFFFFFF00) == 0x600)
                {
                  uint64_t v29 = v36;
                  goto LABEL_30;
                }
                if ((v26 - 4608) < 0x1A0)
                {
                  uint64_t v29 = v35;
                  goto LABEL_30;
                }
                if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1E38FD9A0, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E38FD980)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1E38FD9B0, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E38FD990))))) & 1) != 0|| (v26 - 194560) < 0x220)
                {
                  uint64_t v29 = v33;
LABEL_30:
                  id v30 = v29;
                  if (v30) {
                    goto LABEL_32;
                  }
                  goto LABEL_31;
                }
                unint64_t v25 = v24 - 1;
LABEL_23:
                unint64_t v24 = v25;
                if (!v25) {
                  goto LABEL_31;
                }
              }
            }
          }
          else if (v19 != v39)
          {
LABEL_31:
            id v30 = v37;
LABEL_32:
            [v16 appendString:v30];
          }
          ++v19;

          ++v21;
        }
        while (v21 != v18);
        uint64_t v19 = v34 + v18;
        uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v18);
    }

    id v14 = (__CFString *)[v16 copy];
    id v11 = v32;
  }
  else
  {
    id v14 = &stru_1F3E921E0;
  }
LABEL_36:

  return v14;
}

- (id)joinComponentsWithLocalizedCommaAndSpace:(id)a3
{
  return [(VUIFormatting *)self joinComponents:a3 withASCII:@", " arabic:@"، " ethiopic:@"፣ " ideograph:@"、"];
}

- (id)joinComponentsWithLocalizedSemicolonAndSpace:(id)a3
{
  return -[VUIFormatting joinComponents:withASCII:arabic:ethiopic:ideograph:](self, "joinComponents:withASCII:arabic:ethiopic:ideograph:", a3, @"; ",
           @"؛ ",
           @"፤ ",
           @"、");
}

- (id)formatInitialsForFirstName:(id)a3 lastName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v7 setGivenName:v5];
    [v7 setFamilyName:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v8 setStyle:4];
    objc_msgSend(v8, "set_ignoresFallbacks:", 1);
    uint64_t v9 = [v8 stringFromPersonNameComponents:v7];
    if (![v9 length])
    {
      id v10 = NSString;
      uint64_t v11 = [v5 length];
      if (v11)
      {
        objc_msgSend(v5, "substringWithRange:", 0, 1);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v12 = &stru_1F3E921E0;
      }
      uint64_t v13 = [v6 length];
      if (v13)
      {
        objc_msgSend(v6, "substringWithRange:", 0, 1);
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = &stru_1F3E921E0;
      }
      id v15 = [v10 stringWithFormat:@"%@%@", v12, v14];

      if (v13) {
      if (v11)
      }

      if ([v15 length])
      {
        uint64_t v9 = v15;
      }
      else
      {

        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v16 = [v9 uppercaseString];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationPaddedFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatters, 0);
  objc_storeStrong((id *)&self->_dateFormatters, 0);
}

@end