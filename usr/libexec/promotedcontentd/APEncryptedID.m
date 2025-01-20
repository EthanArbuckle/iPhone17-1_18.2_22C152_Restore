@interface APEncryptedID
- (APEncryptedID)initWithIDAccountPrivate:(id)a3;
- (NSData)DPID;
- (NSData)anonymousDemandID;
- (NSData)contentID;
- (NSData)deviceNewsPlusSubscriberID;
- (NSData)iAdID;
- (NSData)toroID;
- (NSUUID)unencryptedIAdID;
@end

@implementation APEncryptedID

- (APEncryptedID)initWithIDAccountPrivate:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)APEncryptedID;
  v5 = [(APEncryptedID *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 iAdID];
    unencryptedIAdID = v5->_unencryptedIAdID;
    v5->_unencryptedIAdID = (NSUUID *)v6;

    v8 = [v4 deviceNewsPlusSubscriberID];
    v9 = [v8 UUIDString];
    uint64_t v10 = encryptStringForAdServing(v9, @"deviceNewsPlusSubscriberID");
    deviceNewsPlusSubscriberID = v5->_deviceNewsPlusSubscriberID;
    v5->_deviceNewsPlusSubscriberID = (NSData *)v10;

    v12 = [v4 anonymousDemandID];
    v13 = [v12 UUIDString];
    uint64_t v14 = encryptStringForAdServing(v13, @"anonymousDemandID");
    anonymousDemandID = v5->_anonymousDemandID;
    v5->_anonymousDemandID = (NSData *)v14;

    v16 = [v4 contentID];
    v17 = [v16 UUIDString];
    uint64_t v18 = encryptStringForAdServing(v17, @"contentID");
    contentID = v5->_contentID;
    v5->_contentID = (NSData *)v18;

    v20 = [v4 DPID];
    uint64_t v21 = encryptStringForAdServing(v20, @"DPID");
    DPID = v5->_DPID;
    v5->_DPID = (NSData *)v21;

    v23 = [v4 iAdID];
    v24 = [v23 UUIDString];
    uint64_t v25 = encryptStringForAdServing(v24, @"iAdID");
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSData *)v25;

    v27 = [v4 toroID];
    v28 = [v27 UUIDString];
    uint64_t v29 = encryptStringForAdServing(v28, @"toroID");
    toroID = v5->_toroID;
    v5->_toroID = (NSData *)v29;
  }
  return v5;
}

- (NSData)deviceNewsPlusSubscriberID
{
  return self->_deviceNewsPlusSubscriberID;
}

- (NSData)anonymousDemandID
{
  return self->_anonymousDemandID;
}

- (NSData)contentID
{
  return self->_contentID;
}

- (NSData)DPID
{
  return self->_DPID;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (NSData)toroID
{
  return self->_toroID;
}

- (NSUUID)unencryptedIAdID
{
  return self->_unencryptedIAdID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unencryptedIAdID, 0);
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandID, 0);

  objc_storeStrong((id *)&self->_deviceNewsPlusSubscriberID, 0);
}

@end