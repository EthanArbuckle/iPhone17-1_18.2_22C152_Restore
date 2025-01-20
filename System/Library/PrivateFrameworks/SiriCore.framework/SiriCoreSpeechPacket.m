@interface SiriCoreSpeechPacket
- (BOOL)siriCore_bufferingAllowedDuringActiveSession;
- (BOOL)siriCore_isProvisional;
- (BOOL)siriCore_isRestartable;
- (BOOL)siriCore_isRetryable;
- (BOOL)siriCore_supportedByLocalSession;
- (BOOL)siriCore_supportedByRemoteLimitedSession;
- (NSArray)packets;
- (NSString)aceId;
- (NSString)description;
- (NSString)refId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (id)siriCore_requestId;
- (id)siriCore_serializedAceDataError:(id *)a3;
- (int64_t)packetNumber;
- (void)setAceId:(id)a3;
- (void)setPacketNumber:(int64_t)a3;
- (void)setPackets:(id)a3;
- (void)setRefId:(id)a3;
@end

@implementation SiriCoreSpeechPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_refId, 0);

  objc_storeStrong((id *)&self->_aceId, 0);
}

- (void)setPacketNumber:(int64_t)a3
{
  self->_packetNumber = a3;
}

- (int64_t)packetNumber
{
  return self->_packetNumber;
}

- (void)setPackets:(id)a3
{
}

- (NSArray)packets
{
  return self->_packets;
}

- (void)setRefId:(id)a3
{
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setAceId:(id)a3
{
}

- (NSString)aceId
{
  return self->_aceId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(SiriCoreSpeechPacket *)self packets];
  [v4 setPackets:v5];

  objc_msgSend(v4, "setPacketNumber:", -[SiriCoreSpeechPacket packetNumber](self, "packetNumber"));
  v6 = [(SiriCoreSpeechPacket *)self refId];
  [v4 setRefId:v6];

  return v4;
}

- (BOOL)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (id)groupIdentifier
{
  return (id)*MEMORY[0x263F65AD8];
}

- (id)encodedClassName
{
  return (id)*MEMORY[0x263F65AE0];
}

- (id)siriCore_requestId
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSpeechPacket;
  v4 = [(SiriCoreSpeechPacket *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ packet number: %ld count: %ld", v4, self->_packetNumber, -[NSArray count](self->_packets, "count")];

  return (NSString *)v5;
}

- (id)siriCore_serializedAceDataError:(id *)a3
{
  return +[SiriCoreAceSerialization dataForSpeechPacket:self error:a3];
}

- (BOOL)siriCore_isProvisional
{
  return 0;
}

- (BOOL)siriCore_isRestartable
{
  return 0;
}

- (BOOL)siriCore_isRetryable
{
  return 1;
}

- (BOOL)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

@end