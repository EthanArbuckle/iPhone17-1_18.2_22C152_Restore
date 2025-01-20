@interface NRDTestServer
- (void)dealloc;
@end

@implementation NRDTestServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePreferencesDictionary, 0);
  objc_storeStrong((id *)&self->_udpInputSourceCloud, 0);
  objc_storeStrong((id *)&self->_udpInputSource, 0);
  objc_storeStrong((id *)&self->_allConnections, 0);
  objc_storeStrong((id *)&self->_cloudServiceConnector, 0);
  objc_storeStrong((id *)&self->_serviceConnector, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  if (qword_1001F4930 != -1) {
    dispatch_once(&qword_1001F4930, &stru_1001C6978);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4930 != -1) {
      dispatch_once(&qword_1001F4930, &stru_1001C6978);
    }
    uint64_t v9 = 236;
    v10 = self;
    v7 = "";
    v8 = "-[NRDTestServer dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    udpInputSource = self->_udpInputSource;
    if (udpInputSource)
    {
      dispatch_source_cancel(udpInputSource);
      v4 = self->_udpInputSource;
      self->_udpInputSource = 0;
    }
    udpInputSourceCloud = self->_udpInputSourceCloud;
    if (udpInputSourceCloud)
    {
      dispatch_source_cancel(udpInputSourceCloud);
      v6 = self->_udpInputSourceCloud;
      self->_udpInputSourceCloud = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)NRDTestServer;
  [(NRDTestServer *)&v11 dealloc];
}

@end