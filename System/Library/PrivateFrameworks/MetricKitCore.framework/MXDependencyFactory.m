@interface MXDependencyFactory
+ (id)shared;
- (MXBundleUtilProtocol)bundleUtil;
- (MXCleanUtil)cleanUtil;
- (MXClientUtilProtocol)clientUtil;
- (MXDateUtil)dateUtil;
- (MXDeliveryDataCacherProtocol)deliveryDataCacher;
- (MXDeliveryPathUtilProtocol)deliveryPathUtil;
- (MXDependencyFactory)init;
- (MXDiagnosticServicesProtocol)diagnosticServices;
- (MXMetricServicesProtocol)metricServices;
- (MXPayloadValidator)payloadValidator;
- (MXSourceDataCacherProtocol)sourceDataCacher;
- (MXSourcePathUtilProtocol)sourcePathUtil;
- (MXStorageUtilProtocol)storageUtil;
- (id)handlerForMXCoreWithDelegate:(id)a3;
- (id)handlerForMXSourceWithDelegate:(id)a3;
- (void)_initIvar;
@end

@implementation MXDependencyFactory

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MXDependencyFactory_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_result;

  return v2;
}

uint64_t __29__MXDependencyFactory_shared__block_invoke(uint64_t a1)
{
  shared_result = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (MXDependencyFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)MXDependencyFactory;
  v2 = [(MXDependencyFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MXDependencyFactory *)v2 _initIvar];
  }
  return v3;
}

- (void)_initIvar
{
  v3 = objc_alloc_init(MXPayloadValidator);
  payloadValidator = self->_payloadValidator;
  self->_payloadValidator = v3;

  objc_super v5 = objc_alloc_init(MXBundleUtil);
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = (MXBundleUtilProtocol *)v5;

  v7 = objc_alloc_init(MXStorageUtil);
  storageUtil = self->_storageUtil;
  self->_storageUtil = (MXStorageUtilProtocol *)v7;

  v9 = [[MXDeliveryPathUtil alloc] initWithStorageUtil:self->_storageUtil andBundleUtil:self->_bundleUtil];
  deliveryPathUtil = self->_deliveryPathUtil;
  self->_deliveryPathUtil = (MXDeliveryPathUtilProtocol *)v9;

  v11 = objc_alloc_init(MXClientUtil);
  clientUtil = self->_clientUtil;
  self->_clientUtil = (MXClientUtilProtocol *)v11;

  v13 = [[MXDeliveryDataCacher alloc] initWithClientUtil:self->_clientUtil andDeliveryPathUtil:self->_deliveryPathUtil andStorageUtil:self->_storageUtil];
  deliveryDataCacher = self->_deliveryDataCacher;
  self->_deliveryDataCacher = (MXDeliveryDataCacherProtocol *)v13;

  v15 = [[MXCleanUtil alloc] initWithClientUtil:self->_clientUtil andDeliveryPathUtil:self->_deliveryPathUtil];
  cleanUtil = self->_cleanUtil;
  self->_cleanUtil = v15;

  v17 = objc_alloc_init(MXDateUtil);
  dateUtil = self->_dateUtil;
  self->_dateUtil = v17;

  v19 = [[MXSourcePathUtil alloc] initWithDateUtil:self->_dateUtil andStorageUtil:self->_storageUtil];
  sourcePathUtil = self->_sourcePathUtil;
  self->_sourcePathUtil = (MXSourcePathUtilProtocol *)v19;

  v21 = [[MXSourceDataCacher alloc] initWithSourcePathUtil:self->_sourcePathUtil andStorageUtil:self->_storageUtil andBundleUtil:self->_bundleUtil];
  sourceDataCacher = self->_sourceDataCacher;
  self->_sourceDataCacher = (MXSourceDataCacherProtocol *)v21;

  v23 = [[MXMetricServices alloc] initWithClientUtil:self->_clientUtil andSourcePathUtil:self->_sourcePathUtil];
  metricServices = self->_metricServices;
  self->_metricServices = (MXMetricServicesProtocol *)v23;

  self->_diagnosticServices = (MXDiagnosticServicesProtocol *)[[MXDiagnosticServices alloc] initWithSourcePathUtil:self->_sourcePathUtil andDateUtil:self->_dateUtil];

  MEMORY[0x270F9A758]();
}

- (id)handlerForMXCoreWithDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[MXCoreHandler alloc] initWithClientUtil:self->_clientUtil andDeliveryDataCacher:self->_deliveryDataCacher andDeliveryPathUtil:self->_deliveryPathUtil andMetricServices:self->_metricServices andDelegate:v4];

  return v5;
}

- (id)handlerForMXSourceWithDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[MXSourceHandler alloc] initWithSourceDataCacher:self->_sourceDataCacher andDeliveryDataCacher:self->_deliveryDataCacher andSourcePathUtil:self->_sourcePathUtil andBundleUtil:self->_bundleUtil andDiagnosticServices:self->_diagnosticServices andDelegate:v4];

  return v5;
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (MXCleanUtil)cleanUtil
{
  return (MXCleanUtil *)objc_getProperty(self, a2, 40, 1);
}

- (MXPayloadValidator)payloadValidator
{
  return (MXPayloadValidator *)objc_getProperty(self, a2, 48, 1);
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 64, 1);
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (MXSourceDataCacherProtocol)sourceDataCacher
{
  return (MXSourceDataCacherProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (MXMetricServicesProtocol)metricServices
{
  return (MXMetricServicesProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (MXDiagnosticServicesProtocol)diagnosticServices
{
  return (MXDiagnosticServicesProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticServices, 0);
  objc_storeStrong((id *)&self->_metricServices, 0);
  objc_storeStrong((id *)&self->_sourceDataCacher, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_dateUtil, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_payloadValidator, 0);
  objc_storeStrong((id *)&self->_cleanUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);

  objc_storeStrong((id *)&self->_bundleUtil, 0);
}

@end