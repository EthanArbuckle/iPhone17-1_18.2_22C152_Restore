@interface TUISingleModelContainer
- (TUIModel)submodel;
- (TUIModelContaining)parentModel;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUISingleModelContainer

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)onContainedModelsChanged
{
  id v2 = [(TUISingleModelContainer *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (void)updateModelChildren:(id)a3
{
  uint64_t v4 = [a3 firstObject];
  submodel = self->_submodel;
  id obj = (id)v4;
  if ((TUIModel *)v4 != submodel)
  {
    [(TUIModel *)submodel setParentModel:0];
    objc_storeStrong((id *)&self->_submodel, obj);
    [(TUIModel *)self->_submodel setParentModel:self];
    [(TUISingleModelContainer *)self onContainedModelsChanged];
  }
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (TUIModel)submodel
{
  return self->_submodel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodel, 0);

  objc_destroyWeak((id *)&self->_parentModel);
}

@end