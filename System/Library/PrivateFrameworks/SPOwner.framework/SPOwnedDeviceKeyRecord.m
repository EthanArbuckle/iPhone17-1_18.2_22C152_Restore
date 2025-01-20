@interface SPOwnedDeviceKeyRecord
+ (BOOL)supportsSecureCoding;
- (NSData)advertisement;
- (NSData)hashedAdvertisement;
- (NSDate)creationDate;
- (NSUUID)deviceIdentifier;
- (NSUUID)identifier;
- (SPOwnedDeviceKeyRecord)initWithCoder:(id)a3;
- (SPOwnedDeviceKeyRecord)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 advertisement:(id)a5 hashedAdvertisement:(id)a6 creationDate:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPOwnedDeviceKeyRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_advertisement forKey:@"advertisement"];
  [v5 encodeObject:self->_hashedAdvertisement forKey:@"hashedAdvertisement"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (SPOwnedDeviceKeyRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisement"];
  advertisement = self->_advertisement;
  self->_advertisement = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashedAdvertisement"];
  hashedAdvertisement = self->_hashedAdvertisement;
  self->_hashedAdvertisement = v11;

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];

  creationDate = self->_creationDate;
  self->_creationDate = v13;

  return self;
}

- (SPOwnedDeviceKeyRecord)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 advertisement:(id)a5 hashedAdvertisement:(id)a6 creationDate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SPOwnedDeviceKeyRecord;
  v17 = [(SPOwnedDeviceKeyRecord *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v18->_advertisement, a5);
    objc_storeStrong((id *)&v18->_hashedAdvertisement, a6);
    objc_storeStrong((id *)&v18->_creationDate, a7);
  }

  return v18;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (NSData)hashedAdvertisement
{
  return self->_hashedAdvertisement;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_hashedAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end