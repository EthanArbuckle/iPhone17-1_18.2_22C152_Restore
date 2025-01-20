@interface PXCMMActionManager
- (Class)actionPerformerClassForActionType:(id)a3;
- (NSMutableDictionary)performerClassByType;
- (PXCMMActionManager)init;
- (PXCMMActionPerformerDelegate)performerDelegate;
- (id)actionPerformerForActionType:(id)a3;
- (id)messageComposeActionPerformer;
- (id)photosPickerActionPerformer;
- (id)publishActionPerformer;
- (void)setPerformerDelegate:(id)a3;
@end

@implementation PXCMMActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_destroyWeak((id *)&self->_performerDelegate);
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (void)setPerformerDelegate:(id)a3
{
}

- (PXCMMActionPerformerDelegate)performerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_performerDelegate);
  return (PXCMMActionPerformerDelegate *)WeakRetained;
}

- (id)photosPickerActionPerformer
{
  return 0;
}

- (id)messageComposeActionPerformer
{
  return 0;
}

- (id)publishActionPerformer
{
  return 0;
}

- (Class)actionPerformerClassForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXCMMActionManager *)self performerClassByType];
  v6 = (void *)[v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXCMMActionManager *)self actionPerformerClassForActionType:v4];
  if (v5)
  {
    v6 = (void *)[[v5 alloc] initWithActionType:v4];
    v7 = [(PXCMMActionManager *)self performerDelegate];
    [v6 setDelegate:v7];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PXCMMActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXCMMActionManager;
  v2 = [(PXCMMActionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    performerClassByType = v2->_performerClassByType;
    v2->_performerClassByType = v3;
  }
  return v2;
}

@end