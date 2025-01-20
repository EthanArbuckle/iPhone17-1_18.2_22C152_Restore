@interface NMRMediaRemoteUpdater
- (NMRMediaRemoteUpdater)initWithQueue:(id)a3 updateBlock:(id)a4;
- (void)executeUpdateBlock;
@end

@implementation NMRMediaRemoteUpdater

- (NMRMediaRemoteUpdater)initWithQueue:(id)a3 updateBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMRMediaRemoteUpdater;
  v9 = [(NMRMediaRemoteUpdater *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = objc_retainBlock(v8);
    id updateBlock = v10->_updateBlock;
    v10->_id updateBlock = v11;
  }
  return v10;
}

- (void)executeUpdateBlock
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F194;
  block[3] = &unk_100044D08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_updateBlock, 0);
}

@end