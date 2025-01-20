@interface EPPeripheralProcessor
- (EPCentralManager)centralManager;
- (EPPeripheralProcessor)initWithDeviceIDs:(id)a3 block:(id)a4 completion:(id)a5;
- (EPPeripheralProcessor)me;
- (NSArray)deviceIDs;
- (id)block;
- (id)completion;
- (void)setBlock:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setMe:(id)a3;
- (void)update;
@end

@implementation EPPeripheralProcessor

- (EPPeripheralProcessor)initWithDeviceIDs:(id)a3 block:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)EPPeripheralProcessor;
  v12 = [(EPPeripheralProcessor *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_me, v12);
    objc_storeStrong((id *)&v13->_deviceIDs, a3);
    id v14 = objc_retainBlock(v10);
    id v15 = v13->_block;
    v13->_block = v14;

    id v16 = objc_retainBlock(v11);
    id completion = v13->_completion;
    v13->_id completion = v16;

    v18 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F291C;
    block[3] = &unk_1001655F8;
    v21 = v13;
    dispatch_async(v18, block);
  }
  return v13;
}

- (void)update
{
  if (self->_me)
  {
    centralManager = self->_centralManager;
    if (!centralManager)
    {
      v4 = +[EPFactory sharedFactory];
      v5 = (EPCentralManager *)[v4 newCentralManagerWithDelegate:self];
      v6 = self->_centralManager;
      self->_centralManager = v5;

      centralManager = self->_centralManager;
    }
    if ((id)[(EPResource *)centralManager availability] == (id)1)
    {
      v7 = [(EPCentralManager *)self->_centralManager manager];
      v8 = [v7 retrievePeripheralsWithIdentifiers:self->_deviceIDs];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = (char *)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            (*((void (**)(void))self->_block + 2))();
            ++v12;
          }
          while (v10 != v12);
          id v10 = (char *)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
      id completion = (void (**)(void))self->_completion;
      if (completion) {
        completion[2]();
      }
      me = self->_me;
      self->_me = 0;
    }
  }
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (EPPeripheralProcessor)me
{
  return self->_me;
}

- (void)setMe:(id)a3
{
}

- (EPCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_deviceIDs, 0);
}

@end