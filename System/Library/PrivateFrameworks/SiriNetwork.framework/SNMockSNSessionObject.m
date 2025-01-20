@interface SNMockSNSessionObject
- (BOOL)bufferingAllowedDuringActiveSession;
- (BOOL)isProvisional;
- (BOOL)isRestartable;
- (BOOL)isRetryable;
- (BOOL)siriCore_supportedByLocalSession;
- (BOOL)supportedByLocalSession;
- (BOOL)supportedByRemoteLimitedSession;
- (NSString)aceId;
- (NSString)refId;
- (id)serializedAceDataError:(id *)a3;
- (id)sessionRequestId;
- (void)setAceId:(id)a3;
- (void)setDispatchData:(id)a3;
- (void)setSerializedAceDataError:(id)a3;
@end

@implementation SNMockSNSessionObject

- (NSString)refId
{
  return 0;
}

- (void)setDispatchData:(id)a3
{
}

- (void)setSerializedAceDataError:(id)a3
{
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)isProvisional
{
  return 0;
}

- (BOOL)isRestartable
{
  return 1;
}

- (BOOL)isRetryable
{
  return 1;
}

- (id)serializedAceDataError:(id *)a3
{
  if (a3) {
    *a3 = self->serializedAceDataError;
  }
  data = self->_data;

  return data;
}

- (id)sessionRequestId
{
  return 0;
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (NSString)aceId
{
  return self->aceId;
}

- (void)setAceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->aceId, 0);
  objc_storeStrong((id *)&self->serializedAceDataError, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end