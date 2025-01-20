@interface PCSLockAssertion
- (BOOL)held;
- (BOOL)holdAssertion;
- (NSString)name;
- (PCSLockManager)manager;
- (id)initAssertion:(id)a3 manager:(id)a4;
- (void)dealloc;
- (void)dropAssertion;
- (void)setHeld:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PCSLockAssertion

- (id)initAssertion:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCSLockAssertion;
  v9 = [(PCSLockAssertion *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)holdAssertion
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_held)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [(PCSLockManager *)v2->_manager holdAssertion:v2];
    v2->_held = v3;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)dropAssertion
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_held) {
    -[PCSLockManager dropAssertion:](obj->_manager, "dropAssertion:");
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(PCSLockManager *)self->_manager removeAssertion:self];
  v3.receiver = self;
  v3.super_class = (Class)PCSLockAssertion;
  [(PCSLockAssertion *)&v3 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (PCSLockManager)manager
{
  return (PCSLockManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManager:(id)a3
{
}

- (BOOL)held
{
  return self->_held;
}

- (void)setHeld:(BOOL)a3
{
  self->_held = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end