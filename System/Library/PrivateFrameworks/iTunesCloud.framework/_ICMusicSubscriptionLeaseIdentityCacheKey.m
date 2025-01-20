@interface _ICMusicSubscriptionLeaseIdentityCacheKey
- (BOOL)isEqual:(id)a3;
- (NSNumber)DSID;
- (NSNumber)delegatedDSID;
- (NSString)carrierBundleDeviceIdentifier;
- (_ICMusicSubscriptionLeaseIdentityCacheKey)initWithDSID:(id)a3 carrierBundleDeviceIdentifier:(id)a4 delegatedDSID:(id)a5;
- (unint64_t)hash;
@end

@implementation _ICMusicSubscriptionLeaseIdentityCacheKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_delegatedDSID, 0);
}

- (NSString)carrierBundleDeviceIdentifier
{
  return self->_carrierBundleDeviceIdentifier;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSNumber)delegatedDSID
{
  return self->_delegatedDSID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_ICMusicSubscriptionLeaseIdentityCacheKey *)a3;
  if (v4 == self) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (DSID = self->_DSID, DSID != v4->_DSID) && !-[NSNumber isEqual:](DSID, "isEqual:")
    || (delegatedDSID = self->_delegatedDSID, delegatedDSID != v4->_delegatedDSID)
    && !-[NSNumber isEqual:](delegatedDSID, "isEqual:"))
  {
    char v8 = 0;
    goto LABEL_11;
  }
  carrierBundleDeviceIdentifier = self->_carrierBundleDeviceIdentifier;
  if (carrierBundleDeviceIdentifier == v4->_carrierBundleDeviceIdentifier)
  {
LABEL_10:
    char v8 = 1;
    goto LABEL_11;
  }
  char v8 = -[NSString isEqual:](carrierBundleDeviceIdentifier, "isEqual:");
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_carrierBundleDeviceIdentifier hash];
  uint64_t v4 = [(NSNumber *)self->_DSID hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_delegatedDSID hash];
}

- (_ICMusicSubscriptionLeaseIdentityCacheKey)initWithDSID:(id)a3 carrierBundleDeviceIdentifier:(id)a4 delegatedDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ICMusicSubscriptionLeaseIdentityCacheKey;
  v11 = [(_ICMusicSubscriptionLeaseIdentityCacheKey *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    carrierBundleDeviceIdentifier = v11->_carrierBundleDeviceIdentifier;
    v11->_carrierBundleDeviceIdentifier = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    delegatedDSID = v11->_delegatedDSID;
    v11->_delegatedDSID = (NSNumber *)v14;

    uint64_t v16 = [v8 copy];
    DSID = v11->_DSID;
    v11->_DSID = (NSNumber *)v16;
  }
  return v11;
}

@end