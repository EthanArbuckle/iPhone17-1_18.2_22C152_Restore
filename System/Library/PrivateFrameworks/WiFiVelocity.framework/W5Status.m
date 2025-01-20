@interface W5Status
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStatus:(id)a3;
- (NSArray)diagnosticsModes;
- (W5AWDLStatus)awdl;
- (W5BluetoothStatus)bluetooth;
- (W5NetworkStatus)network;
- (W5PowerStatus)power;
- (W5Status)initWithCoder:(id)a3;
- (W5SummaryFaults)lastHrFaults;
- (W5SummaryLinkTests)lastHrLinkTests;
- (W5SummaryRecoveries)lastHrRecoveries;
- (W5WiFiStatus)wifi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAwdl:(id)a3;
- (void)setBluetooth:(id)a3;
- (void)setDiagnosticsModes:(id)a3;
- (void)setLastHrFaults:(id)a3;
- (void)setLastHrLinkTests:(id)a3;
- (void)setLastHrRecoveries:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setPower:(id)a3;
- (void)setWifi:(id)a3;
@end

@implementation W5Status

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5Status;
  [(W5Status *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"WiFi=>\n%@", self->_wifi];
  [v3 appendFormat:@"\nAWDL=>\n%@", self->_awdl];
  [v3 appendFormat:@"\nBluetooth=>\n%@", self->_bluetooth];
  [v3 appendFormat:@"\nNetwork=>\n%@", self->_network];
  [v3 appendFormat:@"\nPower=>\n%@", self->_power];
  [v3 appendFormat:@"\nDiagnostics Modes=>\n%@", self->_diagnosticsModes];
  [v3 appendFormat:@"\nLastHr Faults=>\n%@", self->_lastHrFaults];
  [v3 appendFormat:@"\nLastHr LinkTests=>\n%@", self->_lastHrLinkTests];
  [v3 appendFormat:@"\nLastHr Recoveries=>\n%@", self->_lastHrRecoveries];
  v4 = (void *)[v3 copy];
  return v4;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5Status;
  if (-[W5Status conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToStatus:(id)a3
{
  wifi = self->_wifi;
  if (!wifi)
  {
    if (![a3 wifi]) {
      goto LABEL_5;
    }
    wifi = self->_wifi;
  }
  int v6 = -[W5WiFiStatus isEqual:](wifi, "isEqual:", [a3 wifi]);
  if (!v6) {
    return v6;
  }
LABEL_5:
  awdl = self->_awdl;
  if (!awdl)
  {
    if (![a3 awdl]) {
      goto LABEL_9;
    }
    awdl = self->_awdl;
  }
  int v6 = -[W5AWDLStatus isEqual:](awdl, "isEqual:", [a3 awdl]);
  if (!v6) {
    return v6;
  }
LABEL_9:
  bluetooth = self->_bluetooth;
  if (!bluetooth)
  {
    if (![a3 bluetooth]) {
      goto LABEL_13;
    }
    bluetooth = self->_bluetooth;
  }
  int v6 = -[W5BluetoothStatus isEqual:](bluetooth, "isEqual:", [a3 bluetooth]);
  if (!v6) {
    return v6;
  }
LABEL_13:
  network = self->_network;
  if (!network)
  {
    if (![a3 network]) {
      goto LABEL_17;
    }
    network = self->_network;
  }
  int v6 = -[W5NetworkStatus isEqual:](network, "isEqual:", [a3 network]);
  if (!v6) {
    return v6;
  }
LABEL_17:
  power = self->_power;
  if (!power)
  {
    if (![a3 power]) {
      goto LABEL_21;
    }
    power = self->_power;
  }
  int v6 = -[W5PowerStatus isEqual:](power, "isEqual:", [a3 power]);
  if (!v6) {
    return v6;
  }
LABEL_21:
  diagnosticsModes = self->_diagnosticsModes;
  if (!diagnosticsModes)
  {
    if (![a3 diagnosticsModes]) {
      goto LABEL_25;
    }
    diagnosticsModes = self->_diagnosticsModes;
  }
  int v6 = -[NSArray isEqual:](diagnosticsModes, "isEqual:", [a3 diagnosticsModes]);
  if (!v6) {
    return v6;
  }
LABEL_25:
  lastHrFaults = self->_lastHrFaults;
  if (!lastHrFaults)
  {
    if (![a3 lastHrFaults]) {
      goto LABEL_29;
    }
    lastHrFaults = self->_lastHrFaults;
  }
  int v6 = -[W5SummaryFaults isEqual:](lastHrFaults, "isEqual:", [a3 lastHrFaults]);
  if (!v6) {
    return v6;
  }
LABEL_29:
  lastHrLinkTests = self->_lastHrLinkTests;
  if (lastHrLinkTests) {
    goto LABEL_32;
  }
  if ([a3 lastHrLinkTests])
  {
    lastHrLinkTests = self->_lastHrLinkTests;
LABEL_32:
    int v6 = -[W5SummaryLinkTests isEqual:](lastHrLinkTests, "isEqual:", [a3 lastHrLinkTests]);
    if (!v6) {
      return v6;
    }
  }
  lastHrRecoveries = self->_lastHrRecoveries;
  if (!lastHrRecoveries)
  {
    if (![a3 lastHrRecoveries])
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    lastHrRecoveries = self->_lastHrRecoveries;
  }
  uint64_t v15 = [a3 lastHrRecoveries];
  LOBYTE(v6) = [(W5SummaryRecoveries *)lastHrRecoveries isEqual:v15];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5Status *)self isEqualToStatus:a3];
}

- (unint64_t)hash
{
  unint64_t v3 = [(W5WiFiStatus *)self->_wifi hash];
  uint64_t v4 = [(W5AWDLStatus *)self->_awdl hash] ^ v3;
  unint64_t v5 = [(W5BluetoothStatus *)self->_bluetooth hash];
  unint64_t v6 = v4 ^ v5 ^ [(W5NetworkStatus *)self->_network hash];
  unint64_t v7 = [(W5PowerStatus *)self->_power hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_diagnosticsModes hash];
  unint64_t v9 = v6 ^ v8 ^ [(W5SummaryFaults *)self->_lastHrFaults hash];
  unint64_t v10 = [(W5SummaryLinkTests *)self->_lastHrLinkTests hash];
  return v9 ^ v10 ^ [(W5SummaryRecoveries *)self->_lastHrRecoveries hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5Status allocWithZone:a3] init];
  [(W5Status *)v4 setWifi:self->_wifi];
  [(W5Status *)v4 setAwdl:self->_awdl];
  [(W5Status *)v4 setBluetooth:self->_bluetooth];
  [(W5Status *)v4 setNetwork:self->_network];
  [(W5Status *)v4 setPower:self->_power];
  [(W5Status *)v4 setDiagnosticsModes:[(NSArray *)self->_diagnosticsModes copy]];
  [(W5Status *)v4 setLastHrFaults:self->_lastHrFaults];
  [(W5Status *)v4 setLastHrLinkTests:self->_lastHrLinkTests];
  [(W5Status *)v4 setLastHrRecoveries:self->_lastHrRecoveries];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_wifi forKey:@"_wifi"];
  [a3 encodeObject:self->_awdl forKey:@"_awdl"];
  [a3 encodeObject:self->_bluetooth forKey:@"_bluetooth"];
  [a3 encodeObject:self->_network forKey:@"_network"];
  [a3 encodeObject:self->_power forKey:@"_power"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_diagnosticsModes, 1, 0), @"_diagnosticsModes");
  [a3 encodeObject:self->_lastHrFaults forKey:@"_lastHrFaults"];
  [a3 encodeObject:self->_lastHrLinkTests forKey:@"_lastHrLinkTests"];
  lastHrRecoveries = self->_lastHrRecoveries;
  [a3 encodeObject:lastHrRecoveries forKey:@"_lastHrRecoveries"];
}

- (W5Status)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)W5Status;
  uint64_t v4 = [(W5Status *)&v10 init];
  if (v4)
  {
    v4->_wifi = (W5WiFiStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_wifi"), "copy");
    v4->_awdl = (W5AWDLStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdl"), "copy");
    v4->_bluetooth = (W5BluetoothStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_bluetooth"), "copy");
    v4->_network = (W5NetworkStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_network"), "copy");
    v4->_power = (W5PowerStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_power"), "copy");
    unint64_t v5 = (void *)MEMORY[0x263F08928];
    unint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v4->_diagnosticsModes = (NSArray *)objc_msgSend((id)objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_diagnosticsModes"), 0), "copy");
    v4->_lastHrFaults = (W5SummaryFaults *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastHrFaults"), "copy");
    v4->_lastHrLinkTests = (W5SummaryLinkTests *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastHrLinkTests"), "copy");
    v4->_lastHrRecoveries = (W5SummaryRecoveries *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastHrRecoveries"), "copy");
  }
  return v4;
}

- (W5WiFiStatus)wifi
{
  return self->_wifi;
}

- (void)setWifi:(id)a3
{
}

- (W5AWDLStatus)awdl
{
  return self->_awdl;
}

- (void)setAwdl:(id)a3
{
}

- (W5BluetoothStatus)bluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(id)a3
{
}

- (W5NetworkStatus)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (W5PowerStatus)power
{
  return self->_power;
}

- (void)setPower:(id)a3
{
}

- (NSArray)diagnosticsModes
{
  return self->_diagnosticsModes;
}

- (void)setDiagnosticsModes:(id)a3
{
}

- (W5SummaryFaults)lastHrFaults
{
  return self->_lastHrFaults;
}

- (void)setLastHrFaults:(id)a3
{
}

- (W5SummaryLinkTests)lastHrLinkTests
{
  return self->_lastHrLinkTests;
}

- (void)setLastHrLinkTests:(id)a3
{
}

- (W5SummaryRecoveries)lastHrRecoveries
{
  return self->_lastHrRecoveries;
}

- (void)setLastHrRecoveries:(id)a3
{
}

@end