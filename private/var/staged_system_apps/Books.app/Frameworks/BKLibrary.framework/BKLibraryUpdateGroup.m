@interface BKLibraryUpdateGroup
- (BKLibraryUpdateGroup)initWithName:(id)a3;
- (NSString)name;
- (OS_dispatch_group)finishGroup;
- (OS_dispatch_queue)updateQueue;
- (id)holdOperationsAssetion;
- (void)addOperationBlock:(id)a3;
- (void)executeWithCompletion:(id)a3;
- (void)finishedWithOperations;
@end

@implementation BKLibraryUpdateGroup

- (BKLibraryUpdateGroup)initWithName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryUpdateGroup;
  id v5 = [(BKLibraryUpdateGroup *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ibooks.BKLibraryUpdateGroup", v6);
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    dispatch_group_t v9 = dispatch_group_create();
    v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    id v11 = [v4 copy];
    v12 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v11;

    dispatch_suspend(*((dispatch_object_t *)v5 + 1));
    dispatch_group_enter(*((dispatch_group_t *)v5 + 2));
  }

  return (BKLibraryUpdateGroup *)v5;
}

- (void)addOperationBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_updateQueue, a3);
  }
}

- (void)finishedWithOperations
{
}

- (id)holdOperationsAssetion
{
  v2 = self->_updateQueue;
  dispatch_suspend((dispatch_object_t)v2);
  v3 = [BKLibraryUpdateHoldAssertion alloc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7EF0;
  v7[3] = &unk_D1520;
  v8 = v2;
  id v4 = v2;
  id v5 = [(BKLibraryUpdateHoldAssertion *)v3 initWithRelease:v7];

  return v5;
}

- (void)executeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    updateQueue = self->_updateQueue;
    finishGroup = self->_finishGroup;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7FAC;
    v8[3] = &unk_D1548;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(finishGroup, updateQueue, v8);
  }
  dispatch_resume((dispatch_object_t)self->_updateQueue);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (OS_dispatch_group)finishGroup
{
  return self->_finishGroup;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_finishGroup, 0);

  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end