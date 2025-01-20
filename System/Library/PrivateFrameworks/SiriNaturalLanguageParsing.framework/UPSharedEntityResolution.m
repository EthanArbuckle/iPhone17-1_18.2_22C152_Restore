@interface UPSharedEntityResolution
+ (id)buildDataDetectorDateTimeSpansByTokenRange:(id)a3;
- (NSDictionary)_dataDetectorDateTimeSpansByTokenRange;
- (UPSharedEntityResolution)initWithMatchingSpans:(id)a3;
- (id)resolveSharedEntityForTokenRange:(_NSRange)a3 valueType:(id)a4;
@end

@implementation UPSharedEntityResolution

- (void).cxx_destruct
{
}

- (NSDictionary)_dataDetectorDateTimeSpansByTokenRange
{
  return self->__dataDetectorDateTimeSpansByTokenRange;
}

- (id)resolveSharedEntityForTokenRange:(_NSRange)a3 valueType:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218498;
    NSUInteger v16 = location;
    __int16 v17 = 2048;
    NSUInteger v18 = length;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1C8DA9000, v8, OS_LOG_TYPE_DEBUG, "Resolving shared entities for token range (%lu, %lu) with value type: %@", (uint8_t *)&v15, 0x20u);
  }

  if ([v7 isEqualToString:@"date"])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    v10 = [(NSDictionary *)self->__dataDetectorDateTimeSpansByTokenRange objectForKey:v9];
    v11 = SNLPOSLoggerForCategory(3);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "Found a corresponding matching span: returning the shared entity graph", (uint8_t *)&v15, 2u);
      }

      v13 = [v10 sharedEntityGraph];
    }
    else
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "Returning nil since there is no corresponding matching span", (uint8_t *)&v15, 2u);
      }

      v13 = 0;
    }
  }
  else
  {
    v9 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_DEBUG, "Returning nil since we cannot handle non-date value types", (uint8_t *)&v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (UPSharedEntityResolution)initWithMatchingSpans:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_DEBUG, "Initializing UPSharedEntityResolution with %lu matching spans", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)UPSharedEntityResolution;
  v6 = [(UPSharedEntityResolution *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() buildDataDetectorDateTimeSpansByTokenRange:v4];
    dataDetectorDateTimeSpansByTokenRange = v6->__dataDetectorDateTimeSpansByTokenRange;
    v6->__dataDetectorDateTimeSpansByTokenRange = (NSDictionary *)v7;
  }
  return v6;
}

+ (id)buildDataDetectorDateTimeSpansByTokenRange:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v36 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    v8 = "Processing matching span with category: %@";
    v9 = @"DATE_TIME";
    do
    {
      uint64_t v10 = 0;
      uint64_t v35 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        uint64_t v12 = SNLPOSLoggerForCategory(3);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [v11 category];
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = (uint64_t)v13;
          _os_log_impl(&dword_1C8DA9000, v12, OS_LOG_TYPE_DEBUG, v8, buf, 0xCu);
        }
        if ([v11 type] != 2)
        {
          v23 = SNLPOSLoggerForCategory(3);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v29 = v23;
          v30 = "Skipping non-DataDetected span";
LABEL_18:
          _os_log_impl(&dword_1C8DA9000, v29, OS_LOG_TYPE_DEBUG, v30, buf, 2u);
          goto LABEL_23;
        }
        v14 = [v11 category];
        char v15 = [(__CFString *)v9 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          v23 = SNLPOSLoggerForCategory(3);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v29 = v23;
          v30 = "Skipping non-datetime span";
          goto LABEL_18;
        }
        uint64_t v16 = v7;
        id v17 = v4;
        NSUInteger v18 = v9;
        __int16 v19 = v8;
        id v20 = (void *)MEMORY[0x1E4F29238];
        uint64_t v21 = [v11 range];
        v23 = objc_msgSend(v20, "valueWithRange:", v21, v22);
        v24 = [v36 objectForKeyedSubscript:v23];

        v25 = SNLPOSLoggerForCategory(3);
        v26 = v25;
        if (v24)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [v11 range];
            [v11 range];
            *(_DWORD *)buf = 134218240;
            uint64_t v42 = v27;
            __int16 v43 = 2048;
            uint64_t v44 = v28;
            _os_log_impl(&dword_1C8DA9000, v26, OS_LOG_TYPE_DEFAULT, "Discarding duplicate matching date time span for range (%lu, %lu)", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v31 = [v11 range];
            [v11 range];
            *(_DWORD *)buf = 134218240;
            uint64_t v42 = v31;
            __int16 v43 = 2048;
            uint64_t v44 = v32;
            _os_log_impl(&dword_1C8DA9000, v26, OS_LOG_TYPE_DEBUG, "Adding DD datetime span with token range (%lu, %lu)", buf, 0x16u);
          }

          [v36 setObject:v11 forKeyedSubscript:v23];
        }
        v8 = v19;
        v9 = v18;
        id v4 = v17;
        uint64_t v7 = v16;
        uint64_t v6 = v35;
LABEL_23:

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v6);
  }

  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v36];

  return v33;
}

@end