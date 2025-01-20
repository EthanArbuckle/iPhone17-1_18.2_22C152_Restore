@interface RDPeerSharingInfoDevice
+ (BOOL)supportsSecureCoding;
- (NSDate)lastShareDate;
- (NSString)sharedCountryCode;
- (RDPeerSharingInfoDevice)initWithCoder:(id)a3;
- (RDPeerSharingInfoDevice)initWithCountryCode:(id)a3 andDate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastShareDate:(id)a3;
- (void)setSharedCountryCode:(id)a3;
@end

@implementation RDPeerSharingInfoDevice

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RDPeerSharingInfoDevice *)self sharedCountryCode];
  v6 = [(RDPeerSharingInfoDevice *)self lastShareDate];
  id v7 = [v4 initWithCountryCode:v5 andDate:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDPeerSharingInfoDevice)initWithCountryCode:(id)a3 andDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RDPeerSharingInfoDevice;
  v9 = [(RDPeerSharingInfoDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedCountryCode, a3);
    objc_storeStrong((id *)&v10->_lastShareDate, a4);
  }

  return v10;
}

- (RDPeerSharingInfoDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDPeerSharingInfoDevice;
  v5 = [(RDPeerSharingInfoDevice *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"kRDPeerSharingInfoDeviceKeyCountry"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRDPeerSharingInfoDeviceKeyDate"];
    v5 = [(RDPeerSharingInfoDevice *)v5 initWithCountryCode:v6 andDate:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RDPeerSharingInfoDevice *)self sharedCountryCode];
  [v4 encodeObject:v5 forKey:@"kRDPeerSharingInfoDeviceKeyCountry"];

  id v6 = [(RDPeerSharingInfoDevice *)self lastShareDate];
  [v4 encodeObject:v6 forKey:@"kRDPeerSharingInfoDeviceKeyDate"];
}

- (NSString)sharedCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedCountryCode:(id)a3
{
}

- (NSDate)lastShareDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastShareDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastShareDate, 0);

  objc_storeStrong((id *)&self->_sharedCountryCode, 0);
}

@end