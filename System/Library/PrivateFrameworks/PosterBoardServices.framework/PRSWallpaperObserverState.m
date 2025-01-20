@interface PRSWallpaperObserverState
- (PRSPosterConfiguration)activeHome;
- (PRSPosterConfiguration)activeLock;
- (PRSPosterConfiguration)selectedHome;
- (PRSPosterConfiguration)selectedLock;
- (PRSWallpaperObserverState)init;
- (id)_initWithSelectedLock:(id)a3 selectedHome:(id)a4 activeLock:(id)a5 activeHome:(id)a6;
- (id)description;
@end

@implementation PRSWallpaperObserverState

- (PRSWallpaperObserverState)init
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"-init is not allowed on %@", v6];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"PRSWallpaperObserver.m";
    __int16 v20 = 1024;
    int v21 = 108;
    __int16 v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  result = (PRSWallpaperObserverState *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSelectedLock:(id)a3 selectedHome:(id)a4 activeLock:(id)a5 activeHome:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PRSWallpaperObserverState;
  v15 = [(PRSWallpaperObserverState *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedLock, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)description
{
  v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(PRSPosterConfiguration *)self->_selectedLock _path];
  v6 = [v5 serverIdentity];
  v7 = [(PRSPosterConfiguration *)self->_selectedHome _path];
  v8 = [v7 serverIdentity];
  v9 = [(PRSPosterConfiguration *)self->_activeLock _path];
  v10 = [v9 serverIdentity];
  id v11 = [(PRSPosterConfiguration *)self->_activeHome _path];
  id v12 = [v11 serverIdentity];
  id v13 = [v15 stringWithFormat:@"<%@:%p sl=%@ sh=%@ al=%@ ah=%@>", v4, self, v6, v8, v10, v12];

  return v13;
}

- (PRSPosterConfiguration)selectedLock
{
  return self->_selectedLock;
}

- (PRSPosterConfiguration)selectedHome
{
  return self->_selectedHome;
}

- (PRSPosterConfiguration)activeLock
{
  return self->_activeLock;
}

- (PRSPosterConfiguration)activeHome
{
  return self->_activeHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHome, 0);
  objc_storeStrong((id *)&self->_activeLock, 0);
  objc_storeStrong((id *)&self->_selectedHome, 0);
  objc_storeStrong((id *)&self->_selectedLock, 0);
}

@end