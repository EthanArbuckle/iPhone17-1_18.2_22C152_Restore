@interface REMUserDefaultsObserver
- (BOOL)removed;
- (NSString)userDefaultsKey;
- (REMUserDefaults)userDefaults;
- (REMUserDefaultsObserver)initWithUserDefaults:(id)a3 key:(id)a4 block:(id)a5;
- (id)block;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserDefaultsKey:(id)a3;
- (void)stopObserving;
@end

@implementation REMUserDefaultsObserver

- (REMUserDefaultsObserver)initWithUserDefaults:(id)a3 key:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMUserDefaultsObserver;
  v12 = [(REMUserDefaultsObserver *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    objc_storeStrong((id *)&v13->_userDefaultsKey, a4);
    uint64_t v14 = MEMORY[0x1BA9DBBC0](v11);
    id block = v13->_block;
    v13->_id block = (id)v14;
  }
  return v13;
}

- (void)stopObserving
{
  if (![(REMUserDefaultsObserver *)self removed])
  {
    v3 = [(REMUserDefaultsObserver *)self userDefaults];
    [v3 _removeObserver:self];

    [(REMUserDefaultsObserver *)self setRemoved:1];
  }
}

- (void)dealloc
{
  [(REMUserDefaultsObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)REMUserDefaultsObserver;
  [(REMUserDefaultsObserver *)&v3 dealloc];
}

- (REMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void)setUserDefaultsKey:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_userDefaultsKey, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end