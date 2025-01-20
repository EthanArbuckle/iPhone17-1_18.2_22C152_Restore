@interface SBCaptureButtonBehaviorsResponseLog
- (BOOL)isEqual:(id)a3;
- (SBCaptureButtonBehaviorsResponse)response;
- (SBCaptureButtonBehaviorsResponseLog)initWithBehavior:(id)a3 response:(id)a4;
- (SBCaptureButtonBehaviorsResponseLog)initWithBehaviorIdentifier:(unint64_t)a3 response:(id)a4;
- (SBCaptureButtonBehaviorsResponseLog)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)behaviorIdentifier;
- (unint64_t)hash;
- (void)setBehaviorIdentifier:(unint64_t)a3;
- (void)setResponse:(id)a3;
@end

@implementation SBCaptureButtonBehaviorsResponseLog

- (SBCaptureButtonBehaviorsResponseLog)initWithBehavior:(id)a3 response:(id)a4
{
  id v6 = a4;
  v7 = -[SBCaptureButtonBehaviorsResponseLog initWithBehaviorIdentifier:response:](self, "initWithBehaviorIdentifier:response:", [a3 identifier], v6);

  return v7;
}

- (SBCaptureButtonBehaviorsResponseLog)initWithBehaviorIdentifier:(unint64_t)a3 response:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureButtonBehaviorsResponseLog;
  v8 = [(SBCaptureButtonBehaviorsResponseLog *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_behaviorIdentifier = a3;
    objc_storeStrong((id *)&v8->_response, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t behaviorIdentifier = self->_behaviorIdentifier;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__SBCaptureButtonBehaviorsResponseLog_isEqual___block_invoke;
  v18[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendInteger:behaviorIdentifier counterpart:v18];
  response = self->_response;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __47__SBCaptureButtonBehaviorsResponseLog_isEqual___block_invoke_2;
  v16 = &unk_1E6AF9E90;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:response counterpart:&v13];
  LOBYTE(response) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)response;
}

uint64_t __47__SBCaptureButtonBehaviorsResponseLog_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

id __47__SBCaptureButtonBehaviorsResponseLog_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_behaviorIdentifier];
  id v5 = (id)[v3 appendObject:self->_response];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (SBCaptureButtonBehaviorsResponseLog)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [SBCaptureButtonBehaviorsResponseLog alloc];
  unint64_t v6 = [v4 objectForKeyedSubscript:@"Behavior"];
  uint64_t v7 = SBCaptureButtonBehaviorIdentifierFromString(v6);
  id v8 = [SBCaptureButtonBehaviorsResponse alloc];
  v9 = [v4 objectForKeyedSubscript:@"Response"];

  id v10 = [(SBCaptureButtonBehaviorsResponse *)v8 initWithDictionary:v9];
  id v11 = [(SBCaptureButtonBehaviorsResponseLog *)v5 initWithBehaviorIdentifier:v7 response:v10];

  return v11;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Behavior";
  v3 = SBCaptureButtonBehaviorIdentifierDescription(self->_behaviorIdentifier);
  v7[1] = @"Response";
  v8[0] = v3;
  id v4 = [(SBCaptureButtonBehaviorsResponse *)self->_response dictionaryRepresentation];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (unint64_t)behaviorIdentifier
{
  return self->_behaviorIdentifier;
}

- (void)setBehaviorIdentifier:(unint64_t)a3
{
  self->_unint64_t behaviorIdentifier = a3;
}

- (SBCaptureButtonBehaviorsResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end