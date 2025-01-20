@interface HIDRemoteDevice
- (BOOL)waitForReport;
- (HIDRemoteDevice)initWithProperties:(id)a3;
- (NSData)lastGetReport;
- (OS_dispatch_semaphore)semaphore;
- (id)description;
- (int)getReportHandler:(int)a3 reportID:(unsigned __int8)a4 report:(char *)a5 reportLength:(unint64_t)a6;
- (int)lastSetReportStatus;
- (int)setReportHandler:(int)a3 reportID:(unsigned __int8)a4 status:(int)a5;
- (unint64_t)deviceID;
- (unint64_t)endpointID;
- (unsigned)handleReportCount;
- (unsigned)handleReportError;
- (unsigned)side;
- (unsigned)transportVersion;
- (void)setDeviceID:(unint64_t)a3;
- (void)setEndpointID:(unint64_t)a3;
- (void)setHandleReportCount:(unsigned int)a3;
- (void)setHandleReportError:(unsigned int)a3;
- (void)setLastGetReport:(id)a3;
- (void)setLastSetReportStatus:(int)a3;
- (void)setSemaphore:(id)a3;
- (void)setSide:(unsigned __int8)a3;
- (void)setTransportVersion:(unsigned __int8)a3;
- (void)setWaitForReport:(BOOL)a3;
@end

@implementation HIDRemoteDevice

- (HIDRemoteDevice)initWithProperties:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HIDRemoteDevice;
  v3 = [(HIDUserDevice *)&v7 initWithProperties:a3];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [(HIDRemoteDevice *)v3 setSemaphore:v4];

    v5 = v3;
  }

  return v3;
}

- (int)setReportHandler:(int)a3 reportID:(unsigned __int8)a4 status:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(HIDRemoteDevice *)self waitForReport])
  {
    [(HIDRemoteDevice *)self setLastSetReportStatus:v5];
    objc_super v7 = [(HIDRemoteDevice *)self semaphore];
    dispatch_semaphore_signal(v7);
  }
  else
  {
    LODWORD(v5) = -536870165;
  }
  return v5;
}

- (int)getReportHandler:(int)a3 reportID:(unsigned __int8)a4 report:(char *)a5 reportLength:(unint64_t)a6
{
  if (![(HIDRemoteDevice *)self waitForReport]) {
    return -536870165;
  }
  v9 = [MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a6];
  [(HIDRemoteDevice *)self setLastGetReport:v9];

  v10 = [(HIDRemoteDevice *)self semaphore];
  dispatch_semaphore_signal(v10);

  return 0;
}

- (id)description
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID([(HIDUserDevice *)self service], &entryID);
  v3 = NSString;
  unint64_t v4 = [(HIDRemoteDevice *)self deviceID];
  uint64_t v5 = entryID;
  uint64_t v6 = [(HIDRemoteDevice *)self handleReportCount];
  uint64_t v7 = [(HIDRemoteDevice *)self handleReportError];
  v11.receiver = self;
  v11.super_class = (Class)HIDRemoteDevice;
  v8 = [(HIDUserDevice *)&v11 description];
  v9 = [v3 stringWithFormat:@"<HIDRemoteHIDUserDevice:%p id:%lld service:%llx handleReportCount:%u handleReportError:%u device:%@>", self, v4, v5, v6, v7, v8];

  return v9;
}

- (unint64_t)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(unint64_t)a3
{
  self->_endpointID = a3;
}

- (unint64_t)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unint64_t)a3
{
  self->_deviceID = a3;
}

- (unsigned)transportVersion
{
  return self->_transportVersion;
}

- (void)setTransportVersion:(unsigned __int8)a3
{
  self->_transportVersion = a3;
}

- (unsigned)side
{
  return self->_side;
}

- (void)setSide:(unsigned __int8)a3
{
  self->_side = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSemaphore:(id)a3
{
}

- (NSData)lastGetReport
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastGetReport:(id)a3
{
}

- (int)lastSetReportStatus
{
  return self->_lastSetReportStatus;
}

- (void)setLastSetReportStatus:(int)a3
{
  self->_lastSetReportStatus = a3;
}

- (BOOL)waitForReport
{
  return self->_waitForReport;
}

- (void)setWaitForReport:(BOOL)a3
{
  self->_waitForReport = a3;
}

- (unsigned)handleReportCount
{
  return self->_handleReportCount;
}

- (void)setHandleReportCount:(unsigned int)a3
{
  self->_handleReportCount = a3;
}

- (unsigned)handleReportError
{
  return self->_handleReportError;
}

- (void)setHandleReportError:(unsigned int)a3
{
  self->_handleReportError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGetReport, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end