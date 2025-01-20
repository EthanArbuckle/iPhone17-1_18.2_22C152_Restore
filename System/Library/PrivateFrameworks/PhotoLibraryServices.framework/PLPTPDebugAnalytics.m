@interface PLPTPDebugAnalytics
+ (BOOL)_isRender:(id)a3;
+ (void)countResourceTypes:(id)a3;
+ (void)reportResourceCounts;
@end

@implementation PLPTPDebugAnalytics

+ (void)reportResourceCounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"PLPTPAssetManager resource counts for assets: %lu==>\n", totalAssetCount);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)resourceCountsByType;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        switch([v8 unsignedIntegerValue])
        {
          case 0:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"photo: %@\n", v9];
            break;
          case 1:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"adj: %@\n", v9];
            break;
          case 2:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:&unk_1EEBEFCF0];
            [v2 appendFormat:@"sec_adj: %@\n", v9];
            break;
          case 4:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"full_photo: %@\n", v9];
            break;
          case 5:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"full_video: %@\n", v9];
            break;
          case 6:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"soc_photo: %@\n", v9];
            break;
          case 7:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"soc_video: %@\n", v9];
            break;
          case 8:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"soc_paired_video: %@\n", v9];
            break;
          case 9:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"orig_adj: %@\n", v9];
            break;
          case 10:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"base_photo: %@\n", v9];
            break;
          case 11:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"base_video: %@\n", v9];
            break;
          case 12:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"video: %@\n", v9];
            break;
          case 13:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"paired_video: %@\n", v9];
            break;
          case 14:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"full_paired_video: %@\n", v9];
            break;
          case 15:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"audio: %@\n", v9];
            break;
          case 16:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"raw: %@\n", v9];
            break;
          case 17:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"xmp: %@\n", v9];
            break;
          case 18:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"adj_overflow: %@\n", v9];
            break;
          case 19:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"diag: %@\n", v9];
            break;
          case 20:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"photo_proxy: %@\n", v9];
            break;
          case 21:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"alch: %@\n", v9];
            break;
          case 22:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:v8];
            [v2 appendFormat:@"base_paired_video: %@\n", v9];
            break;
          case 23:
            v9 = [(id)resourceCountsByType objectForKeyedSubscript:&unk_1EEBEFD08];
            [v2 appendFormat:@"unknown: %@\n", v9];
            break;
          default:
            v9 = PLPTPGetLog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v10 = [v8 unsignedIntegerValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v18 = v10;
              _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Unexpected resource type: %lu", buf, 0xCu);
            }
            break;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  v11 = PLPTPGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = (uint64_t)v2;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  if ([(id)unknownResources count])
  {
    v12 = PLPTPGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = unknownResources;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

+ (void)countResourceTypes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (countResourceTypes__onceToken != -1) {
    dispatch_once(&countResourceTypes__onceToken, &__block_literal_global_3_91342);
  }
  ++totalAssetCount;
  uint64_t v4 = [v3 count];
  totalResourceCount += v4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v38 = *(void *)v40;
    uint64_t v35 = *MEMORY[0x1E4F44520];
    uint64_t v34 = *MEMORY[0x1E4F44448];
    uint64_t v32 = *MEMORY[0x1E4F44498];
    uint64_t v31 = *MEMORY[0x1E4F44330];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v38) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        v9 = [v8 assetHandle];
        unint64_t v10 = [v9 type];

        uint64_t v11 = [v8 contentType];
        if (v11)
        {
          v12 = (void *)v11;
        }
        else
        {
          long long v13 = (void *)MEMORY[0x1E4F442D8];
          long long v14 = [v8 createdFilename];
          long long v15 = v14;
          if (!v14)
          {
            long long v14 = [v8 filename];
            v36 = v14;
          }
          long long v16 = [v14 pathExtension];
          v12 = [v13 typeWithFilenameExtension:v16];

          if (!v15) {
          if (!v12)
          }
          {
            v17 = PLPTPGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v8;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Expected a contentType: %@", buf, 0xCu);
            }

            v12 = 0;
          }
        }
        if (v10 > 0xB)
        {
          v27 = [v8 filename];
          v28 = [v27 pathExtension];
          char v29 = [v28 isEqualToString:@"DBG"];

          if (v29)
          {
            unint64_t v10 = 19;
            goto LABEL_20;
          }
LABEL_38:
          [(id)unknownResources addObject:v8];
          unint64_t v10 = 23;
          goto LABEL_20;
        }
        if (((1 << v10) & 0xFF6) != 0) {
          goto LABEL_20;
        }
        if (v10)
        {
          if (([v12 conformsToType:v35] & 1) == 0
            && ![v12 conformsToType:v34])
          {
            if ([v12 conformsToType:v32])
            {
              unint64_t v10 = 16;
              goto LABEL_20;
            }
            if ([v12 conformsToType:v31])
            {
              unint64_t v10 = 15;
              goto LABEL_20;
            }
            goto LABEL_38;
          }
          v25 = [v8 originalFilename];
          int v26 = [a1 _isRender:v25];

          if (v26) {
            unint64_t v10 = 14;
          }
          else {
            unint64_t v10 = 13;
          }
        }
        else if (([v12 conformsToType:v35] & 1) != 0 {
               || [v12 conformsToType:v34])
        }
        {
          unint64_t v10 = 12;
        }
        else
        {
          unint64_t v10 = 0;
        }
LABEL_20:
        uint64_t v18 = NSNumber;
        v19 = (void *)resourceCountsByType;
        uint64_t v20 = [NSNumber numberWithInteger:v10];
        v21 = [v19 objectForKeyedSubscript:v20];
        v22 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
        v23 = (void *)resourceCountsByType;
        v24 = [NSNumber numberWithInteger:v10];
        [v23 setObject:v22 forKeyedSubscript:v24];

        ++v7;
      }
      while (v6 != v7);
      uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      uint64_t v6 = v30;
    }
    while (v30);
  }
}

void __42__PLPTPDebugAnalytics_countResourceTypes___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)resourceCountsByType;
  resourceCountsByType = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)unknownResources;
  unknownResources = v2;
}

+ (BOOL)_isRender:(id)a3
{
  uint64_t v3 = _isRender__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isRender__onceToken, &__block_literal_global_91352);
  }
  uint64_t v5 = objc_msgSend((id)_isRender__isRenderedRegex, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

void __33__PLPTPDebugAnalytics__isRender___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}E\\d{4}" options:0 error:&v4];
  id v1 = v4;
  uint64_t v2 = (void *)_isRender__isRenderedRegex;
  _isRender__isRenderedRegex = v0;

  if (v1)
  {
    uint64_t v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}E\\d{4}': %@", buf, 0xCu);
    }
  }
}

@end