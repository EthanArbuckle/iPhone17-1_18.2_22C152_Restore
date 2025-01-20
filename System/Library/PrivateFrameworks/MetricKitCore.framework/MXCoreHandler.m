@interface MXCoreHandler
- (BOOL)shouldDeliverDataForBundleID:(id)a3;
- (BOOL)shouldDeliverDataForBundleID:(id)a3 andTeamID:(id)a4;
- (MXClientUtilProtocol)clientUtil;
- (MXCoreHandler)initWithClientUtil:(id)a3 andDeliveryDataCacher:(id)a4 andDeliveryPathUtil:(id)a5 andMetricServices:(id)a6 andDelegate:(id)a7;
- (MXCoreHandlerDelegate)delegate;
- (MXDeliveryDataCacherProtocol)deliveryDataCacher;
- (MXDeliveryPathUtilProtocol)deliveryPathUtil;
- (MXMetricServicesProtocol)metricServices;
- (OS_os_log)logHandle;
- (id)diagnosticsForBundleID:(id)a3;
- (id)metricsForBundleID:(id)a3;
- (unint64_t)_successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:(id)a3;
- (void)_handleClientAvailability;
- (void)_processDataActivity;
- (void)_reportMetricKitUsage;
- (void)_updateClientAvailabilityAndPrepareDataActivityForBundleID:(id)a3;
- (void)performDataActivity;
- (void)registerClientAndTeamForBundleID:(id)a3 andTeamID:(id)a4;
- (void)registerClientForBundleID:(id)a3;
- (void)saveMetricPayloadsToDeliveryDirectoryAndReportSuccessForClientMetrics:(id)a3;
- (void)setClientUtil:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliveryDataCacher:(id)a3;
- (void)setDeliveryPathUtil:(id)a3;
- (void)setLogHandle:(id)a3;
@end

@implementation MXCoreHandler

- (void)registerClientForBundleID:(id)a3
{
  id v5 = a3;
  [(MXCoreHandler *)self _updateClientAvailabilityAndPrepareDataActivityForBundleID:v5];
  if (([(MXClientUtilProtocol *)self->_clientUtil hasClientForBundleID:v5] & 1) == 0)
  {
    [(MXClientUtilProtocol *)self->_clientUtil registerClientForBundleID:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientDidRegisterForBundleID:v5];
  }
}

- (void)_updateClientAvailabilityAndPrepareDataActivityForBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(MXClientUtilProtocol *)self->_clientUtil persistAllClients];
  [(MXClientUtilProtocol *)self->_clientUtil updateClientAsAvailableFromPersistence];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v6 = logHandle;
    v7 = [(MXCoreHandler *)self clientUtil];
    v9[0] = 67109120;
    v9[1] = [v7 isClientAvailableForBundleID:v4];
    _os_log_impl(&dword_22BB49000, v6, OS_LOG_TYPE_INFO, "Interested clients now available State: %d\n", (uint8_t *)v9, 8u);
  }
  if ([(MXClientUtilProtocol *)self->_clientUtil isClientAvailableFromPersistence])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientIsAvailableForPreparingDataActivity];
  }
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (id)metricsForBundleID:(id)a3
{
  return (id)[(MXDeliveryDataCacherProtocol *)self->_deliveryDataCacher metricsForClient:a3];
}

- (BOOL)shouldDeliverDataForBundleID:(id)a3
{
  return [(MXClientUtilProtocol *)self->_clientUtil isClientAvailableForBundleID:a3];
}

- (id)diagnosticsForBundleID:(id)a3
{
  return (id)[(MXDeliveryDataCacherProtocol *)self->_deliveryDataCacher diagnosticsForClient:a3];
}

- (MXCoreHandler)initWithClientUtil:(id)a3 andDeliveryDataCacher:(id)a4 andDeliveryPathUtil:(id)a5 andMetricServices:(id)a6 andDelegate:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXCoreHandler;
  v17 = [(MXCoreHandler *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientUtil, a3);
    objc_storeStrong((id *)&v18->_deliveryDataCacher, a4);
    objc_storeStrong((id *)&v18->_deliveryPathUtil, a5);
    objc_storeStrong((id *)&v18->_metricServices, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    os_log_t v19 = os_log_create("com.apple.metrickit", "core.handler");
    logHandle = v18->_logHandle;
    v18->_logHandle = (OS_os_log *)v19;

    if (!v18->_logHandle) {
      objc_storeStrong((id *)&v18->_logHandle, &_os_log_internal);
    }
  }

  return v18;
}

- (void)registerClientAndTeamForBundleID:(id)a3 andTeamID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MXCoreHandler *)self _updateClientAvailabilityAndPrepareDataActivityForBundleID:v8];
  if (([(MXClientUtilProtocol *)self->_clientUtil hasClientForBundleID:v8] & 1) == 0)
  {
    [(MXClientUtilProtocol *)self->_clientUtil registerClientForBundleID:v8];
    [(MXClientUtilProtocol *)self->_clientUtil registerTeamForBundleID:v8 andTeamID:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientDidRegisterForBundleID:v8];
  }
}

- (void)performDataActivity
{
  if ([(MXClientUtilProtocol *)self->_clientUtil isClientAvailableFromPersistence])
  {
    [(MXCoreHandler *)self _processDataActivity];
  }
}

- (void)saveMetricPayloadsToDeliveryDirectoryAndReportSuccessForClientMetrics:(id)a3
{
  id v4 = a3;
  [(MXCoreHandler *)self _reportMetricKitUsage];
  unint64_t v5 = [(MXCoreHandler *)self _successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:v4];

  clientUtil = self->_clientUtil;

  [(MXClientUtilProtocol *)clientUtil reportPayloadDeliveriesSuccessWithSuccessCount:v5];
}

- (void)_processDataActivity
{
  id v4 = [(MXMetricServicesProtocol *)self->_metricServices clientMetricPayloadsForAllClients];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics:v4];

    [(MXCoreHandler *)self _handleClientAvailability];
    [(MXDeliveryDataCacherProtocol *)self->_deliveryDataCacher notifyDataAvailableForDelivery];
  }
}

- (void)_handleClientAvailability
{
  [(MXClientUtilProtocol *)self->_clientUtil persistAllClients];
  if (([(MXClientUtilProtocol *)self->_clientUtil hasAnyClient] & 1) == 0)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "No more available clients, resetting client availability key", v5, 2u);
    }
    [(MXClientUtilProtocol *)self->_clientUtil updateClientAsNotAvailableFromPersistence];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientIsNotAvailable];
  }
}

- (void)_reportMetricKitUsage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(MXClientUtilProtocol *)self->_clientUtil allClients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MXClientUtilProtocol *)self->_clientUtil reportMetricKitUsageForBundleID:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)_successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = v12;
          _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Payload delivery for client: %@", buf, 0xCu);
        }
        id v14 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, v16);
        v9 += [(MXDeliveryDataCacherProtocol *)self->_deliveryDataCacher saveMetrics:v14 toDeliveryDirectoryForBundleID:v12];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)shouldDeliverDataForBundleID:(id)a3 andTeamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MXClientUtilProtocol *)self->_clientUtil isClientAvailableForBundleID:v6])
  {
    uint64_t v8 = [(MXClientUtilProtocol *)self->_clientUtil teamIDForBundleID:v6];
    BOOL v9 = [v8 compare:v7] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setClientUtil:(id)a3
{
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeliveryDataCacher:(id)a3
{
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
}

- (MXMetricServicesProtocol)metricServices
{
  return (MXMetricServicesProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (MXCoreHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MXCoreHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metricServices, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);

  objc_storeStrong((id *)&self->_clientUtil, 0);
}

@end