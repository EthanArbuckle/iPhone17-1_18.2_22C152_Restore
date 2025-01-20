@interface CSDRelayConferenceConnection
- (BOOL)isAudioDisabled;
- (BOOL)isHost;
- (BOOL)isPreparedToStop;
- (BOOL)isTinCan;
- (BOOL)isUsingBaseband;
- (BOOL)receivedSuccessfulDidStart;
- (CSDAVConference)conference;
- (CSDIDSTransport)transport;
- (CSDRelayConferenceConnection)init;
- (CSDRelayConferenceConnection)initWithCall:(id)a3;
- (CSDRelayConferenceConnection)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (VCCapabilities)capabilities;
- (id)description;
- (id)didPrepareHandler;
- (id)didStartHandler;
- (id)didStopHandler;
- (int)deviceRole;
- (void)invokeDidPrepareIfNecessary:(id)a3;
- (void)invokeDidStartIfNecessary:(BOOL)a3 error:(id)a4;
- (void)invokeDidStopIfNecessary:(BOOL)a3 error:(id)a4;
- (void)setAudioDisabled:(BOOL)a3;
- (void)setConference:(id)a3;
- (void)setDidPrepareHandler:(id)a3;
- (void)setDidStartHandler:(id)a3;
- (void)setDidStopHandler:(id)a3;
- (void)setHost:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPreparedToStop:(BOOL)a3;
- (void)setReceivedSuccessfulDidStart:(BOOL)a3;
- (void)setTinCan:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)setUsingBaseband:(BOOL)a3;
@end

@implementation CSDRelayConferenceConnection

- (CSDRelayConferenceConnection)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDRelayConferenceConnection;
  v6 = [(CSDRelayConferenceConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (CSDRelayConferenceConnection)initWithCall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  v6 = [(CSDRelayConferenceConnection *)self initWithIdentifier:v5];

  if (v6)
  {
    -[CSDRelayConferenceConnection setHost:](v6, "setHost:", [v4 isHostedOnCurrentDevice]);
    -[CSDRelayConferenceConnection setUsingBaseband:](v6, "setUsingBaseband:", [v4 isUsingBaseband]);
  }

  return v6;
}

- (CSDRelayConferenceConnection)init
{
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is unavailable, call another initializer instead.", "-[CSDRelayConferenceConnection init]");
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"CSDRelayConferenceConnection.m", 37, @"%s is unavailable, call another initializer instead.", "-[CSDRelayConferenceConnection init]" object file lineNumber description];
  }
  return 0;
}

- (void)invokeDidPrepareIfNecessary:(id)a3
{
  id v6 = a3;
  id v4 = [(CSDRelayConferenceConnection *)self didPrepareHandler];

  if (v4)
  {
    id v5 = [(CSDRelayConferenceConnection *)self didPrepareHandler];
    [(CSDRelayConferenceConnection *)self setDidPrepareHandler:0];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)invokeDidStartIfNecessary:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(CSDRelayConferenceConnection *)self didStartHandler];

  if (v6)
  {
    [(CSDRelayConferenceConnection *)self setReceivedSuccessfulDidStart:v4];
    v7 = [(CSDRelayConferenceConnection *)self didStartHandler];
    [(CSDRelayConferenceConnection *)self setDidStartHandler:0];
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);
  }
}

- (void)invokeDidStopIfNecessary:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(CSDRelayConferenceConnection *)self didStopHandler];

  if (v6)
  {
    v7 = [(CSDRelayConferenceConnection *)self didStopHandler];
    [(CSDRelayConferenceConnection *)self setDidStopHandler:0];
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CSDRelayConferenceConnection *)self identifier];
  [v3 appendFormat:@" identifier=%@", v4];

  id v5 = [(CSDRelayConferenceConnection *)self transport];

  if (v5)
  {
    id v6 = [(CSDRelayConferenceConnection *)self transport];
    [v3 appendFormat:@" transport=%@", v6];
  }
  if ([(CSDRelayConferenceConnection *)self isHost]) {
    objc_msgSend(v3, "appendFormat:", @" isHost=%d", -[CSDRelayConferenceConnection isHost](self, "isHost"));
  }
  if ([(CSDRelayConferenceConnection *)self isUsingBaseband]) {
    objc_msgSend(v3, "appendFormat:", @" isUsingBaseband=%d", -[CSDRelayConferenceConnection isUsingBaseband](self, "isUsingBaseband"));
  }
  if ([(CSDRelayConferenceConnection *)self isAudioDisabled]) {
    objc_msgSend(v3, "appendFormat:", @" isAudioDisabled=%d", -[CSDRelayConferenceConnection isAudioDisabled](self, "isAudioDisabled"));
  }
  if ([(CSDRelayConferenceConnection *)self receivedSuccessfulDidStart]) {
    objc_msgSend(v3, "appendFormat:", @" receivedSuccessfulDidStart=%d", -[CSDRelayConferenceConnection receivedSuccessfulDidStart](self, "receivedSuccessfulDidStart"));
  }
  if ([(CSDRelayConferenceConnection *)self isPreparedToStop]) {
    objc_msgSend(v3, "appendFormat:", @" isPreparedToStop=%d", -[CSDRelayConferenceConnection isPreparedToStop](self, "isPreparedToStop"));
  }
  if ([(CSDRelayConferenceConnection *)self isTinCan]) {
    objc_msgSend(v3, "appendFormat:", @" isTinCan=%d", -[CSDRelayConferenceConnection isTinCan](self, "isTinCan"));
  }
  [v3 appendString:@">"];

  return v3;
}

- (int)deviceRole
{
  if (![(CSDRelayConferenceConnection *)self isHost]) {
    return 1;
  }
  if ([(CSDRelayConferenceConnection *)self isUsingBaseband]) {
    return 2;
  }
  return 4;
}

- (VCCapabilities)capabilities
{
  id v3 = objc_alloc_init((Class)VCCapabilities);
  [v3 setIsKeyExchangeEnabled:0];
  [v3 setIsAudioEnabled:1];
  [v3 setIsVideoEnabled:0];
  objc_msgSend(v3, "setIsDuplexAudioOnly:", objc_msgSend(v3, "isVideoEnabled") ^ 1);
  [v3 setIsRelayForced:0];
  [v3 setIsRelayEnabled:1];
  objc_msgSend(v3, "setIsAudioPausedToStart:", -[CSDRelayConferenceConnection isAudioDisabled](self, "isAudioDisabled"));
  objc_msgSend(v3, "setDeviceRole:", -[CSDRelayConferenceConnection deviceRole](self, "deviceRole"));
  objc_msgSend(v3, "setIsHalfDuplexAudio:", -[CSDRelayConferenceConnection isTinCan](self, "isTinCan"));

  return (VCCapabilities *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CSDIDSTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (BOOL)isHost
{
  return self->_host;
}

- (void)setHost:(BOOL)a3
{
  self->_host = a3;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (void)setUsingBaseband:(BOOL)a3
{
  self->_usingBaseband = a3;
}

- (BOOL)isAudioDisabled
{
  return self->_audioDisabled;
}

- (void)setAudioDisabled:(BOOL)a3
{
  self->_audioDisabled = a3;
}

- (BOOL)isTinCan
{
  return self->_tinCan;
}

- (void)setTinCan:(BOOL)a3
{
  self->_tinCan = a3;
}

- (BOOL)receivedSuccessfulDidStart
{
  return self->_receivedSuccessfulDidStart;
}

- (void)setReceivedSuccessfulDidStart:(BOOL)a3
{
  self->_receivedSuccessfulDidStart = a3;
}

- (BOOL)isPreparedToStop
{
  return self->_preparedToStop;
}

- (void)setPreparedToStop:(BOOL)a3
{
  self->_preparedToStop = a3;
}

- (id)didPrepareHandler
{
  return self->_didPrepareHandler;
}

- (void)setDidPrepareHandler:(id)a3
{
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
}

- (id)didStopHandler
{
  return self->_didStopHandler;
}

- (void)setDidStopHandler:(id)a3
{
}

- (CSDAVConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conference, 0);
  objc_storeStrong(&self->_didStopHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong(&self->_didPrepareHandler, 0);
  objc_storeStrong((id *)&self->_transport, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end