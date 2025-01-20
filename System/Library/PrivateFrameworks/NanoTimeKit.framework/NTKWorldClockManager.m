@interface NTKWorldClockManager
+ (id)sharedManager;
- (BOOL)canAddCity;
- (BOOL)checkIfCitiesModified;
- (NSArray)cities;
- (NTKWorldClockManager)init;
- (unint64_t)addCity:(id)a3;
- (void)loadCities;
- (void)saveCities;
@end

@implementation NTKWorldClockManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)sharedManager___sharedInstance;

  return v2;
}

void __37__NTKWorldClockManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(NTKWorldClockManager);
  v1 = (void *)sharedManager___sharedInstance;
  sharedManager___sharedInstance = (uint64_t)v0;
}

- (NTKWorldClockManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockManager;
  v2 = [(NTKWorldClockManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F78BC0] sharedManager];
    frameworkManager = v2->_frameworkManager;
    v2->_frameworkManager = (WorldClockManager *)v3;

    v2->_frameworkLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)cities
{
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  v4 = [(WorldClockManager *)self->_frameworkManager cities];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_frameworkLock);

  return (NSArray *)v5;
}

- (void)loadCities
{
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  [(WorldClockManager *)self->_frameworkManager loadCities];

  os_unfair_lock_unlock(p_frameworkLock);
}

- (BOOL)checkIfCitiesModified
{
  v2 = self;
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  LOBYTE(v2) = [(WorldClockManager *)v2->_frameworkManager checkIfCitiesModified];
  os_unfair_lock_unlock(p_frameworkLock);
  return (char)v2;
}

- (void)saveCities
{
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  [(WorldClockManager *)self->_frameworkManager saveCities];

  os_unfair_lock_unlock(p_frameworkLock);
}

- (BOOL)canAddCity
{
  v2 = self;
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  LOBYTE(v2) = [(WorldClockManager *)v2->_frameworkManager canAddCity];
  os_unfair_lock_unlock(p_frameworkLock);
  return (char)v2;
}

- (unint64_t)addCity:(id)a3
{
  p_frameworkLock = &self->_frameworkLock;
  id v5 = a3;
  os_unfair_lock_lock(p_frameworkLock);
  unint64_t v6 = [(WorldClockManager *)self->_frameworkManager addCity:v5];

  os_unfair_lock_unlock(p_frameworkLock);
  return v6;
}

- (void).cxx_destruct
{
}

@end