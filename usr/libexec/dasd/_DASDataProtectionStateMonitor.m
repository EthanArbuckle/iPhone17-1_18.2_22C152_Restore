@interface _DASDataProtectionStateMonitor
+ (id)dataProtectionClassA;
+ (id)dataProtectionClassB;
+ (id)dataProtectionClassC;
+ (id)dataProtectionClassD;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)unnotifiedIsDataAvailableForClassC;
- (NSUUID)handlerUUID;
- (_DASDataProtectionMaster)master;
- (_DASDataProtectionStateMonitor)init;
- (id)changeHandler;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
@end

@implementation _DASDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return NSFileProtectionComplete;
}

+ (id)dataProtectionClassB
{
  return NSFileProtectionCompleteUnlessOpen;
}

+ (id)dataProtectionClassC
{
  return NSFileProtectionCompleteUntilFirstUserAuthentication;
}

+ (id)dataProtectionClassD
{
  return NSFileProtectionNone;
}

- (_DASDataProtectionStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASDataProtectionStateMonitor;
  v2 = [(_DASDataProtectionStateMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDataProtectionMaster sharedInstance];
    master = v2->_master;
    v2->_master = (_DASDataProtectionMaster *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    id changeHandler = v2->_changeHandler;
    v2->_id changeHandler = 0;
  }
  return v2;
}

- (void)dealloc
{
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = 0;

  master = self->_master;
  self->_master = 0;

  v5.receiver = self;
  v5.super_class = (Class)_DASDataProtectionStateMonitor;
  [(_DASDataProtectionStateMonitor *)&v5 dealloc];
}

- (void)setChangeHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_handlerUUID)
  {
    -[_DASDataProtectionMaster deregisterStateChangeHandler:](self->_master, "deregisterStateChangeHandler:");
    id v4 = v9;
  }
  if (v4)
  {
    objc_super v5 = [(_DASDataProtectionMaster *)self->_master registerStateChangeHandler:v4];
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    id v4 = v9;
  }
  id v7 = objc_retainBlock(v4);
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = v7;
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return [(_DASDataProtectionMaster *)self->_master isDataAvailableFor:a3];
}

- (BOOL)unnotifiedIsDataAvailableForClassC
{
  if ([(_DASDataProtectionMaster *)self->_master deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_DASDataProtectionMaster *)self->_master deviceIsPasswordConfigured];
  }
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (_DASDataProtectionMaster)master
{
  return self->_master;
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_master, 0);

  objc_storeStrong(&self->_changeHandler, 0);
}

@end