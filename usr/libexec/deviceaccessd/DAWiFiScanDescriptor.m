@interface DAWiFiScanDescriptor
- (DADiscoveryConfiguration)configuration;
- (DAWiFiScanDescriptor)initWithPrefix:(id)a3;
- (DAWiFiScanDescriptor)initWithSSID:(id)a3;
- (NSString)SSID;
- (NSString)associationIdentifier;
- (NSString)bundleID;
- (NSString)prefix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)scanResultPredicate;
- (void)setAssociationIdentifier:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setSSID:(id)a3;
@end

@implementation DAWiFiScanDescriptor

- (DAWiFiScanDescriptor)initWithSSID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAWiFiScanDescriptor;
  v5 = [(DAWiFiScanDescriptor *)&v10 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    SSID = v5->_SSID;
    v5->_SSID = v6;

    v8 = v5;
  }

  return v5;
}

- (DAWiFiScanDescriptor)initWithPrefix:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAWiFiScanDescriptor;
  v5 = [(DAWiFiScanDescriptor *)&v10 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    prefix = v5->_prefix;
    v5->_prefix = v6;

    v8 = v5;
  }

  return v5;
}

- (id)scanResultPredicate
{
  v3 = [(DAWiFiScanDescriptor *)self SSID];

  if (v3)
  {
    CFStringRef v4 = @"SELF.networkName ==[c] %@";
    uint64_t v5 = 40;
LABEL_5:
    v7 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v4, *(Class *)((char *)&self->super.isa + v5));
    goto LABEL_6;
  }
  v6 = [(DAWiFiScanDescriptor *)self prefix];

  if (v6)
  {
    CFStringRef v4 = @"SELF.networkName beginswith %@";
    uint64_t v5 = 32;
    goto LABEL_5;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)description
{
  return [(DAWiFiScanDescriptor *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    CFStringRef v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    CFStringRef v4 = (__CFString *)0;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v16 = SSID;
    CUAppendF();
    v6 = v4;

    CFStringRef v4 = v6;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    v17 = prefix;
    CUAppendF();
    v8 = v4;

    CFStringRef v4 = v8;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v18 = bundleID;
    CUAppendF();
    objc_super v10 = v4;

    CFStringRef v4 = v10;
  }
  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier)
  {
    v19 = associationIdentifier;
    CUAppendF();
    v12 = v4;

    CFStringRef v4 = v12;
  }
  v13 = &stru_10003DF48;
  if (v4) {
    v13 = v4;
  }
  v14 = v13;

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFStringRef v4 = [[[objc_opt_class() allocWithZone:a3] init];
  id v5 = [(NSString *)self->_associationIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  id v7 = [(NSString *)self->_bundleID copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  id v9 = [(DADiscoveryConfiguration *)self->_configuration copy];
  objc_super v10 = (void *)v4[3];
  v4[3] = v9;

  id v11 = [(NSString *)self->_SSID copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  id v13 = [(NSString *)self->_prefix copy];
  v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (NSString)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (DADiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_associationIdentifier, 0);
}

@end