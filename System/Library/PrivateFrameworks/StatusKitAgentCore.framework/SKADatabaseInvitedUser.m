@interface SKADatabaseInvitedUser
- (NSData)invitationPayloadData;
- (NSDate)dateInvitationPayloadCreated;
- (NSString)invitedHandle;
- (NSString)senderHandle;
- (SKADatabaseInvitedUser)initWithCoreDataInvitedUser:(id)a3;
- (SKADatabaseInvitedUser)initWithInvitedHandle:(id)a3 senderHande:(id)a4 invitationPayloadData:(id)a5 dateInvitationPayloadCreated:(id)a6;
- (SKHandle)invitedSKHandle;
- (SKHandle)senderSKHandle;
- (SKInvitationPayload)invitationPayload;
@end

@implementation SKADatabaseInvitedUser

- (SKADatabaseInvitedUser)initWithCoreDataInvitedUser:(id)a3
{
  id v4 = a3;
  v5 = [v4 invitedHandle];
  v6 = [v4 senderHandle];
  v7 = [v4 invitationPayload];
  v8 = [v4 dateInvitationPayloadCreated];

  v9 = [(SKADatabaseInvitedUser *)self initWithInvitedHandle:v5 senderHande:v6 invitationPayloadData:v7 dateInvitationPayloadCreated:v8];
  return v9;
}

- (SKADatabaseInvitedUser)initWithInvitedHandle:(id)a3 senderHande:(id)a4 invitationPayloadData:(id)a5 dateInvitationPayloadCreated:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SKADatabaseInvitedUser;
  v14 = [(SKADatabaseInvitedUser *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    invitedHandle = v14->_invitedHandle;
    v14->_invitedHandle = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    senderHandle = v14->_senderHandle;
    v14->_senderHandle = (NSString *)v17;

    objc_storeStrong((id *)&v14->_invitationPayloadData, a5);
    objc_storeStrong((id *)&v14->_dateInvitationPayloadCreated, a6);
  }

  return v14;
}

- (NSString)invitedHandle
{
  return self->_invitedHandle;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSData)invitationPayloadData
{
  return self->_invitationPayloadData;
}

- (NSDate)dateInvitationPayloadCreated
{
  return self->_dateInvitationPayloadCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInvitationPayloadCreated, 0);
  objc_storeStrong((id *)&self->_invitationPayloadData, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_invitedHandle, 0);
}

- (SKHandle)invitedSKHandle
{
  v2 = self->_invitedHandle;
  if ([(NSString *)v2 length]) {
    v3 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return (SKHandle *)v3;
}

- (SKHandle)senderSKHandle
{
  v2 = self->_senderHandle;
  if ([(NSString *)v2 length]) {
    v3 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return (SKHandle *)v3;
}

- (SKInvitationPayload)invitationPayload
{
  if (self->_dateInvitationPayloadCreated) {
    v2 = (void *)[objc_alloc(MEMORY[0x263F797D0]) initWithData:self->_invitationPayloadData dateCreated:self->_dateInvitationPayloadCreated];
  }
  else {
    v2 = 0;
  }
  return (SKInvitationPayload *)v2;
}

@end