@interface _SBSceneRenderingEnvironmentParticipantHostComponent
- (void)_setParticipant:(id)a3;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4;
- (void)setScene:(id)a3;
@end

@implementation _SBSceneRenderingEnvironmentParticipantHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6 = a4;
  v7 = [v6 settings];
  id v16 = [v7 displayConfiguration];

  v8 = [v6 previousSettings];

  id v9 = [v8 displayConfiguration];

  v10 = v16;
  if (v16 != v9)
  {
    v11 = [(id)SBApp sceneRenderingEnvironmentManager];
    if (!v11)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentParticipantSceneExtension.m", 63, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
    }
    v12 = [(FBSSceneComponent *)self hostScene];
    v13 = [v12 loggingIdentifier];
    v14 = [v11 registerParticipantForSceneWithIdentifier:v13 displayConfiguration:v16];
    [(_SBSceneRenderingEnvironmentParticipantHostComponent *)self _setParticipant:v14];

    v10 = v16;
  }
}

- (void)setScene:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_SBSceneRenderingEnvironmentParticipantHostComponent;
  id v5 = a3;
  [(FBSSceneComponent *)&v12 setScene:v5];
  id v6 = [(id)SBApp sceneRenderingEnvironmentManager];
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSceneRenderingEnvironmentParticipantSceneExtension.m", 55, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
  }
  v7 = [v5 loggingIdentifier];
  v8 = [v5 settings];

  id v9 = [v8 displayConfiguration];
  v10 = [v6 registerParticipantForSceneWithIdentifier:v7 displayConfiguration:v9];
  [(_SBSceneRenderingEnvironmentParticipantHostComponent *)self _setParticipant:v10];
}

- (void)_setParticipant:(id)a3
{
  id v5 = (SBSceneRenderingEnvironmentParticipant *)a3;
  participant = self->_participant;
  v10 = v5;
  if (participant != v5)
  {
    [(SBSceneRenderingEnvironmentParticipant *)participant invalidate];
    objc_storeStrong((id *)&self->_participant, a3);
    v7 = [(FBSSceneComponent *)self hostScene];
    v8 = [v7 renderingEnvironment];
    id v9 = [(SBSceneRenderingEnvironmentParticipant *)v10 renderingEnvironmentIdentifier];
    [v8 setSystemDisplayIdentifier:v9];
  }
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  [(SBSceneRenderingEnvironmentParticipant *)self->_participant invalidate];
  participant = self->_participant;
  self->_participant = 0;
}

- (void).cxx_destruct
{
}

@end