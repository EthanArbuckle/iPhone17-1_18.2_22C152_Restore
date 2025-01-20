@interface CRLCanvasLayoutChangeObserver
- (CRLCanvasLayoutChangeObserver)initWithChangeNotifier:(id)a3 layoutController:(id)a4;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (void)didProcessAllChanges;
- (void)i_layoutRegistered:(id)a3;
- (void)i_layoutUnregistered:(id)a3;
- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)setInteractiveCanvasController:(id)a3;
@end

@implementation CRLCanvasLayoutChangeObserver

- (CRLCanvasLayoutChangeObserver)initWithChangeNotifier:(id)a3 layoutController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasLayoutChangeObserver;
  v8 = [(CRLCanvasLayoutChangeObserver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_changeNotifier, v6);
    objc_storeWeak((id *)&v9->_layoutController, v7);
  }

  return v9;
}

- (void)i_layoutRegistered:(id)a3
{
  p_changeNotifier = &self->_changeNotifier;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_changeNotifier);
  id v6 = [v5 info];

  [WeakRetained addObserver:self forChangeSource:v6];
}

- (void)i_layoutUnregistered:(id)a3
{
  p_changeNotifier = &self->_changeNotifier;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_changeNotifier);
  id v6 = [v5 info];

  [WeakRetained removeObserver:self forChangeSource:v6];
}

- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  v13 = sub_100246AC8(v6, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutController);
    v15 = [WeakRetained layoutsForInfo:v13];
    [v15 makeObjectsPerformSelector:"processChanges:" withObject:v17];
  }
  id v16 = objc_loadWeakRetained((id *)&self->_icc);
  [v16 preprocessChanges:v17 forChangeSource:v6];
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  p_icc = &self->_icc;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_icc);
  [WeakRetained processChanges:v7 forChangeSource:v6];
}

- (void)didProcessAllChanges
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained didProcessAllChanges];
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_destroyWeak((id *)&self->_layoutController);

  objc_destroyWeak((id *)&self->_changeNotifier);
}

@end