@interface NFRemoteAdminReaderState
+ (BOOL)supportsSecureCoding;
- (NFRemoteAdminCardIngestionRequest)requestInfo;
- (NFRemoteAdminReaderState)initWithCoder:(id)a3;
- (NFRemoteAdminReaderState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5;
- (NSDictionary)parameters;
- (id)stateUpdateOnSessionEndedCallback;
- (void)encodeWithCoder:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setStateUpdateOnSessionEndedCallback:(id)a3;
@end

@implementation NFRemoteAdminReaderState

- (NFRemoteAdminReaderState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminReaderState;
  return [(NFRemoteAdminRedirectState *)&v6 initWithDictionary:a3 sourceURL:a4 originator:a5 initialStep:0];
}

- (id)stateUpdateOnSessionEndedCallback
{
  id v2 = objc_retainBlock(self->_stateUpdateOnSessionEndedCallback);

  return v2;
}

- (void)setStateUpdateOnSessionEndedCallback:(id)a3
{
  self->_stateUpdateOnSessionEndedCallback = [a3 copy];

  _objc_release_x1();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminReaderState)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFRemoteAdminReaderState;
  return [(NFRemoteAdminRedirectState *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NFRemoteAdminReaderState;
  [(NFRemoteAdminRedirectState *)&v3 encodeWithCoder:a3];
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NFRemoteAdminCardIngestionRequest)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong(&self->_stateUpdateOnSessionEndedCallback, 0);
}

@end