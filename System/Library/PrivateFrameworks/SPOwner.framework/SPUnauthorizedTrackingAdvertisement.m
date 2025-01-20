@interface SPUnauthorizedTrackingAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPosh;
- (NSData)_address;
- (NSData)address;
- (NSData)advertisementData;
- (NSData)data;
- (NSData)reserved;
- (NSDate)scanDate;
- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6;
- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8;
- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9 networkID:(unsigned __int8)a10;
- (SPUnauthorizedTrackingAdvertisement)initWithCoder:(id)a3;
- (id)description;
- (int64_t)rssi;
- (unint64_t)hash;
- (unsigned)networkID;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementData:(id)a3;
- (void)setData:(id)a3;
- (void)setIsPosh:(BOOL)a3;
- (void)setNetworkID:(unsigned __int8)a3;
- (void)setReserved:(id)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScanDate:(id)a3;
- (void)setStatus:(unsigned __int8)a3;
- (void)set_address:(id)a3;
@end

@implementation SPUnauthorizedTrackingAdvertisement

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = [(SPUnauthorizedTrackingAdvertisement *)self initWithAddress:v12 advertisementData:v11 status:0 reserved:v13 rssi:a5 scanDate:v10];

  return v14;
}

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  uint64_t v9 = a5;
  id v13 = a8;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  LOWORD(v19) = 0;
  v17 = -[SPUnauthorizedTrackingAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:", v15, v14, v9, v16, a7, v13, v19);

  return v17;
}

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9 networkID:(unsigned __int8)a10
{
  uint64_t v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SPUnauthorizedTrackingAdvertisement;
  v20 = [(SPUnauthorizedTrackingAdvertisement *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(SPUnauthorizedTrackingAdvertisement *)v20 set_address:v16];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setAdvertisementData:v17];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setStatus:v13];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setReserved:v18];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setRssi:a7];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setScanDate:v19];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setIsPosh:a9];
    [(SPUnauthorizedTrackingAdvertisement *)v21 setNetworkID:a10];
  }

  return v21;
}

- (SPUnauthorizedTrackingAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  [(SPUnauthorizedTrackingAdvertisement *)self set_address:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisementData"];
  [(SPUnauthorizedTrackingAdvertisement *)self setAdvertisementData:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  -[SPUnauthorizedTrackingAdvertisement setStatus:](self, "setStatus:", [v7 unsignedIntegerValue]);

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reserved"];
  [(SPUnauthorizedTrackingAdvertisement *)self setReserved:v8];

  -[SPUnauthorizedTrackingAdvertisement setRssi:](self, "setRssi:", [v4 decodeIntegerForKey:@"rssi"]);
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanDate"];
  [(SPUnauthorizedTrackingAdvertisement *)self setScanDate:v9];

  -[SPUnauthorizedTrackingAdvertisement setIsPosh:](self, "setIsPosh:", [v4 decodeBoolForKey:@"isPosh"]);
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkID"];

  -[SPUnauthorizedTrackingAdvertisement setNetworkID:](self, "setNetworkID:", [v10 unsignedIntegerValue]);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SPUnauthorizedTrackingAdvertisement *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPUnauthorizedTrackingAdvertisement *)self scanDate];
      v7 = [(SPUnauthorizedTrackingAdvertisement *)v5 scanDate];
      if ([v6 isEqualToDate:v7])
      {
        v8 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
        uint64_t v9 = [(SPUnauthorizedTrackingAdvertisement *)v5 advertisementData];
        if ([v8 isEqualToData:v9]
          && (int v10 = [(SPUnauthorizedTrackingAdvertisement *)self status],
              v10 == [(SPUnauthorizedTrackingAdvertisement *)v5 status]))
        {
          id v11 = [(SPUnauthorizedTrackingAdvertisement *)self reserved];
          id v12 = [(SPUnauthorizedTrackingAdvertisement *)v5 reserved];
          if ([v11 isEqualToData:v12]
            && (int64_t v13 = [(SPUnauthorizedTrackingAdvertisement *)self rssi],
                v13 == [(SPUnauthorizedTrackingAdvertisement *)v5 rssi]))
          {
            uint64_t v14 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
            uint64_t v15 = [(SPUnauthorizedTrackingAdvertisement *)v5 address];
            v22 = (void *)v14;
            id v16 = (void *)v14;
            id v17 = (void *)v15;
            if ([v16 isEqualToData:v15]
              && (BOOL v21 = [(SPUnauthorizedTrackingAdvertisement *)self isPosh],
                  v21 == [(SPUnauthorizedTrackingAdvertisement *)v5 isPosh]))
            {
              int v19 = [(SPUnauthorizedTrackingAdvertisement *)self networkID];
              BOOL v18 = v19 == [(SPUnauthorizedTrackingAdvertisement *)v5 networkID];
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SPUnauthorizedTrackingAdvertisement *)self rssi];
  BOOL v4 = [(SPUnauthorizedTrackingAdvertisement *)self isPosh];
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = -v3;
  }
  v6 = [(SPUnauthorizedTrackingAdvertisement *)self scanDate];
  uint64_t v7 = [v6 hash];
  v8 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(SPUnauthorizedTrackingAdvertisement *)self status];
  id v11 = [(SPUnauthorizedTrackingAdvertisement *)self reserved];
  uint64_t v12 = [v11 hash];
  int64_t v13 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
  uint64_t v14 = [v13 hash];
  unint64_t v15 = v18 ^ v17 ^ v7 ^ v9 ^ v10 ^ v12 ^ v14 ^ [(SPUnauthorizedTrackingAdvertisement *)self networkID];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
  [v4 encodeObject:v5 forKey:@"address"];

  v6 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
  [v4 encodeObject:v6 forKey:@"advertisementData"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SPUnauthorizedTrackingAdvertisement status](self, "status"));
  [v4 encodeObject:v7 forKey:@"status"];

  v8 = [(SPUnauthorizedTrackingAdvertisement *)self reserved];
  [v4 encodeObject:v8 forKey:@"reserved"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingAdvertisement rssi](self, "rssi"), @"rssi");
  uint64_t v9 = [(SPUnauthorizedTrackingAdvertisement *)self scanDate];
  [v4 encodeObject:v9 forKey:@"scanDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh"), @"isPosh");
  objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SPUnauthorizedTrackingAdvertisement networkID](self, "networkID"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"networkID"];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
  uint64_t v5 = objc_msgSend(v4, "fm_hexString");
  v6 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
  uint64_t v7 = objc_msgSend(v6, "fm_hexString");
  v8 = [(SPUnauthorizedTrackingAdvertisement *)self scanDate];
  uint64_t v9 = [v3 stringWithFormat:@"SPUnauthorizedTrackingAdvertisement %@%@ %@ posh: %i", v5, v7, v8, -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh")];

  return v9;
}

- (NSData)address
{
  uint64_t v3 = [(SPUnauthorizedTrackingAdvertisement *)self _address];

  if (v3)
  {
    id v4 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
  }
  else
  {
    uint64_t v5 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
    id v4 = objc_msgSend(v5, "subdataWithRange:", 0, 6);
  }

  return (NSData *)v4;
}

- (NSData)data
{
  uint64_t v3 = [(SPUnauthorizedTrackingAdvertisement *)self _address];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA58];
    uint64_t v5 = [(SPUnauthorizedTrackingAdvertisement *)self _address];
    v6 = [v4 dataWithData:v5];

    uint64_t v7 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
    [v6 appendData:v7];
  }
  else
  {
    v6 = [(SPUnauthorizedTrackingAdvertisement *)self advertisementData];
  }

  return (NSData *)v6;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int8)a3
{
  self->_status = a3;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (BOOL)isPosh
{
  return self->_isPosh;
}

- (void)setIsPosh:(BOOL)a3
{
  self->_isPosh = a3;
}

- (unsigned)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(unsigned __int8)a3
{
  self->_networkID = a3;
}

- (NSData)_address
{
  return self->__address;
}

- (void)set_address:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__address, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);

  objc_storeStrong((id *)&self->_advertisementData, 0);
}

@end