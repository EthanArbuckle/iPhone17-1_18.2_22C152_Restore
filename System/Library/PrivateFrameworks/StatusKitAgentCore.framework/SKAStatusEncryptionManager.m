@interface SKAStatusEncryptionManager
+ (id)logger;
- (SKADatabaseManaging)databaseManager;
- (SKAInvitationManaging)invitationManager;
- (SKAStatusEncryptionManager)initWithDatabaseManager:(id)a3 invitationManager:(id)a4;
- (id)_decryptPayload:(id)a3 withRatchetIndex:(unsigned __int16)a4 signatureData:(id)a5 channel:(id)a6;
- (id)_decryptPayloadData:(id)a3 withIncomingRatchet:(id)a4 withRatchetIndex:(unsigned __int16)a5 signatureData:(id)a6;
- (id)_deserializeBinaryPlistDictionaryData:(id)a3;
- (id)_encryptPayload:(id)a3 channel:(id)a4;
- (id)_mostRecentIncomingRatchetForChannel:(id)a3;
- (id)_serializeDictionaryAsBinaryPlist:(id)a3;
- (id)decryptStatusPayloadFromStatusEnvelopeData:(id)a3 channel:(id)a4;
- (id)encodeStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7;
- (id)encryptionValidationTokenForChannel:(id)a3;
- (id)extractEnvelopeFromStatusEnvelopeData:(id)a3;
- (void)encodeStatusPayloadForProvisioning:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7;
@end

@implementation SKAStatusEncryptionManager

- (SKAStatusEncryptionManager)initWithDatabaseManager:(id)a3 invitationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKAStatusEncryptionManager;
  v9 = [(SKAStatusEncryptionManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_invitationManager, a4);
  }

  return v10;
}

- (id)encodeStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7
{
  objc_super v12 = (objc_class *)MEMORY[0x263EFF9A0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v12);
  [v18 setObject:v16 forKeyedSubscript:@"i"];

  [v14 timeIntervalSince1970];
  double v20 = v19;

  v21 = [NSNumber numberWithDouble:v20];
  [v18 setObject:v21 forKeyedSubscript:@"p"];

  [v15 timeIntervalSince1970];
  double v23 = v22;

  v24 = [NSNumber numberWithDouble:v23];
  [v18 setObject:v24 forKeyedSubscript:@"c"];

  v25 = [v17 payloadData];

  v26 = [(SKAStatusEncryptionManager *)self _encryptPayload:v25 channel:v13];

  v27 = [v26 encryptedMessage];
  v28 = [v27 base64EncodedStringWithOptions:0];
  [v18 setObject:v28 forKeyedSubscript:@"e"];
  uint64_t v29 = [v26 index];
  v30 = [NSNumber numberWithUnsignedShort:v29];
  [v18 setObject:v30 forKeyedSubscript:@"r"];

  v31 = [v26 signature];
  v32 = [v31 base64EncodedStringWithOptions:0];
  [v18 setObject:v32 forKeyedSubscript:@"s"];
  v33 = [(SKAStatusEncryptionManager *)self _serializeDictionaryAsBinaryPlist:v18];

  return v33;
}

- (void)encodeStatusPayloadForProvisioning:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = [v12 statusPayload];
  uint64_t v18 = [(SKAStatusEncryptionManager *)self encodeStatusPayload:v17 statusUniqueIdentifier:v16 dateCreated:v15 currentServerTime:v14 channel:v13];

  double v19 = objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithRandomBytes:", 32);
  double v20 = objc_alloc_init(SharedChannelProvisionOffGridPacket);
  v44 = (void *)v18;
  [(SharedChannelProvisionOffGridPacket *)v20 setPublishPayload:v18];
  id v21 = objc_alloc(MEMORY[0x263EFF8F8]);
  double v22 = [v13 identifier];

  double v23 = (void *)[v21 initWithBase64EncodedString:v22 options:0];
  [(SharedChannelProvisionOffGridPacket *)v20 setChannelId:v23];

  [(SharedChannelProvisionOffGridPacket *)v20 setChannelTopic:@"com.apple.icloud.presence.mode.status"];
  [(SharedChannelProvisionOffGridPacket *)v20 setCommitmentSalt:v19];
  v24 = objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithRandomBytes:", 12);
  v25 = (void *)[v24 mutableCopy];

  v26 = [MEMORY[0x263EFF990] dataWithLength:16];
  v43 = v20;
  v27 = [(SharedChannelProvisionOffGridPacket *)v20 data];
  [v26 appendData:v27];

  v28 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", objc_msgSend(v26, "length"));
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:16];
  objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithRandomBytes:", 16);
  id v30 = objc_claimAutoreleasedReturnValue();
  [v30 bytes];
  [v30 length];
  id v31 = v25;
  [v31 bytes];
  id v32 = v26;
  [v32 bytes];
  uint64_t v33 = [v32 length];
  id v34 = v28;
  uint64_t v35 = [v34 mutableBytes];
  id v36 = v29;
  uint64_t v42 = [v36 mutableBytes];
  uint64_t v41 = v35;
  int v37 = CCCryptorGCMOneshotEncrypt();
  if (v37)
  {
    int v38 = v37;
    v39 = v31;
    v40 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v46 = v38;
      _os_log_impl(&dword_22480C000, v40, OS_LOG_TYPE_DEFAULT, "CCCryptorGCMOneshotEncrypt failed with result %d.", buf, 8u);
    }
  }
  else
  {
    objc_msgSend(v12, "setCommitmentSalt:", v19, v33, v35, v42, 16);
    [v12 setDecryptionKey:v30];
    [v12 setInitializationVector:v31];
    [v34 appendData:v36];
    [v12 setEncryptedStatusPayload:v34];
    v39 = v31;
  }
}

- (id)_encryptPayload:(id)a3 channel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 currentOutgoingRatchet];
  if (v8)
  {
LABEL_2:
    id v25 = 0;
    v9 = [v8 sealStatus:v6 authenticating:0 error:&v25];
    v10 = v25;
    v11 = +[SKAStatusEncryptionManager logger];
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusEncryptionManager _encryptPayload:channel:]();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Message encrypted successfully", buf, 2u);
    }

    goto LABEL_21;
  }
  id v13 = +[SKAStatusEncryptionManager logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Channel does not have a current outgoing ratchet, rolling encryption key to generate a new one.", buf, 2u);
  }

  invitationManager = self->_invitationManager;
  id v15 = [v7 statusType];
  id v26 = 0;
  int v16 = [(SKAInvitationManaging *)invitationManager rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:v15 error:&v26];
  id v17 = v26;

  uint64_t v18 = +[SKAStatusEncryptionManager logger];
  double v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Encryption key rolled successfully, fetching new key", buf, 2u);
    }

    double v20 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
    databaseManager = self->_databaseManager;
    double v22 = [v7 statusType];
    double v23 = [(SKADatabaseManaging *)databaseManager existingPersonalChannelForStatusTypeIdentifier:v22 databaseContext:v20];

    id v8 = [v23 currentOutgoingRatchet];

    if (v8) {
      goto LABEL_2;
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _encryptPayload:channel:]();
    }
  }
  v10 = +[SKAStatusEncryptionManager logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusEncryptionManager _encryptPayload:channel:]();
  }
  id v8 = 0;
  v9 = 0;
LABEL_21:

  return v9;
}

- (id)_decryptPayload:(id)a3 withRatchetIndex:(unsigned __int16)a4 signatureData:(id)a5 channel:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v10 = a5;
  id v11 = a6;
  LODWORD(a6) = [v11 isPersonal];
  uint64_t v12 = [(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  databaseManager = self->_databaseManager;
  unint64_t v14 = 0x2646E0000uLL;
  int v46 = (void *)v12;
  id v49 = v11;
  if (a6)
  {
    id v15 = -[SKADatabaseManaging generatedEncryptionKeysForPersonalChannel:databaseContext:](databaseManager, "generatedEncryptionKeysForPersonalChannel:databaseContext:", v11);
    int v16 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = [v15 count];
      _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt incoming status on personal channel using keys from %ld outgoing ratchets.", buf, 0xCu);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v15;
    uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
LABEL_6:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v57 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v56 + 1) + 8 * v20);
        double v22 = objc_msgSend(v21, "incomingRatchet", v46);
        double v23 = [(SKAStatusEncryptionManager *)self _decryptPayloadData:v51 withIncomingRatchet:v22 withRatchetIndex:v8 signatureData:v10];
        v24 = [*(id *)(v14 + 2536) logger];
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v23) {
          break;
        }
        if (v25)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v63 = (uint64_t)v21;
          _os_log_impl(&dword_22480C000, v24, OS_LOG_TYPE_DEFAULT, "Status payload not decrypted from generatedKey: %@", buf, 0xCu);
        }

        ++v20;
        unint64_t v14 = 0x2646E0000;
        if (v18 == v20)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
          if (v18) {
            goto LABEL_6;
          }
          goto LABEL_14;
        }
      }
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = (uint64_t)v21;
        _os_log_impl(&dword_22480C000, v24, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypted from generatedKey: %@", buf, 0xCu);
      }

      int v37 = (void *)[objc_alloc(MEMORY[0x263F79820]) initWithData:v23];
      int v38 = [[SKADecryptedStatusPayload alloc] initWithStatusPayload:v37 invitation:0];

      unint64_t v14 = 0x2646E0000uLL;
      if (v38) {
        goto LABEL_36;
      }
    }
    else
    {
LABEL_14:
    }
    v39 = objc_msgSend(*(id *)(v14 + 2536), "logger", v46);
    v40 = v47;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _decryptPayload:withRatchetIndex:signatureData:channel:]();
    }
  }
  else
  {
    id v26 = -[SKADatabaseManaging receivedInvitationsForChannel:databaseContext:](databaseManager, "receivedInvitationsForChannel:databaseContext:", v11);
    v27 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = [v26 count];
      _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt incoming status on non personal channel using incoming ratchet state from %ld received invitations.", buf, 0xCu);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v26;
    uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v53;
LABEL_19:
      uint64_t v31 = 0;
      while (1)
      {
        if (*(void *)v53 != v30) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(void **)(*((void *)&v52 + 1) + 8 * v31);
        uint64_t v33 = objc_msgSend(v32, "incomingRatchet", v46);
        id v34 = [(SKAStatusEncryptionManager *)self _decryptPayloadData:v51 withIncomingRatchet:v33 withRatchetIndex:v8 signatureData:v10];
        uint64_t v35 = +[SKAStatusEncryptionManager logger];
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v34) {
          break;
        }
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v63 = (uint64_t)v32;
          _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Status payload not decrypted from invitation: %@", buf, 0xCu);
        }

        ++v31;
        unint64_t v14 = 0x2646E0000uLL;
        if (v29 == v31)
        {
          uint64_t v29 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v29) {
            goto LABEL_19;
          }
          goto LABEL_27;
        }
      }
      if (v36)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = (uint64_t)v32;
        _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypted from invitation: %@", buf, 0xCu);
      }

      uint64_t v41 = (void *)[objc_alloc(MEMORY[0x263F79820]) initWithData:v34];
      uint64_t v42 = [obj firstObject];
      int v38 = [[SKADecryptedStatusPayload alloc] initWithStatusPayload:v41 invitation:v42];

      unint64_t v14 = 0x2646E0000;
      if (v38)
      {
LABEL_36:
        v40 = v46;
        v43 = v49;
        goto LABEL_40;
      }
    }
    else
    {
LABEL_27:
    }
    v39 = objc_msgSend(*(id *)(v14 + 2536), "logger", v46);
    v40 = v48;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _decryptPayload:withRatchetIndex:signatureData:channel:]();
    }
  }
  v43 = v49;

  int v38 = 0;
LABEL_40:

  v44 = [*(id *)(v14 + 2536) logger];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v63 = (uint64_t)v38;
    _os_log_impl(&dword_22480C000, v44, OS_LOG_TYPE_DEFAULT, "Decrypted payload: %@", buf, 0xCu);
  }

  return v38;
}

- (id)_decryptPayloadData:(id)a3 withIncomingRatchet:(id)a4 withRatchetIndex:(unsigned __int16)a5 signatureData:(id)a6
{
  id v12 = 0;
  id v6 = [a4 unsealStatusWithIndex:a5 encryptedMessage:a3 authenticating:0 signature:a6 error:&v12];
  id v7 = v12;
  if (v7)
  {
    uint64_t v8 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:]();
    }
  }
  else
  {
    id v10 = +[SKAStatusEncryptionManager logger];
    uint64_t v8 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypted", v11, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:]();
    }
  }

  return v6;
}

- (id)extractEnvelopeFromStatusEnvelopeData:(id)a3
{
  v3 = [(SKAStatusEncryptionManager *)self _deserializeBinaryPlistDictionaryData:a3];
  if (v3) {
    v4 = [[SKAStatusUnencryptedEnvelope alloc] initWithEnvelopeDictionary:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)decryptStatusPayloadFromStatusEnvelopeData:(id)a3 channel:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    id v15 = 0;
    goto LABEL_26;
  }
  id v7 = [(SKAStatusEncryptionManager *)self _deserializeBinaryPlistDictionaryData:a3];
  uint64_t v8 = v7;
  if (!v7)
  {
    v9 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:]();
    }
    id v15 = 0;
    goto LABEL_25;
  }
  v9 = objc_msgSend(v7, "ska_dataFrombase64EncodedStringForKey:", @"e");
  if (!v9)
  {
    id v10 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:]();
    }
    id v15 = 0;
    goto LABEL_24;
  }
  id v10 = objc_msgSend(v8, "ska_dataFrombase64EncodedStringForKey:", @"s");
  if (!v10)
  {
    id v12 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:]();
    }
    id v15 = 0;
    goto LABEL_23;
  }
  id v11 = objc_msgSend(v8, "ska_numberForKey:", @"r");
  id v12 = v11;
  if (v11)
  {
    unint64_t v13 = [v11 integerValue];
    if (v13 < 0x10000)
    {
      id v15 = [(SKAStatusEncryptionManager *)self _decryptPayload:v9 withRatchetIndex:(unsigned __int16)v13 signatureData:v10 channel:v6];
      uint64_t v17 = +[SKAStatusEncryptionManager logger];
      unint64_t v14 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully decrypted status payload", v18, 2u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.6();
      }
      goto LABEL_22;
    }
    unint64_t v14 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.5();
    }
  }
  else
  {
    unint64_t v14 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.4();
    }
  }
  id v15 = 0;
LABEL_22:

LABEL_23:
LABEL_24:

LABEL_25:
LABEL_26:

  return v15;
}

- (id)encryptionValidationTokenForChannel:(id)a3
{
  v3 = [(SKAStatusEncryptionManager *)self _mostRecentIncomingRatchetForChannel:a3];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 signingKeyIdentifier];
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v4, "ska_hexString");
  unint64_t v6 = [v5 length];
  if (v6 >= 4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = [v5 substringToIndex:v7];

  return v8;
}

- (id)_mostRecentIncomingRatchetForChannel:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 isPersonal];
  unint64_t v6 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  databaseManager = self->_databaseManager;
  if (!v5)
  {
    int v16 = [(SKADatabaseManaging *)databaseManager receivedInvitationsForChannel:v4 databaseContext:v6];
    uint64_t v17 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v16 count];
      _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Finding most recent incoming ratchet for non personal channel using incoming ratchet state from %ld received invitations.", buf, 0xCu);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v16;
    uint64_t v18 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
LABEL_17:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v21), "incomingRatchet", (void)v25);
        if (v15) {
          goto LABEL_24;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v19) {
            goto LABEL_17;
          }
          break;
        }
      }
    }
LABEL_23:
    double v22 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [(SKADatabaseManaging *)databaseManager generatedEncryptionKeysForPersonalChannel:v4 databaseContext:v6];
  v9 = +[SKAStatusEncryptionManager logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = [v8 count];
    _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Finding most recent incoming ratchet for personal channel from %ld outgoing ratchets.", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v11) {
    goto LABEL_23;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v30;
LABEL_6:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v30 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = [*(id *)(*((void *)&v29 + 1) + 8 * v14) incomingRatchet];
    if (v15) {
      break;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
LABEL_24:
  double v22 = (void *)v15;
LABEL_25:

  if (!v22)
  {
    double v23 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _mostRecentIncomingRatchetForChannel:]();
    }
  }
  return v22;
}

- (id)_serializeDictionaryAsBinaryPlist:(id)a3
{
  if (a3)
  {
    id v7 = 0;
    v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v7];
    id v4 = v7;
    if (v4)
    {
      int v5 = +[SKAStatusEncryptionManager logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusEncryptionManager _serializeDictionaryAsBinaryPlist:]();
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_deserializeBinaryPlistDictionaryData:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_16;
  }
  id v17 = 0;
  id v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:&v17];
  id v5 = v17;
  if (!v5) {
    goto LABEL_16;
  }
  id v6 = v5;
  id v7 = +[SKAStatusEncryptionManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:]();
  }

  uint64_t v8 = [[SharedChannelPublishPayload alloc] initWithData:v3];
  v9 = v8;
  if (!v8
    || ([(SharedChannelPublishPayload *)v8 publishPayloadContent],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    uint64_t v14 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:]();
    }
    uint64_t v13 = (uint64_t)v4;
    goto LABEL_14;
  }

  uint64_t v11 = (void *)MEMORY[0x263F08AC0];
  uint64_t v12 = [(SharedChannelPublishPayload *)v9 publishPayloadContent];
  id v16 = 0;
  uint64_t v13 = [v11 propertyListWithData:v12 options:0 format:0 error:&v16];
  id v6 = v16;

  if (v6)
  {
    uint64_t v14 = +[SKAStatusEncryptionManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(SKAStatusEncryptionManager *)v9 _deserializeBinaryPlistDictionaryData:v14];
    }
LABEL_14:
  }
  id v4 = (void *)v13;
LABEL_16:

  return v4;
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger__logger;
  return v2;
}

uint64_t __36__SKAStatusEncryptionManager_logger__block_invoke()
{
  logger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusEncryptionManager");
  return MEMORY[0x270F9A758]();
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)_encryptPayload:channel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to encrypt status due to nil outgoing encryption key", v2, v3, v4, v5, v6);
}

- (void)_encryptPayload:channel:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error encrypting status: %@", v2, v3, v4, v5, v6);
}

- (void)_encryptPayload:channel:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Key roll failed, unable to encrypt status", v2, v3, v4, v5, v6);
}

- (void)_decryptPayload:withRatchetIndex:signatureData:channel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Status payload failed to decrypt with all known generated encryption keys.", v2, v3, v4, v5, v6);
}

- (void)_decryptPayload:withRatchetIndex:signatureData:channel:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Status payload failed to decrypt with all known invitations.", v2, v3, v4, v5, v6);
}

- (void)_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Status payload decrypted to nil data", v2, v3, v4, v5, v6);
}

- (void)_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Status payload failed to decrypt with error: %@", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Extracting status payload, but envelope dictionary is not deserializable. Returning nil payload.", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Extracting status payload, but encrypted payload is missing, is this an empty status update, or a malformed status: %@", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to extract status payload, signature is missing: %@", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to extract status payload, ratchet index is missing: %@", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to extract status payload, ratchet index is an invalid number: %@", v2, v3, v4, v5, v6);
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to decrypt status payload", v2, v3, v4, v5, v6);
}

- (void)_mostRecentIncomingRatchetForChannel:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unable to find most recent incoming ratchet for channel: %@", v2, v3, v4, v5, v6);
}

- (void)_serializeDictionaryAsBinaryPlist:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error serializing status envelope dictionary: %@", v2, v3, v4, v5, v6);
}

- (void)_deserializeBinaryPlistDictionaryData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error deserializing status envelope data from protobuf content %@", v2, v3, v4, v5, v6);
}

- (void)_deserializeBinaryPlistDictionaryData:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 publishPayloadContent];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_22480C000, a3, OS_LOG_TYPE_ERROR, "Error deserializing status envelope data as dictionary from proto data: %@ with error %@", v6, 0x16u);
}

- (void)_deserializeBinaryPlistDictionaryData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error deserializing status envelope data as dictionary, will attempt as proto data: %@", v2, v3, v4, v5, v6);
}

@end