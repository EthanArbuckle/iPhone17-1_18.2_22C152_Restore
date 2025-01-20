@interface _TUIDynamicArrayContainer
- (BOOL)allowDynamicWindowInstantiation;
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)needsValidationForTransactionGroup:(id)a3;
- (BOOL)windowLowerLoadTriggered;
- (BOOL)windowLowerUnloadTriggered;
- (BOOL)windowUpperLoadTriggered;
- (BOOL)windowUpperUnloadTriggered;
- (Class)dynamicArrayLayoutIterationClass;
- (Class)layoutClass;
- (TUIModelContaining)parentModel;
- (_NSRange)windowRange;
- (_TUIDynamicArrayContainer)initWithEnumerator:(id)a3 binding:(id)a4 array:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 options:(id)a11 flags:(unint64_t)a12 builderClass:(Class)a13;
- (double)estimatedHeight;
- (double)estimatedHeightAbovePivot;
- (double)estimatedWidth;
- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5;
- (id)windowLowerLoadTriggerChildBoxFlipped:(BOOL)a3;
- (id)windowLowerUnloadTriggerChildBoxFlipped:(BOOL)a3;
- (id)windowUpperLoadTriggerChildBoxFlipped:(BOOL)a3;
- (id)windowUpperUnloadTriggerChildBoxFlipped:(BOOL)a3;
- (unint64_t)modelKind;
- (unint64_t)role;
- (unint64_t)windowCount;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)instantiateWithContext:(id)a3;
- (void)onContainedModelsChanged;
- (void)setEstimatedHeight:(double)a3;
- (void)setEstimatedHeightAbovePivot:(double)a3;
- (void)setEstimatedWidth:(double)a3;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation _TUIDynamicArrayContainer

- (_TUIDynamicArrayContainer)initWithEnumerator:(id)a3 binding:(id)a4 array:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 options:(id)a11 flags:(unint64_t)a12 builderClass:(Class)a13
{
  id v29 = a5;
  id v19 = a6;
  id obj = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_TUIDynamicArrayContainer;
  v23 = [(_TUIDynamicArrayContainer *)&v30 init];
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_transactionCoordinator, obj);
    objc_storeWeak((id *)&v24->_dynamicController, v20);
    uint64_t v25 = [v29 instanceForObserver:v24];
    instance = v24->_instance;
    v24->_instance = (TUIDynamicArrayInstance *)v25;

    objc_storeStrong((id *)&v24->_snapshot, a10);
    v24->_enumerator.index = a3.var0;
    v24->_nodes = ($92066C5B8ED375D06BBF3B95346A0A30)a9;
    v24->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a4;
    objc_storeStrong((id *)&v24->_options, a11);
    v24->_flags = a12;
    v24->_builderClass = a13;
    [(_TUIDynamicArrayContainer *)v24 instantiateWithContext:v19];
  }

  return v24;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_81F84;
  v11[3] = &unk_251B08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSArray *)children enumerateObjectsUsingBlock:v11];
}

- (Class)layoutClass
{
  v2 = TUIAncestorBoxFromModel(self);
  v3 = [v2 dynamicArrayLayoutContainerClass];

  return (Class)v3;
}

- (unint64_t)role
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  v4 = (NSArray *)a3;
  [(NSArray *)self->_children enumerateObjectsUsingBlock:&stru_254010];
  children = self->_children;
  self->_children = v4;
  id v6 = v4;

  id v7 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_82100;
  v8[3] = &unk_251AE0;
  v8[4] = self;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  [(_TUIDynamicArrayContainer *)self onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_821B4;
  v7[3] = &unk_251AE0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void)onContainedModelsChanged
{
  id v2 = [(_TUIDynamicArrayContainer *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (Class)dynamicArrayLayoutIterationClass
{
  id v2 = TUIAncestorBoxFromModel(self);
  v3 = [v2 dynamicArrayLayoutIterationClass];

  return (Class)v3;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  p_transactionCoordinator = &self->_transactionCoordinator;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_transactionCoordinator);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_822FC;
  v8[3] = &unk_2526E0;
  v8[4] = self;
  [WeakRetained scheduleLayoutUpdateWithTransaction:v6 block:v8];
}

- (void)instantiateWithContext:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(TUIDynamicArrayInstance *)self->_instance count];
  if ((self->_flags & 2) != 0)
  {
    options = self->_options;
    if (options)
    {
      if ([(TUIDynamicInstantiateOptions *)options fetchInitial] != 0x7FFFFFFFFFFFFFFFLL) {
        id v6 = [(TUIDynamicInstantiateOptions *)self->_options fetchInitial];
      }
    }
  }
  id v8 = [(TUIDynamicArrayInstance *)self->_instance count];
  if (v6 >= v8) {
    NSUInteger v9 = (NSUInteger)v8;
  }
  else {
    NSUInteger v9 = (NSUInteger)v6;
  }
  self->_instantiateWindow.location = 0;
  self->_instantiateWindow.length = v9;
  instance = self->_instance;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_82474;
  v16 = &unk_254060;
  v17 = self;
  id v18 = v4;
  id v19 = v5;
  id v20 = v6;
  id v11 = v5;
  id v12 = v4;
  -[TUIDynamicArrayInstance objectsInRange:block:](instance, "objectsInRange:block:", 0, v9, &v13);
  -[_TUIDynamicArrayContainer updateModelChildren:](self, "updateModelChildren:", v11, v13, v14, v15, v16, v17);
}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  if ([(TUIDynamicArrayInstance *)self->_instance optimizeUpdatesForTransactionGroup:a3])return 1; {
  unsigned int v5 = *((unsigned __int8 *)self + 104);
  }
  BOOL v6 = (v5 & 7) == 0;
  BOOL v7 = (v5 >> 3) & 1;
  return !v6 || v7;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return [(TUIDynamicArrayInstance *)self->_instance hasUpdatesForTransactionGroup:a3];
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = TUIProtocolCast(&OBJC_PROTOCOL___TUIDynamicArrayLayout, a5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  if (objc_opt_respondsToSelector())
  {
    id v12 = objc_loadWeakRetained((id *)&self->_parentModel);
    unsigned __int8 v13 = [v12 allowDynamicWindowInstantiation];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  snapshot = self->_snapshot;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_82810;
  v19[3] = &unk_254150;
  unsigned __int8 v23 = v13;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v17 evaluateWithSnapshot:snapshot block:v19];

  return self;
}

- (id)windowLowerLoadTriggerChildBoxFlipped:(BOOL)a3
{
  NSUInteger v5 = [(TUIDynamicInstantiateOptions *)self->_options fetchPadding];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (NSUInteger location = self->_instantiateWindow.location) == 0
    || (location + v5 != 0x7FFFFFFFFFFFFFFFLL ? (BOOL v7 = v5 >= self->_instantiateWindow.length) : (BOOL v7 = 1), v7))
  {
    id v8 = 0;
  }
  else
  {
    id v10 = [(NSArray *)self->_children objectAtIndexedSubscript:v5];
    id v11 = v10;
    if (a3) {
      sub_841AC(v10);
    }
    else {
    id v8 = sub_8421C(v10);
    }
  }

  return v8;
}

- (id)windowLowerUnloadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5 = [(TUIDynamicInstantiateOptions *)self->_options fetchPadding];
  NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v5;
    unint64_t v8 = [(TUIDynamicInstantiateOptions *)self->_options fetchDelta] == 0x7FFFFFFFFFFFFFFFLL
       ? 1
       : [(TUIDynamicInstantiateOptions *)self->_options fetchDelta];
    unint64_t v9 = v8 + v7;
    if (v8 + v7 != 0x7FFFFFFFFFFFFFFFLL && v9 <= self->_instantiateWindow.length) {
      NSUInteger v6 = v9 + self->_instantiateWindow.location - 1;
    }
  }
  if ([(TUIDynamicInstantiateOptions *)self->_options fetchWindow] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  NSUInteger v10 = self->_instantiateWindow.length + self->_instantiateWindow.location;
  if (v10 >= (unint64_t)[(TUIDynamicArrayInstance *)self->_instance count])
  {
    NSUInteger length = self->_instantiateWindow.length;
    BOOL v11 = length <= [(TUIDynamicInstantiateOptions *)self->_options fetchWindow];
  }
  else
  {
    BOOL v11 = 0;
  }
  unsigned __int8 v13 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v11) {
    goto LABEL_16;
  }
  if ([(TUIDynamicInstantiateOptions *)self->_options fetchWindow] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_15:
    unsigned __int8 v13 = 0;
  }
  else
  {
    id v15 = [(NSArray *)self->_children objectAtIndexedSubscript:v6 - self->_instantiateWindow.location];
    id v16 = v15;
    if (a3) {
      sub_8421C(v15);
    }
    else {
    unsigned __int8 v13 = sub_841AC(v15);
    }
  }
LABEL_16:

  return v13;
}

- (id)windowUpperLoadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5 = [(TUIDynamicInstantiateOptions *)self->_options fetchPadding];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v6 = v5, length = self->_instantiateWindow.length, v5 >= length)
    || (unint64_t v8 = self->_instantiateWindow.location + length,
        v8 >= (unint64_t)[(TUIDynamicArrayInstance *)self->_instance count])
    || self->_instantiateWindow.location + self->_instantiateWindow.length + ~v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0;
  }
  else
  {
    BOOL v11 = [(NSArray *)self->_children objectAtIndexedSubscript:self->_instantiateWindow.length + ~v6];
    id v12 = v11;
    if (a3) {
      sub_8421C(v11);
    }
    else {
    unint64_t v9 = sub_841AC(v11);
    }
  }

  return v9;
}

- (id)windowUpperUnloadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5 = [(TUIDynamicInstantiateOptions *)self->_options fetchPadding];
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v5;
    unint64_t v8 = [(TUIDynamicInstantiateOptions *)self->_options fetchDelta] == 0x7FFFFFFFFFFFFFFFLL
       ? 1
       : [(TUIDynamicInstantiateOptions *)self->_options fetchDelta];
    NSUInteger v9 = v8 + v7;
    if (v8 + v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = self->_instantiateWindow.length;
      BOOL v11 = length >= v9;
      NSUInteger v12 = length - v9;
      if (v12 != 0 && v11) {
        uint64_t v6 = v12 + self->_instantiateWindow.location;
      }
    }
  }
  if ([(TUIDynamicInstantiateOptions *)self->_options fetchWindow] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
  if (self->_instantiateWindow.location)
  {
    BOOL v13 = 0;
  }
  else
  {
    NSUInteger v14 = self->_instantiateWindow.length;
    BOOL v13 = v14 <= [(TUIDynamicInstantiateOptions *)self->_options fetchWindow];
  }
  id v15 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v13) {
    goto LABEL_17;
  }
  if ([(TUIDynamicInstantiateOptions *)self->_options fetchWindow] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_16:
    id v15 = 0;
  }
  else
  {
    id v17 = [(NSArray *)self->_children objectAtIndexedSubscript:v6 - self->_instantiateWindow.location];
    id v18 = v17;
    if (a3) {
      sub_841AC(v17);
    }
    else {
    id v15 = sub_8421C(v17);
    }
  }
LABEL_17:

  return v15;
}

- (_NSRange)windowRange
{
  NSUInteger length = self->_instantiateWindow.length;
  NSUInteger location = self->_instantiateWindow.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)windowLowerLoadTriggered
{
  if (*((unsigned char *)self + 104)) {
    return 0;
  }
  id v2 = self;
  *((unsigned char *)self + 104) |= 1u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = [WeakRetained invalidateInstantiation:v2];

  return (char)v2;
}

- (BOOL)windowUpperLoadTriggered
{
  if ((*((unsigned char *)self + 104) & 2) != 0) {
    return 0;
  }
  id v2 = self;
  *((unsigned char *)self + 104) |= 2u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = [WeakRetained invalidateInstantiation:v2];

  return (char)v2;
}

- (BOOL)windowLowerUnloadTriggered
{
  if ((*((unsigned char *)self + 104) & 4) != 0) {
    return 0;
  }
  id v2 = self;
  *((unsigned char *)self + 104) |= 4u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = [WeakRetained invalidateInstantiation:v2];

  return (char)v2;
}

- (BOOL)windowUpperUnloadTriggered
{
  if ((*((unsigned char *)self + 104) & 8) != 0) {
    return 0;
  }
  id v2 = self;
  *((unsigned char *)self + 104) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = [WeakRetained invalidateInstantiation:v2];

  return (char)v2;
}

- (unint64_t)windowCount
{
  return (unint64_t)[(TUIDynamicArrayInstance *)self->_instance count];
}

- (double)estimatedWidth
{
  return self->_estimatedWidth;
}

- (void)setEstimatedWidth:(double)a3
{
  self->_estimatedWidth = a3;
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (void)setEstimatedHeight:(double)a3
{
  self->_estimatedHeight = a3;
}

- (double)estimatedHeightAbovePivot
{
  return self->_estimatedHeightAbovePivot;
}

- (void)setEstimatedHeightAbovePivot:(double)a3
{
  self->_estimatedHeightAbovePivot = a3;
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_instance, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end