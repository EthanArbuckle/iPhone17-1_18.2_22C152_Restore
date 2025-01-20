@interface TUIModelContainer
- (NSArray)submodels;
- (TUIModelContaining)parentModel;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIModelContainer

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  submodels = self->_submodels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8732C;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)submodels enumerateObjectsUsingBlock:v7];
}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4 = a3;
  submodels = self->_submodels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_873D0;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)submodels enumerateObjectsUsingBlock:v7];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)onContainedModelsChanged
{
  id v2 = [(TUIModelContainer *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (void)updateModelChildren:(id)a3
{
  submodels = self->_submodels;
  id v5 = a3;
  [(NSArray *)submodels enumerateObjectsUsingBlock:&stru_2541F0];
  id v6 = (NSArray *)[v5 copy];

  v7 = self->_submodels;
  self->_submodels = v6;

  id v8 = self->_submodels;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_874FC;
  v9[3] = &unk_251AE0;
  v9[4] = self;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  [(TUIModelContainer *)self onContainedModelsChanged];
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodels, 0);

  objc_destroyWeak((id *)&self->_parentModel);
}

@end