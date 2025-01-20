@interface SNSpeechPacket
- (BOOL)bufferingAllowedDuringActiveSession;
- (BOOL)isProvisional;
- (BOOL)isRestartable;
- (BOOL)isRetryable;
- (BOOL)supportedByLocalSession;
- (BOOL)supportedByRemoteLimitedSession;
- (NSArray)packets;
- (NSString)aceId;
- (NSString)description;
- (NSString)refId;
- (SNSpeechPacket)init;
- (SNSpeechPacketInternal)underlyingSpeechPacket;
- (id)serializedAceDataError:(id *)a3;
- (id)sessionRequestId;
- (int64_t)packetNumber;
- (void)logDiagnostics;
- (void)setAceId:(id)a3;
- (void)setPacketNumber:(int64_t)a3;
- (void)setPackets:(id)a3;
- (void)setRefId:(id)a3;
- (void)setSessionRequestId:(id)a3;
- (void)setUnderlyingSpeechPacket:(id)a3;
- (void)siriNetwork_invokeThunk;
@end

@implementation SNSpeechPacket

- (SNSpeechPacket)init
{
  v6.receiver = self;
  v6.super_class = (Class)SNSpeechPacket;
  v2 = [(SNSpeechPacket *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SNSpeechPacketInternal);
    underlyingSpeechPacket = v2->_underlyingSpeechPacket;
    v2->_underlyingSpeechPacket = v3;
  }
  return v2;
}

- (NSString)aceId
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket internalAceId];
}

- (void)setAceId:(id)a3
{
}

- (NSString)refId
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket internalRefId];
}

- (void)setRefId:(id)a3
{
}

- (NSArray)packets
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket packets];
}

- (void)setPackets:(id)a3
{
}

- (int64_t)packetNumber
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket packetNumber];
}

- (void)setPacketNumber:(int64_t)a3
{
}

- (id)serializedAceDataError:(id *)a3
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket serializedAceDataAndReturnError:a3];
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket bufferingAllowedDuringActiveSession];
}

- (BOOL)isProvisional
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket isProvisional];
}

- (BOOL)isRestartable
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket isRestartable];
}

- (BOOL)isRetryable
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket isRetryable];
}

- (void)logDiagnostics
{
}

- (id)sessionRequestId
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket sessionRequestId];
}

- (void)setSessionRequestId:(id)a3
{
}

- (BOOL)supportedByLocalSession
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket supportedByLocalSession];
}

- (BOOL)supportedByRemoteLimitedSession
{
  return [(SNSpeechPacketInternal *)self->_underlyingSpeechPacket supportedByRemoteLimitedSession];
}

- (void)siriNetwork_invokeThunk
{
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SNSpeechPacket;
  v4 = [(SNSpeechPacket *)&v9 description];
  int64_t v5 = [(SNSpeechPacket *)self packetNumber];
  objc_super v6 = [(SNSpeechPacket *)self packets];
  v7 = [v3 stringWithFormat:@"%@ packet number: %ld count: %ld", v4, v5, objc_msgSend(v6, "count")];

  return (NSString *)v7;
}

- (SNSpeechPacketInternal)underlyingSpeechPacket
{
  return self->_underlyingSpeechPacket;
}

- (void)setUnderlyingSpeechPacket:(id)a3
{
}

- (void).cxx_destruct
{
}

@end