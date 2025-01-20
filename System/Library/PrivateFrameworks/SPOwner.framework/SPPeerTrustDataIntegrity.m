@interface SPPeerTrustDataIntegrity
+ (BOOL)supportsSecureCoding;
- (SPDataIntegrityCheck)messagingDestination;
- (SPDataIntegrityCheck)peerTrustRecord;
- (SPPeerTrustDataIntegrity)initWithCoder:(id)a3;
- (SPPeerTrustDataIntegrity)initWithPeerTrustRecord:(id)a3 messagingDestination:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMessagingDestination:(id)a3;
- (void)setPeerTrustRecord:(id)a3;
@end

@implementation SPPeerTrustDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPeerTrustDataIntegrity)initWithPeerTrustRecord:(id)a3 messagingDestination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPeerTrustDataIntegrity;
  v9 = [(SPPeerTrustDataIntegrity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerTrustRecord, a3);
    objc_storeStrong((id *)&v10->_messagingDestination, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPPeerTrustDataIntegrity alloc];
  v5 = [(SPPeerTrustDataIntegrity *)self peerTrustRecord];
  v6 = [(SPPeerTrustDataIntegrity *)self messagingDestination];
  id v7 = [(SPPeerTrustDataIntegrity *)v4 initWithPeerTrustRecord:v5 messagingDestination:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  peerTrustRecord = self->_peerTrustRecord;
  id v5 = a3;
  [v5 encodeObject:peerTrustRecord forKey:@"peerTrustRecord"];
  [v5 encodeObject:self->_messagingDestination forKey:@"messagingDestination"];
}

- (SPPeerTrustDataIntegrity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerTrustRecord"];
  peerTrustRecord = self->_peerTrustRecord;
  self->_peerTrustRecord = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagingDestination"];

  messagingDestination = self->_messagingDestination;
  self->_messagingDestination = v7;

  return self;
}

- (SPDataIntegrityCheck)peerTrustRecord
{
  return self->_peerTrustRecord;
}

- (void)setPeerTrustRecord:(id)a3
{
}

- (SPDataIntegrityCheck)messagingDestination
{
  return self->_messagingDestination;
}

- (void)setMessagingDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingDestination, 0);

  objc_storeStrong((id *)&self->_peerTrustRecord, 0);
}

@end