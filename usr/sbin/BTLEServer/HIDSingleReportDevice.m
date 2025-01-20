@interface HIDSingleReportDevice
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
@end

@implementation HIDSingleReportDevice

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  int v6 = a4;
  id v8 = a3;
  v9 = v8;
  if (v6)
  {
    id v10 = [v8 length];
    v11 = (char *)&v16 - (((unint64_t)v10 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, (size_t)v10 + 1);
    unsigned char *v11 = v6;
    [v9 getBytes:v11 + 1 length:v10];

    IOHIDUserDeviceHandleReportWithTimeStamp([(HIDGenericDevice *)self device], a5, v11, (CFIndex)v10 + 1);
  }
  else
  {
    v12 = [(HIDGenericDevice *)self device];
    id v13 = v9;
    v14 = (const uint8_t *)[v13 bytes];
    id v15 = [v13 length];

    IOHIDUserDeviceHandleReportWithTimeStamp(v12, a5, v14, (CFIndex)v15);
  }
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  id v12 = 0;
  int v8 = [(HIDBluetoothDevice *)self getReportData:&v12 reportID:a5 reportType:*(void *)&a6 error:0];
  id v9 = v12;
  id v10 = v9;
  if (!v8)
  {
    if ((unint64_t)[v9 length] <= *a4)
    {
      [v10 getBytes:a3];
      int v8 = 0;
      *a4 = (int64_t)[v10 length];
    }
    else
    {
      int v8 = -536870181;
    }
  }

  return v8;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  id v9 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  LODWORD(v6) = [(HIDBluetoothDevice *)self setReportData:v9 reportID:v7 reportType:v6 error:0];

  return v6;
}

@end