@interface CSDExternalIDSDualSession
- (BOOL)receivedInvitationAccept;
- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteFromID:(id)a5 remoteProtocolVersion:(id)a6;
- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (NSString)remoteFromID;
- (id)initAsInitiatorWithSessionProvider:(id)a3;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteFromID:(id)a4 remoteProtocolVersion:(int)a5;
- (unint64_t)initialLinkType;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitationWithReason:(int)a3;
- (void)sendInvitationWithData:(id)a3;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)setReceivedInvitationAccept:(BOOL)a3;
- (void)setRemoteFromID:(id)a3;
@end

@implementation CSDExternalIDSDualSession

- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  v7 = +[NSAssertionHandler currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"CSDExternalIDSDualSession.m" lineNumber:29 description:@"Use another initializer instead"];

  return 0;
}

- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteFromID:(id)a5 remoteProtocolVersion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSDExternalIDSDualSession;
  v11 = [(CSDIDSDualSession *)&v15 initWithSessionProvider:a3 isInitiator:v7 remoteProtocolVersion:a6];
  if (v11)
  {
    v12 = (NSString *)[v10 copy];
    remoteFromID = v11->_remoteFromID;
    v11->_remoteFromID = v12;
  }
  return v11;
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteFromID:(id)a4 remoteProtocolVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSNumber numberWithInt:v5];
  v11 = [(CSDExternalIDSDualSession *)self initWithSessionProvider:v9 isInitiator:0 remoteFromID:v8 remoteProtocolVersion:v10];

  return v11;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3
{
  return [(CSDExternalIDSDualSession *)self initWithSessionProvider:a3 isInitiator:1 remoteFromID:0 remoteProtocolVersion:0];
}

- (unint64_t)initialLinkType
{
  v2 = [(CSDIDSDualSession *)self sessionProvider];
  id v3 = [v2 initialLinkType];

  return (unint64_t)v3;
}

- (void)sendInvitationWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"non-nil";
    if (!v4) {
      CFStringRef v6 = @"nil";
    }
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDIDSDualSession *)self _sendInvitationWithData:v4 declineOnError:0 alwaysSendData:0];
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"non-nil";
    if (!v4) {
      CFStringRef v6 = @"nil";
    }
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDIDSDualSession *)self _acceptInvitationWithData:v4 alwaysSendData:0];
}

- (void)cancelInvitationWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ reason: %d", (uint8_t *)&v6, 0x12u);
  }

  [(CSDIDSDualSession *)self _cancelInvitationWithData:0 reason:v3 alwaysSendData:0];
}

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CSDExternalIDSDualSession *)self receivedInvitationAccept])
  {
    v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring invitation accept since we have previously processed one.", buf, 2u);
    }
  }
  else
  {
    [(CSDExternalIDSDualSession *)self setReceivedInvitationAccept:1];
    [(CSDExternalIDSDualSession *)self setRemoteFromID:v9];
    v12.receiver = self;
    v12.super_class = (Class)CSDExternalIDSDualSession;
    [(CSDIDSDualSession *)&v12 sessionProvider:v8 receivedInvitationAcceptFromID:v9 withData:v10];
  }
}

- (NSString)remoteFromID
{
  return self->_remoteFromID;
}

- (void)setRemoteFromID:(id)a3
{
}

- (BOOL)receivedInvitationAccept
{
  return self->_receivedInvitationAccept;
}

- (void)setReceivedInvitationAccept:(BOOL)a3
{
  self->_receivedInvitationAccept = a3;
}

- (void).cxx_destruct
{
}

@end