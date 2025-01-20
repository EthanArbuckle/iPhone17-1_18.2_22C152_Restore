@interface SKADatabaseReceivedInvitation
+ (id)logger;
- (MPStatusKitIncomingRatchet)incomingRatchet;
- (NSData)channelToken;
- (NSData)incomingRatchetState;
- (NSData)invitationPayload;
- (NSData)peerKey;
- (NSData)serverKey;
- (NSDate)dateInvitationCreated;
- (NSString)invitationIdentifier;
- (NSString)invitedHandle;
- (NSString)presenceIdentifier;
- (NSString)senderHandle;
- (NSString)statusTypeIdentifier;
- (SKADatabaseReceivedInvitation)initWithCoreDataReceivedInvitation:(id)a3;
- (SKADatabaseReceivedInvitation)initWithInvitationIdentifier:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 statusTypeIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13;
- (SKHandle)invitedSKHandle;
- (SKHandle)senderSKHandle;
- (SKInvitationPayload)skInvitationPayload;
- (id)description;
- (int64_t)invitationType;
@end

@implementation SKADatabaseReceivedInvitation

- (SKADatabaseReceivedInvitation)initWithCoreDataReceivedInvitation:(id)a3
{
  id v3 = a3;
  v4 = [v3 invitationIdentifier];
  v15 = [v3 senderHandle];
  v14 = [v3 invitedHandle];
  v5 = [v3 statusTypeIdentifier];
  v6 = [v3 dateInvitationCreated];
  v7 = [v3 incomingRatchetState];
  v13 = [v3 presenceIdentifier];
  v8 = [v3 channelToken];
  v9 = [v3 serverKey];
  v10 = [v3 peerKey];
  v11 = [v3 invitationPayload];

  v17 = [(SKADatabaseReceivedInvitation *)self initWithInvitationIdentifier:v4 senderHandle:v15 invitedHandle:v14 statusTypeIdentifier:v5 dateInvitationCreated:v6 incomingRatchetState:v7 presenceIdentifier:v13 channelToken:v8 serverKey:v9 peerKey:v10 invitationPayload:v11];
  return v17;
}

- (SKADatabaseReceivedInvitation)initWithInvitationIdentifier:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 statusTypeIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13
{
  id v43 = a3;
  id v42 = a4;
  id v18 = a5;
  id v19 = a6;
  id v41 = a7;
  id v39 = a8;
  id v20 = a9;
  id v37 = a10;
  id v40 = a11;
  id v38 = a12;
  id v21 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SKADatabaseReceivedInvitation;
  v22 = [(SKADatabaseReceivedInvitation *)&v44 init];
  if (v22)
  {
    uint64_t v23 = [v43 copy];
    invitationIdentifier = v22->_invitationIdentifier;
    v22->_invitationIdentifier = (NSString *)v23;

    uint64_t v25 = [v19 copy];
    statusTypeIdentifier = v22->_statusTypeIdentifier;
    v22->_statusTypeIdentifier = (NSString *)v25;

    uint64_t v27 = [v20 copy];
    presenceIdentifier = v22->_presenceIdentifier;
    v22->_presenceIdentifier = (NSString *)v27;

    objc_storeStrong((id *)&v22->_channelToken, a10);
    objc_storeStrong((id *)&v22->_serverKey, a11);
    objc_storeStrong((id *)&v22->_peerKey, a12);
    uint64_t v29 = [v42 copy];
    senderHandle = v22->_senderHandle;
    v22->_senderHandle = (NSString *)v29;

    uint64_t v31 = [v18 copy];
    invitedHandle = v22->_invitedHandle;
    v22->_invitedHandle = (NSString *)v31;

    objc_storeStrong((id *)&v22->_dateInvitationCreated, a7);
    objc_storeStrong((id *)&v22->_incomingRatchetState, a8);
    uint64_t v33 = [v21 copy];
    invitationPayload = v22->_invitationPayload;
    v22->_invitationPayload = (NSData *)v33;

    v22->_invitationType = v19 == 0;
  }

  return v22;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SKADatabaseReceivedInvitation *)self invitationIdentifier];
  v6 = [(SKADatabaseReceivedInvitation *)self dateInvitationCreated];
  v7 = [(SKADatabaseReceivedInvitation *)self skInvitationPayload];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = \"%@\"; dateCreated = \"%@\"; invitationPayload: \"%@\">",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return v8;
}

+ (id)logger
{
  if (logger_onceToken_13 != -1) {
    dispatch_once(&logger_onceToken_13, &__block_literal_global_13);
  }
  v2 = (void *)logger__logger_13;
  return v2;
}

uint64_t __39__SKADatabaseReceivedInvitation_logger__block_invoke()
{
  logger__logger_13 = (uint64_t)os_log_create("com.apple.StatusKit", "SKADatabaseReceivedInvitation");
  return MEMORY[0x270F9A758]();
}

- (int64_t)invitationType
{
  return self->_invitationType;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)invitedHandle
{
  return self->_invitedHandle;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSData)channelToken
{
  return self->_channelToken;
}

- (NSData)peerKey
{
  return self->_peerKey;
}

- (NSData)serverKey
{
  return self->_serverKey;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSDate)dateInvitationCreated
{
  return self->_dateInvitationCreated;
}

- (NSData)incomingRatchetState
{
  return self->_incomingRatchetState;
}

- (NSData)invitationPayload
{
  return self->_invitationPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationPayload, 0);
  objc_storeStrong((id *)&self->_incomingRatchetState, 0);
  objc_storeStrong((id *)&self->_dateInvitationCreated, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_serverKey, 0);
  objc_storeStrong((id *)&self->_peerKey, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_invitedHandle, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
}

- (SKHandle)invitedSKHandle
{
  v2 = self->_invitedHandle;
  if ([(NSString *)v2 length]) {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v2];
  }
  else {
    id v3 = 0;
  }

  return (SKHandle *)v3;
}

- (SKHandle)senderSKHandle
{
  v2 = self->_senderHandle;
  if ([(NSString *)v2 length]) {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v2];
  }
  else {
    id v3 = 0;
  }

  return (SKHandle *)v3;
}

- (MPStatusKitIncomingRatchet)incomingRatchet
{
  v2 = self->_incomingRatchetState;
  if (v2)
  {
    id v7 = 0;
    id v3 = (void *)[objc_alloc(MEMORY[0x263F55670]) initWithData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      v5 = +[SKADatabaseReceivedInvitation logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(SKADatabaseReceivedInvitation(IncomingRatchet) *)(uint64_t)v4 incomingRatchet];
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return (MPStatusKitIncomingRatchet *)v3;
}

- (SKInvitationPayload)skInvitationPayload
{
  invitationPayload = self->_invitationPayload;
  if (invitationPayload)
  {
    id v3 = (objc_class *)MEMORY[0x263F797D0];
    id v4 = invitationPayload;
    v5 = (void *)[[v3 alloc] initWithData:v4 dateCreated:0];
  }
  else
  {
    v5 = 0;
  }
  return (SKInvitationPayload *)v5;
}

@end