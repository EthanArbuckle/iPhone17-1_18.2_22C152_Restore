@interface _PXStoryObservation
- (PXObservable)observable;
- (_PXStoryObservation)initWithObservable:(id)a3 changeHandler:(id)a4;
- (id)changeHandler;
- (void)cancel;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setChangeHandler:(id)a3;
@end

@implementation _PXStoryObservation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_observable);
}

- (void)setChangeHandler:(id)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (PXObservable)observable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observable);
  return (PXObservable *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  v7 = [(_PXStoryObservation *)self changeHandler];

  if (v7)
  {
    v8 = [(_PXStoryObservation *)self changeHandler];
    ((void (**)(void, id, unint64_t))v8)[2](v8, v9, a4);
  }
}

- (void)cancel
{
  v3 = [(_PXStoryObservation *)self observable];
  [v3 unregisterChangeObserver:self context:0];

  [(_PXStoryObservation *)self setChangeHandler:0];
}

- (_PXStoryObservation)initWithObservable:(id)a3 changeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryObservation;
  v8 = [(_PXStoryObservation *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observable, v6);
    uint64_t v10 = [v7 copy];
    id changeHandler = v9->_changeHandler;
    v9->_id changeHandler = (id)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_observable);
    [WeakRetained registerChangeObserver:v9 context:0];
  }
  return v9;
}

@end