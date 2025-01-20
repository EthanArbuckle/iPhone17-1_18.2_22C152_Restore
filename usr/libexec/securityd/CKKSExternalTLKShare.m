@interface CKKSExternalTLKShare
- (id)datafyPeerID:(id)a3;
- (id)initWithViewName:(id)a3 tlkShare:(id)a4;
- (id)makeTLKShareRecord:(id)a3 contextID:(id)a4;
@end

@implementation CKKSExternalTLKShare

- (id)datafyPeerID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"spid-"])
  {
    uint64_t v4 = [v3 substringFromIndex:[@"spid-" length]];

    id v3 = (id)v4;
  }
  id v5 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  return v5;
}

- (id)makeTLKShareRecord:(id)a3 contextID:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  v7 = [CKKSTLKShare alloc];
  v8 = [(CKKSExternalTLKShare *)self tlkUUID];
  v9 = [(CKKSExternalTLKShare *)self senderPeerID];
  v10 = [(CKKSExternalTLKShare *)self stringifyPeerID:v9];
  v11 = [(CKKSExternalTLKShare *)self receiverPeerID];
  v12 = [(CKKSExternalTLKShare *)self stringifyPeerID:v11];
  v13 = [(CKKSExternalTLKShare *)self wrappedTLK];
  v14 = [(CKKSExternalTLKShare *)self signature];
  id v15 = [(CKKSTLKShare *)v7 initForKey:v8 senderPeerID:v10 recieverPeerID:v12 receiverEncPublicKeySPKI:0 curve:4 version:1 epoch:0 poisoned:0 wrappedKey:v13 signature:v14 zoneID:v6];

  v16 = [[CKKSTLKShareRecord alloc] initWithShare:v15 contextID:v18 zoneID:v6 encodedCKRecord:0];

  return v16;
}

- (id)initWithViewName:(id)a3 tlkShare:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 tlkUUID];
  v9 = [v6 receiverPeerID];
  v10 = [(CKKSExternalTLKShare *)self datafyPeerID:v9];
  v11 = [v6 senderPeerID];
  v12 = [(CKKSExternalTLKShare *)self datafyPeerID:v11];
  v13 = [v6 wrappedTLK];
  v14 = [v6 signature];

  id v15 = [(CKKSExternalTLKShare *)self initWithView:v7 tlkUUID:v8 receiverPeerID:v10 senderPeerID:v12 wrappedTLK:v13 signature:v14];
  return v15;
}

@end