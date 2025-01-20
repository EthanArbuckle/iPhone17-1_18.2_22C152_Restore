@interface PXStoryController
- (OS_dispatch_queue)storyQueue;
- (PXStoryController)init;
- (PXStoryController)initWithObservableModel:(id)a3;
- (PXStoryQueueParticipant)observableModel;
- (PXUpdater)updater;
- (void)_setNeedsUpdate;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
@end

@implementation PXStoryController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_observableModel);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryQueueParticipant)observableModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observableModel);
  return (PXStoryQueueParticipant *)WeakRetained;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ModelObservationContext_202993 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXStoryController.m" lineNumber:66 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PXStoryController *)self handleModelChange:a4];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryController;
  [(PXStoryController *)&v4 didPerformChanges];
  v3 = [(PXStoryController *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryController;
  [(PXStoryController *)&v6 performChanges:v4];
}

- (PXStoryController)initWithObservableModel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryController;
  v5 = [(PXStoryController *)&v14 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(PXStoryController *)v5 copyLogConfigurationFrom:v4];
    id v7 = objc_storeWeak((id *)&v6->_observableModel, v4);
    [v4 registerChangeObserver:v6 context:ModelObservationContext_202993];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_observableModel);
    uint64_t v9 = [WeakRetained storyQueue];
    storyQueue = v6->_storyQueue;
    v6->_storyQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v6 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v11;

    [(PXStoryController *)v6 configureUpdater:v6->_updater];
  }

  return v6;
}

- (PXStoryController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryController.m", 22, @"%s is not available as initializer", "-[PXStoryController init]");

  abort();
}

@end