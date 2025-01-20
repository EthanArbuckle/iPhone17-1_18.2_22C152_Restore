@interface WiFiUsageInterfaceCapabilities
- (BOOL)deviceSupports:(int)a3;
- (NSSet)deviceCapabilities;
- (NSString)interfaceName;
- (WiFiUsageInterfaceCapabilities)initWithInterfaceName:(id)a3;
- (_Apple80211)a11Ref;
- (id)description;
- (int)supportedPhyModes;
- (unint64_t)currentNumberOfSpatialStreams;
- (unint64_t)maxInterfacePHYRate;
- (unint64_t)maxPHYRate;
- (void)dealloc;
- (void)setA11Ref:(_Apple80211 *)a3;
- (void)setDeviceCapabilities:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setMaxPHYRate:(unint64_t)a3;
- (void)setSupportedPhyModes:(int)a3;
@end

@implementation WiFiUsageInterfaceCapabilities

- (unint64_t)maxInterfacePHYRate
{
  unint64_t result = self->_maxPHYRate;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(WiFiUsageInterfaceCapabilities *)self supportedPhyModes])
    {
      if ([(WiFiUsageInterfaceCapabilities *)self deviceSupports:94]) {
        uint64_t v4 = 160;
      }
      else {
        uint64_t v4 = 80;
      }
      unint64_t result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:2 Bw:v4 Phy:self->_supportedPhyModes];
      self->_maxPHYRate = result;
    }
    else
    {
      return self->_maxPHYRate;
    }
  }
  return result;
}

- (WiFiUsageInterfaceCapabilities)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSLog(&cfstr_SCannotCreateI.isa, "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", 0);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageInterfaceCapabilities;
  self = [(WiFiUsageInterfaceCapabilities *)&v11 init];
  v5 = (NSString *)[v4 copy];
  interfaceName = self->_interfaceName;
  self->_interfaceName = v5;

  uint64_t v7 = Apple80211Open();
  if (v7)
  {
    NSLog(&cfstr_SApple80211ope.isa, "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", v7);
    goto LABEL_6;
  }
  uint64_t v8 = Apple80211BindToInterface();
  if (v8)
  {
    NSLog(&cfstr_SApple80211bin.isa, "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", v8);
    goto LABEL_6;
  }
  self->_maxPHYRate = 0x7FFFFFFFFFFFFFFFLL;
  self->_supportedPhyModes = 0;
  self = self;
  v9 = self;
LABEL_7:

  return v9;
}

- (int)supportedPhyModes
{
  int result = self->_supportedPhyModes;
  if (!result)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = Apple80211Get();
    if (v5)
    {
      NSLog(&cfstr_SApple80211cop.isa, "-[WiFiUsageInterfaceCapabilities supportedPhyModes]", v5);
    }
    else
    {
      v6 = [v4 objectForKey:@"PHYMODE_SUPPORTED"];
      self->_supportedPhyModes = [v6 unsignedIntValue];
    }
    return self->_supportedPhyModes;
  }
  return result;
}

- (unint64_t)currentNumberOfSpatialStreams
{
  uint64_t v2 = Apple80211CopyValue();
  if (v2) {
    NSLog(&cfstr_SApple80211cop.isa, "-[WiFiUsageInterfaceCapabilities currentNumberOfSpatialStreams]", v2);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSSet)deviceCapabilities
{
  deviceCapabilities = self->_deviceCapabilities;
  if (!deviceCapabilities)
  {
    uint64_t v4 = Apple80211CopyValue();
    if (v4)
    {
      NSLog(&cfstr_SApple80211cop.isa, "-[WiFiUsageInterfaceCapabilities deviceCapabilities]", v4);
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:0];
      v6 = self->_deviceCapabilities;
      self->_deviceCapabilities = v5;
    }
    deviceCapabilities = self->_deviceCapabilities;
  }

  return deviceCapabilities;
}

- (BOOL)deviceSupports:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(WiFiUsageInterfaceCapabilities *)self deviceCapabilities];

  if (!v5) {
    return 0;
  }
  deviceCapabilities = self->_deviceCapabilities;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v3];
  LOBYTE(deviceCapabilities) = [(NSSet *)deviceCapabilities containsObject:v7];

  return (char)deviceCapabilities;
}

- (id)description
{
  uint64_t v3 = NSString;
  interfaceName = self->_interfaceName;
  uint64_t v5 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:[(WiFiUsageInterfaceCapabilities *)self supportedPhyModes]];
  v6 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", +[WiFiUsageLQMTransformations maxPhyModeFrom:self->_supportedPhyModes]);
  uint64_t v7 = [v3 stringWithFormat:@"%@: supportedPhyModes:%@ maxPhyMode:%@ maxPHYRate:%d", interfaceName, v5, v6, -[WiFiUsageInterfaceCapabilities maxInterfacePHYRate](self, "maxInterfacePHYRate")];

  return v7;
}

- (void)dealloc
{
  if (self->_a11Ref) {
    Apple80211Close();
  }
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageInterfaceCapabilities;
  [(WiFiUsageInterfaceCapabilities *)&v3 dealloc];
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (_Apple80211)a11Ref
{
  return self->_a11Ref;
}

- (void)setA11Ref:(_Apple80211 *)a3
{
  self->_a11Ref = a3;
}

- (unint64_t)maxPHYRate
{
  return self->_maxPHYRate;
}

- (void)setMaxPHYRate:(unint64_t)a3
{
  self->_maxPHYRate = a3;
}

- (void)setSupportedPhyModes:(int)a3
{
  self->_supportedPhyModes = a3;
}

- (void)setDeviceCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end