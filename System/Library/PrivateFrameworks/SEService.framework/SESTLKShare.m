@interface SESTLKShare
+ (id)withCKKSExternalShare:(id)a3;
+ (id)withView:(id)a3 tlkUUID:(id)a4 sourcePeerIdentifier:(id)a5 targetPeerIdentifier:(id)a6 shareData:(id)a7;
- (NSData)shareData;
- (NSData)sourcePeerIdentifier;
- (NSData)targetPeerIdentifier;
- (NSData)tlkUUID;
- (NSString)view;
- (id)asCKKSExternalShare;
@end

@implementation SESTLKShare

+ (id)withView:(id)a3 tlkUUID:(id)a4 sourcePeerIdentifier:(id)a5 targetPeerIdentifier:(id)a6 shareData:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_opt_new();
  v17 = (void *)v16[1];
  v16[1] = v11;
  id v18 = v11;

  v19 = (void *)v16[2];
  v16[2] = v12;
  id v20 = v12;

  v21 = (void *)v16[3];
  v16[3] = v13;
  id v22 = v13;

  v23 = (void *)v16[4];
  v16[4] = v14;
  id v24 = v14;

  v25 = (void *)v16[5];
  v16[5] = v15;

  return v16;
}

+ (id)withCKKSExternalShare:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 tlkUUID];
  v5 = +[SESTLKRecord _uuidFromStringPermissive:v4];
  v6 = objc_msgSend(v5, "ses_toData");

  if (v6)
  {
    v7 = [v3 view];
    v8 = [v3 senderPeerID];
    v9 = [v3 receiverPeerID];
    v10 = [v3 wrappedTLK];
    id v11 = +[SESTLKShare withView:v7 tlkUUID:v6 sourcePeerIdentifier:v8 targetPeerIdentifier:v9 shareData:v10];
  }
  else
  {
    id v12 = SESDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v3 tlkUUID];
      id v14 = [v3 wrappedTLK];
      id v15 = [v14 base64];
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl(&dword_2146ED000, v12, OS_LOG_TYPE_ERROR, "Share without a TLK String %@ - %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)asCKKSExternalShare
{
  id v3 = objc_alloc(MEMORY[0x263F16CE8]);
  view = self->_view;
  v5 = objc_msgSend(MEMORY[0x263F08C38], "ses_withData:", self->_tlkUUID);
  v6 = [v5 UUIDString];
  sourcePeerIdentifier = self->_sourcePeerIdentifier;
  targetPeerIdentifier = self->_targetPeerIdentifier;
  shareData = self->_shareData;
  v10 = [MEMORY[0x263EFF8F8] data];
  id v11 = (void *)[v3 initWithView:view tlkUUID:v6 receiverPeerID:targetPeerIdentifier senderPeerID:sourcePeerIdentifier wrappedTLK:shareData signature:v10];

  return v11;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)tlkUUID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)sourcePeerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)targetPeerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)shareData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_targetPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourcePeerIdentifier, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end