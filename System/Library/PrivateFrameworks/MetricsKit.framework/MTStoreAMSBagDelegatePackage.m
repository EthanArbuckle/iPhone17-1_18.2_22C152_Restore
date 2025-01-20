@interface MTStoreAMSBagDelegatePackage
- (MTConfigAMSMetricsDelegate)configDelegate;
- (MTConvenienceEnvironmentDelegate)environmentDelegate;
- (MTEventRecorderAMSMetricsDelegate)eventRecorderDelegate;
- (MTStoreAMSBagDelegatePackage)init;
- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3;
- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3 containerId:(id)a4 pageURLBlock:(id)a5 resourceRevNumBlock:(id)a6 hostAppBlock:(id)a7;
- (id)hostAppBlock;
- (void)setConfigDelegate:(id)a3;
- (void)setEnvironmentDelegate:(id)a3;
- (void)setEventRecorderDelegate:(id)a3;
- (void)setHostAppBlock:(id)a3;
@end

@implementation MTStoreAMSBagDelegatePackage

- (MTEventRecorderAMSMetricsDelegate)eventRecorderDelegate
{
  return self->_eventRecorderDelegate;
}

- (MTConvenienceEnvironmentDelegate)environmentDelegate
{
  return self->_environmentDelegate;
}

- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3 containerId:(id)a4 pageURLBlock:(id)a5 resourceRevNumBlock:(id)a6 hostAppBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MTStoreAMSBagDelegatePackage;
  v17 = [(MTStoreAMSBagDelegatePackage *)&v25 init];
  if (v17)
  {
    v18 = [[MTConfigAMSMetricsDelegate alloc] initWithAMSBag:v12];
    configDelegate = v17->_configDelegate;
    v17->_configDelegate = v18;

    v20 = [[MTConvenienceEnvironmentDelegate alloc] initWithPageURLBlock:v14 resourceRevNumBlock:v15 hostAppBlock:v16];
    environmentDelegate = v17->_environmentDelegate;
    v17->_environmentDelegate = v20;

    v22 = [[MTEventRecorderAMSMetricsDelegate alloc] initWithContainerId:v13 amsBag:v12];
    eventRecorderDelegate = v17->_eventRecorderDelegate;
    v17->_eventRecorderDelegate = v22;
  }
  return v17;
}

- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3
{
  return [(MTStoreAMSBagDelegatePackage *)self initWithAMSBag:a3 containerId:0 pageURLBlock:0 resourceRevNumBlock:0 hostAppBlock:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDelegate, 0);
  objc_storeStrong((id *)&self->_eventRecorderDelegate, 0);
  objc_storeStrong((id *)&self->_configDelegate, 0);

  objc_storeStrong(&self->_hostAppBlock, 0);
}

- (MTStoreAMSBagDelegatePackage)init
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"-init is not a valid initializer for the class %@", v4];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (id)hostAppBlock
{
  return self->_hostAppBlock;
}

- (void)setHostAppBlock:(id)a3
{
}

- (MTConfigAMSMetricsDelegate)configDelegate
{
  return self->_configDelegate;
}

- (void)setConfigDelegate:(id)a3
{
}

- (void)setEventRecorderDelegate:(id)a3
{
}

- (void)setEnvironmentDelegate:(id)a3
{
}

@end