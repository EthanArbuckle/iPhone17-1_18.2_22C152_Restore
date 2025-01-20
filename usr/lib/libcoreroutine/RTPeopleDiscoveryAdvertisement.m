@interface RTPeopleDiscoveryAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)address;
- (NSDate)scanDate;
- (NSString)contactID;
- (RTPeopleDiscoveryAdvertisement)init;
- (RTPeopleDiscoveryAdvertisement)initWithAddress:(id)a3 rssi:(int64_t)a4 scanDate:(id)a5 contactID:(id)a6;
- (RTPeopleDiscoveryAdvertisement)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (int64_t)rssi;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPeopleDiscoveryAdvertisement

- (RTPeopleDiscoveryAdvertisement)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAddress_rssi_scanDate_contactID_);
}

- (RTPeopleDiscoveryAdvertisement)initWithAddress:(id)a3 rssi:(int64_t)a4 scanDate:(id)a5 contactID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RTPeopleDiscoveryAdvertisement;
  v13 = [(RTPeopleDiscoveryAdvertisement *)&v24 init];
  if (!v13) {
    goto LABEL_4;
  }
  if (v10)
  {
    uint64_t v14 = [v10 copy];
    address = v13->_address;
    v13->_address = (NSData *)v14;

    v13->_rssi = a4;
    uint64_t v16 = [v11 copy];
    scanDate = v13->_scanDate;
    v13->_scanDate = (NSDate *)v16;

    uint64_t v18 = [v12 copy];
    contactID = v13->_contactID;
    v13->_contactID = (NSString *)v18;

LABEL_4:
    v20 = v13;
    goto LABEL_8;
  }
  v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v23 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: address", v23, 2u);
  }

  v20 = 0;
LABEL_8:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPeopleDiscoveryAdvertisement *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(RTPeopleDiscoveryAdvertisement *)self scanDate];
      v7 = [(RTPeopleDiscoveryAdvertisement *)v5 scanDate];
      if ([v6 isEqualToDate:v7]
        && (int64_t v8 = [(RTPeopleDiscoveryAdvertisement *)self rssi],
            v8 == [(RTPeopleDiscoveryAdvertisement *)v5 rssi]))
      {
        v9 = [(RTPeopleDiscoveryAdvertisement *)self address];
        id v10 = [(RTPeopleDiscoveryAdvertisement *)v5 address];
        if ([v9 isEqualToData:v10])
        {
          id v11 = [(RTPeopleDiscoveryAdvertisement *)self contactID];
          id v12 = [(RTPeopleDiscoveryAdvertisement *)v5 contactID];
          char v13 = [v11 isEqualToString:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(RTPeopleDiscoveryAdvertisement *)self rssi];
  if (v3 >= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = -v3;
  }
  v5 = [(RTPeopleDiscoveryAdvertisement *)self scanDate];
  uint64_t v6 = [v5 hash];
  v7 = [(RTPeopleDiscoveryAdvertisement *)self address];
  uint64_t v8 = v6 ^ [v7 hash] ^ v4;
  v9 = [(RTPeopleDiscoveryAdvertisement *)self contactID];
  unint64_t v10 = v8 ^ [v9 hash];

  return v10;
}

- (id)descriptionDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"Address";
  v5 = [(RTPeopleDiscoveryAdvertisement *)self address];
  if (v5)
  {
    uint64_t v2 = [(RTPeopleDiscoveryAdvertisement *)self address];
    uint64_t v6 = [v2 hexString];
  }
  else
  {
    uint64_t v6 = &stru_1F33EAD88;
  }
  v16[0] = v6;
  v15[1] = @"RSSI";
  v7 = [NSNumber numberWithInteger:-[RTPeopleDiscoveryAdvertisement rssi](self, "rssi")];
  v16[1] = v7;
  v15[2] = @"Date";
  uint64_t v8 = [(RTPeopleDiscoveryAdvertisement *)self scanDate];
  if (v8)
  {
    uint64_t v3 = [(RTPeopleDiscoveryAdvertisement *)self scanDate];
    v9 = [v3 getFormattedDateString];
  }
  else
  {
    v9 = @"-";
  }
  v16[2] = v9;
  v15[3] = @"ContactID";
  uint64_t v10 = [(RTPeopleDiscoveryAdvertisement *)self contactID];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_1F33EAD88;
  }
  v16[3] = v12;
  char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  if (v8)
  {
  }
  if (v5)
  {
  }

  return v13;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDiscoveryAdvertisement *)self descriptionDictionary];
  id v11 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      char v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RTPeopleDiscoveryAdvertisement *)self address];
  [v4 encodeObject:v5 forKey:@"Address"];

  [v4 encodeInteger:-[RTPeopleDiscoveryAdvertisement rssi](self, "rssi") forKey:@"RSSI"];
  id v6 = [(RTPeopleDiscoveryAdvertisement *)self scanDate];
  [v4 encodeObject:v6 forKey:@"Date"];

  id v7 = [(RTPeopleDiscoveryAdvertisement *)self contactID];
  [v4 encodeObject:v7 forKey:@"ContactID"];
}

- (RTPeopleDiscoveryAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"RSSI"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactID"];

  v9 = [(RTPeopleDiscoveryAdvertisement *)self initWithAddress:v5 rssi:v6 scanDate:v7 contactID:v8];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RTPeopleDiscoveryAdvertisement alloc];
  address = self->_address;
  int64_t rssi = self->_rssi;
  scanDate = self->_scanDate;
  contactID = self->_contactID;

  return [(RTPeopleDiscoveryAdvertisement *)v4 initWithAddress:address rssi:rssi scanDate:scanDate contactID:contactID];
}

- (NSData)address
{
  return self->_address;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end