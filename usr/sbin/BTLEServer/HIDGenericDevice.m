@interface HIDGenericDevice
- (HIDGenericDevice)initWithProperties:(id)a3 reports:(id)a4;
- (OS_dispatch_queue)queue;
- (__IOHIDUserDevice)device;
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDGenericDevice

- (HIDGenericDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDGenericDevice;
  v7 = [(HIDBluetoothDevice *)&v10 initWithProperties:v6 reports:a4];
  if (v7)
  {
    uint64_t v8 = IOHIDUserDeviceCreateWithOptions();
    v7->_device = (__IOHIDUserDevice *)v8;
    if (v8)
    {
      IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
      IOHIDUserDeviceRegisterSetReportCallback();
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  if ([(HIDGenericDevice *)self device]) {
    CFRelease([(HIDGenericDevice *)self device]);
  }
  v3.receiver = self;
  v3.super_class = (Class)HIDGenericDevice;
  [(HIDBluetoothDevice *)&v3 dealloc];
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)HIDGenericDevice;
  [(HIDBluetoothDevice *)&v5 start];
  id v3 = [(HIDBluetoothDevice *)self allocHIDQueue];
  [(HIDGenericDevice *)self setQueue:v3];

  [(HIDGenericDevice *)self device];
  v4 = [(HIDGenericDevice *)self queue];
  IOHIDUserDeviceScheduleWithDispatchQueue();

  [(HIDBluetoothDevice *)self notifyDidStart];
}

- (void)stop
{
  v6.receiver = self;
  v6.super_class = (Class)HIDGenericDevice;
  [(HIDBluetoothDevice *)&v6 stop];
  [(HIDGenericDevice *)self device];
  id v3 = [(HIDGenericDevice *)self queue];
  IOHIDUserDeviceUnscheduleFromDispatchQueue();

  v4 = [(HIDGenericDevice *)self queue];
  dispatch_set_context(v4, self);

  objc_super v5 = [(HIDGenericDevice *)self queue];
  dispatch_set_finalizer_f(v5, (dispatch_function_t)[j__objc_msgSend_notifyDidStop_2]);

  [(HIDGenericDevice *)self setQueue:0];
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  return -536870212;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  return -536870212;
}

- (__IOHIDUserDevice)device
{
  return self->_device;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end