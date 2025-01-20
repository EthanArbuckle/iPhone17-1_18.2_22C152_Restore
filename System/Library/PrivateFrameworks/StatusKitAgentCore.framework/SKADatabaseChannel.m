@interface SKADatabaseChannel
+ (id)logger;
- (BOOL)isDecomissioned;
- (BOOL)isPersonal;
- (MPStatusKitOutgoingRatchet)currentOutgoingRatchet;
- (NSArray)invitedUsers;
- (NSData)channelToken;
- (NSData)currentOutgoingRatchetState;
- (NSData)presenceMembershipKey;
- (NSData)presencePeerKey;
- (NSData)presenceServerKey;
- (NSDate)dateChannelCreated;
- (NSString)identifier;
- (NSString)presenceIdentifier;
- (NSString)serviceIdentifier;
- (NSString)statusType;
- (SKADatabaseChannel)initWithChannelToken:(id)a3 channelType:(int64_t)a4 identifier:(id)a5 personal:(BOOL)a6 decomissioned:(BOOL)a7 currentOutgoingRatchetState:(id)a8 dateCreated:(id)a9 statusType:(id)a10 presenceIdentifier:(id)a11 serviceIdentifier:(id)a12 invitedUsers:(id)a13 presenceServerKey:(id)a14 presencePeerKey:(id)a15 presenceMembershipKey:(id)a16;
- (SKADatabaseChannel)initWithCoreDataChannels:(id)a3;
- (id)description;
- (int64_t)channelType;
- (void)setDateChannelCreated:(id)a3;
@end

@implementation SKADatabaseChannel

- (SKADatabaseChannel)initWithChannelToken:(id)a3 channelType:(int64_t)a4 identifier:(id)a5 personal:(BOOL)a6 decomissioned:(BOOL)a7 currentOutgoingRatchetState:(id)a8 dateCreated:(id)a9 statusType:(id)a10 presenceIdentifier:(id)a11 serviceIdentifier:(id)a12 invitedUsers:(id)a13 presenceServerKey:(id)a14 presencePeerKey:(id)a15 presenceMembershipKey:(id)a16
{
  id v18 = a3;
  id v19 = a5;
  id obj = a8;
  id v49 = a8;
  v20 = v19;
  id v50 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v48 = a14;
  id v25 = a15;
  id v26 = a16;
  v51.receiver = self;
  v51.super_class = (Class)SKADatabaseChannel;
  v27 = [(SKADatabaseChannel *)&v51 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    channelToken = v27->_channelToken;
    v27->_channelToken = (NSData *)v28;

    v27->_channelType = a4;
    uint64_t v30 = [v20 copy];
    identifier = v27->_identifier;
    v27->_identifier = (NSString *)v30;

    v27->_personal = a6;
    v27->_decomissioned = a7;
    uint64_t v32 = [v50 copy];
    dateChannelCreated = v27->_dateChannelCreated;
    v27->_dateChannelCreated = (NSDate *)v32;

    objc_storeStrong((id *)&v27->_currentOutgoingRatchetState, obj);
    uint64_t v34 = [v21 copy];
    statusType = v27->_statusType;
    v27->_statusType = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    presenceIdentifier = v27->_presenceIdentifier;
    v27->_presenceIdentifier = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    serviceIdentifier = v27->_serviceIdentifier;
    v27->_serviceIdentifier = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    invitedUsers = v27->_invitedUsers;
    v27->_invitedUsers = (NSArray *)v40;

    objc_storeStrong((id *)&v27->_presenceServerKey, a14);
    objc_storeStrong((id *)&v27->_presencePeerKey, a15);
    objc_storeStrong((id *)&v27->_presenceMembershipKey, a16);
  }

  return v27;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier = \"%@\"; personal = %ld, decomissioned = %ld, statusType = \"%@\"; dateCreated = \"%@\">;",
               objc_opt_class(),
               self,
               self->_identifier,
               self->_personal,
               self->_decomissioned,
               self->_statusType,
               self->_dateChannelCreated);
}

+ (id)logger
{
  if (logger_onceToken_5 != -1) {
    dispatch_once(&logger_onceToken_5, &__block_literal_global_5);
  }
  v2 = (void *)logger__logger_5;
  return v2;
}

uint64_t __28__SKADatabaseChannel_logger__block_invoke()
{
  logger__logger_5 = (uint64_t)os_log_create("com.apple.StatusKit", "SKADatabaseChannel");
  return MEMORY[0x270F9A758]();
}

- (NSData)channelToken
{
  return self->_channelToken;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isPersonal
{
  return self->_personal;
}

- (BOOL)isDecomissioned
{
  return self->_decomissioned;
}

- (NSData)currentOutgoingRatchetState
{
  return self->_currentOutgoingRatchetState;
}

- (NSDate)dateChannelCreated
{
  return self->_dateChannelCreated;
}

- (void)setDateChannelCreated:(id)a3
{
}

- (NSString)statusType
{
  return self->_statusType;
}

- (int64_t)channelType
{
  return self->_channelType;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSArray)invitedUsers
{
  return self->_invitedUsers;
}

- (NSData)presenceServerKey
{
  return self->_presenceServerKey;
}

- (NSData)presencePeerKey
{
  return self->_presencePeerKey;
}

- (NSData)presenceMembershipKey
{
  return self->_presenceMembershipKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceMembershipKey, 0);
  objc_storeStrong((id *)&self->_presencePeerKey, 0);
  objc_storeStrong((id *)&self->_presenceServerKey, 0);
  objc_storeStrong((id *)&self->_invitedUsers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_dateChannelCreated, 0);
  objc_storeStrong((id *)&self->_currentOutgoingRatchetState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
}

- (MPStatusKitOutgoingRatchet)currentOutgoingRatchet
{
  if (self->_currentOutgoingRatchetState)
  {
    id v3 = objc_alloc(MEMORY[0x263F55678]);
    currentOutgoingRatchetState = self->_currentOutgoingRatchetState;
    id v11 = 0;
    v5 = (void *)[v3 initWithData:currentOutgoingRatchetState error:&v11];
    id v6 = v11;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      v9 = +[SKADatabaseChannel logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(SKADatabaseChannel(CurrentOutgoingRatchet) *)(uint64_t)v7 currentOutgoingRatchet];
      }

      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return (MPStatusKitOutgoingRatchet *)v5;
}

- (SKADatabaseChannel)initWithCoreDataChannels:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v38 + 1) + 8 * v8) invitedUsers];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v35;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [[SKADatabaseInvitedUser alloc] initWithCoreDataInvitedUser:*(void *)(*((void *)&v34 + 1) + 8 * v13)];
              [v4 addObject:v14];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  v15 = [obj firstObject];
  uint64_t v28 = [v15 channelToken];
  uint64_t v30 = (int)[v15 channelType];
  v29 = [v15 identifier];
  unsigned int v27 = [v15 personal];
  unsigned int v26 = [v15 decomissioned];
  id v25 = [v15 currentOutgoingRatchetState];
  id v24 = [v15 dateChannelCreated];
  id v23 = [v15 statusType];
  id v22 = [v15 presenceIdentifier];
  v16 = [v15 serviceIdentifier];
  v17 = (void *)[v4 copy];
  id v18 = [v15 serverKey];
  id v19 = [v15 peerKey];
  v20 = [v15 membershipKey];
  uint64_t v32 = [(SKADatabaseChannel *)self initWithChannelToken:v28 channelType:v30 identifier:v29 personal:v27 decomissioned:v26 currentOutgoingRatchetState:v25 dateCreated:v24 statusType:v23 presenceIdentifier:v22 serviceIdentifier:v16 invitedUsers:v17 presenceServerKey:v18 presencePeerKey:v19 presenceMembershipKey:v20];

  return v32;
}

@end