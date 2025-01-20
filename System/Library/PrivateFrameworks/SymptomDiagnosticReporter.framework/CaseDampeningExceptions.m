@interface CaseDampeningExceptions
+ (BOOL)allowDampeningExceptionFor:(id)a3;
+ (BOOL)isException:(id)a3 containedInString:(id)a4;
+ (BOOL)isString:(id)a3 inExceptionList:(id)a4;
+ (void)setLoggingHandle:(id)a3;
+ (void)setNPIDevice:(BOOL)a3;
@end

@implementation CaseDampeningExceptions

+ (void)setLoggingHandle:(id)a3
{
}

+ (void)setNPIDevice:(BOOL)a3
{
  _isNPIDevice = a3;
}

+ (BOOL)isString:(id)a3 inExceptionList:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "count"))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v12, "length", (void)v15) >= 2
            && [v12 containsString:@"*"]
            && +[CaseDampeningExceptions isException:v12 containedInString:v5])
          {
            BOOL v13 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_16:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)isException:(id)a3 containedInString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    if ((unint64_t)[v5 length] >= 3
      && [v5 hasPrefix:@"*"]
      && [v5 hasSuffix:@"*"])
    {
      BOOL v7 = 1;
      uint64_t v8 = objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 2);
      if ([v6 rangeOfString:v8] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
    }
    else if ((unint64_t)[v5 length] >= 2 {
           && [v5 hasPrefix:@"*"])
    }
    {
      BOOL v7 = 1;
      uint64_t v8 = objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 1);
      if ([v6 hasSuffix:v8]) {
        goto LABEL_19;
      }
    }
    else if ((unint64_t)[v5 length] >= 2 {
           && [v5 hasSuffix:@"*"])
    }
    {
      uint64_t v8 = objc_msgSend(v5, "substringWithRange:", 0, objc_msgSend(v5, "length") - 1);
      if ([v6 hasPrefix:v8])
      {
        BOOL v7 = 1;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    BOOL v7 = 0;
    goto LABEL_19;
  }
  BOOL v7 = 0;
LABEL_20:

  return v7;
}

+ (BOOL)allowDampeningExceptionFor:(id)a3
{
  v39[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 objectForKeyedSubscript:@"domain"];
    id v5 = [v3 objectForKeyedSubscript:@"type"];
    id v6 = [v3 objectForKeyedSubscript:@"subtype"];
    BOOL v7 = [v3 objectForKeyedSubscript:@"additional"];
    if (![v4 length] || !objc_msgSend(v5, "length") || !objc_msgSend(v6, "length"))
    {
      BOOL v20 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v38[0] = @"Functional";
    v38[1] = @"Operational";
    v39[0] = &unk_26C308B40;
    v39[1] = &unk_26C308B58;
    v38[2] = @"Performance";
    v39[2] = &unk_26C308B70;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:&unk_26C3090A0];
    if (_isNPIDevice)
    {
      uint64_t v10 = _logHandle;
      if (_logHandle && os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210A0E000, v10, OS_LOG_TYPE_INFO, "Modifying Cellular exceptions list for NPI devices", buf, 2u);
      }
      [v9 setObject:&unk_26C308D80 forKeyedSubscript:@"Baseband Stability"];
      [v9 setObject:&unk_26C308D98 forKeyedSubscript:@"IMS Call KPI"];
    }
    v36[0] = @"Networking";
    v36[1] = @"Cellular";
    v34 = (void *)v8;
    v37[0] = v8;
    v37[1] = v9;
    v36[2] = @"Bluetooth";
    v36[3] = @"ReminderKit";
    v37[2] = &unk_26C308F10;
    v37[3] = &unk_26C308F38;
    v36[4] = @"Location";
    v36[5] = @"PrivacyTransparency";
    v37[4] = &unk_26C308FD8;
    v37[5] = &unk_26C308F88;
    v36[6] = @"MediaPlayer";
    v36[7] = @"iCloudDrive";
    v37[6] = &unk_26C3090F0;
    v37[7] = &unk_26C309140;
    v36[8] = @"AVConference";
    v36[9] = @"SiriAssistant";
    v37[8] = &unk_26C3091B8;
    v37[9] = &unk_26C309208;
    v36[10] = @"FaceTime";
    v36[11] = @"CoreSpeech";
    v37[10] = &unk_26C309258;
    v37[11] = &unk_26C3092A8;
    v11 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:12];
    v12 = _logHandle;
    if (_logHandle && os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG)) {
      +[CaseDampeningExceptions allowDampeningExceptionFor:].cold.4((uint64_t)v3, v12);
    }
    BOOL v13 = [v11 objectForKeyedSubscript:v4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v20 = 0;
      if (v13)
      {
        v21 = (void *)_logHandle;
        if (_logHandle)
        {
          if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG)) {
            +[CaseDampeningExceptions allowDampeningExceptionFor:]((uint64_t)v13, v21);
          }
          BOOL v20 = 0;
        }
      }
      goto LABEL_67;
    }
    id v33 = v13;
    v14 = [v33 objectForKeyedSubscript:v5];
    objc_opt_class();
    v32 = v14;
    if (objc_opt_isKindOfClass())
    {
      v30 = v11;
      id v15 = v14;
      long long v16 = [v15 objectForKeyedSubscript:v6];
      objc_opt_class();
      v31 = v15;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v20 = 0;
        if (v16)
        {
          v25 = (void *)_logHandle;
          if (_logHandle)
          {
            if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG)) {
              +[CaseDampeningExceptions allowDampeningExceptionFor:]((uint64_t)v33, v25);
            }
            BOOL v20 = 0;
          }
        }
        goto LABEL_65;
      }
      v29 = v16;
      id v17 = v16;
      if ([v7 length] && objc_msgSend(v17, "containsObject:", v7))
      {
        long long v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
        v19 = "Case signature matches allowed exception.";
      }
      else if (objc_msgSend(v17, "containsObject:", @"*", v29) && objc_msgSend(v17, "count") == 1)
      {
        long long v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
        v19 = "Case signature matches allowed exception (subtypeContext allowed as a wildcard).";
      }
      else
      {
        if (!+[CaseDampeningExceptions isString:v7 inExceptionList:v17])
        {
          BOOL v20 = 0;
          goto LABEL_64;
        }
        long long v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
        {
LABEL_55:
          BOOL v20 = 1;
LABEL_64:

          long long v16 = v29;
LABEL_65:

          v11 = v30;
          goto LABEL_66;
        }
        *(_WORD *)buf = 0;
        v19 = "Case signature contains allowed exception.";
      }
      _os_log_impl(&dword_210A0E000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = v14;
      BOOL v20 = 0;
      if (v26)
      {
        v27 = (void *)_logHandle;
        if (_logHandle)
        {
          if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG)) {
            +[CaseDampeningExceptions allowDampeningExceptionFor:]((uint64_t)v32, v27);
          }
          BOOL v20 = 0;
        }
      }
      goto LABEL_66;
    }
    id v22 = v14;
    if ([v22 containsObject:v6])
    {
      v23 = _logHandle;
      if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      v24 = "Case signature matches allowed exception.";
    }
    else
    {
      if (![v22 containsObject:@"*"] || objc_msgSend(v22, "count") != 1)
      {
        BOOL v20 = 0;
        goto LABEL_62;
      }
      v23 = _logHandle;
      if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        BOOL v20 = 1;
LABEL_62:

LABEL_66:
LABEL_67:

        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v24 = "Case signature matches allowed exception (subtype allowed as a wildcard).";
    }
    _os_log_impl(&dword_210A0E000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_34;
  }
  BOOL v20 = 0;
LABEL_69:

  return v20;
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_210A0E000, v5, v6, "Found unexpected object %@ of class %@ as exception for subtype %@", v7, v8, v9, v10, v11);
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_210A0E000, v5, v6, "Found unexpected object %@ of class %@ as exception for type %@", v7, v8, v9, v10, v11);
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_210A0E000, v5, v6, "Found unexpected object %@ of class %@ as exception for domain %@", v7, v8, v9, v10, v11);
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_210A0E000, a2, OS_LOG_TYPE_DEBUG, "Comparing case signature %@ against allowed exceptions list.", (uint8_t *)&v2, 0xCu);
}

@end