@interface PrintBandService
- (PrintBandService)initWithXPCConnection:(id)a3;
- (void)dealloc;
- (void)znProcessBand:(id)a3 withBandDescription:(id *)a4 reply:(id)a5;
@end

@implementation PrintBandService

- (PrintBandService)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PrintBandService;
  v6 = [(PrintBandService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
  }

  return v7;
}

- (void)dealloc
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_1000388CC(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (self->znProcessData)
  {
    znTerminate();
    znCleanup();
  }
  v11.receiver = self;
  v11.super_class = (Class)PrintBandService;
  [(PrintBandService *)&v11 dealloc];
}

- (void)znProcessBand:(id)a3 withBandDescription:(id *)a4 reply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  int v10 = *(_DWORD *)&a4->var8;
  long long v11 = *(_OWORD *)&a4->var4;
  *(_OWORD *)&self->bandCombo.bandDescription.pageWidth_pixels = *(_OWORD *)&a4->var0;
  *(_OWORD *)&self->bandCombo.bandDescription.bitsPerColor = v11;
  *(_DWORD *)&self->bandCombo.bandDescription.extendedColorspace = v10;
  id v12 = v8;
  self->bandCombo.raster = [v12 bytes];
  if (a4->var7) {
    goto LABEL_2;
  }
  BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v28) {
    sub_100038C60(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  LODWORD(v13) = initZn(&self->znProcessData, (uint64_t)&self->bandCombo);
  if (!v13)
  {
    int v48 = 24;
    long long v49 = *(_OWORD *)&a4->var0;
    int v50 = 0;
    LODWORD(v13) = znInitializeBanding(self->znProcessData, &v48);
    if (!v13)
    {
LABEL_2:
      uint64_t v13 = znProcessImageData(self->znProcessData, &self->bandCombo, 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100038BEC(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      if (!v13)
      {
        LODWORD(v13) = znAcknowledge(self->bandCombo.token, 0, self->znProcessData);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100038B5C((int *)&self->bandCombo.token, v13);
        }
        if (!v13)
        {
          if (a4->var6 + a4->var7 >= a4->var1)
          {
            uint64_t v13 = znTerminateBanding(self->znProcessData);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_100038AE8(v13, v21, v22, v23, v24, v25, v26, v27);
            }
          }
          else
          {
            LODWORD(v13) = 0;
          }
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int var6 = a4->var6;
    int var7 = a4->var7;
    int var1 = a4->var1;
    int bandIsOkay = self->bandCombo.bandIsOkay;
    int v48 = 136316418;
    *(void *)&long long v49 = "-[PrintBandService znProcessBand:withBandDescription:reply:]";
    WORD4(v49) = 1024;
    *(_DWORD *)((char *)&v49 + 10) = var7;
    HIWORD(v49) = 1024;
    int v50 = var6;
    __int16 v51 = 1024;
    int v52 = var1;
    __int16 v53 = 1024;
    int v54 = v13;
    __int16 v55 = 1024;
    int v56 = bandIsOkay;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: bandY=%d bandHeight=%d pageHeight=%d result=%d bandOkay=%d", (uint8_t *)&v48, 0x2Au);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100038A70((uint64_t)self, v36, v37, v38, v39, v40, v41, v42);
  }
  if (self->bandCombo.bandIsOkay) {
    uint64_t v43 = 0;
  }
  else {
    uint64_t v43 = 0xFFFFFFFFLL;
  }
  v9[2](v9, v43);
}

- (void).cxx_destruct
{
}

@end