@interface CSDVoIPProcessAssertionManager
- (CSDVoIPProcessAssertionManager)initWithSerialQueue:(id)a3;
- (NSCountedSet)processAssertions;
- (OS_dispatch_queue)serialQueue;
- (id)processAssertionWithBundleIdentifier:(id)a3;
- (void)acquireProcessAssertionForBundleIdentifier:(id)a3;
- (void)acquireProcessAssertionForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3;
- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)setProcessAssertions:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CSDVoIPProcessAssertionManager

- (CSDVoIPProcessAssertionManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDVoIPProcessAssertionManager;
  v6 = [(CSDVoIPProcessAssertionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    processAssertions = v7->_processAssertions;
    v7->_processAssertions = v8;
  }
  return v7;
}

- (void)acquireProcessAssertionForBundleIdentifier:(id)a3
{
}

- (void)acquireProcessAssertionForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDVoIPProcessAssertionManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141544;
  block[3] = &unk_100505EA0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3
{
}

- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDVoIPProcessAssertionManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141B50;
  block[3] = &unk_100505EA0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)processAssertionWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[CSDVoIPProcessAssertion alloc] initWithBundleIdentifier:v3];

  return v4;
}

- (NSCountedSet)processAssertions
{
  id v3 = [(CSDVoIPProcessAssertionManager *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  processAssertions = self->_processAssertions;

  return processAssertions;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setProcessAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertions, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end