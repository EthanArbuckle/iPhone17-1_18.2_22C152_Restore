@interface ADAMSRSensorWriter
- (ADAMSRSensorWriter)initWithSensorType:(int)a3 bundleIdentifier:(id)a4;
- (BOOL)isBundleIdentifierEligible;
- (BOOL)isMonitoring;
- (BOOL)isValidSRSensorWriterPresent;
- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)provideSample:(id)a3 error:(id *)a4;
@end

@implementation ADAMSRSensorWriter

- (void).cxx_destruct
{
}

- (BOOL)isBundleIdentifierEligible
{
  return self->_isBundleIdentifierEligible;
}

- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  writer = self->_writer;
  if (writer) {
    char v10 = [(SRSensorWriter *)writer provideSample:v8 continuousTimestamp:a4 error:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)provideSample:(id)a3 error:(id *)a4
{
  id v6 = a3;
  writer = self->_writer;
  if (writer) {
    char v8 = [(SRSensorWriter *)writer provideSample:v6 error:a4];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isMonitoring
{
  writer = self->_writer;
  if (writer) {
    LOBYTE(writer) = [(SRSensorWriter *)writer isMonitoring];
  }
  return (char)writer;
}

- (BOOL)isValidSRSensorWriterPresent
{
  return self->_writer != 0;
}

- (ADAMSRSensorWriter)initWithSensorType:(int)a3 bundleIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ADAMSRSensorWriter;
  char v8 = [(ADAMSRSensorWriter *)&v21 init];
  if (!v8) {
    goto LABEL_21;
  }
  if (a3 <= 5) {
    id v4 = **((id **)&unk_264628EE8 + a3);
  }
  uint64_t v9 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:v4];
  writer = v8->_writer;
  v8->_writer = (SRSensorWriter *)v9;

  v11 = v8->_writer;
  id v12 = v4;
  if (!v11)
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v13 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v13) {
        goto LABEL_14;
      }
    }
    else
    {
      v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "ADAMSensorKitWriterFactory.mm";
      __int16 v24 = 1024;
      int v25 = 22;
      __int16 v26 = 2112;
      *(void *)v27 = v12;
      _os_log_impl(&dword_2227C1000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to create SRWriter for %@", buf, 0x1Cu);
    }
  }
LABEL_14:

  if (a3 > 2)
  {
    v16 = v8->_writer;
    if (v16)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __58__ADAMSRSensorWriter_initWithSensorType_bundleIdentifier___block_invoke;
      v18[3] = &unk_264628EC8;
      v19 = v8;
      id v20 = v7;
      [(SRSensorWriter *)v16 bundleEligibility:v20 completion:v18];
    }
  }
  else
  {
    v8->_isBundleIdentifierEligible = 1;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v15 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "ADAMSRSensorWriter.mm";
      __int16 v24 = 1024;
      int v25 = 64;
      __int16 v26 = 1040;
      *(_DWORD *)v27 = 18;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "ADAMSRSensorWriter]";
      __int16 v28 = 2048;
      v29 = v8;
      _os_log_impl(&dword_2227C1000, v15, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] No bundle identifier check for Siri use case", buf, 0x2Cu);
    }
  }

LABEL_21:
  return v8;
}

void __58__ADAMSRSensorWriter_initWithSensorType_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2 != 1 || v5)
  {
    *(unsigned char *)(v7 + 18) = 0;
    if (!a2)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v11 = ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(a1 + 40);
        int v17 = 136316418;
        v18 = "ADAMSRSensorWriter.mm";
        __int16 v19 = 1024;
        int v20 = 81;
        __int16 v21 = 1040;
        int v22 = 18;
        __int16 v23 = 2080;
        __int16 v24 = "ADAMSRSensorWriter]";
        __int16 v25 = 2048;
        uint64_t v26 = v12;
        __int16 v27 = 2112;
        __int16 v28 = v13;
        _os_log_impl(&dword_2227C1000, v11, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Bundle identifier %@ is not eligible", (uint8_t *)&v17, 0x36u);
      }
    }
    if (v6)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      id v14 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = [v6 debugDescription];
        int v17 = 136316418;
        v18 = "ADAMSRSensorWriter.mm";
        __int16 v19 = 1024;
        int v20 = 86;
        __int16 v21 = 1040;
        int v22 = 18;
        __int16 v23 = 2080;
        __int16 v24 = "ADAMSRSensorWriter]";
        __int16 v25 = 2048;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        __int16 v28 = v16;
        _os_log_impl(&dword_2227C1000, v14, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Error getting bundle identifier eligibility from SensorKit: %@", (uint8_t *)&v17, 0x36u);
      }
    }
  }
  else
  {
    *(unsigned char *)(v7 + 18) = 1;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    char v8 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      char v10 = *(void **)(a1 + 40);
      int v17 = 136316418;
      v18 = "ADAMSRSensorWriter.mm";
      __int16 v19 = 1024;
      int v20 = 74;
      __int16 v21 = 1040;
      int v22 = 18;
      __int16 v23 = 2080;
      __int16 v24 = "ADAMSRSensorWriter]";
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      __int16 v28 = v10;
      _os_log_impl(&dword_2227C1000, v8, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Bundle identifier %@ is eligible", (uint8_t *)&v17, 0x36u);
    }
  }
}

@end