@interface PPMetricsUtils
+ (id)filterBundleId:(id)a3;
+ (id)filterGroupIdAllowance:(id)a3;
+ (id)loggingQueue;
+ (id)stringifyDomain:(unsigned __int8)a3;
+ (id)stringifyFeedbackDomainStatus:(unsigned __int8)a3;
+ (id)stringifyFeedbackType:(unsigned int)a3;
+ (id)truncatedClientBundleId:(id)a3;
+ (id)truncatedClientBundleIdOrCurrentBundleId:(id)a3;
+ (int)mapDomainForPET2:(unsigned __int8)a3;
+ (int)mapLocationAlgorithmForPET2:(unsigned __int16)a3;
+ (int)mapNamedEntityAlgorithmForPET2:(unint64_t)a3;
+ (int)mapNamedEntityCategory:(unint64_t)a3;
+ (int)mapTopicAlgorithmForPET2:(unint64_t)a3;
+ (int)mapTopicDonationErrorForPET2:(int64_t)a3;
+ (int)sourceForBundleId:(id)a3;
@end

@implementation PPMetricsUtils

+ (id)loggingQueue
{
  if (loggingQueue__pasOnceToken2 != -1) {
    dispatch_once(&loggingQueue__pasOnceToken2, &__block_literal_global_19133);
  }
  v2 = (void *)loggingQueue__pasExprOnceResult;
  return v2;
}

+ (id)filterGroupIdAllowance:(id)a3
{
  v20[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F8A140];
  v12[0] = *MEMORY[0x1E4F8A138];
  v12[1] = v3;
  v20[0] = v12[0];
  v20[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F8A150];
  uint64_t v13 = *MEMORY[0x1E4F8A148];
  uint64_t v14 = v4;
  v20[2] = v13;
  v20[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F8A168];
  uint64_t v15 = *MEMORY[0x1E4F8A158];
  uint64_t v16 = v5;
  v20[4] = v15;
  v20[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F8A160];
  uint64_t v17 = *MEMORY[0x1E4F8A170];
  uint64_t v18 = v6;
  v20[6] = v17;
  v20[7] = v6;
  uint64_t v19 = *MEMORY[0x1E4F8A178];
  v20[8] = v19;
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:v20 forKeys:v12 count:9];
  v10 = [v9 objectForKeyedSubscript:v8];

  return v10;
}

+ (id)truncatedClientBundleIdOrCurrentBundleId:(id)a3
{
  uint64_t v4 = [a3 bundleIdentifierOrProcessName:0];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v5 bundleIdentifier];
  }
  uint64_t v6 = [a1 truncatedClientBundleId:v4];

  return v6;
}

+ (id)truncatedClientBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  if (v3)
  {
    uint64_t v5 = [v3 componentsSeparatedByString:@"."];
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);

      id v3 = (id)v6;
    }
    if ((unint64_t)[v3 length] >= 0x19)
    {
      uint64_t v7 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 24);

      id v3 = (id)v7;
    }
    id v8 = (__CFString *)v3;
  }
  else
  {
    id v8 = @"unknown";
  }
  return v8;
}

+ (id)stringifyFeedbackDomainStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 4) {
    return @"NotInDomain";
  }
  else {
    return off_1E65D9A50[(a3 - 1)];
  }
}

+ (id)stringifyDomain:(unsigned __int8)a3
{
  if ((a3 - 1) > 6) {
    return @"Topics";
  }
  else {
    return off_1E65D9A18[(a3 - 1)];
  }
}

+ (id)stringifyFeedbackType:(unsigned int)a3
{
  if (a3 > 5) {
    return @"Undefined";
  }
  else {
    return off_1E65D99E8[a3];
  }
}

+ (int)sourceForBundleId:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (sourceForBundleId___pasOnceToken3 != -1) {
    dispatch_once(&sourceForBundleId___pasOnceToken3, &__block_literal_global_67_19114);
  }
  id v4 = (id)sourceForBundleId___pasExprOnceResult;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  if (v5)
  {
LABEL_17:
    int v12 = [v5 intValue];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = objc_msgSend((id)*MEMORY[0x1E4F8A118], "objectForKeyedSubscript:", v3, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (v11)
          {
            uint64_t v5 = (void *)v11;

            goto LABEL_17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if ([v3 rangeOfString:@"com.apple." options:10] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v3) {
        int v12 = 17;
      }
      else {
        int v12 = 18;
      }
    }
    else
    {
      uint64_t v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138739971;
        id v20 = v3;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPMetricsUtils: unknown first-party source %{sensitive}@", buf, 0xCu);
      }

      int v12 = 16;
    }
  }

  return v12;
}

void __36__PPMetricsUtils_sourceForBundleId___block_invoke()
{
  v14[21] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = *MEMORY[0x1E4F8A0B8];
  v13[0] = *MEMORY[0x1E4F8A0E8];
  v13[1] = v1;
  v14[0] = &unk_1F2569578;
  v14[1] = &unk_1F2569590;
  uint64_t v2 = *MEMORY[0x1E4F8A0A8];
  v13[2] = *MEMORY[0x1E4F8A098];
  v13[3] = v2;
  v14[2] = &unk_1F25695A8;
  v14[3] = &unk_1F25695C0;
  uint64_t v3 = *MEMORY[0x1E4F8A0D0];
  v13[4] = *MEMORY[0x1E4F8A0F8];
  v13[5] = v3;
  v14[4] = &unk_1F25695D8;
  v14[5] = &unk_1F25695F0;
  uint64_t v4 = *MEMORY[0x1E4F8A0D8];
  v13[6] = *MEMORY[0x1E4F8A068];
  v13[7] = v4;
  v14[6] = &unk_1F2569608;
  v14[7] = &unk_1F2569620;
  uint64_t v5 = *MEMORY[0x1E4F8A0C8];
  v13[8] = *MEMORY[0x1E4F8A040];
  v13[9] = v5;
  v14[8] = &unk_1F2569638;
  v14[9] = &unk_1F2569650;
  uint64_t v6 = *MEMORY[0x1E4F8A0A0];
  v13[10] = *MEMORY[0x1E4F8A0C0];
  v13[11] = v6;
  v14[10] = &unk_1F2569668;
  v14[11] = &unk_1F2569680;
  uint64_t v7 = *MEMORY[0x1E4F8A0E0];
  v13[12] = *MEMORY[0x1E4F8A050];
  v13[13] = v7;
  v14[12] = &unk_1F2569698;
  v14[13] = &unk_1F25696B0;
  uint64_t v8 = *MEMORY[0x1E4F8A048];
  v13[14] = *MEMORY[0x1E4F8A058];
  v13[15] = v8;
  v14[14] = &unk_1F25696C8;
  v14[15] = &unk_1F25696E0;
  uint64_t v9 = *MEMORY[0x1E4F8A060];
  v13[16] = *MEMORY[0x1E4F8A120];
  v13[17] = v9;
  v14[16] = &unk_1F25696F8;
  v14[17] = &unk_1F2569710;
  uint64_t v10 = *MEMORY[0x1E4F8A108];
  v13[18] = *MEMORY[0x1E4F8A0B0];
  v13[19] = v10;
  v14[18] = &unk_1F2569728;
  v14[19] = &unk_1F2569740;
  v13[20] = *MEMORY[0x1E4F8A110];
  v14[20] = &unk_1F2569758;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:21];
  int v12 = (void *)sourceForBundleId___pasExprOnceResult;
  sourceForBundleId___pasExprOnceResult = v11;
}

+ (id)filterBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple"])
  {
    objc_msgSend(v3, "_pas_stringBackedByUTF8CString");
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = @"Third-Party";
  }

  return v4;
}

+ (int)mapDomainForPET2:(unsigned __int8)a3
{
  if ((a3 - 1) < 7) {
    return (a3 - 1) + 1;
  }
  else {
    return 0;
  }
}

+ (int)mapTopicDonationErrorForPET2:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return 8;
  }
  else {
    return dword_1CAB7BD98[a3];
  }
}

+ (int)mapTopicAlgorithmForPET2:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return 0;
  }
  else {
    return dword_1CAB7BD6C[a3 - 1];
  }
}

+ (int)mapLocationAlgorithmForPET2:(unsigned __int16)a3
{
  if ((a3 - 1) > 0xB) {
    return 0;
  }
  else {
    return dword_1CAB7BD3C[(unsigned __int16)(a3 - 1)];
  }
}

+ (int)mapNamedEntityCategory:(unint64_t)a3
{
  if (a3 - 1 < 0x15) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (int)mapNamedEntityAlgorithmForPET2:(unint64_t)a3
{
  if (a3 - 1 > 0x10) {
    return 0;
  }
  else {
    return dword_1CAB7BCF8[a3 - 1];
  }
}

void __30__PPMetricsUtils_loggingQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.PersonalizationPortrait.storeMetricsLogging", v2);
  uint64_t v4 = (void *)loggingQueue__pasExprOnceResult;
  loggingQueue__pasExprOnceResult = (uint64_t)v3;
}

@end