@interface _TUIDynamicArrayItem
- (BOOL)allowDynamicWindowInstantiation;
- (Class)layoutClass;
- (TUIModelContaining)parentModel;
- (unint64_t)instantiateResult;
- (unint64_t)modelKind;
- (unint64_t)role;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)onContainedModelsChanged;
- (void)setInstantiateResult:(unint64_t)a3;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation _TUIDynamicArrayItem

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1385D0;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (Class)layoutClass
{
  v2 = TUIAncestorBoxFromModel(self);
  v3 = [v2 dynamicArrayLayoutIterationClass];

  return (Class)v3;
}

- (unint64_t)role
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  id v4 = (NSArray *)a3;
  [(NSArray *)self->_children enumerateObjectsUsingBlock:&stru_256188];
  children = self->_children;
  self->_children = v4;
  id v6 = v4;

  v7 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1386F8;
  v8[3] = &unk_251AE0;
  v8[4] = self;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  [(_TUIDynamicArrayItem *)self onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1387D4;
  v11[3] = &unk_251B08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSArray *)children enumerateObjectsUsingBlock:v11];
}

- (void)onContainedModelsChanged
{
  id v2 = [(_TUIDynamicArrayItem *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (unint64_t)instantiateResult
{
  return self->_instantiateResult;
}

- (void)setInstantiateResult:(unint64_t)a3
{
  self->_instantiateResult = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentModel);

  objc_storeStrong((id *)&self->_children, 0);
}

@end