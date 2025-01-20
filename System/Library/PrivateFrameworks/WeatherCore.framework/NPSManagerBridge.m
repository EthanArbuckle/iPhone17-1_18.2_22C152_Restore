@interface NPSManagerBridge
- (NPSManager)npsManager;
- (NPSManagerBridge)init;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6;
@end

@implementation NPSManagerBridge

- (NPSManagerBridge)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPSManagerBridge;
  v2 = [(NPSManagerBridge *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v3;
  }
  return v2;
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPSManagerBridge *)self npsManager];
  [v14 synchronizeUserDefaultsDomain:v13 keys:v12 container:v11 appGroupContainer:v10];
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void).cxx_destruct
{
}

@end