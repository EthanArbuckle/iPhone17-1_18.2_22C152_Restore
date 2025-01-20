@interface WiFiRecommendationStub
- (BOOL)unwantedNetworkName;
- (NSString)SSID;
- (WiFiCandidateNetwork)network;
- (WiFiRecommendationStub)initWithWiFiNetwork:(__WiFiNetwork *)a3;
- (WiFiScannedNetwork)scannedNetwork;
- (int64_t)priority;
- (void)dealloc;
- (void)setSSID:(id)a3;
@end

@implementation WiFiRecommendationStub

- (WiFiRecommendationStub)initWithWiFiNetwork:(__WiFiNetwork *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiRecommendationStub;
  v4 = [(WiFiRecommendationStub *)&v11 init];
  v5 = (NSString *)sub_10001A43C(a3);
  v4->_SSID = v5;
  v6 = v5;
  v7 = [[WiFiScanObserverNetwork alloc] initWithWiFiNetworkRef:a3];
  v4->_scannedNetwork = (WiFiScannedNetwork *)v7;
  v8 = v7;
  v9 = objc_alloc_init(WiFiCandidateNetworkStub);
  [(WiFiCandidateNetworkStub *)v9 setSSID:v4->_SSID];
  [(WiFiCandidateNetworkStub *)v9 setSource:2];
  v4->_network = (WiFiCandidateNetwork *)v9;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiRecommendationStub;
  [(WiFiRecommendationStub *)&v3 dealloc];
}

- (WiFiCandidateNetwork)network
{
  return self->_network;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (WiFiScannedNetwork)scannedNetwork
{
  return self->_scannedNetwork;
}

- (BOOL)unwantedNetworkName
{
  return self->_unwantedNetworkName;
}

@end