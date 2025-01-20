@interface MSDKPeerDemoWiFiSettings
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoWiFiSettings)initWithCoder:(id)a3;
- (MSDKPeerDemoWiFiSettings)initWithSSID:(id)a3 password:(id)a4;
- (NSString)password;
- (NSString)ssid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSsid:(id)a3;
@end

@implementation MSDKPeerDemoWiFiSettings

- (MSDKPeerDemoWiFiSettings)initWithSSID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoWiFiSettings;
  v8 = [(MSDKPeerDemoWiFiSettings *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDKPeerDemoWiFiSettings *)v8 setSsid:v6];
    [(MSDKPeerDemoWiFiSettings *)v9 setPassword:v7];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MSDKPeerDemoWiFiSettings *)self ssid];
  id v7 = [(MSDKPeerDemoWiFiSettings *)self password];
  v8 = [v3 stringWithFormat:@"<%@[%p]: SSID=%@ Password=%@>", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoWiFiSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDKPeerDemoWiFiSettings;
  v5 = [(MSDKPeerDemoWiFiSettings *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssid"];
    [(MSDKPeerDemoWiFiSettings *)v5 setSsid:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    [(MSDKPeerDemoWiFiSettings *)v5 setPassword:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDKPeerDemoWiFiSettings *)self ssid];
  [v4 encodeObject:v5 forKey:@"ssid"];

  id v6 = [(MSDKPeerDemoWiFiSettings *)self password];
  [v4 encodeObject:v6 forKey:@"password"];
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end