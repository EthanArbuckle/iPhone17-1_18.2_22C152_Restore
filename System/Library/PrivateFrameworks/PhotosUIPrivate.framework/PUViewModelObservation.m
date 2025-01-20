@interface PUViewModelObservation
+ (id)new;
- (PUViewModel)viewModel;
- (PUViewModelObservation)init;
- (PUViewModelObservation)initWithViewModel:(id)a3 changeHandler:(id)a4;
- (id)changeHandler;
- (void)setChangeHandler:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUViewModelObservation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setChangeHandler:(id)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (PUViewModel)viewModel
{
  return self->_viewModel;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  v6 = [(PUViewModelObservation *)self changeHandler];
  v6[2](v6, v5);
}

- (PUViewModelObservation)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUViewModelObservation.m", 29, @"%s is not available as initializer", "-[PUViewModelObservation init]");

  abort();
}

- (PUViewModelObservation)initWithViewModel:(id)a3 changeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUViewModelObservation;
  v8 = [(PUViewModelObservation *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id changeHandler = v8->_changeHandler;
    v8->_id changeHandler = v9;

    [v6 registerChangeObserver:v8];
  }

  return v8;
}

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUViewModelObservation.m", 33, @"%s is not available as initializer", "+[PUViewModelObservation new]");

  abort();
}

@end