@interface PXBlockActionPerformer
- (PXBlockActionConfiguration)configuration;
- (PXBlockActionManager)actionManager;
- (PXBlockActionPerformer)initWithActionType:(id)a3 configuration:(id)a4;
- (void)performUserInteractionTask;
- (void)setActionManager:(id)a3;
@end

@implementation PXBlockActionPerformer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setActionManager:(id)a3
{
}

- (PXBlockActionManager)actionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  return (PXBlockActionManager *)WeakRetained;
}

- (PXBlockActionConfiguration)configuration
{
  return self->_configuration;
}

- (void)performUserInteractionTask
{
  v3 = [(PXBlockActionPerformer *)self configuration];
  v4 = [v3 actionBlock];

  v5 = [(PXBlockActionPerformer *)self actionManager];
  id v8 = 0;
  uint64_t v6 = ((uint64_t (**)(void, void *, PXBlockActionPerformer *, id *))v4)[2](v4, v5, self, &v8);
  id v7 = v8;

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v6 error:v7];
}

- (PXBlockActionPerformer)initWithActionType:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXBlockActionPerformer;
  id v7 = [(PXActionPerformer *)&v11 initWithActionType:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    configuration = v7->_configuration;
    v7->_configuration = (PXBlockActionConfiguration *)v8;
  }
  return v7;
}

@end