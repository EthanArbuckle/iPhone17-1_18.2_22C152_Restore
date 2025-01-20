@interface WiFiTrafficEngManager
- (WFTrafficEngManager)trafficEng;
- (WiFiTrafficEngManager)initWithArgs:(__WiFiLQAMgr *)a3;
- (__CFDictionary)retrieveCurrentLinkHealth;
- (__CFDictionary)retrieveEventDetails;
- (__WiFiDeviceManager)deviceMgr;
- (__WiFiLQAMgr)lqaMgr;
- (void)dealloc;
- (void)discoveryIndication;
- (void)handleCriticalAppEvent:(id)a3;
- (void)setDeviceMgr:(__WiFiDeviceManager *)a3;
- (void)setLqaMgr:(__WiFiLQAMgr *)a3;
- (void)setTrafficEng:(id)a3;
@end

@implementation WiFiTrafficEngManager

- (WiFiTrafficEngManager)initWithArgs:(__WiFiLQAMgr *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiTrafficEngManager;
  v4 = [(WiFiTrafficEngManager *)&v9 init];
  if (!v4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s Failed to allocate" args:@"-[WiFiTrafficEngManager initWithArgs:]"];
    }
    goto LABEL_9;
  }
  id v5 = [objc_alloc((Class)WFTrafficEngManager) initWithTrafficEngDelegate:v4];
  if (!v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s lqaMgr is nil" args:("-[WiFiTrafficEngManager initWithArgs:]")];
    }
LABEL_9:

    return 0;
  }
  v6 = v5;
  [(WiFiTrafficEngManager *)v4 setLqaMgr:a3];
  [(WiFiTrafficEngManager *)v4 setTrafficEng:v6];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiTrafficEngManager;
  [(WiFiTrafficEngManager *)&v3 dealloc];
}

- (__CFDictionary)retrieveCurrentLinkHealth
{
  v2 = [(WiFiTrafficEngManager *)self lqaMgr];

  return sub_10003E410((const UInt8 *)v2);
}

- (void)handleCriticalAppEvent:(id)a3
{
  v4 = [(WiFiTrafficEngManager *)self lqaMgr];

  sub_10003E6A8((uint64_t)v4, a3);
}

- (void)discoveryIndication
{
  v2 = [(WiFiTrafficEngManager *)self lqaMgr];

  nullsub_3(v2, v3);
}

- (__CFDictionary)retrieveEventDetails
{
  v2 = [(WiFiTrafficEngManager *)self lqaMgr];

  return sub_10003E944((uint64_t *)v2);
}

- (WFTrafficEngManager)trafficEng
{
  return (WFTrafficEngManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrafficEng:(id)a3
{
}

- (__WiFiDeviceManager)deviceMgr
{
  return self->_deviceMgr;
}

- (void)setDeviceMgr:(__WiFiDeviceManager *)a3
{
  self->_deviceMgr = a3;
}

- (__WiFiLQAMgr)lqaMgr
{
  return self->_lqaMgr;
}

- (void)setLqaMgr:(__WiFiLQAMgr *)a3
{
  self->_lqaMgr = a3;
}

@end