@interface TUCallUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)hasVideo;
- (BOOL)isAnsweringMachineAvailable;
- (BOOL)isConversation;
- (BOOL)isEligibleForScreening;
- (NSUUID)UUID;
- (NSUUID)callUUID;
- (TUCallProvider)provider;
- (TUCallServicesInterface)callServicesInterface;
- (TUCallUpdate)init;
- (TUCallUpdate)initWithCoder:(id)a3;
- (TUCallUpdate)initWithProvider:(id)a3;
- (TUFeatureFlags)featureFlags;
- (TUHandle)handle;
- (id)clarityEnabledBlock;
- (id)contactsCountBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)junkConfidence;
- (int64_t)priority;
- (unint64_t)remoteParticipantCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAnsweringMachineAvailable:(BOOL)a3;
- (void)setCallServicesInterface:(id)a3;
- (void)setCallUUID:(id)a3;
- (void)setClarityEnabledBlock:(id)a3;
- (void)setContactsCountBlock:(id)a3;
- (void)setConversation:(BOOL)a3;
- (void)setEligibleForScreening:(BOOL)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setJunkConfidence:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProvider:(id)a3;
- (void)setRemoteParticipantCount:(unint64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUCallUpdate

- (TUCallUpdate)init
{
  v10.receiver = self;
  v10.super_class = (Class)TUCallUpdate;
  v2 = [(TUCallUpdate *)&v10 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __20__TUCallUpdate_init__block_invoke;
    v7[3] = &unk_1E58E6108;
    objc_copyWeak(&v8, &location);
    v3 = _Block_copy(v7);
    id contactsCountBlock = v2->_contactsCountBlock;
    v2->_id contactsCountBlock = v3;

    id clarityEnabledBlock = v2->_clarityEnabledBlock;
    v2->_id clarityEnabledBlock = &__block_literal_global_3;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __20__TUCallUpdate_init__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(MEMORY[0x1E4F1B980], "tu_contactStore");
  v3 = [WeakRetained handle];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = objc_msgSend(v2, "tu_contactsForHandles:keyDescriptors:error:", v4, MEMORY[0x1E4F1CBF0], 0);

  uint64_t v6 = [v5 count];
  return v6;
}

- (TUCallUpdate)initWithProvider:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallUpdate *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    provider = v5->_provider;
    v5->_provider = (TUCallProvider *)v6;

    id v8 = +[TUCallCenter sharedInstance];
    uint64_t v9 = [v8 callServicesInterface];
    callServicesInterface = v5->_callServicesInterface;
    v5->_callServicesInterface = (TUCallServicesInterface *)v9;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUCallUpdate *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUCallUpdate *)self callUUID];
  [v3 appendFormat:@" callUUID=%@", v5];

  uint64_t v6 = [(TUCallUpdate *)self provider];
  v7 = [v6 identifier];
  [v3 appendFormat:@" provider=%@", v7];

  id v8 = [(TUCallUpdate *)self handle];
  [v3 appendFormat:@" handle=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" priority=%ld", -[TUCallUpdate priority](self, "priority"));
  objc_msgSend(v3, "appendFormat:", @" junkConfidence=%ld", -[TUCallUpdate junkConfidence](self, "junkConfidence"));
  objc_msgSend(v3, "appendFormat:", @" remoteParticipantCount=%ld", -[TUCallUpdate remoteParticipantCount](self, "remoteParticipantCount"));
  objc_msgSend(v3, "appendFormat:", @" hasVideo=%d", -[TUCallUpdate hasVideo](self, "hasVideo"));
  objc_msgSend(v3, "appendFormat:", @" isConversation=%d", -[TUCallUpdate isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", @" isAnsweringMachineAvailable=%d", -[TUCallUpdate isAnsweringMachineAvailable](self, "isAnsweringMachineAvailable"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEligibleForScreening
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(TUCallUpdate *)self featureFlags];
  int v4 = TUCallScreeningEnabled(v3, 0);

  if (v4)
  {
    v5 = [(TUCallUpdate *)self clarityEnabledBlock];
    int v6 = v5[2]();

    if (v6)
    {
      v7 = TUDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: NO because ClarityUI is enabled", (uint8_t *)&v19, 2u);
      }
      LOBYTE(v4) = 0;
      goto LABEL_29;
    }
    if ([(TUCallUpdate *)self priority] == 2)
    {
      id v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: High Priority call, not screenable", (uint8_t *)&v19, 2u);
      }

      goto LABEL_21;
    }
    uint64_t v9 = [(TUCallUpdate *)self provider];
    if ([v9 isTelephonyProvider])
    {
      uint64_t v10 = [(TUCallUpdate *)self junkConfidence];

      if (v10 < 2) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v11 = [(TUCallUpdate *)self provider];
    int v12 = [v11 isFaceTimeProvider];

    if (!v12
      || ([(TUCallUpdate *)self handle],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 normalizedValue],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14)
      || [(TUCallUpdate *)self remoteParticipantCount] > 1
      || [(TUCallUpdate *)self hasVideo]
      || ![(TUCallUpdate *)self isConversation]
      || !(*((uint64_t (**)(void))self->_contactsCountBlock + 2))())
    {
LABEL_21:
      v15 = TUDefaultLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        int v4 = 0;
        goto LABEL_25;
      }
      LOWORD(v19) = 0;
      v16 = "isEligibleForScreening: NO, either telephony Junk Call or Emergency or not a U+1 audio call from a contact";
LABEL_23:
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 2u);
      goto LABEL_24;
    }
LABEL_12:
    if ([(TUCallUpdate *)self isAnsweringMachineAvailable])
    {
      int v4 = 1;
      goto LABEL_25;
    }
    v15 = TUDefaultLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    LOWORD(v19) = 0;
    v16 = "isEligibleForScreening: NO, Answering Machine is not currently available";
    goto LABEL_23;
  }
LABEL_25:
  v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = @"NO";
    if (v4) {
      v17 = @"YES";
    }
    int v19 = 138412546;
    v20 = v17;
    __int16 v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: %@ for call: %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_29:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_callUUID forKey:@"callUUID"];
  [v5 encodeObject:self->_provider forKey:@"provider"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeInteger:self->_priority forKey:@"priority"];
  [v5 encodeInteger:self->_junkConfidence forKey:@"junkConfidence"];
  [v5 encodeInteger:self->_remoteParticipantCount forKey:@"remoteParticipantCount"];
  [v5 encodeBool:self->_conversation forKey:@"conversation"];
  [v5 encodeBool:self->_hasVideo forKey:@"hasVideo"];
  [v5 encodeBool:self->_answeringMachineAvailable forKey:@"answeringMachineAvailable"];
}

- (TUCallUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
  int v6 = (void *)[v5 copy];

  v7 = [(TUCallUpdate *)self initWithProvider:v6];
  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uint64_t v9 = [v8 copy];
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
    uint64_t v12 = [v11 copy];
    callUUID = v7->_callUUID;
    v7->_callUUID = (NSUUID *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    uint64_t v15 = [v14 copy];
    handle = v7->_handle;
    v7->_handle = (TUHandle *)v15;

    v7->_priority = (int)[v4 decodeInt32ForKey:@"priority"];
    v7->_junkConfidence = (int)[v4 decodeInt32ForKey:@"junkConfidence"];
    v7->_remoteParticipantCount = (int)[v4 decodeInt32ForKey:@"remoteParticipantCount"];
    v7->_conversation = [v4 decodeBoolForKey:@"conversation"];
    v7->_hasVideo = [v4 decodeBoolForKey:@"hasVideo"];
    v7->_answeringMachineAvailable = [v4 decodeBoolForKey:@"answeringMachineAvailable"];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUCallUpdate allocWithZone:a3];
  id v5 = [(TUCallUpdate *)self provider];
  int v6 = [(TUCallUpdate *)v4 initWithProvider:v5];

  v7 = [(TUCallUpdate *)self UUID];
  id v8 = (void *)[v7 copy];
  [(TUCallUpdate *)v6 setUUID:v8];

  uint64_t v9 = [(TUCallUpdate *)self callUUID];
  uint64_t v10 = (void *)[v9 copy];
  [(TUCallUpdate *)v6 setCallUUID:v10];

  v11 = [(TUCallUpdate *)self handle];
  uint64_t v12 = (void *)[v11 copy];
  [(TUCallUpdate *)v6 setHandle:v12];

  [(TUCallUpdate *)v6 setPriority:[(TUCallUpdate *)self priority]];
  [(TUCallUpdate *)v6 setJunkConfidence:[(TUCallUpdate *)self junkConfidence]];
  [(TUCallUpdate *)v6 setRemoteParticipantCount:[(TUCallUpdate *)self remoteParticipantCount]];
  [(TUCallUpdate *)v6 setConversation:[(TUCallUpdate *)self isConversation]];
  [(TUCallUpdate *)v6 setHasVideo:[(TUCallUpdate *)self hasVideo]];
  [(TUCallUpdate *)v6 setAnsweringMachineAvailable:[(TUCallUpdate *)self isAnsweringMachineAvailable]];
  return v6;
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (unint64_t)remoteParticipantCount
{
  return self->_remoteParticipantCount;
}

- (void)setRemoteParticipantCount:(unint64_t)a3
{
  self->_remoteParticipantCount = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (void)setAnsweringMachineAvailable:(BOOL)a3
{
  self->_answeringMachineAvailable = a3;
}

- (void)setEligibleForScreening:(BOOL)a3
{
  self->_eligibleForScreening = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (TUCallServicesInterface)callServicesInterface
{
  return self->_callServicesInterface;
}

- (void)setCallServicesInterface:(id)a3
{
}

- (id)contactsCountBlock
{
  return self->_contactsCountBlock;
}

- (void)setContactsCountBlock:(id)a3
{
}

- (id)clarityEnabledBlock
{
  return self->_clarityEnabledBlock;
}

- (void)setClarityEnabledBlock:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clarityEnabledBlock, 0);
  objc_storeStrong(&self->_contactsCountBlock, 0);
  objc_storeStrong((id *)&self->_callServicesInterface, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end