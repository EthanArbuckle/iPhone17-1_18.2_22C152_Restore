@interface _NIRangingPeerInternal
- (_NIRangingPeerInternal)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _NIRangingPeerInternal

- (_NIRangingPeerInternal)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  id v6 = a3;
  v7 = (NSData *)a4;
  v15.receiver = self;
  v15.super_class = (Class)_NIRangingPeerInternal;
  v8 = [(_NIRangingPeerInternal *)&v15 init];
  if (v8)
  {
    v9 = (NSData *)[v6 copy];
    macAddress = v8->_macAddress;
    v8->_macAddress = v9;

    if (v8->_secureRangingKeyID != v7)
    {
      v11 = (NSData *)[(NSData *)v7 copy];
      secureRangingKeyID = v8->_secureRangingKeyID;
      v8->_secureRangingKeyID = v11;
    }
    v13 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  macAddress = self->_macAddress;
  secureRangingKeyID = self->_secureRangingKeyID;

  return [v4 initWithMacAddressAsData:macAddress secureRangingKeyID:secureRangingKeyID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureRangingKeyID, 0);

  objc_storeStrong((id *)&self->_macAddress, 0);
}

@end