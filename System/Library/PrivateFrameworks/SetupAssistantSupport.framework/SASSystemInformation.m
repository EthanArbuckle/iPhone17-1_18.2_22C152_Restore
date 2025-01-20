@interface SASSystemInformation
+ (id)deviceClass;
+ (id)productType;
+ (id)productVersion;
+ (id)storageAvailable;
+ (id)storageCapacity;
+ (int64_t)compareProductVersion:(id)a3 toProductVersion:(id)a4;
@end

@implementation SASSystemInformation

+ (id)productVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    v4 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD30]), "copy");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)deviceClass
{
  return (id)MGCopyAnswer();
}

+ (id)productType
{
  return (id)MGCopyAnswer();
}

+ (id)storageAvailable
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();
  CFDictionaryRef v3 = [v2 objectForKey:*MEMORY[0x1E4FBA0E8]];

  return v3;
}

+ (id)storageCapacity
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();
  CFDictionaryRef v3 = [v2 objectForKey:*MEMORY[0x1E4FBA0F0]];

  return v3;
}

+ (int64_t)compareProductVersion:(id)a3 toProductVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:v6])
  {
    int64_t v7 = 0;
  }
  else
  {
    v8 = [v5 componentsSeparatedByString:@"."];
    v9 = [v6 componentsSeparatedByString:@"."];
    uint64_t v10 = [v8 count];
    if (v10 | [v9 count])
    {
      unint64_t v11 = 0;
      int64_t v7 = 1;
      while (1)
      {
        if ([v8 count] <= v11)
        {
          int v13 = 0;
        }
        else
        {
          v12 = [v8 objectAtIndexedSubscript:v11];
          int v13 = [v12 intValue];
        }
        if ([v9 count] <= v11)
        {
          int v15 = 0;
        }
        else
        {
          v14 = [v9 objectAtIndexedSubscript:v11];
          int v15 = [v14 intValue];
        }
        if (v13 > v15) {
          break;
        }
        if (v13 < v15)
        {
          int64_t v7 = -1;
          break;
        }
        ++v11;
        unint64_t v16 = [v8 count];
        unint64_t v17 = [v9 count];
        if (v16 <= v17) {
          unint64_t v18 = v17;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18 <= v11) {
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      int64_t v7 = 0;
    }
  }
  return v7;
}

@end