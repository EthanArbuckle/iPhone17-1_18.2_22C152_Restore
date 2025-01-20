@interface CSDRelayConversation
- (BOOL)endpointOnCurrentDevice;
- (CSDRelayConversation)initWithRelayMessage:(id)a3 queue:(id)a4;
- (CSDRelayConversationDelegate)delegate;
- (NSSet)activeRemoteParticipants;
- (NSSet)remoteMembers;
- (NSUUID)UUID;
- (NSUUID)groupUUID;
- (NSUUID)messagesGroupUUID;
- (OS_dispatch_queue)queue;
- (TUConversation)tuConversation;
- (TUConversationMember)localMember;
- (TUConversationReport)report;
- (TUHandle)initiator;
- (id)description;
- (int64_t)state;
- (unint64_t)avMode;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setLocalMember:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateWithProminenceRelayMessage:(id)a3;
- (void)updateWithRelayMessage:(id)a3;
@end

@implementation CSDRelayConversation

- (CSDRelayConversation)initWithRelayMessage:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CSDRelayConversation;
  v8 = [(CSDRelayConversation *)&v36 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_state = (int64_t)[v6 tuState];
    id v10 = objc_alloc((Class)NSUUID);
    v11 = [v6 uUIDString];
    v12 = (NSUUID *)[v10 initWithUUIDString:v11];
    UUID = v9->_UUID;
    v9->_UUID = v12;

    id v14 = objc_alloc((Class)NSUUID);
    v15 = [v6 groupUUIDString];
    v16 = (NSUUID *)[v14 initWithUUIDString:v15];
    groupUUID = v9->_groupUUID;
    v9->_groupUUID = v16;

    id v18 = objc_alloc((Class)NSUUID);
    v19 = [v6 messagesGroupUUIDString];
    v20 = (NSUUID *)[v18 initWithUUIDString:v19];
    messagesGroupUUID = v9->_messagesGroupUUID;
    v9->_messagesGroupUUID = v20;

    v22 = [v6 localMember];
    uint64_t v23 = [v22 tuConversationMember];
    localMember = v9->_localMember;
    v9->_localMember = (TUConversationMember *)v23;

    v9->_avMode = (unint64_t)[v6 tuAVMode];
    v25 = [v6 initiator];
    uint64_t v26 = [v25 tuHandle];
    initiator = v9->_initiator;
    v9->_initiator = (TUHandle *)v26;

    v28 = [v6 reportData];
    uint64_t v29 = [v28 tuConversationReport];
    report = v9->_report;
    v9->_report = (TUConversationReport *)v29;

    uint64_t v31 = [v6 tuConversationMembers];
    remoteMembers = v9->_remoteMembers;
    v9->_remoteMembers = (NSSet *)v31;

    uint64_t v33 = [v6 tuConversationParticipants];
    activeRemoteParticipants = v9->_activeRemoteParticipants;
    v9->_activeRemoteParticipants = (NSSet *)v33;

    v9->_endpointOnCurrentDevice = 1;
  }

  return v9;
}

- (void)updateWithRelayMessage:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc((Class)NSUUID);
  id v7 = [v4 messagesGroupUUIDString];
  id v8 = [v6 initWithUUIDString:v7];
  [(CSDRelayConversation *)self setMessagesGroupUUID:v8];

  v9 = [v4 tuConversationParticipants];
  [(CSDRelayConversation *)self setActiveRemoteParticipants:v9];

  id v10 = [v4 tuConversationMembers];
  [(CSDRelayConversation *)self setRemoteMembers:v10];

  -[CSDRelayConversation setState:](self, "setState:", [v4 tuState]);
  -[CSDRelayConversation setAvMode:](self, "setAvMode:", [v4 tuAVMode]);
  v11 = [v4 localMember];

  v12 = [v11 tuConversationMember];
  [(CSDRelayConversation *)self setLocalMember:v12];

  id v13 = [(CSDRelayConversation *)self delegate];
  [v13 conversationChanged:self];
}

- (void)updateWithProminenceRelayMessage:(id)a3
{
  id v4 = a3;
  uint64_t v23 = self;
  v5 = [(CSDRelayConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 prominenceEntrys];
  id v7 = v6;
  if (v6)
  {
    id v21 = v4;
    id obj = v6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = [(CSDRelayConversation *)v23 activeRemoteParticipants];
          id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
                id v19 = [v18 identifier];
                if (v19 == [v12 participantIdentifier]) {
                  objc_msgSend(v18, "setAudioPriority:", objc_msgSend(v12, "audioPriority"));
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
    v20 = [(CSDRelayConversation *)v23 delegate];
    [v20 conversationChanged:v23];
    id v4 = v21;
    id v7 = obj;
  }
  else
  {
    v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1003AD318(v20);
    }
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CSDRelayConversation *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(CSDRelayConversation *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v5];

  id v6 = [(CSDRelayConversation *)self messagesGroupUUID];

  if (v6)
  {
    id v7 = [(CSDRelayConversation *)self messagesGroupUUID];
    [v3 appendFormat:@" messagesGroupUUID=%@", v7];
  }
  objc_msgSend(v3, "appendFormat:", @" state=%ld", -[CSDRelayConversation state](self, "state"));
  id v8 = [(CSDRelayConversation *)self localMember];
  [v3 appendFormat:@" localMember=%@", v8];

  id v9 = [(CSDRelayConversation *)self remoteMembers];
  [v3 appendFormat:@" remoteMembers=%@", v9];

  uint64_t v10 = [(CSDRelayConversation *)self activeRemoteParticipants];
  [v3 appendFormat:@" activeRemoteParticipants=%@", v10];

  [v3 appendString:@">"];
  id v11 = [v3 copy];

  return v11;
}

- (TUConversation)tuConversation
{
  v3 = [(CSDRelayConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDRelayConversation *)self groupUUID];
  v5 = +[TUMutableConversation emptyConversationWithGroupUUID:v4];

  [v5 setHostedOnCurrentDevice:0];
  objc_msgSend(v5, "setEndpointOnCurrentDevice:", -[CSDRelayConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
  id v6 = [(CSDRelayConversation *)self UUID];
  [v5 setUUID:v6];

  id v7 = +[TUConversationProvider faceTimeProvider];
  [v5 setProvider:v7];

  id v8 = objc_alloc_init((Class)NSSet);
  [v5 setActivitySessions:v8];

  id v9 = objc_alloc_init((Class)NSSet);
  [v5 setKickedMembers:v9];

  id v10 = objc_alloc_init((Class)NSSet);
  [v5 setRejectedMembers:v10];

  id v11 = objc_alloc_init((Class)NSSet);
  [v5 setOtherInvitedHandles:v11];

  id v12 = objc_alloc_init((Class)NSSet);
  [v5 setParticipantHandles:v12];

  if ([(CSDRelayConversation *)self endpointOnCurrentDevice]) {
    int64_t v13 = [(CSDRelayConversation *)self state];
  }
  else {
    int64_t v13 = 0;
  }
  [v5 setState:v13];
  objc_msgSend(v5, "setState:", -[CSDRelayConversation state](self, "state"));
  id v14 = [(CSDRelayConversation *)self messagesGroupUUID];
  [v5 setMessagesGroupUUID:v14];

  id v15 = [(CSDRelayConversation *)self remoteMembers];
  [v5 setRemoteMembers:v15];

  uint64_t v16 = [(CSDRelayConversation *)self localMember];
  [v5 setLocalMember:v16];

  objc_msgSend(v5, "setAvMode:", -[CSDRelayConversation avMode](self, "avMode"));
  v17 = [(CSDRelayConversation *)self initiator];
  [v5 setInitiator:v17];

  id v18 = [(CSDRelayConversation *)self report];
  [v5 setReport:v18];

  id v19 = [(CSDRelayConversation *)self activeRemoteParticipants];
  id v20 = [v19 copy];
  [v5 setActiveRemoteParticipants:v20];

  id v21 = [v5 copy];

  return (TUConversation *)v21;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
  id v4 = [(CSDRelayConversation *)self delegate];
  [v4 conversationChanged:self];
}

- (CSDRelayConversationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDRelayConversationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (TUConversationReport)report
{
  return self->_report;
}

- (BOOL)endpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end