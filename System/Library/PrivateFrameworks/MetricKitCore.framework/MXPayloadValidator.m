@interface MXPayloadValidator
- (BOOL)_validateHangTracerData:(id)a3;
- (BOOL)_validatePayload:(id)a3;
- (BOOL)_validatePowerlogData:(id)a3;
- (BOOL)_validateReportCrashData:(id)a3;
- (BOOL)_validateSpinTracerData:(id)a3;
- (BOOL)validatePayload:(id)a3;
- (MXPayloadValidator)initWithLogHandle:(id)a3;
- (OS_os_log)logHandle;
- (void)_sanitizeDeviceMetadataForDiagnostic:(id)a3;
- (void)setLogHandle:(id)a3;
@end

@implementation MXPayloadValidator

- (MXPayloadValidator)initWithLogHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXPayloadValidator;
  v6 = [(MXPayloadValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logHandle, a3);
  }

  return v7;
}

- (BOOL)validatePayload:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MXPayloadValidator *)self _validatePayload:v4];
  if (!v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXPayloadValidator validatePayload:]((uint64_t)v4, logHandle);
    }
  }

  return v5;
}

- (BOOL)_validatePayload:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXPayloadValidator _validatePayload:]();
    }
    goto LABEL_10;
  }
  v6 = [v4 datestamp];

  if (!v6)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXPayloadValidator _validatePayload:]((uint64_t)v5, logHandle);
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = [v5 sourceID];
  v8 = [v5 metrics];
  if (v8)
  {
    switch(v7)
    {
      case 2:
        BOOL v9 = [(MXPayloadValidator *)self _validatePowerlogData:v8];
        break;
      case 3:
        BOOL v9 = [(MXPayloadValidator *)self _validateHangTracerData:v8];
        break;
      case 4:
        BOOL v9 = [(MXPayloadValidator *)self _validateSpinTracerData:v8];
        break;
      case 5:
        BOOL v9 = [(MXPayloadValidator *)self _validateReportCrashData:v8];
        break;
      default:
        goto LABEL_13;
    }
    BOOL v11 = v9;
  }
  else
  {
    v12 = self->_logHandle;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MXPayloadValidator _validatePayload:](v5, v12);
    }
LABEL_13:
    BOOL v11 = 0;
  }

LABEL_19:
  return v11;
}

- (BOOL)_validatePowerlogData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
            -[MXPayloadValidator _validatePowerlogData:]();
          }

          BOOL v10 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 1;
  }
LABEL_15:

  return v10;
}

- (BOOL)_validateHangTracerData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
            -[MXPayloadValidator _validateHangTracerData:]();
          }

          BOOL v13 = 0;
          goto LABEL_15;
        }
        id v10 = v9;
        BOOL v11 = [v10 hangDiagnostic];
        [(MXPayloadValidator *)self _sanitizeDeviceMetadataForDiagnostic:v11];

        long long v12 = [v10 appLaunchDiagnostic];

        [(MXPayloadValidator *)self _sanitizeDeviceMetadataForDiagnostic:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_15:

  return v13;
}

- (BOOL)_validateSpinTracerData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
            -[MXPayloadValidator _validateSpinTracerData:]();
          }

          BOOL v13 = 0;
          goto LABEL_15;
        }
        id v10 = v9;
        BOOL v11 = [v10 cpuExceptionDiagnostic];
        [(MXPayloadValidator *)self _sanitizeDeviceMetadataForDiagnostic:v11];

        long long v12 = [v10 diskWriteExceptionDiagnostic];

        [(MXPayloadValidator *)self _sanitizeDeviceMetadataForDiagnostic:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_15:

  return v13;
}

- (BOOL)_validateReportCrashData:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
            -[MXPayloadValidator _validateReportCrashData:]();
          }

          BOOL v11 = 0;
          goto LABEL_15;
        }
        id v10 = [v9 crashDiagnostic];
        [(MXPayloadValidator *)self _sanitizeDeviceMetadataForDiagnostic:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_15:

  return v11;
}

- (void)_sanitizeDeviceMetadataForDiagnostic:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t v5 = objc_alloc_init(MXBundleUtil);
  uint64_t v6 = [v4 metaData];
  uint64_t v7 = [v6 bundleID];

  v27 = v5;
  if ([(MXBundleUtil *)v5 isAppExtensionFromBundleID:v7])
  {
    uint64_t v8 = [(MXBundleUtil *)v5 mainAppBundleIDforExtension:v7];

    uint64_t v7 = (void *)v8;
  }
  id v28 = 0;
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v7 allowPlaceholder:0 error:&v28];
  id v10 = v28;
  v25 = v10;
  v26 = v7;
  if (v10)
  {
    uint64_t v11 = (uint64_t)v10;
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      [(MXPayloadValidator *)(uint64_t)v7 _sanitizeDeviceMetadataForDiagnostic:logHandle];
    }
    char v24 = 0;
  }
  else
  {
    if (!v9)
    {
      char v24 = 0;
      goto LABEL_11;
    }
    char v24 = [v9 isBeta];
  }

LABEL_11:
  id v13 = objc_alloc(MEMORY[0x263F13530]);
  long long v14 = [MEMORY[0x263F55748] regionFormat];
  long long v15 = [MEMORY[0x263F55748] osVersion];
  long long v16 = [MEMORY[0x263F55748] modelIdentifier];
  long long v17 = [v4 metaData];
  uint64_t v18 = [v17 applicationBuildVersion];
  v19 = [MEMORY[0x263F55748] platformArchitecture];
  uint64_t v20 = [v4 metaData];
  v21 = [v20 bundleID];
  BYTE4(v23) = v24;
  LODWORD(v23) = [v4 pid];
  v22 = objc_msgSend(v13, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:bundleID:pid:isTestFlightApp:", v14, v15, v16, v18, v19, v21, v23);

  if (v22) {
    [v4 setMetaData:v22];
  }

LABEL_14:
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validatePayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Invalid payload: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_validatePayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB49000, v0, v1, "Invalid payload as nil", v2, v3, v4, v5, v6);
}

- (void)_validatePayload:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Invalid payload: %@ due to payload datestamp is nil", (uint8_t *)&v2, 0xCu);
}

- (void)_validatePayload:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = [a1 bundleID];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_22BB49000, v3, OS_LOG_TYPE_ERROR, "Invalid payload: %@ due to payload metrics of client: %@ is nil", (uint8_t *)&v5, 0x16u);
}

- (void)_validatePowerlogData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB49000, v0, v1, "Invalid Powerlog Data", v2, v3, v4, v5, v6);
}

- (void)_validateHangTracerData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB49000, v0, v1, "Invalid HangTracer Data", v2, v3, v4, v5, v6);
}

- (void)_validateSpinTracerData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB49000, v0, v1, "Invalid SpinTracer Data", v2, v3, v4, v5, v6);
}

- (void)_validateReportCrashData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB49000, v0, v1, "Invalid ReportCrash Data", v2, v3, v4, v5, v6);
}

- (void)_sanitizeDeviceMetadataForDiagnostic:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "There was an error querying the LS database for bundle id %@: %@", (uint8_t *)&v3, 0x16u);
}

@end