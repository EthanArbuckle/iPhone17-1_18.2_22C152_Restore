@interface WiFiAvailabilityMatch
+ (id)matchWithNetwork:(id)a3 scannedNetwork:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAvailabilityMatch:(id)a3;
- (BOOL)isEqualToScannedNetwork:(id)a3;
- (BOOL)unwantedNetworkName;
- (NSDate)matchedAt;
- (NSString)SSID;
- (WiFiAvailabilityMatch)initWithNetwork:(id)a3 scannedNetwork:(id)a4;
- (WiFiCandidateNetwork)network;
- (WiFiScannedNetwork)scannedNetwork;
- (id)description;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setMatchedAt:(id)a3;
- (void)setScannedNetwork:(id)a3;
- (void)setUnwantedNetworkName:(BOOL)a3;
@end

@implementation WiFiAvailabilityMatch

+ (id)matchWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setMatched:1];
  v7 = [[WiFiAvailabilityMatch alloc] initWithNetwork:v6 scannedNetwork:v5];

  return v7;
}

- (WiFiAvailabilityMatch)initWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WiFiAvailabilityMatch;
  v9 = [(WiFiAvailabilityMatch *)&v30 init];
  v10 = v9;
  if (!v9)
  {
    matchedAt = 0;
    goto LABEL_19;
  }
  if (!v7)
  {
    NSLog(&cfstr_SMissingCandid.isa, "-[WiFiAvailabilityMatch initWithNetwork:scannedNetwork:]");
    matchedAt = v10;
    v10 = 0;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v9->_network, a3);
  p_scannedNetwork = (id *)&v10->_scannedNetwork;
  objc_storeStrong((id *)&v10->_scannedNetwork, a4);
  uint64_t v12 = [(WiFiCandidateNetwork *)v10->_network SSID];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(WiFiCandidateNetwork *)v10->_network SSID];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      network = v10->_network;
LABEL_9:
      v21 = [(WiFiCandidateNetwork *)network SSID];
      uint64_t v22 = [v21 copy];
      SSID = v10->_SSID;
      v10->_SSID = (NSString *)v22;
LABEL_10:

      goto LABEL_12;
    }
  }
  uint64_t v17 = [*p_scannedNetwork SSID];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [*p_scannedNetwork SSID];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      network = v10->_scannedNetwork;
      goto LABEL_9;
    }
  }
  if (!v10->_SSID)
  {
    v21 = [(WiFiScannedNetwork *)v10->_scannedNetwork scanProperties];
    SSID = [v21 objectForKey:@"SSID_STR"];
    uint64_t v28 = [SSID copy];
    v29 = v10->_SSID;
    v10->_SSID = (NSString *)v28;

    goto LABEL_10;
  }
LABEL_12:
  if ([v7 source] == 1)
  {
    uint64_t v24 = 2;
LABEL_17:
    v10->_priority = v24;
    goto LABEL_18;
  }
  if ([v7 source] != 2)
  {
    uint64_t v24 = 1;
    goto LABEL_17;
  }
  v10->_priority = 0;
LABEL_18:
  uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
  matchedAt = v10->_matchedAt;
  v10->_matchedAt = (NSDate *)v25;
LABEL_19:

  return v10;
}

- (BOOL)isEqualToScannedNetwork:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 SSID];
  id v5 = [(WiFiAvailabilityMatch *)self network];
  id v6 = [v5 SSID];
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WiFiAvailabilityMatch *)self isEqualToAvailabilityMatch:v4];

  return v5;
}

- (BOOL)isEqualToAvailabilityMatch:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WiFiAvailabilityMatch *)self SSID];
  id v6 = [v4 SSID];
  if ([v5 isEqualToString:v6])
  {
    char v7 = [(WiFiAvailabilityMatch *)self network];
    uint64_t v8 = [v7 source];
    v9 = [v4 network];
    BOOL v10 = v8 == [v9 source];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(WiFiAvailabilityMatch *)self SSID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  char v7 = [(WiFiAvailabilityMatch *)self network];
  objc_msgSend(v6, "appendFormat:", @"Source: %ld ", objc_msgSend(v7, "source"));

  uint64_t v8 = [(WiFiAvailabilityMatch *)self SSID];
  [v6 appendFormat:@"SSID: %@ ", v8];

  v9 = [(WiFiAvailabilityMatch *)self scannedNetwork];
  if (v9)
  {
    BOOL v10 = [(WiFiAvailabilityMatch *)self scannedNetwork];
    objc_msgSend(v6, "appendFormat:", @"RSSI: %ld ", objc_msgSend(v10, "RSSI"));
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", @"RSSI: %ld ", 0);
  }

  v11 = [(WiFiAvailabilityMatch *)self matchedAt];
  [v6 appendFormat:@"MatchedAt: %@ ", v11];

  if ([(WiFiAvailabilityMatch *)self unwantedNetworkName]) {
    [v6 appendString:@"unwantedNetworkName: 1"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (int64_t)priority
{
  return self->_priority;
}

- (WiFiCandidateNetwork)network
{
  return self->_network;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (WiFiScannedNetwork)scannedNetwork
{
  return self->_scannedNetwork;
}

- (void)setScannedNetwork:(id)a3
{
}

- (NSDate)matchedAt
{
  return self->_matchedAt;
}

- (void)setMatchedAt:(id)a3
{
}

- (BOOL)unwantedNetworkName
{
  return self->_unwantedNetworkName;
}

- (void)setUnwantedNetworkName:(BOOL)a3
{
  self->_unwantedNetworkName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedAt, 0);
  objc_storeStrong((id *)&self->_scannedNetwork, 0);
  objc_storeStrong((id *)&self->_SSID, 0);

  objc_storeStrong((id *)&self->_network, 0);
}

@end