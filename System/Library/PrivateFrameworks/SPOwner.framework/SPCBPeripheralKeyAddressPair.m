@interface SPCBPeripheralKeyAddressPair
+ (BOOL)supportsSecureCoding;
- (NSData)leMACAddress;
- (NSData)longTermKey;
- (SPCBPeripheralKeyAddressPair)initWithCoder:(id)a3;
- (SPCBPeripheralKeyAddressPair)initWithLEMACAddress:(id)a3 longTermKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPCBPeripheralKeyAddressPair

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyAddressPair)initWithLEMACAddress:(id)a3 longTermKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyAddressPair;
  v8 = [(SPCBPeripheralKeyAddressPair *)&v14 init];
  if (v8)
  {
    if ([v6 length] == 7 && objc_msgSend(v7, "length") == 16)
    {
      uint64_t v9 = [v6 copy];
      leMACAddress = v8->_leMACAddress;
      v8->_leMACAddress = (NSData *)v9;

      uint64_t v11 = [v7 copy];
      longTermKey = v8->_longTermKey;
      v8->_longTermKey = (NSData *)v11;
    }
    else
    {
      longTermKey = v8;
      v8 = 0;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPCBPeripheralKeyAddressPair alloc];
  v5 = [(SPCBPeripheralKeyAddressPair *)self leMACAddress];
  id v6 = [(SPCBPeripheralKeyAddressPair *)self longTermKey];
  id v7 = [(SPCBPeripheralKeyAddressPair *)v4 initWithLEMACAddress:v5 longTermKey:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPCBPeripheralKeyAddressPair *)self leMACAddress];
  [v4 encodeObject:v5 forKey:@"mac"];

  id v6 = [(SPCBPeripheralKeyAddressPair *)self longTermKey];
  [v4 encodeObject:v6 forKey:@"ltk"];
}

- (SPCBPeripheralKeyAddressPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mac"];
  leMACAddress = self->_leMACAddress;
  self->_leMACAddress = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ltk"];

  longTermKey = self->_longTermKey;
  self->_longTermKey = v7;

  if ([(NSData *)self->_leMACAddress length] == 7 && [(NSData *)self->_longTermKey length] == 16) {
    uint64_t v9 = self;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SPCBPeripheralKeyAddressPair *)self leMACAddress];
  v5 = objc_msgSend(v4, "fm_hexString");
  id v6 = [(SPCBPeripheralKeyAddressPair *)self longTermKey];
  id v7 = objc_msgSend(v6, "fm_hexString");
  v8 = [v3 stringWithFormat:@"[LEMAC: %@ LTK: %@]", v5, v7];

  return v8;
}

- (NSData)leMACAddress
{
  return self->_leMACAddress;
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermKey, 0);

  objc_storeStrong((id *)&self->_leMACAddress, 0);
}

@end