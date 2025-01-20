@interface SBSceneRenderingEnvironmentParticipant
- (BSInvalidatable)assertion;
- (NSString)renderingEnvironmentIdentifier;
- (SBSceneRenderingEnvironmentParticipant)initWithRenderingEnvironmentIdentifier:(id)a3 assertion:(id)a4;
- (void)invalidate;
@end

@implementation SBSceneRenderingEnvironmentParticipant

- (SBSceneRenderingEnvironmentParticipant)initWithRenderingEnvironmentIdentifier:(id)a3 assertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneRenderingEnvironmentParticipant;
  v8 = [(SBSceneRenderingEnvironmentParticipant *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assertion, a4);
    uint64_t v10 = [v6 copy];
    renderingEnvironmentIdentifier = v9->_renderingEnvironmentIdentifier;
    v9->_renderingEnvironmentIdentifier = (NSString *)v10;
  }
  return v9;
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;
}

- (NSString)renderingEnvironmentIdentifier
{
  return self->_renderingEnvironmentIdentifier;
}

- (BSInvalidatable)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_renderingEnvironmentIdentifier, 0);
}

@end