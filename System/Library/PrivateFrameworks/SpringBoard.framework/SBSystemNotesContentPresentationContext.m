@interface SBSystemNotesContentPresentationContext
- (SBSSystemNotesPresentationConfiguration)requestedConfiguration;
- (SBSystemNotesContentPresentationContext)initWithLaunchBundleID:(id)a3 presentationMode:(int64_t)a4 source:(unint64_t)a5 positionConfiguration:(id)a6;
- (SBSystemNotesContentPresentationContext)initWithRequestedConfiguration:(id)a3 source:(unint64_t)a4 positionConfiguration:(id)a5;
- (SBSystemNotesPositionConfiguration)positionConfiguration;
- (unint64_t)source;
- (void)setPositionConfiguration:(id)a3;
- (void)setRequestedConfiguration:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation SBSystemNotesContentPresentationContext

- (SBSystemNotesContentPresentationContext)initWithLaunchBundleID:(id)a3 presentationMode:(int64_t)a4 source:(unint64_t)a5 positionConfiguration:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4FA6C60];
  id v11 = a6;
  id v12 = a3;
  v13 = (void *)[[v10 alloc] initWithSceneBundleIdentifier:v12 userActivity:0 preferredPresentationMode:a4];

  v14 = [(SBSystemNotesContentPresentationContext *)self initWithRequestedConfiguration:v13 source:a5 positionConfiguration:v11];
  return v14;
}

- (SBSystemNotesContentPresentationContext)initWithRequestedConfiguration:(id)a3 source:(unint64_t)a4 positionConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesContentPresentationContext;
  id v11 = [(SBSystemNotesContentPresentationContext *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestedConfiguration, a3);
    v12->_source = a4;
    objc_storeStrong((id *)&v12->_positionConfiguration, a5);
  }

  return v12;
}

- (SBSSystemNotesPresentationConfiguration)requestedConfiguration
{
  return self->_requestedConfiguration;
}

- (void)setRequestedConfiguration:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (SBSystemNotesPositionConfiguration)positionConfiguration
{
  return self->_positionConfiguration;
}

- (void)setPositionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionConfiguration, 0);
  objc_storeStrong((id *)&self->_requestedConfiguration, 0);
}

@end