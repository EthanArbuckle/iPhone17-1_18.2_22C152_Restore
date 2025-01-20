@interface SPAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPosh;
- (NSData)address;
- (NSData)advertisementData;
- (NSData)reserved;
- (NSDate)scanDate;
- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6;
- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8;
- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9;
- (SPAdvertisement)initWithCoder:(id)a3;
- (id)description;
- (int64_t)rssi;
- (unint64_t)hash;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAdvertisementData:(id)a3;
- (void)setIsPosh:(BOOL)a3;
- (void)setReserved:(id)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScanDate:(id)a3;
- (void)setStatus:(unsigned __int8)a3;
@end

@implementation SPAdvertisement

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  LOBYTE(v16) = 0;
  v14 = [(SPAdvertisement *)self initWithAddress:v12 advertisementData:v11 status:0 reserved:v13 rssi:a5 scanDate:v10 isPosh:v16];

  return v14;
}

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  LOBYTE(v9) = 0;
  return [(SPAdvertisement *)self initWithAddress:a3 advertisementData:a4 status:a5 reserved:a6 rssi:a7 scanDate:a8 isPosh:v9];
}

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9
{
  uint64_t v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SPAdvertisement;
  v19 = [(SPAdvertisement *)&v22 init];
  v20 = v19;
  if (v19)
  {
    [(SPAdvertisement *)v19 setAddress:v15];
    [(SPAdvertisement *)v20 setAdvertisementData:v16];
    [(SPAdvertisement *)v20 setStatus:v12];
    [(SPAdvertisement *)v20 setReserved:v17];
    [(SPAdvertisement *)v20 setRssi:a7];
    [(SPAdvertisement *)v20 setScanDate:v18];
    [(SPAdvertisement *)v20 setIsPosh:a9];
  }

  return v20;
}

- (SPAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  [(SPAdvertisement *)self setAddress:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisementData"];
  [(SPAdvertisement *)self setAdvertisementData:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  -[SPAdvertisement setStatus:](self, "setStatus:", [v7 unsignedIntegerValue]);

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reserved"];
  [(SPAdvertisement *)self setReserved:v8];

  -[SPAdvertisement setRssi:](self, "setRssi:", [v4 decodeIntegerForKey:@"rssi"]);
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanDate"];
  [(SPAdvertisement *)self setScanDate:v9];

  uint64_t v10 = [v4 decodeBoolForKey:@"isPosh"];
  [(SPAdvertisement *)self setIsPosh:v10];
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SPAdvertisement *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPAdvertisement *)self scanDate];
      v7 = [(SPAdvertisement *)v5 scanDate];
      if ([v6 isEqualToDate:v7])
      {
        v8 = [(SPAdvertisement *)self advertisementData];
        uint64_t v9 = [(SPAdvertisement *)v5 advertisementData];
        if ([v8 isEqualToData:v9]
          && (int v10 = [(SPAdvertisement *)self status], v10 == [(SPAdvertisement *)v5 status]))
        {
          id v11 = [(SPAdvertisement *)self reserved];
          uint64_t v12 = [(SPAdvertisement *)v5 reserved];
          if ([v11 isEqualToData:v12]
            && (int64_t v13 = [(SPAdvertisement *)self rssi], v13 == [(SPAdvertisement *)v5 rssi]))
          {
            uint64_t v14 = [(SPAdvertisement *)self address];
            uint64_t v15 = [(SPAdvertisement *)v5 address];
            v21 = (void *)v14;
            id v16 = (void *)v14;
            id v17 = (void *)v15;
            if ([v16 isEqualToData:v15])
            {
              BOOL v18 = [(SPAdvertisement *)self isPosh];
              BOOL v19 = v18 ^ [(SPAdvertisement *)v5 isPosh] ^ 1;
            }
            else
            {
              LOBYTE(v19) = 0;
            }
          }
          else
          {
            LOBYTE(v19) = 0;
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SPAdvertisement *)self rssi];
  BOOL v4 = [(SPAdvertisement *)self isPosh];
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = -v3;
  }
  BOOL v6 = v4;
  v7 = [(SPAdvertisement *)self scanDate];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(SPAdvertisement *)self advertisementData];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(SPAdvertisement *)self status];
  uint64_t v12 = [(SPAdvertisement *)self reserved];
  uint64_t v13 = [v12 hash];
  uint64_t v14 = [(SPAdvertisement *)self address];
  unint64_t v15 = v5 ^ v6 ^ v8 ^ v10 ^ v11 ^ v13 ^ [v14 hash];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(SPAdvertisement *)self address];
  [v9 encodeObject:v4 forKey:@"address"];

  uint64_t v5 = [(SPAdvertisement *)self advertisementData];
  [v9 encodeObject:v5 forKey:@"advertisementData"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SPAdvertisement status](self, "status"));
  [v9 encodeObject:v6 forKey:@"status"];

  v7 = [(SPAdvertisement *)self reserved];
  [v9 encodeObject:v7 forKey:@"reserved"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[SPAdvertisement rssi](self, "rssi"), @"rssi");
  uint64_t v8 = [(SPAdvertisement *)self scanDate];
  [v9 encodeObject:v8 forKey:@"scanDate"];

  objc_msgSend(v9, "encodeBool:forKey:", -[SPAdvertisement isPosh](self, "isPosh"), @"isPosh");
}

- (id)description
{
  uint64_t v3 = NSString;
  BOOL v4 = [(SPAdvertisement *)self address];
  uint64_t v5 = objc_msgSend(v4, "fm_hexString");
  BOOL v6 = [(SPAdvertisement *)self advertisementData];
  v7 = objc_msgSend(v6, "fm_hexString");
  uint64_t v8 = [(SPAdvertisement *)self scanDate];
  id v9 = [v3 stringWithFormat:@"SPAdvertisement %@%@ %@ posh: %i", v5, v7, v8, -[SPAdvertisement isPosh](self, "isPosh")];

  return v9;
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
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

- (BOOL)isPosh
{
  return self->_isPosh;
}

- (void)setIsPosh:(BOOL)a3
{
  self->_isPosh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end