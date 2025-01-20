@interface _TUIDynamicValueItem
- (BOOL)allowDynamicWindowInstantiation;
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)needsValidationForTransactionGroup:(id)a3;
- (TUIModelContaining)parentModel;
- (_TUIDynamicValueItem)initWithEnumerator:(id)a3 binding:(id)a4 value:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 flags:(unint64_t)a11 builderClass:(Class)a12;
- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)instantiateWithContext:(id)a3;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation _TUIDynamicValueItem

- (_TUIDynamicValueItem)initWithEnumerator:(id)a3 binding:(id)a4 value:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 flags:(unint64_t)a11 builderClass:(Class)a12
{
  id v27 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_TUIDynamicValueItem;
  v22 = [(_TUIDynamicValueItem *)&v28 init];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_transactionCoordinator, v19);
    objc_storeWeak((id *)&v23->_dynamicController, v20);
    uint64_t v24 = [v27 instanceForObserver:v23];
    instance = v23->_instance;
    v23->_instance = (TUIDynamicValueInstance *)v24;

    objc_storeStrong((id *)&v23->_snapshot, a10);
    v23->_enumerator.index = a3.var0;
    v23->_nodes = ($92066C5B8ED375D06BBF3B95346A0A30)a9;
    v23->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a4;
    v23->_flags = a11;
    v23->_builderClass = a12;
    [(_TUIDynamicValueItem *)v23 instantiateWithContext:v18];
  }

  return v23;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  children = self->_children;
  id v5 = a3;
  [(NSArray *)children enumerateObjectsUsingBlock:&stru_2526B8];
  v6 = (NSArray *)[v5 copy];

  v7 = self->_children;
  self->_children = v6;

  v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_36090;
  v9[3] = &unk_251AE0;
  v9[4] = self;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  [(_TUIDynamicValueItem *)self onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_36144;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_361E8;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_362B4;
  v11[3] = &unk_251B08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSArray *)children enumerateObjectsUsingBlock:v11];
}

- (void)onContainedModelsChanged
{
  id v2 = [(_TUIDynamicValueItem *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  p_transactionCoordinator = &self->_transactionCoordinator;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_transactionCoordinator);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_36400;
  v8[3] = &unk_2526E0;
  v8[4] = self;
  [WeakRetained scheduleLayoutUpdateWithTransaction:v6 block:v8];
}

- (void)instantiateWithContext:(id)a3
{
  id v4 = a3;
  instance = self->_instance;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_364DC;
  v7[3] = &unk_252708;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TUIDynamicValueInstance *)instance valueWithBlock:v7];
}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  return [(TUIDynamicValueInstance *)self->_instance optimizeUpdatesForTransactionGroup:a3];
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return [(TUIDynamicValueInstance *)self->_instance hasUpdatesForTransactionGroup:a3];
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  snapshot = self->_snapshot;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_36680;
  v13[3] = &unk_252320;
  v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  [v10 evaluateWithSnapshot:snapshot block:v13];

  return self;
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_storeStrong((id *)&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

@end