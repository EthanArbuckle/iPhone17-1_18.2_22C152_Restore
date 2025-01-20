@interface RBBundlePropertiesManager
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBBundlePropertiesManager)init;
- (RBBundlePropertiesManagerDelegate)delegate;
- (id)propertiesForIdentity:(id)a3 identifier:(id)a4;
- (void)addProcess:(id)a3;
- (void)bundlePropertiesProvider:(id)a3 didChangePropertiesForProcessIdentities:(id)a4;
- (void)removeProcess:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RBBundlePropertiesManager

- (id)propertiesForIdentity:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(RBProcessIndex *)self->_processIndex processForIdentifier:v7];
  if (!v8)
  {
    v8 = [(RBProcessIndex *)self->_processIndex processForIdentity:v6];
  }
  v9 = [v8 bundleProperties];
  os_unfair_lock_unlock(&self->_lock);
  if (!v9) {
    v9 = [[RBBundleProperties alloc] initWithLSProvider:self->_lsProvider xpcProvider:self->_xpcProvider processIdentity:v6 processIdentifier:v7];
  }

  return v9;
}

- (void)removeProcess:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(RBProcessIndex *)self->_processIndex removeProcess:v5];
  xpcProvider = self->_xpcProvider;
  id v7 = [v5 identifier];

  [(RBBundlePropertiesBSXPCProvider *)xpcProvider removePropertiesForIdentifier:v7];
  os_unfair_lock_unlock(p_lock);
}

- (RBBundlePropertiesManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)RBBundlePropertiesManager;
  v2 = [(RBBundlePropertiesManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(RBBundlePropertiesLSProvider);
    lsProvider = v3->_lsProvider;
    v3->_lsProvider = v4;

    [(RBBundlePropertiesLSProvider *)v3->_lsProvider setDelegate:v3];
    id v6 = objc_alloc_init(RBProcessIndex);
    processIndex = v3->_processIndex;
    v3->_processIndex = v6;

    v8 = objc_alloc_init(RBBundlePropertiesBSXPCProvider);
    xpcProvider = v3->_xpcProvider;
    v3->_xpcProvider = v8;
  }
  return v3;
}

- (RBBundlePropertiesManagerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  v4 = (RBBundlePropertiesManagerDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  delegate = self->_delegate;
  self->_delegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  id v5 = [(RBBundlePropertiesLSProvider *)self->_lsProvider debugDescription];
  id v6 = [(RBBundlePropertiesBSXPCProvider *)self->_xpcProvider debugDescription];
  id v7 = (void *)[v3 initWithFormat:@"<%@| lsProvider:%@\n\txpcProvider:%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (void)addProcess:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(RBProcessIndex *)self->_processIndex addProcess:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)bundlePropertiesProvider:(id)a3 didChangePropertiesForProcessIdentities:(id)a4
{
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
  objc_storeStrong((id *)&self->_lsProvider, 0);
}

@end