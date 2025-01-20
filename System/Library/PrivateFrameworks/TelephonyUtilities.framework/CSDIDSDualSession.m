@interface CSDIDSDualSession
- (BOOL)hasConnected;
- (BOOL)hasStartedConnecting;
- (BOOL)isInitiator;
- (CSDIDSDualSession)init;
- (CSDIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (CSDIDSDualSessionDelegate)delegate;
- (CSDIDSDualSessionProvider)sessionProvider;
- (CSDIDSTransport)transport;
- (NSNumber)remoteProtocolVersionNumber;
- (double)invitationTimeout;
- (id)initAsInitiatorWithSessionProvider:(id)a3;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteProtocolVersion:(int)a4;
- (id)propertiesDescription;
- (int)endedReason;
- (int)remoteProtocolVersion;
- (int)state;
- (int64_t)underlyingErrorCode;
- (void)_acceptInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4;
- (void)_cancelInvitationWithData:(id)a3 reason:(int)a4 alwaysSendData:(BOOL)a5;
- (void)_declineInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4;
- (void)_sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4 alwaysSendData:(BOOL)a5;
- (void)acceptInvitation;
- (void)cancelInvitation;
- (void)declineInvitation;
- (void)end;
- (void)reconnectSession;
- (void)sendData:(id)a3;
- (void)sendInvitation;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionProviderStarted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndedReason:(int)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasStartedConnecting:(BOOL)a3;
- (void)setInvitationTimeout:(double)a3;
- (void)setReceiverProtocolVersion:(int)a3;
- (void)setRemoteProtocolVersionNumber:(id)a3;
- (void)setState:(int)a3;
@end

@implementation CSDIDSDualSession

- (CSDIDSDualSession)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDIDSDualSession.m", 31, @"%s is not available. Use a designated initializer instead.", "-[CSDIDSDualSession init]");

  return 0;
}

- (CSDIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSDIDSDualSession;
  v11 = [(CSDIDSSession *)&v15 initWithSessionProvider:v9];
  v12 = v11;
  if (v11)
  {
    v11->_state = 1;
    p_sessionProvider = (id *)&v11->_sessionProvider;
    objc_storeStrong((id *)&v11->_sessionProvider, a3);
    [*p_sessionProvider setDelegate:v12];
    [*p_sessionProvider setAudioEnabled:0];
    v12->_initiator = a4;
    objc_storeStrong((id *)&v12->_remoteProtocolVersionNumber, a5);
  }

  return v12;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3
{
  return [(CSDIDSDualSession *)self initWithSessionProvider:a3 isInitiator:1 remoteProtocolVersion:0];
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteProtocolVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = +[NSNumber numberWithInt:v4];
  v8 = [(CSDIDSDualSession *)self initWithSessionProvider:v6 isInitiator:0 remoteProtocolVersion:v7];

  return v8;
}

- (id)propertiesDescription
{
  v9.receiver = self;
  v9.super_class = (Class)CSDIDSDualSession;
  v3 = [(CSDIDSSession *)&v9 propertiesDescription];
  unsigned int v4 = [(CSDIDSDualSession *)self isInitiator];
  uint64_t v5 = [(CSDIDSDualSession *)self state];
  id v6 = [(CSDIDSDualSession *)self remoteProtocolVersionNumber];
  v7 = +[NSString stringWithFormat:@"%@ isInitiator=%d state=%d remoteProtocolVersion=%@>", v3, v4, v5, v6];

  return v7;
}

- (int64_t)underlyingErrorCode
{
  v2 = [(CSDIDSDualSession *)self sessionProvider];
  int64_t v3 = [v2 endedReason];

  return v3;
}

- (int)remoteProtocolVersion
{
  v2 = [(CSDIDSDualSession *)self remoteProtocolVersionNumber];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setState:(int)a3
{
  if (self->_state < a3)
  {
    self->_state = a3;
    if (a3 == 3)
    {
      [(CSDIDSDualSession *)self setHasStartedConnecting:1];
      [(CSDIDSDualSession *)self setHasConnected:1];
    }
    else if (a3 == 2)
    {
      [(CSDIDSDualSession *)self setHasStartedConnecting:1];
    }
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"CSDIDSDualSessionStateChangedNotification" object:self];
  }
}

- (void)setReceiverProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CSDIDSDualSession *)self isInitiator]
    && ([(CSDIDSDualSession *)self remoteProtocolVersionNumber],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v9 = +[NSNumber numberWithInt:v3];
    -[CSDIDSDualSession setRemoteProtocolVersionNumber:](self, "setRemoteProtocolVersionNumber:");
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = ![(CSDIDSDualSession *)self isInitiator];
      v8 = [(CSDIDSDualSession *)self remoteProtocolVersionNumber];
      *(_DWORD *)buf = 138412802;
      v11 = self;
      __int16 v12 = 1024;
      unsigned int v13 = v7;
      __int16 v14 = 1024;
      BOOL v15 = v8 != 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] called for session %@ that was not the initiator (%d) or that already had a version set (%d)", buf, 0x18u);
    }
  }
}

- (CSDIDSTransport)transport
{
  uint64_t v3 = [(CSDIDSDualSession *)self sessionProvider];
  unsigned int v4 = [v3 shouldUseSocketForTransport];

  uint64_t v5 = [CSDIDSTransport alloc];
  id v6 = [(CSDIDSDualSession *)self sessionProvider];
  unsigned int v7 = v6;
  if (v4)
  {
    v8 = -[CSDIDSTransport initWithSocket:](v5, "initWithSocket:", [v6 socket]);
  }
  else
  {
    id v9 = [v6 destination];
    v8 = [(CSDIDSTransport *)v5 initWithDestination:v9];
  }
  id v10 = [(CSDIDSDualSession *)self sessionProvider];
  -[CSDIDSTransport setInitialLinkType:](v8, "setInitialLinkType:", [v10 initialLinkType]);

  return v8;
}

- (double)invitationTimeout
{
  v2 = [(CSDIDSDualSession *)self sessionProvider];
  double v3 = (double)(uint64_t)[v2 invitationTimeout];

  return v3;
}

- (void)setInvitationTimeout:(double)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v4 = [(CSDIDSDualSession *)self sessionProvider];
  [v4 setInvitationTimeout:v3];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sendData self: %@", (uint8_t *)&v9, 0xCu);
  }

  unsigned int v6 = [(CSDIDSDualSession *)self state];
  if (v6 - 1 < 3)
  {
    unsigned int v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session %@ is connected. Sending data", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(CSDIDSDualSession *)self sessionProvider];
    [v8 sendData:v4];
LABEL_10:

    goto LABEL_11;
  }
  if (v6 - 4 < 2)
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ is ending/ended. Dropping data on the floor", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)sendInvitation
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sendInvitation self: %@", (uint8_t *)&v4, 0xCu);
  }

  [(CSDIDSDualSession *)self _sendInvitationWithData:0 declineOnError:0 alwaysSendData:0];
}

- (void)_sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4 alwaysSendData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = [(CSDIDSDualSession *)self state];
  if (v9 - 2 >= 4)
  {
    if (v9 == 1)
    {
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        __int16 v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Session %@ is waiting. Sending invitation", (uint8_t *)&v13, 0xCu);
      }

      v11 = [(CSDIDSDualSession *)self sessionProvider];
      [v11 sendInvitationWithData:v8 declineOnError:v6];
    }
  }
  else if (v8 && v5)
  {
    [(CSDIDSDualSession *)self sendData:v8];
  }
  else
  {
    __int16 v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session %@ is not waiting. Not sending invitation", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)acceptInvitation
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "acceptInvitation self: %@", (uint8_t *)&v4, 0xCu);
  }

  [(CSDIDSDualSession *)self _acceptInvitationWithData:0 alwaysSendData:0];
}

- (void)_acceptInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(CSDIDSDualSession *)self state];
  if (v7 - 2 >= 4)
  {
    if (v7 == 1)
    {
      id v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        __int16 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ is waiting. Accepting invitation", (uint8_t *)&v11, 0xCu);
      }

      [(CSDIDSDualSession *)self setState:2];
      unsigned int v9 = [(CSDIDSDualSession *)self sessionProvider];
      [v9 acceptInvitationWithData:v6];
    }
  }
  else if (v6 && v4)
  {
    [(CSDIDSDualSession *)self sendData:v6];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int16 v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Session %@ is not waiting. Not accepting invitation", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)cancelInvitation
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cancelInvitation self: %@", (uint8_t *)&v4, 0xCu);
  }

  [(CSDIDSDualSession *)self _cancelInvitationWithData:0 reason:0 alwaysSendData:0];
}

- (void)_cancelInvitationWithData:(id)a3 reason:(int)a4 alwaysSendData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [(CSDIDSDualSession *)self state];
  if (v9 - 2 >= 4)
  {
    if (v9 != 1) {
      goto LABEL_26;
    }
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Session %@ is waiting. Canceling invitation", (uint8_t *)&v18, 0xCu);
    }

    [(CSDIDSDualSession *)self setState:4];
    if (v8)
    {
      if (a4)
      {
        int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to cancel invitation with non-nil data and a concrete cancel reason, but that combination is unsupported", (uint8_t *)&v18, 2u);
        }
      }
      __int16 v12 = [(CSDIDSDualSession *)self sessionProvider];
      int v13 = v12;
      id v14 = v8;
LABEL_14:
      [v12 cancelInvitationWithData:v14];
LABEL_25:

      goto LABEL_26;
    }
    if (a4 == 2)
    {
      v16 = [(CSDIDSDualSession *)self sessionProvider];
      int v13 = v16;
      uint64_t v17 = 30;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4) {
          goto LABEL_26;
        }
        __int16 v12 = [(CSDIDSDualSession *)self sessionProvider];
        int v13 = v12;
        id v14 = 0;
        goto LABEL_14;
      }
      v16 = [(CSDIDSDualSession *)self sessionProvider];
      int v13 = v16;
      uint64_t v17 = 29;
    }
    [v16 cancelInvitationWithRemoteEndedReasonOverride:v17];
    goto LABEL_25;
  }
  if (v8 && v5)
  {
    [(CSDIDSDualSession *)self sendData:v8];
  }
  else
  {
    BOOL v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session %@ is not waiting. Not canceling invitation", (uint8_t *)&v18, 0xCu);
    }
  }
LABEL_26:
}

- (void)declineInvitation
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "declineInvitation self: %@", (uint8_t *)&v4, 0xCu);
  }

  [(CSDIDSDualSession *)self _declineInvitationWithData:0 alwaysSendData:0];
}

- (void)_declineInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(CSDIDSDualSession *)self state];
  if (v7 - 2 >= 4)
  {
    if (v7 == 1)
    {
      id v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        __int16 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ is waiting. Declining invitation", (uint8_t *)&v11, 0xCu);
      }

      [(CSDIDSDualSession *)self setState:4];
      unsigned int v9 = [(CSDIDSDualSession *)self sessionProvider];
      [v9 declineInvitationWithData:v6];
    }
  }
  else if (v6 && v4)
  {
    [(CSDIDSDualSession *)self sendData:v6];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int16 v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Session %@ is not waiting. Not declining invitation", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)reconnectSession
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reconnectSession self: %@", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = [(CSDIDSDualSession *)self sessionProvider];
  [v4 reconnectSession];
}

- (void)end
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "end self: %@", (uint8_t *)&v5, 0xCu);
  }

  [(CSDIDSDualSession *)self setState:4];
  BOOL v4 = [(CSDIDSDualSession *)self sessionProvider];
  [v4 end];
}

- (void)sessionProviderStarted:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 shouldUseSocketForTransport];
    unsigned int v7 = [v4 socket];
    id v8 = [v4 destination];
    int v10 = 138413058;
    int v11 = self;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session %@ started (shouldUseSocketForTransport: %d socket: %d, destination: %@)", (uint8_t *)&v10, 0x22u);
  }
  [(CSDIDSDualSession *)self setState:3];
  unsigned int v9 = [(CSDIDSDualSession *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 sessionStarted:self];
  }
}

- (void)sessionProvider:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received invitation SENT for session %@ with tokens %@ shouldBreakBeforeMake %d", (uint8_t *)&v11, 0x1Cu);
  }

  unsigned int v9 = [(CSDIDSDualSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v10 = [v7 allObjects];
    [v9 session:self invitationSentToPushTokens:v10 shouldBreakBeforeMake:v5];
  }
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v14 = 138412802;
    *(void *)&v14[4] = self;
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = a4;
    *(_WORD *)&v14[18] = 2112;
    *(void *)&v14[20] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ ended with reason %d: %@", v14, 0x1Cu);
  }

  [(CSDIDSDualSession *)self setState:5];
  switch(a4)
  {
    case 0u:
    case 0xBu:
      unsigned int v9 = sub_100008DCC();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)id v14 = 138412546;
      *(void *)&v14[4] = self;
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = a4;
      goto LABEL_15;
    case 1u:
    case 6u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xEu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
      unsigned int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1003A95E0();
      }
      uint64_t v10 = 6;
      goto LABEL_7;
    case 2u:
    case 7u:
    case 0xCu:
      unsigned int v9 = sub_100008DCC();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)id v14 = 138412546;
      *(void *)&v14[4] = self;
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = a4;
      goto LABEL_11;
    case 3u:
    case 4u:
      unsigned int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v14 = 138412546;
        *(void *)&v14[4] = self;
        *(_WORD *)&v14[12] = 1024;
        *(_DWORD *)&v14[14] = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ appears to have ended with an unanswered reason: %d", v14, 0x12u);
      }
      uint64_t v10 = 4;
      goto LABEL_7;
    case 5u:
      unsigned int v12 = [(CSDIDSDualSession *)self isInitiator];
      unsigned int v9 = sub_100008DCC();
      BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v13)
        {
          *(_DWORD *)id v14 = 138412546;
          *(void *)&v14[4] = self;
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = 5;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ appears to have ended with a local hangup reason: %d", v14, 0x12u);
        }
LABEL_16:
        uint64_t v10 = 0;
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)id v14 = 138412546;
          *(void *)&v14[4] = self;
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = 5;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ appears to have ended with a remote hangup reason: %d", v14, 0x12u);
        }
LABEL_12:
        uint64_t v10 = 1;
      }
LABEL_7:

LABEL_8:
      -[CSDIDSDualSession setEndedReason:](self, "setEndedReason:", v10, *(_OWORD *)v14, *(void *)&v14[16]);
      int v11 = [(CSDIDSDualSession *)self delegate];
      objc_msgSend(v11, "session:endedWithReason:", self, -[CSDIDSDualSession endedReason](self, "endedReason"));

      return;
    case 0xDu:
    case 0xFu:
      unsigned int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1003A9648();
      }
      uint64_t v10 = 5;
      goto LABEL_7;
    case 0x1Du:
      unsigned int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v14 = 138412546;
        *(void *)&v14[4] = self;
        *(_WORD *)&v14[12] = 1024;
        *(_DWORD *)&v14[14] = 29;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ appears to have ended with an accepted elsewhere reason: %d", v14, 0x12u);
      }
      uint64_t v10 = 2;
      goto LABEL_7;
    case 0x1Eu:
      unsigned int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v14 = 138412546;
        *(void *)&v14[4] = self;
        *(_WORD *)&v14[12] = 1024;
        *(_DWORD *)&v14[14] = 30;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ appears to have ended with a declined elsewhere reason: %d", v14, 0x12u);
      }
      uint64_t v10 = 3;
      goto LABEL_7;
    default:
      uint64_t v10 = 1;
      goto LABEL_8;
  }
}

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    unsigned int v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received invitation ACCEPT with data for session %@ from %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(CSDIDSDualSession *)self delegate];
  [v10 session:self receivedInvitationAcceptWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    unsigned int v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received invitation CANCEL with data for session %@ from %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(CSDIDSDualSession *)self delegate];
  [v10 session:self receivedInvitationCancelWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    unsigned int v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received invitation DECLINE with data for session %@ from %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(CSDIDSDualSession *)self delegate];
  [v10 session:self receivedInvitationDeclineWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    unsigned int v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received session MESSAGE for session %@ from %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(CSDIDSDualSession *)self delegate];
  [v10 session:self receivedData:v8];
}

- (CSDIDSDualSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDIDSDualSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)endedReason
{
  return self->_endedReason;
}

- (void)setEndedReason:(int)a3
{
  self->_endedReason = a3;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (int)state
{
  return self->_state;
}

- (BOOL)hasStartedConnecting
{
  return self->_hasStartedConnecting;
}

- (void)setHasStartedConnecting:(BOOL)a3
{
  self->_hasStartedConnecting = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (NSNumber)remoteProtocolVersionNumber
{
  return self->_remoteProtocolVersionNumber;
}

- (void)setRemoteProtocolVersionNumber:(id)a3
{
}

- (CSDIDSDualSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_remoteProtocolVersionNumber, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end