@interface SKADecryptedStatusPayload
- (SKADatabaseReceivedInvitation)invitation;
- (SKADecryptedStatusPayload)initWithStatusPayload:(id)a3 invitation:(id)a4;
- (SKStatusPayload)statusPayload;
- (id)description;
@end

@implementation SKADecryptedStatusPayload

- (SKADecryptedStatusPayload)initWithStatusPayload:(id)a3 invitation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKADecryptedStatusPayload;
  v9 = [(SKADecryptedStatusPayload *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statusPayload, a3);
    objc_storeStrong((id *)&v10->_invitation, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SKADecryptedStatusPayload *)self statusPayload];
  v6 = [(SKADecryptedStatusPayload *)self invitation];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; statusPayload = \"%@\"; invitation = \"%@\">;",
    v4,
    self,
    v5,
  id v7 = v6);

  return v7;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (SKADatabaseReceivedInvitation)invitation
{
  return self->_invitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end