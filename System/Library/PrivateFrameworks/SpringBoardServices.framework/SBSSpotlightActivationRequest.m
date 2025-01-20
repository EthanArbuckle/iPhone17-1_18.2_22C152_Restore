@interface SBSSpotlightActivationRequest
- (void)requestSpotlightActivation;
@end

@implementation SBSSpotlightActivationRequest

- (void)requestSpotlightActivation
{
  v2 = (void *)MEMORY[0x1E4F50BB8];
  v3 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v4 = +[SBSSpotlightActivationRequestServer identifier];
  v5 = [v2 endpointForMachName:v3 service:v4 instance:0];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
  }
  else
  {
    v6 = 0;
  }
  [v6 configureConnection:&__block_literal_global_17];
  v7 = SBLogSpotlight();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_DEFAULT, "SBSSpotlightActivationRequest requests spotlight activation.", v9, 2u);
  }

  [v6 activate];
  v8 = [v6 remoteTarget];
  [v8 requestSpotlightActivation];

  [v6 invalidate];
}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = +[SBSSpotlightActivationRequestServer interface];
  [v4 setInterface:v2];

  v3 = +[SBSSpotlightActivationRequestServer serviceQuality];
  [v4 setServiceQuality:v3];

  [v4 setInvalidationHandler:&__block_literal_global_6_0];
}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2()
{
  v0 = SBLogSpotlight();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(v0);
  }
}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "Availability request connection invalidated remotely.", v1, 2u);
}

@end