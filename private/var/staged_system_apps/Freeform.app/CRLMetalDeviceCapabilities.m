@interface CRLMetalDeviceCapabilities
- (BOOL)isCoreImageMetalCapable;
- (BOOL)supportsFunctionBufferReadWrite;
- (BOOL)supportsGPUFamily:(int64_t)a3;
- (CRLMetalDeviceCapabilities)initWithDevice:(id)a3;
- (MTLDevice)device;
- (double)maximumTotalThreadgroupMemory;
- (int64_t)p_deviceGPUFamily;
- (void)p_assignFeatureSet;
@end

@implementation CRLMetalDeviceCapabilities

- (CRLMetalDeviceCapabilities)initWithDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLMetalDeviceCapabilities;
  v5 = [(CRLMetalDeviceCapabilities *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA008);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B2C14();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA028);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalDeviceCapabilities initWithDevice:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 20, 0, "invalid nil value for '%{public}s'", "device");
    }
    objc_storeWeak((id *)&v5->_device, v4);
    v5->_deviceGPUFamily = [(CRLMetalDeviceCapabilities *)v5 p_deviceGPUFamily];
    [(CRLMetalDeviceCapabilities *)v5 p_assignFeatureSet];
  }

  return v5;
}

- (int64_t)p_deviceGPUFamily
{
  p_device = &self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  unsigned __int8 v4 = [WeakRetained supportsFamily:1005];

  if (v4) {
    return 5;
  }
  id v6 = objc_loadWeakRetained((id *)p_device);
  unsigned __int8 v7 = [v6 supportsFamily:1004];

  if (v7) {
    return 4;
  }
  id v8 = objc_loadWeakRetained((id *)p_device);
  unsigned __int8 v9 = [v8 supportsFamily:1003];

  if (v9) {
    return 3;
  }
  id v10 = objc_loadWeakRetained((id *)p_device);
  unsigned __int8 v11 = [v10 supportsFamily:1002];

  if (v11) {
    return 2;
  }
  id v12 = objc_loadWeakRetained((id *)p_device);
  unsigned int v13 = [v12 supportsFamily:1001];

  return v13;
}

- (BOOL)supportsGPUFamily:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 0xFFFFFFFFFFFFFFFALL) {
    return self->_deviceGPUFamily >= a3;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FA048);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B2CC4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FA068);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v3);
  }
  unsigned __int8 v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalDeviceCapabilities supportsGPUFamily:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMetalDeviceCapabilities.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:62 isFatal:0 description:"Can't compare iOS to macOS GPUs."];

  return 0;
}

- (void)p_assignFeatureSet
{
  self->_supportsFunctionBufferReadWrite = 0;
  self->_maximumTotalThreadgroupMemory = 16352.0;
  if ([(CRLMetalDeviceCapabilities *)self supportsGPUFamily:5])
  {
    self->_supportsFunctionBufferReadWrite = 1;
    double v3 = 65536.0;
LABEL_5:
    self->_maximumTotalThreadgroupMemory = v3;
    goto LABEL_6;
  }
  if ([(CRLMetalDeviceCapabilities *)self supportsGPUFamily:4])
  {
    self->_supportsFunctionBufferReadWrite = 1;
    double v3 = 32768.0;
    goto LABEL_5;
  }
  if ([(CRLMetalDeviceCapabilities *)self supportsGPUFamily:3])
  {
    self->_maximumTotalThreadgroupMemory = 16384.0;
    self->_supportsFunctionBufferReadWrite = 1;
  }
LABEL_6:
  self->_isCoreImageMetalCapable = [(CRLMetalDeviceCapabilities *)self supportsGPUFamily:1];
}

- (MTLDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (MTLDevice *)WeakRetained;
}

- (BOOL)supportsFunctionBufferReadWrite
{
  return self->_supportsFunctionBufferReadWrite;
}

- (double)maximumTotalThreadgroupMemory
{
  return self->_maximumTotalThreadgroupMemory;
}

- (BOOL)isCoreImageMetalCapable
{
  return self->_isCoreImageMetalCapable;
}

- (void).cxx_destruct
{
}

@end