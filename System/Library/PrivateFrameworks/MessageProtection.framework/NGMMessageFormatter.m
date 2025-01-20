@interface NGMMessageFormatter
+ (id)formatOutgoingInnerMessageWithPayload:(id)a3 attributes:(id)a4 destinationIdentity:(id)a5 sendingIdentity:(id)a6 error:(id *)a7;
+ (id)formatOutgoingMessageWithEncryptedPayload:(id)a3 ephemeral:(id)a4 signature:(id)a5 keyValidator:(id)a6;
@end

@implementation NGMMessageFormatter

+ (id)formatOutgoingMessageWithEncryptedPayload:(id)a3 ephemeral:(id)a4 signature:(id)a5 keyValidator:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(NGMPBOuterMessage);
  [(NGMPBOuterMessage *)v13 setEncryptedPayload:v12];

  v14 = [v11 dataRepresentation];

  [(NGMPBOuterMessage *)v13 setEphemeralPubKey:v14];
  [(NGMPBOuterMessage *)v13 setSignature:v10];

  [(NGMPBOuterMessage *)v13 setKeyValidator:v9];
  v15 = [(NGMPBOuterMessage *)v13 data];

  return v15;
}

+ (id)formatOutgoingInnerMessageWithPayload:(id)a3 attributes:(id)a4 destinationIdentity:(id)a5 sendingIdentity:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  char v23 = 0;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_alloc_init(NGMPBInnerMessage);
  v16 = +[NGMReplayManager sharedManager];
  uint64_t v17 = [v16 counterForDestinationWithIdentityKey:v14 sendingIdentity:v13 error:a7 success:&v23];

  [(NGMPBInnerMessage *)v15 setCounter:v17];
  if (v12)
  {
    v18 = [v12 objectForKeyedSubscript:NGMEncryptedAttributeKTGossipData];

    if (v18)
    {
      v19 = [v12 objectForKeyedSubscript:NGMEncryptedAttributeKTGossipData];
      [(NGMPBInnerMessage *)v15 setKtGossipData:v19];
    }
  }
  if (v23)
  {
    [(NGMPBInnerMessage *)v15 setMessage:v11];
    v20 = [(NGMPBInnerMessage *)v15 data];
  }
  else
  {
    if (*a7)
    {
      v21 = MessageProtectionLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[NGMMessageFormatter formatOutgoingInnerMessageWithPayload:attributes:destinationIdentity:sendingIdentity:error:](a7, v21);
      }
    }
    else
    {
      MPLogAndAssignError(6, a7, @"Error while obtaining counter");
    }
    v20 = 0;
  }

  return v20;
}

+ (void)formatOutgoingInnerMessageWithPayload:(id *)a1 attributes:(NSObject *)a2 destinationIdentity:sendingIdentity:error:.cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [*a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Error while obtaining counter %@", (uint8_t *)&v4, 0xCu);
}

@end