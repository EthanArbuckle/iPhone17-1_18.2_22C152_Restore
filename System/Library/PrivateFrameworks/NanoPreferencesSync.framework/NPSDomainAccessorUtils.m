@interface NPSDomainAccessorUtils
+ (BOOL)BOOLForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4;
+ (double)doubleForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4;
+ (float)floatForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4;
+ (id)URLForObject:(id)a3;
+ (id)arrayForObject:(id)a3;
+ (id)dataForObject:(id)a3;
+ (id)dictionaryForObject:(id)a3;
+ (id)objectForURL:(id)a3;
+ (id)stringArrayForObject:(id)a3;
+ (id)stringForObject:(id)a3;
+ (int64_t)integerForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4;
+ (int64_t)longForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4;
@end

@implementation NPSDomainAccessorUtils

+ (id)stringForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 stringValue];
    }
    else
    {
      uint64_t v4 = 0;
    }

    id v3 = (id)v4;
  }
  return v3;
}

+ (id)arrayForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)dictionaryForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)dataForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)stringArrayForObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    v6 = v4;
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v6 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      v6 = v4;
    }
LABEL_13:
  }
  else
  {

    v6 = 0;
  }
  return v6;
}

+ (int64_t)integerForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    int64_t v6 = [v5 integerValue];
    if (a4)
    {
      BOOL v7 = 1;
LABEL_8:
      *a4 = v7;
    }
  }
  else
  {
    int64_t v6 = 0;
    if (a4)
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
  }

  return v6;
}

+ (int64_t)longForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    int64_t v6 = [v5 longLongValue];
    if (a4)
    {
      BOOL v7 = 1;
LABEL_8:
      *a4 = v7;
    }
  }
  else
  {
    int64_t v6 = 0;
    if (a4)
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
  }

  return v6;
}

+ (float)floatForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [v5 floatValue];
    float v7 = v6;
    if (a4)
    {
      BOOL v8 = 1;
LABEL_8:
      *a4 = v8;
    }
  }
  else
  {
    float v7 = 0.0;
    if (a4)
    {
      BOOL v8 = 0;
      goto LABEL_8;
    }
  }

  return v7;
}

+ (double)doubleForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5 = a3;
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [v5 doubleValue];
    double v7 = v6;
    if (a4)
    {
      BOOL v8 = 1;
LABEL_8:
      *a4 = v8;
    }
  }
  else
  {
    double v7 = 0.0;
    if (a4)
    {
      BOOL v8 = 0;
      goto LABEL_8;
    }
  }

  return v7;
}

+ (BOOL)BOOLForObject:(id)a3 existsAndHasValidFormat:(BOOL *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 length];
    if (objc_msgSend(v5, "compare:options:range:", @"YES", 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", @"Y", 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", @"true", 1, 0, v6)
      && objc_msgSend(v5, "compare:options:range:", @"1", 1, 0, v6))
    {
      if (!objc_msgSend(v5, "compare:options:range:", @"NO", 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", @"N", 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", @"false", 1, 0, v6)
        || !objc_msgSend(v5, "compare:options:range:", @"0", 1, 0, v6))
      {
        char v7 = 0;
        if (!a4) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
LABEL_18:
      BOOL v8 = 0;
      char v7 = 0;
      if (!a4) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    BOOL v8 = 1;
    char v7 = 1;
    if (a4) {
      goto LABEL_16;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    char v7 = [v5 BOOLValue];
    if (a4)
    {
LABEL_14:
      BOOL v8 = 1;
LABEL_16:
      *a4 = v8;
    }
  }
LABEL_17:

  return v7;
}

+ (id)URLForObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  NSClassFromString(&cfstr_Nsdata.isa);
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    id v3 = v3;
    id v12 = 0;
    id v5 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v12];

    id v6 = v12;
    if (v6)
    {
      char v7 = (void *)nps_daemon_log;
      if (os_log_type_enabled((os_log_t)nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = v7;
        uint64_t v9 = [v3 length];
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1BA426000, v8, OS_LOG_TYPE_DEFAULT, "URL unarchiving fail from %ld bytes of data", buf, 0xCu);
      }
    }
    goto LABEL_7;
  }
  NSClassFromString(&cfstr_Nsstring.isa);
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [v3 stringByExpandingTildeInPath];
    id v5 = [v10 fileURLWithPath:v6];
LABEL_7:

    goto LABEL_9;
  }

  id v5 = 0;
LABEL_9:
  return v5;
}

+ (id)objectForURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isFileURL])
  {
    if (![v3 isFileReferenceURL])
    {
      uint64_t v9 = [v3 absoluteURL];
      long long v11 = [v9 path];
      char v7 = [v11 stringByAbbreviatingWithTildeInPath];

      goto LABEL_9;
    }
    id v4 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v13 = 0;
    id v5 = (id *)&v13;
    id v6 = &v13;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v14 = 0;
    id v5 = (id *)&v14;
    id v6 = &v14;
  }
  char v7 = objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, v6, v13, v14);
  id v8 = *v5;
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  v10 = nps_daemon_log;
  if (os_log_type_enabled((os_log_t)nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "URL archiving of %@ returned error %@", buf, 0x16u);
  }
LABEL_9:

LABEL_10:
  return v7;
}

@end