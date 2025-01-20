@interface SPScannedObject
+ (BOOL)supportsSecureCoding;
- (BOOL)nearOwner;
- (NSData)address;
- (NSData)advertisement;
- (NSData)optional;
- (NSData)vendorPayload;
- (NSDate)scanDate;
- (NSNumber)hint;
- (SPAccessoryInformation)accessoryInformation;
- (SPIndexInformation)indexInformation;
- (SPScannedObject)initWithAdvertisementType:(int64_t)a3 poshNetwork:(unsigned __int8)a4 nearOwner:(BOOL)a5 vendorPayload:(id)a6 scanDate:(id)a7 address:(id)a8 advertisement:(id)a9 status:(unsigned __int8)a10 ek:(unsigned __int8)a11 hint:(id)a12 rssi:(int64_t)a13 indexInformation:(id)a14 acccessoryInformation:(id)a15;
- (SPScannedObject)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)advertisementType;
- (int64_t)rssi;
- (unsigned)ek;
- (unsigned)poshNetwork;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAdvertisement:(id)a3;
- (void)setAdvertisementType:(int64_t)a3;
- (void)setEk:(unsigned __int8)a3;
- (void)setNearOwner:(BOOL)a3;
- (void)setPoshNetwork:(unsigned __int8)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScanDate:(id)a3;
- (void)setStatus:(unsigned __int8)a3;
- (void)setVendorPayload:(id)a3;
@end

@implementation SPScannedObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPScannedObject)initWithAdvertisementType:(int64_t)a3 poshNetwork:(unsigned __int8)a4 nearOwner:(BOOL)a5 vendorPayload:(id)a6 scanDate:(id)a7 address:(id)a8 advertisement:(id)a9 status:(unsigned __int8)a10 ek:(unsigned __int8)a11 hint:(id)a12 rssi:(int64_t)a13 indexInformation:(id)a14 acccessoryInformation:(id)a15
{
  id v19 = a6;
  id v20 = a7;
  id obj = a8;
  id v21 = a8;
  id v32 = a9;
  id v22 = a12;
  id v23 = a14;
  id v31 = a15;
  v33.receiver = self;
  v33.super_class = (Class)SPScannedObject;
  v24 = [(SPScannedObject *)&v33 init];
  v25 = v24;
  if (v24)
  {
    v24->_advertisementType = a3;
    v24->_poshNetwork = a4;
    v24->_nearOwner = a5;
    objc_storeStrong((id *)&v24->_vendorPayload, a6);
    objc_storeStrong((id *)&v25->_scanDate, a7);
    objc_storeStrong((id *)&v25->_address, obj);
    objc_storeStrong((id *)&v25->_advertisement, a9);
    v25->_status = a10;
    v25->_ek = a11;
    objc_storeStrong((id *)&v25->_hint, a12);
    v25->_rssi = a13;
    objc_storeStrong((id *)&v25->_indexInformation, a14);
    objc_storeStrong((id *)&v25->_accessoryInformation, a15);
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18 = [SPScannedObject alloc];
  uint64_t poshNetwork = self->_poshNetwork;
  BOOL nearOwner = self->_nearOwner;
  int64_t advertisementType = self->_advertisementType;
  vendorPayload = self->_vendorPayload;
  scanDate = self->_scanDate;
  address = self->_address;
  advertisement = self->_advertisement;
  __int16 v11 = *(_WORD *)&self->_status;
  long long v17 = *(_OWORD *)&self->_hint;
  indexInformation = self->_indexInformation;
  v13 = [(SPScannedObject *)self accessoryInformation];
  LOWORD(v16) = v11;
  v14 = -[SPScannedObject initWithAdvertisementType:poshNetwork:nearOwner:vendorPayload:scanDate:address:advertisement:status:ek:hint:rssi:indexInformation:acccessoryInformation:](v18, "initWithAdvertisementType:poshNetwork:nearOwner:vendorPayload:scanDate:address:advertisement:status:ek:hint:rssi:indexInformation:acccessoryInformation:", advertisementType, poshNetwork, nearOwner, vendorPayload, scanDate, address, advertisement, v16, v17, indexInformation, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t advertisementType_low = LODWORD(self->_advertisementType);
  id v5 = a3;
  [v5 encodeInt:advertisementType_low forKey:@"advertisementType"];
  [v5 encodeInt:self->_poshNetwork forKey:@"poshNetwork"];
  [v5 encodeBool:self->_nearOwner forKey:@"nearOwner"];
  [v5 encodeObject:self->_vendorPayload forKey:@"vendorPayload"];
  [v5 encodeObject:self->_scanDate forKey:@"scanDate"];
  [v5 encodeObject:self->_address forKey:@"address"];
  [v5 encodeObject:self->_advertisement forKey:@"advertisement"];
  [v5 encodeInt:self->_status forKey:@"status"];
  [v5 encodeInt:self->_ek forKey:@"ek"];
  [v5 encodeObject:self->_hint forKey:@"hint"];
  [v5 encodeInteger:self->_rssi forKey:@"rssi"];
  [v5 encodeObject:self->_indexInformation forKey:@"indexInformation"];
  [v5 encodeObject:self->_accessoryInformation forKey:@"accessoryInformation"];
}

- (SPScannedObject)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t advertisementType = (int)[v4 decodeIntForKey:@"advertisementType"];
  self->_uint64_t poshNetwork = [v4 decodeIntForKey:@"poshNetwork"];
  self->_BOOL nearOwner = [v4 decodeBoolForKey:@"nearOwner"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorPayload"];
  vendorPayload = self->_vendorPayload;
  self->_vendorPayload = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanDate"];
  scanDate = self->_scanDate;
  self->_scanDate = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  address = self->_address;
  self->_address = v9;

  __int16 v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisement"];
  advertisement = self->_advertisement;
  self->_advertisement = v11;

  self->_status = [v4 decodeIntForKey:@"status"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hint"];
  hint = self->_hint;
  self->_hint = v13;

  self->_ek = [v4 decodeIntForKey:@"ek"];
  self->_rssi = [v4 decodeIntegerForKey:@"rssi"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexInformation"];
  indexInformation = self->_indexInformation;
  self->_indexInformation = v15;

  long long v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryInformation"];

  accessoryInformation = self->_accessoryInformation;
  self->_accessoryInformation = v17;

  return self;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SPScannedObject *)self scanDate];
  id v5 = [(SPScannedObject *)self address];
  v6 = objc_msgSend(v5, "fm_hexString");
  v7 = [(SPScannedObject *)self advertisement];
  v8 = objc_msgSend(v7, "fm_hexString");
  unsigned int v9 = [(SPScannedObject *)self status];
  unsigned int v10 = [(SPScannedObject *)self ek];
  __int16 v11 = [(SPScannedObject *)self hint];
  v12 = [v3 stringWithFormat:@"<scanDate: %@, address: %@, adv: %@, status: %x, ek: %x hint: %@, rssi: %ld>"], v4, v6, v8, v9, v10, v11, -[SPScannedObject rssi](self, "rssi"));

  return v12;
}

- (NSData)optional
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:&self->_ek length:1];
  id v4 = [(SPScannedObject *)self hint];

  if (v4)
  {
    id v5 = [(SPScannedObject *)self hint];
    char v6 = [v5 unsignedCharValue];

    char v8 = v6;
    [v3 appendBytes:&v8 length:1];
  }

  return (NSData *)v3;
}

- (int64_t)advertisementType
{
  return self->_advertisementType;
}

- (void)setAdvertisementType:(int64_t)a3
{
  self->_int64_t advertisementType = a3;
}

- (unsigned)poshNetwork
{
  return self->_poshNetwork;
}

- (void)setPoshNetwork:(unsigned __int8)a3
{
  self->_uint64_t poshNetwork = a3;
}

- (BOOL)nearOwner
{
  return self->_nearOwner;
}

- (void)setNearOwner:(BOOL)a3
{
  self->_BOOL nearOwner = a3;
}

- (NSData)vendorPayload
{
  return self->_vendorPayload;
}

- (void)setVendorPayload:(id)a3
{
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
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

- (NSNumber)hint
{
  return self->_hint;
}

- (unsigned)ek
{
  return self->_ek;
}

- (void)setEk:(unsigned __int8)a3
{
  self->_ek = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (SPAccessoryInformation)accessoryInformation
{
  return self->_accessoryInformation;
}

- (SPIndexInformation)indexInformation
{
  return self->_indexInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexInformation, 0);
  objc_storeStrong((id *)&self->_accessoryInformation, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);

  objc_storeStrong((id *)&self->_vendorPayload, 0);
}

@end