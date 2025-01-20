@interface SBCaptureButtonBehaviorsResponse
+ (id)emptyResponse;
- (BOOL)isEqual:(id)a3;
- (SBCaptureButtonBehaviorsResponse)initWithBehavior:(id)a3 context:(id)a4;
- (SBCaptureButtonBehaviorsResponse)initWithDictionary:(id)a3;
- (SBCaptureButtonBehaviorsResponse)initWithPrewarmIntent:(unint64_t)a3 launchIntent:(unint64_t)a4 wakeIntent:(unint64_t)a5 coachIntent:(unint64_t)a6;
- (id)dictionaryRepresentation;
- (id)responseByMergingResponse:(id)a3;
- (unint64_t)coachIntent;
- (unint64_t)hash;
- (unint64_t)launchIntent;
- (unint64_t)prewarmIntent;
- (unint64_t)wakeIntent;
@end

@implementation SBCaptureButtonBehaviorsResponse

- (SBCaptureButtonBehaviorsResponse)initWithBehavior:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SBCaptureButtonBehaviorsResponse alloc];
  uint64_t v9 = [v7 prewarmIntentInContext:v6];
  uint64_t v10 = [v7 cameraLaunchIntentInContext:v6];
  uint64_t v11 = [v7 wakeIntentInContext:v6];
  uint64_t v12 = [v7 coachIntentInContext:v6];

  v13 = [(SBCaptureButtonBehaviorsResponse *)v8 initWithPrewarmIntent:v9 launchIntent:v10 wakeIntent:v11 coachIntent:v12];
  return v13;
}

+ (id)emptyResponse
{
  v2 = [[SBCaptureButtonBehaviorsResponse alloc] initWithPrewarmIntent:0 launchIntent:0 wakeIntent:0 coachIntent:0];
  return v2;
}

- (SBCaptureButtonBehaviorsResponse)initWithPrewarmIntent:(unint64_t)a3 launchIntent:(unint64_t)a4 wakeIntent:(unint64_t)a5 coachIntent:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureButtonBehaviorsResponse;
  result = [(SBCaptureButtonBehaviorsResponse *)&v11 init];
  if (result)
  {
    result->_prewarmIntent = a3;
    result->_launchIntent = a4;
    result->_wakeIntent = a5;
    result->_coachIntent = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t prewarmIntent = self->_prewarmIntent;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke;
  v28[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendInteger:prewarmIntent counterpart:v28];
  unint64_t launchIntent = self->_launchIntent;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_2;
  v26[3] = &unk_1E6AF9660;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendInteger:launchIntent counterpart:v26];
  unint64_t wakeIntent = self->_wakeIntent;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_3;
  v24[3] = &unk_1E6AF9660;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendInteger:wakeIntent counterpart:v24];
  unint64_t coachIntent = self->_coachIntent;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_4;
  v22 = &unk_1E6AF9660;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendInteger:coachIntent counterpart:&v19];
  LOBYTE(coachIntent) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return coachIntent;
}

uint64_t __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

uint64_t __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

uint64_t __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

uint64_t __44__SBCaptureButtonBehaviorsResponse_isEqual___block_invoke_4(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_prewarmIntent];
  id v5 = (id)[v3 appendInteger:self->_launchIntent];
  id v6 = (id)[v3 appendInteger:self->_wakeIntent];
  id v7 = (id)[v3 appendInteger:self->_coachIntent];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)responseByMergingResponse:(id)a3
{
  id v4 = a3;
  if ([v4 prewarmIntent]) {
    unint64_t prewarmIntent = [v4 prewarmIntent];
  }
  else {
    unint64_t prewarmIntent = self->_prewarmIntent;
  }
  if ([v4 launchIntent]) {
    unint64_t launchIntent = [v4 launchIntent];
  }
  else {
    unint64_t launchIntent = self->_launchIntent;
  }
  if ([v4 wakeIntent]) {
    unint64_t wakeIntent = [v4 wakeIntent];
  }
  else {
    unint64_t wakeIntent = self->_wakeIntent;
  }
  if ([v4 coachIntent]) {
    unint64_t coachIntent = [v4 coachIntent];
  }
  else {
    unint64_t coachIntent = self->_coachIntent;
  }
  uint64_t v9 = [[SBCaptureButtonBehaviorsResponse alloc] initWithPrewarmIntent:prewarmIntent launchIntent:launchIntent wakeIntent:wakeIntent coachIntent:coachIntent];

  return v9;
}

- (SBCaptureButtonBehaviorsResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"PrewarmIntent"];
  uint64_t v6 = SBCameraPrewarmIntentFromString(v5);
  id v7 = [v4 objectForKeyedSubscript:@"LaunchIntent"];
  uint64_t v8 = SBCameraLaunchIntentFromString(v7);
  uint64_t v9 = [v4 objectForKeyedSubscript:@"WakeIntent"];
  uint64_t v10 = SBCameraWakeIntentFromString(v9);
  id v11 = [v4 objectForKeyedSubscript:@"CoachIntent"];

  uint64_t v12 = [(SBCaptureButtonBehaviorsResponse *)self initWithPrewarmIntent:v6 launchIntent:v8 wakeIntent:v10 coachIntent:SBCameraCoachIntentFromString(v11)];
  return v12;
}

- (id)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"PrewarmIntent";
  v3 = SBCameraPrewarmIntentDescription(self->_prewarmIntent);
  v10[0] = v3;
  v9[1] = @"LaunchIntent";
  id v4 = SBCameraLaunchIntentDescription(self->_launchIntent);
  v10[1] = v4;
  v9[2] = @"WakeIntent";
  id v5 = SBCameraWakeIntentDescription(self->_wakeIntent);
  v10[2] = v5;
  v9[3] = @"CoachIntent";
  uint64_t v6 = SBCameraCoachIntentDescription(self->_coachIntent);
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (unint64_t)prewarmIntent
{
  return self->_prewarmIntent;
}

- (unint64_t)launchIntent
{
  return self->_launchIntent;
}

- (unint64_t)wakeIntent
{
  return self->_wakeIntent;
}

- (unint64_t)coachIntent
{
  return self->_coachIntent;
}

@end