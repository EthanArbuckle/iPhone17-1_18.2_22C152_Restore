@interface MXSourceHandler
- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6;
- (MXBundleUtilProtocol)bundleUtil;
- (MXDeliveryDataCacherProtocol)deliveryDataCacher;
- (MXDiagnosticServicesProtocol)diagnosticServices;
- (MXSourceDataCacherProtocol)sourceDataCacher;
- (MXSourceHandler)initWithSourceDataCacher:(id)a3 andDeliveryDataCacher:(id)a4 andSourcePathUtil:(id)a5 andBundleUtil:(id)a6 andDiagnosticServices:(id)a7 andDelegate:(id)a8;
- (MXSourceHandlerDelegate)delegate;
- (MXSourcePathUtilProtocol)sourcePathUtil;
- (OS_os_log)logHandle;
- (void)_removeDeliveredPayloadForSourceID:(int64_t)a3 atDate:(id)a4;
- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3;
- (void)handleDiagnosticDataWithPayload:(id)a3;
- (void)handleMetricDataWithPayload:(id)a3;
- (void)setBundleUtil:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliveryDataCacher:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setSourceDataCacher:(id)a3;
- (void)setSourcePathUtil:(id)a3;
@end

@implementation MXSourceHandler

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(MXSourceHandler *)self diagnosticServices];
  [v5 cleanServiceDiagnosticsDirectoriesForClient:v4];
}

- (MXDiagnosticServicesProtocol)diagnosticServices
{
  return (MXDiagnosticServicesProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (MXSourceHandler)initWithSourceDataCacher:(id)a3 andDeliveryDataCacher:(id)a4 andSourcePathUtil:(id)a5 andBundleUtil:(id)a6 andDiagnosticServices:(id)a7 andDelegate:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXSourceHandler;
  v18 = [(MXSourceHandler *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceDataCacher, a3);
    objc_storeStrong((id *)&v19->_deliveryDataCacher, a4);
    objc_storeStrong((id *)&v19->_sourcePathUtil, a5);
    objc_storeStrong((id *)&v19->_diagnosticServices, a7);
    objc_storeStrong((id *)&v19->_bundleUtil, a6);
    objc_storeWeak((id *)&v19->_delegate, v17);
    os_log_t v20 = os_log_create("com.apple.metrickit", "source.handler");
    logHandle = v19->_logHandle;
    v19->_logHandle = (OS_os_log *)v20;

    if (!v19->_logHandle) {
      objc_storeStrong((id *)&v19->_logHandle, &_os_log_internal);
    }
  }

  return v19;
}

- (void)handleMetricDataWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(MXSourceHandler *)self sourceDataCacher];
  int v6 = [v5 saveToSourceDirectoryWithMetricSourcePayload:v4];

  if (v6)
  {
    id v7 = [(MXSourceHandler *)self delegate];
    [v7 metricPayloadDidCacheToSourceDirectory];
  }
}

- (void)handleDiagnosticDataWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(MXSourceHandler *)self sourceDataCacher];
  int v6 = [v5 saveToSourceDirectoryWithDiagnosticSourcePayload:v4];

  if (v6)
  {
    id v7 = [(MXSourceHandler *)self delegate];
    [v7 diagnosticPayloadDidCacheToSourceDirectory];

    v8 = [v4 bundleID];
    uint64_t v9 = [(MXBundleUtilProtocol *)self->_bundleUtil isAppExtensionFromBundleID:v8];
    if (v9)
    {
      v10 = [(MXBundleUtilProtocol *)self->_bundleUtil mainAppBundleIDforExtension:v8];
      v11 = v10;
      if (!v10)
      {
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
          -[MXSourceHandler handleDiagnosticDataWithPayload:]((uint64_t)v8, logHandle);
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v11 = 0;
      v10 = v8;
    }
    v13 = [(MXSourceHandler *)self diagnosticServices];
    v14 = [v4 datestamp];
    id v15 = [v13 diagnosticPayloadForClient:v8 isExtension:v9 andMainAppBundleID:v11 andDate:v14];

    id v16 = v10;
    id v17 = [(MXSourceHandler *)self deliveryDataCacher];
    LODWORD(v14) = [v17 saveDiagnostic:v15 toDeliveryDirectoryForBundleID:v16];

    if (v14)
    {
      uint64_t v18 = [v4 sourceID];
      v19 = [v4 datestamp];
      [(MXSourceHandler *)self _removeDeliveredPayloadForSourceID:v18 atDate:v19];

      os_log_t v20 = [(MXSourceHandler *)self deliveryDataCacher];
      [v20 notifyDataAvailableForDelivery];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(MXSourceHandler *)self deliveryDataCacher];
  LOBYTE(a6) = [v13 writeDiagnosticReport:v12 atAppContainerPath:v11 forClient:v10 withError:a6];

  return (char)a6;
}

- (void)_removeDeliveredPayloadForSourceID:(int64_t)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = [(MXSourceHandler *)self sourcePathUtil];
  [v7 removeDeliveredDiagnosticsForSourceID:a3 forDate:v6];
}

- (MXSourceDataCacherProtocol)sourceDataCacher
{
  return (MXSourceDataCacherProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceDataCacher:(id)a3
{
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeliveryDataCacher:(id)a3
{
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleUtil:(id)a3
{
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourcePathUtil:(id)a3
{
}

- (MXSourceHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MXSourceHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_diagnosticServices, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);

  objc_storeStrong((id *)&self->_sourceDataCacher, 0);
}

- (void)handleDiagnosticDataWithPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "could not resolve Main App bundleID for extension %@", (uint8_t *)&v2, 0xCu);
}

@end