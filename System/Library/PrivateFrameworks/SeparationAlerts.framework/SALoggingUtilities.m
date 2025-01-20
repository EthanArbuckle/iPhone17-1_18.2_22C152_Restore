@interface SALoggingUtilities
+ (id)computeMessagesForEvent:(id)a3;
+ (id)extractEventFromMessages:(id)a3;
+ (id)extractUniqueIdentifierFromMessage:(id)a3;
+ (id)stringToSplit:(id)a3 maxSplitSize:(unint64_t)a4;
+ (void)logTAEvent:(id)a3;
@end

@implementation SALoggingUtilities

+ (id)computeMessagesForEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3)
  {
LABEL_15:
    id v21 = v4;
    goto LABEL_16;
  }
  v5 = (void *)MEMORY[0x1D25F7C90]();
  id v29 = 0;
  v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v29];
  id v7 = v29;
  v8 = [v6 base64EncodedStringWithOptions:32];
  v9 = v8;
  if (!v7 && ![v8 isEqual:&stru_1F27F45F0])
  {
    context = v5;
    *(void *)buf = 0;
    *(void *)v32 = 0;
    id v12 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [v12 getUUIDBytes:buf];

    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:16];
    v14 = [v13 base64EncodedStringWithOptions:32];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v23 = v9;
    v15 = +[SALoggingUtilities stringToSplit:maxSplitSize:](SALoggingUtilities, "stringToSplit:maxSplitSize:", v9, 1015 - [v14 length]);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [NSString stringWithFormat:@"%@%@", v14, *(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v4 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    goto LABEL_15;
  }
  v10 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289539;
    *(_WORD *)v32 = 2082;
    *(void *)&v32[2] = "";
    __int16 v33 = 2113;
    id v34 = v7;
    __int16 v35 = 2113;
    v36 = v9;
    _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Archiver error\", \"Error\":\"%{private}@\", \"String\":\"%{private}@\"}", buf, 0x26u);
  }
  id v11 = v4;

LABEL_16:

  return v4;
}

+ (id)stringToSplit:(id)a3 maxSplitSize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5 && a4 && ([v5 isEqual:&stru_1F27F45F0] & 1) == 0)
  {
    if ([v5 length] <= a4)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      do
      {
        v8 = objc_msgSend(v5, "substringWithRange:", v7, a4);
        [v6 addObject:v8];

        v7 += a4;
      }
      while (a4 + v7 < [v5 length]);
    }
    v9 = objc_msgSend(v5, "substringWithRange:", v7, objc_msgSend(v5, "length") - objc_msgSend(v6, "count") * a4);
    [v6 addObject:v9];
  }
  return v6;
}

+ (void)logTAEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = +[SALoggingUtilities computeMessagesForEvent:a3];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = TASAEventsLog;
        if (os_log_type_enabled((os_log_t)TASAEventsLog, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v9;
          _os_log_debug_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
}

+ (id)extractUniqueIdentifierFromMessage:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x19)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 24);
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:1];
    [v5 getBytes:v8 length:16];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
  }
  return v6;
}

+ (id)extractEventFromMessages:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "substringWithRange:", 24, objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "length") - 24);
        [v4 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v7);
  }

  long long v11 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  v26[7] = objc_opt_class();
  v26[8] = objc_opt_class();
  v26[9] = objc_opt_class();
  v26[10] = objc_opt_class();
  v26[11] = objc_opt_class();
  v26[12] = objc_opt_class();
  v26[13] = objc_opt_class();
  v26[14] = objc_opt_class();
  v26[15] = objc_opt_class();
  v26[16] = objc_opt_class();
  v26[17] = objc_opt_class();
  v26[18] = objc_opt_class();
  v26[19] = objc_opt_class();
  v26[20] = objc_opt_class();
  v26[21] = objc_opt_class();
  v26[22] = objc_opt_class();
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:23];
  long long v13 = [v11 setWithArray:v12];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:1];
  id v19 = 0;
  uint64_t v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v14 error:&v19];
  id v16 = v19;
  if (v16)
  {
    uint64_t v17 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v16;
      _os_log_impl(&dword_1D15FC000, v17, OS_LOG_TYPE_DEFAULT, "unarchive error: %@", buf, 0xCu);
    }
  }

  return v15;
}

@end