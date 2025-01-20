@interface SKPublishedStatus
+ (BOOL)supportsSecureCoding;
- (NSDate)dateCreated;
- (NSDate)datePublished;
- (NSDate)dateReceived;
- (NSString)statusUniqueIdentifier;
- (SKInvitationPayload)invitationPayload;
- (SKPublishedStatus)initWithCoder:(id)a3;
- (SKPublishedStatus)initWithStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 datePublished:(id)a5 dateCreated:(id)a6 dateReceived:(id)a7 invitationPayload:(id)a8;
- (SKStatusPayload)statusPayload;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKPublishedStatus

- (SKPublishedStatus)initWithStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 datePublished:(id)a5 dateCreated:(id)a6 dateReceived:(id)a7 invitationPayload:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SKPublishedStatus;
  v18 = [(SKPublishedStatus *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_statusPayload, a3);
    objc_storeStrong((id *)&v19->_statusUniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_datePublished, a5);
    objc_storeStrong((id *)&v19->_dateCreated, a6);
    objc_storeStrong((id *)&v19->_dateReceived, a7);
    objc_storeStrong((id *)&v19->_invitationPayload, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  statusPayload = self->_statusPayload;
  id v5 = a3;
  [v5 encodeObject:statusPayload forKey:@"statusPayload"];
  [v5 encodeObject:self->_statusUniqueIdentifier forKey:@"statusUniqueIdentifier"];
  [v5 encodeObject:self->_datePublished forKey:@"datePublished"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
  [v5 encodeObject:self->_dateReceived forKey:@"dateReceived"];
  [v5 encodeObject:self->_invitationPayload forKey:@"invitationPayload"];
}

- (SKPublishedStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKPublishedStatus;
  id v5 = [(SKPublishedStatus *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusPayload"];
    statusPayload = v5->_statusPayload;
    v5->_statusPayload = (SKStatusPayload *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusUniqueIdentifier"];
    statusUniqueIdentifier = v5->_statusUniqueIdentifier;
    v5->_statusUniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datePublished"];
    datePublished = v5->_datePublished;
    v5->_datePublished = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateReceived"];
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationPayload"];
    invitationPayload = v5->_invitationPayload;
    v5->_invitationPayload = (SKInvitationPayload *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SKPublishedStatus *)self statusUniqueIdentifier];
  uint64_t v6 = [(SKPublishedStatus *)self statusPayload];
  v7 = [(SKPublishedStatus *)self datePublished];
  uint64_t v8 = [(SKPublishedStatus *)self dateReceived];
  v9 = [(SKPublishedStatus *)self dateCreated];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = \"%@\"; payload = \"%@\"; datePublished = \"%@\"; dateReceived = \"%@\"; dateCreated = \"%@\">",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  uint64_t v10 = v9);

  return v10;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (NSDate)datePublished
{
  return self->_datePublished;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (SKInvitationPayload)invitationPayload
{
  return self->_invitationPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationPayload, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_datePublished, 0);
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end