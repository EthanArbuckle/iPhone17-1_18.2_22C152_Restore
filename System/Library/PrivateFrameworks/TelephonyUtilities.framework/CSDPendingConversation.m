@interface CSDPendingConversation
- (BOOL)isAudioEnabled;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (CSDLetMeInRequestorKeyAgreement)letMeInKeyAgreement;
- (CSDPendingConversation)initWithConversationLink:(id)a3 localMember:(id)a4 queue:(id)a5;
- (NSDate)dateCreated;
- (NSUUID)conversationGroupUUID;
- (NSUUID)temporaryGroupUUID;
- (OS_dispatch_queue)queue;
- (TUConversation)tuConversation;
- (TUConversationLink)link;
- (TUConversationMember)localMember;
- (TUHandle)approverHandle;
- (id)description;
- (id)groupUUID;
- (int64_t)letMeInRequestState;
- (int64_t)state;
- (void)setApproverHandle:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setConversationGroupUUID:(id)a3;
- (void)setLetMeInKeyAgreement:(id)a3;
- (void)setLetMeInRequestState:(int64_t)a3;
- (void)setLink:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation CSDPendingConversation

- (CSDPendingConversation)initWithConversationLink:(id)a3 localMember:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSDPendingConversation;
  v12 = [(CSDPendingConversation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    uint64_t v14 = +[NSUUID UUID];
    temporaryGroupUUID = v13->_temporaryGroupUUID;
    v13->_temporaryGroupUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_link, a3);
    objc_storeStrong((id *)&v13->_localMember, a4);
    v13->_letMeInRequestState = 1;
    *(_WORD *)&v13->_videoEnabled = 257;
    v13->_video = 1;
    uint64_t v16 = +[NSDate date];
    dateCreated = v13->_dateCreated;
    v13->_dateCreated = (NSDate *)v16;
  }
  return v13;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" letMeInRequestState=%ld", -[CSDPendingConversation letMeInRequestState](self, "letMeInRequestState"));
  v4 = [(CSDPendingConversation *)self temporaryGroupUUID];
  [v3 appendFormat:@" temporaryGroupUUID=%@", v4];

  v5 = [(CSDPendingConversation *)self conversationGroupUUID];
  [v3 appendFormat:@" conversationGroupUUID=%@", v5];

  v6 = [(CSDPendingConversation *)self approverHandle];
  [v3 appendFormat:@" approverHandle=%@", v6];

  v7 = [(CSDPendingConversation *)self link];
  [v3 appendFormat:@" link=%@", v7];

  v8 = [(CSDPendingConversation *)self localMember];
  [v3 appendFormat:@" localMember=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" isAudioEnabled=%d", -[CSDPendingConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isVideoEnabled=%d", -[CSDPendingConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isVideo=%d", -[CSDPendingConversation isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", @" isUplinkMuted=%d", -[CSDPendingConversation isUplinkMuted](self, "isUplinkMuted"));
  [v3 appendString:@">"];
  id v9 = [v3 copy];

  return v9;
}

- (int64_t)state
{
  return 1;
}

- (id)groupUUID
{
  v3 = [(CSDPendingConversation *)self conversationGroupUUID];
  if (v3) {
    [(CSDPendingConversation *)self conversationGroupUUID];
  }
  else {
  v4 = [(CSDPendingConversation *)self temporaryGroupUUID];
  }

  return v4;
}

- (TUConversation)tuConversation
{
  v3 = [(CSDPendingConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc((Class)TUMutableConversation);
  v5 = [(CSDPendingConversation *)self UUID];
  v6 = [(CSDPendingConversation *)self groupUUID];
  v7 = +[TUConversationProvider faceTimeProvider];
  id v8 = [v4 initWithUUID:v5 groupUUID:v6 provider:v7];

  objc_msgSend(v8, "setLetMeInRequestState:", -[CSDPendingConversation letMeInRequestState](self, "letMeInRequestState"));
  id v9 = [(CSDPendingConversation *)self link];
  [v8 setLink:v9];

  objc_msgSend(v8, "setState:", -[CSDPendingConversation state](self, "state"));
  id v10 = [(CSDPendingConversation *)self localMember];
  [v8 setLocalMember:v10];

  id v11 = [(CSDPendingConversation *)self localMember];
  v12 = [v11 handle];
  [v8 setInitiator:v12];

  [v8 setAudioEnabled:1];
  objc_msgSend(v8, "setVideoEnabled:", -[CSDPendingConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v8, "setVideo:", -[CSDPendingConversation isVideo](self, "isVideo"));
  [v8 setHasJoined:0];
  v13 = +[NSSet set];
  [v8 setRemoteMembers:v13];

  uint64_t v14 = +[NSSet set];
  [v8 setPendingMembers:v14];

  v15 = +[NSSet set];
  [v8 setKickedMembers:v15];

  uint64_t v16 = +[NSSet set];
  [v8 setOtherInvitedHandles:v16];

  [v8 setMessagesGroupUUID:0];
  [v8 setAvcSessionToken:-1];
  [v8 setAvcSessionIdentifier:0];
  [v8 setLocallyCreated:1];
  [v8 setMessagesGroupName:0];
  [v8 setMaxVideoDecodesAllowed:9];
  [v8 setReportingHierarchyToken:0];
  [v8 setReportingHierarchySubToken:0];
  v17 = +[NSSet set];
  [v8 setActiveRemoteParticipants:v17];

  id v18 = objc_alloc((Class)TUConversationReport);
  objc_super v19 = +[NSUUID UUID];
  v20 = +[NSUUID UUID];
  v21 = +[NSDate date];
  id v22 = [v18 initWithConversationID:v19 padding:v20 timebase:v21];
  [v8 setReport:v22];

  [v8 setPendingConversation:1];
  id v23 = [v8 copy];

  return (TUConversation *)v23;
}

- (NSUUID)temporaryGroupUUID
{
  return self->_temporaryGroupUUID;
}

- (TUConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (void)setLetMeInRequestState:(int64_t)a3
{
  self->_letMeInRequestState = a3;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)conversationGroupUUID
{
  return self->_conversationGroupUUID;
}

- (void)setConversationGroupUUID:(id)a3
{
}

- (CSDLetMeInRequestorKeyAgreement)letMeInKeyAgreement
{
  return self->_letMeInKeyAgreement;
}

- (void)setLetMeInKeyAgreement:(id)a3
{
}

- (TUHandle)approverHandle
{
  return self->_approverHandle;
}

- (void)setApproverHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approverHandle, 0);
  objc_storeStrong((id *)&self->_letMeInKeyAgreement, 0);
  objc_storeStrong((id *)&self->_conversationGroupUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_link, 0);

  objc_storeStrong((id *)&self->_temporaryGroupUUID, 0);
}

@end