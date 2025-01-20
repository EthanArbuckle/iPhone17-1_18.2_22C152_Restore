@interface _NIRangingPeer
+ (BOOL)supportsSecureCoding;
+ (id)hexStringMacAddressFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeer:(id)a3;
- (NSData)macAddress;
- (NSData)secureRangingKeyID;
- (_NIRangingPeer)init;
- (_NIRangingPeer)initWithCoder:(id)a3;
- (_NIRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getMacAddressAsString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NIRangingPeer

- (_NIRangingPeer)init
{
  return 0;
}

- (_NIRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    internal = auto_unlock_log();
    if (os_log_type_enabled(internal, OS_LOG_TYPE_FAULT)) {
      sub_1001D5FEC(internal);
    }
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)_NIRangingPeer;
  self = [(_NIRangingPeer *)&v11 init];
  if (self)
  {
    v8 = [[_NIRangingPeerInternal alloc] initWithMacAddressAsData:v6 secureRangingKeyID:v7];
    internal = self->_internal;
    self->_internal = v8;
LABEL_6:
  }
  return self;
}

- (NSData)macAddress
{
  return (NSData *)*((id *)self->_internal + 1);
}

- (NSData)secureRangingKeyID
{
  return (NSData *)*((id *)self->_internal + 2);
}

- (id)getMacAddressAsString
{
  v2 = [(_NIRangingPeer *)self macAddress];
  v3 = +[_NIRangingPeer hexStringMacAddressFromData:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal[2];

  return [v4 initWithMacAddressAsData:v6 secureRangingKeyID:v7];
}

- (_NIRangingPeer)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 157, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]" object file lineNumber description];
  }
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kNICodingKeyRangingPeerMacAddress"];
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kNICodingKeyRangingPeerSecureRangingKeyID"];

  v8 = [(_NIRangingPeer *)self initWithMacAddressAsData:v6 secureRangingKeyID:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 167, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]" object file lineNumber description];
  }
  internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal;
  [v9 encodeObject:v6 forKey:@"kNICodingKeyRangingPeerMacAddress"];
  [v9 encodeObject:v7[2] forKey:@"kNICodingKeyRangingPeerSecureRangingKeyID"];
}

- (id)description
{
  v3 = self->_internal;
  id v4 = [(_NIRangingPeer *)self getMacAddressAsString];
  uint64_t v5 = v3[2];

  uint64_t v6 = "Yes";
  if (!v5) {
    uint64_t v6 = "No";
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Peer:%@ hasKey:%s", v4, v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(_NIRangingPeer *)self macAddress];
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = [(_NIRangingPeer *)self secureRangingKeyID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqualToPeer:(id)a3
{
  v8 = (_NIRangingPeer *)a3;
  id v9 = v8;
  if (self == v8)
  {
    BOOL v12 = 1;
    goto LABEL_25;
  }
  v10 = [(_NIRangingPeer *)v8 macAddress];
  if (v10
    && ([(_NIRangingPeer *)self macAddress],
        v3 = objc_claimAutoreleasedReturnValue(),
        [(_NIRangingPeer *)v9 macAddress],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqualToData:v4] & 1) != 0))
  {
    int v11 = 0;
  }
  else
  {
    v13 = [(_NIRangingPeer *)v9 macAddress];
    if (v13)
    {
      BOOL v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v14 = [(_NIRangingPeer *)self macAddress];
    if (v14)
    {

      BOOL v12 = 0;
      goto LABEL_22;
    }
    int v11 = 1;
  }
  v15 = [(_NIRangingPeer *)v9 secureRangingKeyID];
  if (v15)
  {
    uint64_t v5 = [(_NIRangingPeer *)self secureRangingKeyID];
    unint64_t v6 = [(_NIRangingPeer *)v9 secureRangingKeyID];
    if ([v5 isEqualToData:v6])
    {
      BOOL v12 = 1;
      goto LABEL_16;
    }
  }
  v16 = [(_NIRangingPeer *)v9 secureRangingKeyID];
  if (v16)
  {

    BOOL v12 = 0;
    if (v15) {
      goto LABEL_16;
    }
  }
  else
  {
    v17 = [(_NIRangingPeer *)self secureRangingKeyID];
    BOOL v12 = v17 == 0;

    if (v15)
    {
LABEL_16:

      if ((v11 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  if (v11)
  {
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
LABEL_22:
  if (v10)
  {
  }
LABEL_25:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_NIRangingPeer *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(_NIRangingPeer *)self isEqualToPeer:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)hexStringMacAddressFromData:(id)a3
{
  *(_WORD *)&v5.octet[4] = 0;
  *(_DWORD *)v5.octet = 0;
  [a3 getBytes:&v5 length:6];
  v3 = +[NSString stringWithUTF8String:ether_ntoa(&v5)];

  return v3;
}

- (void).cxx_destruct
{
}

@end