@interface SDHotspotRequestRecord
- (NSDate)startTime;
- (NSString)requestID;
- (SDHotspotRequestRecord)initWithHotspotDevice:(id)a3 startTime:(id)a4 requestID:(id)a5;
- (SFRemoteHotspotDevice)remoteHotspotDevice;
- (void)setRemoteHotspotDevice:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation SDHotspotRequestRecord

- (SDHotspotRequestRecord)initWithHotspotDevice:(id)a3 startTime:(id)a4 requestID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SDHotspotRequestRecord;
  v12 = [(SDHotspotRequestRecord *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_remoteHotspotDevice, a3);
    objc_storeStrong((id *)&v13->_startTime, a4);
    objc_storeStrong((id *)&v13->_requestID, a5);
  }

  return v13;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestID:(id)a3
{
}

- (SFRemoteHotspotDevice)remoteHotspotDevice
{
  return (SFRemoteHotspotDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteHotspotDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteHotspotDevice, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end